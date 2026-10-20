---
name: competitor-teardown
description: Tear down a fishing app or web tool into a fixed per-product card (pricing, features, ratings, review complaints, last update, user base, business model) and roll the cards into a feature matrix. Use when cataloguing competitors or checking whether an incumbent already owns a candidate feature.
---

# Competitor teardown

## When to use

Competitor cataloguing (phase 2), the validation gate's "defensible enough" criterion, red team.

## Per-product card

Fill every line; write `unknown` rather than guessing, and `estimate: <derivation>` for inferred
numbers (e.g. user base from download bands or ratings count × 50–100).

```
### <Product name> — <one-line what it is>
- Platforms: iOS / Android / web
- Pricing: free tier (what's in it) | paid tiers with exact prices and billing periods | one-time
- Business model: subscription / ads / affiliate / B2B / marketplace take rate
- Core features (bullets, ≤8)
- Ratings: App Store x.x (N ratings), Play x.x (N), Trustpilot / G2 if any
- Last update: version + date (app store "Version History" or Play "Updated on")
- User base: stated number with source, or estimate
- Owner / funding: company, acquisitions, notable investors
- Top complaints (verbatim, ≥3, from 1–3 star reviews, with dates)
- Top praise (verbatim, ≥2)
- Gaps relevant to our candidates (your analysis, ≤5 bullets)
- Sources: list of URLs with access dates
```

## Where to look

- Apple App Store listing (WebFetch works): rating, count, IAP prices, version history.
- Google Play listing: downloads band ("1M+"), "Updated on" date, rating.
- The product's own pricing page (prefer over store IAP list).
- Crunchbase / press for funding and acquisitions (secondary; cite the article).
- 1–3 star reviews: App Store, Play, Trustpilot (403 here; use search snippets), Reddit via
  search snippets (`"<app>" site:reddit.com cancelled OR subscription OR useless`).

## Feature matrix

One row per product, one column per feature. Cells: `✓` built-in, `$` paid tier only, `~`
partial/weak, `✗` absent, `?` unknown. Keep the column list to what matters for the candidates:

```
| Product | Price/yr | Catch log | Offline | Maps/depth | Forecast | Regulations | Gear inventory | Tournament | Club/group | Guide booking | B2B tools | Web app | Data export |
```

Add columns when a candidate needs them. Finish with a "white space" paragraph: cells that are `✗`
or `~` across every incumbent, and why (hard, unprofitable, or just overlooked).

## Checklist

- [ ] ≥12 products covered, including ones not in the brief's list
- [ ] Every price has a URL and date
- [ ] Every product has a last-update date (abandonment is a signal)
- [ ] Complaints are verbatim with dates
- [ ] Matrix + white-space paragraph present
