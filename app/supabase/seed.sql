-- Seed: the demo shop "Storm Proof Tackle" for local development, previews and the demo twin
-- (src/lib/demo mirrors this data in memory). Idempotent: every insert is keyed by a fixed id,
-- and the status walk only moves a job that has not reached its target yet.
--
-- Runs as the database owner (supabase db reset, or the harness's 099_seed.sql test). It acts
-- as the demo owner (auth.uid() = the DEMO_USER in src/lib/auth) so the member RPCs work and the
-- history carries a real actor.
--
-- Raw status-page tokens (sha256 is what the table stores):
--   SptDemoJob01TokenAAAAA  job 1  Penn Spinfisher VI 4500   quote_sent (open the quote card)
--   SptDemoJob02TokenAAAAA  job 2  Penn Fathom 25N           in_progress, overdue
--   SptDemoJob03TokenAAAAA  job 3  Shimano Stradic FL 3000   ready for pickup
--   SptDemoJob04TokenAAAAA  job 4  St. Croix rod build       waiting_parts (deposit paid)
--   SptDemoJob05TokenAAAAA  job 5  Daiwa BG 4000             finishing
--   SptDemoJob06TokenAAAAA  job 6  Abu Garcia Revo SX        closed (picked up, paid)
--   SptDemoJob07TokenAAAAA  job 7  Daiwa BG 4000 (again)     requested from the public page
--   SptDemoJob08TokenAAAAA  job 8  Shimano Stradic FL 3000   cancelled

select set_config('request.jwt.claims', '{"sub":"00000000-0000-4000-8000-000000000001","role":"authenticated"}', false);

insert into auth.users (id, email) values ('00000000-0000-4000-8000-000000000001', 'demo@example.com')
on conflict (id) do nothing;

insert into public.shops (id, slug, name, public_email, phone, address_line1, city, region, postal_code, timezone,
  accepts_mail_in, accepts_drop_off, hours_text, deposit_policy_text, uncollected_days, uncollected_policy_text,
  return_shipping_cents, published_at, onboarding_step)
values ('00000000-0000-4000-8000-00000000a001', 'storm-proof-tackle', 'Storm Proof Tackle', 'hello@stormprooftackle.example',
  '(757) 555-0142', '1200 Princess Anne Rd', 'Virginia Beach', 'VA', '23456', 'America/New_York',
  true, true, 'Drop-offs Tue–Sat 10–6 at Princess Anne Distributing; mail-ins any day.',
  'Custom rod builds take a 50% deposit when the blank is ordered. Repairs are quoted after inspection; a $15 estimate fee applies if you decline.',
  90, 'Items not collected within 90 days of being ready are considered abandoned and may be sold to cover the work.',
  1350, now(), 6)
on conflict (id) do nothing;

insert into public.shop_members (shop_id, user_id, role)
values ('00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-000000000001', 'owner')
on conflict do nothing;

insert into public.shop_pages (shop_id, headline, intro, mail_in_instructions, drop_off_instructions, meta_description)
values ('00000000-0000-4000-8000-00000000a001', 'Reel service and custom rods in Virginia Beach',
  'Spinning, baitcasting and saltwater conventional reels cleaned, re-lubed and tuned. Rod tips, guides and full custom builds.',
  'Box the reel with padding, drop a note with your name and phone inside, and ship to the address below. We email you the day it arrives.',
  'Bring it by during shop hours; we log it on the spot and hand you a tag with your tracking code.',
  'Reel service, rod repair and custom rod builds in Virginia Beach, VA. See prices and turnaround, send a request online.')
on conflict (shop_id) do nothing;

insert into public.services (id, shop_id, kind, category, name, description, price_cents, price_is_from, deposit_pct, deposit_cents, turnaround_days, is_estimate_fee, sort_order) values
  ('00000000-0000-4000-8000-00000000b001', '00000000-0000-4000-8000-00000000a001', 'reel', 'Reel service', 'Spinning reel clean & lube', 'Full teardown, ultrasonic clean, fresh grease and oil, drag check.', 3000, false, null, null, 7, false, 1),
  ('00000000-0000-4000-8000-00000000b002', '00000000-0000-4000-8000-00000000a001', 'reel', 'Reel service', 'Baitcaster service', 'Bearings cleaned, brakes and drag serviced, cast tuned.', 3500, false, null, null, 7, false, 2),
  ('00000000-0000-4000-8000-00000000b003', '00000000-0000-4000-8000-00000000a001', 'reel', 'Reel service', 'Saltwater conventional service', 'Star drag and small conventional reels; corrosion treatment included.', 4500, false, null, null, 10, false, 3),
  ('00000000-0000-4000-8000-00000000b004', '00000000-0000-4000-8000-00000000a001', 'reel', 'Reel service', 'Lever drag / two-speed service', 'Large conventional and lever-drag reels.', 5500, true, null, null, 14, false, 4),
  ('00000000-0000-4000-8000-00000000b005', '00000000-0000-4000-8000-00000000a001', 'reel', 'Repairs', 'Repair — quoted after inspection', 'We look it over and send you a quote before any work starts.', null, false, null, null, 10, false, 5),
  ('00000000-0000-4000-8000-00000000b006', '00000000-0000-4000-8000-00000000a001', 'reel', 'Repairs', 'Estimate fee', 'Charged only if you decline the quote.', 1500, false, null, null, null, true, 6),
  ('00000000-0000-4000-8000-00000000b007', '00000000-0000-4000-8000-00000000a001', 'rod', 'Rod repair', 'Rod tip replacement', 'Tip top matched and set.', 1200, false, null, null, 3, false, 1),
  ('00000000-0000-4000-8000-00000000b008', '00000000-0000-4000-8000-00000000a001', 'rod', 'Rod repair', 'Guide re-wrap (per guide)', 'Thread matched to the existing wraps where possible.', 2500, false, null, null, 5, false, 2),
  ('00000000-0000-4000-8000-00000000b009', '00000000-0000-4000-8000-00000000a001', 'rod', 'Custom rods', 'Custom rod build', 'Quoted per build; 50% deposit when the blank is ordered.', null, false, 50, null, 45, false, 3),
  ('00000000-0000-4000-8000-00000000b010', '00000000-0000-4000-8000-00000000a001', 'rod', 'Rod repair', 'Rod repair — quoted', 'Broken sections, reel seats and handles; quoted after inspection.', null, false, null, null, 10, false, 4)
on conflict (id) do nothing;

insert into public.customers (id, shop_id, first_name, last_name, email, phone, notes) values
  ('00000000-0000-4000-8000-00000000c001', '00000000-0000-4000-8000-00000000a001', 'Mike', 'Reyes', 'mike.reyes@example.com', '(757) 555-0142', 'Surf fishes Sandbridge most weekends.'),
  ('00000000-0000-4000-8000-00000000c002', '00000000-0000-4000-8000-00000000a001', 'Dana', 'Whitfield', 'dana.w@example.com', '(757) 555-0188', null),
  ('00000000-0000-4000-8000-00000000c003', '00000000-0000-4000-8000-00000000a001', 'Carl', 'Nguyen', 'carl.nguyen@example.com', null, 'Mails in from Richmond.')
on conflict (id) do nothing;

insert into public.items (id, shop_id, customer_id, kind, brand, model, serial, description) values
  ('00000000-0000-4000-8000-00000000d001', '00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-00000000c001', 'reel', 'Penn', 'Spinfisher VI 4500', 'SSVI4500-2211', null),
  ('00000000-0000-4000-8000-00000000d002', '00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-00000000c001', 'reel', 'Penn', 'Fathom 25N', 'FTH25N-0931', null),
  ('00000000-0000-4000-8000-00000000d003', '00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-00000000c002', 'reel', 'Shimano', 'Stradic FL 3000', null, null),
  ('00000000-0000-4000-8000-00000000d004', '00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-00000000c002', 'rod', 'St. Croix', 'Mojo Surf 10'' blank', null, '10'' surf rod, 2–6 oz, Fuji K guides, cork grips, blue/silver wraps.'),
  ('00000000-0000-4000-8000-00000000d005', '00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-00000000c003', 'reel', 'Daiwa', 'BG 4000', 'BG4K-77120', null),
  ('00000000-0000-4000-8000-00000000d006', '00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-00000000c003', 'reel', 'Abu Garcia', 'Revo SX', null, null)
on conflict (id) do nothing;

-- Jobs are inserted at their starting status, then walked along a legal path below.
insert into public.jobs (id, shop_id, customer_id, item_id, service_id, source, status, problem, promised_date, delivery, deposit_due_cents, short_code, token_hash, created_by, created_at) values
  ('00000000-0000-4000-8000-00000000e001', '00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-00000000c001', '00000000-0000-4000-8000-00000000d001', '00000000-0000-4000-8000-00000000b005', 'counter', 'received',
    'Grinds under load, drag slips at the top end.', current_date + 5, 'pickup', 0, 'K7M2PX', public.job_token_hash('SptDemoJob01TokenAAAAA'), '00000000-0000-4000-8000-000000000001', now() - interval '6 days'),
  ('00000000-0000-4000-8000-00000000e002', '00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-00000000c001', '00000000-0000-4000-8000-00000000d002', '00000000-0000-4000-8000-00000000b003', 'counter', 'received',
    'Annual service, salt crust on the frame.', current_date - 2, 'pickup', 0, 'R4TQ8W', public.job_token_hash('SptDemoJob02TokenAAAAA'), '00000000-0000-4000-8000-000000000001', now() - interval '12 days'),
  ('00000000-0000-4000-8000-00000000e003', '00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-00000000c002', '00000000-0000-4000-8000-00000000d003', '00000000-0000-4000-8000-00000000b001', 'counter', 'received',
    'Bail does not flip over; line twist.', current_date, 'pickup', 0, 'H9ZC3N', public.job_token_hash('SptDemoJob03TokenAAAAA'), '00000000-0000-4000-8000-000000000001', now() - interval '9 days'),
  ('00000000-0000-4000-8000-00000000e004', '00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-00000000c002', '00000000-0000-4000-8000-00000000d004', '00000000-0000-4000-8000-00000000b009', 'public_page', 'requested',
    '10'' surf rod, 2–6 oz, Fuji K guides, cork grips, blue/silver wraps.', current_date + 40, 'pickup', 15000, 'B6WN5D', public.job_token_hash('SptDemoJob04TokenAAAAA'), null, now() - interval '20 days'),
  ('00000000-0000-4000-8000-00000000e005', '00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-00000000c003', '00000000-0000-4000-8000-00000000d005', '00000000-0000-4000-8000-00000000b001', 'counter', 'received',
    'Rough retrieve, probably a bearing.', current_date + 1, 'ship', 0, 'Q2JF7Y', public.job_token_hash('SptDemoJob05TokenAAAAA'), '00000000-0000-4000-8000-000000000001', now() - interval '8 days'),
  ('00000000-0000-4000-8000-00000000e006', '00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-00000000c003', '00000000-0000-4000-8000-00000000d006', '00000000-0000-4000-8000-00000000b002', 'counter', 'received',
    'Brakes sticky, backlash on every cast.', current_date - 7, 'pickup', 0, 'X3VR9M', public.job_token_hash('SptDemoJob06TokenAAAAA'), '00000000-0000-4000-8000-000000000001', now() - interval '16 days'),
  ('00000000-0000-4000-8000-00000000e007', '00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-00000000c003', '00000000-0000-4000-8000-00000000d005', '00000000-0000-4000-8000-00000000b001', 'public_page', 'requested',
    'Same reel again; now the anti-reverse slips. Mailing it Monday.', null, 'ship', 0, 'D8KP4T', public.job_token_hash('SptDemoJob07TokenAAAAA'), null, now() - interval '1 day'),
  ('00000000-0000-4000-8000-00000000e008', '00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-00000000c002', '00000000-0000-4000-8000-00000000d003', '00000000-0000-4000-8000-00000000b001', 'counter', 'received',
    'Second drop-off logged by mistake.', current_date + 3, 'pickup', 0, 'N5GH2R', public.job_token_hash('SptDemoJob08TokenAAAAA'), '00000000-0000-4000-8000-000000000001', now() - interval '3 days')
on conflict (id) do nothing;

-- Walk each job along its path; a job already past a step is left alone.
create or replace function pg_temp.walk(p_job uuid, p_path public.job_status[], p_closed_how public.closed_how default null)
returns void language plpgsql as $$
declare
  cur public.job_status;
  i integer;
  start integer := 0;
begin
  select status into cur from public.jobs where id = p_job;
  if cur in ('closed', 'cancelled') then return; end if;
  for i in 1 .. array_length(p_path, 1) loop
    if p_path[i] = cur then start := i; end if;
  end loop;
  -- Not on the path and not at the starting line: already walked (and moved on) by an earlier run.
  if start = 0 and cur not in ('requested', 'received') then return; end if;
  for i in start + 1 .. array_length(p_path, 1) loop
    perform public.transition_job(p_job, p_path[i], null, false, case when p_path[i] = 'closed' then p_closed_how end);
  end loop;
end;
$$;

-- Deposit on the rod build (cash at the counter) and the paid-in-full pickup, before the walks
-- so the balance and emails line up.
insert into public.payments (id, shop_id, job_id, purpose, method, status, amount_cents, recorded_by, paid_at, note) values
  ('00000000-0000-4000-8000-00000000f001', '00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-00000000e004', 'deposit', 'cash', 'succeeded', 15000, '00000000-0000-4000-8000-000000000001', now() - interval '19 days', '50% deposit, blank ordered'),
  ('00000000-0000-4000-8000-00000000f002', '00000000-0000-4000-8000-00000000a001', '00000000-0000-4000-8000-00000000e006', 'balance', 'cash', 'succeeded', 3500, '00000000-0000-4000-8000-000000000001', now() - interval '7 days', 'Paid at pickup')
on conflict (id) do nothing;

select pg_temp.walk('00000000-0000-4000-8000-00000000e001', array['diagnosing']::public.job_status[]);
select pg_temp.walk('00000000-0000-4000-8000-00000000e002', array['diagnosing', 'in_progress']::public.job_status[]);
select pg_temp.walk('00000000-0000-4000-8000-00000000e003', array['diagnosing', 'in_progress', 'ready']::public.job_status[]);
select pg_temp.walk('00000000-0000-4000-8000-00000000e004', array['received', 'waiting_parts']::public.job_status[]);
select pg_temp.walk('00000000-0000-4000-8000-00000000e005', array['in_progress', 'finishing']::public.job_status[]);
select pg_temp.walk('00000000-0000-4000-8000-00000000e006', array['in_progress', 'ready', 'closed']::public.job_status[], 'picked_up');
select pg_temp.walk('00000000-0000-4000-8000-00000000e008', array['cancelled']::public.job_status[]);

-- Job 1's quote: sent, waiting for Mike on the status page.
insert into public.quotes (id, job_id, note_to_customer, created_by)
values ('00000000-0000-4000-8000-000000009001', '00000000-0000-4000-8000-00000000e001', 'Main gear and pinion are worn; drag washers are glazed. Price includes the service.', '00000000-0000-4000-8000-000000000001')
on conflict (id) do nothing;
do $$
begin
  if not exists (select 1 from public.quote_lines where quote_id = '00000000-0000-4000-8000-000000009001') then
    insert into public.quote_lines (quote_id, kind, description, qty, unit_cents, sort_order) values
      ('00000000-0000-4000-8000-000000009001', 'part', 'Main gear + pinion (Penn OEM)', 1, 4200, 1),
      ('00000000-0000-4000-8000-000000009001', 'part', 'Carbon drag washer set', 1, 1800, 2),
      ('00000000-0000-4000-8000-000000009001', 'labor', 'Full service and rebuild', 1, 3000, 3);
  end if;
  if (select status from public.quotes where id = '00000000-0000-4000-8000-000000009001') = 'draft' then
    perform public.send_quote('00000000-0000-4000-8000-000000009001', 14);
  end if;
end;
$$;

-- A couple of visible notes so the timeline has texture.
do $$
begin
  if not exists (select 1 from public.job_status_history where job_id = '00000000-0000-4000-8000-00000000e004' and note like 'Blank arrived%') then
    perform public.add_job_update('00000000-0000-4000-8000-00000000e004', 'Blank arrived; guides due next week.', true);
  end if;
  if not exists (select 1 from public.job_status_history where job_id = '00000000-0000-4000-8000-00000000e002' and note like 'Frame soaking%') then
    perform public.add_job_update('00000000-0000-4000-8000-00000000e002', 'Frame soaking overnight; worse than it looked.', true);
  end if;
end;
$$;

select set_config('request.jwt.claims', '', false);
