-- 0001: enums, tenants (shops), membership, public page settings and the services menu.
--
-- Product definition §6 (data model) with the §16 deltas: closed_until / closed_message,
-- platform_customer_id / platform_payment_method_id (card on file at signup). Every table here
-- carries RLS; `is_shop_member()` is the one membership check every later policy reuses.

-- Enums ---------------------------------------------------------------------------------------
create type public.item_kind as enum ('reel', 'rod');
create type public.job_status as enum (
  'requested', 'received', 'diagnosing', 'quote_sent', 'approved', 'declined',
  'in_progress', 'waiting_parts', 'finishing', 'ready', 'closed', 'cancelled'
);
create type public.closed_how as enum ('picked_up', 'shipped', 'returned_unrepaired', 'abandoned', 'other');
create type public.job_source as enum ('public_page', 'counter');
create type public.delivery_method as enum ('pickup', 'ship');
create type public.member_role as enum ('owner', 'staff');
create type public.quote_status as enum ('draft', 'sent', 'approved', 'declined', 'superseded', 'expired');
create type public.quote_line_kind as enum ('labor', 'part', 'shipping', 'fee', 'discount');
create type public.payment_purpose as enum ('deposit', 'quote', 'balance', 'other');
create type public.payment_method as enum ('card', 'cash', 'check', 'other');
create type public.payment_status as enum ('pending', 'succeeded', 'failed', 'refunded', 'partially_refunded', 'expired');
create type public.notification_status as enum ('pending', 'sending', 'sent', 'failed', 'cancelled');
-- Every bold template name in product-definition §5 (customer and shop emails).
create type public.notification_template as enum (
  'shop_welcome', 'page_live',
  'intake_received', 'new_request', 'deposit_paid', 'deposit_reminder', 'request_expired',
  'item_received', 'status_update', 'promised_date_changed',
  'ready_pickup', 'ready_ship', 'shipped', 'closed_pickup',
  'quote_sent', 'quote_decided_shop', 'quote_reminder', 'declined_next_steps',
  'pickup_reminder', 'uncollected_final',
  'payment_received', 'refund_issued', 'links_resent',
  'stripe_disconnected', 'billing_invoice', 'billing_card_failed', 'billing_read_only'
);
create type public.billing_status as enum ('ok', 'past_due', 'read_only');
create type public.billing_period_status as enum ('open', 'closed', 'invoiced', 'paid', 'void');
create type public.credit_source as enum ('prepay', 'promo', 'adjustment');
create type public.photo_kind as enum ('intake', 'progress', 'finished', 'quote');
create type public.actor_kind as enum ('shop', 'customer', 'system');
-- §16 #6: how the $1 for a job was (or will be) collected.
create type public.usage_collection as enum ('application_fee', 'ledger');

