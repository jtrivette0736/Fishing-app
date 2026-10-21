-- 0004: the outbox: which events enqueue which template, reminders, and the worker RPCs.
\ir lib/fixtures.sql
select test.setup_two_shops();

\echo '--- counter intake'
select test.set('j1', (test.job_a() ->> 'id'));
select test.as_a();
select test.count('select * from public.notifications where job_id = test.id(''j1'')', 1, 'one email on counter intake');
select test.eq((select template::text from public.notifications where job_id = test.id('j1')), 'item_received', 'it is item_received');
select test.eq((select to_email::text from public.notifications where job_id = test.id('j1')), 'alice@example.com', 'to the customer');
select test.eq((select subject from public.notifications where job_id = test.id('j1')) like 'Shop A has your Penn Spinfisher VI 4500 — promised by %', true,
  'subject names the shop, the item and the date');
select test.eq((select status::text from public.notifications where job_id = test.id('j1')), 'pending', 'pending until the worker sends it');
select test.eq((select payload ? 'token' from public.notifications where job_id = test.id('j1')), false, 'payload never carries a token');
select test.eq((select payload ->> 'shop_slug' from public.notifications where job_id = test.id('j1')), 'shop-a', 'payload carries the shop slug');

select test.set('j_nomail', (test.job_a('item_a2_reel', 'cust_a2') ->> 'id'));
select test.count('select * from public.notifications where job_id = test.id(''j_nomail'')', 0, 'a customer without an email gets no row');

\echo '--- status changes'
select test.as_a();
select public.transition_job(test.id('j1'), 'diagnosing');
select test.count('select * from public.notifications where job_id = test.id(''j1'')', 1, 'received -> diagnosing is silent');
select public.transition_job(test.id('j1'), 'in_progress', 'Cleaning now', true);
select test.count('select * from public.notifications where job_id = test.id(''j1'') and template = ''status_update'' and payload ->> ''status'' = ''in_progress''', 1, 'in_progress sends status_update');
select test.eq((select payload ->> 'note' from public.notifications where job_id = test.id('j1') and template = 'status_update' and payload ->> 'status' = 'in_progress'), 'Cleaning now', 'with the visible note');
select public.transition_job(test.id('j1'), 'waiting_parts', 'Secret internal note', false);
select test.eq((select payload ->> 'note' from public.notifications where job_id = test.id('j1') and template = 'status_update' and payload ->> 'status' = 'waiting_parts'), null::text,
  'an internal note is not emailed');
select public.add_job_update(test.id('j1'), 'Parts landed', true);
select test.count('select * from public.notifications where job_id = test.id(''j1'') and template = ''status_update''', 3, '"send an update" emails too');
select public.transition_job(test.id('j1'), 'finishing');
select public.transition_job(test.id('j1'), 'ready');
select test.count('select * from public.notifications where job_id = test.id(''j1'') and template = ''ready_pickup''', 1, 'ready (pickup) sends ready_pickup');
select test.eq((select subject from public.notifications where job_id = test.id('j1') and template = 'ready_pickup'), 'Your Penn Spinfisher VI 4500 is ready at Shop A', 'ready subject');
update public.jobs set promised_date = current_date + 9 where id = test.id('j1');
select test.count('select * from public.notifications where job_id = test.id(''j1'') and template = ''promised_date_changed''', 0,
  'promised date changes on a ready job are not emailed');
select public.transition_job(test.id('j1'), 'closed', 'Picked up', false, 'picked_up');
select test.count('select * from public.notifications where job_id = test.id(''j1'') and template = ''closed_pickup''', 1, 'closed(picked_up) sends closed_pickup');

select test.set('j_ship', (test.job_a() ->> 'id'));
select test.as_a();
update public.jobs set delivery = 'ship', promised_date = current_date + 12 where id = test.id('j_ship');
select test.count('select * from public.notifications where job_id = test.id(''j_ship'') and template = ''promised_date_changed''', 1,
  'a changed promised date is emailed');
