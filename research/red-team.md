# Red Team, pass 1: the chosen candidate re-gated and attacked

Red Team Agent, 2026-10-21. Candidate (a): job tracking for small fishing-gear service businesses
(reel techs, rod repairers, custom rod builders, tackle-shop service counters) at $1 per job created,
capped at $29/shop/month, $0 in idle months, optional $290/yr prepay, the shop may pass the $1 to
the customer. Customer zero: Storm Proof Tackle, Virginia Beach. Pass 2 (code) comes later.

Source ids in this file are prefixed `R` (section 7). Existing ids (`V`, `VS`, `N-V`, `M`, `S`,
`P`, `GA`, `D`, `L`) are cited as they stand in the research files and are not repeated.

---

## 0. Method

1. Read the gate rules only (`.claude/skills/validation-gate-checklist/SKILL.md`).
2. Read the raw evidence, not the verdict: `evidence-repair-shop-tool.md` in full; `monetization.md`
   §4, §7, §8, §9; `hobby-immersion.md` §3.6, §3.11, §7; `market-sizing.md` §9, §11; `competitors.md`
   §4, §7; `infrastructure-and-data.md`; `gap-analysis.md` §2–§3. Wrote six verdicts to a scratch
   file before opening the gate doc (section 1 reproduces that file unchanged).
3. Read `docs/validation-gate.md` and the runner-up file `evidence-private-logbook.md` §0, §6; compared.
4. Spent the web budget trying to disprove the pass: 31 WebSearch calls, 36 WebFetch calls. Reddit
   is blocked and the search engine ignores `site:reddit.com` (zero Reddit results in nine attempts,
   same as the earlier agents); Facebook group and profile pages are login walls; Instagram and
   Shimano US returned 429/403. Everything that could be fetched was fetched; snippets are marked.
5. Ran a small seasonality and metering model (stated assumptions, section 3e) rather than trusting
   either the gate's ARPU or my own intuition.

What this pass does not do: review code (none exists yet beyond `app/package.json`), re-score the
runner-up in full, or interview anyone. The founder's actual reach (Instagram, Facebook) remains
unmeasured by anyone on the team because every route is blocked; that gap is itself a finding.

---

## 1. Independent gate verdicts (written before reading the gate doc)

Reproduced verbatim from the scratch file (`independent-verdicts.md`, 2026-10-21).

| Criterion | My verdict | Justification |
|---|---|---|
| 1 Functionality | **PASS (weak)** | Job in one sentence exists. ≥10 independent business-side handles across ≥3 platforms (Square community, PDB, alantani ×3, rodbuilding ×14, 4 shop sites, WJLA, charlestonfishing, UK FAQ) describing workarounds (dates on boxes V3, printed form V47/P68, two hand-raised invoices V22, text/call intake V4/V23, cheques V3/V7) and losses (stiffed V6, dropped rods never collected V12, told "ready" when not V39). Weakness: buyers describe the process, never call it a problem; 14 of 29 are 2004–2015; intensity mostly 2. Passes the "workaround or loss" test, not the "they asked for a product" test. |
| 2 Willingness to pay | **FAIL as written (marginal)** | No shop in this segment is shown paying for job tracking. Tooling they pay for: GoDaddy/Webador/WordPress ($0–30), Square (V1, one rod builder), per-reel e-commerce checkout (P70), PayPal. Analogue verticals pay $30–$149 (RepairDesk, RepairShopr, Jobber, Digital Wrench) and Tower (AU/NZ) sells repairs-in-POS at A$265+ with 3,500 customers across all verticals — but zero in-segment volume signal. Paperform Free has Stripe deposits and a fishing-specific template. The $0-idle metered price is itself an admission that a budget line does not exist. Convertible only by a commitment test (cards on file / prepay) with external shops, not by more desk research. |
| 3 Organic marketability | **PASS (weak, 12-month horizon)** | Named channels with counts: alantani 17,263 members; rodbuilding.org ~96k topics + ICRBE 2,500 (Feb 2027); ~1,560 YP listings; Mud Hole 73.4K subs; Hampton Roads 7–33 listings; built-in loop (indexable shop pages + powered-by). Math: 70–160 in 12 months, 10–25 in 90 days. Fails the 90-day-to-100 reading but the criterion says "path to first 100", not a deadline. Flags: Facebook unmeasured (the channel two techs actually name), founder's own distribution unverified (Instagram 429, site has lorem ipsum and info@example.com, Book NOW → #), best channel outside 90 days, Nov–Feb is the shops' tooling window but also their dead season. |
| 4 Low resource | **PASS** | No licensed data, no dataset, no network effect, no moderation at scale, no hardware. Third parties: Stripe Connect (shop's own account), transactional email. At 10,000 shops × ~15 jobs × 5 emails = 750k emails/mo ≈ $100–300/mo on Resend/Postmark tiers; trivial vs revenue. SMS excluded. |
| 5 Defensible enough | **PASS (weak)** | Written reasons exist: ceiling ≈$1–2M/yr is below Square/Shopify attention; Tower is AU/NZ POS; general repair SaaS prices for multi-tech storefronts; Fishbrain/Garmin/onX have no B2B2C shop business. Moat is founder-as-peer + accumulated per-reel history + the shop's public URL on tags. Realistic threat is not an incumbent but a free form builder (Paperform/Jotform + Stripe) or a copycat solo dev. "Defensible because nobody wants it" is the same fact as criterion 2's weakness. |
| 6 Economics | **PASS (hosting), with a pricing-mechanics caveat** | Costs ≈ $25 Supabase + $0–20 Netlify + $2 domain + $20 email ≈ $50–70/mo. Revenue per shop under metering: median external shop 5–20 jobs/mo in season, 0–5 off-season → ~$8–12/mo averaged → 100 shops ≈ $800–1,200/mo, 300 ≈ $2,400–3,600/mo. Break-even < 10 shops. Caveats: (i) Stripe Billing on a $3 invoice costs $0.41 (14%) — need a minimum-invoice or application-fee collection; (ii) $0 idle months make MRR lumpy (Nov–Feb could be 20–30% of July); (iii) ceiling: 2,000–4,500 US businesses × ~$150/yr ≈ $300–700k/yr at 100% penetration, lifestyle not venture. |

**Independent result: 5/6, criterion 2 FAIL-marginal.** Under the gate's literal rule that is
"next candidate". My pre-comparison judgement, also recorded in the scratch file: the right
disposition is APPROVE WITH REQUIRED CHANGES whose first change converts criterion 2 into evidence
*before* the build, because the runner-up's failures are structural and this one's is testable in
two weeks for $0.

(One correction to my own row 3 after the disproof round: "Nov–Feb … also their dead season" is
wrong. The closures in evidence are July–October; January benches are busy. See 3e.)

---

## 2. Comparison with the gate doc

### 2a. Criterion by criterion

| Criterion | Gate | Me | Agreement? |
|---|---|---|---|
| 1 | PASS | PASS (weak) | Yes. The gate's handling of the 2004–2014 rodbuilding.org material (matched against 2023–2026 shop pages that show the same workflow) is sound. My disproof round added a 2026 first-person builder ask (R16), which strengthens it slightly. |
| 2 | PASS (lean, conditional on C6: five external paying shops by day 90) | FAIL as written, convertible | **No.** Same facts, different disposition. See 2b. |
| 3 | PASS (conditional on C2 rod builders, C5 Nov–Feb launch) | PASS (weak) | Yes on the verdict; no on two inputs: the alantani channel is over-counted and the "Nov–Feb tooling lull" premise is unsupported (3b, 3e). |
| 4 | PASS | PASS | Yes. I resolved both of the gate's VERIFY items (3d, R36). |
| 5 | PASS (weak) | PASS (weak) | Yes. |
| 6 | PASS; break-even 3–5 shops; ARPU $19 active / $17 season-averaged | PASS; break-even ~5 shops; ARPU ≈ $12 active / ≈ $11.7 season-averaged | Yes on the verdict; the gate's ARPU is 40–60% too high for the pool described (3e). Break-even survives. |

### 2b. Where the gate's reasoning is motivated, and where it is merely generous

1. **Criterion 2 is a FAIL dressed as a conditional PASS.** The gate writes: "the letter of the
   criterion is met. The spirit is not: zero fishing shops are shown paying for job tracking" and
   then passes it on condition C6, a test that runs *90 days after launch*, i.e. after a 4–6-week
   build. The skill's own rule is "a well-evidenced FAIL beats a weak PASS" and "One fail → next
   candidate." The gate's volume signals for the letter of the criterion are Tower (AU/NZ POS, all
   retail verticals), RepairDesk (phone repair) and Jobber (home services): three other trades.
   Moving the kill switch to the far side of the build is the cheapest place to *write* it and the
   most expensive place to *learn* it. That is the motivated step. The fix is not a veto; it is to
   run the commitment test before the build (section 5, change 1).
