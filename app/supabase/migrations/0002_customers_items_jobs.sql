-- 0002: customers, items, jobs, the status machine, history and photos.
--
-- Product definition §5d (one job_status enum, kind selects the allowed moves), §6, §7b
-- (tokens hashed at rest) and §16 #2 (short codes). Status changes happen only through
-- transition_job() (members) or the token/service paths: the `status` column is not updatable
-- by `authenticated`, and a trigger refuses any move that is not in job_status_transitions.

create extension if not exists pg_trgm with schema extensions;

-- Transaction-local settings used to pass context from an RPC to the triggers it fires.
create or replace function public.txn_setting(p_name text)
returns text
language sql
stable
set search_path = ''
as $$
  select nullif(pg_catalog.current_setting(p_name, true), '');
$$;
comment on function public.txn_setting(text) is 'current_setting(name, true) with empty string folded to null. Internal.';

-- True for server-side callers (edge functions, cron) that use the service role key.
create or replace function public.is_service()
returns boolean
language sql
stable
set search_path = ''
as $$
  select auth.role() = 'service_role';
$$;

-- customers -----------------------------------------------------------------------------------
create table public.customers (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid not null references public.shops (id) on delete cascade,
  first_name text not null check (length(first_name) between 1 and 80),
  last_name text check (last_name is null or length(last_name) <= 80),
  email extensions.citext check (email is null or email ~ '^[^@[:space:]]+@[^@[:space:]]+\.[^@[:space:]]+$'),
  phone text check (phone is null or length(phone) <= 40),
  phone_digits text generated always as (regexp_replace(coalesce(phone, ''), '\D', '', 'g')) stored,
  notes text,
  ship_address jsonb,
  -- Reserved: a future consumer account may link here. Nothing reads it yet.
  auth_user_id uuid references auth.users (id) on delete set null,
  pii_deleted_at timestamptz,
  deleted_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
comment on table public.customers is 'The shop''s customers (no accounts). Contact fields are nulled by delete_customer_pii(); job history stays.';
create unique index customers_shop_email_uniq on public.customers (shop_id, email)
  where email is not null and deleted_at is null;
create index customers_shop_phone_idx on public.customers (shop_id, phone_digits);
create index customers_shop_name_trgm_idx on public.customers
  using gin ((coalesce(first_name, '') || ' ' || coalesce(last_name, '')) extensions.gin_trgm_ops);
create index customers_auth_user_idx on public.customers (auth_user_id) where auth_user_id is not null;
create trigger customers_set_updated_at before update on public.customers
  for each row execute function public.set_updated_at();

-- items ---------------------------------------------------------------------------------------
create table public.items (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid not null references public.shops (id) on delete cascade,
  customer_id uuid not null references public.customers (id) on delete cascade,
  kind public.item_kind not null,
  brand text check (brand is null or length(brand) <= 80),
  model text check (model is null or length(model) <= 120),
  serial text check (serial is null or length(serial) <= 80),
  description text,
  deleted_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
comment on table public.items is 'A reel or a rod (for a build: the rod to be built; blank in brand/model, spec in description). Service history hangs off it.';
create index items_customer_idx on public.items (customer_id);
create index items_shop_serial_idx on public.items (shop_id, serial) where serial is not null;
create index items_brand_model_trgm_idx on public.items
  using gin ((coalesce(brand, '') || ' ' || coalesce(model, '')) extensions.gin_trgm_ops);
create trigger items_set_updated_at before update on public.items
  for each row execute function public.set_updated_at();

-- jobs ----------------------------------------------------------------------------------------
create table public.jobs (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid not null references public.shops (id) on delete cascade,
  customer_id uuid not null references public.customers (id) on delete cascade,
  item_id uuid not null references public.items (id) on delete cascade,
  service_id uuid references public.services (id) on delete set null,
  kind public.item_kind not null,
  job_number integer not null,
  -- §16 #2: six characters from an alphabet with no ambiguous glyphs; unique per shop.
  short_code text not null check (short_code ~ '^[ABCDEFGHJKLMNPQRSTUVWXYZ23456789]{6}$'),
  group_id uuid,
  source public.job_source not null,
  status public.job_status not null default 'requested',
  problem text,
  shop_notes text,
  promised_date date,
  delivery public.delivery_method,
  ship_to jsonb,
  carrier text,
  tracking_number text,
  received_at timestamptz,
  ready_at timestamptz,
  closed_at timestamptz,
  closed_how public.closed_how,
  closed_note text,
  cancelled_reason text,
  -- Tokens are stored hashed (sha256). prev_token_hash keeps the previous email's link alive
  -- when a new one is issued at send time; rotate_job_token() clears it (ADR 0007).
  token_hash bytea not null unique,
  prev_token_hash bytea unique,
  token_expires_at timestamptz,
  token_rotated_at timestamptz,
  uncollected_notice_at timestamptz,
  deposit_due_cents integer not null default 0 check (deposit_due_cents >= 0),
  service_price_cents integer not null default 0 check (service_price_cents >= 0),
  service_fee_charged_at timestamptz,
  created_by uuid references auth.users (id) on delete set null,
  deleted_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (shop_id, job_number),
  unique (shop_id, short_code),
  constraint jobs_closed_needs_how check (status <> 'closed' or closed_how is not null)
);
comment on table public.jobs is 'One job = one item. status moves only through transition_job() / token RPCs / service role; every move is checked against job_status_transitions and logged in job_status_history.';
comment on column public.jobs.short_code is 'Six characters, alphabet ABCDEFGHJKLMNPQRSTUVWXYZ23456789 (no 0/O/1/I). Shown on receipts; /s/:slug/find accepts it with a phone or email.';
comment on column public.jobs.token_hash is 'sha256 of the current status-page token. The raw token is returned once by create_job() / issue_job_token() and never stored.';
create index jobs_shop_status_idx on public.jobs (shop_id, status);
create index jobs_shop_promised_idx on public.jobs (shop_id, promised_date);
create index jobs_shop_created_idx on public.jobs (shop_id, created_at desc);
create index jobs_customer_idx on public.jobs (customer_id);
create index jobs_item_idx on public.jobs (item_id);
create index jobs_service_idx on public.jobs (service_id) where service_id is not null;
create index jobs_ready_at_idx on public.jobs (ready_at) where status = 'ready';
create trigger jobs_set_updated_at before update on public.jobs
  for each row execute function public.set_updated_at();

-- job_status_transitions: the §5d table, one row per (kind, from, to) -------------------------
create table public.job_status_transitions (
  kind public.item_kind not null,
  from_status public.job_status not null,
  to_status public.job_status not null,
  primary key (kind, from_status, to_status)
);
comment on table public.job_status_transitions is 'Allowed status moves per item kind (product definition §5d). Mirrored in src/features/jobs/domain/transitions.ts; a Vitest test keeps the two equal.';

insert into public.job_status_transitions (kind, from_status, to_status)
select k.kind, t.from_status::public.job_status, t.to_status::public.job_status
from (values
  ('requested', 'received'), ('requested', 'cancelled'),
  ('received', 'quote_sent'), ('received', 'in_progress'), ('received', 'waiting_parts'),
  ('received', 'ready'), ('received', 'cancelled'),
  ('quote_sent', 'approved'), ('quote_sent', 'declined'), ('quote_sent', 'quote_sent'), ('quote_sent', 'cancelled'),
  ('approved', 'in_progress'), ('approved', 'waiting_parts'),
  ('declined', 'ready'), ('declined', 'cancelled'),
  ('in_progress', 'waiting_parts'), ('in_progress', 'finishing'), ('in_progress', 'ready'), ('in_progress', 'quote_sent'),
  ('waiting_parts', 'in_progress'), ('waiting_parts', 'finishing'), ('waiting_parts', 'quote_sent'),
  ('finishing', 'ready'), ('finishing', 'in_progress'),
  ('ready', 'closed'), ('ready', 'in_progress')
) as t (from_status, to_status)
cross join (values ('reel'::public.item_kind), ('rod'::public.item_kind)) as k (kind);
-- Reel only: diagnosing.
insert into public.job_status_transitions (kind, from_status, to_status) values
  ('reel', 'received', 'diagnosing'),
  ('reel', 'diagnosing', 'quote_sent'), ('reel', 'diagnosing', 'in_progress'),
  ('reel', 'diagnosing', 'waiting_parts'), ('reel', 'diagnosing', 'ready'), ('reel', 'diagnosing', 'cancelled');

-- job_status_history: append-only -----------------------------------------------------------
create table public.job_status_history (
  id bigint generated always as identity primary key,
  job_id uuid not null references public.jobs (id) on delete cascade,
  shop_id uuid not null references public.shops (id) on delete cascade,
  from_status public.job_status,
  to_status public.job_status not null,
  actor public.actor_kind not null,
  actor_user_id uuid,
  note text,
  customer_visible boolean not null default false,
  created_at timestamptz not null default now()
);
comment on table public.job_status_history is 'Every status change and every "send an update" note. Written by triggers and RPCs only; no update or delete for anyone but the service role.';
create index job_status_history_job_idx on public.job_status_history (job_id, created_at);
create index job_status_history_shop_idx on public.job_status_history (shop_id, created_at desc);

-- job_photos ----------------------------------------------------------------------------------
create table public.job_photos (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid not null references public.shops (id) on delete cascade,
  job_id uuid not null references public.jobs (id) on delete cascade,
  kind public.photo_kind not null default 'intake',
  bucket text not null check (bucket in ('job-photos', 'job-photos-shared')),
  storage_path text not null unique,
  caption text check (caption is null or length(caption) <= 200),
  customer_visible boolean not null default false,
  width integer,
  height integer,
  bytes integer,
  uploaded_by uuid references auth.users (id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  -- A photo is customer-visible exactly when it lives in the shared bucket (0007).
  constraint job_photos_visible_bucket check (customer_visible = (bucket = 'job-photos-shared'))
);
comment on table public.job_photos is 'Photos on a job. Private ones live in bucket job-photos; customer-visible copies in job-photos-shared (read by exact path from the status page).';
create index job_photos_job_idx on public.job_photos (job_id);
create index job_photos_shop_idx on public.job_photos (shop_id);
create trigger job_photos_set_updated_at before update on public.job_photos
  for each row execute function public.set_updated_at();

-- Short codes and tokens ----------------------------------------------------------------------
create or replace function public.gen_short_code()
returns text
language sql
volatile
set search_path = ''
as $$
  select string_agg(
    substr('ABCDEFGHJKLMNPQRSTUVWXYZ23456789', 1 + (get_byte(extensions.gen_random_bytes(6), i) % 32), 1),
    '' order by i)
  from generate_series(0, 5) as i;
$$;
comment on function public.gen_short_code() is 'Six random characters from the 32-letter unambiguous alphabet (30 bits).';

create or replace function public.job_token_hash(p_token text)
returns bytea
language sql
immutable
set search_path = ''
as $$
  select pg_catalog.sha256(pg_catalog.convert_to(p_token, 'UTF8'));
$$;
comment on function public.job_token_hash(text) is 'sha256 of a status-page token; what jobs.token_hash stores.';

-- issue_job_token(job, keep_previous): mints a new token for a job and returns it (the only
-- time it exists in the clear). keep_previous=true (emails) leaves the previous link working;
-- false (explicit rotation) kills every older link. Internal: RPCs and the service role call it.
create or replace function public.issue_job_token(p_job_id uuid, p_keep_previous boolean default true)
returns text
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_token text := public.gen_token(16);
begin
  update public.jobs
  set prev_token_hash = case when p_keep_previous then token_hash else null end,
      token_hash = public.job_token_hash(v_token),
      token_rotated_at = case when p_keep_previous then token_rotated_at else now() end
  where id = p_job_id;
  if not found then
    raise exception 'No such job.' using errcode = 'P0002';
  end if;
  return v_token;
end;
$$;

-- Triggers on jobs ----------------------------------------------------------------------------
create or replace function public.jobs_before_insert()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_item public.items%rowtype;
  v_tries integer := 0;
begin
  select * into v_item from public.items where id = new.item_id;
  if v_item.id is null or v_item.shop_id <> new.shop_id then
    raise exception 'That item does not belong to this shop.' using errcode = 'P0001';
  end if;
  if v_item.customer_id <> new.customer_id then
    raise exception 'That item belongs to a different customer.' using errcode = 'P0001';
  end if;
  new.kind := v_item.kind;
  if new.status not in ('requested', 'received') then
    raise exception 'A new job starts as requested or received, not %.', new.status using errcode = 'P0001';
  end if;
  if new.service_id is not null then
    if not exists (select 1 from public.services s where s.id = new.service_id and s.shop_id = new.shop_id and s.kind = new.kind) then
      raise exception 'That service is not on this shop''s menu for a %.', new.kind using errcode = 'P0001';
    end if;
    if new.service_price_cents = 0 then
      select coalesce(price_cents, 0) into new.service_price_cents from public.services where id = new.service_id;
    end if;
  end if;
  -- Per-shop job number, under the shop row's lock so two counters never share one.
  update public.shops set next_job_number = next_job_number + 1
    where id = new.shop_id returning next_job_number - 1 into new.job_number;
  -- Short code: retry on the rare collision (30 bits per shop).
  if new.short_code is null then
    loop
      new.short_code := public.gen_short_code();
      exit when not exists (select 1 from public.jobs j where j.shop_id = new.shop_id and j.short_code = new.short_code);
      v_tries := v_tries + 1;
      if v_tries > 20 then
        raise exception 'Could not find a free short code for this shop.' using errcode = 'P0001';
      end if;
    end loop;
  end if;
  if new.token_hash is null then
    new.token_hash := public.job_token_hash(public.gen_token(16));
  end if;
  if new.status = 'received' and new.received_at is null then
    new.received_at := now();
  end if;
  return new;
end;
$$;

create or replace function public.jobs_before_update()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  if new.shop_id <> old.shop_id or new.job_number <> old.job_number or new.short_code <> old.short_code then
    raise exception 'A job''s shop, number and short code never change.' using errcode = 'P0001';
  end if;
  if new.status is distinct from old.status then
    if old.status in ('closed', 'cancelled') then
      raise exception 'This job is % and that is final. A comeback is a new job on the same item.', old.status
        using errcode = 'P0001';
    end if;
    if not exists (
      select 1 from public.job_status_transitions t
      where t.kind = new.kind and t.from_status = old.status and t.to_status = new.status
    ) then
      raise exception 'A % job can''t go from % to %.', new.kind, old.status, new.status using errcode = 'P0001';
    end if;
    if new.status = 'closed' and new.closed_how is null then
      raise exception 'Say how the job closed: picked up, shipped, returned or abandoned.' using errcode = 'P0001';
    end if;
    if new.status = 'received' and new.received_at is null then new.received_at := now(); end if;
    if new.status = 'ready' then new.ready_at := now(); end if;
    if new.status in ('closed', 'cancelled') then new.closed_at := now(); end if;
  end if;
  return new;
end;
$$;

-- Who did it: RPCs set app.actor / app.note / app.customer_visible for the statement.
create or replace function public.history_actor()
returns public.actor_kind
language sql
stable
set search_path = ''
as $$
  select case
    when public.txn_setting('app.actor') = 'customer' then 'customer'::public.actor_kind
    when public.txn_setting('app.actor') = 'system' then 'system'::public.actor_kind
    when auth.uid() is not null then 'shop'::public.actor_kind
    else 'system'::public.actor_kind
  end;
$$;

create or replace function public.jobs_log_status()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  if tg_op = 'UPDATE' and new.status is not distinct from old.status then
    return new;
  end if;
  insert into public.job_status_history (job_id, shop_id, from_status, to_status, actor, actor_user_id, note, customer_visible)
  values (
    new.id, new.shop_id,
    case when tg_op = 'INSERT' then null else old.status end,
    new.status,
    public.history_actor(),
    auth.uid(),
    public.txn_setting('app.note'),
    coalesce(public.txn_setting('app.customer_visible')::boolean, false)
  );
  return new;
end;
$$;

create trigger jobs_before_insert before insert on public.jobs
  for each row execute function public.jobs_before_insert();
create trigger jobs_before_update before update on public.jobs
  for each row execute function public.jobs_before_update();
create trigger jobs_log_insert after insert on public.jobs
  for each row execute function public.jobs_log_status();
create trigger jobs_log_update after update of status on public.jobs
  for each row execute function public.jobs_log_status();

-- RPCs ----------------------------------------------------------------------------------------
-- create_job(): counter intake. Returns the job id, number, short code and the raw token (once).
create or replace function public.create_job(
  p_shop_id uuid,
  p_customer_id uuid,
  p_item_id uuid,
  p_service_id uuid default null,
  p_problem text default null,
  p_promised_date date default null,
  p_delivery public.delivery_method default 'pickup',
  p_deposit_due_cents integer default 0,
  p_shop_notes text default null
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_token text := public.gen_token(16);
  v_job public.jobs%rowtype;
begin
  if not (public.is_shop_member(p_shop_id) or public.is_service()) then
    raise exception 'You are not a member of this shop.' using errcode = '42501';
  end if;
  if not exists (select 1 from public.customers c where c.id = p_customer_id and c.shop_id = p_shop_id and c.deleted_at is null) then
    raise exception 'Pick a customer first.' using errcode = 'P0001';
  end if;
  if p_promised_date is not null and p_promised_date < current_date - 1 then
    raise exception 'The promised date is in the past.' using errcode = 'P0001';
  end if;
  insert into public.jobs (
    shop_id, customer_id, item_id, service_id, source, status, problem, shop_notes,
    promised_date, delivery, deposit_due_cents, token_hash, created_by
  ) values (
    p_shop_id, p_customer_id, p_item_id, p_service_id, 'counter', 'received', nullif(trim(p_problem), ''),
    nullif(trim(p_shop_notes), ''), p_promised_date, coalesce(p_delivery, 'pickup'),
    coalesce(p_deposit_due_cents, 0), public.job_token_hash(v_token), auth.uid()
  ) returning * into v_job;
  return jsonb_build_object(
    'id', v_job.id,
    'job_number', v_job.job_number,
    'short_code', v_job.short_code,
    'status', v_job.status,
    'token', v_token
  );
end;
$$;
comment on function public.create_job(uuid, uuid, uuid, uuid, text, date, public.delivery_method, integer, text) is
  'Counter intake: creates a job at received for a member''s shop. Returns {id, job_number, short_code, status, token}; the token is shown once.';

-- transition_job(): the one way a member moves a job. Checks membership, passes the note and
-- visibility to the history trigger, and lets jobs_before_update() refuse illegal moves.
create or replace function public.transition_job(
  p_job_id uuid,
  p_to public.job_status,
  p_note text default null,
  p_customer_visible boolean default false,
  p_closed_how public.closed_how default null,
  p_carrier text default null,
  p_tracking_number text default null
)
returns public.job_status
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_shop_id uuid;
begin
  select shop_id into v_shop_id from public.jobs where id = p_job_id and deleted_at is null;
  if v_shop_id is null or not (public.is_shop_member(v_shop_id) or public.is_service()) then
    raise exception 'No such job.' using errcode = 'P0002';
  end if;
  perform set_config('app.actor', case when public.is_service() then 'system' else 'shop' end, true);
  perform set_config('app.note', coalesce(p_note, ''), true);
  perform set_config('app.customer_visible', coalesce(p_customer_visible, false)::text, true);
  update public.jobs
  set status = p_to,
      closed_how = coalesce(p_closed_how, closed_how),
      closed_note = case when p_to = 'closed' then coalesce(p_note, closed_note) else closed_note end,
      cancelled_reason = case when p_to = 'cancelled' then coalesce(p_note, cancelled_reason) else cancelled_reason end,
      carrier = coalesce(p_carrier, carrier),
      tracking_number = coalesce(p_tracking_number, tracking_number)
  where id = p_job_id;
  perform set_config('app.actor', '', true);
  perform set_config('app.note', '', true);
  perform set_config('app.customer_visible', '', true);
  return p_to;
end;
$$;
comment on function public.transition_job(uuid, public.job_status, text, boolean, public.closed_how, text, text) is
  'Moves a job to a new status (members). Illegal moves raise a plain-English error; every move is logged.';

-- add_job_update(): "Send an update" without changing status; a history row at the same status.
create or replace function public.add_job_update(p_job_id uuid, p_note text, p_customer_visible boolean default true)
returns bigint
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_job public.jobs%rowtype;
  v_id bigint;
begin
  select * into v_job from public.jobs where id = p_job_id and deleted_at is null;
  if v_job.id is null or not public.is_shop_member(v_job.shop_id) then
    raise exception 'No such job.' using errcode = 'P0002';
  end if;
  if p_note is null or length(trim(p_note)) = 0 then
    raise exception 'Write a note to send.' using errcode = 'P0001';
  end if;
  insert into public.job_status_history (job_id, shop_id, from_status, to_status, actor, actor_user_id, note, customer_visible)
  values (v_job.id, v_job.shop_id, v_job.status, v_job.status, 'shop', auth.uid(), trim(p_note), coalesce(p_customer_visible, true))
  returning id into v_id;
  return v_id;
end;
$$;

-- Row level security ---------------------------------------------------------------------------
alter table public.customers enable row level security;
alter table public.items enable row level security;
alter table public.jobs enable row level security;
alter table public.job_status_transitions enable row level security;
alter table public.job_status_history enable row level security;
alter table public.job_photos enable row level security;

create policy customers_select_member on public.customers for select to authenticated using (public.is_shop_member(shop_id));
create policy customers_insert_member on public.customers for insert to authenticated with check (public.is_shop_member(shop_id));
create policy customers_update_member on public.customers for update to authenticated using (public.is_shop_member(shop_id)) with check (public.is_shop_member(shop_id));

create policy items_select_member on public.items for select to authenticated using (public.is_shop_member(shop_id));
create policy items_insert_member on public.items for insert to authenticated
  with check (public.is_shop_member(shop_id) and exists (select 1 from public.customers c where c.id = customer_id and c.shop_id = items.shop_id));
create policy items_update_member on public.items for update to authenticated using (public.is_shop_member(shop_id)) with check (public.is_shop_member(shop_id));

create policy jobs_select_member on public.jobs for select to authenticated using (public.is_shop_member(shop_id));
create policy jobs_update_member on public.jobs for update to authenticated using (public.is_shop_member(shop_id)) with check (public.is_shop_member(shop_id));

create policy transitions_select_authenticated on public.job_status_transitions for select to authenticated using (true);

create policy history_select_member on public.job_status_history for select to authenticated using (public.is_shop_member(shop_id));

create policy job_photos_select_member on public.job_photos for select to authenticated using (public.is_shop_member(shop_id));
create policy job_photos_insert_member on public.job_photos for insert to authenticated
  with check (public.is_shop_member(shop_id) and exists (select 1 from public.jobs j where j.id = job_id and j.shop_id = job_photos.shop_id));
create policy job_photos_update_member on public.job_photos for update to authenticated using (public.is_shop_member(shop_id)) with check (public.is_shop_member(shop_id));
create policy job_photos_delete_member on public.job_photos for delete to authenticated using (public.is_shop_member(shop_id));

-- A service that jobs reference cannot be deleted (set active=false instead).
drop policy services_delete_member on public.services;
create policy services_delete_member on public.services
  for delete to authenticated
  using (public.is_shop_member(shop_id) and not exists (select 1 from public.jobs j where j.service_id = services.id));

-- Grants: revoke before you grant ------------------------------------------------------------
revoke all on table public.customers, public.items, public.jobs, public.job_status_transitions,
  public.job_status_history, public.job_photos from anon, authenticated;
grant select, insert, update on table public.customers to authenticated;
grant select, insert, update on table public.items to authenticated;
grant select on table public.jobs to authenticated;
-- Members edit the job's facts; status, numbers, tokens and money stamps move only through RPCs.
grant update (
  service_id, problem, shop_notes, promised_date, delivery, ship_to, carrier, tracking_number,
  closed_note, deposit_due_cents, service_price_cents, group_id
) on table public.jobs to authenticated;
grant select on table public.job_status_transitions to authenticated;
grant select on table public.job_status_history to authenticated;
grant select, insert, update, delete on table public.job_photos to authenticated;

revoke all on function public.txn_setting(text) from public, anon, authenticated;
revoke all on function public.is_service() from public, anon, authenticated;
revoke all on function public.gen_short_code() from public, anon, authenticated;
revoke all on function public.job_token_hash(text) from public, anon, authenticated;
revoke all on function public.issue_job_token(uuid, boolean) from public, anon, authenticated;
revoke all on function public.jobs_before_insert() from public, anon, authenticated;
revoke all on function public.jobs_before_update() from public, anon, authenticated;
revoke all on function public.history_actor() from public, anon, authenticated;
revoke all on function public.jobs_log_status() from public, anon, authenticated;
revoke all on function public.create_job(uuid, uuid, uuid, uuid, text, date, public.delivery_method, integer, text) from public, anon, authenticated;
revoke all on function public.transition_job(uuid, public.job_status, text, boolean, public.closed_how, text, text) from public, anon, authenticated;
revoke all on function public.add_job_update(uuid, text, boolean) from public, anon, authenticated;

grant execute on function public.txn_setting(text) to authenticated, service_role;
grant execute on function public.is_service() to authenticated, service_role;
grant execute on function public.history_actor() to authenticated, service_role;
grant execute on function public.issue_job_token(uuid, boolean) to service_role;
grant execute on function public.create_job(uuid, uuid, uuid, uuid, text, date, public.delivery_method, integer, text) to authenticated, service_role;
grant execute on function public.transition_job(uuid, public.job_status, text, boolean, public.closed_how, text, text) to authenticated, service_role;
grant execute on function public.add_job_update(uuid, text, boolean) to authenticated, service_role;