select test.eq((select subject from public.notifications where job_id = test.id('j_ship') and template = 'promised_date_changed') like 'New promised date for your Penn Spinfisher VI 4500: %', true,
  'with the new date in the subject');
select public.transition_job(test.id('j_ship'), 'ready');
select test.count('select * from public.notifications where job_id = test.id(''j_ship'') and template = ''ready_ship''', 1, 'ready (ship) sends ready_ship');
select public.transition_job(test.id('j_ship'), 'closed', null, false, 'shipped', 'USPS', '9400111899223344556677');
select test.count('select * from public.notifications where job_id = test.id(''j_ship'') and template = ''shipped''', 1, 'closed(shipped) sends shipped');
select test.eq((select payload ->> 'tracking_number' from public.notifications where job_id = test.id('j_ship') and template = 'shipped'), '9400111899223344556677', 'with tracking');

\echo '--- quotes and payments'
select test.set('jq', (test.job_a() ->> 'id'));
select test.as_a();
insert into public.quotes (id, job_id) values ('44444444-0000-4000-8000-000000000011', test.id('jq'));
insert into public.quote_lines (quote_id, kind, description, unit_cents) values ('44444444-0000-4000-8000-000000000011', 'part', 'Drag washers', 2400);
select public.send_quote('44444444-0000-4000-8000-000000000011');
select test.count('select * from public.notifications where job_id = test.id(''jq'') and template = ''quote_sent''', 1, 'sending a quote emails the customer');
select test.eq((select subject from public.notifications where job_id = test.id('jq') and template = 'quote_sent'), 'Quote from Shop A for your Penn Spinfisher VI 4500: $24.00', 'quote subject has the total');
select public.decide_quote('44444444-0000-4000-8000-000000000011', false, 'Too much');
select test.count('select * from public.notifications where job_id = test.id(''jq'') and template = ''quote_decided_shop''', 1, 'a decision emails the shop');
select test.eq((select to_email::text from public.notifications where job_id = test.id('jq') and template = 'quote_decided_shop'), 'hello-a@example.com', 'to the shop''s public email');
select test.count('select * from public.notifications where job_id = test.id(''jq'') and template = ''declined_next_steps''', 1, 'and the customer hears what happens next');
select public.record_offline_payment(test.id('jq'), 1500, 'cash', 'deposit');
select test.count('select * from public.notifications where job_id = test.id(''jq'') and template = ''payment_received''', 1, 'a payment emails the shop');
select test.count('select * from public.notifications where job_id = test.id(''jq'') and template = ''deposit_paid''', 1, 'a deposit emails the customer');

\echo '--- reminders'
select test.set('jr', (test.job_a() ->> 'id'));
select test.as_a();
select public.transition_job(test.id('jr'), 'ready');
select test.as_service();
select test.eq(public.flag_uncollected(), 0, 'nothing due on the day it became ready');
update public.jobs set ready_at = now() - interval '8 days' where id = test.id('jr');
select test.eq(public.flag_uncollected(), 1, 'ready+7: one reminder');
select test.eq(public.flag_uncollected(), 0, 'running again adds nothing');
select test.eq((select payload ->> 'stage' from public.notifications where job_id = test.id('jr') and template = 'pickup_reminder'), '7', 'stage 7');
update public.jobs set ready_at = now() - interval '31 days' where id = test.id('jr');
select test.eq(public.flag_uncollected(), 1, 'ready+30: second reminder');
select test.count('select * from public.notifications where job_id = test.id(''jr'') and template = ''pickup_reminder''', 2, 'two reminders now');
update public.jobs set ready_at = now() - interval '91 days' where id = test.id('jr');
select test.eq(public.flag_uncollected(), 1, 'ready+90 (the shop''s uncollected_days): final notice');
select test.count('select * from public.notifications where job_id = test.id(''jr'') and template = ''uncollected_final''', 1, 'uncollected_final enqueued');
select test.eq((select uncollected_notice_at is not null from public.jobs where id = test.id('jr')), true, 'job marked with the notice time');
select test.eq(public.flag_uncollected(), 0, 'idempotent');

