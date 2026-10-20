-- Supabase stubs for the local Postgres harness (ADR 0004).
--
-- Plain PostgreSQL has none of what hosted Supabase gives a migration: the API roles, the `auth`
-- schema and its claim-reading functions, a `storage` schema, an `extensions` schema and the
-- default grants that hand every new object to anon/authenticated. This file recreates just enough
-- of that so migrations and RLS policies run unchanged and the tests are faithful.
--
-- Applied once per run, before the migrations. Idempotent so it also works against a database
-- that already has some of this (a CI service container, say).

-- Roles -------------------------------------------------------------------------------------
do $$
begin
  if not exists (select 1 from pg_roles where rolname = 'anon') then
    create role anon nologin noinherit;
  end if;
  if not exists (select 1 from pg_roles where rolname = 'authenticated') then
    create role authenticated nologin noinherit;
  end if;
  if not exists (select 1 from pg_roles where rolname = 'service_role') then
    create role service_role nologin noinherit bypassrls;
  end if;
end;
$$;

-- Schemas -----------------------------------------------------------------------------------
create schema if not exists extensions;
create schema if not exists auth;
create schema if not exists storage;

grant usage on schema public, extensions, auth, storage to anon, authenticated, service_role;

-- Supabase's roles resolve unqualified extension types (citext) through this search_path.
alter database :"DBNAME" set search_path = "$user", public, extensions;

-- Default privileges: on Supabase every new table, sequence and function in `public` is granted
-- to the API roles automatically. Mirroring that is what makes "revoke before you grant" testable.
alter default privileges in schema public grant all on tables to anon, authenticated, service_role;
alter default privileges in schema public grant all on sequences to anon, authenticated, service_role;
alter default privileges in schema public grant all on functions to anon, authenticated, service_role;

-- auth schema -------------------------------------------------------------------------------
-- PostgREST sets request.jwt.claims (JSON) on each request; older code read request.jwt.claim.sub.
-- The functions accept either so tests can use set_config() with whichever is convenient.
create table if not exists auth.users (
  id uuid primary key,
  email text,
  raw_user_meta_data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create or replace function auth.jwt()
returns jsonb
language sql
stable
as $$
  select coalesce(
    nullif(current_setting('request.jwt.claim', true), ''),
    nullif(current_setting('request.jwt.claims', true), ''),
    '{}'
  )::jsonb;
$$;

create or replace function auth.uid()
returns uuid
language sql
stable
as $$
  select nullif(
    coalesce(
      nullif(current_setting('request.jwt.claim.sub', true), ''),
      auth.jwt() ->> 'sub'
    ),
    ''
  )::uuid;
$$;

create or replace function auth.role()
returns text
language sql
stable
as $$
  select nullif(
    coalesce(
      nullif(current_setting('request.jwt.claim.role', true), ''),
      auth.jwt() ->> 'role'
    ),
    ''
  );
$$;

create or replace function auth.email()
returns text
language sql
stable
as $$
  select nullif(
    coalesce(
      nullif(current_setting('request.jwt.claim.email', true), ''),
      auth.jwt() ->> 'email'
    ),
    ''
  );
$$;

grant select on auth.users to service_role;
grant execute on function auth.uid(), auth.jwt(), auth.role(), auth.email()
  to anon, authenticated, service_role;

-- storage schema ----------------------------------------------------------------------------
create table if not exists storage.buckets (
  id text primary key,
  name text not null unique,
  public boolean not null default false,
  created_at timestamptz not null default now()
);

create table if not exists storage.objects (
  id uuid primary key default gen_random_uuid(),
  bucket_id text references storage.buckets (id),
  name text,
  owner uuid,
  metadata jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table storage.objects enable row level security;

-- storage.foldername('org/job/file.jpg') -> {org,job}; filename -> 'file.jpg'; extension -> 'jpg'
create or replace function storage.foldername(name text)
returns text[]
language sql
immutable
as $$
  select (string_to_array(name, '/'))[1 : array_length(string_to_array(name, '/'), 1) - 1];
$$;

create or replace function storage.filename(name text)
returns text
language sql
immutable
as $$
  select (string_to_array(name, '/'))[array_length(string_to_array(name, '/'), 1)];
$$;

create or replace function storage.extension(name text)
returns text
language sql
immutable
as $$
  select reverse(split_part(reverse(storage.filename(name)), '.', 1));
$$;

grant select on storage.buckets to anon, authenticated, service_role;
grant all on storage.objects to anon, authenticated, service_role;
grant execute on function storage.foldername(text), storage.filename(text), storage.extension(text)
  to anon, authenticated, service_role;
