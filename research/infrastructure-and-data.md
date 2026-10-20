# Infrastructure costs and public data sources

Cross-cutting facts the validation gate needs for every candidate: hosting prices (criterion 6,
economics) and the licensing, cost and rate limits of the public data sources a fishing app is
likely to use (criterion 4, low resource requirement). Gathered by the lead on 2026-10-20.

## Hosting

### Supabase (pricing page, accessed 2026-10-20)

| Item | Free | Pro |
|------|------|-----|
| Monthly price | $0 | from $25 |
| Database size | 500 MB | 8 GB per project, then $0.125/GB |
| File storage | 1 GB | 100 GB, then $0.0213/GB |
| Egress | 5 GB | 250 GB, then $0.09/GB (cached egress $0.03/GB) |
| Monthly active users | 50,000 | 100,000, then $0.00325/MAU |
| Edge Function invocations | 500,000 | 2 million, then $2 per million |
| Pausing | paused after 1 week inactivity, max 2 active projects | never paused |

Compute is billed separately from these quotas (the Pro plan includes a compute credit; the
smallest instance is covered by it — `VERIFY` the current credit amount before launch).
Source: https://supabase.com/pricing (D1).

### Netlify (pricing page, accessed 2026-10-20)

Netlify now bills in credits. Free $0 (300 credits/mo), Personal $9/mo (1,000), Pro $20/mo
(3,000, unlimited members). Usage: production deploy 15 credits (~$0.10), compute 10 credits per
GB-hour (~$0.07), bandwidth 20 credits per GB (~$0.13), web requests 2 credits per 10k (~$0.01).
Credit packs: Personal 500 for $5; Pro 1,500 for $10. So 300 free credits ≈ 15 GB of bandwidth a
month on the free plan; a 1 MB app bundle served 10,000 times ≈ 10 GB ≈ 200 credits.
Source: https://www.netlify.com/pricing/ (D2).

### Stripe (pricing page, accessed 2026-10-20)

2.9% + 30¢ per successful domestic card transaction; Billing (subscriptions) pay-as-you-go adds
0.7% of billing volume; Checkout and Payment Links included at no extra charge. On a $5/mo
subscription the fee is $0.30 + $0.145 + $0.035 = $0.48 (9.6%); on $40/yr it is $1.74 (4.4%) —
annual billing matters at low price points. Source: https://stripe.com/pricing (D3).

### Monthly hosting estimate (any CRUD-style candidate)

| Users (paying) | Supabase | Netlify | Domain + email | Total/mo |
|----------------|----------|---------|----------------|----------|
| 100 | $0 (Free; pauses on inactivity → use Pro $25 once live) | $0 | ~$2 | $2–27 |
| 1,000 | $25 Pro (well inside quotas) | $0–9 | ~$2 | $27–36 |
| 10,000 | $25 + compute upgrade ~$10–60 + egress | $20 Pro + ~$20 credits | ~$2 + email $20 | ~$100–150 |

These are **estimates** from the quota tables above assuming < 1 GB DB per 1k users, < 10 MB
egress per user per month and no large media. Media-heavy candidates (photo uploads) push storage
and egress; still inside Pro's 100 GB/250 GB at 10k users if images are resized client-side
(≤300 KB each, 20 per user per year = 60 GB).

## Public data sources

