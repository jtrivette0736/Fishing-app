# Skills log

Claude Code skills created during this project (`.claude/skills/<name>/SKILL.md`), when they were
first used, and what each saved.

| Skill | Created | Used by | What it saved |
|-------|---------|---------|---------------|
| `source-logging` | 2026-10-20 (phase 1) | all research agents, lead | One citation row format for every agent, so the lead merges tables instead of re-formatting four styles; forces access dates and the estimate label. |
| `pain-point-mining` | 2026-10-20 (phase 1) | hobby immersion agent, gate evidence round | Search recipe for verbatim complaints when Reddit is blocked, the tag vocabulary, and the evidence table the gate consumes directly. |
| `competitor-teardown` | 2026-10-20 (phase 1) | competitor agent, red team | Per-app template + feature matrix columns; the agent fills blanks instead of deciding structure. |
| `market-size-triangulation` | 2026-10-20 (phase 1) | market sizing agent, gap analysis | TAM/SAM/SOM derivation steps with the math shown, which sources to prefer, and how to reconcile conflicting numbers. |
| `opportunity-scoring` | 2026-10-20 (phase 1) | gap analysis agent, red team | Fixed anchors and weights for the nine criteria so two agents score the same way; forces evidence ids per score. |
| `validation-gate-checklist` | 2026-10-20 (phase 1) | gap analysis agent, red team | The six pass conditions written as tests, plus the table format `docs/validation-gate.md` uses; the red team re-runs the same checklist independently. |
| `code-review-against-standards` | 2026-10-20 (phase 1) | architecture agent, red team | One checklist for the CODE QUALITY STANDARDS with the mechanical commands first; findings as file:line with severity. |
| `approvals-audit` | 2026-10-20 (phase 1) | lead (phase 0, after context resets) | The audit commands and the what/why/how/verify/fallback/priority format, so a re-audit after a reset takes minutes and never re-asks a verified item. |

## Use record (who actually used what, and what it saved)

| Skill | Used in | Saved |
|-------|---------|-------|
| `source-logging` | all 4 research agents, both evidence agents, gate run, red team, product definition, report | Every file's sources table had the same 8 columns, so `scripts/merge-sources.py` merged 727 rows mechanically and the report agent could machine-check all 442 citation pairs against one table (0 mismatches) instead of re-reading nine files. |
| `pain-point-mining` | hobby immersion (367 rows), both targeted evidence rounds (54 + 42 rows), red-team disproof searches | One tag vocabulary and intensity scale across four agents; the independence rule (different handles, ≥3 platforms) was applied identically, which is what made the gate's "24 people on 12 platforms" count checkable. |
| `competitor-teardown` | competitor agent (45 cards), logbook evidence (incumbent export facts), red team (free-substitute check) | The fixed card meant the gate and red team could look up "last update", "price" and "complaints" per product without re-fetching. |
| `market-size-triangulation` | market sizing (14 estimate rows with derivations), report §6 TAM/SAM/SOM | Populations stated on every number (6+ vs 16+), so the report never added incompatible counts. |
| `opportunity-scoring` | gap analysis (14 candidates), red team (re-scored the top 3) | Two agents produced comparable weighted totals (63 / 61 / 61) from the same anchors; runner-up reasons came out as one line each. |
| `validation-gate-checklist` | gate run (candidate a), both evidence agents' "honest verdict" sections, red team's independent re-run | The red team could re-run the gate from raw evidence in the same six-row format and the report could put both verdict columns side by side. |
| `code-review-against-standards` | 5a scaffold self-review, 5b self-review, red-team pass 2 | The mechanical checks run first (`npm run check`, `npm run test:sql`), so review time went to RLS, tokens and metering rather than formatting. |
| `approvals-audit` | phase 0, and the re-check after the gate passed (A2–A4 upgraded to RECOMMENDED, founder actions F1–F4 added) | One batched approvals message at the start, no repeat requests; verification commands recorded so a context reset can re-check in minutes. |

Lead's tools that grew out of the skills: `scripts/merge-sources.py` (regenerates `docs/sources.md`),
`scripts/build-report-html.py` (report.md → report.html, preserves TODO markers),
`scripts/revenue-model.py` (the report's projection model with cited inputs).
