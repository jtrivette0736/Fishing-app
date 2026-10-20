# Validation gate — step 2 (the gate)

Gap Analysis Agent, 2026-10-20. Skill: `.claude/skills/validation-gate-checklist/SKILL.md`.
Evidence read in full: `research/gap-analysis.md` §4–§5, `research/evidence-repair-shop-tool.md`
(V1–V54, N-V1–N-V20, VS1–VS85), `research/monetization.md` §4, §7–§9 (P67–P78, P99–P113,
P123–P127), `research/hobby-immersion.md` §3.6 (M rows), §3.11 (S rows), §4, §7,
`research/infrastructure-and-data.md` (D1–D7), `research/market-sizing.md` §9, §11. New rows in
this file are prefixed `GA`; everything else is cited by its existing id.

**The rules, in three lines.**
1. A candidate must pass all six criteria; one FAIL sends the gate to the next candidate, and a
   well-evidenced FAIL beats a weak PASS.
2. Criterion 1 needs ≥10 independent verbatim examples (different people, ≥3 platforms) with URL
   and date, and a feature → quote map; "would be cool" wishes do not count, workarounds and losses do.
3. Every criterion is argued to FAIL before it is scored; a PASS that depends on a scope or pricing
   decision carries that decision as a named condition into the result.

**Gate order (gap-analysis §5):** a (reel/rod service job tracker) → b (private web logbook) → e
(fly-tying materials inventory). One targeted evidence round per candidate; a has had its round
(`evidence-repair-shop-tool.md`).

---

## Candidate: (a) Job tracking for small fishing-gear service businesses — a reel tech, rod repairer or custom rod builder takes in an item, quotes parts, keeps the customer informed and gets paid, without phone calls, dates written on boxes and hand-raised invoices.

Product as defined by the evidence round: a public "send us your reel / order a rod" intake page
(item, problem, contact, Stripe deposit), a shop job board with statuses and a promised date, a
quote-and-approve step for parts, a tokenised customer status page with automatic email updates
(SMS later), per-customer and per-item service history, and a payment link at completion.
Customer zero: the founder's own workshop (Storm Proof Tackle, Virginia Beach; P1, P3–P5).

| Criterion | Verdict | Justification (≤120 words) | Evidence ids / links |
|---|---|---|---|
| 1 Functionality case | **PASS** | Strongest case to fail: no business-side voice asks for software; the pain is a tolerated workaround (Tani ran 100 reels/month on box dates, N-V10; RepairDesk concedes spreadsheets suffice for one or two people, N-V17). Why it passes anyway: the test is workaround-or-loss, and 24 different people on 12 platforms describe exactly that, with losses — a $25 repair nearly unpaid (V6), rods left a year with no deposit or contact (V12), three months and daily calls (V34), told "ready" when not (V39), a customer lost after four months of silence (V44). Older rodbuilding.org rows (2004–2014) are matched by unchanged 2023–2026 shop pages and complaints (V1, V2, V21–V23, V38–V41, M1). Business-side intensity caps at 2; the 3s are angler-side. | §1 table below; V1–V23, V34–V51, M1, M26, S13, N-V10, N-V17 |
| 2 Willingness to pay | **PASS (lean, conditional)** | Strongest case to fail: not one fishing shop is shown paying for job tracking; shops run $0–30 GoDaddy/Webador sites and take cheques, PayPal or cash (V3, V7, P68, P72); Paperform Free + Stripe covers intake and deposits for $0 (N-V16); many techs are part-time and do not want to scale (N-V11). What passes: adjacent categories are paid, with volume — Tower Systems A$265+/mo, 3,500+ AU/NZ customers, repairs a named reason fishing shops buy (VS42, V33); RepairDesk $99, 3,000+ stores, "mail-in repair" vertical (GA5); Jobber $21–49, 100K+ businesses (GA6); a rod builder already pays Square to take orders (V1); Fischer sells service through checkout pages (P70). Supported price: ≤$29/mo, metered per job (C1). Lean pass only with five paying pilots (C6). | §2 table; P102, P103, P111–P113, VS42, VS53–VS55, V1, V31–V33, N-V11, N-V16, GA5, GA6 |
| 3 Organic marketability | **PASS (conditional)** | (i) First 100: named, counted channels — ~1,560 YP-listed US repair businesses (VS20–24), alantani.com's 17,263 members and 58 self-listed service centres (VS29), rodbuilding.org and ICRBE's 2,000–2,500 builders in one hall (VS30–31), Mud Hole's 73.4K-subscriber list (VS44), Hampton Roads in person — 70–160 paying in ~12 months, midpoint ~110 (§3 table). Strongest case to fail: that is 2–5% of the whole US pool on unsourced conversion rates, Facebook reach is unmeasured, reel techs alone reach only 42–103 (GA15), and the founder's own reach is nil (P7, P1). Passes only with rod builders in scope (C2). (ii) 90 days: 10–25 paying shops from Hampton Roads visits, direct outreach and an alantani thread, if launch falls in the Nov–Feb tooling window (C5). | §3 tables; VS20–VS24, VS29–VS31, VS33, VS44, VS46, VS85, P1, P7, GA15, GA16 |
| 4 Low resource requirement | **PASS** | No licensed or proprietary data, no network effect (one shop gets full value alone), no moderation (shop–customer pages are private; public pages are shop-authored), no hardware. At 10,000 end customers a month: Supabase Pro $25 (photos ~6 GB/mo, egress ~15–30 GB, MAU = shops only; D1, GA9); Netlify Personal $9 (~40 GB ≈ 780 credits; D2, GA10); Stripe 2.9% + 30¢ and Billing 0.7%, deposits settled on the shop's own Stripe account so the platform bears no deposit fees (D3, GA4, C4); Resend Pro $20–35 for ~50,000 emails/mo (GA1, GA8). SMS is kept out of the MVP: 30,000 texts cost ~$384/mo plus 10DLC fees that could not be verified (GA3, GA18, C3). | §4 table; D1–D3, GA1–GA4, GA8–GA10, GA18 |
| 5 Defensible enough | **PASS (weak)** | Strongest case to fail: it is a form, a kanban and a status page; Paperform already sells the pitch (V31), GoCanvas the form (V32); RepairShopr could add a "fishing" page in a day; Tower could cross the Pacific. Why none will: the prize is ≤$0.5–1.7M/yr at full penetration (GA17), below any sales team's threshold; Fishbrain, Garmin, onX and Omnia monetise anglers, ads, maps and retail, not a tech's bench; Square and Shopify treat multi-week custom jobs as an edge case (V1); RepairDesk/RepairShopr need $70–149/mo multi-tech shops. The moat that exists: founder as a working peer with a live reference shop, per-item history, the shop's public URL on tags and forms, the trade's vocabulary. Moderate lock-in, no more. | §5; V1, V31–V33, VS42, VS60–VS62, P111–P113, P126, C§7, GA17 |
| 6 Economics | **PASS** | At the chosen pricing (C1; active-month ARPU ≈ $19, GA7) fixed costs are $46–55/mo (Supabase, Netlify, domain, Resend) and Stripe takes ≈ $0.98 per shop invoice (GA11), so break-even is 3 paying shops, 5 if all are 10-job part-timers (GA12). 100 shops ≈ $1,750/mo net in an active month, 300 ≈ $5,350; season-averaged ≈ $1,500 / $4,650 (§6 table). Churn: 30–40% first-renewal loss turns 100 shops into 60–70 after the first off-season; the plateau is acquisitions ÷ churn ≈ 155–400 shops (GA13). Break-even is never at risk; the ceiling is — a lifestyle or wedge business, which the gate does not forbid. Metered pricing removes the renewal cliff flat annual plans would hit (P§9). | §6 table; D1–D3, GA1, GA7, GA11–GA14, N-V8, P69–P71 |

