-- Assertion and identity helpers for SQL tests. Applied after the migrations, never in production.
--
-- Assertions
--   test.eq(actual, expected, msg)          fail unless actual IS NOT DISTINCT FROM expected
--   test.raises(sql, msg [, like_pattern])  fail unless executing sql raises (optionally matching)
--   test.count(sql, expected, msg)          fail unless sql returns exactly `expected` rows
--
-- Identity (all transaction-local, so a ROLLBACK at the end of the file resets everything)
--   test.as_user(uid [, email])             run as `authenticated` with that auth.uid()
--   test.as_anon()                          run as the anonymous API role
--   test.as_service()                       run as service_role (bypasses RLS, like a server)
--   test.as_admin()                         back to the superuser (migrations, fixtures)
--
-- Every test file runs inside one transaction (see run.sh), so create fixtures freely: nothing
-- persists. Files must not COMMIT.

create schema if not exists test;

create or replace function test.eq(actual anyelement, expected anyelement, msg text)
returns void
language plpgsql
as $$
begin
  if actual is distinct from expected then
    raise exception 'FAIL: % -- expected %, got %', msg, expected, actual;
  end if;
  raise notice 'ok: %', msg;
end;
$$;

create or replace function test.raises(sql text, msg text, like_pattern text default null)
returns void
language plpgsql
as $$
begin
  begin
    execute sql;
  exception
    when others then
      if like_pattern is not null and sqlerrm not like like_pattern then
        raise exception 'FAIL: % -- raised "%" which does not match "%"', msg, sqlerrm, like_pattern;
      end if;
      raise notice 'ok: % (%)', msg, sqlerrm;
      return;
  end;
  raise exception 'FAIL: % -- expected an error, got none', msg;
end;
$$;

create or replace function test.count(sql text, expected bigint, msg text)
returns void
language plpgsql
as $$
declare
  actual bigint;
begin
  execute format('select count(*) from (%s) as t', sql) into actual;
  perform test.eq(actual, expected, msg);
end;
$$;

create or replace function test.as_user(uid uuid, email text default null)
returns void
language plpgsql
as $$
begin
  perform set_config('request.jwt.claim.sub', uid::text, true);
  perform set_config('request.jwt.claim.role', 'authenticated', true);
  perform set_config('request.jwt.claim.email', coalesce(email, ''), true);
  perform set_config(
    'request.jwt.claims',
    jsonb_build_object('sub', uid, 'role', 'authenticated', 'email', email)::text,
    true
  );
  perform set_config('role', 'authenticated', true);
end;
$$;

create or replace function test.as_anon()
returns void
language plpgsql
as $$
begin
  perform set_config('request.jwt.claim.sub', '', true);
  perform set_config('request.jwt.claim.role', 'anon', true);
  perform set_config('request.jwt.claim.email', '', true);
  perform set_config('request.jwt.claims', '{"role":"anon"}', true);
  perform set_config('role', 'anon', true);
end;
$$;

create or replace function test.as_service()
returns void
language plpgsql
as $$
begin
  perform set_config('request.jwt.claim.sub', '', true);
  perform set_config('request.jwt.claim.role', 'service_role', true);
  perform set_config('request.jwt.claims', '{"role":"service_role"}', true);
  perform set_config('role', 'service_role', true);
end;
$$;

create or replace function test.as_admin()
returns void
language plpgsql
as $$
begin
  perform set_config('role', 'none', true);
  perform set_config('request.jwt.claim.sub', '', true);
  perform set_config('request.jwt.claim.role', '', true);
  perform set_config('request.jwt.claim.email', '', true);
  perform set_config('request.jwt.claims', '', true);
end;
$$;

-- The API roles must be able to call the helpers while a test runs as them.
grant usage on schema test to anon, authenticated, service_role;
grant execute on all functions in schema test to anon, authenticated, service_role;
