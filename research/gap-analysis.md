# Gap analysis — candidates, scores, ranking and gate previews (step 1 of 2)

Gap Analysis Agent, 2026-10-20. Desk analysis only: no new searches were run; every claim below
points at a row already on disk in `research/` or is labelled `estimate` with its derivation in
section 6. Rubric: `.claude/skills/opportunity-scoring/SKILL.md` (nine criteria, weights 3/3/2/1/2/
2/1/2/2, max 90). Gate criteria referenced in section 4: `.claude/skills/validation-gate-checklist/`.

**How to read the ids.** The five research files reuse letters, so:

| Prefix | File | Example |
|---|---|---|
| `I-` + row | `hobby-immersion.md` pain/wish/WTP/counter rows (E, F, P, R, G, M, T, C, B, O, S, L, H, W, Y, N) | `I-E9`, `I-M26`, `I-S13`, `I-W30`, `I-Y23`, `I-N1` |
| `I` + number | `hobby-immersion.md` source pages | `I84`, `I95` |
| `C` + number | `competitors.md` sources; `C§n` = its section n | `C79`, `C§7` |
| `P` + number | `monetization.md` sources; `P§Sn` = its summary point n; `P§7f` = its section 7f | `P67`, `P§S7` |
| `M` + number / `M-E` + number | `market-sizing.md` sources / its estimates | `M59`, `M-E13` |
| `D` + number | `infrastructure-and-data.md` | `D4` |
| `G` + number | new estimates made in this file (section 6) | `G1` |

**Founder context used in scoring.** Solo, no dev team, no ad budget. Owns Storm Proof Tackle
(Virginia Beach): a $30 spinning-reel service, $10+ guide replacement, six generic shop products,
a WordPress template site with placeholder copy and a dead "Book NOW" button (P1–P5). Instagram
size unknown (P7). The monetization file's judgement, adopted here: no measurable distribution
advantage today, but a real trust/persona advantage for anything sold to reel/rod shops (P§S9).

**Structural note on the rubric, stated up front.** Five of the nine criteria (fit, buildability,
defensibility, distribution, resource need) carry 8 of the 18 weight points and are maxed out by any
small CRUD utility. That is why three thin-pain inventory/record tools (e, k, d) land within four
points of the leaders. The scores are reported as the anchors dictate; section 3 says which of
those the gate's ≥10-verbatim test will remove, and section 5 recommends a gate order that does not
follow raw rank blindly.

---

## 1. Candidates

Each written as the skill requires: *who* pays for *tool* to *job* instead of *workaround*.

**a. Reel/rod service job tracker (B2B; founder is customer zero).** Independent reel and rod
repair shops pay for a job-tracking tool (intake form, quote and approval, tokenised status page,
customer email/text updates, pickup/ship reminders, per-reel service history) to run their service
counter instead of a printed work order shipped in the box, email threads, phone calls, PayPal
invoices and a blanket "8 Week Turnaround" line on the website (P67–P73, P1–P5, I-S1, I-S13).

**b. Private, exportable web-first fishing logbook with automatic conditions.** Avid anglers who
already keep records pay for a private web logbook that stamps each entry with NOAA tide, NWS
weather and moon phase at that time and place, and shows patterns across years, with CSV/GPX
export and no social layer or shared map, instead of Excel kept since 1995, a tide-log book, a
waterproof notepad, Word documents printed quarterly, pocket calendars and phone photos
(I-E1–E58, §4 of the immersion file).

**c. Fishing club administration.** Volunteer officers of fishing clubs pay per club per year for a
web admin (members, dues, meetings, points and standings, email/SMS to members, a public club page)
instead of an email address for membership, a forum thread as the membership list, PayPal and a
member-built spreadsheet, with tournament scoring handed off to TourneyX/FishDonkey/Weighfish
(I-C1–C17, I-T1–T13).

**d. Personal gear record with service reminders (consumer).** Anglers who own several reels pay
once or yearly for a private gear record (reels, rods, line; service intervals, line age,
saltwater-rinse reminders, cost history) instead of a spreadsheet, memory, or waiting "until the
bail doesn't flip smoothly" (I-M4–M18, I-M48).

**e. Fly-tying materials inventory.** Fly tiers pay for a materials-and-patterns inventory with
stock levels and reorder flags instead of a colour-coded Excel sheet kept for eight years, a 4x6
notebook, a January count, or buying a fourth hare's mask (I-G4–G16).

**f. Small-club tournament director tool.** Volunteer directors of weigh-in clubs pay (or their
anglers pay per entry) for weigh-in scoring with automatic points, payouts and angler-of-the-year
standings instead of paper forms, a member-built Excel scoring model and standings corrections
posted to the forum (I-T1–T21).

**g. Charter/guide weather-reschedule and no-show tool (customer-paid fee).** Independent captains
and guides pay nothing, and their customers pay a small per-booking fee, for a tool that holds a
card, sends weather-reschedule and meeting-point messages and confirms bookings, instead of
chasing customers by phone and eating no-call no-shows (I-B6–B18, I-O8).

**h. Licence and registration expiry wallet.** Multi-state and travelling anglers pay for a wallet
that stores each licence, boat registration and expiry (multi-year included) and reminds them
before renewal, instead of a forum friend's July-1 post, "remembering what year it expires", or
buying a lifetime licence (I-R1–R6, I-R28).

**i. "Where do I get my reel serviced" directory with a mail-in request flow (two-sided).** Anglers
who do not know where to send a reel use a directory of independent techs with prices, turnaround
and a mail-in request form, and shops pay for listings or leads, instead of asking the forum,
two-hop service through a tackle shop to the OEM, or an 8-week backlog (I-M20–M37, I-M1).

**j. Private waypoint/spot record with manual coordinates and GPX export.** Anglers who keep spots
in chartplotters, hand-typed coordinate lists or crowd-sourced apps pay once for a private spot
record (manual lat/long entry, notes, catch links, GPX in and out) instead of Navionics at
$49.99/yr, Fishbrain pins that are wrong or private land, or a notebook (I-F1–F29).

**k. Tackle inventory with cost and value (general anglers).** Anglers with large collections pay
for a private, multi-device tackle inventory (photo, name, size, colour, quantity, cost, resale
value) instead of Excel via Documents To Go, a dead SmartTacklebox, or not knowing what they own
and buying duplicates (I-G1–G3, I-G21–G24).

**l. Offline regulation cache with emergency-order alerts.** Offshore and travelling anglers pay
for a regulations app that caches current rules offline and alerts on emergency orders, instead of
Fish Rules that "can't do it with no signal offshore" and paper booklets (I-R12–R27).

**m. Season recap generator.** Anglers who keep (or import) a log pay once for an end-of-season
recap (stats, best tide/moon/wind patterns, a shareable image with no locations) instead of
eyeballing a spreadsheet or "hunting through pictures on my phone" (I-E11, I-E33, I-W14–W15).

**n. Reel parts and bearing-spec lookup by model.** Anglers and techs who service reels themselves
pay for a per-model database of bearing dimensions, part numbers and sources instead of measuring,
asking the forum or waiting on OEM support (I-M21, I-M38–M42, I-W32).

Every blank in every sentence is filled from evidence on disk; all fourteen are scoreable.

---

## 2. Scoring grid

Criteria: 1 pain intensity (×3), 2 willingness to pay (×3), 3 competition weakness (×2), 4 fit for
Supabase/Netlify (×1), 5 solo-buildability (×2), 6 time to first revenue (×2), 7 defensibility
(×1), 8 organic distribution (×2), 9 low outside-resource need (×2). Ties broken by criterion 2,
then 1, per the skill.