**Result:** PASS (6/6), **conditional on C1–C7 in §7.** Criterion 2 is the lean one: if condition
C6 (five external paying shops within 90 days of launch) is not met, criterion 2 is re-scored FAIL
and the gate moves to (b).

---

## 1. Feature → pain (criterion 1)

### 1a. The independent verbatim examples

24 quotes, 24 different people, 12 platforms (the three shop websites counted as one platform).
13 of 24 are dated 2020–2026 (GA19). B = business side (the buyer), A = angler side (the buyer's
customer). Quotes are verbatim as recorded in `evidence-repair-shop-tool.md` and
`hobby-immersion.md`; ellipses mark cuts.

| # | Side | Verbatim | Who | Platform | Date | URL |
|---|---|---|---|---|---|---|
| V1 | B | "each build takes anywhere from a few days to two or three weeks depending on complexity and parts availability" … "from what I can see I can only change the item prep time and that's only up to one day of prep." … "I don't want someone to place an order and show up at my house an hour later expecting their rod to be build." | Travis1836, custom rod builder | Square Seller Community | 2023-02-26 | https://community.squareup.com/t5/Questions-How-To/How-would-I-show-my-customers-order-wait-time-or-how-long-an/td-p/639869 |
| V2 | B | "The first thing I'm going to do when I receive a reel for service is review the form the sender submits online" … "send a text or email confirming receipt and condition" … "He estimates 80 percent of the reels sent to him need service" | Doug Lemons, Doug's Reel Repair (Hudson, OH) | Pond Boss (PDB) magazine | 2023-03 | https://www.pdbmagazine.com/2023/03/preseason-reel-repair |
| V3 | B | "fixing reels at a clip of about 100 a month." … "i've got about 60 reels in line right now." … "write the "shipped on ...." date and the "please return by ...." date on the OUTSIDE of the box." … "send me a check in the return envelope that will be send out with the bill." | Alan Tani | alantani.com | 2009-03-17 / 2011-03-23 | https://alantani.com/index.php/topic,277.0.html |
| V4 | B | "Text or email me for a repair/service quote." … "parts are an extra charge if needed" … "and will be quoted prior to purchase and/or installation." … "Text or email is best. (Greasy Hands, cannot always pick up the phone.)" | Scott Rodriguez, Maybe We Can Fix It (Orange, CA) | alantani.com | 2020-10-24 | https://alantani.com/index.php/topic,32169.0.html |
| V6 | B | "Last night a guy picked up a repair I did and brought two 100 dollar bills for a $25.00 repair." … "How do you guys handle repair jobs with clients you don't know? Pay first?" … "but in the future it'll be pay first." | Harry Bell | rodbuilding.org | 2014-09-27 | https://www.rodbuilding.org/read.php?2,429833 |
| V7 | B | "I call my customers and let them know the repair is complete and the charge is X amount" … "If it's a person I have not dealt with and they want write a check I tell them no rod until check clears." | Dave Loren | rodbuilding.org | 2014-09-27 | https://www.rodbuilding.org/read.php?2,429833 |
| V8 | B | "their receipt for it states, goods left over 120 days without payment will be sold for charges." … "Bottom line, no payment, no rod." | Ron Weber | rodbuilding.org | 2014-09-27 | https://www.rodbuilding.org/read.php?2,429833 |
| V10 | B | "With repairs, I'll probably just do cash in advance for everyone except repeat customers" … "they've already demonstrated to me they'll handle a financial transaction in a professional manner" | John E Powell | rodbuilding.org | 2014-09-29 | https://www.rodbuilding.org/read.php?2,429833 |
| V11 | B | "Right now I am backed up 35 orders." … "I do not take a deposit as I do not want to hold onto someone's money." … "a 2 hour customer meeting takes place before ordering a rod" | Capt Neil Faulkner | rodbuilding.org | 2013-10-01 | https://www.rodbuilding.org/read.php?2,414727 |
| V12 | B | "Got a few people who dropped rods off to be wrappd a while ago, haven't been given a deposit or even heard from them" | Billy Vivona | rodbuilding.org | 2010-09-13 | https://www.rodbuilding.org/read.php?2,342991 |
| V13 | B | "Yes. I require a minimum 50% non-refundable deposit to accept an order for production." … "Any balance due must be collected before shipment or at the time delivery." | Jim Gamble | rodbuilding.org | 2010-12-16 | https://www.rodbuilding.org/read.php?2,348911 |
| V21 | B | "No fishing reel repairs are completed without customer approval." … "If repair cost appear to be getting out of line you will be contacted with an estimate" … "Come see us and drop off your reels at the shows:" | Mat's Reel Repair (Eagle River, WI) | shop website (GoDaddy builder) | 2026 (lists five 2026 expos) | https://matsreelrepair.com/ |
| V22 | B | "In the case of repairs requiring parts, we will provide you with a quote for the parts and labor before proceeding." … "After invoicing you for the parts—which must be paid prior to the commencement of repairs—we will begin the work." … "Upon completion, we will invoice you for the labor and return shipping costs." | Valley Reel Works (Rock Hill, SC) | shop website (Webador) | 2026 | https://www.valleyreelworks.com/ |
| V23 | B | "PLEASE CALL OR TEXT ANYTIME BEFORE ARRIVING AT MY RESIDENCE (706) 761-2779" … "will reopen on 9/21/2026" … "Let me know if you plan on shipping or dropping off a rod or reel." | Rod & Reel Repair Guy (Valley, AL) | shop website (GoDaddy builder) | 2026 | https://fixreels.com/ |
| V34 | A | "I used OE's guy (doesn't do reels anymore) once and he had my reel for three months." … "I had to start calling him every day, finally got it back but what a pain...." | Bodofish | Northwest Fishing Reports forum | 2012-06-18 | https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=160872 |
| V38 | A | "they took months and I had to call them to continually get an update." … "$35 was the charge since I did not need any parts replaced." | shoffer | Texas Kayak Fisherman forum | 2024-02-13 | https://texaskayakfisherman.com/forum/viewtopic.php?p=2339973 |
| V39 | A | "they blew there timeline and the kicker was that they told me my reels were ready when they weren't." | OldTownYakBoi | Texas Kayak Fisherman forum | 2025-01-13 | https://texaskayakfisherman.com/forum/viewtopic.php?p=2339973 |
| V41 | A | "FTU takes forever but the work they do is fine." … "my reels are always done before the estimated date given at drop off." | LocoSeamonkey | Texas Kayak Fisherman forum | 2025-02-21 | https://texaskayakfisherman.com/forum/viewtopic.php?p=2339973 |
| V44 | A | "I entrusted my reel to Otto's for repair, with the expectation of a prompt resolution within approximately two weeks." … "subsequent updates on the progress were scarce." … "Despite assurances of timely communication upon completion, I received no further updates." | Chris (1-star review of Otto's Tackle World, Sydney) | Trustpilot | 2024-03-13 | https://ie.trustpilot.com/review/ottostackleworld.com.au |
| V45 | A | "I sent a reel in under warranty 6 weeks ago for repair and have not heard anything back" (snippet) | reviewer (PENN) | Trustpilot | n.d. | https://es.trustpilot.com/review/pennfishing.com |
| M1 | A | "Any recommendations on where I can take them for a quickish fix?" … "I didn't even know shops did this." … "East county has a 8 week backlog. Ugh" | Shawnster | sdfish.org | 2026-06-16/18 | https://www.sdfish.org/viewtopic.php?p=28999 |
| V47 | A | "They have a website with a repair form to print and put in box with reel." … "One just needed cleaning $29.99 and $15.00 FedEx." | HomerRudd | TigerDroppings | 2025-10-18 | https://www.tigerdroppings.com/rant/outdoor/fishin-reel-repair/120703280/ |
| V51 | A | "Rochester Reel Repair check him out on Facebook. Brian at 585-455-1792" | oneluvunknown | Lake Ontario United | 2020-04-28 | https://www.lakeontariounited.com/fishing-hunting/topic/85867-reel-repairs/ |
| M26 | A | "It might take a while @ Haddrell's, I was on a 5 week wait." | in_the_grass | charlestonfishing | 2012-05-20 | https://forum.charlestonfishing.com/t/reels/38461 |

Independence: 14 business-side people on five platform types (Square community, trade magazine,
alantani.com, rodbuilding.org, shop websites) and 10 angler-side on seven (NWFR, TKF, Trustpilot,
sdfish, TigerDroppings, LOU, charlestonfishing). Nobody appears twice. The wider file holds 29
business-side and 21 angler-side independent voices (evidence file §0).

**Age of the evidence, weighed.** Eight of the fourteen business-side quotes are rodbuilding.org
threads from 2004–2014. The gate does not take them on faith: the 2026 shop pages (V21–V23) still
describe call/text intake, approval by phone and a two-invoice parts flow; the 2023 PDB profile
(V2) still has a web form re-typed into texts; the 2023 Square thread (V1) shows the mainstream
tool cannot express a multi-week job; the 2024–2026 angler complaints (V38–V41, V44, M1) are about
the same silence. The founder's own site, live in 2026, has a dead "Book NOW" button and a "$0.00"
repairs heading (P1, P5). The workflow has not changed; the old quotes describe today.

**Strongest case to FAIL, answered.** (1) "Nobody asks for software." True, and recorded (N-V20
finds no tech saying they *don't* want tracking either). The skill's test is a described
workaround or loss, not an explicit product ask; both are present. (2) "The workarounds are
tolerated." Also true for the busiest tech on record (N-V10). This is a price question and is
carried into criterion 2, where it caps the price, not a functionality question. (3) "Intensity is
2 on the buyer side." Correct; the 3s (switched shop, took the reel elsewhere) belong to the
buyer's customers, which is why the status page is the feature that sells the rest.

### 1b. Core feature → the quotes it resolves

| Core feature | Business-side quotes | Angler-side quotes | Pain it removes |
|---|---|---|---|
| Public intake page (item, problem, contact) | V2 (web form then hand-typed confirmation), V4 and V23 (text/call intake), V3 (dates written on the box), V20 (consultation by message), V21 (drop-offs at expos), V11 (two-hour meeting) | V47 (printed form in the box), V51 and V36 (discovery by Facebook page and phone number), M1 ("didn't even know shops did this"), M20, M22, M25 (where-to-go asks) | Intake that lives in texts, phone calls, boxes and printed forms; no front door a customer can find |
| Stripe deposit at intake | V6 (stiffed; "pay first" from now on), V12 (rods left with no deposit and no contact), V13, V15–V17, V25 (50% deposits collected by hand), V10 (cash in advance except repeat customers), V22 (parts prepaid by a hand-raised invoice) | — (customers already pay 10–30% deposits to guides, P86, and $10–20 estimate fees to shops, P67, P68) | Non-payment and abandoned work; the deposit flow builders already run, done by hand |
| Job board with statuses and a promised date | V3 ("60 reels in line", queue = dates on boxes), V11 ("backed up 35 orders"), V27 ("nearly full"), V1 (cannot express a 2–3 week lead time in Square), V30 (supplier lead times move promised dates) | V39 (told "ready" when not), V41 (a date given at drop-off is the differentiator), M26 and S4/S5 (5–8 week waits), V52 (no published turnaround) | A queue kept in the tech's head or on cardboard; promised dates that are blanket statements |
| Tokenised status page + automatic email updates | V7 (phone call when done), V4 ("cannot always pick up the phone"), V2 (manual text/email per reel), V21 ("We return all questions as soon as possible") | V34 ("calling him every day"), V38 ("had to call them to continually get an update"), V44 ("updates on the progress were scarce"), V45 (six weeks, nothing), V46 (no callbacks), V52 | Status enquiries by phone in both directions |
| Quote-and-approve step for parts | V4 (quoted before purchase), V21 ("No fishing reel repairs are completed without customer approval"), V22 (quote, prepaid parts invoice, then labour invoice), V28 (parts as a separate invoice line), S13 ("we will quote the work before commencement"), P79 (OEM "estimate for your approval") | V54 (quoting by phone even at the OEM), V42 ("$70 and really didn't make much of an improvement") | Approval by phone; two hand-raised invoices per job |
| Service history per customer and per item | V10 (repeat-customer memory), V12 (no record of who dropped what), V8 and V9 (uncollected-work rules kept on paper receipts), V2 (80% service / 20% repair, judged by eye) | M48 (one angler keeps his own spreadsheet), M27/S17 (a retiring tech takes three generations of history with him) | Who owns what, what was done last time, what is still uncollected |
| Payment link at completion | V7 ("no rod until check clears"), V8 ("no payment, no rod"), V3 (cheque in the return envelope), V22 (pay online, then it ships), P72 (pay in full before return) | V47 ($29.99 + $15 FedEx paid on return) | Cheques, cash on pickup, payment by phone |

---

## 2. Willingness to pay (criterion 2)

### 2a. What people pay for this job or its workaround today

| Product / service | Price | Volume signal | Who pays it now | Relevance to this job | Src |
|---|---|---|---|---|---|
| Tower Systems POS, "Repairs and Job Management" module | A$265–298/mo inc GST (annual), $285–320 monthly; fishing shops priced at "$165/month" in 2023 | "3,500+ customers in Australia and New Zealand" (all verticals; no fishing count) | AU/NZ fishing and outdoor retailers; "Manage rod and lure repairs" is a named buying reason | The only product found that sells repair tracking to fishing shops; POS-first, not sold in the US | VS42, VS56, VS57, V33 |
| RepairDesk | $99/mo ($79 annual), Growth $149 | "Trusted by More Than 3,000+ Repair Stores"; verticals include mail-in, bicycle, small-engine, no fishing | Phone/computer/jewellery repair shops | Same workflow (ticket, quote, status, pickup) at 3–5× this pool's budget | P111, GA5 |
| RepairShopr / Digital Wrench / RepairTRAX | $69.99–$149.99 / $39.95 / $30 per user | no counts on disk | general repair shops | Same workflow; Digital Wrench's $39.95 is the nearest single-tech price | P112, P113 |
| Jobber (field service) | Core $49 monthly, $21–24 annual (1 user) | "100K+" businesses; "over 400,000 service pros" | home-service trades | Quote → approve → job → invoice for one-person trades at $21–49 | VS53, GA6 |
| Square Appointments | Free; Plus $49/location | no count on disk; one rod builder is on Square and hit the 1-day prep-time limit | small service businesses | What a rod builder uses today and finds unable to express a 2–3 week lead time | P102, V1 |
| Shopify / per-reel checkout pages | Basic $39 ($29 annual) | Fischer Angling takes service orders through product checkout pages | one reel shop | A reel shop already pays e-commerce money to take service orders | P103, P70 |
| GoCanvas "Fishing Rod and Reel Repair Request Form" | $29–49 per user, 3-user minimum → $87+/mo | template exists (vendor built it for this trade) | unknown | Form only; no job board or status page | VS54, V32 |
| Paperform "Custom Fishing Rod Order Form" | Free (Stripe payments included); Pro $49 annual | template exists; its copy is this candidate's pitch ("email threads and text messages become a tangled mess") | unknown | The $0 substitute for intake + deposit | VS55, V31, N-V16 |
| Website builders the shops actually run | GoDaddy, Webador, WordPress, Universe: $0–30/mo class | 5 of 8 shops found | the pool | The pool already pays small monthly software fees for a front door that cannot take a job | VS48–VS51, P1 |
| Payment processing today | PayPal / Square / card fees ~2.6–2.9% + fixed; cheques and cash | every shop found | the pool | Fees are already paid per job; a per-job software fee is the same shape | V3, V7, V22, P68, P72 |
| The job itself (what the tool protects) | $20–$100 per reel; $25 repair to $125–$275+ per rod; 50% deposits standard | 7 price lists, ~20 forum price anchors | anglers, without complaint at $15–$44 | Sets the budget: 30–100 jobs/mo × $25–50 = $750–5,000/mo gross | P67–P73, V6, V11, V38, V42, V47, Y23–Y26, P93–P96 |
| Angler-paid platform fees (the hobby's proven B2B pattern) | TourneyX $6.50/angler; Weighfish 6.5% ($1 min); FareHarbor 6–8% customer-paid; FishingBooker 10–30% | 115.9k active anglers (TourneyX); 1,300+ events in 2025 (Weighfish); 9,463 captains (FishingBooker) | the business's customer, not the business | Usage-based pricing is what fishing businesses have actually adopted | P57, P61, P99, P39, P41 |

### 2b. The free-substitute problem, head on

Paperform Free + Stripe, Square Free and Google Forms each do one thing this product does: take
an order and, for the first two, a deposit. None gives a queue with promised dates, a customer
status page that updates itself, a quote-and-approve step with the parts invoice attached, or a
record of what was done to this reel last time. A shop that assembles them keeps the spreadsheet,
the phone and the printed form — the "tangled mess" Paperform's own template copy describes (V31).
So the free tools cap the price of intake at $0 but leave the status, approval and history work
unpriced; the product's price has to be set against the shop's time on the phone and the
abandoned-job losses (V6, V12), not against Paperform. That argument is sound and also unproven in
this pool: it is why criterion 2 is lean.

### 2c. The price the evidence supports — and the decision

Ceiling: $29/mo. Shopify's annual Basic ($29) and Digital Wrench ($39.95) are the lowest paid
software one-person fishing and repair businesses are shown on; a $29 tool is 0.6–4% of a
$750–5,000 monthly service gross (evidence file §4); RepairDesk's $99 is 7–13% of a 30-job shop's
gross and consistent with these shops running on paper (P§7f). Floor and shape: the pool is
part-time and seasonal — "keeping me busy on a part time basis, which is what I wanted" (V5),
"What started as a casual side hustle" (V20), three of seven shops closed 4–8 weeks (P69–P71, N-V8),
and the monetization file expects annual plans to lapse at the first off-season renewal (P§9). The
only B2B software this hobby has adopted at scale charges per use, not per month (TourneyX,
Weighfish, FareHarbor, P§8).

**Decision carried into the result (C1): metered pricing — $1.00 per job created, capped at
$29 per shop per month, $0 in a month with no jobs; the shop may add the dollar to the customer's
payment link as a service-fee line (the customer-paid variant, built in rather than offered as a
second plan); an optional $290/yr prepay for shops that prefer one invoice.** A 10-job part-timer
pays $10; a 30-job shop $29; Alan Tani at 100/month $29. This is one price with a cap, not two
plans: it answers the "nobody pays for software" objection by costing less than the $15–20 estimate
fee shops already charge per job (P67, P68), and it answers seasonal churn by charging nothing while
the shop is closed. Stripe's fixed 30¢ makes sub-$8 invoices expensive (D3); a $10 invoice loses
6.6% to fees, acceptable (GA11).

**Why this is a lean pass and what converts it.** Named paid products exist with prices and
volume signals (Tower 3,500+, RepairDesk 3,000+, Jobber 100K+), a supported price point is stated,
and the pool already pays small software and processing fees — the letter of the criterion is met.
The spirit is not: zero fishing shops are shown paying for job tracking, and the two people found
on paid tools (V1, P70) are using generic checkout, not tracking. **Clean pass requires five
external shops (not the founder's) each invoiced ≥$1 under C1 within 90 days of launch (C6).**
Failing that, this criterion is FAIL and the gate moves to (b).

---

## 3. Organic marketability (criterion 3)

### 3a. The pool (evidence file §2)

| Segment | Estimate | Confidence | Src |
|---|---|---|---|
| US businesses taking in reels for service/repair | 800–1,400 listed (core dedicated techs 500–900) | low–medium | VS20–VS24, VS82 |
| US custom rod builders who sell to customers | 1,500–4,000 | low | VS30–VS35, VS83 |
| US tackle shops with a service counter (overlaps the first row) | 1,000–1,600 | low–medium | VS15–VS19, M47 |
| US total addressable | **≈2,000–4,500** | low | evidence file §2 |
| UK, Canada, Australia | 250–450 | low | VS38–VS42, VS84 |

100 paying shops is 2–5% of the US pool, or ~2–4% with the English-speaking pool abroad (G1, G2).

### 3b. Requirement (i): the first 100 paying shops with no ads

Conversion = a shop that creates jobs and is invoiced under C1. Assumptions are the evidence
file's (VS85), restated per row; none is a sourced conversion rate.

| # | Channel | Reach (sourced) | Assumption | Paying shops | Timing |
|---|---|---|---|---|---|
| 1 | Direct outreach to listed US repair businesses (email, Facebook page, phone), founder writing as a peer | ≈1,560 YP "Fishing Tackle Parts & Repair" listings extrapolated from TX 36, FL 155, CA 60, NY 34, VA 7 (VS20–VS24); the six Houston shops anglers name (V38–V43); brand locators (VS25–VS27) | 1,000 reachable; cold peer B2B 2–4% | **20–40** | months 1–12 |
| 2 | alantani.com (Reel Repair by Alan Tani): a thread in "Reel Repair Service Centers" and "Member Services", the Smooth Drag and Mystic Parts boards | 17,263 members, 454,886 posts; Service Centers board 58 topics (58 shops announcing themselves); Smoothdrag board 324 topics (VS29) | 300–600 members are working or side-hustle techs; 3–5% | **10–30** | months 1–6 |
| 3 | rodbuilding.org + ICRBE, Winston-Salem, Feb 20–21 2027 | ≈96,000 topics (VS33); expo 2,000–2,500 builders, 60+ booths (VS30–VS32) | A booth or sponsor post reaches 2,500; 1–2% sign up, half pay | **12–25** | after Feb 2027 |
| 4 | Facebook: "Custom Rod Builders" group (8,297 posts mirrored to rodbuilding.org since 2024-09), local fishing pages, shop pages | **member counts not retrievable** (login wall; evidence file §0); techs name Facebook as their channel (V20, V51) | assume 5–10k members; 0.3% | **15–30** (low confidence) | months 2–12 |
| 5 | Supplier partners: Mud Hole (components, classes), Smooth Drag/Carbontex, Mystic Reel Parts, Batson, Hedgehog Studio | Mud Hole YouTube 73.4K subs / 28.3M views (VS44, VS45); Smooth Drag and Mystic have their own alantani boards (VS29) | one newsletter or forum mention to a 5–10k builder/tech list; 0.2–0.5% | **10–20** (half reel-parts, half rod-components) | months 3–12 |
| 6 | StripersOnline Reel Maintenance and Repair (34.6k posts) and Rod Building (131.8k posts) boards; YouTube reel-repair creators (2nd Chance Tackle 42.8K subs) | VS46, VS47 | audiences are anglers and DIYers; a creator with a mail-in service might adopt the status page | **0–5** | any |
| 7 | Hampton Roads in person: founder's drop-off partner and the shops he knows | VA 7 repair-tagged (VS24); 33 Virginia Beach "fishing reel repair" results incl. Princess Anne Distributing (VS19); P1, P§7b | 10 shops visited; 30–60% | **3–6** | weeks 1–4 |
| 8 | Built-in loop: each shop's public intake page indexed for "[city] reel repair" with a "powered by" link; every status email a customer opens carries the brand | demand for the query shown by M20, M22, M25, V35–V37, V50–V52; **no search-volume evidence on disk** | starts after ~20 shops are live | **+10–20%** after month 6 | months 7–12 |

Sums (GA15): **reel techs only** (rows 1, 2, 6, 7, half of 5, plus the loop) = 42–103;
**with custom rod builders** (all rows) = 70–160, midpoint ≈110. The ICRBE is the one channel
where more than half of the target builders stand in a single hall for two days; dropping builders
drops it. Hence **condition C2: custom rod orders (50% deposit, promised date, status page) are in
v1, and "item" means a reel or a rod build.**

What a red team will attack here, stated now: the 2–4% and 3–5% conversion rates are assumptions;
Facebook reach is a guess; the founder's Instagram is unmeasured (P7) and his own website is a
template with placeholder copy and a dead booking button (P1, P2), so the "peer" credibility is
real on the bench and absent online until fixed (C5). The path is credible on paper and reaches 100
only at the midpoint of low-confidence inputs; it is not a FAIL because every channel is named,
counted and reachable by one person without ads, and the ceiling of 2–5% penetration is modest for
a trade this concentrated.

### 3c. Requirement (ii): paid revenue within 90 days of launch

Launch assumed inside the Nov 2026–Feb 2027 window (C5), after a 4–6-week build (G7), with the
founder's shop already live on it. Revenue counted = invoices to shops other than the founder's.

| When | Action | Paying shops (cumulative) | Monthly run-rate at that point | Basis |
|---|---|---|---|---|
| Before launch | Founder's shop runs on it; his site's dead "Book NOW" becomes the intake page; 2–3 Hampton Roads shops see it working | 0 (customer zero is unpaid) | $0 | P1, P5, C5 |
| Weeks 1–4 | 10 Hampton Roads shops visited in person | 3–6 | $30–175 (3–6 shops × $10–29) | row 7; conversion 30–60% is the monetization file's in-person assumption (P§7b) |
| Weeks 2–8 | alantani.com thread; the 58 self-listed service centres contacted by PM | 6–16 | $60–460 | row 2 |
| Weeks 3–12 | Direct outreach to ~300 of the ~1,560 listed (the four counted states, VA, the Houston six) at 2–4% | 10–25 | $100–725 | row 1 |
| Day 60–90 | ICRBE Feb 20–21 2027 if launch is by December: booth or floor; sign-ups mostly convert after day 90 | +0–5 inside the window | — | row 3 |

By day 90: **10–25 paying shops, $100–725/month run-rate, $300–1,000 cumulative** (GA16). That is
paid revenue inside 90 days and it is small; the figure that matters for the gate is C6 (≥5
external paying shops), which sits at the bottom of this range. If launch slips past February into
the season, rows 1–2 slow (shops do not change tooling mid-season, P§7a) and the 90-day path
depends on Hampton Roads alone (3–6 shops) — still revenue, but C6 becomes marginal.

**Seasonal timing is itself a channel.** Shops push off-season specials to flatten the spring rush
("Dont wait till March", M44/S1); the status page's value peaks in March–June when backlogs hit
5–8 weeks (M1, M26, S5). A January launch puts the pitch in the buying window and the product's
proof in the pain window.

---

## 4. Dependencies (criterion 4)

Scale for the arithmetic: 10,000 end customers a month ≈ 10,000 jobs a month across ~300–400
shops; each job carries ~2 photos (resized client-side to ≤300 KB), ~5 emails and, if SMS were on,
~3 texts.

| Dependency | Role | Price | Limit and the arithmetic at 10,000 jobs/mo | Terms / pricing URL | Verdict |
|---|---|---|---|---|---|
| Supabase Pro | Postgres, auth (shops only), storage for photos, edge functions for email/Stripe webhooks | $25/mo (+ compute above the included credit, VERIFY) | DB 8 GB: job rows are kilobytes, fine. Storage 100 GB then $0.0213/GB: 10,000 × 2 × 300 KB = 6 GB/mo → 72 GB/yr; ~$1/mo overage from year 2 (GA9). Egress 250 GB: 10,000 customers × 3 status-page views × 0.5 MB ≈ 15 GB + photo views ≈ 15–30 GB. MAU 100,000: customers use tokenised links, no account; MAU ≈ shops (hundreds). Edge invocations 2M: ~10 per job = 100k. | https://supabase.com/pricing (D1) | PASS, inside every quota |
| Netlify | static app + per-shop public pages | Free (300 credits) at launch; Personal $9 (1,000 credits) at ~300 shops | Bandwidth 20 credits/GB: (300 shops × 30 sessions + 30,000 customer page loads) × 1 MB ≈ 39 GB ≈ 780 credits → Personal $9 (GA10) | https://www.netlify.com/pricing/ (D2) | PASS |
| Stripe Payments + Billing | shop invoices under C1 (metered) | 2.9% + 30¢ per card charge; Billing 0.7% of volume; Checkout and Payment Links included | $0.98 per $19 invoice, $1.34 per $29, $0.66 per $10 (GA11). No volume limit. | https://stripe.com/pricing (D3) | PASS |
| Stripe Connect (Standard accounts, direct charges) | customer deposits and completion payments settle to the **shop's own** Stripe account | Direct charges: "the connected account covers Stripe fees, refunds, and chargebacks"; the $2/monthly-active-account and 0.25% + 25¢ payout fees apply only under the "you handle pricing" (Express/Custom-style) model, which this design avoids. The page does not distinguish Standard specifically — VERIFY in Connect docs before build. | Platform cost $0 at any volume; shops onboard with Stripe's hosted flow. The platform never holds customer money (C4). | https://stripe.com/connect/pricing (GA4) | PASS (one VERIFY) |
| Resend (transactional email) | status, quote, approval and payment emails to end customers; magic links to shops via custom SMTP | Free $0: 3,000/mo, 100/day, 3 domains. Pro $20: 50,000/mo; $35: 100,000; overage $0.90/1k | 5 emails × jobs: 100 shops (2,500 jobs) 12,500/mo; 300 shops 37,500; 10,000 jobs 50,000 → Pro $20 at the cap, $35 for headroom (GA8). Free's 100/day is exceeded at ~20 jobs/day, i.e. within weeks of launch. | https://resend.com/pricing (GA1) | PASS, $20–35/mo |
| Postmark (alternative) | same | Free 100/mo; Basic $15 for 10,000 then $1.80/1k; Pro $16.50 ($1.30/1k) | 50,000/mo ≈ $66–87 by the listed overage rates (my arithmetic, not a published price) | https://postmarkapp.com/pricing (GA2) | Resend is cheaper at this volume |
| Twilio SMS (optional, **not in MVP**) | text updates | $0.0083/segment out and in; carrier fees AT&T $0.0035, T-Mobile $0.0045, Verizon $0.005; long code $1.15/mo; A2P 10DLC "subject to registration onboarding fees" — amounts not retrievable from Twilio's pages today (VERIFY) | 3 texts × $0.0128 × 10,000 jobs ≈ $384/mo; 2,500 jobs ≈ $32; 7,500 ≈ $288 (GA18). Per-shop numbers would add $1.15 × shops. | https://www.twilio.com/en-us/sms/pricing/us (GA3) | Excluded by C3; later as an opt-in add-on billed at pass-through plus margin |
| Domain | the product and `shop.<domain>` or custom subdomains | ~$15/yr (estimate, not fetched; GA14) | — | — | PASS |
| Third-party fishing data | none | — | No tide, weather, regulation, map or chart data is used anywhere in the product. | D table | PASS |
| Datasets to build or license | none | — | Reel and rod models are typed by the shop or customer; no catalogue is maintained. A brand/model picklist can grow from entries, never from a licensed source. | — | PASS |
| Network effects / cold start | none | — | One shop with one customer gets the full product; the founder's shop is that shop on day one. | — | PASS |
| Moderation at scale | none | — | Shop–customer pages are private and tokenised; public pages are authored by the paying shop (terms of service + takedown suffice). | — | PASS |
| Hardware | none | — | Phone camera for photos; no label printers, scales or card readers required. | — | PASS |

Total third-party cost at 10,000 jobs/mo: ≈ $25 + $9 + $20–35 + $1 ≈ **$55–70/mo plus Stripe's
percentage on the platform's own invoices.** Nothing requires a key or contract a solo founder
cannot obtain in an hour; the two VERIFY items (Supabase compute credit, Connect Standard fee
wording) are confirmations, not risks.

---

## 5. Defensibility (criterion 5)

**The strongest case to FAIL.** This is a form, a kanban board and a tokenised page. Paperform has
already written the pitch and sells the intake-plus-deposit half for $0 (V31, N-V16); GoCanvas
sells the reel-repair form (V32); Square's community will keep handing rod builders workarounds
(V1); RepairShopr or RepairDesk could publish a "fishing rod and reel repair software" landing page
in an afternoon; Tower Systems already ships repairs-plus-SMS to fishing shops in Australia and New
Zealand (VS42, VS56). The code is a few weeks' work for anyone. There is no data moat.

**Why none of them will take it.** The prize is too small: 2,000–4,500 US businesses plus 250–450
abroad at ≤$29/month is $0.5–1.7M a year at *100%* penetration (GA17, P126), below the threshold
at which Square, Shopify, Jobber (100K+ customers, GA6) or RepairDesk (3,000+ stores at $99–149,
GA5) would fund a vertical, and RepairDesk's and RepairShopr's $70–149 price points cannot be sold
to one-person shops grossing $750–5,000 a month without breaking their own unit economics (P§7f).
Fishbrain, Garmin/Navionics, onX and Omnia monetise anglers through subscriptions, ads, charts and
retail (C§7); a tech's bench has no ad inventory, no map and no catch data, and a business tool for
600–900 techs is not a line item for any of them. Tower is a POS vendor priced at A$265+/mo for
Australian retail and has shown no US intent (VS42, VS60). Paperform and GoCanvas are horizontal
form builders; a job board, a status page and per-item history are products, not templates, and
neither will build a fishing vertical around a template that exists to show breadth.

**What the moat actually is, and how weak.** (1) The founder is a working reel tech with a live
reference installation in his own shop, selling to peers in a trade where work is found by word of
mouth and Facebook (V20, V51) and where the forum owner is himself a repairman (VS3); a second solo
founder would need that standing, and no incumbent has it. (2) Per-item and per-customer history
accumulates from the first job — the "repeat customer" memory of V10 — so the switching cost grows
with use; the data is small and must be exportable, so this is moderate lock-in, not strong.
(3) The shop's public intake and status URL goes on hang tags, Facebook posts and the printed form
(V21, V47) and gets indexed for "[city] reel repair" (M20, M22, M25, V50–V52 show the question is
asked everywhere); leaving means retraining customers. (4) The trade's vocabulary is built in —
service tiers by reel class, parts approval before work, 50% build deposits, promised dates,
uncollected-item rules (V8, V9, S13) — which generic tools get wrong (V1). None of these stops a
determined copier; together they mean the realistic competitor is another hobbyist-developer, and
the first one in with the trade's trust and the SEO pages keeps most of a small field. **PASS, on
"defensible because unattractive to anyone bigger", and recorded as weak.**

---

## 6. Economics (criterion 6)

Pricing per C1. Active-month ARPU ≈ $19 (GA7: 40% of shops at ~10 jobs → $10; 40% at ~24 jobs →
$24; 20% at the $29 cap); season-averaged ARPU ≈ $17 (10.5 billable months in 12, from the 4–8-week
closures at three of seven shops and off-season quiet, N-V8, P69–P71, S20). Flat $29 shown for
comparison. Deposits and completion payments run on the shops' own Stripe accounts (C4) and do
not appear in the platform's costs.

| Line | 100 paying shops | 300 paying shops | Basis |
|---|---|---|---|
| Revenue, active month (ARPU $19) | $1,900 | $5,700 | GA7 |
| Revenue, season-averaged (ARPU $17) | $1,663 | $4,988 | GA7 |
| *Comparison: flat $29/mo, no seasonal relief* | *$2,900* | *$8,700* | P§7f |
| Stripe on platform invoices (2.9% + 30¢ + 0.7%) | −$98 | −$294 | D3, GA11 |
| Supabase Pro | −$25 | −$25 | D1 |
| Netlify | $0 (Free, 300 credits) | −$9 (Personal) | D2, GA10 |
| Resend Pro (12,500 / 37,500 emails) | −$20 | −$20 | GA1, GA8 |
| Domain | −$1.25 | −$1.25 | GA14 |
| **Fixed costs** | **−$46** | **−$55** | |
| **Net, active month** | **≈ $1,756** | **≈ $5,351** | |
| **Net, season-averaged** | **≈ $1,519** | **≈ $4,639** | |
| SMS if it were included (3 texts/job, opt-in later only) | −$32 | −$96 (7,500 jobs ≈ $288 at 10k-scale usage) | GA3, GA18 |
| Break-even (fixed ÷ net per shop) | $46 ÷ ($19 − $0.98) = **3 shops**; all-part-timer case $46 ÷ ($10 − $0.66) = **5 shops**; flat $29: 2 shops | | GA12 |

**Churn sensitivity (30–40% first-renewal churn).**

| Scenario | Effect |
|---|---|
| Cohort: 100 shops paying by month 12; 30–40% lapse at the first off-season | 60–70 remain; active-month revenue falls from $1,900 to $1,140–1,330 until replaced. Holding 100 needs 30–40 new shops every year — 43–57% of the first year's whole acquisition effort, repeated indefinitely. |
| Add the trade's structural attrition: techs retire, go back to a day job, or drop the service line (N-V4–N-V7, V35, V50) | Annual churn 40–45% rather than 30–40%. |
| Steady state, plateau = acquisitions per year ÷ churn (GA13) | 70/yr ÷ 45% ≈ 155 shops; 160/yr ÷ 40% ≈ 400 shops → $2,900–7,600/month gross in active months, $2,600–6,800 season-averaged. |
| Flat annual plans instead of C1 | Every closed shop faces a renew-or-cancel decision in its dead season; the monetization file expects lapses at exactly that point (P§9 item 3). Metered pricing has no renewal event: a shop closed in September pays $0 and is still a customer in November. |
| Downside case: only reel techs convert (no builders), 42–103 acquisitions/yr, 45% churn | Plateau 93–229 shops; still 30–75× break-even. |

Reading: break-even is reached by the third external shop; the first 100 clear fixed costs by
30–40×; 300 shops is ~$55–65K a year net before the founder's time. The constraint is never
hosting, it is the ceiling — at 20% penetration of the whole pool the business is ~$100–200K a year
(GA17). The gate asks for break-even inside 100–300 payers at real hosting prices; that is met with
a wide margin. It does not ask for a venture outcome, and this is not one.

---

## 7. Conditions attached to the PASS (product decisions, carried into the result)

| # | Condition | Why it is a condition, not an option | Gate criterion it protects |
|---|---|---|---|
| C1 | **Pricing is metered: $1.00 per job created, capped at $29 per shop per month, $0 in a month with no jobs; the shop may pass the dollar to the customer as a service-fee line on the payment link; optional $290/yr prepay.** Charge from day one; no "free season for a testimonial" (P§7f). The only unpaid installation is the founder's own shop. | Nobody in the pool pays for job tracking today; the pool is part-time and seasonal; the hobby's adopted B2B software is usage-priced. A flat $29 alone would fail at the first off-season renewal. | 2, 6 |
| C2 | **Custom rod orders are in v1**: an "item" is a reel *or* a rod build, with 50% deposit, promised date, build status page and balance-on-completion. | Reel techs alone reach 42–103 paying shops on the channel math; the ICRBE and the rod-building community are the largest countable channels. | 3 |
| C3 | **Email-only notifications in the MVP.** SMS comes later as an opt-in add-on billed to the shop at pass-through plus margin, after 10DLC fees are verified. | 30,000 texts a month cost ~$384 against ~$5,700 revenue; registration fees unverified; email carries the status page link fully. | 4, 6 |
| C4 | **Money settles to the shop's own Stripe account** (Connect Standard, direct charges). The platform never holds deposits, never bears deposit fees, and bills its own metered fee separately. Verify the Standard-account wording before build. | Keeps the platform out of money-transmission and chargeback exposure and out of the $2/active-account model. | 4, 6 |
| C5 | **Launch inside Nov 2026–Feb 2027**; the founder's shop runs live on it first and his site's dead "Book NOW" becomes the intake page before any peer pitch; presence at ICRBE (Feb 20–21 2027). | Shops change tooling in the off-season; the founder's online credibility is a broken template today (P1, P2); the 90-day revenue path depends on the window. | 3 |
| C6 | **Pilot gate: ≥5 external shops each invoiced ≥$1 under C1 within 90 days of launch.** If not met, criterion 2 is re-scored FAIL and the gate moves to (b). | Converts the lean WTP pass into a clean one, or ends it. | 2 |
| C7 | **Each shop gets a public, indexable intake page with its prices and turnaround and a "powered by" link** in v1 — the only built-in distribution loop, and the feature that absorbs candidate i (reel-service directory). | The first-100 math counts the loop only after month 6; without the pages there is no loop at all. | 3, 5 |

Deliberately *not* assumed: SEO search volume (none on disk), Facebook group sizes (unmeasured),
the founder's Instagram reach (P7), supplier partnerships beyond a mention (unasked), and any
angler-side consumer product (candidate d) — the latter can be added later as a customer-owned
record with a next-service reminder that routes back to the shop (gap-analysis §5), but it is not
part of this pass.

---

## 8. Result and next candidate

**Result for (a): PASS (6/6), conditional on C1–C7.** The gate proceeds to product definition for
(a) under those conditions. Re-score trigger: C6 at day 90 after launch.

**Candidate (b), private web logbook — runner-up, not gated in full because (a) passed.** Its
targeted evidence round (`research/evidence-private-logbook.md`, 566 lines, 42 new pain rows
L-P1–L-P42, 80+ sources) reached these verdicts on its own, recorded here so the red team and the
report can see why it lost and what would revive it:

| Criterion | (b) verdict from its evidence file | Key evidence |
|---|---|---|
| 1 Functionality | PASS — 46 + 40 named handles, 8 platforms, 20 years of the same pains (lapse, transcription, no automatic conditions, lock-in, spot privacy) | I-E rows; L-P1–L-P42 |
| 2 Willingness to pay | PASS only at $10–20/yr or $25–40 one-time; unproven at $29/yr (that price belongs to map/forecast bundles) | Amazon paper log 976 ratings at $8.99 (L29); Anglers' Log 100K+ downloads at $11.99/yr (L6); LogIT/FishLogger $29.99 lifetime |
| 3 Organic path | LIKELY FAIL at 90 days — reach is huge (r/Fishing 3.1M) but intent is thin: ≈2,400 US searches/month for the log family, ≈130 with "app" intent; 23–65 payers in 90 days on stated assumptions | L38, L39, L48–L50 |
| 4 Resource | PASS — NOAA/NWS key-less, public domain | D4–D7 |
| 5 Defensibility | WEAK — Fishing Points already ships a private log with automatic weather/solunar/tide, GPX import, web app and sync to 10M+ installs; only CSV export and charts are missing; 101 log apps launched in 2026 | L58–L61, L87 |
| 6 Economics | PASS on cost, FRAGILE on retention — 33% of incentivised diarists still logging at 12 months; 3–7% day-30 retention for apps | L71, L74 |

Why (b) lost to (a): lower price point ($10–20/yr vs ~$19/month active ARPU), a weaker 90-day
path, a 10M-install incumbent one release away from parity, and a retention problem that no feature
removes. What would revive it: C6 failing for (a), plus a distribution partner (a forum or creator
post) and a design that removes entry effort (automatic conditions from a single tap). It also
remains the natural consumer companion to (a): the per-item service history the shop tool creates
is the seed of an angler-owned gear record (gap-analysis §5, candidate d).

**Candidate (e), fly-tying materials inventory:** not gated; third on points (61) only because
competition was never researched; one platform (FAOL), threads 2006–2013 — fails criterion 1's
three-platform rule on current evidence (gap-analysis §3).

**The single weakest point, for the red team.** Criterion 2: no fishing shop anywhere in 54 pain
rows, seven price lists and eight shop websites is shown paying for job tracking; the willingness-
to-pay case is built from adjacent trades (Tower in Australia, RepairDesk in phone repair, Jobber
in home services), from fees shops already pay per job, and from the founder's own intent. The
metered price can be read as an admission that the pain is not worth $29 a month. The answer is
C6, and nothing else: five shops paying by day 90, or stop.

---

## 9. Sources (new rows only; everything else by existing id)

| ID | Claim / number | Value | Publisher | URL | Published | Accessed | Used in |
|----|----------------|-------|-----------|-----|-----------|----------|---------|
| GA1 | Resend pricing: Free $0, 3,000 emails/mo, 100/day, 3 domains, no overage; Pro $20 for 50,000/mo and $35 for 100,000/mo, no daily limit, 10 domains, overage $0.90 per 1,000; Scale from $90 | as listed | Resend (company pricing page) | https://resend.com/pricing | 2026 (live page) | 2026-10-20 | §4, §6 |
| GA2 | Postmark pricing: Free 100 emails/mo, no overage; Basic $15 (10,000, $1.80/1k over); Pro $16.50 ($1.30/1k); Platform $18 ($1.20/1k); 50k/125k prices not published (sales) | as listed | Postmark (company pricing page) | https://postmarkapp.com/pricing | 2026 (live page) | 2026-10-20 | §4 |
| GA3 | Twilio US SMS: outbound and inbound $0.0083 per segment (long code, toll-free, short code); long code $1.15/mo ($0.50 bring-your-own); carrier fees per outbound long-code message AT&T $0.0035, T-Mobile $0.0045, Verizon $0.005, US Cellular $0.005, others $0.0042; A2P 10DLC "subject to registration onboarding fees", amounts not on the page; help article (1260803965530) returned title only and the docs page gives no amounts — **VERIFY** | as listed | Twilio (company pricing page; "current as of October 2026") | https://www.twilio.com/en-us/sms/pricing/us ; https://www.twilio.com/docs/messaging/compliance/a2p-10dlc | 2026-10 | 2026-10-20 | §4, §6, C3 |
| GA4 | Stripe Connect pricing: under "You handle pricing for your users" $2 per monthly active account (active = payout sent) and 0.25% + 25¢ per payout; for direct charges "the connected account covers Stripe fees, refunds, and chargebacks"; cards "Starts at 2.9% + 30¢"; the page does not distinguish Standard from Express/Custom — **VERIFY** in Connect docs | as listed | Stripe (company pricing page) | https://stripe.com/connect/pricing | 2026 (live page) | 2026-10-20 | §4, C4 |
| GA5 | RepairDesk: "Trusted by More Than 3,000+ Repair Stores"; verticals named include cell phone, computer, jewelry, watch, drone, mail-in, bicycle, power tools, camera, small engine, heavy duty, shoe; no fishing | 3,000+ stores | RepairDesk (company home page) | https://www.repairdesk.co/ | 2026 (live page) | 2026-10-20 | §2, §5 |
| GA6 | Jobber: "100K+" under "Businesses that use Jobber"; "Join over 400,000 service pros who trust Jobber"; "over 50 industries", none fishing or repair | 100K+ businesses | Jobber (company home page) | https://www.getjobber.com/ | 2026 (live page) | 2026-10-20 | §2, §5 |
| GA7 | Active-month ARPU under C1 | **estimate:** 40% of shops at ~10 jobs/mo ($10) + 40% at ~24 jobs ($24) + 20% capped ($29) = $19.40 ≈ $19; season factor 10.5/12 = 0.875 → ≈$17 averaged. Volume inputs: part-timers V5, V20; 35-order and 60-reel queues V11, V3; 100/month V3; 10/day quota VS43; closures N-V8, P69–P71, S20 | estimate | — | — | 2026-10-20 | §6 |
| GA8 | Email volume | **estimate:** 5 emails per job (received, quote, approved, ready, picked up/shipped): 100 shops × 25 jobs = 12,500/mo; 300 shops × 25 = 37,500; 10,000 jobs = 50,000 → Resend Pro $20 (GA1) | estimate | — | — | 2026-10-20 | §4, §6 |
| GA9 | Supabase storage, egress and MAU at 10,000 jobs/mo | **estimate:** 2 photos × 300 KB × 10,000 = 6 GB/mo = 72 GB/yr (inside 100 GB year 1, ~$1/mo overage at $0.0213/GB from year 2, D1); egress 10,000 × 3 views × 0.5 MB = 15 GB + photo views ≈ 15–30 GB (inside 250 GB); MAU ≈ shops only since customers use tokenised links; ~10 edge invocations per job = 100k/mo | estimate | — | — | 2026-10-20 | §4 |
| GA10 | Netlify credits at ~300 shops / 10,000 customers | **estimate:** (300 × 30 shop sessions + 30,000 customer page loads) × 1 MB ≈ 39 GB × 20 credits/GB ≈ 780 credits → Personal $9 (1,000 credits, D2) | estimate | — | — | 2026-10-20 | §4, §6 |
| GA11 | Stripe cost per platform invoice | **estimate:** 2.9% × $19 + $0.30 + 0.7% × $19 = $0.98 (5.2%); at $29: $1.34; at $10: $0.66 (6.6%) (D3) | estimate | — | — | 2026-10-20 | §2, §6 |
| GA12 | Break-even in paying shops | **estimate:** fixed $46.25 ÷ ($19 − $0.98) = 2.6 → 3; all shops at $10: $46.25 ÷ $9.34 = 5; flat $29: $46.25 ÷ $27.66 = 1.7 → 2 | estimate | — | — | 2026-10-20 | §6 |
| GA13 | Steady-state shop count | **estimate:** plateau N = acquisitions/yr ÷ annual churn; A = 70–160 (VS85), churn 40–45% (30–40% first-renewal per brief + 5–10% retirements/closures, N-V4–N-V7) → 156–400; downside A = 42–103 at 45% → 93–229 | estimate | — | — | 2026-10-20 | §6 |
| GA14 | Domain registration | **estimate:** ~$15/yr ≈ $1.25/mo; registrar price not fetched | estimate | — | — | 2026-10-20 | §4, §6 |
| GA15 | First-100 sums by scope | **estimate:** reel techs only = rows 1 (20–40) + 2 (10–30) + 6 (0–5) + 7 (3–6) + half of 5 (5–10) + loop (10–20%) ≈ 42–103; with rod builders (all rows) = 70–160, midpoint ≈110 (VS85 re-split) | estimate | — | — | 2026-10-20 | §3, C2 |
| GA16 | 90-day revenue path | **estimate:** 10–25 paying shops (rows 1, 2, 7 inside 90 days, VS85) × $10–29 = $100–725/mo run-rate at day 90; ≈$300–1,000 cumulative | estimate | — | — | 2026-10-20 | §3 |
| GA17 | Revenue ceiling at full penetration | **estimate:** (2,000–4,500 US + 250–450 abroad) × $19 × 12 ≈ $0.5–1.1M/yr; at flat $29: $0.8–1.7M/yr; at 20% penetration ≈ $100–225K/yr (pool from evidence file §2; compare P126's $261K on the older 750-shop pool) | estimate | — | — | 2026-10-20 | §5, §6 |
| GA18 | SMS cost if included | **estimate:** 3 texts/job × ($0.0083 + ~$0.0045 carrier) ≈ $0.0128/job-text → 10,000 jobs $384/mo; 2,500 jobs $32; 7,500 jobs $288; plus $1.15/mo per number and unverified 10DLC fees (GA3) | estimate | — | — | 2026-10-20 | §4, §6, C3 |
| GA19 | Independence and recency of the criterion-1 table | **count:** 24 quotes, 24 distinct people, 12 platforms (three shop websites counted as one); 14 business-side on 5 platform types, 10 angler-side on 7; 13 of 24 dated 2020–2026, 1 undated (V45) | derivation from V and M rows | — | — | 2026-10-20 | §1 |
