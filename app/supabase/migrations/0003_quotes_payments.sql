-- 0003: quotes with lines (a superseded chain per job), payments, and the job balance.
--
-- Product definition §5e (quote and approval), §5f (balance), §6. Money is not a status: the
-- balance is computed from payments and the approved quote (view job_balances, function
-- job_balance()). Card payments arrive through Stripe webhooks (service role); members record
-- cash and check through record_offline_payment().

-- quotes --------------------------------------------------------------------------------------
create table public.quotes (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid not null references public.shops (id) on delete cascade,
  job_id uuid not null references public.jobs (id) on delete cascade,
  version integer not null check (version >= 1),
  status public.quote_status not null default 'draft',
  note_to_customer text,
  collect_on_approval boolean not null default false,
  subtotal_cents integer not null default 0 check (subtotal_cents >= 0),
  total_cents integer not null default 0 check (total_cents >= 0),
  sent_at timestamptz,
  decided_at timestamptz,
  expires_at timestamptz,
  decided_via text check (decided_via is null or decided_via in ('token_page', 'shop_on_behalf')),
  decision_note text,
  created_by uuid references auth.users (id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (job_id, version)
);
comment on table public.quotes is 'A parts/labour quote on a job. Versions supersede each other; the customer sees only the current one. Totals are recomputed from quote_lines by trigger.';
create index quotes_job_idx on public.quotes (job_id, version desc);
create index quotes_shop_status_idx on public.quotes (shop_id, status);
create trigger quotes_set_updated_at before update on public.quotes
  for each row execute function public.set_updated_at();

create table public.quote_lines (
  id uuid primary key default gen_random_uuid(),
  quote_id uuid not null references public.quotes (id) on delete cascade,
  kind public.quote_line_kind not null,
  description text not null check (length(description) between 1 and 200),
  qty numeric(8, 2) not null default 1 check (qty > 0),
  -- The one signed money column: discount lines carry a negative unit price.
  unit_cents integer not null,
  total_cents integer generated always as (round(qty * unit_cents)::integer) stored,
  sort_order integer not null default 0,
  created_at timestamptz not null default now(),
  constraint quote_lines_sign check ((kind = 'discount' and unit_cents <= 0) or (kind <> 'discount' and unit_cents >= 0))
);
comment on table public.quote_lines is 'Lines of a quote. Only discount lines may be negative.';
create index quote_lines_quote_idx on public.quote_lines (quote_id, sort_order);

create or replace function public.quotes_recompute_totals()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_quote_id uuid := coalesce(new.quote_id, old.quote_id);
  v_subtotal integer;
  v_total integer;
begin
  select coalesce(sum(case when kind <> 'discount' then total_cents else 0 end), 0),
         greatest(coalesce(sum(total_cents), 0), 0)
  into v_subtotal, v_total
  from public.quote_lines where quote_id = v_quote_id;
  update public.quotes set subtotal_cents = v_subtotal, total_cents = v_total where id = v_quote_id;
  return null;
end;
$$;
create trigger quote_lines_recompute after insert or update or delete on public.quote_lines
  for each row execute function public.quotes_recompute_totals();

-- A quote's version is assigned on insert; lines of a sent quote are frozen.
create or replace function public.quotes_before_insert()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  select shop_id into new.shop_id from public.jobs where id = new.job_id;
  if new.shop_id is null then
    raise exception 'No such job.' using errcode = 'P0002';
  end if;
  select coalesce(max(version), 0) + 1 into new.version from public.quotes where job_id = new.job_id;
  new.status := 'draft';
  return new;
end;
$$;
create trigger quotes_before_insert before insert on public.quotes
  for each row execute function public.quotes_before_insert();

create or replace function public.quote_lines_guard()
returns trigger
language plpgsql
set search_path = ''
as $$
declare
  v_status public.quote_status;
begin
  select status into v_status from public.quotes where id = coalesce(new.quote_id, old.quote_id);
  if v_status <> 'draft' then
    raise exception 'This quote was already sent. Make a new version instead.' using errcode = 'P0001';
  end if;
  return coalesce(new, old);
end;
$$;
create trigger quote_lines_guard before insert or update or delete on public.quote_lines
  for each row execute function public.quote_lines_guard();

-- payments ------------------------------------------------------------------------------------
create table public.payments (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid not null references public.shops (id) on delete cascade,
  job_id uuid not null references public.jobs (id) on delete cascade,
  purpose public.payment_purpose not null,
  method public.payment_method not null,
  status public.payment_status not null default 'pending',
  amount_cents integer not null check (amount_cents >= 0),
  fee_line_cents integer not null default 0 check (fee_line_cents >= 0),
  application_fee_cents integer not null default 0 check (application_fee_cents >= 0),
  refunded_cents integer not null default 0 check (refunded_cents >= 0 and refunded_cents <= amount_cents),
  currency char(3) not null default 'usd',
  stripe_checkout_session_id text unique,
  stripe_payment_intent_id text unique,
  stripe_charge_id text,
  stripe_application_fee_id text,
  recorded_by uuid references auth.users (id) on delete set null,
  paid_at timestamptz,
  note text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint payments_card_has_stripe check (method <> 'card' or status = 'pending' or stripe_payment_intent_id is not null or stripe_checkout_session_id is not null)
);
comment on table public.payments is 'Deposits, quote prepayments and balances. Card rows come from Stripe webhooks (service role); cash/check through record_offline_payment(). application_fee_cents is the $1 Bench Tag collected on that charge (§16 #6).';
create index payments_job_idx on public.payments (job_id);
create index payments_shop_paid_idx on public.payments (shop_id, paid_at desc);
create trigger payments_set_updated_at before update on public.payments
  for each row execute function public.set_updated_at();

-- Balance -------------------------------------------------------------------------------------
-- service price + approved quote + return shipping (if shipping) + service fee line (if charged)
-- - deposits - other payments (refunds come off what was paid).
create or replace view public.job_balances
with (security_invoker = true)
as
select
  j.id as job_id,
  j.shop_id,
  j.service_price_cents,
  coalesce(q.total_cents, 0) as quote_cents,
  case when j.delivery = 'ship' then s.return_shipping_cents else 0 end as shipping_cents,
  coalesce(p.deposits_cents, 0) as deposits_cents,
  coalesce(p.paid_cents, 0) as paid_cents,
  coalesce(p.fee_line_cents, 0) as fee_line_cents,
  j.service_price_cents + coalesce(q.total_cents, 0)
    + case when j.delivery = 'ship' then s.return_shipping_cents else 0 end
    + coalesce(p.fee_line_cents, 0)
    - coalesce(p.deposits_cents, 0) - coalesce(p.paid_cents, 0) as balance_cents
from public.jobs j
join public.shops s on s.id = j.shop_id
left join lateral (
  select total_cents from public.quotes q where q.job_id = j.id and q.status = 'approved'
  order by version desc limit 1
) q on true
left join lateral (
  select
    sum(case when purpose = 'deposit' then amount_cents - refunded_cents else 0 end)::integer as deposits_cents,
    sum(case when purpose <> 'deposit' then amount_cents - refunded_cents else 0 end)::integer as paid_cents,
    sum(fee_line_cents)::integer as fee_line_cents
  from public.payments p
  where p.job_id = j.id and p.status in ('succeeded', 'partially_refunded', 'refunded')
) p on true;
comment on view public.job_balances is 'Per-job money: what is owed = service + approved quote + shipping + fee line - deposits - payments. security_invoker: members see their shop''s jobs only.';

create or replace function public.job_balance(p_job_id uuid)
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  select jsonb_build_object(
    'service_price_cents', b.service_price_cents,
    'quote_cents', b.quote_cents,
    'shipping_cents', b.shipping_cents,
    'fee_line_cents', b.fee_line_cents,
    'deposits_cents', b.deposits_cents,
    'paid_cents', b.paid_cents,
    'balance_cents', b.balance_cents
  )
  from public.job_balances b where b.job_id = p_job_id;
$$;
comment on function public.job_balance(uuid) is 'The job_balances row as JSON. Internal: used by job_by_token().';

-- RPCs ----------------------------------------------------------------------------------------
-- send_quote(): draft -> sent; earlier sent quotes on the job are superseded; the job moves to
-- quote_sent (or logs a revision when it is already there).
create or replace function public.send_quote(p_quote_id uuid, p_expires_in_days integer default 14)
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_quote public.quotes%rowtype;
  v_job public.jobs%rowtype;
begin
  select * into v_quote from public.quotes where id = p_quote_id;
  if v_quote.id is null or not public.is_shop_member(v_quote.shop_id) then
    raise exception 'No such quote.' using errcode = 'P0002';
  end if;
  if v_quote.status <> 'draft' then
    raise exception 'This quote was already sent.' using errcode = 'P0001';
  end if;
  if not exists (select 1 from public.quote_lines where quote_id = p_quote_id) then
    raise exception 'Add at least one line before sending the quote.' using errcode = 'P0001';
  end if;
  select * into v_job from public.jobs where id = v_quote.job_id;
  if v_job.status in ('closed', 'cancelled') then
    raise exception 'This job is % and cannot be quoted.', v_job.status using errcode = 'P0001';
  end if;
  update public.quotes set status = 'superseded'
    where job_id = v_quote.job_id and id <> p_quote_id and status in ('sent', 'approved', 'declined');
  update public.quotes
    set status = 'sent', sent_at = now(),
        expires_at = now() + make_interval(days => greatest(coalesce(p_expires_in_days, 14), 1))
    where id = p_quote_id;
  if v_job.status = 'quote_sent' then
    insert into public.job_status_history (job_id, shop_id, from_status, to_status, actor, actor_user_id, note, customer_visible)
    values (v_job.id, v_job.shop_id, 'quote_sent', 'quote_sent', 'shop', auth.uid(), 'Quote revised', true);
  else
    perform public.transition_job(v_job.id, 'quote_sent', null, false);
  end if;
end;
$$;
comment on function public.send_quote(uuid, integer) is 'Sends a draft quote: supersedes earlier ones, sets expiry, moves the job to quote_sent.';

-- decide_quote(): the shop records a decision made by phone or in person ("on behalf").
create or replace function public.decide_quote(p_quote_id uuid, p_approved boolean, p_note text default null)
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_quote public.quotes%rowtype;
begin
  select * into v_quote from public.quotes where id = p_quote_id;
  if v_quote.id is null or not (public.is_shop_member(v_quote.shop_id) or public.is_service()) then
    raise exception 'No such quote.' using errcode = 'P0002';
  end if;
  if v_quote.status <> 'sent' then
    raise exception 'Only a sent quote can be approved or declined.' using errcode = 'P0001';
  end if;
  update public.quotes
    set status = case when p_approved then 'approved' else 'declined' end::public.quote_status,
        decided_at = now(), decided_via = 'shop_on_behalf', decision_note = nullif(trim(p_note), '')
    where id = p_quote_id;
  perform public.transition_job(v_quote.job_id, case when p_approved then 'approved' else 'declined' end::public.job_status,
    coalesce(nullif(trim(p_note), ''), case when p_approved then 'Approved by phone or in person' else 'Declined by phone or in person' end), true);
end;
$$;

-- record_offline_payment(): cash, check or other; never card (cards come from Stripe).
create or replace function public.record_offline_payment(
  p_job_id uuid,
  p_amount_cents integer,
  p_method public.payment_method,
  p_purpose public.payment_purpose default 'balance',
  p_note text default null
)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_shop_id uuid;
  v_id uuid;
begin
  select shop_id into v_shop_id from public.jobs where id = p_job_id and deleted_at is null;
  if v_shop_id is null or not public.is_shop_member(v_shop_id) then
    raise exception 'No such job.' using errcode = 'P0002';
  end if;
  if p_method = 'card' then
    raise exception 'Card payments are recorded by Stripe; use the payment link.' using errcode = 'P0001';
  end if;
  if p_amount_cents is null or p_amount_cents <= 0 then
    raise exception 'Enter an amount above zero.' using errcode = 'P0001';
  end if;
  insert into public.payments (shop_id, job_id, purpose, method, status, amount_cents, recorded_by, paid_at, note)
  values (v_shop_id, p_job_id, coalesce(p_purpose, 'balance'), p_method, 'succeeded', p_amount_cents, auth.uid(), now(), nullif(trim(p_note), ''))
  returning id into v_id;
  return v_id;
end;
$$;

-- Row level security ---------------------------------------------------------------------------
alter table public.quotes enable row level security;
alter table public.quote_lines enable row level security;
alter table public.payments enable row level security;

create policy quotes_select_member on public.quotes for select to authenticated using (public.is_shop_member(shop_id));
create policy quotes_insert_member on public.quotes for insert to authenticated
  with check (exists (select 1 from public.jobs j where j.id = job_id and public.is_shop_member(j.shop_id)));
create policy quotes_update_draft_member on public.quotes for update to authenticated
  using (public.is_shop_member(shop_id) and status = 'draft') with check (public.is_shop_member(shop_id) and status = 'draft');
create policy quotes_delete_draft_member on public.quotes for delete to authenticated
  using (public.is_shop_member(shop_id) and status = 'draft');

create policy quote_lines_select_member on public.quote_lines for select to authenticated
  using (exists (select 1 from public.quotes q where q.id = quote_id and public.is_shop_member(q.shop_id)));
create policy quote_lines_insert_member on public.quote_lines for insert to authenticated
  with check (exists (select 1 from public.quotes q where q.id = quote_id and public.is_shop_member(q.shop_id) and q.status = 'draft'));
create policy quote_lines_update_member on public.quote_lines for update to authenticated
  using (exists (select 1 from public.quotes q where q.id = quote_id and public.is_shop_member(q.shop_id) and q.status = 'draft'));
create policy quote_lines_delete_member on public.quote_lines for delete to authenticated
  using (exists (select 1 from public.quotes q where q.id = quote_id and public.is_shop_member(q.shop_id) and q.status = 'draft'));

create policy payments_select_member on public.payments for select to authenticated using (public.is_shop_member(shop_id));

-- Grants: revoke before you grant ------------------------------------------------------------
revoke all on table public.quotes, public.quote_lines, public.payments, public.job_balances from anon, authenticated;
grant select, insert, update, delete on table public.quotes to authenticated;
grant select, insert, update, delete on table public.quote_lines to authenticated;
grant select on table public.payments to authenticated;
grant select on table public.job_balances to authenticated;

revoke all on function public.quotes_recompute_totals() from public, anon, authenticated;
revoke all on function public.quotes_before_insert() from public, anon, authenticated;
revoke all on function public.quote_lines_guard() from public, anon, authenticated;
revoke all on function public.job_balance(uuid) from public, anon, authenticated;
revoke all on function public.send_quote(uuid, integer) from public, anon, authenticated;
revoke all on function public.decide_quote(uuid, boolean, text) from public, anon, authenticated;
revoke all on function public.record_offline_payment(uuid, integer, public.payment_method, public.payment_purpose, text) from public, anon, authenticated;
grant execute on function public.job_balance(uuid) to authenticated, service_role;
grant execute on function public.send_quote(uuid, integer) to authenticated, service_role;
grant execute on function public.decide_quote(uuid, boolean, text) to authenticated, service_role;
grant execute on function public.record_offline_payment(uuid, integer, public.payment_method, public.payment_purpose, text) to authenticated, service_role;
