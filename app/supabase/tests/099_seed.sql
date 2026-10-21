-- 099: the seed loads, is idempotent, and leaves the demo shop in the shape the app expects.
\ir ../seed.sql
\ir ../seed.sql
select test.as_admin();

\echo '--- seeded twice, counted once'
select test.count('select * from public.shops where slug = ''storm-proof-tackle''', 1, 'one demo shop');
select test.count('select * from public.services where shop_id = ''00000000-0000-4000-8000-00000000a001''', 10, 'ten services');
select test.count('select * from public.customers where shop_id = ''00000000-0000-4000-8000-00000000a001''', 3, 'three customers');
select test.count('select * from public.items where shop_id = ''00000000-0000-4000-8000-00000000a001''', 6, 'six items');
select test.count('select * from public.jobs where shop_id = ''00000000-0000-4000-8000-00000000a001''', 8, 'eight jobs');
select test.count('select * from public.quotes where status = ''sent''', 1, 'one sent quote');
select test.count('select * from public.payments', 2, 'two payments');
select test.count('select * from public.billing_periods', 1, 'one open billing period');
select test.count('select * from public.quote_lines', 3, 'quote lines not duplicated');

\echo '--- statuses'
select test.eq((select status::text from public.jobs where id = '00000000-0000-4000-8000-00000000e001'), 'quote_sent', 'job 1 waits on its quote');
select test.eq((select status::text from public.jobs where id = '00000000-0000-4000-8000-00000000e002'), 'in_progress', 'job 2 on the bench');
select test.eq((select status::text from public.jobs where id = '00000000-0000-4000-8000-00000000e003'), 'ready', 'job 3 ready');
select test.eq((select status::text from public.jobs where id = '00000000-0000-4000-8000-00000000e004'), 'waiting_parts', 'job 4 waiting for parts');
select test.eq((select status::text from public.jobs where id = '00000000-0000-4000-8000-00000000e005'), 'finishing', 'job 5 finishing');
select test.eq((select status::text from public.jobs where id = '00000000-0000-4000-8000-00000000e006'), 'closed', 'job 6 closed');
select test.eq((select status::text from public.jobs where id = '00000000-0000-4000-8000-00000000e007'), 'requested', 'job 7 requested');
select test.eq((select status::text from public.jobs where id = '00000000-0000-4000-8000-00000000e008'), 'cancelled', 'job 8 cancelled');
select test.eq((select count(distinct status) from public.jobs), 7::bigint, 'seven distinct statuses on the board');
select test.eq((select jobs_counted from public.billing_periods), 6, 'six jobs reached received this month (not the two requests)');

\echo '--- the demo tokens open status pages'
select test.as_anon();
select test.eq(public.job_by_token('SptDemoJob01TokenAAAAA') -> 'quote' ->> 'status', 'sent', 'job 1''s page shows the sent quote');
select test.eq((public.job_by_token('SptDemoJob01TokenAAAAA') -> 'quote' ->> 'total_cents')::integer, 9000, 'quote total 9,000');
select test.eq(public.job_by_token('SptDemoJob06TokenAAAAA') -> 'job' ->> 'closed_how', 'picked_up', 'job 6 picked up');
select test.eq((public.job_by_token('SptDemoJob04TokenAAAAA') -> 'balance' ->> 'deposits_cents')::integer, 15000, 'rod deposit on the balance');
select test.eq(public.public_shop('storm-proof-tackle') ->> 'name', 'Storm Proof Tackle', 'the public page is live');
select test.eq(jsonb_array_length(public.public_shop('storm-proof-tackle') -> 'services'), 10, 'with ten services');
select test.as_admin();
