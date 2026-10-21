-- 0005: metering: $1 per received job, $29 cap, $0 idle, >= $5 or cap to charge, carry-forward,
-- read_only refuses new jobs. The Vitest cases in src/features/billing/domain/metering.test.ts
-- copy these numbers.
\ir lib/fixtures.sql
select test.setup_two_shops();

create or replace function test.make_jobs(p_shop text, p_n integer) returns void language plpgsql as $$
declare i integer;
begin
  for i in 1 .. p_n loop
    if p_shop = 'shop_a' then perform test.job_a(); else perform test.job_b(); end if;
  end loop;
end;
$$;
grant execute on function test.make_jobs(text, integer) to anon, authenticated, service_role;

\echo '--- the meter ticks once per job, on received'
select test.set('j1', (test.job_a() ->> 'id'));
select test.as_a();
select test.count('select * from public.usage_events where job_id = test.id(''j1'')', 1, 'counter intake records one usage event');
select test.eq((select collection::text from public.usage_events where job_id = test.id('j1')), 'ledger', 'on the ledger until a payment collects it');
select test.eq((select period_month from public.usage_events where job_id = test.id('j1')), public.shop_period_month(test.id('shop_a')), 'in the shop''s current month');
select test.count('select * from public.billing_periods where shop_id = test.id(''shop_a'')', 1, 'the month''s period row was created lazily');
select test.eq((select jobs_counted from public.billing_periods where shop_id = test.id('shop_a')), 1, 'with one job counted');
select test.as_service();
select test.eq(public.record_usage(test.id('j1')), false, 'recording the same job again is a no-op');
select test.count('select * from public.usage_events where job_id = test.id(''j1'')', 1, 'still one event');
select test.as_a();
select public.transition_job(test.id('j1'), 'in_progress');
select public.transition_job(test.id('j1'), 'ready');
select test.count('select * from public.usage_events where job_id = test.id(''j1'')', 1, 'later moves never count again');

\echo '--- 10 jobs -> 1,000 cents, charged (>= $5)'
select test.make_jobs('shop_a', 9);
select test.as_a();
select test.eq((select jobs_counted from public.shop_month_usage where shop_id = test.id('shop_a')), 10, 'shop_month_usage counts 10');
select test.eq((select capped_cents from public.shop_month_usage where shop_id = test.id('shop_a')), 1000, 'live capped total is 1,000');
select test.raises($q$ select public.close_billing_period(test.id('shop_a'), current_date) $q$, 'members cannot close periods', '%permission denied%');
select test.as_service();
select test.set('month_a', public.shop_period_month(test.id('shop_a'))::text);
select test.set('close_a', public.close_billing_period(test.id('shop_a'), test.v('month_a')::date)::text);
select test.eq((test.v('close_a')::jsonb ->> 'jobs_counted')::integer, 10, 'closed with 10 jobs');
select test.eq((test.v('close_a')::jsonb ->> 'gross_cents')::integer, 1000, 'gross 1,000');
select test.eq((test.v('close_a')::jsonb ->> 'capped_cents')::integer, 1000, 'under the cap');
select test.eq((test.v('close_a')::jsonb ->> 'due_cents')::integer, 1000, 'due 1,000 (>= 500 so charged)');
select test.eq((test.v('close_a')::jsonb ->> 'carried_forward_cents')::integer, 0, 'nothing carried');
select test.eq(test.v('close_a')::jsonb ->> 'status', 'closed', 'status closed');
select test.eq((public.close_billing_period(test.id('shop_a'), test.v('month_a')::date) ->> 'due_cents')::integer, 1000, 'closing again changes nothing');

\echo '--- 40 jobs -> capped at 2,900'
select test.make_jobs('shop_b', 40);
select test.as_service();
select test.set('month_b', public.shop_period_month(test.id('shop_b'))::text);
select test.set('close_b', public.close_billing_period(test.id('shop_b'), test.v('month_b')::date)::text);
select test.eq((test.v('close_b')::jsonb ->> 'gross_cents')::integer, 4000, 'gross 4,000');
select test.eq((test.v('close_b')::jsonb ->> 'capped_cents')::integer, 2900, 'capped at 2,900');
select test.eq((test.v('close_b')::jsonb ->> 'due_cents')::integer, 2900, 'due 2,900');

\echo '--- an idle month has no row and no charge'
select test.eq(public.close_billing_period(test.id('shop_a'), (test.v('month_a')::date - interval '1 month')::date), null::jsonb, 'last month: null, nothing to bill');
select test.count('select * from public.billing_periods where shop_id = test.id(''shop_a'')', 1, 'and no row was created');

