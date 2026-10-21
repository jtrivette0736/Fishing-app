# ADR 0003: Auth, tenancy and customer tokens

Date: 2026-10-21. Status: accepted for 5a; token mechanism **to be finalised by the product
definition** (default below); review in 5b before the first customer-facing table lands.

## Context

Three kinds of visitor: shop members (sign in), anyone (public intake page `/s/:shopSlug`,
indexable per gate C7) and customers (status page `/t/:token`, no account, link arrives by email
per C3). Tenants are shops; a person may belong to more than one. The anon key is public, so Row
Level Security is the only boundary between tenants.

## Decision

- **Supabase Auth** with magic link (default) and password; PKCE flow; the callback is
  `/auth/callback`. The UI sees an `AuthService` interface with a demo implementation that is
  signed in as a fake user when Supabase is not configured.
- **Tenancy by membership.** `shops` and `shop_members(shop_id, user_id, role)`; every tenant
  table carries `shop_id` and its policies check membership through a `security definer` helper
  (`is_shop_member(shop_id)`), indexed on `(user_id, shop_id)`. `auth.uid()` never maps to a shop
  by itself.
- **Public shop pages** read through a view or column-restricted policy that exposes only the
  public fields of `shops` for `anon`; the slug is the key.
- **Customer status pages (default): a `SECURITY DEFINER` RPC**, e.g.
  `status_page(token text)`, that looks up the job by token, returns only the fields a customer
  may see, and is the only thing `anon` may execute on that path. Tokens come from
  `public.gen_token()` (24 random bytes, base64url, 192 bits) stored hashed or plain per the
  product decision, with an expiry/rotation rule. Alternatives considered: a bare RLS policy
  `using (token = current_setting(...))` (leaks table shape, hard to rate-limit) and signed JWT
  links (stateless, but not revocable). The RPC keeps the surface to one function.
- **Server-only secrets** (service role, Stripe, Resend, Turnstile) live in Edge Function secrets.

## Consequences

- Every migration adds policies and an RLS test; `supabase/tests/000_harness.sql` proves the
  harness enforces them, so a missing policy is a red test, not an incident.
- The RPC default means the status page is one query and one grant to audit; rate limiting and
  token rotation are implementable in that one place.
- Open for 5b: hashed vs plain tokens, expiry, whether the intake form writes through an RPC (with
  Turnstile verification in an edge function) or a narrow insert policy.
