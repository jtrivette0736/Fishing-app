---
name: pain-point-mining
description: Mine forums, Reddit (via search snippets when blocked), YouTube comments, Facebook groups and app-store reviews for verbatim angler complaints and wishes; tag them, link them, and tabulate them in the format the validation gate consumes. Use when gathering pain evidence for any candidate or segment.
---

# Pain-point mining

## When to use

Hobby immersion research, the validation gate's "functionality case" (needs ≥10 independent
verbatim examples per candidate), red-team re-checks.

## Environment notes (this project)

- `reddit.com` is blocked by the network policy (HTTP 403). Do not spend more than one attempt on
  direct Reddit fetches. Instead run WebSearch with `site:reddit.com` queries; the result snippets
  carry verbatim text. Log the thread URL from the result and quote only what the snippet shows.
  Re-test direct access once per session: `curl -s -o /dev/null -w '%{http_code}' https://www.reddit.com/r/Fishing/.json`
  — if it returns 200, approval A1 landed and you can fetch `old.reddit.com/<thread>.json`.
- Reachable directly (verified 2026-10-20): stripersonline.com, tackletour.com, ifish.net,
  thehulltruth.com, youtube.com, facebook.com (public posts), apps.apple.com, play.google.com.
  BassResource forums return 502 through the proxy; use search snippets for them.
- WebFetch answers a prompt about a page; ask it to "quote verbatim every sentence that
  complains about X, with the poster's handle and date" to keep text exact.

## Search recipe

For each segment × job, run at least these query shapes (swap the nouns):

1. `site:reddit.com r/<sub> "is there an app" <job>`
2. `site:reddit.com <sub> "wish there was" OR "why isn't there" <topic>`
3. `<forum domain> "<topic>" frustrating OR annoying OR "pain in the"`
4. `"<competitor app>" review "cancelled" OR "not worth" OR "subscription"`
5. `<topic> spreadsheet OR notebook OR "keep track" fishing`  (reveals manual workarounds)
6. `<topic> "anyone know" OR "how do you" fishing` (reveals unmet how-to needs)
7. YouTube: search `<topic> fishing`, open the top 3 videos, read comments for complaints.
8. App stores: open the competitor listing, read 1–3 star reviews (WebFetch prompt: "quote the
   1-3 star reviews verbatim with dates").

Stop a query shape when two consecutive runs add no new independent source.

## Tag vocabulary

Tag each quote with one **job** and one or more **pain types**:

- Job: `log-trips`, `find-spots`, `plan-conditions`, `regulations`, `gear-inventory`,
  `gear-maintenance`, `tournament`, `club-admin`, `guide-booking`, `guide-ops`, `shop-ops`,
  `learning`, `sharing`, `other:<free text>`
- Pain type: `manual-workaround`, `missing-feature`, `too-expensive`, `privacy`, `data-lock-in`,
  `inaccurate`, `offline`, `ads`, `complexity`, `abandoned-app`

## Independence rule

Ten examples must be ten different people (handles) on at least three different platforms or
threads. Two comments by one person count once. Two replies in one thread count as two people
but one thread.

## Output table

```
| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Intensity 1-3 |
```

Intensity: 1 = mild annoyance; 2 = built or bought a workaround; 3 = quit, paid, or asked for a
product by name. Follow each table with a 3-line summary: what they do today, what they want, what
they'd pay (if said).

## Checklist

- [ ] ≥10 independent quotes per candidate job
- [ ] Every quote has a URL and date
- [ ] Workarounds (spreadsheets, notebooks, paid tools) called out explicitly
- [ ] Counter-evidence recorded too: people saying "I don't need an app for this"