\echo '--- a small ledger balance rolls forward until it reaches $5'
select test.as_admin();
insert into auth.users (id, email) values ('cccccccc-cccc-4ccc-8ccc-cccccccccccc', 'owner-c@example.com');
select test.as_user('cccccccc-cccc-4ccc-8ccc-cccccccccccc', 'owner-c@example.com');
select test.set('shop_c', public.create_shop('Shop C', 'shop-c')::text);
select test.as_service();
-- Two months of usage, inserted directly (the meter normally does this): 3 jobs, then 2 jobs.
insert into public.billing_periods (shop_id, period_month, jobs_counted, gross_cents, capped_cents)
  values (test.id('shop_c'), date '2026-08-01', 3, 300, 300), (test.id('shop_c'), date '2026-09-01', 2, 200, 200);
insert into public.customers (id, shop_id, first_name) values ('22222222-0000-4000-8000-00000000000c', test.id('shop_c'), 'Cy');
insert into public.items (id, shop_id, customer_id, kind) values ('33333333-0000-4000-8000-00000000000c', test.id('shop_c'), '22222222-0000-4000-8000-00000000000c', 'reel');
do $$
declare i integer; v_id uuid;
begin
  for i in 1 .. 5 loop
    insert into public.jobs (shop_id, customer_id, item_id, source, status)
      values (test.id('shop_c'), '22222222-0000-4000-8000-00000000000c', '33333333-0000-4000-8000-00000000000c', 'counter', 'requested')
      returning id into v_id;
    -- Move the event to the month under test (the trigger recorded nothing: still requested).
    insert into public.usage_events (shop_id, job_id, period_month, occurred_at)
      values (test.id('shop_c'), v_id, case when i <= 3 then date '2026-08-01' else date '2026-09-01' end, now());
  end loop;
end;
$$;
select test.set('close_c1', public.close_billing_period(test.id('shop_c'), date '2026-08-01')::text);
select test.eq((test.v('close_c1')::jsonb ->> 'capped_cents')::integer, 300, 'August: 3 jobs = 300');
select test.eq((test.v('close_c1')::jsonb ->> 'due_cents')::integer, 0, 'under $5: nothing charged');
select test.eq((test.v('close_c1')::jsonb ->> 'carried_forward_cents')::integer, 300, '300 carried forward');
select test.set('close_c2', public.close_billing_period(test.id('shop_c'), date '2026-09-01')::text);
select test.eq((test.v('close_c2')::jsonb ->> 'carried_in_cents')::integer, 300, 'September picks up the 300');
select test.eq((test.v('close_c2')::jsonb ->> 'due_cents')::integer, 500, '300 + 200 = 500: charged');
select test.eq((test.v('close_c2')::jsonb ->> 'carried_forward_cents')::integer, 0, 'ledger cleared');

\echo '--- application fees already collected come off the ledger; the cap still charges'
insert into public.billing_periods (shop_id, period_month, jobs_counted) values (test.id('shop_c'), date '2026-10-01', 0);
do $$
declare i integer; v_id uuid;
begin
  for i in 1 .. 30 loop
    insert into public.jobs (shop_id, customer_id, item_id, source, status)
      values (test.id('shop_c'), '22222222-0000-4000-8000-00000000000c', '33333333-0000-4000-8000-00000000000c', 'counter', 'requested')
      returning id into v_id;
    insert into public.usage_events (shop_id, job_id, period_month, occurred_at, collection)
      values (test.id('shop_c'), v_id, date '2026-10-01', now(), case when i <= 4 then 'application_fee' else 'ledger' end::public.usage_collection);
  end loop;
end;
$$;
select test.set('close_c3', public.close_billing_period(test.id('shop_c'), date '2026-10-01')::text);
select test.eq((test.v('close_c3')::jsonb ->> 'capped_cents')::integer, 2900, '30 jobs cap at 2,900');
select test.eq((test.v('close_c3')::jsonb ->> 'fee_collected_cents')::integer, 400, '4 x $1 already collected as application fees');
select test.eq((test.v('close_c3')::jsonb ->> 'due_cents')::integer, 2500, 'the card is charged the rest: 2,500');

