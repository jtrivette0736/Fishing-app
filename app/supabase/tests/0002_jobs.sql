-- 0002: customers, items, jobs, short codes, the status machine and its history.
\ir lib/fixtures.sql
select test.setup_two_shops();

\echo '--- create_job'
select test.set('j1', (test.job_a() ->> 'id'));
select test.as_a();
select test.eq((select job_number from public.jobs where id = test.id('j1')), 1, 'first job is #1');
select test.eq((select short_code ~ '^[ABCDEFGHJKLMNPQRSTUVWXYZ23456789]{6}$' from public.jobs where id = test.id('j1')), true,
  'short code is 6 characters from the unambiguous alphabet');
select test.eq((select status::text from public.jobs where id = test.id('j1')), 'received', 'counter jobs start received');
select test.eq((select received_at is not null from public.jobs where id = test.id('j1')), true, 'received_at stamped');
select test.eq((select kind::text from public.jobs where id = test.id('j1')), 'reel', 'kind copied from the item');
select test.eq((select service_price_cents from public.jobs where id = test.id('j1')), 3000, 'service price copied from the menu');
select test.eq((select source::text from public.jobs where id = test.id('j1')), 'counter', 'source is counter');
select test.set('j2', (test.job_a('item_a_rod', 'cust_a', 'svc_a_rod') ->> 'id'));
select test.eq((select job_number from public.jobs where id = test.id('j2')), 2, 'second job is #2');
select test.eq(length(test.job_a() ->> 'token'), 22, 'the raw token is 22 characters (16 bytes)');
select test.count('select * from public.jobs', 3, 'A sees their three jobs');

\echo '--- history'
select test.count('select * from public.job_status_history where job_id = test.id(''j1'')', 1, 'one history row at creation');
select test.eq((select from_status is null and to_status = 'received' from public.job_status_history where job_id = test.id('j1')), true,
  'it records null -> received');
select test.eq((select actor::text from public.job_status_history where job_id = test.id('j1')), 'shop', 'actor is the shop');
select test.eq((select actor_user_id from public.job_status_history where job_id = test.id('j1')), test.id('user_a'), 'by owner A');

\echo '--- transitions: legal'
select public.transition_job(test.id('j1'), 'diagnosing');
select test.eq((select status::text from public.jobs where id = test.id('j1')), 'diagnosing', 'reel: received -> diagnosing');
select public.transition_job(test.id('j1'), 'quote_sent', 'Needs a main gear', true);
select test.eq((select note from public.job_status_history where job_id = test.id('j1') order by id desc limit 1), 'Needs a main gear',
  'the note is logged');
select test.eq((select customer_visible from public.job_status_history where job_id = test.id('j1') order by id desc limit 1), true,
  'and its visibility');
select public.transition_job(test.id('j1'), 'approved');
select public.transition_job(test.id('j1'), 'in_progress');
select public.transition_job(test.id('j1'), 'waiting_parts');
select public.transition_job(test.id('j1'), 'in_progress');
select public.transition_job(test.id('j1'), 'finishing');
select public.transition_job(test.id('j1'), 'ready');
select test.eq((select ready_at is not null from public.jobs where id = test.id('j1')), true, 'ready_at stamped');
select test.count('select * from public.job_status_history where job_id = test.id(''j1'')', 9, 'every move is one history row');

\echo '--- transitions: illegal'
select test.raises($q$ select public.transition_job(test.id('j1'), 'closed') $q$, 'closing needs closed_how', '%Say how%');
select test.raises($q$ select public.transition_job(test.id('j1'), 'diagnosing') $q$, 'ready cannot go back to diagnosing', '%can''t go from ready to diagnosing%');
select test.raises($q$ select public.transition_job(test.id('j2'), 'diagnosing') $q$, 'rod: diagnosing is not allowed', '%rod job can''t go%');
select test.raises($q$ select public.transition_job(test.id('j2'), 'closed', null, false, 'picked_up') $q$, 'received cannot close', '%can''t go%');
select public.transition_job(test.id('j2'), 'waiting_parts');
select test.eq((select status::text from public.jobs where id = test.id('j2')), 'waiting_parts', 'rod: received -> waiting_parts');
select public.transition_job(test.id('j1'), 'closed', 'Picked up by Alice', false, 'picked_up');
select test.eq((select closed_how::text from public.jobs where id = test.id('j1')), 'picked_up', 'closed with how');
select test.eq((select closed_at is not null from public.jobs where id = test.id('j1')), true, 'closed_at stamped');
select test.raises($q$ select public.transition_job(test.id('j1'), 'in_progress') $q$, 'closed is final', '%final%');
select test.raises($q$ select public.transition_job(test.id('j1'), 'cancelled') $q$, 'closed cannot be cancelled', '%final%');

\echo '--- status is RPC-only'
select test.raises($q$ update public.jobs set status = 'ready' where id = test.id('j2') $q$, 'members cannot set status directly', '%permission denied%');
select test.raises($q$ update public.jobs set token_hash = '\x00' where id = test.id('j2') $q$, 'members cannot touch token_hash', '%permission denied%');
select test.raises($q$ update public.jobs set job_number = 99 where id = test.id('j2') $q$, 'members cannot renumber', '%permission denied%');
update public.jobs set promised_date = current_date + 30, shop_notes = 'Blank on order' where id = test.id('j2');
select test.eq((select promised_date from public.jobs where id = test.id('j2')), current_date + 30, 'members edit promised_date');
select test.raises($q$ insert into public.jobs (shop_id, customer_id, item_id, source, token_hash) values (test.id('shop_a'), test.id('cust_a'), test.id('item_a_reel'), 'counter', '\x00') $q$,
  'members cannot insert jobs directly', '%permission denied%');
