---
name: opportunity-scoring
description: Score candidate product opportunities 1–5 on the nine mission criteria with fixed anchors and weights, rank them, and record why runners-up lost. Use when building or revising the candidate shortlist in gap analysis or after a red-team veto.
---

# Opportunity scoring

## When to use

Gap analysis shortlist (≥8 candidates), re-ranking after a gate failure or red-team veto.

## Criteria, weights and anchors

| # | Criterion | Weight | 1 | 3 | 5 |
|---|-----------|--------|---|---|---|
| 1 | Pain intensity | 3 | mild, occasional | recurring, people build workarounds | people quit, pay or ask for a product by name |
| 2 | Evidence of willingness to pay | 3 | nobody pays for anything similar | paid adjacent tools exist | people pay today for this exact job (named prices) |
| 3 | Competition weakness | 2 | strong, well-rated, active incumbent | incumbents cover it partially or badly (complaints) | nobody does it, or incumbents abandoned it |
| 4 | Fit for Supabase/Netlify | 1 | needs heavy realtime/geo/ML or native hardware | some edge functions, cron | plain CRUD + auth + storage |
| 5 | Solo-buildability | 2 | months of specialist work (maps, ML, payments at scale) | 6–10 weeks to a sellable v1 | 2–4 weeks to a sellable v1 |
| 6 | Time-to-first-revenue | 2 | >6 months (network effects, long B2B cycle) | 60–90 days | first payment possible in week 1 of launch |
| 7 | Defensibility | 1 | trivially copied, no data/distribution moat | some switching cost or data accumulation | accumulating proprietary data, workflow lock-in, or distribution incumbents lack |
| 8 | Organic distribution ease | 2 | needs ads; no community that talks about it | reachable communities exist, no built-in loop | SEO demand + shareable output + a named channel the founder already has |
| 9 | Low outside-resource need | 2 | licensed data, hardware, moderation, cold start | one free/cheap API with checked terms | no third-party data at all |

Weighted score = Σ (score × weight); max = 90. Report both the raw grid and the weighted total.

## Procedure

1. Write each candidate as one sentence: *"<who> pays for <tool> to <job> instead of <workaround>"*.
   If you can't fill every blank from evidence, the candidate is not ready to score.
2. Score with the anchors. Cite the research row ids (I, C, P, M series) that justify each score;
   a score with no id gets a 2 at most.
3. Rank by weighted total. Ties: higher criterion 2, then 1.
4. For each runner-up, write one line: the criterion that sank it and the evidence.
5. Hand the ranked list to the validation-gate skill, top first.

## Output

```
| Rank | Candidate | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | Weighted | Evidence ids | Why it lost (if not #1) |
```

## Checklist

- [ ] ≥8 candidates, each a complete sentence
- [ ] Every score has ids
- [ ] Weighted totals computed and shown
- [ ] Runner-up reasons written