\echo '--- credits apply oldest-expiry first'
insert into public.billing_periods (shop_id, period_month, jobs_counted) values (test.id('shop_c'), date '2026-11-01', 0);
insert into public.billing_credits (shop_id, source, amount_cents, remaining_cents, expires_at) values
  (test.id('shop_c'), 'promo', 200, 200, now() + interval '10 days'),
  (test.id('shop_c'), 'prepay', 29000, 29000, now() + interval '300 days');
do $$
declare i integer; v_id uuid;
begin
  for i in 1 .. 7 loop
    insert into public.jobs (shop_id, customer_id, item_id, source, status)
      values (test.id('shop_c'), '22222222-0000-4000-8000-00000000000c', '33333333-0000-4000-8000-00000000000c', 'counter', 'requested')
      returning id into v_id;
    insert into public.usage_events (shop_id, job_id, period_month, occurred_at) values (test.id('shop_c'), v_id, date '2026-11-01', now());
  end loop;
end;
$$;
select test.set('close_c4', public.close_billing_period(test.id('shop_c'), date '2026-11-01')::text);
select test.eq((test.v('close_c4')::jsonb ->> 'credit_applied_cents')::integer, 700, '700 of credit applied');
select test.eq((test.v('close_c4')::jsonb ->> 'due_cents')::integer, 0, 'nothing due');
select test.eq((select remaining_cents from public.billing_credits where source = 'promo'), 0, 'the soon-to-expire promo went first');
select test.eq((select remaining_cents from public.billing_credits where source = 'prepay'), 28500, 'then the prepay');

\echo '--- void within 7 days'
select test.set('jv', (test.job_a() ->> 'id'));
select test.as_a();
select public.void_job_usage(test.id('jv'), 'Logged twice');
select test.eq((select billable from public.usage_events where job_id = test.id('jv')), false, 'the event is no longer billable');
select test.eq((select void_reason from public.usage_events where job_id = test.id('jv')), 'Logged twice', 'with the reason');
select test.eq((select status::text from public.jobs where id = test.id('jv')), 'cancelled', 'and the job is cancelled');
select public.record_offline_payment(test.id('j1'), 500, 'cash');
select test.raises($q$ select public.void_job_usage(test.id('j1'), 'Too late') $q$, 'a paid job cannot be voided', '%payment%');

\echo '--- read_only refuses new jobs, existing jobs still move'
select test.as_service();
update public.shops set billing_status = 'read_only' where id = test.id('shop_a');
select test.as_a();
select test.raises($q$ select public.create_job(test.id('shop_a'), test.id('cust_a'), test.id('item_a_reel')) $q$, 'read_only: no new jobs', '%not taking new jobs%');
select public.transition_job(test.id('j1'), 'closed', null, false, 'picked_up');
select test.eq((select status::text from public.jobs where id = test.id('j1')), 'closed', 'but an existing job can still close');
select test.as_anon();
select test.eq((public.public_shop('shop-a') -> 'taking_requests')::boolean, false, 'the public page says so');
select test.as_service();
update public.shops set billing_status = 'ok' where id = test.id('shop_a');

\echo '--- exempt shops are counted, never charged'
update public.shops set billing_exempt = true where id = test.id('shop_b');
insert into public.billing_periods (shop_id, period_month, jobs_counted) values (test.id('shop_b'), date '2026-07-01', 0);
insert into public.jobs (id, shop_id, customer_id, item_id, source, status) values
  ('55555555-0000-4000-8000-000000000001', test.id('shop_b'), test.id('cust_b'), test.id('item_b_reel'), 'counter', 'requested');
insert into public.usage_events (shop_id, job_id, period_month, occurred_at) values (test.id('shop_b'), '55555555-0000-4000-8000-000000000001', date '2026-07-01', now());
select test.eq((public.close_billing_period(test.id('shop_b'), date '2026-07-01') ->> 'due_cents')::integer, 0, 'exempt: due 0');

\echo '--- tenancy'
select test.as_b();
select test.count('select * from public.usage_events where shop_id = test.id(''shop_a'')', 0, 'B sees no usage of A');
select test.count('select * from public.billing_periods where shop_id = test.id(''shop_a'')', 0, 'nor A''s periods');
select test.raises($q$ insert into public.usage_events (shop_id, job_id, period_month) values (test.id('shop_b'), test.id('j1'), current_date) $q$, 'members cannot write usage', '%permission denied%');
select test.raises($q$ update public.billing_periods set due_cents = 0 $q$, 'members cannot edit periods', '%permission denied%');
select test.as_anon();
select test.raises($q$ select * from public.usage_events $q$, 'anon cannot read usage', '%permission denied%');
select test.as_admin();