select test.raises($q$ insert into public.job_status_history (job_id, shop_id, to_status, actor) values (test.id('j2'), test.id('shop_a'), 'ready', 'shop') $q$,
  'members cannot write history', '%permission denied%');
select test.raises($q$ update public.job_status_history set note = 'x' $q$, 'history is append-only', '%permission denied%');

\echo '--- add_job_update'
select public.add_job_update(test.id('j2'), 'Blank arrived, wrapping next week', true);
select test.eq((select from_status = to_status from public.job_status_history where job_id = test.id('j2') order by id desc limit 1), true,
  'a note keeps the status');
select test.raises($q$ select public.add_job_update(test.id('j2'), '   ') $q$, 'empty note refused', '%Write a note%');

\echo '--- tenancy'
select test.as_b();
select test.count('select * from public.jobs', 0, 'B sees none of A''s jobs');
select test.count('select * from public.job_status_history', 0, 'nor their history');
select test.count('select * from public.customers', 1, 'B sees only Bob');
select test.count('select * from public.items', 1, 'and Bob''s item');
select test.raises($q$ select public.transition_job(test.id('j2'), 'in_progress') $q$, 'B cannot move A''s job', '%No such job%');
select test.raises($q$ select public.create_job(test.id('shop_a'), test.id('cust_a'), test.id('item_a_reel')) $q$, 'B cannot create in shop A', '%not a member%');
select test.raises($q$ insert into public.customers (shop_id, first_name) values (test.id('shop_a'), 'Mallory') $q$, 'B cannot add A''s customers', '%row-level security%');
select test.raises($q$ insert into public.items (shop_id, customer_id, kind) values (test.id('shop_b'), test.id('cust_a'), 'reel') $q$,
  'B cannot attach an item to A''s customer', '%row-level security%');
update public.jobs set promised_date = current_date where id = test.id('j2');
select test.as_admin();
select test.eq((select promised_date from public.jobs where id = test.id('j2')), current_date + 30, 'B''s update of A''s job matched nothing');

\echo '--- job integrity'
select test.as_a();
select test.raises($q$ select public.create_job(test.id('shop_a'), test.id('cust_a2'), test.id('item_a_reel')) $q$,
  'item must belong to the customer', '%different customer%');
select test.raises($q$ select public.create_job(test.id('shop_a'), test.id('cust_a'), test.id('item_a_reel'), test.id('svc_a_rod')) $q$,
  'service kind must match the item', '%not on this shop''s menu for a reel%');
select test.raises($q$ select public.create_job(test.id('shop_a'), test.id('cust_a'), test.id('item_a_reel'), null, null, current_date - 10) $q$,
  'promised date cannot be in the past', '%in the past%');
delete from public.services where id = test.id('svc_a_reel');
select test.as_admin();
select test.count('select * from public.services where id = test.id(''svc_a_reel'')', 1, 'a service with jobs cannot be deleted');

\echo '--- short codes'
select test.eq((select bool_and(public.gen_short_code() ~ '^[ABCDEFGHJKLMNPQRSTUVWXYZ23456789]{6}$') from generate_series(1, 200)), true,
  '200 generated codes all use the alphabet');
select test.eq((select count(distinct public.gen_short_code()) from generate_series(1, 200)) > 190, true, 'and are random');
select test.as_service();
select test.raises($q$ insert into public.jobs (shop_id, customer_id, item_id, source, status, short_code)
  values (test.id('shop_a'), test.id('cust_a'), test.id('item_a_reel'), 'counter', 'received', (select short_code from public.jobs where id = test.id('j1'))) $q$,
  'a duplicate short code in the same shop is refused', '%jobs_shop_id_short_code_key%');
insert into public.jobs (shop_id, customer_id, item_id, source, status, short_code)
  values (test.id('shop_b'), test.id('cust_b'), test.id('item_b_reel'), 'counter', 'received', (select short_code from public.jobs where id = test.id('j1')));
select test.count('select * from public.jobs where short_code = (select short_code from public.jobs where id = test.id(''j1''))', 2,
  'the same code may exist in another shop');
select test.eq((select count(*) from public.job_status_transitions), 58::bigint, '58 transition rows (26 x 2 kinds + 6 reel-only)');

\echo '--- generated columns and anon'
select test.eq((select phone_digits from public.customers where id = test.id('cust_a')), '7575550101', 'phone_digits strips formatting');
select test.as_anon();
select test.raises($q$ select * from public.jobs $q$, 'anon cannot read jobs', '%permission denied%');
select test.raises($q$ select * from public.customers $q$, 'anon cannot read customers', '%permission denied%');
select test.raises($q$ select * from public.job_status_transitions $q$, 'anon cannot read transitions', '%permission denied%');
select test.raises($q$ select public.create_job(test.id('shop_a'), test.id('cust_a'), test.id('item_a_reel')) $q$, 'anon cannot create jobs', '%permission denied%');
select test.as_admin();
