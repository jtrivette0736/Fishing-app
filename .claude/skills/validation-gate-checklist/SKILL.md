---
name: validation-gate-checklist
description: Run a candidate through the six mandatory validation-gate criteria (functionality case, willingness to pay, organic marketability, low resource requirement, defensibility, economics) with pass/fail justifications and linked evidence, in the format docs/validation-gate.md uses. Use before any product definition or code, and for the red-team re-run.
---

# Validation gate checklist

## When to use

Each candidate in rank order (gap analysis), the targeted evidence round on the leader, and the
Red Team's independent re-run. A candidate must pass ALL six. One fail → next candidate.

## The six criteria, with pass conditions

1. **Functionality case** — PASS only if: a concrete job named in one sentence; ≥10 independent
   verbatim examples of the pain (different handles, ≥3 platforms/threads) with URLs and dates;
   and a table mapping each core feature to the quotes it resolves. "Nice to have" fails: if the
   quotes say "would be cool" rather than describing a workaround or loss, score it FAIL.
2. **Willingness to pay** — PASS only if: named products/services people pay for today for this
   job or its workaround, with prices and a volume signal (ratings count, subscriber claim,
   revenue, hired-service prices); and a stated price point the evidence supports.
3. **Organic marketability** — PASS only if: a path to the first 100 paying users with no ads:
   named channels (subreddits with subscriber counts, forums, YouTube creators, Facebook groups,
   shops, clubs, guides, SEO queries with search-volume evidence, the founder's Instagram) and the
   math: reach × conversion = users, per channel. Note any built-in loop (shareable output,
   SEO-indexable pages, B2B2C).
4. **Low resource requirement** — PASS only if: no licensed/expensive data, no large proprietary
   dataset, no cold-start network effect, no moderation at scale, no hardware; every third-party
   data source has a verified licence/terms URL, cost and rate limit that works at 10,000 users
   (show the arithmetic).
5. **Defensible enough** — PASS only if: a written reason an incumbent (Fishbrain, Garmin/
   Navionics, onX, FishingBooker…) wouldn't trivially copy it or doesn't already own it (business
   model conflict, segment too small for them, workflow/data lock-in, founder's distribution).
6. **Economics** — PASS only if: break-even within the first 100–300 paying users at the proposed
   price, using real hosting estimates (Supabase Pro $25/mo + usage, Netlify Pro $19/mo or free,
   domain, email, payment fees ~2.9%+30¢), shown as a small table at 100 / 300 users.

## Output format (goes in docs/validation-gate.md)

```
## Candidate: <name> — <one-sentence job>
| Criterion | Verdict | Justification (≤120 words) | Evidence ids / links |
|---|---|---|---|
| 1 Functionality case | PASS/FAIL | ... | I12, I15, ... |
...
**Result:** PASS (6/6) or FAIL at criterion N → next candidate.
```

Then a "Feature → pain" table for criterion 1 and the cost table for criterion 6.

## Rules

- Quote verbatim; link everything. Don't reuse one person twice.
- Be adversarial: write the strongest reason to FAIL before writing PASS.
- If evidence is thin, run the pain-point-mining skill for that candidate first (targeted round),
  then re-score. Max one targeted round per candidate.
- Record the result in docs/validation-gate.md even for failed candidates (why each failed).
