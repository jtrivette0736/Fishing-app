-- 0003: quotes, lines, sending and deciding, offline payments and the balance.
\ir lib/fixtures.sql
select test.setup_two_shops();
select test.set('j1', (test.job_a() ->> 'id'));
select test.set('jb', (test.job_b() ->> 'id'));

\echo '--- draft quote and lines'
select test.as_a();
insert into public.quotes (id, job_id, note_to_customer) values ('44444444-0000-4000-8000-000000000001', test.id('j1'), 'Main gear is shot.');
select test.eq((select version from public.quotes where id = '44444444-0000-4000-8000-000000000001'), 1, 'first quote is version 1');
select test.eq((select status::text from public.quotes where id = '44444444-0000-4000-8000-000000000001'), 'draft', 'starts as draft');
select test.eq((select shop_id from public.quotes where id = '44444444-0000-4000-8000-000000000001'), test.id('shop_a'), 'shop_id filled from the job');
insert into public.quote_lines (quote_id, kind, description, qty, unit_cents, sort_order) values
  ('44444444-0000-4000-8000-000000000001', 'labor', 'Bench time', 2, 2500, 1),
  ('44444444-0000-4000-8000-000000000001', 'part', 'Main gear', 1, 1200, 2),
  ('44444444-0000-4000-8000-000000000001', 'discount', 'Loyalty', 1, -500, 3);
select test.eq((select subtotal_cents from public.quotes where id = '44444444-0000-4000-8000-000000000001'), 6200, 'subtotal excludes the discount');
select test.eq((select total_cents from public.quotes where id = '44444444-0000-4000-8000-000000000001'), 5700, 'total includes it');
select test.raises($q$ insert into public.quote_lines (quote_id, kind, description, unit_cents) values ('44444444-0000-4000-8000-000000000001', 'part', 'Negative part', -1) $q$,
  'only discount lines may be negative', '%quote_lines_sign%');
\echo '--- send_quote'
select test.raises($q$ select public.decide_quote('44444444-0000-4000-8000-000000000001', true) $q$, 'a draft cannot be decided', '%Only a sent quote%');
select public.send_quote('44444444-0000-4000-8000-000000000001');
select test.eq((select status::text from public.quotes where id = '44444444-0000-4000-8000-000000000001'), 'sent', 'quote is sent');
select test.eq((select expires_at between now() + interval '13 days' and now() + interval '15 days' from public.quotes where id = '44444444-0000-4000-8000-000000000001'), true,
  'expires in 14 days by default');
select test.eq((select status::text from public.jobs where id = test.id('j1')), 'quote_sent', 'job moved to quote_sent');
select test.raises($q$ insert into public.quote_lines (quote_id, kind, description, unit_cents) values ('44444444-0000-4000-8000-000000000001', 'part', 'Late', 100) $q$,
  'lines of a sent quote are frozen', '%already sent%');
select test.raises($q$ select public.send_quote('44444444-0000-4000-8000-000000000001') $q$, 'cannot send twice', '%already sent%');
update public.quotes set note_to_customer = 'edited' where id = '44444444-0000-4000-8000-000000000001';
select test.eq((select note_to_customer from public.quotes where id = '44444444-0000-4000-8000-000000000001'), 'Main gear is shot.', 'a sent quote is not editable by members');
delete from public.quotes where id = '44444444-0000-4000-8000-000000000001';
select test.count('select * from public.quotes where id = ''44444444-0000-4000-8000-000000000001''', 1, 'a sent quote cannot be deleted');

