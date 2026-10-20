---
name: source-logging
description: Record every market number, price or quoted claim with a URL, publisher, publish date and access date in one table format, or label it an estimate with the derivation shown. Use whenever you write a number or quote into any research, docs or deliverables file.
---

# Source logging

## When to use

Any time you write a statistic, price, user count, rating, quote or date into a file in this
repository. No exceptions: a number without a row here can't go in the report.

## Rules

1. One row per claim. If one page supports five numbers, write five rows (same URL).
2. `Published` is the document's own date. If it only gives a data year ("2021 data"), write the
   year and say so in the claim text.
3. `Accessed` is today's date in UTC.
4. If you can't find a source, write the value as `estimate` and put the derivation in the claim
   text, naming the sourced inputs by their IDs, e.g. `estimate: S3 × S7 share (12%)`.
5. Prefer primary sources (agency reports, the company's own pricing page, the app store listing)
   over press coverage. If you only have press coverage, say so in `Publisher`.
6. Quotes are verbatim, inside quotation marks, with ellipses for cuts. Never paraphrase inside
   the quote marks.
7. Numbers that conflict across sources: log both rows and add a note which one you used and why.

## Row format

Append rows under a `## Sources` heading at the end of your file, IDs prefixed by your file's
letter (market sizing `M`, immersion `I`, competitors `C`, monetization `P`, gap analysis `G`,
red team `R`):

```
| ID | Claim / number | Value | Publisher | URL | Published | Accessed | Used in |
|----|----------------|-------|-----------|-----|-----------|----------|---------|
| M1 | US anglers age 6+ (2023 Special Report on Fishing) | 57.7M | RBFF / Outdoor Foundation | https://... | 2024-06 | 2026-10-20 | participation |
```

The lead merges these into `docs/sources.md` with global `S` IDs after each phase.

## Checklist before you finish a file

- [ ] Every number in the body has a row.
- [ ] Every row has a URL or the word `estimate` with a derivation.
- [ ] Access dates filled.
- [ ] Quotes are verbatim and linked.
