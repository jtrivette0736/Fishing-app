-- 0000: extensions and product-independent helpers.
--
-- This migration deliberately contains no domain tables. Phase 5b adds the schema in further
-- numbered files. Everything here is safe to run on hosted Supabase and on the local harness
-- (supabase/tests/run.sh), where supabase/tests/supabase_stubs.sql provides the Supabase roles.
--
-- Rules followed by every migration in this folder:
--   * revoke before you grant: Supabase grants new objects to anon/authenticated by default, so
--     each function and table says explicitly who may use it;
--   * functions pin `search_path` and schema-qualify what they call;
--   * plain English in error messages.

-- Extensions live in the `extensions` schema on Supabase. pgcrypto gives gen_random_bytes();
-- citext gives case-insensitive text for emails and slugs.
create extension if not exists pgcrypto with schema extensions;
create extension if not exists citext with schema extensions;

-- set_updated_at(): generic trigger. Attach to any table with an `updated_at timestamptz` column:
--   create trigger <table>_set_updated_at before update on <table>
--     for each row execute function public.set_updated_at();
create or replace function public.set_updated_at()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

comment on function public.set_updated_at() is
  'Trigger: stamps updated_at on every update. Attach with a BEFORE UPDATE FOR EACH ROW trigger.';

-- gen_token(bytes): a URL-safe random token (base64url alphabet, no padding, no newlines).
-- 24 random bytes -> 32 characters, 192 bits of entropy. Used as a column default for links
-- customers open without signing in (status pages); never derived from anything guessable.
create or replace function public.gen_token(bytes int default 24)
returns text
language plpgsql
volatile
set search_path = ''
as $$
begin
  if bytes is null or bytes < 8 or bytes > 1024 then
    raise exception 'gen_token: bytes must be between 8 and 1024, got %', bytes
      using errcode = '22023'; -- invalid_parameter_value
  end if;
  return translate(encode(extensions.gen_random_bytes(bytes), 'base64'), E'+/=\n', '-_');
end;
$$;

comment on function public.gen_token(int) is
  'URL-safe random token (base64url, no padding). Default 24 bytes = 32 characters.';

-- Who may call what. Trigger functions are never called directly. gen_token() is callable by
-- signed-in users (so a column default works on their inserts) and by the service role; anonymous
-- visitors never mint tokens.
revoke all on function public.set_updated_at() from public, anon, authenticated;
revoke all on function public.gen_token(int) from public, anon, authenticated;
grant execute on function public.gen_token(int) to authenticated, service_role;
