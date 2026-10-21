-- 0006: the anon surface (job_by_token, quote decisions, public requests, find_job) and the
-- member RPCs for tokens, PII deletion and exports. Also proves anon can execute nothing else.
\ir lib/fixtures.sql
select test.setup_two_shops();
select test.set('created', test.job_a()::text);
select test.set('j1', test.v('created')::jsonb ->> 'id');
select test.set('t1', test.v('created')::jsonb ->> 'token');
select test.set('code1', (select short_code from public.jobs where id = test.id('j1')));

\echo '--- job_by_token'
select test.as_anon();
select test.set('view', public.job_by_token(test.v('t1'))::text);
select test.eq(test.v('view') is not null, true, 'a valid token returns the page');
select test.eq(test.v('view')::jsonb -> 'job' ->> 'status', 'received', 'with the status');
select test.eq(test.v('view')::jsonb -> 'job' ->> 'short_code', test.v('code1'), 'and the short code');
select test.eq(test.v('view')::jsonb -> 'customer' ->> 'first_name', 'Alice', 'first name only');
select test.eq(test.v('view')::jsonb -> 'customer' ? 'email', false, 'no customer email');
select test.eq(test.v('view')::jsonb -> 'job' ? 'shop_notes', false, 'no internal notes');
select test.eq(test.v('view')::jsonb -> 'job' ? 'id', false, 'no job id');
select test.eq(test.v('view')::jsonb -> 'shop' ->> 'name', 'Shop A', 'shop contact');
select test.eq((test.v('view')::jsonb -> 'shop' -> 'pay_enabled')::boolean, false, 'pay button off until Stripe is connected');
select test.eq(jsonb_array_length(test.v('view')::jsonb -> 'history'), 1, 'history so far');
select test.eq(test.v('view')::jsonb -> 'quote', 'null'::jsonb, 'no quote yet');
select test.eq((test.v('view')::jsonb -> 'balance' ->> 'balance_cents')::integer, 3000, 'balance is the service price');
select test.eq(public.job_by_token('wrongwrongwrongwrongww'), null::jsonb, 'a wrong token is null');
select test.eq(public.job_by_token('short'), null::jsonb, 'a malformed token is null');
select test.eq(public.job_by_token(null), null::jsonb, 'a null token is null');
select test.as_admin();
select test.count('select * from public.token_access_log where outcome = ''hit''', 1, 'the hit was logged');
select test.count('select * from public.token_access_log where outcome = ''miss''', 3, 'and the three misses');

\echo '--- rotated token (hard): old links die'
select test.as_a();
select test.set('t2', public.rotate_job_token(test.id('j1')));
select test.eq(length(test.v('t2')), 22, 'rotate returns a new raw token');
select test.count('select * from public.notifications where job_id = test.id(''j1'') and template = ''links_resent''', 1, 'and emails the customer');
select test.as_anon();
select test.eq(public.job_by_token(test.v('t1')), null::jsonb, 'the old token no longer works');
select test.eq(public.job_by_token(test.v('t2')) is not null, true, 'the new one does');
select test.as_b();
select test.raises($q$ select public.rotate_job_token(test.id('j1')) $q$, 'B cannot rotate A''s token', '%No such job%');

\echo '--- find_job issues a fresh token and keeps the previous one alive'
select test.as_anon();
select set_config('request.headers', '{"x-forwarded-for": "203.0.113.5"}', true);
select test.set('t3', public.find_job('shop-a', test.v('code1'), 'alice@example.com') ->> 'token');
select test.eq(length(test.v('t3')), 22, 'short code + email finds the job');
select test.eq(public.job_by_token(test.v('t3')) is not null, true, 'the new token works');
select test.eq(public.job_by_token(test.v('t2')) is not null, true, 'the previous link still works');
select test.eq(public.job_by_token(test.v('t1')), null::jsonb, 'but the one before that is gone');
select test.eq(public.find_job('shop-a', lower(test.v('code1')) || ' ', '(757) 555-0101') is not null, true, 'phone and sloppy code work too');
select test.eq(public.find_job('shop-a', test.v('code1'), 'bob@example.com'), null::jsonb, 'wrong contact: null');
select test.eq(public.find_job('shop-a', 'ZZZZZZ', 'alice@example.com'), null::jsonb, 'wrong code: null');
select test.eq(public.find_job('no-shop', test.v('code1'), 'alice@example.com'), null::jsonb, 'unknown shop: null');
select test.eq(public.find_job('shop-a', test.v('code1'), '0101'), null::jsonb, 'too little contact: null');

