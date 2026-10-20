---
name: code-review-against-standards
description: Review code in /app against the project's CODE QUALITY STANDARDS (strict TS, feature folders, isolated data layer, migrations + RLS, env-only config, lint/format/typecheck/tests, states, accessibility, Netlify setup, docs) and report violations with file:line and a fix. Use after any agent writes or changes code in /app, and in the red-team code review.
---

# Code review against standards

## When to use

After each code-writing step in /app; before marking a phase done; in the red-team review.

## Procedure

1. Run the mechanical checks first and paste the summary lines:
   ```
   cd app && npm run lint && npm run format:check && npm run typecheck && npm test -- --run && npm run build
   ```
   Any failure is a finding; fix before reading further.
2. Walk the checklist below. For each violation record: `file:line — rule — what's wrong — fix`.
3. Severity: **block** (secret, RLS missing, `any` unjustified, UI calls Supabase directly, build
   or test failing), **fix** (structure, missing state, a11y), **nit** (naming, comments).
4. Fix blocks and fixes yourself if the change is local; otherwise hand back with the list.

## Checklist

**TypeScript**
- [ ] `strict: true`, `noUncheckedIndexedAccess`, `noImplicitOverride` in tsconfig
- [ ] no `any` without a `// any: <reason>` comment on the same line
- [ ] generated `Database` types from the schema in `src/lib/supabase/types.ts` (not hand-written)

**Structure**
- [ ] `src/features/<feature>/{components,hooks,api,types}`; shared UI in `src/components`; utilities in `src/lib`
- [ ] no module over ~300 lines; one responsibility each
- [ ] UI never imports `@supabase/supabase-js` or the client directly; only `features/*/api` and `src/lib/api` do
- [ ] inputs validated with Zod at boundaries (forms, edge-function bodies, URL params)

**Database**
- [ ] every schema change is a numbered file in `supabase/migrations`
- [ ] every table has `enable row level security` and policies for select/insert/update/delete as needed
- [ ] policies documented in `supabase/README.md` or `docs/` and tested in `supabase/tests`
- [ ] indexes on every foreign key and on columns used in filters; `updated_at` triggers where rows change
- [ ] seed data in `supabase/seed.sql`

**Config & secrets**
- [ ] `.env.example` lists every variable; nothing hard-coded; `.env*` git-ignored
- [ ] no service-role key in client code or Netlify build env

**Quality tooling**
- [ ] ESLint flat config, Prettier, `typecheck`, `test` scripts exist and pass
- [ ] Vitest tests for core logic and the critical flow

**UI**
- [ ] loading, empty and error states on every data-driven view
- [ ] mobile-first; semantic elements; labels on inputs; keyboard reachable; focus visible
- [ ] no `alert`/`confirm`/`prompt`

**Deploy & docs**
- [ ] `netlify.toml` with build, publish, SPA redirect, security headers
- [ ] README covers setup, architecture, conventions, add a feature, add a migration, deploy
- [ ] ADRs in `docs/adr`; `docs/scaling.md` present

## Output

A table of findings sorted by severity, then the pasted check output, then "Verdict: pass / fix
list". Pass only with zero block/fix items and all checks green.
