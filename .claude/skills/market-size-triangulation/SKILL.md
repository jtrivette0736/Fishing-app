---
name: market-size-triangulation
description: Derive participation, spend and TAM/SAM/SOM for a fishing segment with the math shown, reconciling conflicting sources (ASA, RBFF/Outdoor Foundation, USFWS National Survey, state license data). Use when sizing the market or a candidate's reachable segment.
---

# Market-size triangulation

## When to use

Market sizing (phase 2), each candidate's segment size in gap analysis, the report's TAM/SAM/SOM.

## Preferred sources, in order

1. USFWS *National Survey of Fishing, Hunting and Wildlife-Associated Recreation* (every 5 years;
   2022 edition published 2023) — participants 16+, days, expenditures by category.
2. RBFF / Outdoor Foundation *Special Report on Fishing* (annual) — participants 6+, newcomers,
   churn, demographics, freshwater/saltwater/fly splits.
3. ASA / Southwick *Sportfishing in America* and *Economic Contributions* — spend, output, jobs.
4. USFWS *National Fishing License Data* (annual, by state) — paid license holders, revenue.
5. Segment bodies: B.A.S.S./MLF membership, Trout Unlimited, AFTMA/Fly Fishing Industry, NMMA for
   boats, the Kayak fishing counts from the RBFF report.
6. Company statements / press for app user counts (label as company claim).

Different sources count different populations (6+ vs 16+; "participated once" vs "license
holder"). Always state which population a number describes. Never add numbers from different
populations.

## Derivation template

Write the math inline so a reader can redo it:

```
TAM (US, annual) = participants in segment × avg annual spend in relevant category
  = 11.4M (M3, bass-focused anglers 2023) × $X (M7, tackle spend per angler) = $...
SAM = TAM × share that is digitally reachable and matches the job (state the filter and its source)
SOM (year 1–3) = SAM × realistic capture, bounded by comparable products' paid bases (C-series ids)
```

Give a low / base / high for SOM and say which input drives the range.

## Reconciling conflicts

- Log both numbers (source-logging rows).
- Prefer the primary source and the population that matches your use.
- If the gap is > 20%, explain it (different year, population or method) in one sentence.

## Seasonality and trend

Always include: participation trend over the last 5 reported years, the 2020–2021 spike and its
retention, and the seasonality shape (license sales / Google Trends by month for the segment).
These feed the "seasonality" risk in the gate.

## Checklist

- [ ] Every number has a source row
- [ ] Populations stated (age cut, definition)
- [ ] TAM/SAM/SOM math shown with ids
- [ ] Low/base/high for SOM
- [ ] Trend and seasonality covered
