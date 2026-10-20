# Decision log

Decisions the lead agent made autonomously, with reasoning. Newest at the bottom.

| ID | Date | Decision | Reasoning |
|----|------|----------|-----------|
| D1 | 2026-10-20 | All work goes in the `Fishing-app` repo on branch `claude/zen-hawking-hmesro`. The other repo in this session (`small-trade-dashboard`) is an unrelated project and is not touched. | The mission is the fishing product; the dashboard repo's CLAUDE.md applies to that repo only. |
| D2 | 2026-10-20 | Reddit is blocked by the environment's network policy; requested as RECOMMENDED (A1), not BLOCKING. Fallback: search-engine snippets of Reddit threads (title, quoted text, URL) plus directly reachable forums, YouTube comments, app-store reviews. | Research can proceed with verbatim, linked evidence from other sources; blocking on it would idle the whole team. |
| D3 | 2026-10-20 | No Docker daemon → database-as-code is tested on plain PostgreSQL 16 (`initdb` + `pg_ctl` on a throwaway cluster) with a small shim for `auth.uid()` and Supabase roles. Supabase type generation runs with `npx supabase gen types --db-url` against that local database. | Same approach the sibling project uses successfully; migrations and RLS policies are plain SQL so the test is faithful. |
| D4 | 2026-10-20 | Each research agent keeps its own numbered sources table at the end of its `/research/<topic>.md`; the lead merges them into `/docs/sources.md` after each phase. | Four agents appending to one file concurrently would clobber each other. |
| D5 | 2026-10-20 | Default stack kept: React 19 + Vite + TypeScript (strict) + Tailwind, Supabase JS v2, Zod, Vitest, ESLint flat config + Prettier. | Matches the brief's default; no evidence yet for anything else. Revisit after product definition if the winner is content/SEO-heavy (then consider Astro or SSR). |
| D6 | 2026-10-20 | Four research agents run in parallel as fresh general-purpose agents, each briefed with the mission, constraints, the founder context, the citation rule and the relevant skill file. | Parallelism; fresh agents keep the lead's context small. |