2. **GA7's ARPU mix (40% of shops at ~24 jobs/month, 20% at the cap) does not match the pool the
   same document describes** ("part-time", "casual side hustle", rod builders at 2–6 builds a
   month, 35-order *backlogs* not monthly throughput). With a pool-weighted mix the active-month ARPU
   is about $12, not $19 (3e). Break-even still happens at ~5 shops, so the verdict holds, but every
   downstream revenue figure in §6 of the gate is ~40% high.
3. **The season factor (10.5/12) models closures only, not volume.** The evidence shows a spring
   rush (5–8-week backlogs), late-summer closures and a quieter but working winter. Under a $29 cap
   the busy months are capped and the quiet months are near zero, so trough-month revenue is ≈19% of
   peak-month revenue in my model, not 87.5%. Annual revenue per shop comes out at ≈$141, close to
   the gate's $17 × 12 = $204 only for the busiest segment.
4. **The "shops change tooling in the Nov–Feb lull" premise (C5) is borrowed, not evidenced.** It
   cites P§7a (a note about *guides*) and M44 ("Dont wait till March", a shop telling customers to
   send reels in *winter*, which shows winter is work time). The disproof round found January benches
   with 150 reels queued (R30) and shops "staying busy with winter rod and reel repairs" (R31), while
   the documented closures are July 15–Oct 15 (R29, P70, V23). Nov–Feb is still the right launch
   window, for a different reason: jobs exist then, and the spring rush that makes the status page
   valuable is next. The gate reached the right date with the wrong argument.
5. **Channel row 2 (alantani.com → 10–30 paying shops) assumes 300–600 working techs among 17,263
   members.** The board where techs announce their businesses ("Member Services") has had no new
   post since 2023-09-24; the "Reel Repair Service Centers" board has four topics with 2025–26
   activity on its first page (R12, R13). The forum is alive (91 users online, R11) but the visible
   tech population there is dozens, not hundreds. I would put row 2 at 3–10.
6. **C6's bar is too low to mean anything.** "Invoiced ≥$1" is one job. Five shops creating one job
   each is $5 and proves nothing about adoption. Section 5 tightens it.
7. **Generous but defensible:** counting the three shop websites as one platform (fine); using the
   angler-side intensity-3 rows to carry the buyer-side case (disclosed, and the status page does
   resolve them); the $0.5–1.7M ceiling stated openly as a lifestyle outcome (honest).

### 2c. Where I agree with the gate against my own first instinct

The gate's section 2b ("the free-substitute problem, head on") is right that Paperform/Square cap
the price of *intake and deposit* at $0 but leave status, promised dates, parts approval and
per-item history unpriced. My disproof round made that sharper, not weaker: Paperform Free is 30
submissions a month (R8), so it covers the part-timer entirely and the 30-job shop not at all;
Square Invoices Free can request a deposit on an estimate (R10) but has no queue, status page or
history. The product's price must be argued against phone time and abandoned jobs, which is
exactly what nobody in the pool has yet been asked to pay for. Hence the commitment test.

### 2d. The runner-up, in one paragraph

`evidence-private-logbook.md` §6 scores (b) as LIKELY FAIL on criterion 3 (≈130 US searches a month
with app intent; 23–65 payers in 90 days) and WEAK on 5 (Fishing Points ships web + private log +
automatic conditions to 10M+ installs; 101 log apps launched in 2026). (e) fails criterion 1's
three-platform rule. A VETO of (a) therefore sends the team to a candidate that fails *two*
criteria structurally, or to a documented no-go. A veto must be better evidenced than the pass it
overturns; on criterion 2 the evidence is thin in both directions, and on every other criterion (a)
is at least as strong as (b). That is why the disposition in section 5 is conditional approval
with the condition moved forward, not a veto.

---

## 3. Disproof attempts

Format per item: what was searched or fetched → what was found → quotes with URL and date.

### 3a. Criterion 2: anyone in the segment visibly paying, or visibly refusing?

| Attempt | Result |
|---|---|
| rodbuilding.org's own search for "quickbooks" (R17) | 22 results, **all 14–19 years old**: "Rod Business Software" (Chuck Mills, ~2007: cheap software to create invoices and track inventory), "Micro Rod Shop Management Software" (Ben Lee, ~2010: "estimates, billing (AR/AP), and inventory control"), "Invoicing and Inventory" (Scott Sheets, ~2008), "small biz accounting software" (Matt Dotts, ~2008), "tracking rod building costs" (Kyle Robinson, ~2010: "I have an excel speradsheet that could be helpful"). Builders have asked for business software for twenty years; nobody reports buying one. |
| rodbuilding.org search for "software" → thread "Software" (R16) | **The only 2026 first-person ask on disk.** Aaron Mueller, 2026-02-23: "Wondering what you all are using and what you would recommend for software to keep track of inventory, costs, sales, etc." for something that "works well with small rod builders." One reply, Ben Lori, 2026-02-24: "I personally use Google Spreadsheet." Note the ask is inventory/costs/sales, not customer status; and the community's answer is a free spreadsheet. Cuts both ways: criterion 1 up, criterion 2 down. |
| alantani.com's own search for "keep track" and "invoice" (R14) | The one "How do you keep track of what you do......" thread (2014–15) is about *personal* reels: service dates written in grease, 3×5 index cards, an A5 notebook, "I hate spreadsheets." No thread about tracking customer repair jobs or invoicing a repair business was found. The in-segment tech voice about tooling simply does not exist in public. |
| Square Seller Community thread V1 re-read in full (R20) | Travis Tallent's post and one reply (JTPets, 2023-02-27): "I put a little blerb in my check out screen that say 'ordrs will be delivered x if placed by y. If any changes occur to this we will reach out'". No fee complaint, no other tool considered, no follow-up. The single in-segment person on a paid tool accepted a text-note workaround. |
| Searches for reel/rod businesses on RepairShopr, RepairDesk, Jobber, Square Appointments/Invoices | Nothing in-segment. RepairDesk's Square marketplace listing mentions "walk-in or mail-in customers" generically; one Capterra reviewer calls RepairShopr pricing "a bit steep if you have many users." |
| Price sensitivity among such shops (PayPal/Square/Venmo/Zelle on alantani or rodbuilding) | Site-restricted searches returned nothing from either forum. Square's own community confirms deposits via invoice are fee'd only on the portion paid. No in-segment fee complaint found. |
| Nearest analogues with published prices | **Bike shops pay for exactly this product.** Hubtiger (job cards "with colour coded statuses, per technician", "Keep customers informed automatically without manual follow-up"): Lite **$52/month**, 1 technician, 100 SMS credits; Professional $99; Premium $125 (Shopify listing, R24); UK launch "from just £32 per month" (2021, R25); "the average cost is $60 a month" (Bicycle Retailer 2020, R25). Archery pro shops: no archery-specific tool found; the ATA's service-price survey (R27) lists $10–$125 jobs and "We advise a customer if something is likely to take longer than usual" but no tracking software; a 2013 dealer profile says "many customers contact dealers on a daily basis requesting updates on orders placed" (R28, snippet). Generic single-user tools: RepairTRAX $30/user, Orderry $39, Shop Pro $39.99 (R26). |