| Rank | Candidate | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | Weighted | Evidence ids | Why it lost (if not #1) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | a. Reel/rod service job tracker (B2B) | 2 | 3 | 4 | 4 | 4 | 4 | 4 | 3 | 5 | **63** | P67–P73, P1–P5, P80, P111–P113, P§S7, P§7f, I-S1, I-S13, I-M1, I-M26, I-M29, I-S5, D1–D3 | — (but criterion 1 is a 2: no first-person shop complaint on disk) |
| 2 | b. Private web logbook, auto conditions | 4 | 4 | 3 | 3 | 3 | 3 | 2 | 3 | 4 | **61** | I-E1–E58, I-W1–W19, I-P29–P30, I-Y1, I-Y10–Y13, I95, C13–C15, C20–C22, C§7, D4–D6 | 7/3: Fishing Points already has web + private log at 10M installs and can add export in weeks (C20, C22, C§7); export-by-design gives away the moat |
| 3 | e. Fly-tying materials inventory | 3 | 3 | 2 | 5 | 5 | 3 | 2 | 3 | 5 | **61** | I-G4–G16, I-G1–G3, I-W26, I-W28, I-L12–L13, I-Y20, C87, C88, C27, C77, C78, C91 | 1: one platform (FAOL), threads 2006–2013, intensity mostly 1; fails the gate's three-platform rule on current evidence |
| 4 | k. Tackle inventory with cost/value | 2 | 3 | 4 | 5 | 5 | 3 | 2 | 2 | 5 | **60** | I-G1–G3, I-G21–G24, I-G29, I-W25, I-W27, I-Y21, I118, C13, C14, C74, C77, C78, C91, C105 | 1: "real but low-intensity except for fly tiers" (immersion takeaway 8); one 2010 thread plus a snippet |
| 5 | f. Small-club tournament director tool | 4 | 5 | 1 | 3 | 3 | 2 | 1 | 3 | 5 | **59** | I-T1–T21, I-W37–W41, I-Y28, I-Y29, C51–C61, P57, P59, P61, P§S8 | 3: TourneyX, FishDonkey, Weighfish and Fishing Chaos are active, rated and already priced per angler; "the slots are taken" (P§S8) |
| 6 | d. Personal gear record with reminders | 2 | 3 | 4 | 4 | 4 | 3 | 2 | 3 | 5 | **59** | I-M4–M18, I-M47, I-M48, I-Y23–Y26, P67–P73, C79, C13, C§9, I69 | 1: nobody describes tracking service dates except one spreadsheet user (I-M48); the maintenance pain is access and parts, which a record does not fix |
| 7 | i. Reel-service directory + mail-in flow | 4 | 2 | 3 | 5 | 4 | 2 | 3 | 4 | 3 | **58** | I-M1, I-M20, I-M22, I-M25, I-M33–M37, I-W30–W31, I-S5–S7, P67–P73, P80, P123 | 2: no evidence any shop pays for leads or listings; anglers pay for the service, not for finding it |
| 8 | c. Fishing club administration | 2 | 3 | 4 | 4 | 3 | 2 | 3 | 3 | 5 | **56** | I-C1–C17, I-T4, C60, C61, C106, C107, P55, P108, P109, M52–M56, P§7c–7d | 6: one volunteer decision per club per winter; and pain is provisional (one club, one forum, I-C1–C17) |
| 9 | j. Private waypoint record, GPX export | 3 | 4 | 2 | 3 | 4 | 3 | 2 | 2 | 3 | **54** | I-F1, I-F4, I-F7–F17, I-F27–F28, I-W23–W24, I-P17, I-Y3, I-Y5, C9, C11, C20, C80, I-H14–H16 | 3: Navionics (GPX both ways), chartplotters, Fishing Points and Fishbrain Pro already store private waypoints (C9, C20, C1) |
| 10 | m. Season recap generator | 2 | 2 | 2 | 4 | 5 | 3 | 1 | 4 | 4 | **53** | I-E11, I-E33, I-E42, I-W8, I-W14–W15, C13, I95, D4 | 1: the asks are "more stats would be nice" (I-W14–W15), which the gate's functionality test rejects; it is a feature of b |
| 11 | h. Licence/registration expiry wallet | 2 | 2 | 3 | 4 | 5 | 2 | 1 | 2 | 5 | **51** | I-R1–R8, I-R23–R29, I-Y32, I85, I100–I102 | 2: expected free or bundled with the licence (I-Y32, I85); the one paid wallet found has no ratings (I102) |
| 12 | g. Charter reschedule / no-show tool | 3 | 4 | 2 | 3 | 3 | 2 | 2 | 2 | 3 | **50** | I-B1–B22, I-O1–O13, P39, P99–P102, P§7a, C65, C67, C69, C71 | 3/8: FareHarbor, Guidesly Pro and FishingBooker already sell this at customer-paid or commission prices (P99, C71, C67); reaching captains means in-person sales with no founder channel |
| 13 | l. Offline regulation cache + alerts | 4 | 3 | 2 | 3 | 2 | 2 | 2 | 3 | 1 | **46** | I-R12–R27, I-W34–W36, I85, C30–C36, C1, C23, P25, D (regulations row) | 9: fifty states' rules maintained by hand is the proprietary dataset the gate forbids (D); Fish Rules is free and NOAA-backed (P25) |
| 14 | n. Reel parts / bearing-spec database | 3 | 2 | 2 | 5 | 2 | 2 | 4 | 4 | 1 | **46** | I-M21, I-M33–M42, I-W32, I-L8–L9, P72, I126 | 9: a hand-built schematic and spec dataset is months of work with copyright exposure; specs are expected free |

Weighted = Σ(score × weight); max 90. Tie-breaks applied: b over e (criterion 2: 4 vs 3); f over d
(5 vs 3); l over n (3 vs 2).

### 2.1 Score rationale, one line per criterion (every score has ids; scores capped at 2 where the research did not look)

**a. Reel/rod service job tracker**
- 1 = 2. Business-side words describe the process, never complain about it: printed work order in
  the box (P68, P69, P72); "8 Week Turnaround on all repairs" (P69); closures of 4–8 weeks (P69–P71);
  "invoiced after work" (P67); "pay in full before return" (P72); "Dont wait till March… beat the
  spring rush" (I-S1); "Items that are not collected after three months will be sold… we will quote
  the work before commencement" (I-S13); the founder's own dead "Book NOW" and "$0.00" repairs
  heading (P1, P5). The immersion file states the finding plainly: "Nobody on the shop side
  complained about their own tracking software" (§3.11). Angler-side pain the status page would
  resolve is strong (I-M1 8-week backlog, I-M26 5-week wait, I-M29, I-S5, I-S6; 44 handles, 7
  platforms), but the buyer is the shop. Scored 2 as instructed; this is the thing the evidence
  round must fix.
- 2 = 3. Paid adjacent tools exist but none fishing-specific and none shown in a reel shop:
  RepairDesk $99/$149 (P111), RepairShopr $69.99–$149.99 (P112), Digital Wrench $39.95, RepairTRAX
  $30/user (P113), Square Appointments $49 (P102), Shopify $39 (P103); one shop runs intake through
  per-reel e-commerce checkout pages (P70). Shop gross of ~$750–1,500/month at 30 jobs bounds the
  price (P§7f arithmetic).
- 3 = 4. "No fishing-specific repair software exists" (P113, P§S7); generics are priced and
  designed for phone-repair chains; no C-card covers the job.
- 4 = 4. CRUD + auth + Stripe + transactional email from an edge function; SMS optional (D1–D3).
- 5 = 4. Intake, pipeline, quote approval, tokenised status page, notifications, payment link,
  history: ~4–6 weeks (G7, judgement).
- 6 = 4. Founder is customer zero; a named, enumerable first list exists (seven shops with public
  price lists P67–P73; Shimano's 2 + 26 centres P80); shops change tools in the Nov–Feb off-season
  (P§7a sales-cycle note, I-S1). P§7f's "free season for a testimonial" path would push first
  revenue past 90 days, so the plan must charge from day one.
- 7 = 4. Per-shop service history and customers' status links accumulate (switching cost); the
  niche is too small for Fishbrain/Garmin/onX to want (C§7); generic repair SaaS has no fishing
  vertical (P113); founder persona (P§S9). The code itself is trivially copyable.
- 8 = 3. Reachable and enumerable (P67–P73, P80, Princess Anne Distributing network P1, Hampton
  Roads shops P§7b; forums where service is discussed I37–I46, I63–I69, I71); the status page is a
  weak B2B2C loop; no SEO evidence; Instagram unverified (P7).
- 9 = 5. No third-party data (D table).

**b. Private web logbook with automatic conditions**
- 1 = 4. 46 independent handles across 7 platforms (I-E1–E58); start–lapse–regret pattern (I-E1,
  E2, E5, E16, E31, E32, E37); fourteen distinct workarounds (§4); explicit asks I-W1–W17, tide/moon
  on each entry I-W18–W19 and I-P29–P30; some already pay (I-Y1, I-E55). Not a 5: the pain is
  habit, and the counter-evidence is real (I-N2, N3, N14, N15; only 14% of app users touch an app
  after a trip, I84).
- 2 = 4. Anglers' Log $11.99/yr, 303 ratings, "I just paid the $12 for the year" (I95, I-Y1); ANGLR
  PRO $39.99, 635 ratings (C13); Fishing Points $29.99–$49.99/yr, 31K ratings, bundling a private
  log with a web app (C20); FishersLog paid (I-E55). Refusals cluster at $50+ (I-Y10, Y12, Y13,
  I-F19); accepted band $10–15 one-time or ~$12/yr (immersion §6 reading).
- 3 = 3. Fishing Points: web + private log but import-only (C20); ANGLR: private, gear-aware, web in
  beta, 2.9 on Play, "Data analysis is truly dismal" (C13–C15); Fishbrain forces a listed water body
  and has no export (I-E40, E41, C2); indie private logs exist but are tiny (C89, C90, I106, I124).
- 4 = 3. CRUD + photo storage + edge function/cron to fetch and cache NOAA CO-OPS and NWS per
  station/grid cell (D4, D5): the anchor's "some edge functions, cron".
- 5 = 3. Entries, client-side photo resize, nearest-station and grid lookup, two integrations,
  moon maths, cross-year charts, CSV/GPX export, PWA, Stripe: 6–8 weeks (G7).
- 6 = 3. Consumer annual pricing; forum early adopters are reachable, but the product's value
  accrues over a season and annual plans sell March–May (M§7); 60–90 days to a first payment.
- 7 = 2. Export-by-design removes lock-in; Fishing Points "could add export/analytics in weeks and
  has the installs" (C§7). The only structural protection is that Fishbrain will not copy a
  private/export-first product (C§7, C§4).
- 8 = 3. Forums with recurring log threads (I1–I9, I61, I76, I77), Product Hunt interest in a
  private log (I124); no subreddit sizes, YouTube or search-volume evidence (blocked, immersion §0);
  no founder channel (P7); a recap image is a possible loop but not built.
- 9 = 4. NOAA CO-OPS tide predictions and NWS forecasts/observations are free, key-less, public
  domain, to be cached server-side (D4, D5); solunar is maths (D). Design decision that keeps it at
  4: capture conditions at entry time and back-fill older entries with tide and moon only; if
  historical weather is wanted, Open-Meteo's commercial plan is the cheap option (D6, price VERIFY).

**c. Fishing club administration**
- 1 = 2. I-C1–C17 are one forum and effectively one club, intensity mostly 1; workarounds exist
  (membership list as a forum thread I-C17, a bespoke club app I-C16, an email address for
  membership I-C10) but the immersion file marks the job "provisional" (§3.8). The loud voices are
  about tournament scoring (I-T2–T4), which this candidate hands off.
- 2 = 3. Weighfish Director tiers $69.99–$284.99/yr including membership fees (C61, I-Y29); Wild
  Apricot $66/mo at 100 contacts (P108, P109); Fishing Chaos club module unpriced (C60); angelflix
  €20 in Germany (C106); club dues $30–$120/yr exist to be collected (P55).
- 3 = 4. "No US fishing-club membership/dues/points/communications product with a web admin was
  found" (C§2, C§4); Weighfish is phone-only; Fishing Chaos is demo-gated; Wild Apricot is generic
  and priced above small clubs (P§7d).
- 4 = 4. CRUD + Stripe Connect for dues + email.
- 5 = 3. Multi-tenant, roles, dues collection, meetings, points, comms, public page: 8–10 weeks
  (G7); Stripe Connect is the long pole.
- 6 = 2. "One decision per club per season, made in winter by a volunteer director" (P§7c, 7d); the
  founder is not a club officer.
- 7 = 3. Member and points history lock in; Fishing Chaos "could ship it in a quarter" (C§4, C§7).
- 8 = 3. Enumerable: B.A.S.S. Nation 2,000+ clubs, TU 400+ chapters, FFI ~270 clubs, CT alone 101
  tournament clubs (M52–M56); public club pages are indexable; no founder channel.
- 9 = 5. No third-party data.

**d. Personal gear record with reminders**
- 1 = 2. Maintenance pain is wide (44 handles) but is about access and parts (I-M20–M37), not
  tracking; the only tracker is one spreadsheet user (I-M48). Reminder demand is inferred from
  "Always forget to wash them" (I-M8), no agreed interval (I-M4, M5, M9, M11, M17, M18) and an
  editorial on line neglect (I-M47).
- 2 = 3. ReelKeep $19.99 lifetime, zero ratings, carries ads (C79); ANGLR gear tracking inside a
  $39.99 tier (C13); anglers pay $15–$100 per service (P67–P73, I-Y23–Y26), which is the outcome,
  not the record.
- 3 = 4. ReelKeep (iPhone-only, June 2026, unrated) is the only maintenance log; ANGLR's gear box
  is weak; "the clearest ✗ across the whole matrix" (C79, C13, C14, C§9).
- 4 = 4. CRUD + cron reminders.
- 5 = 4. 3–5 weeks including reminders and payments (G7).
- 6 = 3. Cheap consumer purchase; DIY-first, "leave technology behind" cohort (I-N1, P93) slows it.
- 7 = 2. "Risk is a copycat solo app" (C§7); no data moat.
- 8 = 3. A dedicated reel-maintenance sub-forum exists (I69), Charleston reel threads (I34–I46), and
  the founder's own service customers are a seed channel; no loop.
- 9 = 5. No third-party data.

**e. Fly-tying materials inventory**
- 1 = 3. Eleven FAOL handles: Excel for "seven or eight years" with colour-coded stock (I-G9), a 4x6
  notebook, a January count and a planned MySQL "fly-Intranet" (I-G8), SuperFly software (I-G11),
  duplicate buying (I-G5, G7), "I have no idea how mch tying stuff I have" (I-G4); heatmap
  gear-inventory × fly = 3. Held at 3, not higher: one platform, threads 2006–2013, half the rows
  intensity 1.
- 2 = 3. A paid desktop database was bought (I-G11); fly anglers pay for apps (TroutRoutes $39.99,
  3.9K ratings, C27; SnapHatch $34.99/yr, 35 ratings, C87; FlyFinder unrated, C88); Orvis $14.99
  one-time split the room (I-L12–L13, I-Y20); $5.99 one-time tackle apps get bought (I-Y21, I118).
- 3 = 2 (capped). `competitors.md` did not tear down fly-tying inventory tools; only general
  gear-inventory evidence exists (C77, C78, C91) plus a 2006 product (I-G11). Unknown competition
  cannot score above 2.
- 4 = 5. Plain CRUD with photos. 5 = 5. 2–4 weeks (G7).
- 6 = 3. Inventory is a January job (I-G8), inside 90 days of a November launch; older, DIY-leaning
  cohort (I-N7).
- 7 = 2. Trivially copied; a user-built pattern/material catalogue is the only possible moat.
- 8 = 3. FAOL threads recur (I53–I56, I60), paflyfish (I75), TU and FFI clubs (M53, M54); pattern
  recipes are shareable; no founder channel into fly.
- 9 = 5. No third-party data (a materials catalogue would be a dataset to avoid).

**f. Small-club tournament director tool**
- 1 = 4. Director burnout ("no one wants to do the tournament director job", I-T4), $2,700 hardware
  refused (I-T2, I-Y28), a member built the scoring model (I-T3), public standings corrections
  (I-T10–T12), a paid job posting for exactly this app with 21 quotes (I-T20), asks I-W37–W41.
  Caveat: one club deep (immersion §3.7).
- 2 = 5. Weighfish $69.99/$284.99 director tiers plus 6.5% (C61, I-Y29), TourneyX $6.50 per angler
  (P57), FishDonkey angler fee (P59), 1,300+ tournaments on Weighfish in 2025 (P61).
- 3 = 1. TourneyX 4.7 (C51), FishDonkey 171,000 anglers (C57), Weighfish offline with standings
  and dues (C61), Fishing Chaos (C59); "the model works; the slots are taken" (P§S8).
- 4 = 3. Offline entry at the ramp plus a live leaderboard. 5 = 3. Scoring rules, tie-breaks
  (I-T21), payouts, offline: 6–10 weeks (G7).
- 6 = 2. Winter decision, revenue only when events run (P§7c). 7 = 1. Incumbents own the data.
- 8 = 3. Clubs are enumerable (M56); leaderboards are shareable; incumbents are already there.
- 9 = 5. No outside data; the director enters weights, so no two-sided cold start.

**g. Charter reschedule / no-show tool**
- 1 = 3. The one first-person operator account is vendor-published (I-B18, I-O9); the rest is
  customer-side (I-B6–B13, I-B16) or general guide stress (I-O1–O7); "first-person admin pain thin"
  (immersion §3.10).
- 2 = 4. Captains pay FareHarbor 6–8% customer-paid (P99), Xola (P100), Square $49 (P102),
  TripWorks (I-B18), FishingBooker 10–30% (P39); the reschedule sliver is a feature of those, not a
  product people buy alone.
- 3 = 2. Guidesly Pro 3.6 ("The calendar operation is horrendous", C69), FishingBooker captain app
  4.9 (C65), FareHarbor/Xola/Peek (P99–P101).
- 4 = 3. Card-on-file, SMS, NWS marine feed, calendar. 5 = 3. 6–10 weeks (G7).
- 6 = 2. "The first ten will ask why not FishingBooker" (P§7a); off-season buying only.
- 7 = 2. 8 = 2. In-person Hampton Roads fleet (P§7a); the captain forum reached was bot-walled
  (immersion §0); no founder channel. 9 = 3. Stripe + SMS provider (terms not on disk) + NWS.

**h. Licence/registration expiry wallet**
- 1 = 2. One 2013 thread (I-R1–R6), multi-year expiry (I-R2), boat registration wish (I-R28),
  ticket anecdotes (I-R7–R8). Annual and mild.
- 2 = 2. ReelLicense $19.95/yr, no ratings (I102); users expect it "free or one that comes free with
  license purchase" (I-Y32, I85); state apps are free (I100, I101).
- 3 = 3. State DNR apps already store licences (I-R28–R29) but are stale (I-R23–R27); nobody
  consolidates across states.
- 4 = 4. 5 = 5. 6 = 2. 7 = 1. 8 = 2. 9 = 5 (wallet only; a regulations cache fails D).

**i. Reel-service directory with mail-in flow**
- 1 = 4. The "where" question recurs across three platforms (I-M20, M22, M25 Charleston; I-M33,
  M37 StripersOnline; I-M1 sdfish: "I didn't even know shops did this"), with waits (I-M26, M29,
  I-S5) and OEM refusals (I-M33–M34, I-S18); asks I-W30–W31.
- 2 = 2. Anglers pay for the service (P67–P73, I-Y23–Y26), not for finding it; no evidence any reel
  shop pays for leads or listings; fishing marketplaces exist only for trips (P39).
- 3 = 3 (cautious). No fishing-specific directory found; OEM centre lists (P80); Google/Yelp not
  assessed.
- 4 = 5. 5 = 4. 6 = 2 (two-sided; search ranking takes months). 7 = 3 (curated listings and
  reviews accumulate). 8 = 4 (a recurring forum question, indexable pages, the founder's shop as a
  seed listing; no search-volume evidence, so not 5). 9 = 3 (cold start; 250–750 listings to build
  by hand, P123; review moderation).

**j. Private waypoint record**
- 1 = 3. Hand-typing coordinates (I-F1), 10-waypoint free limit (I-F4), 5-location limit (I-P17),
  manual-coordinate wish (I-F27), lost waypoints on reinstall (C80), waypoints-as-log (I-E11, E14),
  leakage fears (I-F8, F16, F22–F23), asks I-W23–W24.
- 2 = 4. Navionics $49.99/yr with 2.4K/48.7K ratings and "best 10 bucks I spent" (C9, C11, I-Y3,
  I-Y5); Fishbrain Pro private waypoints (C1); Fishing Points premium locations (I-P17).
- 3 = 2. Navionics imports and exports GPX (C9); chartplotters; Fishing Points imports (C20);
  Fishbrain/FishAngler private waypoints (C1, C16).
- 4 = 3 (map tiles). 5 = 4. 6 = 3. 7 = 2. 8 = 2 (spots are anti-viral by nature; the privacy
  counter-market I-H14–H16 is small). 9 = 3 (tiles on a free tier, VERIFY; no depth charts, D).

**k. Tackle inventory with cost/value**
- 1 = 2. One 2010 thread (I-G1–G3), dead or limited apps (I-G21–G23), a seller asked for a
  spreadsheet (I-G24), a snippet (I-G29), asks I-W25, I-W27; the immersion file: "real but
  low-intensity except for fly tiers".
- 2 = 3. SmartTacklebox $5.99 bought then regretted (I-Y21), The Tackle Box $5.99 with 19 ratings
  (I118), ANGLR PRO (C13), LureLab unverified (C105); Omnia PRO $59 is a loyalty scheme (C76).
- 3 = 4. ANGLR 50K+/2.9 (C13, C14), SmartTacklebox dead since 2016 (C77), catalogues (C78, C91);
  Omnia is the real threat (C74, C§7).
- 4 = 5. 5 = 5. 6 = 3. 7 = 2. 8 = 2 (the bass forums were unreachable, immersion §0; no loop). 9 = 5
  (user-entered; no lure catalogue).

**l. Offline regulation cache**
- 1 = 4. "No good opening it 50 miles out with no signal and running old regulations" (I-R13,
  I-R12, I-R19), stale state apps (I-R24–R27), coverage (I-R21), asks I-W34–W36, 82% of Alaska
  licence holders would use an agency app (I85).
- 2 = 3. Fish Rules ProStaff $29.99 (C30), FishVerify $29.99/yr with a 150,000-subscriber claim
  (C34, C36); but regulations are expected free (I-Y32) and are funded free by the Gulf Council (P25).
- 3 = 2. Fish Rules (free, NOAA-backed, web app, C30–C33), FishVerify, Fishbrain 30+ states (C1),
  onX (C23), state apps.
- 4 = 3. 5 = 2 (the data is the work). 6 = 2. 7 = 2. 8 = 3. 9 = 1 ("FAIL as an automated source", D).

**m. Season recap generator**
- 1 = 2. "get years of logs into some sort of program… to view patterns" (I-E33/I-W8) is real, but
  the rest are "more stats would be nice" (I-W14–W15, I-E42); the gate rejects nice-to-haves.
- 2 = 2. Nobody pays for recaps; logs are paid (I95). 3 = 2 (capped; not researched beyond ANGLR's
  "dismal" analytics, C13). 4 = 4. 5 = 5. 6 = 3 (December/January). 7 = 1. 8 = 4 (shareable by
  design). 9 = 4 (optional NOAA back-fill, D4).

**n. Reel parts / bearing-spec database**
- 1 = 3. "The hard part… is finding parts" (I-M21), JDM refusals (I-M33–M34), bearing sourcing and
  dimensions (I-M38–M41, I-W32), OEM support failure (I-M42), model-specific how-to asks (I-L8–L9).
- 2 = 2. Parts are bought (P72, I-M38) but specs and schematics are expected free; no paid analogue.
- 3 = 2 (capped; OEM PDFs, a shop guide I126 and bearing sellers were not assessed). 4 = 5. 5 = 2.
  6 = 2. 7 = 4 (a proprietary dataset if built). 8 = 4 (model-name search demand is plausible;
  the founder's expertise is the channel; no volume evidence). 9 = 1 (hand-built dataset;
  schematic copyright).

---

## 3. Ranking and runner-up reasons

| Rank | Candidate | Weighted | The one criterion that sank it, and the evidence |
|---|---|---|---|
| 1 | a. Reel/rod service job tracker | 63 | Leads on founder fit, open field (P113), no outside data and a 4-week build, **despite** a 2 on pain: there is no first-person shop complaint anywhere on disk (immersion §3.11). It leads because nothing else scores both "nobody does it" and "first payment inside 90 days" (P§7f), not because its pain case is proven. |
| 2 | b. Private web logbook | 61 | Criterion 7 (and 3): Fishing Points already ships web + private log to 10M+ installs and "could add export/analytics in weeks" (C20, C22, C§7); an export-first product hands over its own lock-in. Pain and WTP are the best on disk (46 handles, 7 platforms; $11.99/yr paid, I95). |
| 3 | e. Fly-tying materials inventory | 61 | Criterion 1 on the gate's terms: eleven handles but one platform (FAOL) and threads from 2006–2013 (I-G4–G16); and criterion 3 is unknown (capped at 2) because no one looked for fly-tying inventory apps. Scores high only because it is trivial to build. |
| 4 | k. Tackle inventory | 60 | Criterion 1: "low-intensity except for fly tiers" (immersion takeaway 8); the whole case is one 2010 Android forum thread (I-G1–G3), two App Store reviews of broken apps (I-G21–G23) and a snippet. |
| 5 | f. Tournament director tool | 59 | Criterion 3 (=1) and 7 (=1): four active, rated incumbents priced at $6.50/angler or 6.5% with nothing from the director (C51–C61, P57, P61). The strongest pain and WTP in the set, and the least open field. |
| 6 | d. Personal gear record | 59 | Criterion 1: the recurring complaints are "where do I get it serviced" and "where do I get parts" (I-M20–M41); exactly one person tracks service dates, in a spreadsheet (I-M48). A reminder app answers a question almost nobody asked. |
| 7 | i. Reel-service directory | 58 | Criterion 2: no evidence a reel shop pays for leads or listings; the angler's money goes to the service (P67–P73). Two-sided, and revenue depends on search ranking the founder cannot buy. Strong as a *feature* of a (public shop pages), weak as a business. |
| 8 | c. Club administration | 56 | Criterion 6: a volunteer director decides once a year in winter (P§7c–7d), and the pain is one club on one forum (I-C1–C17, "provisional"). |
| 9 | j. Private waypoint record | 54 | Criterion 3: private waypoints with GPX already exist in Navionics (C9), chartplotters, Fishing Points (C20) and Fishbrain Pro (C1). |
| 10 | m. Season recap | 53 | Criterion 1: wishes for "more kinds of statistics" (I-W14–W15) are nice-to-haves; it is a feature of b and a possible distribution loop, not a product. |
| 11 | h. Licence wallet | 51 | Criterion 2: users say it should be "free or… free with license purchase" (I-Y32); the paid wallet found has zero ratings (I102). |
| 12 | g. Charter reschedule tool | 50 | Criterion 3 and 8: FareHarbor (6–8% customer-paid, P99), Guidesly Pro (C71) and FishingBooker (C67) already do it; the only route to captains is in person (P§7a). |
| 13 | l. Offline regulations | 46 | Criterion 9: "maintaining 50 states' rules by hand is the 'large proprietary dataset' the gate forbids" (D); the free incumbent is agency-funded (P25). |
| 14 | n. Parts/bearing database | 46 | Criterion 9 and 5: the dataset is the product and must be built by hand; schematics are OEM copyright; specs are expected free. |

**What the ranking does and does not say.** The top two are separated from the pack by the two
heaviest criteria in opposite ways: a has the field and the founder but not the proven pain; b has
the pain and the payers but a well-funded incumbent one feature away. Candidates e, k and d sit at
59–61 purely on cheapness; on the gate's functionality test (≥10 independent verbatim examples
across ≥3 platforms describing a workaround or loss) e has 1 platform, k has 1 thread, and d has 1
person. f is the mirror image: it would pass criteria 1 and 2 of the gate immediately and fail 5
(defensibility) with no evidence round able to change that.

---

## 4. Gate previews for the top three

Format: for each of the six gate criteria, what is on disk (ids, counts of independent handles and
platforms) and what is MISSING for the targeted evidence round.

### 4.1 a. Reel/rod service job tracker

**Gate 1 — functionality case (≥10 independent verbatim examples, ≥3 platforms, each a workaround
or a loss; feature → quote table).**
On disk, business side: seven shops' own pages describing intake by printed form, email or phone,
estimates charged or waived, blanket turnaround statements and seasonal closures (P67–P73: 7
independent businesses, 7 states, 1 "platform" = their websites); two Haddrell's staff posts on
demand bunching and pricing (I-S1, I-S2, I-M44–M45; 2 handles, Charleston forum); a retailer help
page on backlog, quoting before work and uncollected reels (I-S13/I-M46, Marine Deals NZ); a tech
selling "reliable turnaround times" (I-S15); OEM processes (P75–P79); the founder's own site
(P1–P5). That is ~12 business-side sources on three kinds of page, but **zero first-person
complaints**: they describe the workaround without saying it hurts. Angler side (what the status
page and reminders resolve): backlog and silence (I-M1, I-M2, I-M26, I-M29, I-S5, I-S6, I-M23/I-S7,
I-M46, I-M49: 9 handles, 4 platforms), where-to-go (I-M20, M22, M25, M33, M37: 5 handles, 2
platforms), and 44 handles across 7 platforms for the maintenance job overall.
Feature → pain already mappable: intake form ↔ "Printed Reel Service Form in the box" (P68, P69,
P72); quote approval ↔ "$20 estimate" (P68), "estimate $15 (waived if done)" (P67), "a full
estimate will be provided for your approval" (P79), the founder's "basic service charge will incur
at the time of inspection" (P5); status page ↔ "I was on a 5 week wait" (I-M26), "8 week backlog.
Ugh" (I-S5), "8 Week Turnaround on all repairs" (P69); pickup/ship reminders ↔ "Items that are not
collected after three months will be sold/disposed of" (I-S13); seasonal load ↔ "beat the spring
rush" (I-S1), 4–8-week closures (P69–P71); service history ↔ nothing on disk.
MISSING: ≥10 first-person statements from reel/rod techs or shop owners on ≥3 platforms about
status enquiries, lost paperwork, quoting friction, no-shows at pickup, uncollected reels or
seasonal chaos (targets: reel-repair technician forums and Facebook groups — none were reached in
the immersion pass, I69 shows the only maintenance community reached was StripersOnline's
sub-forum; Google reviews of the seven shops mentioning communication or turnaround; YouTube
reel-repair channel comments), plus structured interviews with the seven shops (P67–P73), Shimano's
26 satellite centres (P80) and the founder's own count of "where's my reel?" contacts per week.
Without this the candidate fails gate 1 regardless of its rank.

**Gate 2 — willingness to pay (named paid products with prices and a volume signal; a supported
price point).**
On disk: general repair SaaS at $30–$149/mo (P111–P113), Square Appointments $49 (P102), Shopify
$39 (P103); one reel shop already pays for e-commerce checkout to take service orders (P70); the
trade's per-job revenue ($25–$100, P67–P73) and a 30-jobs-a-month gross of ~$750–1,500 (P§7f)
bound the price; the monetization file's band is $19–$39/mo (P§S7, P§8). Angler-side WTP for the
service itself is proven ($15–$44 per reel without complaint: I-Y23–Y26, P93–P96).
MISSING: evidence that any reel/rod shop pays for any job or booking software today (what do the
seven shops run — Square, Shopify, QuickBooks, paper?); a price a shop says yes to (test $19, $29,
$39 per month and a per-job alternative of ~$1–1.50, which mirrors the trade's angler-paid norms
P57, P61); any volume signal (number of shops on RepairShopr-class tools). Supported starting
point for the gate write-up: $29/mo or $290/yr, below Digital Wrench's $39.95 (P113).

**Gate 3 — organic path to 100 paying users with the math.**
This is the hard one. The US pool on disk is 250–750 independent reel-service businesses (P123,
low confidence) or ~1,000–2,500 (M-E13, a guess of one service per 6–15 tackle shops); the two
files disagree by 3–4×. At P123, 100 paying shops is **13–40% penetration**; at M-E13 it is 4–10%
(G1). Neither is credible for one person doing cold outreach; a working assumption of a 2–5%
ceiling means the addressable pool must be **≥2,000–5,000 named businesses** (G2). Broadening
needed, with counts missing for every pool: custom rod builders (the trade exists at $185–$275+ per
rod, P71, P74; no count anywhere on disk); tackle shops with a service counter (3,514 coastal
independents in 2013, M48/P105; 15,548 tackle shops including online, M47; the share with a
service bench is unknown — a 5–15% assumption gives 175–2,300, G3, flagged as unsourced); OEM
satellite centres (Shimano 2 + 26, P80; PENN/Daiwa unpublished); non-US techs (Australia 4.2M
anglers and priced OEM service, M79, P76–P77; New Zealand, P78, I-S13; England 0.83M licensed, M75;
Canada 3.2M adult anglers, M77). Channels on disk: the enumerable list (P67–P73, P80), the
founder's Hampton Roads network and drop-off partner (P1, P§7b), forums where service is discussed
(I37–I46, I63–I69, I71, P93–P95), the B2B2C status page every customer sees, and public shop pages
as an indexable front door (candidate i as a feature). No search-volume evidence exists for
"reel repair near me"-type queries; the founder's Instagram is unmeasured (P7).
MISSING: a named list of ≥2,000 addressable businesses across the pools above (or a documented
reason 30–50 shops at a higher ARPU is the plan — which conflicts with the $19–$39 band); the
founder's Instagram follower, cadence and engagement numbers; the size of any reel-repair tech
community found for gate 1; per-channel reach × conversion arithmetic.

**Gate 4 — low resource requirement.** On disk: no third-party data at all; Supabase Pro $25 +
Netlify $0–20 + domain (D1–D3). MISSING: a transactional email (and optional SMS) provider's price
and terms at ~10,000 messages/month — not on disk; intake-photo storage arithmetic (D1's 100 GB
covers 300 KB × 20 photos × 10,000 jobs = 60 GB, same as the D table's logic). Expected PASS.

**Gate 5 — defensibility against named incumbents.** On disk: no fishing-specific product
(P113, P§S7); RepairDesk/RepairShopr are priced and built for phone-repair chains and have no
fishing vertical (P111, P112); Fishbrain, Garmin/Navionics and onX have no business reason (the
niche has no ad inventory or map, C§3 white-space paragraph, C§7); per-shop history and customer
status links are a switching cost; the founder is a peer of the buyer (P§S9). MISSING: a check
that RepairShopr/RepairDesk/Digital Wrench have no fishing template or reel-shop customers; a
check for any reel-repair software outside the US (AU/NZ/UK); confirmation that Square
Appointments is not already the de-facto tool among tackle shops. Expected PASS ("defensible
because unattractive to anyone bigger").

**Gate 6 — break-even within 100–300 payers.** At $29/mo: net per payer after Stripe is $27.86
(D3); fixed costs ~$56/mo (Supabase Pro $25, Netlify Personal $9, domain/email ~$2, assumed
transactional email $20 — VERIFY) → break-even at **3 payers**; 100 payers ≈ $2,730/mo net; 300 ≈
$8,300/mo (G4). Even a per-job model (30 shops × 30 jobs × $1.50 = $1,350/mo) clears costs.
MISSING: nothing material. Expected PASS.

**Launch timing.** Shops change tools in the Nov–Feb off-season (P§7a) and run specials to pull
work forward (I-S1); three of seven close for weeks in season (P69–P71). An evidence round in
November and a 4–6-week build puts a January launch inside the buying window and a first paid
shop by March, within the 90-day requirement — only if the plan charges from day one rather than
P§7f's "free season for a testimonial".

### 4.2 b. Private web logbook with automatic conditions

**Gate 1 — functionality case.** On disk, already above the bar: 46 independent handles across 7
platforms (I-E1–E58: Charleston forum ~30 handles over 8 threads 2011–2019, StripersOnline 4, On
The Water 3, FAOL 1, App Store/mirror reviews of Fishbrain, ANGLR, BUBBA and Anglers' Log, a
BassResource snippet); 14 named workarounds (§4); 17 explicit asks (I-W1–W17) plus tide/moon on
each entry (I-W18–W19, I-P29–P30); export asked for by 4 handles on 3 platforms (I-E18, E45, E48,
E49); "not social"/"no location" named as the selling point by 5 handles on 2 platforms (I-E18,
I-H13–H16). Feature → pain is already mappable: automatic conditions ↔ "would manually still need
to enter water depth, water temp, bait" (I-E6), "a moon phase and tide indicator tied to each
trip entry" (I-W18); private ↔ "been looking for an app that wasn't social" (I-E18); export ↔
"You cannot export the data at this point" (I-E18), I-E45, I-E48; cross-year patterns ↔ "get
years of logs into some sort of program… to view patterns over the years?" (I-E33), I-E17; no
nags ↔ "If an app throws a 'premium' ad in my face every other button tap I delete it" (I-E54);
no forced water body ↔ I-E40, I-E41. The adversarial case the gate must answer is the
counter-evidence: logging dies on habit (I-E1, E2, E16; I-N2, N3, N14, N15) and only 14% of app
users touch an app after a trip (I84).
MISSING: recency and breadth. Most threads are 2011–2019 and Southeast saltwater (immersion §0
bias); the one 2026 thread shows surfcasters abandoning logs as the fishery declines (I-E36–E38,
I-N14). Needed: 2024–2026 log threads from freshwater bass, kayak and fly communities (Reddit and
BassResource were unreachable) to show the pain is current and not one forum's culture.

**Gate 2 — willingness to pay.** On disk: Anglers' Log $11.99/yr, 303 ratings, "I just paid the
$12 for the year" (I95, I-Y1); FishersLog used for two years (I-E55); ANGLR PRO $39.99, 635
ratings (C13); Fishing Points $29.99–$49.99/yr, 31K ratings, private log + web (C20); one-time
$2.99–$4.99 private logs (I106, I104); refusals at $50–$100 (I-Y10, Y12, Y13, I-F19) and "I'd
rather have 10, $10 subscriptions than 2, $30" (P22). Supported price point: $19–$24/yr billed
annually with a non-renewing option (P20, P120), which sits between the proven $12 and the $30+
where cancellations start (P21, P22).
MISSING: any paying-base signal for a private log on its own (Anglers' Log revenue or subscriber
count; AnglerSlate/FishBench traction, I124, I106); whether a web-first log converts (ANGLR's web
is beta, C15; Fishing Points' web usage unknown); a price test among forum loggers.

**Gate 3 — organic path to 100 paying.** On disk: the forums with recurring log threads (I1–I9,
I61, I76, I77), Product Hunt appetite for a private log (5 comments, I124), the fact that trips
are planned days ahead and reviewed at home (M15, I84 "before 71% / after 14%"). No subreddit
sizes, Facebook group sizes, YouTube creators or search volumes exist on disk (blocked; immersion
§0, C98). No founder channel (P7). No built-in loop unless a season-recap image (candidate m) or a
free CSV template is added as the share/SEO asset.
MISSING: the entire arithmetic. Needed: sizes of r/Fishing, r/SaltwaterFishing, r/bassfishing,
r/flyfishing, r/kayakfishing and the big Facebook groups; search volume for "fishing log app",
"fishing log template/spreadsheet", "fishing journal"; evidence a free template or recap image
spreads; a conversion assumption (at 1% of reached avid anglers, 100 payers needs ~10,000 reached).

**Gate 4 — low resource requirement.** On disk, PASS with arithmetic: NOAA CO-OPS hi/lo
predictions are free, key-less, public domain and fetchable a year at a time per station (D4) —
at most ~3,000 stations, realistically <300 in use, so <300 calls per year; NWS forecasts and
observations are free and key-less, cached per grid cell (D5) — ~500 cells × 24 refreshes/day =
12,000 calls/day with caching, inside its "generous" unpublished limit (G9); sun/moon/solunar is
client-side maths (D); photos resized client-side keep 10,000 users inside Supabase Pro's 100 GB
(D1, D table). Open-Meteo is **not** free for a paid app (D6).
MISSING: NWS observation retention (how far back "conditions at the time of entry" can be
back-filled) — VERIFY; Open-Meteo commercial price (D6) if historical weather is wanted; MapTiler/
Mapbox free-tier limits only if a map is shown at all (D; recommended: no map).

**Gate 5 — defensibility.** On disk: Fishbrain will not copy because export and privacy erode its
catch-map and ad model (C§4, C§7); onX's fit is maps, not logs (C§7); ANGLR already has the
private/gear-aware log but ships at 2.9 on Play with crashes and "dismal" analytics (C13–C15).
The named threat is Fishing Points: web app, private logbook, 10M+ installs, GPX import today,
"could add export/analytics in weeks" (C20, C22, C§7). The written reason to pass is business-model
conflict for the social incumbents plus a desk-after-the-trip workflow they do not serve; it is
weak against Fishing Points.
MISSING: what Fishing Points' web app and Fishbrain Pro actually offer today for export and
analysis (feature check, not review mining); what AnglerSlate and FishBench ship (I124, I106).

**Gate 6 — economics.** At $24/yr: net per payer $23.00/yr (= $1.92/mo, D3); fixed ~$36–56/mo
(D table) → break-even at **19–29 payers**; 100 payers ≈ +$136/mo; 300 ≈ +$520/mo (G5). PASS, but
small, and the first renewal will test it (P§S10 seasonal churn). MISSING: nothing material.

### 4.3 e. Fly-tying materials inventory

**Gate 1 — functionality case.** On disk: eleven handles, all on FAOL, 2006–2013 (I-G4–G16),
with real workarounds: "I've used Excel for seven or eight years… I color code items… yellow when
they are used past the halfway point" (I-G9); "About once a year I actually take inventory… I'm
looking at setting up an MySQL server" (I-G8); "Does anyone have a free database program to keep
track of materials and flypatterns?" (I-G10); SuperFly software (I-G11); duplicate buying (I-G5,
G7); stockpiling discontinued hooks (I-G14). Adjacent: a general tackle-inventory ask on Android
Central (I-G1–G3, 3 handles, 2010) and a fly-pattern app ask (I-W28). Feature → pain: stock levels
↔ I-G9; reorder flags ↔ I-G5, G7, G14; patterns linked to materials ↔ I-G10, G11; export ↔ "why be
at the mercy of having your data locked in a mom & pop developer's closed black box" (I-G3).
**Fails the gate on disk**: one platform (FAOL) against a three-platform rule, nothing newer than
2013, and half the rows are intensity 1.
MISSING: ≥10 handles across ≥3 platforms dated 2020 or later (fly-tying subreddits and Facebook
groups, other fly forums, YouTube tier comments), and at least some rows describing a loss
(money, time) rather than a joke about a fourth hare's mask.

**Gate 2 — willingness to pay.** On disk: a paid desktop database was bought twenty years ago
(I-G11); fly anglers do pay for apps (TroutRoutes $39.99, 3.9K ratings, C27; SnapHatch $34.99/yr,
35 ratings, C87; FlyFinder unrated, C88); Orvis $14.99 one-time split the forum (I-L12–L13, I-Y20);
$5.99 one-time tackle apps are bought and regretted (I-Y21, I118). Supported price point: $15–$20
one-time or ~$12/yr. MISSING: any current paid fly-tying inventory product and its ratings; the
number of active tiers (the 7.9M fly participants, M7, include no tying split) and materials
spend; a price test.

**Gate 3 — organic path.** On disk: FAOL (recurring threads, I53–I56, I60), paflyfish (I75), TU
400+ chapters and FFI ~270 clubs (M53, M54), fly shops; January is the natural moment (I-G8); a
pattern recipe with its material list is shareable output. No founder channel into fly tying.
MISSING: community sizes, search volume for "fly tying inventory spreadsheet/app", any creator
willing to share, and the conversion arithmetic.

**Gate 4 — low resource.** PASS on disk: no third-party data; a materials catalogue must be
user-built, not licensed (D1–D3). Nothing missing.

**Gate 5 — defensibility.** On disk: nothing fishing-specific found, but nothing was looked for;
general gear inventory is a graveyard (C77) with weak bolt-ons (C78, C91); a retailer with
purchase history is the natural owner (Omnia's position in tackle, C74, C§7, has no fly equivalent
on disk). The code is trivially copied; the only moat would be a user-built pattern/material
catalogue. MISSING: an App Store/Play/web sweep for fly-tying inventory tools and generic
inventory apps tiers use (e.g. Sortly-class, not researched).

**Gate 6 — economics.** At $12/yr: net $11.35 per payer per year ($0.95/mo); fixed ~$56/mo →
break-even at ~59 payers; 100 payers ≈ +$39/mo; 300 ≈ +$228/mo (G6). At $15 one-time, 100 payers
is $1,500 once — hosting is covered for years but there is no recurring business. PASS on the
letter of the test, with the lowest ceiling of the three.

---

## 5. Recommended gate order and the questions the evidence round must answer

Gate in this order, one targeted evidence round each (the gate skill allows one per candidate):

**First: a (reel/rod service job tracker).** Reason: it is the only candidate where the founder's
one real asset (peer trust with shop owners, P§S9) applies, it is the only one that can plausibly
take money from a named buyer inside 90 days (P§7f, P67–P73, P80), and its two weaknesses are both
testable cheaply and fail fast. If gate 1 (shop-side pain) or gate 3 (a credible pool) cannot be
evidenced, it fails in days, not weeks.
Questions:
1. First-person pain: can we collect ≥10 reel/rod techs or shop owners on ≥3 platforms describing
   status enquiries, lost paperwork, quoting friction, pickup no-shows, uncollected reels or
   seasonal overload? Where do reel techs talk (forums, Facebook groups, YouTube)? What does the
   founder's own intake log show per week?
2. What do the seven shops (P67–P73) and Shimano's satellite centres (P80) run today for intake and
   payment, and at what price would they switch — $19, $29, $39 per month, or ~$1–1.50 per job?
3. How big is the addressable pool, by name: US reel repairers (resolve P123's 250–750 against
   M-E13's 1,000–2,500), custom rod builders (any guild/association member count), tackle shops
   with a service bench (share of M47/M48), and English-speaking non-US techs (AU, NZ, UK, CA)?
   Does it reach ≥2,000 (G2)?
4. The founder's channel: Instagram followers, posting cadence, engagement (P7); size of the
   Princess Anne Distributing / Hampton Roads network (P1).
5. Incumbent check: do RepairShopr, RepairDesk, Digital Wrench or Square Appointments have reel/
   tackle customers or templates? Is there any reel-repair software outside the US?
6. Transactional email/SMS provider price and terms for the gate-6 table.
If a passes, the recommended product shape adds the two features the runners-up point at without
gating them separately: public shop pages with prices and turnaround as the SEO front door (i) and
an angler-owned record with a next-service reminder that routes back to the shop (d).

**Second: b (private web logbook).** Reason: the strongest pain and WTP on disk; the open
questions are distribution math and one incumbent feature check, both answerable in a short round.
Questions:
1. Distribution arithmetic: sizes of the main fishing subreddits and Facebook groups; search volume
   for "fishing log app / template / journal"; 2024–2026 log threads outside Charleston
   (BassResource, Reddit, kayak and fly communities); whether a free CSV template or a recap image
   (m) spreads.
2. Incumbent check: does Fishing Points' web app export or analyse today? Does Fishbrain Pro export
   CSV? What do AnglerSlate and FishBench ship (I124, I106)?
3. WTP for a private log alone: any revenue or subscriber signal for Anglers' Log; a price test at
   $19/$24/$29 per year versus one-time.
4. Technical: NWS observation retention for back-filled entries; Open-Meteo commercial price (D6).

**Third, only if a and b both fail: e (fly-tying inventory).** It needs evidence that does not
yet exist (three platforms, post-2020) and a competitor sweep nobody has done; run it as a
pain-mining round first, then score.
Questions: ≥10 handles on ≥3 platforms since 2020; any paid fly-tying inventory app and its
ratings; the active-tier population; whether pattern recipes with material lists travel.

**Do not gate separately:** k and d (they fail gate 1 on disk: one 2010 thread, one spreadsheet
user; d becomes the consumer face of a if a passes), m (a feature and loop for b), f (gate 5 is
fatal and no evidence round changes four live incumbents), c (park until an officer-side evidence
set from more than one club exists), j, h, g, l, n (sunk by criteria no round can move: incumbents
with GPX, free-by-expectation, commission incumbents, forbidden datasets).

A well-evidenced "nothing passes" remains the acceptable outcome: if a cannot show first-person
shop pain and a ≥2,000-business pool, and b cannot show a distribution path to 10,000 reached
anglers without ads, the honest report is that this hobby's paid-software gaps are too small or too
contested for a solo founder with no channel, which is consistent with the market file's own
reading ($4 per angler per year on all online media, M35/M-E4; 25% app adoption, M59).

---

## 6. Sources (new assertions only; everything else cites existing ids)

| ID | Claim / number | Value | Publisher | URL | Published | Accessed | Used in |
|----|----------------|-------|-----------|-----|-----------|----------|---------|
| G1 | Penetration implied by 100 paying reel shops | **estimate:** 100 ÷ P123 (250–750) = 13–40%; 100 ÷ M-E13 (1,000–2,500) = 4–10% | estimate | — | — | 2026-10-20 | §4.1 gate 3 |
| G2 | Addressable pool needed for 100 payers at a 2–5% cold-outreach ceiling | **estimate:** 100 ÷ 5% = 2,000; 100 ÷ 2% = 5,000 businesses; the 2–5% ceiling is an assumption, not a sourced conversion rate | estimate | — | — | 2026-10-20 | §4.1, §5 |
| G3 | Tackle shops with a service bench | **estimate (unsourced share):** 5–15% × M47 15,548 = 780–2,300; or 5–15% × M48 3,514 coastal independents = 175–530 | estimate | — | — | 2026-10-20 | §4.1 gate 3 |
| G4 | Break-even for a at $29/mo | **estimate:** net per payer = 29 − (0.029 × 29 + 0.30) = $27.86 (D3); fixed = Supabase Pro $25 (D1) + Netlify Personal $9 (D2) + domain/email ~$2 (D table) + assumed transactional email $20 (not on disk, VERIFY) = $56/mo → 3 payers; 100 payers ≈ $2,786 − $56 ≈ $2,730/mo; 300 ≈ $8,300/mo | estimate | — | — | 2026-10-20 | §4.1 gate 6 |
| G5 | Break-even for b at $24/yr | **estimate:** net = 24 − (0.696 + 0.30) = $23.00/yr = $1.92/mo (D3); fixed $36–56/mo (D table, G4) → 19–29 payers; 100 payers ≈ $192 − $56 = +$136/mo; 300 ≈ $576 − $56 = +$520/mo | estimate | — | — | 2026-10-20 | §4.2 gate 6 |
| G6 | Break-even for e at $12/yr and $15 one-time | **estimate:** $12/yr net = 12 − 0.648 = $11.35/yr = $0.95/mo → 59 payers at $56 fixed; 100 ≈ +$39/mo; 300 ≈ +$228/mo; $15 one-time × 100 = $1,500 total | estimate | — | — | 2026-10-20 | §4.3 gate 6 |
| G7 | Build-time estimates per candidate (criterion 5) | **judgement, no source:** a 4–6 wk; b 6–8; c 8–10; d 3–5; e 2–4; f 6–10; g 6–10; h 2–3; i 3–5; j 3–5; k 2–4; l and n months (data) ; m 2–4 | estimate | — | — | 2026-10-20 | §2.1 |
| G8 | Weighted totals and tie-breaks | computed from the grid in §2 with weights 3/3/2/1/2/2/1/2/2 (opportunity-scoring skill); ties by criterion 2 then 1 | derivation | — | — | 2026-10-20 | §2, §3 |
| G9 | NOAA/NWS call volume at 10,000 users | **estimate:** CO-OPS hi/lo fetched once per station per year (D4 allows up to 1 year per call), <300 stations in use → <300 calls/yr; NWS ~500 grid cells × 24 refreshes/day = 12,000 calls/day, cached per cell (D5) | estimate | — | — | 2026-10-20 | §4.2 gate 4 |

Numbers deliberately not asserted: subreddit or Facebook group sizes, search volumes, the number of
custom rod builders or non-US reel techs, email/SMS provider prices, NWS observation retention,
Open-Meteo's commercial price, and whether any fly-tying inventory app exists. Each is named above
as something the evidence round must find.
