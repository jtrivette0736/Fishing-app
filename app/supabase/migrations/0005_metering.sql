-- 0005: metering and the billing ledger.
--
-- Product definition §11 and §16 #6-#7: $1 per job counted the first time it reaches `received`,
-- capped at $29 per shop per calendar month (shop's time zone), nothing in an idle month. The $1
-- is collected as a Stripe application fee when a customer pays through the shop's connected
-- account; the rest accrues on the shop's ledger and the card on file is charged only when the
-- accrued balance is >= $5 or the month hit the cap; smaller balances roll forward. Numbers are
-- mirrored in src/features/billing/domain/metering.ts; the Vitest cases copy the SQL tests.

-- usage_events: one row per job, for life --------------------------------------------------------
create table public.usage_events (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid not null references public.shops (id) on delete cascade,
  job_id uuid not null unique references public.jobs (id) on delete cascade,
  occurred_at timestamptz not null default now(),
  period_month date not null check (period_month = date_trunc('month', period_month)::date),
  billable boolean not null default true,
  void_reason text,
  voided_at timestamptz,
  collection public.usage_collection not null default 'ledger',
  payment_id uuid references public.payments (id) on delete set null,
  application_fee_id text,
  created_at timestamptz not null default now()
);
comment on table public.usage_events is 'The meter: one row per job, inserted the first time the job is received. Unique on job_id so counting twice is impossible. collection says whether the $1 was taken as an application fee on a payment or sits on the ledger.';
create index usage_events_shop_month_idx on public.usage_events (shop_id, period_month);
create index usage_events_payment_idx on public.usage_events (payment_id) where payment_id is not null;

-- billing_periods: one per shop per month with usage ---------------------------------------------
create table public.billing_periods (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid not null references public.shops (id) on delete cascade,
  period_month date not null check (period_month = date_trunc('month', period_month)::date),
  status public.billing_period_status not null default 'open',
  jobs_counted integer not null default 0 check (jobs_counted >= 0),
  gross_cents integer not null default 0 check (gross_cents >= 0),
  capped_cents integer not null default 0 check (capped_cents between 0 and 2900),
  fee_collected_cents integer not null default 0 check (fee_collected_cents >= 0),
  carried_in_cents integer not null default 0 check (carried_in_cents >= 0),
  credit_applied_cents integer not null default 0 check (credit_applied_cents >= 0),
  due_cents integer not null default 0 check (due_cents >= 0),
  carried_forward_cents integer not null default 0 check (carried_forward_cents >= 0),
  stripe_invoice_id text unique,
  hosted_invoice_url text,
  closed_at timestamptz,
  invoiced_at timestamptz,
  paid_at timestamptz,
  failed_attempts integer not null default 0,
  last_failure_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (shop_id, period_month)
);
comment on table public.billing_periods is 'A shop''s month, created lazily by the first usage event (an idle month has no row). close_billing_period() fills the money columns: due_cents is charged, carried_forward_cents rolls to the next period with usage.';
create index billing_periods_shop_idx on public.billing_periods (shop_id, period_month desc);
create index billing_periods_status_idx on public.billing_periods (status) where status in ('open', 'closed');
create trigger billing_periods_set_updated_at before update on public.billing_periods
  for each row execute function public.set_updated_at();

-- billing_credits: prepay ($290 = 29,000¢ for 12 months), promos, adjustments ----------------------
create table public.billing_credits (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid not null references public.shops (id) on delete cascade,
  source public.credit_source not null,
  amount_cents integer not null check (amount_cents >= 0),
  remaining_cents integer not null check (remaining_cents >= 0 and remaining_cents <= amount_cents),
  stripe_payment_intent_id text unique,
  starts_at timestamptz not null default now(),
  expires_at timestamptz not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
comment on table public.billing_credits is 'Credit applied oldest-expiry first when a period closes. Prepay: 29,000 cents expiring 365 days after purchase.';
create index billing_credits_shop_expiry_idx on public.billing_credits (shop_id, expires_at);
create trigger billing_credits_set_updated_at before update on public.billing_credits
  for each row execute function public.set_updated_at();

-- Helpers --------------------------------------------------------------------------------------
create or replace function public.shop_period_month(p_shop_id uuid, p_at timestamptz default now())
returns date
language sql
stable
set search_path = ''
as $$
  select date_trunc('month', (p_at at time zone s.timezone))::date
  from public.shops s where s.id = p_shop_id;
$$;
comment on function public.shop_period_month(uuid, timestamptz) is 'First day of the calendar month containing p_at in the shop''s time zone.';

-- record_usage(job): the meter tick. True when a new event was recorded, false when the job
-- was already counted. Keeps the open period's running count current for /app/billing.
create or replace function public.record_usage(p_job_id uuid)
returns boolean
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_job public.jobs%rowtype;
  v_exempt boolean;
  v_month date;
  v_inserted boolean := false;
begin
  select * into v_job from public.jobs where id = p_job_id;
  if v_job.id is null then
    raise exception 'No such job.' using errcode = 'P0002';
  end if;
  select billing_exempt into v_exempt from public.shops where id = v_job.shop_id;
  v_month := public.shop_period_month(v_job.shop_id, now());
  insert into public.usage_events (shop_id, job_id, occurred_at, period_month, billable)
  values (v_job.shop_id, v_job.id, now(), v_month, not coalesce(v_exempt, false))
  on conflict (job_id) do nothing;
  v_inserted := found;
  if v_inserted then
    insert into public.billing_periods as bp (shop_id, period_month, jobs_counted, gross_cents, capped_cents)
    values (v_job.shop_id, v_month, 1, 100, 100)
    on conflict (shop_id, period_month) do update
      set jobs_counted = bp.jobs_counted + 1,
          gross_cents = (bp.jobs_counted + 1) * 100,
          capped_cents = least((bp.jobs_counted + 1) * 100, 2900)
      where bp.status = 'open';
  end if;
  return v_inserted;
end;
$$;
comment on function public.record_usage(uuid) is 'Counts a job once (first time it is received). Called by the history trigger; callable by the service role.';

create or replace function public.usage_on_history()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  if new.to_status = 'received' and new.from_status is distinct from 'received' then
    perform public.record_usage(new.job_id);
  end if;
  return null;
end;
$$;
create trigger history_record_usage after insert on public.job_status_history
  for each row execute function public.usage_on_history();

-- void_job_usage(job, reason): fat fingers at the bench. Within 7 days, no successful payments;
-- the event stays (billable = false) and the job is cancelled.
create or replace function public.void_job_usage(p_job_id uuid, p_reason text)
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_job public.jobs%rowtype;
  v_event public.usage_events%rowtype;
begin
  select * into v_job from public.jobs where id = p_job_id and deleted_at is null;
  if v_job.id is null or not (public.is_shop_member(v_job.shop_id) or public.is_service()) then
    raise exception 'No such job.' using errcode = 'P0002';
  end if;
  if p_reason is null or length(trim(p_reason)) = 0 then
    raise exception 'Give a reason for voiding this job.' using errcode = 'P0001';
  end if;
  if v_job.created_at < now() - interval '7 days' then
    raise exception 'A job can only be voided within 7 days of being created.' using errcode = 'P0001';
  end if;
  if exists (select 1 from public.payments p where p.job_id = p_job_id and p.status in ('succeeded', 'partially_refunded')) then
    raise exception 'This job has a payment on it, so it cannot be voided.' using errcode = 'P0001';
  end if;
  select * into v_event from public.usage_events where job_id = p_job_id for update;
  if v_event.id is not null and v_event.billable then
    update public.usage_events set billable = false, void_reason = trim(p_reason), voided_at = now() where id = v_event.id;
    update public.billing_periods bp
      set jobs_counted = greatest(bp.jobs_counted - 1, 0),
          gross_cents = greatest(bp.jobs_counted - 1, 0) * 100,
          capped_cents = least(greatest(bp.jobs_counted - 1, 0) * 100, 2900)
      where bp.shop_id = v_event.shop_id and bp.period_month = v_event.period_month and bp.status = 'open';
  end if;
  if v_job.status not in ('closed', 'cancelled') then
    perform public.transition_job(p_job_id, 'cancelled', 'Voided: ' || trim(p_reason), false);
  end if;
end;
$$;

-- close_billing_period(shop, month): the month-end arithmetic. Idempotent: a period that is not
-- open is returned unchanged; a month with no usage returns null (nothing to bill, no row).
create or replace function public.close_billing_period(p_shop_id uuid, p_month date)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_period public.billing_periods%rowtype;
  v_month date := date_trunc('month', p_month)::date;
  v_jobs integer;
  v_fee_jobs integer;
  v_gross integer;
  v_capped integer;
  v_fee_collected integer;
  v_ledger integer;
  v_carried_in integer;
  v_accrued integer;
  v_credit integer := 0;
  v_net integer;
  v_charge boolean;
  v_exempt boolean;
  c record;
  v_take integer;
begin
  if not public.is_service() then
    raise exception 'Only the billing job may close periods.' using errcode = '42501';
  end if;
  select * into v_period from public.billing_periods where shop_id = p_shop_id and period_month = v_month for update;
  if v_period.id is null then
    return null;
  end if;
  if v_period.status <> 'open' then
    return to_jsonb(v_period);
  end if;

  select count(*) filter (where billable),
         count(*) filter (where billable and collection = 'application_fee')
  into v_jobs, v_fee_jobs
  from public.usage_events where shop_id = p_shop_id and period_month = v_month;
  select billing_exempt into v_exempt from public.shops where id = p_shop_id;

  v_gross := v_jobs * 100;
  v_capped := least(v_gross, 2900);
  v_fee_collected := least(v_fee_jobs * 100, v_capped);
  v_ledger := v_capped - v_fee_collected;
  -- Carry-in: whatever the most recent earlier period left on the ledger.
  select coalesce(bp.carried_forward_cents, 0) into v_carried_in
  from public.billing_periods bp
  where bp.shop_id = p_shop_id and bp.period_month < v_month and bp.status <> 'open'
  order by bp.period_month desc limit 1;
  v_carried_in := coalesce(v_carried_in, 0);
  v_accrued := v_ledger + v_carried_in;

  -- Credits, oldest expiry first.
  for c in
    select id, remaining_cents from public.billing_credits
    where shop_id = p_shop_id and remaining_cents > 0 and expires_at > now() and starts_at <= now()
    order by expires_at, created_at
    for update
  loop
    exit when v_accrued - v_credit <= 0;
    v_take := least(c.remaining_cents, v_accrued - v_credit);
    update public.billing_credits set remaining_cents = remaining_cents - v_take where id = c.id;
    v_credit := v_credit + v_take;
  end loop;

  v_net := v_accrued - v_credit;
  v_charge := (v_net >= 500) or (v_capped = 2900 and v_net > 0);
  if coalesce(v_exempt, false) then
    v_charge := false;
    v_net := 0;
  end if;

  update public.billing_periods
  set status = 'closed',
      jobs_counted = v_jobs,
      gross_cents = v_gross,
      capped_cents = v_capped,
      fee_collected_cents = v_fee_collected,
      carried_in_cents = v_carried_in,
      credit_applied_cents = v_credit,
      due_cents = case when v_charge then v_net else 0 end,
      carried_forward_cents = case when v_charge then 0 else v_net end,
      closed_at = now()
  where id = v_period.id
  returning * into v_period;
  return to_jsonb(v_period);
end;
$$;
comment on function public.close_billing_period(uuid, date) is
  '$1/job capped at $29; minus application fees already collected; plus carry-in; minus credits. Charged (due_cents) when >= $5 or the cap was hit, else carried forward. Service role.';

-- close_billing_periods(): every open period for a month that has ended in the shop's time zone.
create or replace function public.close_billing_periods()
returns integer
language plpgsql
security definer
set search_path = ''
as $$
declare
  r record;
  v_count integer := 0;
begin
  if not public.is_service() then
    raise exception 'Only the billing job may close periods.' using errcode = '42501';
  end if;
  for r in
    select bp.shop_id, bp.period_month from public.billing_periods bp
    where bp.status = 'open' and bp.period_month < public.shop_period_month(bp.shop_id, now())
    order by bp.period_month, bp.shop_id
  loop
    perform public.close_billing_period(r.shop_id, r.period_month);
    v_count := v_count + 1;
  end loop;
  return v_count;
end;
$$;

-- A shop that is read_only (card failed for 14 days, §11) takes no new jobs; existing jobs still move.
create or replace function public.jobs_refuse_when_read_only()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  if exists (select 1 from public.shops s where s.id = new.shop_id and s.billing_status = 'read_only') then
    raise exception 'This shop is not taking new jobs until its Bench Tag bill is settled. Existing jobs can still be worked.'
      using errcode = 'P0001';
  end if;
  return new;
end;
$$;
-- Named to fire before jobs_before_insert (BEFORE triggers run in name order).
create trigger jobs_0_billing_gate before insert on public.jobs
  for each row execute function public.jobs_refuse_when_read_only();

-- This month at a glance for /app/billing (security_invoker: members see their shops only).
create or replace view public.shop_month_usage
with (security_invoker = true)
as
select
  u.shop_id,
  u.period_month,
  count(*) filter (where u.billable)::integer as jobs_counted,
  (count(*) filter (where u.billable) * 100)::integer as gross_cents,
  least(count(*) filter (where u.billable) * 100, 2900)::integer as capped_cents,
  (count(*) filter (where u.billable and u.collection = 'application_fee') * 100)::integer as fee_collected_cents
from public.usage_events u
group by u.shop_id, u.period_month;
comment on view public.shop_month_usage is 'Live count per shop per month from usage_events (the open period''s running total).';

-- pg_cron schedule (hosted project only):
--   select cron.schedule('close-billing-periods', '0 12 1 * *', $$select public.close_billing_periods()$$);
--   then the bill-shops edge function invoices every closed period with due_cents > 0.

-- Row level security ---------------------------------------------------------------------------
alter table public.usage_events enable row level security;
alter table public.billing_periods enable row level security;
alter table public.billing_credits enable row level security;
create policy usage_events_select_member on public.usage_events for select to authenticated using (public.is_shop_member(shop_id));
create policy billing_periods_select_member on public.billing_periods for select to authenticated using (public.is_shop_member(shop_id));
create policy billing_credits_select_member on public.billing_credits for select to authenticated using (public.is_shop_member(shop_id));

-- Grants: revoke before you grant ------------------------------------------------------------
revoke all on table public.usage_events, public.billing_periods, public.billing_credits, public.shop_month_usage from anon, authenticated;
grant select on table public.usage_events, public.billing_periods, public.billing_credits, public.shop_month_usage to authenticated;

revoke all on function public.shop_period_month(uuid, timestamptz) from public, anon, authenticated;
revoke all on function public.record_usage(uuid) from public, anon, authenticated;
revoke all on function public.usage_on_history() from public, anon, authenticated;
revoke all on function public.void_job_usage(uuid, text) from public, anon, authenticated;
revoke all on function public.close_billing_period(uuid, date) from public, anon, authenticated;
revoke all on function public.close_billing_periods() from public, anon, authenticated;
revoke all on function public.jobs_refuse_when_read_only() from public, anon, authenticated;
grant execute on function public.shop_period_month(uuid, timestamptz) to authenticated, service_role;
grant execute on function public.record_usage(uuid) to service_role;
grant execute on function public.void_job_usage(uuid, text) to authenticated, service_role;
grant execute on function public.close_billing_period(uuid, date) to service_role;
grant execute on function public.close_billing_periods() to service_role;
