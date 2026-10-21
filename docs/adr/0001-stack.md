# ADR 0001: Stack

Date: 2026-10-21. Status: accepted (phase 5a). Supersedes nothing; see decision log D5, D8.

## Context

A solo founder must ship and run a multi-tenant web app for small fishing-gear service shops:
public, indexable intake pages, tokenised customer status pages, a signed-in workspace, Stripe
Connect payments, emails from a database-driven outbox. Budget and ops capacity are near zero;
the launch window is Nov 2026–Feb 2027 (validation gate C5). There is no Docker in the build
environment, which rules out the Supabase local stack for tests.

## Decision

- **React 19 + Vite 8 + TypeScript 6 (strict, `noUncheckedIndexedAccess`, `exactOptionalPropertyTypes`)**
  as a single-page app; Tailwind 4 via `@tailwindcss/vite`; react-router-dom 7; TanStack Query 5;
  Zod 4 at every boundary (env, forms, URL params).
- **Supabase** for Postgres, Auth (magic link + password), RLS, Storage and Edge Functions;
  `@supabase/supabase-js` 2 behind a typed data layer (ADR 0002).
- **Netlify** for hosting (SPA redirect, security headers, CSP) with `base = "app"`.
- **Quality gate**: ESLint 9 flat config with typescript-eslint `strictTypeChecked` +
  `stylisticTypeChecked`, jsx-a11y, react-hooks, react-refresh; Prettier; Vitest 5 + Testing
  Library; a plain-Postgres SQL harness (ADR 0004). `npm run check` is the merge gate.
- Versions pinned by caret to the majors verified in D8 (TypeScript stays on 6.x; ESLint on 9.x).

## Consequences

- One deployable, one language, one hosting bill; previews on every PR via Netlify.
- Public shop pages are client-rendered. Crawlers index them today, but if SEO becomes the main
  acquisition channel, revisit with prerendering or an Astro/SSR shell for `/s/*` only (D5).
- Strict TS and type-aware lint cost some ceremony; they catch the `undefined`/`any` bugs a solo
  developer has no reviewer to catch.
- TypeScript 7 (Go-based) is out; we adopt it when typescript-eslint supports it, not before.
