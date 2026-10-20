---
name: approvals-audit
description: Audit the environment for anything that needs the founder (permissions, logins, CLIs, accounts, keys, network allow-list) and produce one batched approvals message in the what/why/how/verify/fallback/priority format, then track each item in docs/approvals.md. Use at session start, after a context reset, and whenever a new external need appears.
---

# Approvals audit

## When to use

Session start (phase 0), after a context reset (re-verify, don't re-ask), and when a new
external dependency appears mid-project (send one short "NEW APPROVAL NEEDED" note).

## Checks (run them; paste results into docs/approvals.md)

```
node -v; npm -v; pnpm -v; git --version; docker info 2>&1 | head -3
psql --version; ls /usr/lib/postgresql/*/bin/initdb
npx --yes supabase --version 2>&1 | tail -1      # CLI reachable?
netlify --version 2>&1 | head -1
git -C <repo> ls-remote --heads origin | head -1   # push/read access
env | grep -iE 'supabase|netlify|stripe|resend|mapbox|maptiler' | sed 's/=.*/=<set>/'
for u in https://www.reddit.com/r/Fishing/.json https://api.weather.gov/ https://api.open-meteo.com/v1/forecast?latitude=0&longitude=0 https://registry.npmjs.org/react; do printf "%s %s\n" "$(curl -sS -o /dev/null -w '%{http_code}' --max-time 12 "$u")" "$u"; done
```

Also test one harmless call of each tool class (WebSearch, WebFetch, Write, Agent) and note
whether it prompted.

## Classify each need

- **BLOCKING** — nothing else can progress without it (rare; usually only credentials for a
  phase that has already started).
- **RECOMMENDED** — improves output or speed; has a fallback.
- **CONDITIONAL** — only if a specific candidate wins or a later phase starts (Supabase project,
  Netlify site, Stripe, data keys, domain, email). Never request these as BLOCKING before the
  validation gate passes.

## Message format (one message, titled "APPROVALS NEEDED")

For each item: **What** (exact action) · **Why** (phase, what's lost) · **How** (copy-pasteable
steps for a non-developer: where to click, which command, which `.env` variable name) ·
**How I verify** (the command or check I run) · **If skipped** (the fallback) · **Priority**.

Never ask for a secret in chat: name the variable and where it goes (environment secrets, or
`app/.env.local`, git-ignored).

## Tracking

`docs/approvals.md` has one row per item: ID, item, priority, status (pending / verified /
skipped-fallback), how/when verified. Re-run the verification commands at each phase boundary and
update status silently. Only re-raise an item if it has become BLOCKING.