\echo '--- worker: claim, complete, fail'
select test.as_a();
select test.raises($q$ select * from public.claim_notifications(10) $q$, 'members cannot claim', '%permission denied%');
select test.as_service();
create temp table claimed as select * from public.claim_notifications(100);
select test.eq((select count(*) from claimed) > 10, true, 'the worker claims the due rows');
select test.eq((select bool_and(status = 'sending' and attempts = 1) from public.notifications where id in (select id from claimed)), true, 'claimed rows are sending with attempts = 1');
select test.eq((select bool_and(length(token) = 22) from claimed where audience = 'customer'), true, 'customer rows carry a fresh 22-character token');
select test.eq((select bool_and(token is null) from claimed where audience = 'shop'), true, 'shop rows carry no token');
select test.eq((select public.job_by_token((select token from claimed where job_id = test.id('jq') and template = 'quote_sent')) ->> 'job' is not null), true,
  'the claimed token opens the status page');
select test.eq((select count(*) from public.claim_notifications(100)), 0::bigint, 'nothing left to claim');
select public.complete_notification((select id from claimed where template = 'item_received' and job_id = test.id('j1')), 'resend_abc');
select test.eq((select status::text from public.notifications where job_id = test.id('j1') and template = 'item_received'), 'sent', 'complete marks sent');
select test.eq((select provider_message_id from public.notifications where job_id = test.id('j1') and template = 'item_received'), 'resend_abc', 'and keeps the provider id');
select public.fail_notification((select id from claimed where template = 'ready_pickup' and job_id = test.id('j1')), 'Resend 500');
select test.eq((select status::text from public.notifications where job_id = test.id('j1') and template = 'ready_pickup'), 'failed', 'fail marks failed');
select test.eq((select next_attempt_at between now() + interval '50 seconds' and now() + interval '70 seconds' from public.notifications where job_id = test.id('j1') and template = 'ready_pickup'), true,
  'first retry in one minute');
update public.notifications set attempts = 6, next_attempt_at = now() - interval '1 hour' where job_id = test.id('j1') and template = 'ready_pickup';
select test.eq((select count(*) from public.claim_notifications(100) where template = 'ready_pickup'), 0::bigint, 'six attempts is a dead letter');

\echo '--- dedupe and tenancy'
select test.eq(public.enqueue_notification(test.id('shop_a'), test.id('j1'), 'status_update', 'customer', 'alice@example.com', 's', '{}', 'dup:1') is not null, true, 'first enqueue inserts');
select test.eq(public.enqueue_notification(test.id('shop_a'), test.id('j1'), 'status_update', 'customer', 'alice@example.com', 's', '{}', 'dup:1'), null::uuid, 'same dedupe key is skipped');
select test.eq(public.enqueue_notification(test.id('shop_a'), test.id('j1'), 'status_update', 'customer', null, 's', '{}', null), null::uuid, 'no address, no row');
select test.as_b();
select test.count('select * from public.notifications', 0, 'B sees none of A''s emails');
select test.as_a();
select test.eq((select count(*) from public.notifications) > 10, true, 'A sees their outbox');
select test.raises($q$ insert into public.notifications (shop_id, template, audience, to_email, subject) values (test.id('shop_a'), 'status_update', 'customer', 'x@example.com', 's') $q$,
  'members cannot insert', '%permission denied%');
select test.raises($q$ update public.notifications set status = 'sent' $q$, 'members cannot update', '%permission denied%');
select test.as_anon();
select test.raises($q$ select * from public.notifications $q$, 'anon cannot read the outbox', '%permission denied%');
select test.as_admin();