\echo '--- expired token'
select test.as_service();
update public.jobs set token_expires_at = now() - interval '1 second' where id = test.id('j1');
select test.as_anon();
select test.eq(public.job_by_token(test.v('t3')), null::jsonb, 'an expired token is null');
select test.as_admin();
select test.count('select * from public.token_access_log where outcome = ''expired''', 1, 'logged as expired');
select test.as_service();
update public.jobs set token_expires_at = null where id = test.id('j1');

\echo '--- approve and decline by token'
select test.as_a();
insert into public.quotes (id, job_id, note_to_customer) values ('44444444-0000-4000-8000-000000000021', test.id('j1'), 'Needs a main gear');
insert into public.quote_lines (quote_id, kind, description, unit_cents) values ('44444444-0000-4000-8000-000000000021', 'part', 'Main gear', 4200);
select test.as_anon();
select test.raises($q$ select public.approve_quote_by_token(test.v('t3')) $q$, 'nothing to approve before the quote is sent', '%no quote waiting%');
select test.as_a();
select public.send_quote('44444444-0000-4000-8000-000000000021');
select test.as_anon();
select test.eq(public.job_by_token(test.v('t3')) -> 'quote' ->> 'status', 'sent', 'the customer sees the sent quote');
select test.eq(jsonb_array_length(public.job_by_token(test.v('t3')) -> 'quote' -> 'lines'), 1, 'with its lines');
select test.raises($q$ select public.approve_quote_by_token('wrongwrongwrongwrongww') $q$, 'a wrong token cannot approve', '%not valid%');
select test.set('after', public.approve_quote_by_token(test.v('t3'), 'Go ahead')::text);
select test.eq(test.v('after')::jsonb -> 'job' ->> 'status', 'approved', 'job is approved');
select test.eq(test.v('after')::jsonb -> 'quote' ->> 'status', 'approved', 'quote is approved');
select test.eq((test.v('after')::jsonb -> 'balance' ->> 'balance_cents')::integer, 7200, 'balance includes the approved quote');
select test.as_admin();
select test.eq((select decided_via from public.quotes where id = '44444444-0000-4000-8000-000000000021'), 'token_page', 'decided on the token page');
select test.eq((select decision_note from public.quotes where id = '44444444-0000-4000-8000-000000000021'), 'Go ahead', 'with the note');
select test.eq((select actor::text from public.job_status_history where job_id = test.id('j1') order by id desc limit 1), 'customer', 'history actor is the customer');
select test.eq((select note from public.job_status_history where job_id = test.id('j1') order by id desc limit 1), 'Go ahead', 'and carries the note');
select test.as_anon();
select test.raises($q$ select public.approve_quote_by_token(test.v('t3')) $q$, 'cannot approve twice', '%no quote waiting%');

select test.set('created2', test.job_a('item_a2_reel', 'cust_a2')::text);
select test.set('j2', test.v('created2')::jsonb ->> 'id');
select test.set('tj2', test.v('created2')::jsonb ->> 'token');
select test.as_a();
insert into public.quotes (id, job_id) values ('44444444-0000-4000-8000-000000000022', test.id('j2'));
insert into public.quote_lines (quote_id, kind, description, unit_cents) values ('44444444-0000-4000-8000-000000000022', 'labor', 'Rebuild', 9900);
select public.send_quote('44444444-0000-4000-8000-000000000022');
select test.as_anon();
select test.eq(public.decline_quote_by_token(test.v('tj2'), 'Too much for this reel') -> 'job' ->> 'status', 'declined', 'decline moves the job to declined');
select test.as_admin();
select test.eq((select status::text from public.quotes where id = '44444444-0000-4000-8000-000000000022'), 'declined', 'quote declined');