-- shops ---------------------------------------------------------------------------------------
create table public.shops (
  id uuid primary key default gen_random_uuid(),
  slug extensions.citext not null unique
    check (slug ~ '^[a-z0-9](?:[a-z0-9-]{1,38}[a-z0-9])$'),
  name text not null check (length(name) between 1 and 120),
  public_email extensions.citext,
  phone text,
  address_line1 text,
  address_line2 text,
  city text,
  region text,
  postal_code text,
  country char(2) not null default 'US',
  timezone text not null default 'America/New_York',
  currency char(3) not null default 'usd',
  logo_path text,
  accepts_mail_in boolean not null default true,
  accepts_drop_off boolean not null default true,
  hours_text text,
  deposit_policy_text text,
  uncollected_days integer not null default 90 check (uncollected_days between 7 and 365),
  uncollected_policy_text text,
  return_shipping_cents integer not null default 0 check (return_shipping_cents >= 0),
  pass_fee_to_customer boolean not null default false,
  -- §16 #4: "closed until <date>"; intake stays open and queued.
  closed_until date,
  closed_message text,
  -- Stripe Connect (the shop's own account; charges land there).
  stripe_account_id text unique,
  stripe_charges_enabled boolean not null default false,
  stripe_details_submitted boolean not null default false,
  -- Bench Tag billing on the platform account (§16 #9: card on file at signup).
  platform_customer_id text unique,
  platform_payment_method_id text,
  billing_status public.billing_status not null default 'ok',
  billing_exempt boolean not null default false,
  next_job_number integer not null default 1 check (next_job_number >= 1),
  onboarding_step smallint not null default 1 check (onboarding_step between 1 and 6),
  published_at timestamptz,
  deleted_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
comment on table public.shops is
  'A tenant: one reel tech or rod builder. Every other table carries shop_id. Public fields are read through public_shop(slug); billing_* and stripe_* columns change only through RPCs and the service role.';
comment on column public.shops.closed_until is 'Shop is away until this date (shown on the public page and status pages); intake stays open.';
comment on column public.shops.billing_status is 'ok | past_due | read_only. read_only refuses new jobs (jobs_refuse_when_read_only trigger); existing jobs still move.';

create index shops_published_idx on public.shops (published_at) where published_at is not null and deleted_at is null;
create trigger shops_set_updated_at before update on public.shops
  for each row execute function public.set_updated_at();

-- shop_members --------------------------------------------------------------------------------
create table public.shop_members (
  shop_id uuid not null references public.shops (id) on delete cascade,
  user_id uuid not null references auth.users (id) on delete cascade,
  role public.member_role not null default 'owner',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (shop_id, user_id)
);
comment on table public.shop_members is 'Who may sign in to a shop. v1: one owner per shop; rows are inserted only by create_shop().';
create index shop_members_user_idx on public.shop_members (user_id, shop_id);
create trigger shop_members_set_updated_at before update on public.shop_members
  for each row execute function public.set_updated_at();

-- shop_pages ----------------------------------------------------------------------------------
create table public.shop_pages (
  shop_id uuid primary key references public.shops (id) on delete cascade,
  headline text,
  intro text,
  mail_in_instructions text,
  drop_off_instructions text,
  show_prices boolean not null default true,
  show_turnaround boolean not null default true,
  hero_photo_path text,
  meta_description text check (meta_description is null or length(meta_description) <= 160),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
comment on table public.shop_pages is 'Copy and switches for the public page /s/:slug. One row per shop, created by create_shop(). Publication is shops.published_at.';
create trigger shop_pages_set_updated_at before update on public.shop_pages
  for each row execute function public.set_updated_at();

-- services ------------------------------------------------------------------------------------
create table public.services (
  id uuid primary key default gen_random_uuid(),
  shop_id uuid not null references public.shops (id) on delete cascade,
  kind public.item_kind not null,
  category text not null default 'Service',
  name text not null check (length(name) between 1 and 120),
  description text,
  price_cents integer check (price_cents is null or price_cents >= 0),
  price_is_from boolean not null default false,
  deposit_pct smallint check (deposit_pct is null or deposit_pct between 0 and 100),
  deposit_cents integer check (deposit_cents is null or deposit_cents >= 0),
  turnaround_days integer check (turnaround_days is null or turnaround_days between 0 and 365),
  is_estimate_fee boolean not null default false,
  active boolean not null default true,
  sort_order integer not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint services_one_deposit_rule check (deposit_pct is null or deposit_cents is null)
);
comment on table public.services is 'The shop''s menu. price_cents null = quoted after inspection. A deposit is either a percentage or a fixed amount, never both.';
create index services_shop_kind_active_idx on public.services (shop_id, kind, active);
create trigger services_set_updated_at before update on public.services
  for each row execute function public.set_updated_at();

-- Membership helpers ---------------------------------------------------------------------------
-- SECURITY DEFINER so policies on shop_members itself can call it without recursing through RLS.
create or replace function public.is_shop_member(p_shop_id uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1 from public.shop_members m
    where m.shop_id = p_shop_id and m.user_id = auth.uid()
  );
$$;
comment on function public.is_shop_member(uuid) is 'True when auth.uid() is a member of the shop. Used by every tenant policy.';

create or replace function public.is_shop_owner(p_shop_id uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1 from public.shop_members m
    where m.shop_id = p_shop_id and m.user_id = auth.uid() and m.role = 'owner'
  );
$$;

-- create_shop(): the only way a shop, its page and its first member come into being.
create or replace function public.create_shop(p_name text, p_slug text, p_timezone text default 'America/New_York')
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_shop_id uuid;
begin
  if auth.uid() is null then
    raise exception 'Sign in to create a shop.' using errcode = '42501';
  end if;
  if p_name is null or length(trim(p_name)) = 0 then
    raise exception 'Give the shop a name.' using errcode = 'P0001';
  end if;
  if p_slug is null or p_slug !~ '^[a-z0-9](?:[a-z0-9-]{1,38}[a-z0-9])$' then
    raise exception 'The web address can only use lowercase letters, digits and hyphens (3 to 40 characters).' using errcode = 'P0001';
  end if;
  if exists (select 1 from public.shops where slug = p_slug::extensions.citext) then
    raise exception 'That web address is taken. Try another.' using errcode = '23505';
  end if;
  insert into public.shops (name, slug, timezone) values (trim(p_name), p_slug, coalesce(p_timezone, 'America/New_York'))
    returning id into v_shop_id;
  insert into public.shop_members (shop_id, user_id, role) values (v_shop_id, auth.uid(), 'owner');
  insert into public.shop_pages (shop_id) values (v_shop_id);
  return v_shop_id;
end;
$$;
comment on function public.create_shop(text, text, text) is 'Creates a shop, its page row and makes the caller its owner. Signed-in users only.';

-- public_shop(slug): everything the public page needs, for anyone, only when published.
create or replace function public.public_shop(p_slug text)
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  select jsonb_build_object(
    'id', s.id,
    'slug', s.slug,
    'name', s.name,
    'city', s.city,
    'region', s.region,
    'phone', s.phone,
    'public_email', s.public_email,
    'timezone', s.timezone,
    'accepts_mail_in', s.accepts_mail_in,
    'accepts_drop_off', s.accepts_drop_off,
    'hours_text', s.hours_text,
    'deposit_policy_text', s.deposit_policy_text,
    'uncollected_days', s.uncollected_days,
    'uncollected_policy_text', s.uncollected_policy_text,
    'return_shipping_cents', s.return_shipping_cents,
    'closed_until', s.closed_until,
    'closed_message', s.closed_message,
    'taking_requests', s.billing_status <> 'read_only',
    'page', jsonb_build_object(
      'headline', p.headline,
      'intro', p.intro,
      'mail_in_instructions', p.mail_in_instructions,
      'drop_off_instructions', p.drop_off_instructions,
      'show_prices', p.show_prices,
      'show_turnaround', p.show_turnaround,
      'meta_description', p.meta_description
    ),
    'services', coalesce((
      select jsonb_agg(jsonb_build_object(
        'id', v.id, 'kind', v.kind, 'category', v.category, 'name', v.name,
        'description', v.description, 'price_cents', v.price_cents, 'price_is_from', v.price_is_from,
        'deposit_pct', v.deposit_pct, 'deposit_cents', v.deposit_cents,
        'turnaround_days', v.turnaround_days, 'is_estimate_fee', v.is_estimate_fee
      ) order by v.kind, v.sort_order, v.name)
      from public.services v where v.shop_id = s.id and v.active
    ), '[]'::jsonb)
  )
  from public.shops s
  join public.shop_pages p on p.shop_id = s.id
  where s.slug = p_slug::extensions.citext
    and s.published_at is not null
    and s.deleted_at is null;
$$;
comment on function public.public_shop(text) is 'Public projection of a published shop and its active services; null when there is no such published shop. Callable by anon.';

-- Row level security ---------------------------------------------------------------------------
alter table public.shops enable row level security;
alter table public.shop_members enable row level security;
alter table public.shop_pages enable row level security;
alter table public.services enable row level security;

create policy shops_select_member on public.shops
  for select to authenticated using (public.is_shop_member(id));
create policy shops_update_member on public.shops
  for update to authenticated using (public.is_shop_member(id)) with check (public.is_shop_member(id));
-- No insert (create_shop) and no delete (soft delete through a later RPC) for authenticated.

create policy shop_members_select_member on public.shop_members
  for select to authenticated using (public.is_shop_member(shop_id));

create policy shop_pages_select_member on public.shop_pages
  for select to authenticated using (public.is_shop_member(shop_id));
create policy shop_pages_update_member on public.shop_pages
  for update to authenticated using (public.is_shop_member(shop_id)) with check (public.is_shop_member(shop_id));

create policy services_select_member on public.services
  for select to authenticated using (public.is_shop_member(shop_id));
create policy services_insert_member on public.services
  for insert to authenticated with check (public.is_shop_member(shop_id));
create policy services_update_member on public.services
  for update to authenticated using (public.is_shop_member(shop_id)) with check (public.is_shop_member(shop_id));
-- Deleting a service that jobs reference is refused by this policy (the jobs table arrives in
-- 0002, which replaces this policy with one that also checks jobs). Until then: members only.
create policy services_delete_member on public.services
  for delete to authenticated using (public.is_shop_member(shop_id));

-- Grants: revoke before you grant ------------------------------------------------------------
revoke all on table public.shops, public.shop_members, public.shop_pages, public.services from anon, authenticated;
grant select on table public.shops to authenticated;
-- Members edit their profile and policies; billing and Stripe state move only through RPCs/service.
grant update (
  name, public_email, phone, address_line1, address_line2, city, region, postal_code, country,
  timezone, logo_path, accepts_mail_in, accepts_drop_off, hours_text, deposit_policy_text,
  uncollected_days, uncollected_policy_text, return_shipping_cents, pass_fee_to_customer,
  closed_until, closed_message, onboarding_step, published_at
) on table public.shops to authenticated;
grant select on table public.shop_members to authenticated;
grant select, update on table public.shop_pages to authenticated;
grant select, insert, update, delete on table public.services to authenticated;

revoke all on function public.is_shop_member(uuid) from public, anon, authenticated;
revoke all on function public.is_shop_owner(uuid) from public, anon, authenticated;
revoke all on function public.create_shop(text, text, text) from public, anon, authenticated;
revoke all on function public.public_shop(text) from public, anon, authenticated;
grant execute on function public.is_shop_member(uuid), public.is_shop_owner(uuid) to authenticated, service_role;
grant execute on function public.create_shop(text, text, text) to authenticated, service_role;
grant execute on function public.public_shop(text) to anon, authenticated, service_role;
