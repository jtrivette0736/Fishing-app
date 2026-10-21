# ADR 0002: Typed data layer

Date: 2026-10-21. Status: accepted (phase 5a).

## Context

Supabase lets any component call `supabase.from('jobs')` directly. That is fast to write and slow
to change: queries scatter, error handling diverges, demo mode and tests have nothing to swap in,
and a schema change breaks screens in places nobody remembers. The app also needs a mode with no
back end at all (demo, previews, component tests).

## Decision

- **Generated types are the schema contract.** `src/lib/supabase/types.ts` is produced by
  `supabase gen types` from the migrations (`npm run db:types`), committed, and checked for
  staleness in CI. The client is `SupabaseClient<Database>`.
- **One import site.** Only `src/lib/supabase/client.ts`, `src/lib/api`, `src/lib/auth` and
  `src/features/*/api` may import `@supabase/supabase-js` or the client (ESLint
  `no-restricted-imports`). Screens get data through `useApi()`.
- **`createApi(client)` composes feature slices** (`shops: createShopApi(client)`, ...) into one
  `Api` object; `createDemoApi()` builds the same shape from in-memory implementations. The
  environment picks one in `src/app/providers.tsx`; nothing else knows which is running.
- **Every call returns `Result<T, ApiError>`** (`ok`/`err`), never throws. `run()` converts a
  PostgREST `{ data, error }` into a Result and maps codes (`PGRST116` → `not_found`, `42501` →
  `forbidden`, `23505` → `conflict`, ...) to a fixed `ApiErrorCode` with a plain-English message.
  `unwrap()` turns a failure into `ApiRequestError` at the React Query boundary only.
- **React Query owns caching**; keys live in `src/lib/query/keys.ts` so invalidation is grep-able.
- **Zod at boundaries**: env, forms, URL params, edge-function bodies. Inside, trust the types.

## Consequences

- Adding a table means: migration → `db:types` → one `api/` module → register in `createApi` →
  keys → hooks. Mechanical, and each step is checkable.
- Demo mode and tests come for free from the demo twins; UI tests never mock `fetch`.
- A little indirection: `api.shops.bySlug()` instead of a builder chain in the component. That is
  the point; the builder chain stays in one file per feature.
- `Result` discipline means no silent catches: a failure either becomes a message on screen or is
  deliberately ignored in code that says so.