\echo '--- expired quote'
select test.set('created3', test.job_a()::text);
select test.set('j3', test.v('created3')::jsonb ->> 'id');
select test.set('tj3', test.v('created3')::jsonb ->> 'token');
select test.as_a();
insert into public.quotes (id, job_id) values ('44444444-0000-4000-8000-000000000023', test.id('j3'));
insert into public.quote_lines (quote_id, kind, description, unit_cents) values ('44444444-0000-4000-8000-000000000023', 'labor', 'Rebuild', 100);
select public.send_quote('44444444-0000-4000-8000-000000000023');
select test.as_admin();
update public.quotes set expires_at = now() - interval '1 day' where id = '44444444-0000-4000-8000-000000000023';
select test.as_anon();
select test.raises($q$ select public.approve_quote_by_token(test.v('tj3')) $q$, 'an expired quote cannot be approved', '%expired%');
select test.eq(public.job_by_token(test.v('tj3')) -> 'quote' ->> 'status', 'expired', 'the status page reads it as expired');
select test.as_service();
select test.eq(public.expire_quotes(), 1, 'expire_quotes() marks it');
select test.as_admin();
select test.eq((select status::text from public.quotes where id = '44444444-0000-4000-8000-000000000023'), 'expired', 'and it is stored as expired');

\echo '--- create_public_request'
select test.as_anon();
select set_config('request.headers', '{"x-forwarded-for": "198.51.100.7, 10.0.0.1"}', true);
select test.set('req', public.create_public_request('shop-a', 'reel', test.id('svc_a_reel'), 'Shimano', 'Saragosa 6000', 'SG6-001',
  'Drag is jerky', 'Nora', 'Newcomer', 'Nora@Example.com', '757-555-0199', 'ship')::text);
select test.eq(length(test.v('req')::jsonb ->> 'token'), 22, 'returns a token');
select test.eq((test.v('req')::jsonb ->> 'short_code') ~ '^[ABCDEFGHJKLMNPQRSTUVWXYZ23456789]{6}$', true, 'and a short code');
select test.eq((test.v('req')::jsonb ->> 'deposit_due_cents')::integer, 0, 'no deposit on a priced reel service');
select test.eq(public.job_by_token(test.v('req')::jsonb ->> 'token') -> 'job' ->> 'status', 'requested', 'the job is requested');
select test.as_admin();
select test.count('select * from public.customers where shop_id = test.id(''shop_a'') and email = ''nora@example.com''', 1, 'customer created (email lowercased)');
select test.eq((select source::text from public.jobs where short_code = test.v('req')::jsonb ->> 'short_code' and shop_id = test.id('shop_a')), 'public_page', 'source is public_page');
select test.eq((select actor::text from public.job_status_history h join public.jobs j on j.id = h.job_id where j.short_code = test.v('req')::jsonb ->> 'short_code' and j.shop_id = test.id('shop_a')), 'customer', 'history actor is the customer');
select test.count('select * from public.notifications where template = ''intake_received'' and to_email = ''nora@example.com''', 1, 'intake_received queued');
select test.count('select * from public.notifications where template = ''new_request'' and to_email = ''hello-a@example.com''', 1, 'new_request queued for the shop');
select test.count('select * from public.usage_events u join public.jobs j on j.id = u.job_id where j.source = ''public_page''', 0, 'a request is not counted until received');
select test.as_anon();
select test.set('req2', public.create_public_request('shop-a', 'rod', test.id('svc_a_rod_fixed'), 'St. Croix', 'Mojo', null,
  'Replace tip top', 'Nora', null, 'nora@example.com', null, 'pickup')::text);
select test.eq((test.v('req2')::jsonb ->> 'deposit_due_cents')::integer, 2000, 'fixed deposit from the service');
select test.as_admin();
select test.count('select * from public.customers where shop_id = test.id(''shop_a'') and email = ''nora@example.com''', 1, 'second request reuses the customer');
select test.as_anon();
select test.raises($q$ select public.create_public_request('shop-a', 'reel', null, 'Penn', null, null, 'Broken', '', null, 'x@example.com', null) $q$, 'first name required', '%first name%');
select test.raises($q$ select public.create_public_request('shop-a', 'reel', null, 'Penn', null, null, 'Broken', 'X', null, 'not-an-email', null) $q$, 'valid email required', '%valid email%');
select test.raises($q$ select public.create_public_request('shop-a', 'reel', null, '', null, null, 'Broken', 'X', null, 'x@example.com', null) $q$, 'brand required', '%brand%');
select test.raises($q$ select public.create_public_request('shop-a', 'reel', null, 'Penn', null, null, repeat('x', 2001), 'X', null, 'x@example.com', null) $q$, 'problem too long', '%2,000%');
select test.raises($q$ select public.create_public_request('shop-a', 'reel', test.id('svc_a_rod'), 'Penn', null, null, 'Broken', 'X', null, 'x@example.com', null) $q$, 'service must match kind', '%menu%');
select test.raises($q$ select public.create_public_request('shop-b', 'reel', null, 'Penn', null, null, 'Broken', 'X', null, 'x@example.com', null) $q$, 'unpublished shop', '%no shop%');
select test.raises($q$ select public.create_public_request('nope', 'reel', null, 'Penn', null, null, 'Broken', 'X', null, 'x@example.com', null) $q$, 'unknown shop', '%no shop%');

