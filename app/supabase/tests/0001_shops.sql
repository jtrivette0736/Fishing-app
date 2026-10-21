-- 0001: enums, shops, members, pages, services: who sees and changes what.
\ir lib/fixtures.sql
select test.setup_two_shops();

\echo '--- enums'
select test.eq((select count(*) from pg_type t join pg_namespace n on n.oid = t.typnamespace
  where n.nspname = 'public' and t.typtype = 'e'), 19::bigint, '19 enums exist');
select test.eq((select count(*) from pg_enum e join pg_type t on t.oid = e.enumtypid where t.typname = 'job_status'), 12::bigint,
  'job_status has 12 values');
select test.eq((select count(*) from pg_enum e join pg_type t on t.oid = e.enumtypid where t.typname = 'notification_template'), 27::bigint,
  'notification_template has every bold name in PD §5');

\echo '--- create_shop'
select test.as_a();
select test.raises($q$ select public.create_shop('Bad', 'Bad Slug!') $q$, 'bad slug is refused', '%lowercase letters%');
select test.raises($q$ select public.create_shop('Dup', 'shop-b') $q$, 'duplicate slug is refused', '%taken%');
select test.raises($q$ select public.create_shop('', 'empty-name') $q$, 'empty name is refused', '%name%');
select test.as_anon();
select test.raises($q$ select public.create_shop('Anon', 'anon-shop') $q$, 'anon cannot create a shop', '%permission denied%');

\echo '--- shops: member A'
select test.as_a();
select test.count('select * from public.shops', 1, 'A sees exactly one shop');
select test.eq((select slug::text from public.shops), 'shop-a', 'and it is shop-a');
update public.shops set name = 'Shop A Renamed', closed_until = current_date + 10, closed_message = 'Back soon' where id = test.id('shop_a');
select test.eq((select name from public.shops where id = test.id('shop_a')), 'Shop A Renamed', 'A can rename their shop');
select test.count('select * from pg_trigger where tgname = ''shops_set_updated_at''', 1, 'shops has the updated_at trigger (000_harness proves the function)');
select test.raises($q$ update public.shops set billing_status = 'read_only' where id = test.id('shop_a') $q$,
  'A cannot change billing_status (column grant revoked)', '%permission denied%');
select test.raises($q$ update public.shops set billing_exempt = true where id = test.id('shop_a') $q$,
  'A cannot set billing_exempt', '%permission denied%');
select test.raises($q$ update public.shops set stripe_charges_enabled = true where id = test.id('shop_a') $q$,
  'A cannot flip stripe_charges_enabled', '%permission denied%');
select test.raises($q$ insert into public.shops (name, slug) values ('Direct', 'direct-shop') $q$,
  'A cannot insert a shop directly', '%permission denied%');
select test.raises($q$ delete from public.shops where id = test.id('shop_a') $q$, 'A cannot delete a shop', '%permission denied%');

\echo '--- shops: member B is another tenant'
select test.as_b();
select test.count('select * from public.shops where id = test.id(''shop_a'')', 0, 'B cannot see shop A');
update public.shops set name = 'Hacked' where id = test.id('shop_a');
select test.as_admin();
select test.eq((select name from public.shops where id = test.id('shop_a')), 'Shop A Renamed', 'B''s update of shop A changed nothing');

\echo '--- shop_members and shop_pages'
select test.as_a();
select test.count('select * from public.shop_members', 1, 'A sees one membership');
select test.eq((select role::text from public.shop_members), 'owner', 'A is the owner');
select test.raises($q$ insert into public.shop_members (shop_id, user_id) values (test.id('shop_a'), test.id('user_b')) $q$,
  'A cannot add members directly', '%permission denied%');
select test.count('select * from public.shop_pages', 1, 'A sees their page');
update public.shop_pages set intro = 'Welcome' where shop_id = test.id('shop_a');
select test.eq((select intro from public.shop_pages where shop_id = test.id('shop_a')), 'Welcome', 'A edits their page');
select test.as_b();
update public.shop_pages set intro = 'Hacked' where shop_id = test.id('shop_a');
select test.as_admin();
select test.eq((select intro from public.shop_pages where shop_id = test.id('shop_a')), 'Welcome', 'B cannot edit A''s page');

\echo '--- services'
select test.as_a();
select test.count('select * from public.services', 4, 'A sees their 4 services only');
insert into public.services (shop_id, kind, name, price_cents) values (test.id('shop_a'), 'reel', 'Line spooling', 500);
select test.count('select * from public.services', 5, 'A added a service');
select test.raises($q$ insert into public.services (shop_id, kind, name, price_cents) values (test.id('shop_b'), 'reel', 'Sneaky', 1) $q$,
  'A cannot add a service to shop B', '%row-level security%');
select test.raises($q$ insert into public.services (shop_id, kind, name, deposit_pct, deposit_cents) values (test.id('shop_a'), 'rod', 'Both', 50, 100) $q$,
  'a service cannot have both deposit kinds', '%services_one_deposit_rule%');
delete from public.services where name = 'Line spooling';
select test.count('select * from public.services', 4, 'A deleted an unused service');
select test.as_b();
select test.count('select * from public.services', 1, 'B sees only their service');

\echo '--- anon: nothing but public_shop'
select test.as_anon();
select test.raises($q$ select * from public.shops $q$, 'anon cannot read shops', '%permission denied%');
select test.raises($q$ select * from public.services $q$, 'anon cannot read services', '%permission denied%');
select test.eq(public.public_shop('shop-a') ->> 'name', 'Shop A Renamed', 'public_shop returns the published shop');
select test.eq(jsonb_array_length(public.public_shop('shop-a') -> 'services'), 4, 'with its active services');
select test.eq(public.public_shop('shop-a') ->> 'closed_message', 'Back soon', 'closed_until state is public');
select test.eq((public.public_shop('shop-a') -> 'taking_requests')::boolean, true, 'taking requests while billing is ok');
select test.eq(public.public_shop('SHOP-A') ->> 'name', 'Shop A Renamed', 'slug lookup is case-insensitive');
select test.eq(public.public_shop('shop-b'), null::jsonb, 'an unpublished shop is not public');
select test.eq(public.public_shop('nope'), null::jsonb, 'unknown slug is null');
select test.eq(public.public_shop('shop-a') ? 'billing_status', false, 'no billing fields leak');
select test.eq(public.public_shop('shop-a') ? 'platform_customer_id', false, 'no Stripe ids leak');

\echo '--- service role sees all'
select test.as_service();
select test.count('select * from public.shops', 2, 'service_role sees both shops');
select test.as_admin();