| Source | What | Key? | Cost | Rate limit | Licence / terms | Fit at 10,000 users |
|--------|------|------|------|-----------|-----------------|---------------------|
| NOAA CO-OPS Tides & Currents API | tide predictions (high/low or 6-min), water level, water temp, wind, currents at ~3,000 US coastal stations | No | Free | No numeric limit published; "limits query volume from a single customer under heavy load"; per-request length caps (hourly/hi-lo up to 1 year) | US Government work, public domain | PASS if predictions are fetched server-side once per station per day and cached (365 days of hi/lo in one call); never per-user per-view. |
| NWS API (api.weather.gov) | 7-day and hourly forecasts, alerts, observations, coastal marine grid data | No (User-Agent header required) | Free | Unpublished "generous" limits; retry after ~5 s on 429; proxies hit limits sooner | Open, free for any purpose; no attribution clause stated | PASS with server-side caching per grid cell (forecast updates hourly); users share cells. |
| Open-Meteo | global weather forecast, marine (waves), historical weather | No for free tier | Free **non-commercial only**: 10,000 calls/day, 600/min; commercial plans priced per monthly call budget (Standard 1M calls/mo; price not shown on page) | CC BY 4.0, attribution required | A commercial app must buy a plan (`VERIFY` current price; historically ~€29/mo for Standard). Still PASS at 10k users if cached per location. Use only for non-US coverage or marine wave data NWS lacks. |
| USGS Water Services | river/lake instantaneous values (flow, gauge height, temp), daily values, site search | No | Free | Not published on the docs index page; legacy `waterservices.usgs.gov` services are being migrated to `api.waterdata.usgs.gov` (`VERIFY` deprecation dates before building) | US Government, public domain | PASS for river/lake candidates with caching; plan for the API migration. |
| State fishing regulations | seasons, limits, sizes per species per water | — | Free pages/PDFs, no API in most states | Rate limits n/a | Public information, but formats differ per state and change yearly | FAIL as an automated source: maintaining 50 states' rules by hand is the "large proprietary dataset" the gate forbids; Fish Rules already licenses this. Any regulation feature must link out, not restate. |
| Solunar / sun / moon | sunrise, moonrise, moon phase, solunar periods | — | Pure math (SunCalc-style libraries, MIT) | n/a | MIT | PASS, computed on the client. |
| Mapping tiles | base maps | Key (MapTiler/Mapbox) | MapTiler free: 100k tile loads/mo; Mapbox free: 50k map loads/mo (`VERIFY` current tiers) | per plan | per plan | PASS for light use; avoid map-centric candidates (incumbents own depth charts). |

## Takeaways for the gate

1. Hosting is not the constraint: under $40/mo to 1,000 users on either plan mix. Break-even at a
   $5–8/mo price is < 10 paying users; the real economics question is acquisition and churn.
2. Tides, weather, water levels, sun/moon are free, key-less and public domain in the US. Any
   conditions-related candidate passes criterion 4 as long as data is fetched and cached
   server-side (one Supabase cron/edge function per station or grid cell), never per user.
3. Regulations and depth charts are the two data sets a solo founder must not try to own.
4. Open-Meteo is **not** free for a paid app; use NWS for US weather and reserve Open-Meteo for a
   paid plan if non-US or wave data is needed.
5. Stripe fees punish sub-$5 monthly prices; prefer annual plans or ≥ $8/mo.

## Sources

| ID | Claim / number | Value | Publisher | URL | Published | Accessed | Used in |
|----|----------------|-------|-----------|-----|-----------|----------|---------|
| D1 | Supabase plan prices and quotas | Free $0; Pro from $25; quotas as tabled | Supabase | https://supabase.com/pricing | 2026 (live page) | 2026-10-20 | economics |
| D2 | Netlify plan prices and credit costs | Free 300 credits; Personal $9; Pro $20; bandwidth 20 credits/GB | Netlify | https://www.netlify.com/pricing/ | 2026 (live page) | 2026-10-20 | economics |
| D3 | Stripe fees | 2.9% + 30¢; Billing 0.7%; Checkout included | Stripe | https://stripe.com/pricing | 2026 (live page) | 2026-10-20 | economics |
| D4 | NOAA CO-OPS API: no key, products, throttling language, request caps | as tabled | NOAA | https://api.tidesandcurrents.noaa.gov/api/prod/ | 2026 (live page) | 2026-10-20 | data |
| D5 | NWS API: no key, User-Agent required, unpublished limits, open data | as tabled | NWS | https://www.weather.gov/documentation/services-web-api | 2026 (live page) | 2026-10-20 | data |
| D6 | Open-Meteo: free non-commercial 10,000 calls/day; commercial plans by call budget; CC BY 4.0 | as tabled | Open-Meteo | https://open-meteo.com/en/pricing | 2026 (live page) | 2026-10-20 | data |
| D7 | USGS Water Services: services list; no key stated | as tabled | USGS | https://waterservices.usgs.gov/docs/ | 2026 (live page) | 2026-10-20 | data |
