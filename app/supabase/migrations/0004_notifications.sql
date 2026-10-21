-- 0004: the notifications outbox and the triggers that fill it.
--
-- Product definition §5 (templates), §6 (notifications), §8 (send-notifications worker). Nothing
-- in the database sends email: events append rows here, and the worker (supabase/functions/
-- send-notifications) claims, renders and sends them through Resend, with retries and
-- dead-letter visibility. Because status-page tokens are hashed at rest, the link in a customer
-- email is minted when the row is claimed (issue_job_token, keep_previous = true), never stored.

create table public.notifications (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid not null references public.shops (id) on delete cascade,
  job_id uuid references public.jobs (id) on delete cascade,
  template public.notification_template not null,
  audience text not null check (audience in ('customer', 'shop')),
  to_email extensions.citext not null,
  subject text not null,
  payload jsonb not null default '{}'::jsonb,
  status public.notification_status not null default 'pending',
  attempts integer not null default 0,
  next_attempt_at timestamptz not null default now(),
  last_error text,
  provider_message_id text,
  sent_at timestamptz,
  dedupe_key text unique,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
comment on table public.notifications is 'Email outbox. Rows are appended by triggers/RPCs; the send-notifications worker drains them (claim -> send -> complete/fail). payload never holds a token; the worker gets one from claim_notifications().';
create index notifications_due_idx on public.notifications (next_attempt_at) where status in ('pending', 'failed');
create index notifications_shop_idx on public.notifications (shop_id, created_at desc);
create index notifications_job_idx on public.notifications (job_id, created_at desc) where job_id is not null;
create trigger notifications_set_updated_at before update on public.notifications
  for each row execute function public.set_updated_at();

-- Helpers --------------------------------------------------------------------------------------
create or replace function public.money_text(p_cents integer)
returns text
language sql
immutable
set search_path = ''
as $$
  select '$' || to_char(coalesce(p_cents, 0) / 100.0, 'FM999,999,990.00');
$$;

create or replace function public.shop_notify_email(p_shop_id uuid)
returns text
language sql
stable
security definer
set search_path = ''
as $$
  select coalesce(
    (select s.public_email::text from public.shops s where s.id = p_shop_id),
    (select u.email from public.shop_members m join auth.users u on u.id = m.user_id
      where m.shop_id = p_shop_id order by m.role, m.created_at limit 1)
  );
$$;
comment on function public.shop_notify_email(uuid) is 'Where shop-facing emails go: the public email, else the owner''s sign-in email.';

-- Everything a template needs about a job, in one JSON object (no tokens, no internal notes).
create or replace function public.job_email_context(p_job_id uuid)
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  select jsonb_build_object(
    'job_id', j.id,
    'job_number', j.job_number,
    'short_code', j.short_code,
    'status', j.status,
    'kind', j.kind,
    'promised_date', j.promised_date,
    'delivery', j.delivery,
    'carrier', j.carrier,
    'tracking_number', j.tracking_number,
    'closed_how', j.closed_how,
    'item_label', trim(concat_ws(' ', i.brand, i.model)),
    'customer_first_name', c.first_name,
    'customer_email', c.email,
    'shop_name', s.name,
    'shop_slug', s.slug,
    'shop_email', public.shop_notify_email(s.id),
    'shop_phone', s.phone,
    'uncollected_policy_text', s.uncollected_policy_text,
    'balance_cents', (public.job_balance(j.id) ->> 'balance_cents')::integer
  )
  from public.jobs j
  join public.items i on i.id = j.item_id
  join public.customers c on c.id = j.customer_id
  join public.shops s on s.id = j.shop_id
  where j.id = p_job_id;
$$;

create or replace function public.enqueue_notification(
  p_shop_id uuid,
  p_job_id uuid,
  p_template public.notification_template,
  p_audience text,
  p_to_email text,
  p_subject text,
  p_payload jsonb default '{}'::jsonb,
  p_dedupe_key text default null
)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_id uuid;
begin
  -- No address, no email: counter customers may have only a phone number.
  if p_to_email is null or length(trim(p_to_email)) = 0 then
    return null;
  end if;
  insert into public.notifications (shop_id, job_id, template, audience, to_email, subject, payload, dedupe_key)
  values (p_shop_id, p_job_id, p_template, p_audience, trim(p_to_email), p_subject, coalesce(p_payload, '{}'::jsonb), p_dedupe_key)
  on conflict (dedupe_key) do nothing
  returning id into v_id;
  return v_id;
end;
$$;
comment on function public.enqueue_notification(uuid, uuid, public.notification_template, text, text, text, jsonb, text) is
  'Appends one outbox row (skipped when there is no address or the dedupe key already exists). Internal and service role.';

-- Event triggers --------------------------------------------------------------------------------
create or replace function public.notify_on_history()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  ctx jsonb := public.job_email_context(new.job_id);
  v_shop text := ctx ->> 'shop_name';
  v_item text := coalesce(nullif(ctx ->> 'item_label', ''), case when ctx ->> 'kind' = 'rod' then 'rod' else 'reel' end);
  v_date text := case when ctx ->> 'promised_date' is null then null else to_char((ctx ->> 'promised_date')::date, 'Mon FMDD') end;
  v_cust text := ctx ->> 'customer_email';
  v_payload jsonb := ctx || jsonb_build_object('note', case when new.customer_visible then new.note else null end, 'history_id', new.id);
  v_key text := new.job_id::text || ':' || new.id::text;
begin
  -- Same-status rows are "send an update" notes.
  if new.from_status is not distinct from new.to_status then
    if new.customer_visible and new.note is not null then
      perform public.enqueue_notification(new.shop_id, new.job_id, 'status_update', 'customer', v_cust,
        format('Update on your %s', v_item), v_payload, 'status_update:' || v_key);
    end if;
    return null;
  end if;

  if new.from_status is null then
    if new.to_status = 'requested' then
      perform public.enqueue_notification(new.shop_id, new.job_id, 'intake_received', 'customer', v_cust,
        format('%s got your request — your tracking link', v_shop), v_payload, 'intake_received:' || v_key);
      perform public.enqueue_notification(new.shop_id, new.job_id, 'new_request', 'shop', ctx ->> 'shop_email',
        format('New request: %s %s from %s', ctx ->> 'kind', v_item, ctx ->> 'customer_first_name'), v_payload, 'new_request:' || v_key);
    elsif new.to_status = 'received' then
      perform public.enqueue_notification(new.shop_id, new.job_id, 'item_received', 'customer', v_cust,
        case when v_date is null then format('%s has your %s', v_shop, v_item) else format('%s has your %s — promised by %s', v_shop, v_item, v_date) end,
        v_payload, 'item_received:' || v_key);
    end if;
    return null;
  end if;

  case new.to_status
    when 'received' then
      -- A reel the shop marked received after a public request. (Rod orders are confirmed by deposit_paid.)
      if new.from_status = 'requested' and ctx ->> 'kind' = 'reel' then
        perform public.enqueue_notification(new.shop_id, new.job_id, 'item_received', 'customer', v_cust,
          case when v_date is null then format('%s has your %s', v_shop, v_item) else format('%s has your %s — promised by %s', v_shop, v_item, v_date) end,
          v_payload, 'item_received:' || v_key);
      end if;
    when 'in_progress', 'waiting_parts', 'finishing' then
      perform public.enqueue_notification(new.shop_id, new.job_id, 'status_update', 'customer', v_cust,
        format('Update on your %s', v_item), v_payload, 'status_update:' || v_key);
    when 'ready' then
      if ctx ->> 'delivery' = 'ship' then
        perform public.enqueue_notification(new.shop_id, new.job_id, 'ready_ship', 'customer', v_cust,
          format('Your %s is ready to ship', v_item), v_payload, 'ready_ship:' || v_key);
      else
        perform public.enqueue_notification(new.shop_id, new.job_id, 'ready_pickup', 'customer', v_cust,
          format('Your %s is ready at %s', v_item, v_shop), v_payload, 'ready_pickup:' || v_key);
      end if;
    when 'closed' then
      if ctx ->> 'closed_how' = 'shipped' then
        perform public.enqueue_notification(new.shop_id, new.job_id, 'shipped', 'customer', v_cust,
          format('Your %s is on its way', v_item), v_payload, 'shipped:' || v_key);
      elsif ctx ->> 'closed_how' = 'picked_up' then
        perform public.enqueue_notification(new.shop_id, new.job_id, 'closed_pickup', 'customer', v_cust,
          format('Thanks from %s', v_shop), v_payload, 'closed_pickup:' || v_key);
      end if;
    when 'declined' then
      perform public.enqueue_notification(new.shop_id, new.job_id, 'declined_next_steps', 'customer', v_cust,
        'You declined the quote — what happens next', v_payload, 'declined_next_steps:' || v_key);
    when 'cancelled' then
      if new.from_status = 'requested' and new.actor = 'system' then
        perform public.enqueue_notification(new.shop_id, new.job_id, 'request_expired', 'customer', v_cust,
          format('Your request with %s expired', v_shop), v_payload, 'request_expired:' || v_key);
      end if;
    else
      null; -- diagnosing, quote_sent, approved: no customer email from the status change itself
  end case;
  return null;
end;
$$;
create trigger history_notify after insert on public.job_status_history
  for each row execute function public.notify_on_history();

create or replace function public.notify_on_promised_date()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  ctx jsonb;
begin
  if new.promised_date is distinct from old.promised_date and old.promised_date is not null and new.promised_date is not null
     and new.status not in ('closed', 'cancelled', 'ready') then
    ctx := public.job_email_context(new.id);
    perform public.enqueue_notification(new.shop_id, new.id, 'promised_date_changed', 'customer', ctx ->> 'customer_email',
      format('New promised date for your %s: %s', coalesce(nullif(ctx ->> 'item_label', ''), ctx ->> 'kind'), to_char(new.promised_date, 'Mon FMDD')),
      ctx || jsonb_build_object('old_promised_date', old.promised_date), null);
  end if;
  return null;
end;
$$;
create trigger jobs_notify_promised_date after update of promised_date on public.jobs
  for each row execute function public.notify_on_promised_date();

create or replace function public.notify_on_quote()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  ctx jsonb;
  v_item text;
  v_payload jsonb;
begin
  if new.status is not distinct from old.status then
    return null;
  end if;
  ctx := public.job_email_context(new.job_id);
  v_item := coalesce(nullif(ctx ->> 'item_label', ''), ctx ->> 'kind');
  v_payload := ctx || jsonb_build_object('quote_id', new.id, 'quote_version', new.version, 'quote_total_cents', new.total_cents,
    'quote_expires_at', new.expires_at, 'quote_note', new.note_to_customer, 'decision_note', new.decision_note);
  if new.status = 'sent' then
    perform public.enqueue_notification(new.shop_id, new.job_id, 'quote_sent', 'customer', ctx ->> 'customer_email',
      format('Quote from %s for your %s: %s', ctx ->> 'shop_name', v_item, public.money_text(new.total_cents)),
      v_payload, 'quote_sent:' || new.id::text);
  elsif new.status in ('approved', 'declined') then
    perform public.enqueue_notification(new.shop_id, new.job_id, 'quote_decided_shop', 'shop', ctx ->> 'shop_email',
      format('%s %s your quote for #%s (%s)', ctx ->> 'customer_first_name', new.status, ctx ->> 'job_number', public.money_text(new.total_cents)),
      v_payload || jsonb_build_object('decision', new.status), 'quote_decided_shop:' || new.id::text || ':' || new.status::text);
  end if;
  return null;
end;
$$;
create trigger quotes_notify after update of status on public.quotes
  for each row execute function public.notify_on_quote();

create or replace function public.notify_on_payment()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  ctx jsonb;
  v_item text;
  v_payload jsonb;
begin
  if new.status <> 'succeeded' or (tg_op = 'UPDATE' and old.status = 'succeeded') then
    return null;
  end if;
  ctx := public.job_email_context(new.job_id);
  v_item := coalesce(nullif(ctx ->> 'item_label', ''), ctx ->> 'kind');
  v_payload := ctx || jsonb_build_object('payment_id', new.id, 'amount_cents', new.amount_cents, 'purpose', new.purpose, 'method', new.method);
  perform public.enqueue_notification(new.shop_id, new.job_id, 'payment_received', 'shop', ctx ->> 'shop_email',
    format('Payment received: %s for #%s %s', public.money_text(new.amount_cents), ctx ->> 'job_number', v_item),
    v_payload, 'payment_received:' || new.id::text);
  if new.purpose = 'deposit' then
    perform public.enqueue_notification(new.shop_id, new.job_id, 'deposit_paid', 'customer', ctx ->> 'customer_email',
      case when ctx ->> 'kind' = 'rod' then 'Deposit received — your rod order is confirmed' else format('Deposit received for your %s', v_item) end,
      v_payload, 'deposit_paid:' || new.id::text);
  end if;
  return null;
end;
$$;
create trigger payments_notify after insert or update of status on public.payments
  for each row execute function public.notify_on_payment();

-- Reminders (pg_cron) ----------------------------------------------------------------------------
-- flag_uncollected(): ready+7d and ready+30d reminders, then the final notice at the shop's
-- uncollected_days. Dedupe keys make it safe to run every hour. Returns rows enqueued.
create or replace function public.flag_uncollected()
returns integer
language plpgsql
security definer
set search_path = ''
as $$
declare
  r record;
  ctx jsonb;
  v_item text;
  v_count integer := 0;
  v_id uuid;
begin
  for r in
    select j.id, j.shop_id, j.ready_at, s.uncollected_days,
      extract(day from now() - j.ready_at)::integer as days_ready
    from public.jobs j join public.shops s on s.id = j.shop_id
    where j.status = 'ready' and j.deleted_at is null and j.ready_at <= now() - interval '7 days'
  loop
    ctx := public.job_email_context(r.id);
    v_item := coalesce(nullif(ctx ->> 'item_label', ''), ctx ->> 'kind');
    if r.days_ready >= r.uncollected_days then
      v_id := public.enqueue_notification(r.shop_id, r.id, 'uncollected_final', 'customer', ctx ->> 'customer_email',
        format('Final notice about your %s at %s', v_item, ctx ->> 'shop_name'), ctx || jsonb_build_object('stage', 'final'),
        'uncollected_final:' || r.id::text);
      if v_id is not null then
        update public.jobs set uncollected_notice_at = now() where id = r.id;
        v_count := v_count + 1;
      end if;
    elsif r.days_ready >= 30 then
      v_id := public.enqueue_notification(r.shop_id, r.id, 'pickup_reminder', 'customer', ctx ->> 'customer_email',
        format('Reminder: your %s is waiting at %s', v_item, ctx ->> 'shop_name'), ctx || jsonb_build_object('stage', 30),
        'pickup_reminder:' || r.id::text || ':30');
      if v_id is not null then v_count := v_count + 1; end if;
    else
      v_id := public.enqueue_notification(r.shop_id, r.id, 'pickup_reminder', 'customer', ctx ->> 'customer_email',
        format('Reminder: your %s is waiting at %s', v_item, ctx ->> 'shop_name'), ctx || jsonb_build_object('stage', 7),
        'pickup_reminder:' || r.id::text || ':7');
      if v_id is not null then v_count := v_count + 1; end if;
    end if;
  end loop;
  return v_count;
end;
$$;
comment on function public.flag_uncollected() is 'Hourly: pickup reminders at ready+7 and +30 days, final notice at shops.uncollected_days. Idempotent through dedupe keys.';

-- Worker RPCs (service role) ----------------------------------------------------------------------
-- claim_notifications(n): marks up to n due rows `sending` and returns them with a fresh token
-- for customer emails (the only moment a token exists in the clear).
create or replace function public.claim_notifications(p_limit integer default 50)
returns table (
  id uuid, shop_id uuid, job_id uuid, template public.notification_template, audience text,
  to_email text, subject text, payload jsonb, attempts integer, token text
)
language plpgsql
security definer
set search_path = ''
as $$
begin
  if not public.is_service() then
    raise exception 'Only the worker may claim notifications.' using errcode = '42501';
  end if;
  return query
  with due as (
    select n.id from public.notifications n
    where n.status in ('pending', 'failed') and n.attempts < 6 and n.next_attempt_at <= now()
    order by n.next_attempt_at
    limit greatest(coalesce(p_limit, 50), 1)
    for update skip locked
  ), claimed as (
    update public.notifications n set status = 'sending', attempts = n.attempts + 1
    from due where n.id = due.id
    returning n.*
  )
  select c.id, c.shop_id, c.job_id, c.template, c.audience, c.to_email::text, c.subject, c.payload, c.attempts,
    case when c.audience = 'customer' and c.job_id is not null then public.issue_job_token(c.job_id, true) else null end
  from claimed c;
end;
$$;

create or replace function public.complete_notification(p_id uuid, p_provider_message_id text default null)
returns void
language plpgsql
security definer
set search_path = ''
as $$
begin
  if not public.is_service() then
    raise exception 'Only the worker may complete notifications.' using errcode = '42501';
  end if;
  update public.notifications
  set status = 'sent', sent_at = now(), provider_message_id = p_provider_message_id, last_error = null
  where id = p_id and status = 'sending';
end;
$$;

-- Backoff 1m, 5m, 30m, 2h, 12h, 24h; after the sixth attempt the row stays failed (dead letter).
create or replace function public.fail_notification(p_id uuid, p_error text)
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_attempts integer;
begin
  if not public.is_service() then
    raise exception 'Only the worker may fail notifications.' using errcode = '42501';
  end if;
  select attempts into v_attempts from public.notifications where id = p_id;
  update public.notifications
  set status = 'failed',
      last_error = left(coalesce(p_error, 'unknown error'), 500),
      next_attempt_at = now() + case v_attempts
        when 1 then interval '1 minute' when 2 then interval '5 minutes' when 3 then interval '30 minutes'
        when 4 then interval '2 hours' when 5 then interval '12 hours' else interval '24 hours' end
  where id = p_id;
end;
$$;

-- pg_cron schedule (run once on the hosted project; the harness has no pg_cron):
--   select cron.schedule('send-notifications', '* * * * *',
--     $$select net.http_post(url := current_setting('app.functions_url') || '/send-notifications',
--         headers := jsonb_build_object('Authorization', 'Bearer ' || (select decrypted_secret from vault.decrypted_secrets where name = 'cron_secret')))$$);
--   select cron.schedule('flag-uncollected', '0 * * * *', $$select public.flag_uncollected()$$);

-- Row level security ---------------------------------------------------------------------------
alter table public.notifications enable row level security;
create policy notifications_select_member on public.notifications
  for select to authenticated using (public.is_shop_member(shop_id));

-- Grants: revoke before you grant ------------------------------------------------------------
revoke all on table public.notifications from anon, authenticated;
grant select on table public.notifications to authenticated;

revoke all on function public.money_text(integer) from public, anon, authenticated;
revoke all on function public.shop_notify_email(uuid) from public, anon, authenticated;
revoke all on function public.job_email_context(uuid) from public, anon, authenticated;
revoke all on function public.enqueue_notification(uuid, uuid, public.notification_template, text, text, text, jsonb, text) from public, anon, authenticated;
revoke all on function public.notify_on_history() from public, anon, authenticated;
revoke all on function public.notify_on_promised_date() from public, anon, authenticated;
revoke all on function public.notify_on_quote() from public, anon, authenticated;
revoke all on function public.notify_on_payment() from public, anon, authenticated;
revoke all on function public.flag_uncollected() from public, anon, authenticated;
revoke all on function public.claim_notifications(integer) from public, anon, authenticated;
revoke all on function public.complete_notification(uuid, text) from public, anon, authenticated;
revoke all on function public.fail_notification(uuid, text) from public, anon, authenticated;
grant execute on function public.money_text(integer) to authenticated, service_role;
grant execute on function public.enqueue_notification(uuid, uuid, public.notification_template, text, text, text, jsonb, text) to service_role;
grant execute on function public.flag_uncollected() to service_role;
grant execute on function public.claim_notifications(integer) to service_role;
grant execute on function public.complete_notification(uuid, text) to service_role;
grant execute on function public.fail_notification(uuid, text) to service_role;
