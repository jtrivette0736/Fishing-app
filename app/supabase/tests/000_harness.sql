-- 000: the harness itself. Proves the stubs, the helpers and migration 0000 behave, and that
-- row level security is enforced the way the real tests in 5b will rely on.
-- Runs inside one transaction (run.sh wraps every file in BEGIN ... ROLLBACK).

\echo '--- extensions and helpers'
select test.eq((select count(*) from pg_extension where extname in ('pgcrypto', 'citext')), 2::bigint,
  'pgcrypto and citext are installed');

-- gen_token()
select test.eq(length(public.gen_token()), 32, 'gen_token() default is 32 characters (24 bytes)');
select test.eq(length(public.gen_token(16)), 22, 'gen_token(16) is 22 characters');
select test.eq(length(public.gen_token(96)), 128, 'gen_token(96) has no newline from base64 wrapping');
select test.eq(public.gen_token() ~ '^[A-Za-z0-9_-]+$', true, 'gen_token() uses only URL-safe characters');
select test.eq(public.gen_token() = public.gen_token(), false, 'two tokens differ');
select test.raises('select public.gen_token(0)', 'gen_token(0) is refused', '%between 8 and 1024%');
select test.raises('select public.gen_token(4096)', 'gen_token(4096) is refused', '%between 8 and 1024%');

-- set_updated_at()
create table public.harness_rows (
  id serial primary key,
  note text not null,
  updated_at timestamptz not null default '2000-01-01 00:00:00+00'
);
create trigger harness_rows_set_updated_at
  before update on public.harness_rows
  for each row execute function public.set_updated_at();
insert into public.harness_rows (note) values ('first');
select test.eq((select updated_at from public.harness_rows where id = 1), '2000-01-01 00:00:00+00'::timestamptz,
  'insert leaves the default updated_at alone');
update public.harness_rows set note = 'second' where id = 1;
select test.eq((select updated_at from public.harness_rows where id = 1), now(),
  'update stamps updated_at with now()');

\echo '--- grants: revoke before you grant'
select test.eq(has_function_privilege('anon', 'public.gen_token(int)', 'execute'), false,
  'anon cannot call gen_token()');
select test.eq(has_function_privilege('authenticated', 'public.gen_token(int)', 'execute'), true,
  'authenticated can call gen_token() (column defaults on their inserts)');
select test.eq(has_function_privilege('service_role', 'public.gen_token(int)', 'execute'), true,
  'service_role can call gen_token()');
select test.eq(has_function_privilege('authenticated', 'public.set_updated_at()', 'execute'), false,
  'nobody calls the trigger function directly');

-- The stubs mirror Supabase's default grant: a new table is readable by the API roles until a
-- migration says otherwise. This is exactly why every table must enable RLS.
select test.eq(has_table_privilege('authenticated', 'public.harness_rows', 'select'), true,
  'stubs grant new tables to authenticated by default, like Supabase');

\echo '--- auth claims'
select test.eq(auth.uid(), null::uuid, 'auth.uid() is null with no claims');
select test.as_user('11111111-1111-1111-1111-111111111111', 'alice@example.com');
select test.eq(auth.uid(), '11111111-1111-1111-1111-111111111111'::uuid, 'as_user sets auth.uid()');
select test.eq(auth.role(), 'authenticated', 'as_user sets auth.role()');
select test.eq(auth.email(), 'alice@example.com', 'as_user sets auth.email()');
select test.eq(auth.jwt() ->> 'sub', '11111111-1111-1111-1111-111111111111', 'auth.jwt() carries sub');
select test.eq(current_user::text, 'authenticated', 'as_user switches to the authenticated role');
select test.as_admin();
select test.eq(current_user::text, current_setting('session_authorization'), 'as_admin restores the superuser');
select test.eq(auth.uid(), null::uuid, 'as_admin clears the claims');

\echo '--- row level security is enforced'
create table public.rls_probe (
  id serial primary key,
  owner_id uuid not null,
  note text not null
);
insert into public.rls_probe (owner_id, note) values
  ('11111111-1111-1111-1111-111111111111', 'alice'),
  ('22222222-2222-2222-2222-222222222222', 'bob');

alter table public.rls_probe enable row level security;

-- Default grant + RLS with no policy = nobody sees anything.
select test.as_user('11111111-1111-1111-1111-111111111111');
select test.count('select * from public.rls_probe', 0, 'RLS on, no policy: authenticated sees no rows');
select test.as_admin();

create policy rls_probe_select_own on public.rls_probe
  for select to authenticated
  using (owner_id = auth.uid());

select test.as_user('11111111-1111-1111-1111-111111111111');
select test.count('select * from public.rls_probe', 1, 'alice sees only her row');
select test.eq((select note from public.rls_probe), 'alice', 'and it is the right row');
select test.raises(
  'insert into public.rls_probe (owner_id, note) values (''11111111-1111-1111-1111-111111111111'', ''x'')',
  'no insert policy: insert is refused', '%row-level security%');

select test.as_user('22222222-2222-2222-2222-222222222222');
select test.count('select * from public.rls_probe', 1, 'bob sees only his row');

select test.as_anon();
select test.count('select * from public.rls_probe', 0, 'anon sees nothing');

select test.as_service();
select test.count('select * from public.rls_probe', 2, 'service_role bypasses RLS');

select test.as_admin();

-- A claim set with set_config() directly (without the helper) works the same way.
select set_config('request.jwt.claims', '{"sub":"22222222-2222-2222-2222-222222222222","role":"authenticated"}', true);
set local role authenticated;
select test.count('select * from public.rls_probe', 1, 'set_config + set role: bob sees one row');
reset role;

\echo '--- harness ok'
