# ADR 0004: Local Postgres harness for migrations and RLS

Date: 2026-10-21. Status: accepted (phase 5a). See decision log D3, D7.

## Context

The schema, policies and SQL functions are the security boundary, so they need tests that run on
every change. The Supabase CLI's local stack needs Docker, which this environment does not have,
and running tests against a hosted project is slow, shared and destructive. Migrations and
policies are plain SQL; what they need from Supabase is small: the API roles, `auth.uid()` and
friends, a `storage` schema and the default grants that hand new objects to `anon`/`authenticated`.

## Decision

- `app/supabase/tests/run.sh` recreates a throwaway cluster from PostgreSQL 16 binaries under
  `/tmp/fishing-pg` (as the `postgres` OS user, port 54329, Unix socket in the same directory,
  trust auth, `fsync=off`), applies `supabase_stubs.sql`, then every migration in order, then
  `lib/test_helpers.sql`, then runs each `tests/*.sql` in a transaction that is always rolled back.
  A trap stops the cluster on any exit. `--keep` leaves it running for type generation; with
  `DATABASE_URL` set it skips cluster management and uses that server (CI: `postgres:16` service).
- **Stubs mirror Supabase**: roles `anon`, `authenticated`, `service_role` (bypassrls);
  `auth.users`, `auth.uid()/jwt()/role()/email()` reading `request.jwt.claim.*` or
  `request.jwt.claims`; `storage.buckets/objects` and `storage.foldername()`; schema
  `extensions`; `alter default privileges ... grant all ... to anon, authenticated, service_role`.
- **Helpers**: `test.eq`, `test.raises`, `test.count`; `test.as_user(uid)`, `as_anon`,
  `as_service`, `as_admin` (transaction-local `set_config`), so a test reads as a story.
- **Type generation** runs `supabase gen types typescript --db-url ...?sslmode=disable` against
  the same database (`npm run db:types`); CI fails if the committed file is stale.

## Consequences

- Full run is seconds; it needs only `postgresql-16` and a `postgres` user, which Debian/Ubuntu
  and GitHub runners have. No network, no shared state.
- Faithful for RLS, grants, triggers and functions. Not covered: GoTrue behaviour, Storage API
  policies' HTTP layer, Realtime, pg_cron, Vault. Those are tested against a real project before
  go-live (checklist in `docs/`).
- Because the stubs grant by default like Supabase does, a forgotten `revoke` shows up in a test.
- The Supabase CLI's default pooler port (54329) collides with the harness; `config.toml` moves the
  pooler to 54339.