\echo '--- rate limits'
select set_config('request.headers', '{"x-forwarded-for": "192.0.2.44"}', true);
select public.create_public_request('shop-a', 'reel', null, 'Penn', null, null, 'Broken', 'R', null, 'r1@example.com', null);
select public.create_public_request('shop-a', 'reel', null, 'Penn', null, null, 'Broken', 'R', null, 'r2@example.com', null);
select public.create_public_request('shop-a', 'reel', null, 'Penn', null, null, 'Broken', 'R', null, 'r3@example.com', null);
select public.create_public_request('shop-a', 'reel', null, 'Penn', null, null, 'Broken', 'R', null, 'r4@example.com', null);
select public.create_public_request('shop-a', 'reel', null, 'Penn', null, null, 'Broken', 'R', null, 'r5@example.com', null);
select test.raises($q$ select public.create_public_request('shop-a', 'reel', null, 'Penn', null, null, 'Broken', 'R', null, 'r6@example.com', null) $q$,
  'sixth request from one network in an hour is refused', '%Too many requests%');
select set_config('request.headers', '{"x-forwarded-for": "192.0.2.45"}', true);
select public.create_public_request('shop-a', 'reel', null, 'Penn', null, null, 'Broken', 'S', null, 'same@example.com', null);
select set_config('request.headers', '{"x-forwarded-for": "192.0.2.46"}', true);
select public.create_public_request('shop-a', 'reel', null, 'Penn', null, null, 'Broken', 'S', null, 'same@example.com', null);
select set_config('request.headers', '{"x-forwarded-for": "192.0.2.47"}', true);
select public.create_public_request('shop-a', 'reel', null, 'Penn', null, null, 'Broken', 'S', null, 'same@example.com', null);
select set_config('request.headers', '{"x-forwarded-for": "192.0.2.48"}', true);
select test.raises($q$ select public.create_public_request('shop-a', 'reel', null, 'Penn', null, null, 'Broken', 'S', null, 'same@example.com', null) $q$,
  'fourth request from one email in a day is refused', '%several requests today%');
select test.as_admin();
select test.eq((select count(*) from public.rate_limits where key like 'intake:ip:%') >= 5, true, 'rate_limits rows are per network and shop');
select test.as_service();
update public.shops set billing_status = 'read_only' where id = test.id('shop_a');
select test.as_anon();
select set_config('request.headers', '{"x-forwarded-for": "192.0.2.99"}', true);
select test.raises($q$ select public.create_public_request('shop-a', 'reel', null, 'Penn', null, null, 'Broken', 'X', null, 'ro@example.com', null) $q$,
  'a read_only shop takes no requests', '%not taking new requests%');
select test.as_service();
update public.shops set billing_status = 'ok' where id = test.id('shop_a');

\echo '--- delete_customer_pii keeps the history'
select test.as_b();
select test.raises($q$ select public.delete_customer_pii(test.id('cust_a')) $q$, 'B cannot delete A''s customer', '%No such customer%');
select test.as_a();
select test.set('jobs_before', (select count(*) from public.jobs where customer_id = test.id('cust_a'))::text);
select test.set('hist_before', (select count(*) from public.job_status_history h join public.jobs j on j.id = h.job_id where j.customer_id = test.id('cust_a'))::text);
select public.delete_customer_pii(test.id('cust_a'));
select test.eq((select first_name from public.customers where id = test.id('cust_a')), 'Deleted', 'name replaced');
select test.eq((select email is null and phone is null and last_name is null from public.customers where id = test.id('cust_a')), true, 'contact fields nulled');
select test.eq((select pii_deleted_at is not null from public.customers where id = test.id('cust_a')), true, 'marked');
select test.eq((select count(*) from public.jobs where customer_id = test.id('cust_a'))::text, test.v('jobs_before'), 'jobs kept');
select test.eq((select count(*) from public.job_status_history h join public.jobs j on j.id = h.job_id where j.customer_id = test.id('cust_a'))::text, test.v('hist_before'), 'history kept');
select test.count('select * from public.notifications n join public.jobs j on j.id = n.job_id where j.customer_id = test.id(''cust_a'') and n.audience = ''customer'' and n.to_email <> ''redacted@invalid''', 0,
  'their emails are redacted');