**Reading.** The analogue trades confirm the *shape* (one-tech shops do pay $30–$60/month for job
cards plus automatic customer updates) and the fishing trade confirms the *absence* (twenty years
of asking, answered with spreadsheets). Criterion 2 stays FAIL-as-written; the analogue prices say
$1/job capped at $29 is below, not above, what the nearest paying neighbours accept.

### 3b. Criterion 3: is the pool shrinking? Are the channels alive?

| Attempt | Result |
|---|---|
| alantani.com index, fetched 2026-10-20 23:43 (R11) | Alive: 454,887 posts / 35,662 topics / 17,263 members; **91 users and 115 guests online**; ten boards with posts "Today" or 2026-10-19. |
| alantani "Reel Repair Service Centers" board (R12) | 20 topics on page 1 of 3; **4 have 2025–26 posts** ("what's coming off the bench......" 2026-07-18; "International 50W needs serviced" 2026-06-21; "Ashlin Fishing" 2025-12-23; "Shimano SR2500RG parts needed" 2025-10-21). "Retiring" (2023-06-26) is still on the first page. |
| alantani "Member Services" board (R13) | Where techs announce businesses: newest post **2023-09-24** (retiredandfishing); zero 2025–26 activity. |
| rodbuilding.org index (R15) | Alive: five topics with posts on 10/20/2026, "Current Page: 1 of 1926"; "2027 ICRBE - 137 days to go - Vendor update" (10/05/2026) and a scam-warning thread about 2027 ICRBE accommodation (09/20/2026). |
| ICRBE 2027 (R18, R19) | Confirmed: **February 20–21, 2027, Winston-Salem Marriott**, "60+ booths", 50,000 sq ft. Tackle Trade World on the 2026 show: "attendance has consistently ranged between 2,000 and 2,500 participants annually" and "a 30 per cent expansion in floor space." Booth prices not published anywhere reachable; a 2025 trade report says exhibitors "blow up" the organiser's phone within days of the announcement, so a late booth is unlikely. |
| Facebook group sizes | `facebook.com/groups/customrodbuilders/` is a login wall (R23); five searches for reel-repair or rod-building group member counts returned nothing. **Still unmeasured.** Only the founder, logged in, can read these numbers; the launch plan must make him. |
| Techs retiring / OEM consolidation | No 2025–26 reel-shop closure news found in two searches. Structural pressure is real and documented elsewhere: Outdoor Life, 2026-02-03 (R32): reel repair was once "big business for mom-and-pop tackle shops" and "now that manufacturers no longer readily supply parts, getting them fixed is no easy task"; PENN's service page carries a "Reels No Longer Serviced" list ("We regret to inform you that we are no longer able to service the following PENN reels and downriggers", R33); Shimano US: "retailers and wholesale outlets are not required or authorized to perform warranty repairs", warranty void if "subjected to repairs not authorized by Shimano" (R34, snippets). BassResource (snippet, R39): "He eventually had to close his business. Now, in my area, there are no tackle repairmen." |
| Demand side in winter | The Fisherman, Grumpys Tackle (Seaside Park, NJ), 2026-01-05 (R30, snippet): roughly **150 reels to service, some from as far away as Alaska and Minnesota**; 2026-01-12: the reel bench "very busy". Matt Broderick, 2026-02-02 (R31, snippet): "Local shops are staying busy with winter rod and reel repairs"; a 2026-01-26 item notes "the usual midwinter slowdown" at tackle shops generally. |

**Reading.** The pool is not collapsing: the two forums post daily, the expo grew its floor 30% in
2026, and OEM retreat from parts and older models pushes work *to* independents. What is shrinking
is the number of techs who announce themselves publicly (the alantani business board is dormant),
which makes the pool harder to *enumerate*, not smaller. The Facebook gap is unchanged and is the
single most important unknown in the channel math.

### 3c. Free substitutes: what a one-person shop gets for $0

| Tool | Free tier, verbatim | What it covers of this product | What is missing |
|---|---|---|---|
| Paperform Free (R8) | "Unlimited Forms", **"30 Submissions / month"**, "Stripe payments" and "PayPal Business payments" included, quotes/invoices and refunds available; "Free forms carry a Paperform badge that cannot be turned off"; a fishing-specific "Custom Fishing Rod Order Form" template exists (V31). Pro $49/mo annual. | Public intake page with deposit, for a shop doing ≤30 jobs a month. | Job board, promised date, status page, quote-and-approve, history, metering. At 31+ jobs it is $49/mo. |
| Jotform Starter (R9) | "Active forms: 5", "Monthly submissions: 100", **"Payment submissions (monthly): 10"**, Jotform branding. Bronze $39/mo (100 payment submissions). | Intake with deposit for ≤10 deposits a month. | Same as above; the payment cap bites a 10-job shop immediately. |
| Square Invoices Free (R10) | $0/month; online card **3.3% + 30¢**; "With Square Invoices Free or Plus, you can request a deposit based on a percentage or amount"; estimates can carry a payment schedule ("Add a payment schedule to request an initial deposit"); automatic reminders. Plus $20/mo lowers the rate to 2.9% + 30¢ and adds milestone schedules. | Quote → deposit → final invoice → reminders, i.e. the money half, for any volume. | Public intake, queue with promised dates, customer status page, per-item history. The shop still answers the phone. |
| Google Forms + Stripe | No native payments; needs a paid add-on or a separate Payment Link. | Intake only. | Everything else. |

