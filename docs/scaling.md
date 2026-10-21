# Scaling notes

Skeleton written in phase 5a; numbers and the per-table plan are completed in 5b once the schema
exists. "Users" below means shops (tenants); each shop has a handful of members and hundreds to
thousands of customers who only ever open a status page.

## Baseline (what the scaffold already does)

- Static SPA on Netlify's CDN; the API is Supabase (PostgREST + Postgres) with RLS per tenant.
- Vendor code split into long-cached chunks (react, supabase, router, query, zod); app code ~26 kB.
- React Query caches reads (30 s stale) and does not refetch on focus; failed reads retry twice
  except for errors a retry cannot fix.
- Every tenant table will carry `shop_id` with an index; membership checks go through one indexed
  helper function (ADR 0003).

## 1,000 shops

_To complete in 5b._ Expected: Supabase Pro ($25/mo) comfortably; jobs table in the low millions
of rows at most. Watch: email outbox throughput (Resend limits), Stripe webhook retries, the
public intake page as a spam target (Turnstile + rate limit in the edge function).

- Database: indexes on `(shop_id, status)`, `(shop_id, created_at desc)`, token lookup by unique
  index; `updated_at` triggers everywhere; no per-request `count(*)` over the tenant's history.
- Jobs/outbox: pg_cron-driven outbox with `for update skip locked`; idempotency keys on every
  Stripe and Resend write.
- Metering: one row per job-created event; monthly cap computed from an indexed aggregate.

## 10,000 shops

_To complete in 5b._ Expected pressure points: PostgREST connection pool (enable Supavisor
transaction pooling), status-page reads from email campaigns (cache headers on the RPC response or
move to an edge function with short TTL), storage for photos (lifecycle to cheaper tier), and
support load (self-serve exports and audit trails).

- Read replicas for reporting; partition `jobs` by `shop_id` hash or by month only if measured.
- Background work moves from pg_cron to a queue (Supabase Queues / pgmq) with a worker per topic.
- Observability: Logflare/Sentry on edge functions, slow-query log, per-tenant usage dashboard.

## 100,000 shops

_To complete in 5b._ At this size the product is a different company: dedicated Postgres (or
Supabase Enterprise), separate projects per region, a real job system, SOC2-shaped controls.
Design choices that keep the door open: tenant id on every row, no cross-tenant joins in the app,
outbox/idempotency from day one, all config in the database rather than code.

## Extension points

| Point                      | Where it lives now                                  | How it grows                                              |
| -------------------------- | --------------------------------------------------- | --------------------------------------------------------- |
| Data access                | `createApi(client)` slices (ADR 0002)               | new slices per feature; same shape for demo/tests         |
| Auth provider              | `AuthService` interface                             | add OAuth providers without touching screens              |
| Public page rendering      | SPA route `/s/:shopSlug`                            | prerender or SSR just that route if SEO demands           |
| Notifications              | DB outbox + edge function (5b)                      | SMS provider as a second channel behind the same outbox   |
| Payments                   | Stripe Connect Standard, direct charges (gate C4)   | platform fees, invoices, deposits as new outbox events    |
| Background jobs            | pg_cron (5b)                                        | pgmq/queue + workers                                      |
| Files                      | Supabase Storage, private buckets                   | lifecycle rules, CDN image transforms                     |
| Per-tenant configuration   | `shops` settings columns / JSONB (5b)               | feature flags per shop, plans                             |
