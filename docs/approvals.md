# Approvals log

Every action that only the founder can perform, with its current status. Updated by the lead
agent as items are verified. Nothing here is BLOCKING as of the preflight (2026-10-20).

| ID | Item | Priority | Status | Verified how / when |
|----|------|----------|--------|---------------------|
| A1 | Allow `reddit.com`, `www.reddit.com`, `old.reddit.com`, `api.pullpush.io` in the environment network policy | RECOMMENDED | pending | `curl https://www.reddit.com/r/Fishing/.json` → 403 on 2026-10-20 22:05 UTC. Fallback in use: search-engine snippets + reachable forums. |
| A2 | Supabase account + project; `SUPABASE_ACCESS_TOKEN`, `SUPABASE_PROJECT_REF`, `SUPABASE_DB_PASSWORD` as environment secrets | CONDITIONAL (after gate) | not requested as blocking yet | Will verify with `npx supabase link && npx supabase db push`. Fallback: local Postgres 16 for migrations/RLS tests. |
| A3 | Netlify account + site; `NETLIFY_AUTH_TOKEN`, `NETLIFY_SITE_ID` | CONDITIONAL (after gate) | not requested as blocking yet | Will verify with `curl -I` on the site URL. Fallback: netlify.toml + README; prototype published as an Artifact. |
| A4 | Stripe test-mode keys (`STRIPE_SECRET_KEY`, `STRIPE_WEBHOOK_SECRET`, `VITE_STRIPE_PUBLISHABLE_KEY`) | CONDITIONAL (after gate, if in-app billing) | not requested | Fallback: billing behind a feature flag. |
| A5 | Third-party data API keys | CONDITIONAL on winning candidate | not requested | Free key-less sources (NOAA, USGS, Open-Meteo) verified reachable 2026-10-20. |
| A6 | Domain | CONDITIONAL (launch) | not requested | — |
| A7 | Transactional email (Resend) | CONDITIONAL (launch) | not requested | — |

## Preflight audit (2026-10-20)

Verified working without the founder:

- Tools: WebSearch, WebFetch (most sites), Bash, file read/write, Agent (subagents), skill creation,
  TaskCreate. All ran without permission prompts (auto mode).
- Package installs: `registry.npmjs.org` is on the proxy's no-proxy list; `npm`, `pnpm`, `yarn` present.
- Git: `git ls-remote origin` on `jtrivette0736/Fishing-app` succeeds with the session token.
- Local tooling: Node v22.22.0, npm 10.9.4, pnpm 10.28.0, git 2.43.0, Python 3.13, PostgreSQL 16.15
  binaries (`initdb`, `pg_ctl`, `psql`), Chromium + Playwright preinstalled.
- Public data reachable: `api.weather.gov` 200, `api.open-meteo.com` 200, `waterservices.usgs.gov` 200,
  `api.tidesandcurrents.noaa.gov` 400 (reachable; needs params). YouTube, Facebook, Play Store,
  Apple App Store, StripersOnline, TackleTour, iFish pages fetch.

Not available:

- Docker daemon (client only) → no local Supabase stack. Fallback: plain Postgres 16.
- Supabase CLI and Netlify CLI not installed globally, but `npx supabase@latest` and `npx netlify-cli@latest` both run (verified 2026-10-20 22:25 UTC). Deno not installed (only needed if we ship Supabase edge functions; `npx supabase functions serve` bundles Deno).
- Throwaway PostgreSQL 16 cluster verified: `initdb`/`pg_ctl` as the `postgres` user under `/tmp`, `auth.uid()` shim, RLS policy creation all work (22:28 UTC). This is the migration/RLS test harness for phase 5.
- Reddit (403 via proxy, and Reddit also blocks reader proxies such as r.jina.ai), Trustpilot (403),
  api.pullpush.io (429), BassResource forums (502), thehulltruth.com (403) → search-engine snippets
  (`site:reddit.com …`) and reachable forums (stripersonline, tackletour, ifish, walleyecentral).
- No Supabase or Netlify login on this machine; no project exists yet.