select test.count('select * from public.notifications n join public.jobs j on j.id = n.job_id where j.customer_id = test.id(''cust_a'') and n.audience = ''customer'' and n.status = ''pending''', 0,
  'and pending ones cancelled');
select test.as_anon();
select test.eq(public.job_by_token(test.v('t3')) -> 'customer' ->> 'first_name', null::text, 'the status page shows no name');
select test.eq(public.find_job('shop-a', test.v('code1'), 'alice@example.com'), null::jsonb, 'find_job no longer matches the deleted contact');

\echo '--- export_shop_csv'
select test.as_a();
select test.eq(split_part(public.export_shop_csv(test.id('shop_a'), 'jobs'), E'\n', 1) like 'id,job_number,short_code,%', true, 'jobs CSV has a header');
select test.eq(array_length(string_to_array(public.export_shop_csv(test.id('shop_a'), 'jobs'), E'\n'), 1) - 1, (select count(*)::integer from public.jobs where shop_id = test.id('shop_a')), 'one line per job');
select test.eq(position('bob@example.com' in public.export_shop_csv(test.id('shop_a'), 'customers')), 0, 'customers CSV has no other shop''s customers');
select test.eq(position('nora@example.com' in public.export_shop_csv(test.id('shop_a'), 'customers')) > 0, true, 'and has A''s customers');
select test.eq(position('"Needs a main gear"' in public.export_shop_csv(test.id('shop_a'), 'quotes')) > 0, true, 'quotes CSV quotes text');
select test.eq(split_part(public.export_shop_csv(test.id('shop_a'), 'payments'), E'\n', 1), 'id,job_id,purpose,method,status,amount_cents,refunded_cents,paid_at,note', 'payments header');
select test.eq(split_part(public.export_shop_csv(test.id('shop_a'), 'items'), E'\n', 1) like 'id,customer_id,kind,%', true, 'items header');
select test.raises($q$ select public.export_shop_csv(test.id('shop_b'), 'jobs') $q$, 'A cannot export shop B', '%not a member%');
select test.raises($q$ select public.export_shop_csv(test.id('shop_a'), 'secrets') $q$, 'unknown kind refused', '%Export one of%');

\echo '--- anon may execute exactly the public RPCs and nothing else'
select test.eq((
  select string_agg(p.proname, ',' order by p.proname)
  from pg_proc p join pg_namespace n on n.oid = p.pronamespace
  where n.nspname = 'public' and has_function_privilege('anon', p.oid, 'execute')
), 'approve_quote_by_token,create_public_request,decline_quote_by_token,find_job,job_by_token,public_shop', 'anon execute list');
select test.eq((
  select count(*) from pg_tables t
  where t.schemaname = 'public' and (
    has_table_privilege('anon', format('%I.%I', t.schemaname, t.tablename), 'select') or
    has_table_privilege('anon', format('%I.%I', t.schemaname, t.tablename), 'insert') or
    has_table_privilege('anon', format('%I.%I', t.schemaname, t.tablename), 'update') or
    has_table_privilege('anon', format('%I.%I', t.schemaname, t.tablename), 'delete'))
), 0::bigint, 'anon has no table privileges');
select test.eq((select count(*) from pg_views v where v.schemaname = 'public' and has_table_privilege('anon', format('%I.%I', v.schemaname, v.viewname), 'select')), 0::bigint,
  'anon has no view privileges');
select test.eq((select count(*) from pg_policies where schemaname = 'public' and 'anon' = any(roles)), 0::bigint, 'no anon policies on any table');
select test.eq((select count(*) from pg_tables t where t.schemaname = 'public' and not t.rowsecurity), 0::bigint, 'every public table has RLS enabled');
select test.as_anon();
select test.raises($q$ select * from public.rate_limits $q$, 'anon cannot read rate_limits', '%permission denied%');
select test.raises($q$ select * from public.token_access_log $q$, 'anon cannot read the access log', '%permission denied%');
select test.as_a();
select test.raises($q$ select * from public.rate_limits $q$, 'members cannot read rate_limits', '%permission denied%');
select test.raises($q$ select * from public.token_access_log $q$, 'members cannot read the access log', '%permission denied%');
select test.as_admin();