**Would a reasonable tech just do that?** Many already do a version of it (V22's two invoices, P70's
checkout pages, V1's Square site) and the result is the "tangled mess" Paperform's own template copy
describes. The honest answer: a part-timer at ≤10 jobs a month has a $0 path that costs him a few
phone calls a week, and he may well take it; the product's buyer is the shop at 15+ jobs a month in
season, where Paperform's cap and the phone both start to hurt. That narrows the realistic payer pool
to perhaps 40–60% of the counted businesses, which the channel math should carry (section 5).

### 3d. Stripe Connect Standard: does "the platform holds no money" survive the docs?

Fetched Stripe's current docs (2026-10-21). Verbatim:

- Charge types (R1): "Create a charge directly on a connected account… You can specify an application
  fee, which transfers to your platform's account balance when the connected account collects the
  payment." "Refunds and chargebacks reduce the connected account's balance." "For disputes on
  payments created using direct charges, Stripe debits the disputed amount from the connected
  account's balance, not your platform's balance."
- Direct charges (R2): "`payment_intent_data[application_fee_amount]`: This attribute specifies the
  amount your platform deducts from the transaction as an application fee. After the payment is
  processed on the connected account, the application_fee_amount is transferred to the platform."
  **"There are no additional Stripe fees on the application fee itself."** "Application fees aren't
  automatically refunded when issuing a refund. Your platform must explicitly refund the application
  fee or the connected account… loses that amount." "We recommend using direct charges for connected
  accounts that have access to the full Stripe Dashboard."
- Account types (R4): Standard — "Fraud and dispute liability: Connected account for direct charges";
  "Supported charge types: Direct only"; "Onboarding: Stripe"; "Identity information gathering:
  Stripe"; "Connected account access to the Stripe Dashboard: Full Dashboard". Stripe now steers new
  platforms to Accounts v2 / controller properties, where the same configuration is
  `fees_collector = stripe`, `losses_collector = stripe`.
- Fee payer behaviour (R3): "Accounts created with `type=standard` also have this value" (fee payer
  `account`): "Stripe collects fees directly from your connected account. We don't charge any Connect
  fees to it or to your platform." Dispute fee payer for legacy Standard: **"Connected account"**.
- Risk (R5): when Stripe is responsible, "Stripe covers losses due to your connected accounts'
  negative balances"; "Stripe is responsible for collecting KYC information from your connected
  accounts."
- Connect pricing page (R6): "the connected account is responsible for the cost of Stripe fees,
  refunds, and chargebacks" and "Stripe covers loss liability for these connected accounts"; no
  per-active-account or payout fees under "Stripe handles pricing".

**Verdict on C4:** holds. Application fees on direct charges work for Standard accounts, cost the
platform nothing extra, and every refund, chargeback, dispute fee and negative balance lands on the
shop or on Stripe. Two consequences the gate did not draw: (i) the $1 can be collected as an
application fee on the customer's deposit or completion payment with zero Stripe fee drag, which is
the cheap way to meter; (ii) the platform must decide, per refund, whether to return its $1
(`refund_application_fee`), and that decision needs a rule (section 5).

Billing the residual (jobs with no Stripe payment) through Stripe Billing is where fees bite: a
$1 invoice costs $0.34 (34%), $3 → 14%, $5 → 10%, $10 → 6.6% (2.9% + 30¢ + 0.7%, D3). Stripe's
usage-based "billing thresholds" trigger an invoice when accrued usage reaches an amount; they do
not implement a minimum invoice (R7). So the metering ledger must carry small balances forward
itself.

Resolved VERIFYs from the gate: Supabase Pro includes "$10/month in compute credits" which "covers
one Micro instance"; spend caps are on by default (R36). Resend: Free 3,000/mo and "limited to 100
emails per day"; Pro $20 for 50,000; overage $0.90/1k; dedicated IP $30/mo for senders "exceeding
3,000 emails sent per day"; "By default, all Resend users utilize shared IPs" (R37).

### 3e. Seasonality and churn under metered pricing

The evidence on timing, assembled: spring rush with 5–8-week backlogs (M1, M26, S5, M44 "Dont wait
till March"); closures **July 15–Sep 15** (Fischer, P70), **Aug 25–Oct 15** (Dave's: "We will be
unavailable for repairs from August 25 to October 15", R29), reopening **9/21/2026** (fixreels,
V23); winter benches working (150 reels queued in January at a NJ counter, R30; "staying busy with
winter rod and reel repairs", R31) with a general "midwinter slowdown" in retail (R31).

Model (`scratchpad/season_model.py`, all inputs stated; this is an **estimate**, R41). Monthly demand
profile relative to average: Jan 1.0, Feb 1.1, Mar 1.4, Apr 1.4, May 1.2, Jun 1.0, Jul 0.6, Aug 0.4,
Sep 0.5, Oct 0.7, Nov 0.9, Dec 0.9. Pool mix: 30% rod builders at ~4 builds/mo; 30% part-time techs
at ~8 jobs/mo (closed August); 25% techs at ~18/mo (closed Aug–Sep); 15% counters/busy techs at
~40/mo. $1/job, cap $29.

| Segment | $/yr | avg $/mo | min month | max month | $0 months |
|---|---|---|---|---|---|
| Rod builder, 4 builds/mo | 48 | 4.00 | 2 | 6 | 0 |
| Part-time tech, 8/mo | 93 | 7.75 | 0 | 12 | 1 |
| Tech, 18/mo | 198 | 16.50 | 0 | 27 | 2 |
| Counter / busy tech, 40/mo | 326 | 27.17 | 17 | 29 | 0 |
| **Blended** | **141** | **11.72** | 3.15 (Aug) | 16.50 (Mar/Apr) | — |

Trough month ÷ peak month ≈ **0.19**. At 100 shops: peak ≈ $1,650, trough ≈ $315, year ≈ $14,070.
At 300: $4,950 / $945 / $42,210. Gate's figures for comparison: $1,900 active / $1,663 averaged at
100 shops; $5,700 / $4,988 at 300.

Does the $0 idle month kill predictability? It makes monthly revenue swing 5× across the year, which
matters for a founder's attention, not for solvency: fixed costs are ≈$50–70/mo and the August
trough at 25 shops (≈$80) still covers them. Flat annual plans would be more predictable and, per the
monetization file's own expectation (P§9), would lapse at the first off-season renewal; metered
pricing trades predictability for retention. That trade is right for this pool. The cost is that the
90-day revenue number is tiny: a November launch with 5–25 external shops from day one yields
$190–$950 over Nov–Jan (half that with a realistic ramp), i.e. "paid revenue within 90 days" is met
in letter and is immaterial in amount.

Churn: the gate's 30–45%/yr (first-season lapse plus retirements) is reasonable; metered pricing
removes the renewal event but not the disappearance of techs (N-V4–N-V7, V35, V50) or the shop that
goes back to texting. The plateau arithmetic (GA13) stands; with my ARPU, a 155–400-shop plateau is
$22–56k/yr gross.

### 3f. The founder: what has to be true for five external paying shops in 90 days

Observed on 2026-10-21 (R21): stormprooftackle.com is still the template: "Book NOW" links to "#";
testimonials are "Lorem ipsum dolor sit amet"; counters read "25+ Great Of Experience", "2500+ Happy
Clients", "500+ Award Win", "100+ Active Worker"; team avatars point at the template vendor's demo
domain; the eight services are listed **without prices**; blog posts are from 2023 by a template
author account; drop-off at Princess Anne Distributing Co., 700 21st St. Instagram returned 429 four
more times (R22); the Facebook page "Stormproof Tackle Co." is reachable but shows no follower count
to a logged-out fetch. **No one on the team has measured the founder's reach.** Online, the peer
credibility the gate counts on does not yet exist; on the bench it may.

What must be true, in order:
1. His own shop runs on the product for 2–3 weeks before any pitch, with real customers opening the
   status page, so the demo is a live screen, not a slide.
2. The template site is replaced by the product's own public intake page in a day, before outreach.
3. Ten Hampton Roads shops are visited in person in weeks 1–4 (the 7 VA repair-tagged listings and
   Princess Anne's network, VS24, VS19). At 20–40% (I would not use the monetization file's 30–60%
   for a product nobody asked for) that is 2–4 shops.
4. The shops with visible winter queues are targeted first: Grumpys-type counters (R30), the seven
   price-list shops (P67–P73), Haddrell's (V26), the Houston six (V38–V43), the four alantani
   Service Centers posters with 2025–26 activity (R12). Direct messages from a working tech, not a
   newsletter. 1–3 shops.
5. A card on file is taken at signup (it is $0 until jobs exist), so "paying" happens without a
   second sale.
6. Stripe onboarding never blocks job creation; a shop can run jobs without deposits while KYC
   completes.

Is Nov–Feb the right window? **Yes, but not for the reason the gate gives.** Shops are not closed
Nov–Feb; they are closed Jul–Oct. Winter is when mail-in reels arrive and benches work through them,
and the spring rush (when the status page is worth most) follows. The wrong window is March–June,
when a shop with a 5–8-week backlog will not change how it takes reels in. So: launch by early
December; if the build slips past mid-February, expect the external count to stall until July.

### 3g. Legal and operational exposure

| Risk | Finding |
|---|---|
| Bailment (the shop holds the customer's reel) | The shop's contract with its customer; the platform is a record-keeper. Terms of service must say so explicitly (the platform is not a party to the repair, does not inspect, store or insure items) and the customer status page must name the shop as the business. Normal SaaS exposure. |
| Holding customer money | None, by construction: direct charges settle in the connected account (R1, R2); the platform receives only its application fee. No money-transmission question arises. |
| Chargebacks and refunds on deposits | Land on the shop's Stripe balance (R1: "Refunds and chargebacks reduce the connected account's balance"; R6). Dispute fee: connected account (R3). Negative balances: Stripe (R5, R6). Residual platform decision: whether to refund its $1 on a refunded deposit (R2). |
| KYC / identity | Stripe-hosted for Standard/v2 accounts (R4, R5). The shop may abandon onboarding; the product must work without a connected account (jobs, status, history) and only gate *deposits* on `charges_enabled`. |
| PII | Customer names, emails, phones, item descriptions and photos. No card data touches the platform (Stripe Checkout). Needs: a privacy notice, per-shop data isolation (pass 2), export and deletion on request, photo retention rule. Below CCPA/GDPR thresholds at this scale; still write the notice. |
| Email | Transactional (status, quote, receipt). Resend shared IPs by default (R37); deliverability depends on SPF/DKIM/DMARC on the product's own domain from day one and on a bounce/complaint suppression list. Mitigation that removes the single point of failure: the status page must be reachable from the printed receipt or tag (short URL/QR), so a spam-foldered email is an inconvenience, not a broken promise. No SMS in v1 → no TCPA/10DLC exposure (C3 agreed). |
| Tax | The shop's 1099-K and sales tax are the shop's (its own Stripe account). SaaS sales tax on the platform's $1 fee applies in some states above thresholds this business will not reach for years; note and ignore for now (VERIFY when revenue is material). |
| Platform terms | Stripe Connect platform agreement; restricted-business list irrelevant here. |

Nothing here is beyond ordinary SaaS. The one design obligation that falls out is "the status page
must not depend on email arriving."

---

## 4. Five failure modes, in order of likelihood

Probabilities are my estimates for the first twelve months after launch, given the evidence above;
they overlap and do not sum.

| # | Failure | Probability | Evidence | What must be true for it not to happen |
|---|---|---|---|---|
| 1 | **"Free and fine."** Shops sign up, create a few jobs, and keep taking reels by text, phone and Facebook message; the status URL never goes on the tag; fewer than five external shops are genuinely using it by day 90 and the metered revenue rounds to zero. | **45%** | Zero shops found paying for tracking in 54 pain rows, eight websites, two forum searches (3a); the 2026 builder ask answered with "Google Spreadsheet" (R16); Paperform Free covers a ≤30-job shop's intake and deposit for $0 (R8); Square Invoices Free requests deposits (R10); "A repair shop spreadsheet can feel perfectly fine when… the same one or two people touch every repair" (N-V17); Alan Tani ran 100/month on box dates (N-V10). | ≥5 shops commit *before* the build (section 5, change 1); onboarding to a live public page in <15 minutes; the first thing a shop sees after creating a job is the customer's status page and the email the customer gets; the shop's existing printed form is reproduced as the intake page so nothing is lost. |
| 2 | **Distribution never reaches the pool.** The founder's online reach is unmeasured and his site is a template; Facebook groups are unmeasured; the alantani business board is dormant; ICRBE booths are gone or unaffordable; outreach stalls at the Hampton Roads shops he can drive to. | **35%** | R21, R22, R23, R13; booth prices unpublished and demand high (3b); the gate's 2–5% cold-outreach and 3–5% forum conversion rates are unsourced (gate §3b). | Founder reports Facebook group sizes within a week; an alantani Service Centers post gets replies from working techs; ten in-person visits in weeks 1–4; a walker's pass at ICRBE with a QR card if no booth; one supplier mention (Mud Hole, Smooth Drag, Mystic) secured by month 3. |
| 3 | **It works and stays tiny.** 100 shops is ≈$14k/yr with an August of ≈$300 (3e); the full-penetration ceiling is ≈$0.3–0.6M; the founder's attention drifts back to the bench. | **60%** (conditional on surviving 1 and 2) | Season model (R41); GA17; "lifestyle or wedge" is the gate's own phrase. | The founder wants a profitable side product, or the shop tool becomes the wedge to something evidenced: the angler-owned gear record (candidate d), parts ordering, or the directory (candidate i) via the public pages. None of those is proven; this is a known ceiling, not a surprise. |
| 4 | **Churn above 40%.** Part-timers who onboard in winter go quiet in July–October and do not come back; techs retire, go back to a day job, or drop the service line; the plateau is 100–200 shops. | **40%** | N-V4–N-V7, V35, V50 ("I thought he retired?"), closures R29/P70/V23; GA13. | The $0 idle month keeps the account alive (built in); the public page keeps generating intake while the shop is closed (so the queue is waiting when it reopens); history makes the return automatic; a "closed until <date>" switch on the public page is a v1 feature, not a nice-to-have. |
| 5 | **The first promise breaks in front of a tight community.** Status emails land in spam, or Stripe onboarding stalls a shop at KYC, or a public intake page gets spammed; customers call anyway; the tech tells alantani it "doesn't work". | **15%** | Shared IPs (R37); Stripe-hosted KYC (R4, R5); "Greasy Hands, cannot always pick up the phone" (V4) means nobody will debug DNS. | Domain authentication before the first external shop; status page reachable by QR/short link without email; deposits gated on `charges_enabled` but jobs never gated; rate-limited, captcha'd public forms; a weekly deliverability check in the founder's own inbox. |

A sixth pressure worth naming without a probability: **scope pull toward inventory and POS.** The
only 2026 builder ask is inventory/costs/sales (R16); tackle shops buy POS (Tower, P103–P104). The
product must refuse both in v1 or it becomes a bad Square.

**What has to be true for the whole thing to work, in one paragraph.** A tech with 15+ reels a
month in season values not answering "is it ready yet?" more than he values keeping his texts; the
customer's status page becomes the thing the shop is known for (V41: "my reels are always done
before the estimated date given at drop off"); the public page starts pulling "[city] reel repair"
searches by the second season; and the founder, a working peer, can put the product in front of the
few hundred techs who matter through Facebook, alantani and the expo. None of that is disproved by
the evidence; none of it is proved either, and the cheapest way to find out is to ask five of them
to commit before writing the job board.

---

## 5. Verdict and required changes

**APPROVE WITH REQUIRED CHANGES.** Not a hedge: criteria 1, 3, 4, 5 and 6 pass on my own reading;
criterion 2 fails as written and is convertible by a test that costs nothing and takes three weeks;
a VETO would send the team to a runner-up that fails two criteria structurally. The changes below
move the gate's post-launch kill switch in front of the build, fix the metering mechanics, narrow the
scope, correct the launch rationale, and define metrics that can actually fail.

### Product

1. **Pre-build commitment test (new condition C0, replaces the timing of C6).** Within 21 days of
   this review and in parallel with the scaffold (5a), the founder personally contacts ≥20 external
   shops (the 7 price-list shops, Grumpys-type counters with visible winter queues, the Houston six,
   Haddrell's, the VA 7, the four alantani Service Centers posters with 2025–26 activity, and his
   Hampton Roads drop-off network) and obtains **≥5 written commitments** (an email or message is
   enough) to: run their next 10 jobs through the product at $1/job, put a card on file at signup,
   and connect their Stripe at onboarding. **Fewer than 3 by day 21 → stop; record FAIL on
   criterion 2 in `docs/validation-gate.md`; do not proceed to 5b.** 3–4 → proceed only with the
   founder's explicit acceptance of the lifestyle ceiling (failure mode 3) in the decision log.
2. **The status page must work without email.** Every job gets a short URL and QR on the printed or
   emailed receipt; email is a notification channel, not the delivery mechanism.
3. **Jobs never depend on Stripe onboarding.** A shop creates jobs, sets promised dates and sends
   status before its connected account exists; only the deposit and payment-link buttons wait on
   `charges_enabled`.
4. **"Closed until <date>" switch on the public page in v1**, with intake still accepted and queued
   (three of seven shops close for 4–8 weeks; failure mode 4).
5. **CSV export of jobs, customers and items from day one**, and a deletion path for a customer's
   PII. Export is the trust signal this community responds to and the gate's own defensibility
   argument assumes it.

### Pricing (keep C1's price; fix its mechanics)

6. **Collect the $1 as a Stripe application fee whenever the job has a customer payment through the
   shop's connected account** (deposit or completion). No Stripe fee applies to application fees
   (R2). The "shop may pass the dollar to the customer" option is a line item on that charge.
7. **Residual jobs (no Stripe payment) accrue on a per-shop ledger and are charged to the card on
   file only when the accrued balance is ≥$5 or the shop hits the $29 cap for the month; smaller
   balances roll into the next billable month.** This keeps "$0 in a month with no jobs" literally
   true and keeps fee drag under 10% (3d). Publish the rule on the pricing page in one sentence.
8. **Application-fee refund rule:** if the shop refunds a deposit in full within 7 days of intake,
   refund the platform's $1 too (`refund_application_fee: true`); otherwise keep it. One rule, no
   judgement calls.
9. **Card on file at signup.** It is the commitment signal (change 1) and the mechanism for change 7.
   Expect it to cost sign-ups; that is the point.

### Scope

10. **One job object.** A rod build is a job with a deposit percentage and a longer promised date,
    not a module. Everything C2 wants (50% deposit, promised date, status page, balance on
    completion) is the same screens.
11. **Not in v1, written down:** inventory, cost tracking, POS, SMS, parts catalogue, customer
    accounts (tokenised links only), multi-user roles beyond owner + one helper, AI anything. The
    2026 builder ask (R16) is inventory; the answer to it is "use your sheet", not a feature.
12. **Public intake pages indexable with structured data** (LocalBusiness, opening hours, the
    "closed until" state) and a "powered by" link: C7 agreed, made concrete.

### Launch plan

13. **Launch between mid-November and early December 2026; treat mid-February as the hard stop.**
    Rationale corrected: winter is working season for mail-in techs (R30, R31) and the spring rush is
    when the status page earns its keep; July–October is the dead window (R29, P70, V23), not
    November–February.
14. **Order of operations:** founder's shop live for 2–3 weeks → template site replaced by the
    product's public page → ten Hampton Roads visits (weeks 1–4) → direct messages to the named
    list in change 1 → one post in alantani's "Reel Repair Service Centers" board (the live one), not
    "Member Services" (dormant since 2023) → ICRBE Feb 20–21 2027 as a walker with QR cards unless a
    booth is confirmed and priced by 2026-12-01.
15. **Measure Facebook within a week.** The founder, logged in, records member counts for the custom
    rod builders group and every reel-repair/reel-restoration group he can find, and posts the
    numbers to `docs/decision-log.md`. Channel row 4 is re-computed from real numbers before any
    first-100 claim is repeated in the report.

### Metrics (day-90 scorecard; the re-opened gate if the first line fails)

16. **C6 tightened:** ≥5 external shops, each with **≥10 jobs created across ≥2 calendar months and
    ≥1 customer payment through its connected account**, by day 90. Fewer → criterion 2 FAIL, gate
    re-opened. (Five shops at one job each is not a pass.)
17. Also reported, without pass/fail: external shops with ≥1 job; share of jobs with a promised
    date set; share of jobs where the customer opened the status page; month-3 activity of month-1
    shops (target ≥60%); application fees vs ledger invoices (should be mostly fees); failed card
    charges; email bounce + complaint rate (target <0.3%); ARPU per active shop; median time from
    signup to first job (target <1 day) and to first public-page visit.

Everything above is implementable by one person in the existing plan: changes 1, 13–15 are the
founder's calendar; 2–12 are build decisions; 16–17 are a query.

---

## 6. Items for pass 2 (code review focus)

- **RLS / tenancy.** Every table keyed by `shop_id`; policies for shop owner and helper only; no
  `anon` reads of jobs, customers or items; public intake page writes through an edge function with
  a service role, never a client-side insert; storage policies per shop folder for photos; tests
  that a second shop cannot read, update or delete the first shop's rows or files.
- **Status-page tokens.** ≥128 bits of randomness (not sequential ids, not hashes of ids), stored
  hashed, revocable and rotatable per job, rate-limited by IP, served with no indexing headers; the
  page shows first name, item, status, promised date and the shop's contact, nothing else (no
  email, no phone, no full address, no other jobs); expiry or re-issue after completion decided and
  documented.
- **Stripe webhooks.** Signature verification with the endpoint secret; idempotency on `event.id`
  stored before processing; handle `checkout.session.completed`, `checkout.session.async_payment_*`,
  `payment_intent.succeeded/failed`, `charge.refunded`, `application_fee.created`,
  `application_fee.refunded`, `account.updated` (`charges_enabled`, `payouts_enabled`); all direct-
  charge calls carry the `Stripe-Account` header; webhook endpoint registered for connected-account
  events (Connect webhooks), not just the platform's; refund path implements change 8; no secret
  keys in the client bundle; onboarding via Account Links with return/refresh URLs that re-check
  account state server-side.
- **Metering correctness.** A job counts once, on creation, per shop, per calendar month in the
  shop's time zone; deleting, merging, duplicating or re-opening a job never creates a second unit;
  test/demo shops excluded; the cap applied at $29 per shop-month; a ledger table with one row per
  unit and its collection method (application fee vs card charge) so that fees collected + invoices
  = units billed, reconciled nightly; carry-forward balance logic (change 7) covered by tests at the
  $4.99/$5.00 boundary and at the cap; idempotent monthly charge creation (one PaymentIntent per
  shop-month with an idempotency key); the $290/yr prepay credited against units.
- **Email outbox.** Sends go through a transactional outbox table (status, attempts, next retry,
  provider message id), processed by a worker with backoff; never sent from the browser; per-shop
  sender name with a verified product domain (SPF/DKIM/DMARC); suppression on hard bounce and
  complaint; every email contains the status URL (change 2) and the shop's name as the business;
  a dead-letter view the founder can read.
- **Public intake abuse.** Turnstile/captcha, per-IP rate limits, file type and size limits with
  server-side image resizing, no HTML in free-text fields rendered on the status page.
- **Data lifecycle.** CSV export endpoint (change 5), customer deletion that also removes photos,
  photo retention after job completion, audit log of status changes (who, when, from → to).
- **Time and dates.** Promised dates stored as dates in the shop's time zone, not UTC timestamps;
  month boundaries for metering likewise.

---

## 7. Sources

| ID | Claim / number | Value | Publisher | URL | Published | Accessed | Used in |
|----|----------------|-------|-----------|-----|-----------|----------|---------|
| R1 | Connect charge types: direct charges; application fee transfers to platform; "Refunds and chargebacks reduce the connected account's balance"; disputes debited from the connected account | verbatim | Stripe (docs) | https://docs.stripe.com/connect/charges | live | 2026-10-21 | 3d, 3g |
| R2 | Direct charges: `application_fee_amount`; "There are no additional Stripe fees on the application fee itself"; `refund_application_fee`; recommended for accounts with full Dashboard | verbatim | Stripe (docs) | https://docs.stripe.com/connect/direct-charges | live | 2026-10-21 | 3d, 5 |
| R3 | Fee payer behaviour: Standard = fee payer `account`, "We don't charge any Connect fees to it or to your platform"; dispute fee payer for Standard = connected account | verbatim | Stripe (docs) | https://docs.stripe.com/connect/direct-charges-fee-payer-behavior | live | 2026-10-21 | 3d, 3g |
| R4 | Account types: Standard "Fraud and dispute liability: Connected account for direct charges"; "Supported charge types: Direct only"; onboarding and identity by Stripe; legacy types deprecated in favour of v2/controller properties | verbatim | Stripe (docs) | https://docs.stripe.com/connect/accounts | live | 2026-10-21 | 3d, 3g |
| R5 | Risk management: "Stripe covers losses due to your connected accounts' negative balances"; KYC collected by Stripe when Stripe is responsible | verbatim | Stripe (docs) | https://docs.stripe.com/connect/risk-management | live | 2026-10-21 | 3d, 3g |
| R6 | Connect pricing: "the connected account is responsible for the cost of Stripe fees, refunds, and chargebacks"; "Stripe covers loss liability for these connected accounts"; no platform fees under Stripe-handles-pricing | verbatim | Stripe (pricing page) | https://stripe.com/connect/pricing | live | 2026-10-21 | 3d, 3g |
| R7 | Usage-based billing thresholds: invoice when accrued usage reaches an amount; minimum threshold 50 currency units; no minimum-invoice setting | search snippet of docs | Stripe (docs) | https://docs.stripe.com/billing/subscriptions/usage-based/thresholds | live | 2026-10-21 | 3d, 5 |
| R8 | Paperform Free: "Unlimited Forms", "30 Submissions / month", Stripe and PayPal payments, badge cannot be removed; Pro $49/mo annual, $59 monthly | verbatim | Paperform (pricing page) | https://paperform.com/pricing | live | 2026-10-21 | 3c, 4 |
| R9 | Jotform Starter: 5 forms, 100 submissions/mo, "Payment submissions (monthly): 10"; Bronze $39/mo, 100 payment submissions | verbatim | Jotform (pricing page) | https://www.jotform.com/pricing/ | live | 2026-10-21 | 3c |
| R10 | Square Invoices: Free $0, online card 3.3% + 30¢; Plus $20/mo, 2.9% + 30¢, milestone schedules; help: "With Square Invoices Free or Plus, you can request a deposit based on a percentage or amount"; estimates can "request an initial deposit" | search snippets + help article | Square (pricing page; help centre; community) | https://squareup.com/us/en/invoices/pricing ; https://squareup.com/help/us/en/article/6581-request-deposits-with-square-invoices ; https://community.squareup.com/t5/Square-Invoices/Can-I-Use-Square-Invoices-for-Free/m-p/801001 | live | 2026-10-21 | 3c, 4 |
| R11 | alantani.com index: 454,887 posts, 35,662 topics, 17,263 members; 91 users + 115 guests online; latest posts "Today" (2026-10-20) | as listed | alantani.com | https://alantani.com/ | 2026-10-20 | 2026-10-20 | 3b |
| R12 | alantani "Reel Repair Service Centers" board: 20 topics on page 1 of 3; 4 with 2025–26 posts; "Retiring" 2023-06-26 | as listed | alantani.com | https://alantani.com/index.php/board,27.0.html | 2026-10-20 | 2026-10-20 | 2b, 3b, 5 |
| R13 | alantani "Member Services" board: newest post 2023-09-24; no 2025–26 activity | as listed | alantani.com | https://alantani.com/index.php/board,43.0.html | 2026-10-20 | 2026-10-20 | 2b, 3b, 5 |
| R14 | alantani "How do you keep track of what you do......": personal reels only (grease dates, index cards, notebook, "I hate spreadsheets"); no software, no customers | verbatim | alantani.com | https://alantani.com/index.php/topic,11299.0.html | 2014-07-29 to 2015-02-05 | 2026-10-21 | 3a |
| R15 | rodbuilding.org index: posts dated 10/20/2026; "Current Page: 1 of 1926"; "2027 ICRBE - 137 days to go - Vendor update" (10/05/2026); scam-email warning (09/20/2026) | as listed | rodbuilding.org | https://www.rodbuilding.org/index.php | 2026-10-20 | 2026-10-20 | 3b |
| R16 | "Software": Aaron Mueller, "Wondering what you all are using and what you would recommend for software to keep track of inventory, costs, sales, etc."; Ben Lori, "I personally use Google Spreadsheet." | verbatim | rodbuilding.org | https://www.rodbuilding.org/read.php?2,584503,584503 | 2026-02-23 / 2026-02-24 | 2026-10-21 | 2a, 3a, 4, 5 |
| R17 | rodbuilding.org search "quickbooks": 22 results, all 14–19 years old (Rod Business Software; Micro Rod Shop Management Software; Invoicing and Inventory; small biz accounting software; Excel cost sheet) | as listed | rodbuilding.org | https://www.rodbuilding.org/search.php?2,search=quickbooks,page=1,match_type=ALL,match_dates=0,match_forum=ALL | 2007–2012 | 2026-10-21 | 3a |
| R18 | ICRBE 2027: Feb 20–21 2027, Winston-Salem Marriott, "60+ booths", 50,000 sq ft; 2026 edition Feb 28–Mar 1 at Benton Convention Center | as listed | sharedaudiences.com; cantonfair.net (event listings) | https://www.sharedaudiences.com/events/international-custom-rod-building-exposition-2027 ; https://www.cantonfair.net/event/29462-international-custom-rod-building-exposition | 2026 | 2026-10-21 | 3b, 5 |
| R19 | 24th ICRBE (2026): "attendance has consistently ranged between 2,000 and 2,500 participants annually"; "a 30 per cent expansion in floor space" | verbatim | Tackle Trade World | https://tackletradeworld.com/custom-rod-building-show-going-strength-strength | 2025/26 | 2026-10-21 | 3b |
| R20 | Square Seller Community V1 thread: reply JTPets 2023-02-27 "I put a little blerb in my check out screen…"; no fee complaint; no other tool | verbatim | Square Seller Community | https://community.squareup.com/t5/Questions-How-To/How-would-I-show-my-customers-order-wait-time-or-how-long-an/td-p/639869 | 2023-02-26/27 | 2026-10-21 | 3a |
| R21 | stormprooftackle.com: "Book NOW" → "#"; "Lorem ipsum" testimonials; "25+ Great Of Experience", "2500+ Happy Clients", "500+ Award Win", "100+ Active Worker"; services without prices; template-vendor assets; blog 2023; drop-off Princess Anne Distributing | verbatim | Stormproof Tackle Co. (founder) | https://www.stormprooftackle.com/ | © 2025 | 2026-10-21 | 3f, 4 |
| R22 | Instagram @stormprooftackle: HTTP 429 (unmeasured); Facebook page "Stormproof Tackle Co." reachable, no follower count to logged-out fetch | not retrieved | Instagram; Facebook | https://www.instagram.com/stormprooftackle/ ; https://www.facebook.com/profile.php?id=61581914922846 | — | 2026-10-21 | 3f, 4 |
| R23 | Facebook group `customrodbuilders`: login wall; no member count | not retrieved | Facebook | https://www.facebook.com/groups/customrodbuilders/ | — | 2026-10-21 | 3b, 4, 5 |
| R24 | Hubtiger (Shopify app): Lite $52/mo "1 Technician", "100 SMS credits"; Professional $99; Premium $125; "Job card schedule, with colour coded statuses, per technician"; "Keep customers informed automatically without manual follow-up"; 1 review (1 star) | verbatim | Shopify App Store | https://apps.shopify.com/hubtiger | live | 2026-10-21 | 3a, 4 |
| R25 | Hubtiger press: "three separate packages starting from just £32 per month" (ACT, 2021); "the average cost is $60 a month" (Bicycle Retailer, 2020) | verbatim | BikeBiz; Bicycle Retailer | https://bikebiz.com/act-partners-with-web-and-mobile-platform-hubtiger/ ; https://bicycleretailer.com/retail-news/2020/08/10/hubtiger-apps-connects-retailers-cyclists-tracks-bike-service-intervals | 2021; 2020 | 2026-10-21 | 3a |
| R26 | Generic single-user repair tools: RepairTRAX $30/user/mo; Orderry $39/mo; Shop Pro $39.99/mo (no archery-specific tool found) | as listed | Capterra | https://www.capterra.com/p/130999/RepairTRAX/ ; https://capterra.com/p/151174/Orderry/ ; https://www.capterra.com/p/10033416/Shop-Pro/reviews/ | 2026 | 2026-10-21 | 3a |
| R27 | ATA "An inside look at service prices nationwide": archery service $10–$125; "We advise a customer if something is likely to take longer than usual"; no tracking software mentioned | verbatim | Archery Trade Association | https://archerytrade.org/an-inside-look-at-service-prices-nationwide/ | n.d. | 2026-10-21 | 3a |
| R28 | Archery dealer (York, PA): "many customers contact dealers on a daily basis requesting updates on orders placed" | snippet | Grand View Outdoors | https://www.grandviewoutdoors.com/lifestyle/2013-archery-dealers-of-the-year-offer-sales-tips | 2013 | 2026-10-21 | 3a |
| R29 | Dave's Reel Service: "We will be unavailable for repairs from August 25 to October 15."; "8 Week Turnaround on all repairs."; printed Service Request Form; Basic FW $50, SW $100 | verbatim | Dave's Reel Service (shop) | https://www.davesreelservice.com/rates/ | 2026 | 2026-10-21 | 2b, 3e, 3f |
| R30 | Grumpys Tackle (Seaside Park, NJ) reports, 2026-01-05 and 2026-01-12: roughly 150 reels to service, some from Alaska and Minnesota; reel bench "very busy" | search snippets (archive page shows only Oct 2026 items) | The Fisherman | https://www.thefisherman.com/contributor/grumpys-tackle/ | 2026-01-05; 2026-01-12 | 2026-10-21 | 2b, 3b, 3e, 3f |
| R31 | Matt Broderick, 2026-02-02: "Local shops are staying busy with winter rod and reel repairs"; 2026-01-26 item: "the usual midwinter slowdown" | search snippets | The Fisherman | https://www.thefisherman.com/contributor/matt-broderick/ | 2026-02-02; 2026-01-26 | 2026-10-21 | 2b, 3b, 3e |
| R32 | Joe Cermele: reel repair "big business for mom-and-pop tackle shops"; "now that manufacturers no longer readily supply parts, getting them fixed is no easy task"; cheap reels "essentially disposable"; Mike's Reel Repair profile | verbatim | Outdoor Life | https://www.outdoorlife.com/fishing/quick-strike-podcast-winter-maintenance-fishing-reels | 2026-02-03 | 2026-10-21 | 3b, 4 |
| R33 | PENN repairs: $10.00 processing and handling per reel; printed PDF form; no online status; "We regret to inform you that we are no longer able to service the following PENN reels and downriggers."; payment by phone | verbatim | PENN / Pure Fishing | https://www.pennfishing.com/penn-repairs-service | n.d. | 2026-10-21 | 3b |
| R34 | Shimano US warranty: one-year warranty; "retailers and wholesale outlets are not required or authorized to perform warranty repairs"; void if "subjected to repairs not authorized by Shimano" (pages 403/429 on fetch) | search snippets | Shimano North America | https://fishshop.shimano.com/pages/warranty-service ; https://fish.shimano.com/en-SG/service/c/after-sales-service/maintenance-tips1.html | 2026 | 2026-10-21 | 3b |
| R35 | Daiwa Australia: online Reel Repair Form entered into a "Service Order System", emailed copy to print and ship; 20–30 business days | search snippet | Daiwa Australia | https://daiwafishing.com.au/pages/service-spare-parts-and-repair-forms | 2026 | 2026-10-21 | 3b |
| R36 | Supabase Pro: "from $25/month"; "$10/month in compute credits" covering one Micro; spend caps on by default; 100,000 MAU, 100 GB storage, 250 GB egress, 2M edge invocations | verbatim | Supabase (pricing page) | https://supabase.com/pricing | live | 2026-10-21 | 3d |
| R37 | Resend: Free 3,000/mo, "limited to 100 emails per day", 3 domains; Pro $20 for 50,000, $35 for 100,000; overage $0.90/1k; dedicated IP $30/mo for >3,000/day; "By default, all Resend users utilize shared IPs" | verbatim | Resend (pricing page) | https://resend.com/pricing | live | 2026-10-21 | 3d, 3g, 4 |
| R38 | Shared-IP deliverability trade-offs (dedicated IP only above ~50k/mo; neighbour risk; authentication) | third-party guides | GMass; SendLayer; others | https://www.gmass.co/blog/transactional-email-deliverability/ ; https://sendlayer.com/blog/why-your-mail-provider-has-email-deliverability-issues/ | n.d. | 2026-10-21 | 3g |
| R39 | "He eventually had to close his business. Now, in my area, there are no tackle repairmen." | snippet | BassResource | https://www.bassresource.com/bass-fishing-forums/topic/221029-tackle-repair/ | n.d. | 2026-10-21 | 3b, 4 |
| R40 | Square fee-switching anecdotes (hidden fees elsewhere; Square "exactly as advertised"); collision shop locked into 36-month processor contract | forum/blog | Square Seller Community; Merchant Cost Consulting | https://community.squareup.com/t5/Questions-How-To/How-to-lower-the-processing-fees-or-recommend-for-a-cheaper-POS/m-p/648826 ; https://merchantcostconsulting.com/?p=17760 | n.d. | 2026-10-21 | 3a |
| R41 | Seasonality and metering model | **estimate:** month profile and segment mix as stated in 3e; blended $11.72/mo, $141/yr per shop; trough/peak 0.19 | Red Team (script) | `/tmp/claude-0/-home-user/822949d5-ad3f-50fc-bdc3-49b9599a745f/scratchpad/season_model.py` | 2026-10-21 | 2026-10-21 | 2b, 3e, 4 |
| R42 | Searches that returned nothing relevant (recorded as absence): Reddit via `site:` or "reddit" keywords (9 queries); Facebook group member counts (5); 2025–26 reel-shop closures (2); in-segment use of RepairShopr/RepairDesk/Jobber/Square (2); archery shop software (2); any US reel shop with online repair-status tracking (1); PayPal/Square fee complaints on alantani/rodbuilding (2) | none | WebSearch (this agent) | — | 2026-10-21 | 2026-10-21 | 3a–3c |
