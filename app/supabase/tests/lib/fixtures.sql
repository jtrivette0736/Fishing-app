-- Shared fixtures for the domain tests. Each test file loads this with `\ir lib/fixtures.sql`
-- inside its own transaction, so nothing here persists.
--
--   test.setup_two_shops()   owners A and B, shops shop-a (published) and shop-b (unpublished),
--                            services, customers and items; ids are in test.ctx
--   test.id('shop_a')        a fixture id by key (see the keys set below)
--   test.job_a(item, cust, service)  create a counter job in shop A as owner A; returns create_job's JSON
--   test.last_token(job_id)  not possible: tokens are hashed; use the token returned by create_job

create table if not exists test.ctx (key text primary key, val text);

create or replace function test.set(k text, v text)
returns void language sql as $$
  insert into test.ctx (key, val) values (k, v) on conflict (key) do update set val = excluded.val;
$$;

create or replace function test.v(k text)
returns text language sql stable as $$ select val from test.ctx where key = k; $$;

create or replace function test.id(k text)
returns uuid language sql stable as $$ select val::uuid from test.ctx where key = k; $$;

create or replace function test.setup_two_shops()
returns void
language plpgsql
as $$
declare
  a uuid := 'aaaaaaaa-aaaa-4aaa-8aaa-aaaaaaaaaaaa';
  b uuid := 'bbbbbbbb-bbbb-4bbb-8bbb-bbbbbbbbbbbb';
  sa uuid;
  sb uuid;
begin
  perform test.as_admin();
  insert into auth.users (id, email) values (a, 'owner-a@example.com'), (b, 'owner-b@example.com')
    on conflict (id) do nothing;

  perform test.as_user(a, 'owner-a@example.com');
  sa := public.create_shop('Shop A', 'shop-a', 'America/New_York');
  perform test.as_user(b, 'owner-b@example.com');
  sb := public.create_shop('Shop B', 'shop-b', 'America/Los_Angeles');
  perform test.as_admin();

  update public.shops set published_at = now(), public_email = 'hello-a@example.com', phone = '757-555-0100',
    city = 'Virginia Beach', region = 'VA', uncollected_days = 90 where id = sa;
  update public.shop_pages set headline = 'Reel service in Virginia Beach' where shop_id = sa;

  insert into public.services (id, shop_id, kind, name, price_cents, turnaround_days) values
    ('11111111-0000-4000-8000-000000000001', sa, 'reel', 'Spinning reel service', 3000, 7),
    ('11111111-0000-4000-8000-000000000004', sb, 'reel', 'Reel service', 3500, 10);
  insert into public.services (id, shop_id, kind, name, price_cents, deposit_pct, turnaround_days) values
    ('11111111-0000-4000-8000-000000000002', sa, 'rod', 'Custom rod build', null, 50, 45);
  insert into public.services (id, shop_id, kind, name, price_cents, deposit_cents, turnaround_days) values
    ('11111111-0000-4000-8000-000000000005', sa, 'rod', 'Rod repair with deposit', 8000, 2000, 10);
  insert into public.services (id, shop_id, kind, name, price_cents, is_estimate_fee) values
    ('11111111-0000-4000-8000-000000000003', sa, 'reel', 'Estimate fee', 1500, true);

  insert into public.customers (id, shop_id, first_name, last_name, email, phone) values
    ('22222222-0000-4000-8000-000000000001', sa, 'Alice', 'Angler', 'alice@example.com', '(757) 555-0101'),
    ('22222222-0000-4000-8000-000000000002', sa, 'Andy', 'Nomail', null, '757-555-0102'),
    ('22222222-0000-4000-8000-000000000003', sb, 'Bob', 'Boater', 'bob@example.com', '310-555-0103');

  insert into public.items (id, shop_id, customer_id, kind, brand, model, serial) values
    ('33333333-0000-4000-8000-000000000001', sa, '22222222-0000-4000-8000-000000000001', 'reel', 'Penn', 'Spinfisher VI 4500', 'PS6-4500-001'),
    ('33333333-0000-4000-8000-000000000002', sa, '22222222-0000-4000-8000-000000000001', 'rod', 'St. Croix', 'SCV70MF', null),
    ('33333333-0000-4000-8000-000000000003', sa, '22222222-0000-4000-8000-000000000002', 'reel', 'Shimano', 'Stradic FL 3000', null),
    ('33333333-0000-4000-8000-000000000004', sb, '22222222-0000-4000-8000-000000000003', 'reel', 'Daiwa', 'BG 4000', null);

  perform test.set('user_a', a::text);
  perform test.set('user_b', b::text);
  perform test.set('shop_a', sa::text);
  perform test.set('shop_b', sb::text);
  perform test.set('svc_a_reel', '11111111-0000-4000-8000-000000000001');
  perform test.set('svc_a_rod', '11111111-0000-4000-8000-000000000002');
  perform test.set('svc_a_fee', '11111111-0000-4000-8000-000000000003');
  perform test.set('svc_a_rod_fixed', '11111111-0000-4000-8000-000000000005');
  perform test.set('svc_b_reel', '11111111-0000-4000-8000-000000000004');
  perform test.set('cust_a', '22222222-0000-4000-8000-000000000001');
  perform test.set('cust_a2', '22222222-0000-4000-8000-000000000002');
  perform test.set('cust_b', '22222222-0000-4000-8000-000000000003');
  perform test.set('item_a_reel', '33333333-0000-4000-8000-000000000001');
  perform test.set('item_a_rod', '33333333-0000-4000-8000-000000000002');
  perform test.set('item_a2_reel', '33333333-0000-4000-8000-000000000003');
  perform test.set('item_b_reel', '33333333-0000-4000-8000-000000000004');
end;
$$;

create or replace function test.as_a() returns void language sql as $$ select test.as_user(test.id('user_a'), 'owner-a@example.com'); $$;
create or replace function test.as_b() returns void language sql as $$ select test.as_user(test.id('user_b'), 'owner-b@example.com'); $$;

-- A counter job in shop A, created as owner A (leaves the identity as A).
create or replace function test.job_a(
  p_item text default 'item_a_reel',
  p_customer text default 'cust_a',
  p_service text default 'svc_a_reel',
  p_promised date default current_date + 7
)
returns jsonb
language plpgsql
as $$
declare
  r jsonb;
begin
  perform test.as_a();
  r := public.create_job(test.id('shop_a'), test.id(p_customer), test.id(p_item),
    case when p_service is null then null else test.id(p_service) end, 'Grinds under load', p_promised, 'pickup', 0, null);
  return r;
end;
$$;

create or replace function test.job_b()
returns jsonb
language plpgsql
as $$
declare
  r jsonb;
begin
  perform test.as_b();
  r := public.create_job(test.id('shop_b'), test.id('cust_b'), test.id('item_b_reel'), test.id('svc_b_reel'),
    'Bail spring', current_date + 10, 'pickup', 0, null);
  return r;
end;
$$;

grant usage on schema test to anon, authenticated, service_role;
grant all on table test.ctx to anon, authenticated, service_role;
grant execute on all functions in schema test to anon, authenticated, service_role;
