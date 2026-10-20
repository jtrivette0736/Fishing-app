# Database as code

Everything the database is, in files. Nothing is changed through the Supabase dashboard.

```
supabase/
  config.toml                Supabase CLI project config (local stack, auth settings)
  migrations/                numbered SQL, applied in order; the only way the schema changes
    0000_extensions_and_helpers.sql   pgcrypto, citext, set_updated_at(), gen_token()
  seed.sql                   local/preview data (empty until 5b)
  tests/
    run.sh                   the harness: fresh Postgres -> stubs -> migrations -> helpers -> tests
    supabase_stubs.sql       roles, auth.uid()/jwt()/role(), storage schema, default grants
    lib/test_helpers.sql     test.eq / test.raises / test.count, test.as_user / as_anon / as_service
    000_harness.sql          proves the harness: tokens, updated_at, grants, RLS enforcement
```

## Running the tests

```
npm run test:sql                      # local: PostgreSQL 16 binaries + a `postgres` OS user
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/postgres npm run test:sql   # CI
```

Each `tests/*.sql` file runs inside one transaction that is rolled back, so create whatever rows
you need; nothing leaks between files and files must not `commit`. Output lines starting with
`ok:` are passing assertions; the first failure stops the file with `FAIL: <message>`.

## Writing a migration

1. Add `supabase/migrations/NNNN_short_name.sql` (next number, four digits).
2. Every table: `enable row level security`, policies for select/insert/update/delete as needed,
   indexes on foreign keys and filter columns, an `updated_at` trigger using
   `public.set_updated_at()`.
3. Revoke before you grant: the harness mirrors Supabase's default grant of every new object to
   `anon`/`authenticated`, so a forgotten revoke shows up as a failing test, not a surprise in
   production. Prefer `revoke all ... from anon, authenticated` then grant the minimum.
4. Functions: `set search_path = ''` and schema-qualify calls; SECURITY DEFINER only with a
   written reason and an explicit grant list.
5. Add `tests/NNNN_<topic>.sql` covering what each role can and cannot do (see below).
6. `npm run test:sql`, then `npm run db:types` and commit the regenerated
   `src/lib/supabase/types.ts`.

## Writing an RLS test

```sql
-- tests/0010_shops.sql
select test.as_admin();
insert into auth.users (id, email) values ('1111...', 'owner@example.com');
insert into public.shops (id, slug, owner_id) values (...);

select test.as_user('1111...', 'owner@example.com');
select test.count('select * from public.shops', 1, 'an owner sees their shop');
select test.raises('delete from public.shops', 'members cannot delete a shop', '%row-level security%');

select test.as_anon();
select test.count('select * from public.shops where slug = ''demo''', 1, 'public pages read by slug');
```

Remember: an UPDATE or DELETE that RLS blocks matches zero rows and does not raise. Assert the
row is unchanged (`test.eq`) rather than expecting an error. INSERTs that fail the policy do raise.

## Deploying migrations

`npx supabase@2 link --project-ref <ref>` once, then `npx supabase@2 db push` (CI runs it on
`main` once a project exists; see `.github/workflows/ci.yml`). Migrations only move forward and
must keep the previous release working (expand, then contract in a later release).