\echo '--- revision supersedes'
insert into public.quotes (id, job_id) values ('44444444-0000-4000-8000-000000000002', test.id('j1'));
select test.eq((select version from public.quotes where id = '44444444-0000-4000-8000-000000000002'), 2, 'second quote is version 2');
select test.raises($q$ select public.send_quote('44444444-0000-4000-8000-000000000002') $q$, 'an empty quote cannot be sent', '%at least one line%');
insert into public.quote_lines (quote_id, kind, description, unit_cents) values ('44444444-0000-4000-8000-000000000002', 'part', 'Main gear and pinion', 7000);
select public.send_quote('44444444-0000-4000-8000-000000000002', 7);
select test.eq((select status::text from public.quotes where id = '44444444-0000-4000-8000-000000000001'), 'superseded', 'version 1 is superseded');
select test.eq((select status::text from public.quotes where id = '44444444-0000-4000-8000-000000000002'), 'sent', 'version 2 is the current one');
select test.eq((select note from public.job_status_history where job_id = test.id('j1') order by id desc limit 1), 'Quote revised', 'the revision is logged');
select test.eq((select status::text from public.jobs where id = test.id('j1')), 'quote_sent', 'job stays quote_sent');

\echo '--- decide on behalf'
select public.decide_quote('44444444-0000-4000-8000-000000000002', true, 'Approved by phone');
select test.eq((select status::text from public.quotes where id = '44444444-0000-4000-8000-000000000002'), 'approved', 'quote approved');
select test.eq((select decided_via from public.quotes where id = '44444444-0000-4000-8000-000000000002'), 'shop_on_behalf', 'recorded as on behalf');
select test.eq((select status::text from public.jobs where id = test.id('j1')), 'approved', 'job approved');

\echo '--- balance'
select test.eq((select balance_cents from public.job_balances where job_id = test.id('j1')), 10000, 'balance = service 3000 + approved quote 7000');
select test.eq((select quote_cents from public.job_balances where job_id = test.id('j1')), 7000, 'only the approved quote counts');
select public.record_offline_payment(test.id('j1'), 2000, 'cash', 'deposit', 'Cash at drop-off');
select test.eq((select deposits_cents from public.job_balances where job_id = test.id('j1')), 2000, 'deposit recorded');
select test.eq((select balance_cents from public.job_balances where job_id = test.id('j1')), 8000, 'balance after deposit');
select public.record_offline_payment(test.id('j1'), 8000, 'check');
select test.eq((select balance_cents from public.job_balances where job_id = test.id('j1')), 0, 'paid in full');
select test.eq((public.job_balance(test.id('j1')) ->> 'paid_cents')::integer, 8000, 'job_balance() agrees');
update public.jobs set delivery = 'ship' where id = test.id('j1');
select test.as_admin();
update public.shops set return_shipping_cents = 1350 where id = test.id('shop_a');
select test.as_a();
select test.eq((select balance_cents from public.job_balances where job_id = test.id('j1')), 1350, 'shipping is added when the job ships');

\echo '--- payment rules'
select test.raises($q$ select public.record_offline_payment(test.id('j1'), 100, 'card') $q$, 'cards are not recorded by hand', '%Stripe%');
select test.raises($q$ select public.record_offline_payment(test.id('j1'), 0, 'cash') $q$, 'zero amount refused', '%above zero%');
select test.raises($q$ insert into public.payments (shop_id, job_id, purpose, method, amount_cents) values (test.id('shop_a'), test.id('j1'), 'balance', 'cash', 1) $q$,
  'members cannot insert payments directly', '%permission denied%');
select test.raises($q$ update public.payments set amount_cents = 1 $q$, 'members cannot edit payments', '%permission denied%');
select test.count('select * from public.payments', 2, 'A sees their two payments');

\echo '--- tenancy'
select test.as_b();
select test.count('select * from public.quotes', 0, 'B sees no quotes of A');
select test.count('select * from public.quote_lines', 0, 'nor lines');
select test.count('select * from public.payments', 0, 'nor payments');
select test.count('select * from public.job_balances', 1, 'B sees only their own balance row');
select test.raises($q$ insert into public.quotes (job_id) values (test.id('j1')) $q$, 'B cannot quote A''s job', '%No such job%');
select test.raises($q$ select public.record_offline_payment(test.id('j1'), 100, 'cash') $q$, 'B cannot record a payment on A''s job', '%No such job%');
select test.raises($q$ select public.send_quote('44444444-0000-4000-8000-000000000002') $q$, 'B cannot send A''s quote', '%No such quote%');
select test.as_anon();
select test.raises($q$ select * from public.job_balances $q$, 'anon cannot read balances', '%permission denied%');
select test.as_admin();
