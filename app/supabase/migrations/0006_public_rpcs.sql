-- 0006: the public surface (anon) and the member RPCs that handle tokens, PII and exports.
--
-- Product definition §7b: no anon policies on any table. Anonymous visitors may execute exactly
-- public_shop (0001), job_by_token, approve_quote_by_token, decline_quote_by_token,
-- create_public_request and find_job; each is SECURITY DEFINER, validates its input, rate-limits
-- where a human could abuse it, and returns only what a customer may see. ADR 0007.

-- rate_limits: fixed windows keyed by what is being limited ----------------------------------------
create table public.rate_limits (
  key text not null,
  window_start timestamptz not null,
  count integer not null default 0,
  primary key (key, window_start)
);
comment on table public.rate_limits is 'Fixed-window counters (intake:ip:<sha>:<shop>, intake:email:<sha>, find:ip:<sha>:<shop>). purge_rate_limits() drops rows older than 2 days. No API role may read it.';
create index rate_limits_window_idx on public.rate_limits (window_start);

-- token_access_log: every status-page lookup, hit or miss, so a scanner is visible ----------------
create table public.token_access_log (
  id bigint generated always as identity primary key,
  shop_id uuid references public.shops (id) on delete cascade,
  job_id uuid references public.jobs (id) on delete cascade,
  outcome text not null check (outcome in ('hit', 'miss', 'expired', 'find_hit', 'find_miss')),
  created_at timestamptz not null default now()
);
comment on table public.token_access_log is 'Audit of job_by_token / find_job calls. Misses carry no shop or job. Read by the ops digest only.';
create index token_access_log_created_idx on public.token_access_log (created_at);
create index token_access_log_job_idx on public.token_access_log (job_id) where job_id is not null;

-- Helpers --------------------------------------------------------------------------------------
-- The caller's IP as PostgREST forwards it (Supabase sets cf-connecting-ip and x-forwarded-for).
create or replace function public.request_ip()
returns text
language plpgsql
stable
set search_path = ''
as $$
declare
  h jsonb;
begin
  begin
    h := nullif(pg_catalog.current_setting('request.headers', true), '')::jsonb;
  exception when others then
    h := null;
  end;
  return coalesce(
    nullif(h ->> 'cf-connecting-ip', ''),
    nullif(split_part(h ->> 'x-forwarded-for', ',', 1), ''),
    'unknown');
end;
$$;

create or replace function public.rate_limit_hit(p_key text, p_window interval, p_limit integer)
returns boolean
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_secs numeric := extract(epoch from p_window);
  v_window timestamptz := to_timestamp(floor(extract(epoch from now()) / v_secs) * v_secs);
  v_count integer;
begin
  insert into public.rate_limits (key, window_start, count) values (p_key, v_window, 1)
  on conflict (key, window_start) do update set count = public.rate_limits.count + 1
  returning count into v_count;
  return v_count <= p_limit;
end;
$$;
comment on function public.rate_limit_hit(text, interval, integer) is 'Counts one hit in the current fixed window; true while under the limit.';

create or replace function public.purge_rate_limits()
returns integer
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_count integer;
begin
  delete from public.rate_limits where window_start < now() - interval '2 days';
  get diagnostics v_count = row_count;
  delete from public.token_access_log where created_at < now() - interval '90 days';
  return v_count;
end;
$$;

-- Constant-time byte comparison: the lookup uses the index, the final decision does not short-circuit.
create or replace function public.ct_equal(a bytea, b bytea)
returns boolean
language plpgsql
immutable
set search_path = ''
as $$
declare
  acc integer := 0;
  i integer;
  len integer := length(a);
begin
  if a is null or b is null then return false; end if;
  if len <> length(b) then
    -- Still walk a to keep timing even; the lengths are public (32 bytes) in practice.
    acc := 1;
    b := a;
  end if;
  for i in 0 .. len - 1 loop
    acc := acc | (get_byte(a, i) # get_byte(b, i));
  end loop;
  return acc = 0;
end;
$$;

-- The customer's view of a job: no internal notes, no other jobs, no PII beyond a first name.
create or replace function public.job_customer_view(p_job_id uuid)
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  select jsonb_build_object(
    'job', jsonb_build_object(
      'job_number', j.job_number,
      'short_code', j.short_code,
      'kind', j.kind,
      'status', j.status,
      'promised_date', j.promised_date,
      'delivery', j.delivery,
      'carrier', j.carrier,
      'tracking_number', j.tracking_number,
      'received_at', j.received_at,
      'ready_at', j.ready_at,
      'closed_at', j.closed_at,
      'closed_how', j.closed_how,
      'problem', j.problem,
      'created_at', j.created_at
    ),
    'item', jsonb_build_object('kind', i.kind, 'brand', i.brand, 'model', i.model),
    'customer', jsonb_build_object('first_name', case when c.pii_deleted_at is null then c.first_name else null end),
    'service', case when v.id is null then null else jsonb_build_object('name', v.name, 'price_cents', j.service_price_cents) end,
    'shop', jsonb_build_object(
      'name', s.name, 'slug', s.slug, 'phone', s.phone, 'public_email', s.public_email,
      'hours_text', s.hours_text, 'closed_until', s.closed_until, 'closed_message', s.closed_message,
      'deposit_policy_text', s.deposit_policy_text, 'uncollected_policy_text', s.uncollected_policy_text,
      'uncollected_days', s.uncollected_days, 'pay_enabled', s.stripe_charges_enabled
    ),
    'history', coalesce((
      select jsonb_agg(jsonb_build_object(
        'at', h.created_at, 'from_status', h.from_status, 'to_status', h.to_status,
        'note', case when h.customer_visible then h.note else null end,
        'actor', h.actor
      ) order by h.created_at, h.id)
      from public.job_status_history h
      where h.job_id = j.id and (h.from_status is distinct from h.to_status or h.customer_visible)
    ), '[]'::jsonb),
    'quote', (
      select jsonb_build_object(
        'id', q.id, 'version', q.version,
        'status', case when q.status = 'sent' and q.expires_at <= now() then 'expired' else q.status::text end,
        'note_to_customer', q.note_to_customer,
        'subtotal_cents', q.subtotal_cents, 'total_cents', q.total_cents, 'sent_at', q.sent_at,
        'expires_at', q.expires_at, 'decided_at', q.decided_at,
        'lines', coalesce((
          select jsonb_agg(jsonb_build_object('kind', l.kind, 'description', l.description, 'qty', l.qty,
            'unit_cents', l.unit_cents, 'total_cents', l.total_cents) order by l.sort_order, l.created_at)
          from public.quote_lines l where l.quote_id = q.id), '[]'::jsonb)
      )
      from public.quotes q where q.job_id = j.id and q.status in ('sent', 'approved', 'declined', 'expired')
      order by q.version desc limit 1
    ),
    'balance', public.job_balance(j.id),
    'photos', coalesce((
      select jsonb_agg(jsonb_build_object('bucket', p.bucket, 'path', p.storage_path, 'caption', p.caption, 'kind', p.kind) order by p.created_at)
      from public.job_photos p where p.job_id = j.id and p.customer_visible
    ), '[]'::jsonb)
  )
  from public.jobs j
  join public.items i on i.id = j.item_id
  join public.customers c on c.id = j.customer_id
  join public.shops s on s.id = j.shop_id
  left join public.services v on v.id = j.service_id
  where j.id = p_job_id and j.deleted_at is null;
$$;

-- Resolves a token to a job (or null) and writes the audit row. Shared by the token RPCs.
create or replace function public.job_from_token(p_token text)
returns public.jobs
language plpgsql
volatile
security definer
set search_path = ''
as $$
declare
  v_hash bytea;
  v_job public.jobs%rowtype;
  v_match boolean;
begin
  if p_token is null or length(p_token) < 16 or length(p_token) > 64 or p_token !~ '^[A-Za-z0-9_-]+$' then
    insert into public.token_access_log (outcome) values ('miss');
    return null;
  end if;
  v_hash := public.job_token_hash(p_token);
  select * into v_job from public.jobs j
    where (j.token_hash = v_hash or j.prev_token_hash = v_hash) and j.deleted_at is null;
  if v_job.id is null then
    insert into public.token_access_log (outcome) values ('miss');
    return null;
  end if;
  v_match := public.ct_equal(v_hash, v_job.token_hash) or public.ct_equal(v_hash, coalesce(v_job.prev_token_hash, '\x00'::bytea));
  if not v_match then
    insert into public.token_access_log (outcome) values ('miss');
    return null;
  end if;
  if v_job.token_expires_at is not null and v_job.token_expires_at <= now() then
    insert into public.token_access_log (shop_id, job_id, outcome) values (v_job.shop_id, v_job.id, 'expired');
    return null;
  end if;
  insert into public.token_access_log (shop_id, job_id, outcome) values (v_job.shop_id, v_job.id, 'hit');
  return v_job;
end;
$$;

-- Public RPCs ------------------------------------------------------------------------------------
create or replace function public.job_by_token(p_token text)
returns jsonb
language plpgsql
volatile
security definer
set search_path = ''
as $$
declare
  v_job public.jobs%rowtype;
begin
  v_job := public.job_from_token(p_token);
  if v_job.id is null then
    return null;
  end if;
  return public.job_customer_view(v_job.id);
end;
$$;
comment on function public.job_by_token(text) is 'The customer status page: the job''s safe projection for a valid, unexpired token; null otherwise. Callable by anon; every call is logged in token_access_log.';

create or replace function public.decide_quote_by_token(p_token text, p_approved boolean, p_note text)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_job public.jobs%rowtype;
  v_quote public.quotes%rowtype;
begin
  v_job := public.job_from_token(p_token);
  if v_job.id is null then
    raise exception 'This link is not valid. Ask the shop for a new one.' using errcode = 'P0002';
  end if;
  select * into v_quote from public.quotes q where q.job_id = v_job.id and q.status = 'sent' order by q.version desc limit 1 for update;
  if v_quote.id is null then
    raise exception 'There is no quote waiting for your decision.' using errcode = 'P0001';
  end if;
  if v_quote.expires_at is not null and v_quote.expires_at <= now() then
    raise exception 'This quote has expired. Ask the shop for a new one.' using errcode = 'P0001';
  end if;
  if v_job.status <> 'quote_sent' then
    raise exception 'This job is no longer waiting on a quote.' using errcode = 'P0001';
  end if;
  update public.quotes
    set status = case when p_approved then 'approved' else 'declined' end::public.quote_status,
        decided_at = now(), decided_via = 'token_page', decision_note = nullif(left(trim(coalesce(p_note, '')), 500), '')
    where id = v_quote.id;
  perform set_config('app.actor', 'customer', true);
  perform set_config('app.note', coalesce(nullif(left(trim(coalesce(p_note, '')), 500), ''), ''), true);
  perform set_config('app.customer_visible', 'true', true);
  update public.jobs set status = case when p_approved then 'approved' else 'declined' end::public.job_status where id = v_job.id;
  perform set_config('app.actor', '', true);
  perform set_config('app.note', '', true);
  perform set_config('app.customer_visible', '', true);
  return public.job_customer_view(v_job.id);
end;
$$;

create or replace function public.approve_quote_by_token(p_token text, p_note text default null)
returns jsonb
language sql
security definer
set search_path = ''
as $$
  select public.decide_quote_by_token(p_token, true, p_note);
$$;
comment on function public.approve_quote_by_token(text, text) is 'Customer approves the current sent quote from the status page. Anon.';

create or replace function public.decline_quote_by_token(p_token text, p_reason text default null)
returns jsonb
language sql
security definer
set search_path = ''
as $$
  select public.decide_quote_by_token(p_token, false, p_reason);
$$;
comment on function public.decline_quote_by_token(text, text) is 'Customer declines the current sent quote from the status page. Anon.';

-- create_public_request(): the request form on /s/:slug. Turnstile is verified by the Netlify
-- edge step in front of this call (README -> public intake); here: validation, rate limits,
-- customer upsert by email, item, job at `requested`.
create or replace function public.create_public_request(
  p_slug text,
  p_kind public.item_kind,
  p_service_id uuid,
  p_brand text,
  p_model text,
  p_serial text,
  p_problem text,
  p_first_name text,
  p_last_name text,
  p_email text,
  p_phone text,
  p_delivery public.delivery_method default 'pickup'
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_shop public.shops%rowtype;
  v_service public.services%rowtype;
  v_email text := lower(trim(coalesce(p_email, '')));
  v_ip_key text := 'intake:ip:' || encode(pg_catalog.sha256(convert_to(public.request_ip(), 'UTF8')), 'hex');
  v_customer_id uuid;
  v_item_id uuid;
  v_token text := public.gen_token(16);
  v_job public.jobs%rowtype;
  v_deposit integer := 0;
begin
  select * into v_shop from public.shops s where s.slug = p_slug::extensions.citext and s.published_at is not null and s.deleted_at is null;
  if v_shop.id is null then
    raise exception 'There is no shop at this address.' using errcode = 'P0002';
  end if;
  if v_shop.billing_status = 'read_only' then
    raise exception '%s is not taking new requests right now. Call the shop.', v_shop.name using errcode = 'P0001';
  end if;
  -- Input validation (the form validates too; this is the boundary that counts).
  if p_first_name is null or length(trim(p_first_name)) = 0 or length(p_first_name) > 80 then
    raise exception 'Enter your first name.' using errcode = 'P0001';
  end if;
  if p_last_name is not null and length(p_last_name) > 80 then
    raise exception 'That last name is too long.' using errcode = 'P0001';
  end if;
  if v_email !~ '^[^@[:space:]]+@[^@[:space:]]+\.[^@[:space:]]+$' or length(v_email) > 254 then
    raise exception 'Enter a valid email address so we can send your tracking link.' using errcode = 'P0001';
  end if;
  if p_phone is not null and length(p_phone) > 40 then
    raise exception 'That phone number is too long.' using errcode = 'P0001';
  end if;
  if p_brand is null or length(trim(p_brand)) = 0 or length(p_brand) > 80 then
    raise exception 'Tell us the brand.' using errcode = 'P0001';
  end if;
  if p_model is not null and length(p_model) > 120 then
    raise exception 'That model is too long.' using errcode = 'P0001';
  end if;
  if p_serial is not null and length(p_serial) > 80 then
    raise exception 'That serial number is too long.' using errcode = 'P0001';
  end if;
  if p_problem is null or length(trim(p_problem)) = 0 or length(p_problem) > 2000 then
    raise exception 'Describe the problem or the build you want (up to 2,000 characters).' using errcode = 'P0001';
  end if;
  if p_service_id is not null then
    select * into v_service from public.services v where v.id = p_service_id and v.shop_id = v_shop.id and v.active;
    if v_service.id is null or v_service.kind <> p_kind then
      raise exception 'Pick a service from the shop''s menu.' using errcode = 'P0001';
    end if;
    v_deposit := case
      when v_service.deposit_cents is not null then v_service.deposit_cents
      when v_service.deposit_pct is not null and v_service.price_cents is not null then round(v_service.price_cents * v_service.deposit_pct / 100.0)::integer
      else 0 end;
  end if;
  -- Rate limits: 5 per hour per network per shop, 3 per day per email.
  if not public.rate_limit_hit(v_ip_key || ':' || v_shop.id::text, interval '1 hour', 5) then
    raise exception 'Too many requests from this network; try again in an hour or call the shop.' using errcode = 'PT429';
  end if;
  if not public.rate_limit_hit('intake:email:' || encode(pg_catalog.sha256(convert_to(v_email, 'UTF8')), 'hex'), interval '1 day', 3) then
    raise exception 'That email address has sent several requests today; try again tomorrow or call the shop.' using errcode = 'PT429';
  end if;

  select id into v_customer_id from public.customers c
    where c.shop_id = v_shop.id and c.email = v_email::extensions.citext and c.deleted_at is null;
  if v_customer_id is null then
    insert into public.customers (shop_id, first_name, last_name, email, phone)
    values (v_shop.id, trim(p_first_name), nullif(trim(coalesce(p_last_name, '')), ''), v_email, nullif(trim(coalesce(p_phone, '')), ''))
    returning id into v_customer_id;
  else
    update public.customers set
      last_name = coalesce(last_name, nullif(trim(coalesce(p_last_name, '')), '')),
      phone = coalesce(phone, nullif(trim(coalesce(p_phone, '')), '')),
      pii_deleted_at = null
    where id = v_customer_id;
  end if;

  insert into public.items (shop_id, customer_id, kind, brand, model, serial, description)
  values (v_shop.id, v_customer_id, p_kind, trim(p_brand), nullif(trim(coalesce(p_model, '')), ''),
    nullif(trim(coalesce(p_serial, '')), ''), case when p_kind = 'rod' then trim(p_problem) else null end)
  returning id into v_item_id;

  perform set_config('app.actor', 'customer', true);
  insert into public.jobs (shop_id, customer_id, item_id, service_id, source, status, problem, delivery, deposit_due_cents, token_hash)
  values (v_shop.id, v_customer_id, v_item_id, v_service.id, 'public_page', 'requested', trim(p_problem),
    coalesce(p_delivery, 'pickup'), v_deposit, public.job_token_hash(v_token))
  returning * into v_job;
  perform set_config('app.actor', '', true);

  return jsonb_build_object(
    'job_number', v_job.job_number,
    'short_code', v_job.short_code,
    'token', v_token,
    'deposit_due_cents', v_deposit,
    'kind', v_job.kind
  );
end;
$$;
comment on function public.create_public_request(text, public.item_kind, uuid, text, text, text, text, text, text, text, text, public.delivery_method) is
  'Public request form: validates, rate-limits (5/h per network per shop, 3/day per email), upserts the customer by email, creates item + job at requested. Returns {job_number, short_code, token, deposit_due_cents, kind}. Anon.';

-- find_job(): recover a status link with the short code plus the phone or email on the job.
create or replace function public.find_job(p_slug text, p_short_code text, p_contact text)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_shop_id uuid;
  v_code text := upper(regexp_replace(coalesce(p_short_code, ''), '[^A-Za-z0-9]', '', 'g'));
  v_contact text := trim(coalesce(p_contact, ''));
  v_digits text := regexp_replace(v_contact, '\D', '', 'g');
  v_job public.jobs%rowtype;
  v_ip_key text := 'find:ip:' || encode(pg_catalog.sha256(convert_to(public.request_ip(), 'UTF8')), 'hex');
begin
  select id into v_shop_id from public.shops s where s.slug = p_slug::extensions.citext and s.deleted_at is null;
  if v_shop_id is null then
    return null;
  end if;
  if not public.rate_limit_hit(v_ip_key || ':' || v_shop_id::text, interval '1 hour', 10) then
    raise exception 'Too many attempts from this network; try again in an hour or call the shop.' using errcode = 'PT429';
  end if;
  if v_code !~ '^[ABCDEFGHJKLMNPQRSTUVWXYZ23456789]{6}$' or length(v_contact) < 5 then
    insert into public.token_access_log (shop_id, outcome) values (v_shop_id, 'find_miss');
    return null;
  end if;
  select j.* into v_job
  from public.jobs j join public.customers c on c.id = j.customer_id
  where j.shop_id = v_shop_id and j.short_code = v_code and j.deleted_at is null and c.pii_deleted_at is null
    and (
      (position('@' in v_contact) > 0 and c.email = lower(v_contact)::extensions.citext)
      or (length(v_digits) >= 7 and c.phone_digits <> '' and right(c.phone_digits, 10) = right(v_digits, 10))
    );
  if v_job.id is null then
    insert into public.token_access_log (shop_id, outcome) values (v_shop_id, 'find_miss');
    return null;
  end if;
  insert into public.token_access_log (shop_id, job_id, outcome) values (v_shop_id, v_job.id, 'find_hit');
  return jsonb_build_object('token', public.issue_job_token(v_job.id, true), 'job_number', v_job.job_number);
end;
$$;
comment on function public.find_job(text, text, text) is 'Short code + phone or email -> a fresh status-page token (the previous link keeps working). Null for any miss. Rate-limited 10/h per network per shop. Anon.';

-- expire_quotes(): hourly; marks sent quotes past their expiry (the status page already reads
-- them as expired). Returns rows changed.
create or replace function public.expire_quotes()
returns integer
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_count integer;
begin
  if not public.is_service() then
    raise exception 'Only the scheduler may expire quotes.' using errcode = '42501';
  end if;
  update public.quotes set status = 'expired' where status = 'sent' and expires_at is not null and expires_at <= now();
  get diagnostics v_count = row_count;
  return v_count;
end;
$$;

-- Member RPCs -------------------------------------------------------------------------------------
-- rotate_job_token(): "Resend link". Every older link stops working; the customer gets links_resent.
create or replace function public.rotate_job_token(p_job_id uuid)
returns text
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_job public.jobs%rowtype;
  v_token text;
  ctx jsonb;
begin
  select * into v_job from public.jobs where id = p_job_id and deleted_at is null;
  if v_job.id is null or not (public.is_shop_member(v_job.shop_id) or public.is_service()) then
    raise exception 'No such job.' using errcode = 'P0002';
  end if;
  v_token := public.issue_job_token(p_job_id, false);
  ctx := public.job_email_context(p_job_id);
  perform public.enqueue_notification(v_job.shop_id, p_job_id, 'links_resent', 'customer', ctx ->> 'customer_email',
    format('Your tracking link from %s', ctx ->> 'shop_name'), ctx, null);
  return v_token;
end;
$$;
comment on function public.rotate_job_token(uuid) is 'Members: mints a new token, invalidates every older link, emails the customer. Returns the raw token once (to show or print).';

-- delete_customer_pii(): a customer's erasure request. Contact details go; jobs, items,
-- history and payment amounts stay for the shop's books (§13 privacy, §16 #5).
create or replace function public.delete_customer_pii(p_customer_id uuid)
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_customer public.customers%rowtype;
begin
  select * into v_customer from public.customers where id = p_customer_id;
  if v_customer.id is null or not (public.is_shop_member(v_customer.shop_id) or public.is_service()) then
    raise exception 'No such customer.' using errcode = 'P0002';
  end if;
  update public.customers
    set first_name = 'Deleted', last_name = null, email = null, phone = null, notes = null,
        ship_address = null, auth_user_id = null, pii_deleted_at = now()
    where id = p_customer_id;
  update public.jobs set ship_to = null where customer_id = p_customer_id;
  update public.notifications
    set status = case when status in ('pending', 'failed', 'sending') then 'cancelled' else status end,
        to_email = 'redacted@invalid', payload = '{}'::jsonb, subject = '[redacted]'
    where audience = 'customer' and job_id in (select id from public.jobs where customer_id = p_customer_id);
end;
$$;
comment on function public.delete_customer_pii(uuid) is 'Nulls a customer''s contact fields and redacts their queued/sent emails. Jobs and history remain.';

create or replace function public.csv_cell(p_value text)
returns text
language sql
immutable
set search_path = ''
as $$
  select '"' || replace(coalesce(p_value, ''), '"', '""') || '"';
$$;

-- export_shop_csv(shop, kind): "your data is yours". kind: customers | items | jobs | quotes | payments.
create or replace function public.export_shop_csv(p_shop_id uuid, p_kind text)
returns text
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_out text;
begin
  if not public.is_shop_member(p_shop_id) then
    raise exception 'You are not a member of this shop.' using errcode = '42501';
  end if;
  case p_kind
    when 'customers' then
      select 'id,first_name,last_name,email,phone,notes,created_at' || E'\n' || coalesce(string_agg(
        concat_ws(',', public.csv_cell(c.id::text), public.csv_cell(c.first_name), public.csv_cell(c.last_name), public.csv_cell(c.email::text),
          public.csv_cell(c.phone), public.csv_cell(c.notes), public.csv_cell(c.created_at::text)), E'\n' order by c.created_at), '')
      into v_out from public.customers c where c.shop_id = p_shop_id and c.deleted_at is null;
    when 'items' then
      select 'id,customer_id,kind,brand,model,serial,description,created_at' || E'\n' || coalesce(string_agg(
        concat_ws(',', public.csv_cell(i.id::text), public.csv_cell(i.customer_id::text), public.csv_cell(i.kind::text), public.csv_cell(i.brand),
          public.csv_cell(i.model), public.csv_cell(i.serial), public.csv_cell(i.description), public.csv_cell(i.created_at::text)), E'\n' order by i.created_at), '')
      into v_out from public.items i where i.shop_id = p_shop_id and i.deleted_at is null;
    when 'jobs' then
      select 'id,job_number,short_code,customer_id,item_id,kind,status,source,problem,promised_date,delivery,received_at,ready_at,closed_at,closed_how,service_price_cents,deposit_due_cents,created_at' || E'\n' || coalesce(string_agg(
        concat_ws(',', public.csv_cell(j.id::text), j.job_number::text, public.csv_cell(j.short_code), public.csv_cell(j.customer_id::text), public.csv_cell(j.item_id::text),
          public.csv_cell(j.kind::text), public.csv_cell(j.status::text), public.csv_cell(j.source::text), public.csv_cell(j.problem), public.csv_cell(j.promised_date::text),
          public.csv_cell(j.delivery::text), public.csv_cell(j.received_at::text), public.csv_cell(j.ready_at::text), public.csv_cell(j.closed_at::text),
          public.csv_cell(j.closed_how::text), j.service_price_cents::text, j.deposit_due_cents::text, public.csv_cell(j.created_at::text)), E'\n' order by j.job_number), '')
      into v_out from public.jobs j where j.shop_id = p_shop_id and j.deleted_at is null;
    when 'quotes' then
      select 'id,job_id,version,status,subtotal_cents,total_cents,sent_at,decided_at,decided_via,note_to_customer' || E'\n' || coalesce(string_agg(
        concat_ws(',', public.csv_cell(q.id::text), public.csv_cell(q.job_id::text), q.version::text, public.csv_cell(q.status::text), q.subtotal_cents::text, q.total_cents::text,
          public.csv_cell(q.sent_at::text), public.csv_cell(q.decided_at::text), public.csv_cell(q.decided_via), public.csv_cell(q.note_to_customer)), E'\n' order by q.created_at), '')
      into v_out from public.quotes q where q.shop_id = p_shop_id;
    when 'payments' then
      select 'id,job_id,purpose,method,status,amount_cents,refunded_cents,paid_at,note' || E'\n' || coalesce(string_agg(
        concat_ws(',', public.csv_cell(p.id::text), public.csv_cell(p.job_id::text), public.csv_cell(p.purpose::text), public.csv_cell(p.method::text), public.csv_cell(p.status::text),
          p.amount_cents::text, p.refunded_cents::text, public.csv_cell(p.paid_at::text), public.csv_cell(p.note)), E'\n' order by p.created_at), '')
      into v_out from public.payments p where p.shop_id = p_shop_id;
    else
      raise exception 'Export one of: customers, items, jobs, quotes, payments.' using errcode = 'P0001';
  end case;
  return v_out;
end;
$$;
comment on function public.export_shop_csv(uuid, text) is 'CSV text of one table for a member''s shop (customers, items, jobs, quotes, payments).';

-- Row level security: these tables have no API-role access at all ------------------------------------
alter table public.rate_limits enable row level security;
alter table public.token_access_log enable row level security;

-- Grants: revoke before you grant ------------------------------------------------------------
revoke all on table public.rate_limits, public.token_access_log from anon, authenticated;

revoke all on function public.request_ip() from public, anon, authenticated;
revoke all on function public.rate_limit_hit(text, interval, integer) from public, anon, authenticated;
revoke all on function public.purge_rate_limits() from public, anon, authenticated;
revoke all on function public.ct_equal(bytea, bytea) from public, anon, authenticated;
revoke all on function public.job_customer_view(uuid) from public, anon, authenticated;
revoke all on function public.job_from_token(text) from public, anon, authenticated;
revoke all on function public.job_by_token(text) from public, anon, authenticated;
revoke all on function public.decide_quote_by_token(text, boolean, text) from public, anon, authenticated;
revoke all on function public.approve_quote_by_token(text, text) from public, anon, authenticated;
revoke all on function public.decline_quote_by_token(text, text) from public, anon, authenticated;
revoke all on function public.create_public_request(text, public.item_kind, uuid, text, text, text, text, text, text, text, text, public.delivery_method) from public, anon, authenticated;
revoke all on function public.find_job(text, text, text) from public, anon, authenticated;
revoke all on function public.expire_quotes() from public, anon, authenticated;
revoke all on function public.rotate_job_token(uuid) from public, anon, authenticated;
revoke all on function public.delete_customer_pii(uuid) from public, anon, authenticated;
revoke all on function public.csv_cell(text) from public, anon, authenticated;
revoke all on function public.export_shop_csv(uuid, text) from public, anon, authenticated;

-- anon: exactly the public surface.
grant execute on function public.job_by_token(text) to anon, authenticated, service_role;
grant execute on function public.approve_quote_by_token(text, text) to anon, authenticated, service_role;
grant execute on function public.decline_quote_by_token(text, text) to anon, authenticated, service_role;
grant execute on function public.create_public_request(text, public.item_kind, uuid, text, text, text, text, text, text, text, text, public.delivery_method) to anon, authenticated, service_role;
grant execute on function public.find_job(text, text, text) to anon, authenticated, service_role;
-- members
grant execute on function public.rotate_job_token(uuid) to authenticated, service_role;
grant execute on function public.delete_customer_pii(uuid) to authenticated, service_role;
grant execute on function public.export_shop_csv(uuid, text) to authenticated, service_role;
-- server only
grant execute on function public.purge_rate_limits() to service_role;
grant execute on function public.expire_quotes() to service_role;
grant execute on function public.job_customer_view(uuid) to service_role;
