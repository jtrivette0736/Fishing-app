# Bench Tag — final report for the founder

Report Agent, 2026-10-21. Repository `Fishing-app`. Every number below carries a source id in the
form (S-id / local id): the S-id is the row in [`docs/sources.md`](../docs/sources.md) (727 rows,
regenerated today so that the red team's `R` rows and the product definition's `PD` rows are
included), the local id is the row in the research file that produced it. Estimates are labelled
**estimate** and show their derivation. Quotes are verbatim; ellipses mark cuts. Two sections carry
`TODO` placeholders for work still in progress (the `/app` starter and the prototype).

## Executive summary

1. **Outcome: GO, conditional.** Candidate (a), job tracking for small fishing-gear service businesses, passed the six-criterion validation gate 6/6 with conditions C0–C7; the independent red team scored it 5/6 (criterion 2, willingness to pay, FAIL as written) and returned APPROVE WITH REQUIRED CHANGES, all 17 accepted (`docs/validation-gate.md` §8, `research/red-team.md` §5, decision D13).
2. **The gap:** reel techs, rod repairers and custom rod builders run intake, the queue, parts approval, status and money through phone calls, texts, dates written on boxes, printed forms in the box and hand-raised invoices; no fishing-specific job-tracking product exists in the US (S542 / VS60), and generic repair software costs $70–149 a month (S450 / P111, S451 / P112) against shops grossing $750–5,000 a month.
3. **The app in one sentence:** Bench Tag gives a one-person reel or rod shop a public "send us your reel / order a rod" page with a deposit, a job board with promised dates, online quote-and-approve for parts, a private customer status page with automatic emails, and a payment link that settles to the shop's own Stripe account.
4. **Top data point 1:** 24 verbatim accounts from 24 different people on 12 platforms describe the workaround or the loss, 13 of them dated 2020–2026 (S712 / GA19); e.g. "I had to start calling him every day" (S545 / V34) and "they told me my reels were ready when they weren't" (S547 / V39).
5. **Top data point 2:** the US pool is ≈2,000–4,500 businesses (800–1,400 reel-service listings, S564 / VS82; 1,500–4,000 custom rod builders, S565 / VS83) plus 250–450 in the UK, Canada and Australia (S566 / VS84); the fishing hobby behind them is 57.0M participants (S1 / M1) spending $99.4B a year (S28 / M28).
6. **Top data point 3:** nobody in the segment is shown paying for job tracking today; the nearest paying neighbours are bike shops at $52–60/month for job cards with automatic customer updates (S675 / R24, S676 / R25) and Australian fishing retailers at A$265+/month for POS with a repairs module (S524 / VS42).
7. **Pricing:** $1.00 per job created, capped at $29 per shop per month, $0 in an idle month, optional $290/yr prepay; the dollar is collected as a Stripe application fee when the job has a customer payment, otherwise it accrues on a ledger charged at ≥$5 or the cap (C1 as amended by red-team changes 6–7).
8. **Economics:** break-even at 3–5 paying shops (S705 / GA12); 100 shops ≈ $14K–20K a year gross depending on whose ARPU you believe (S692 / R41 vs S700 / GA7); the full-penetration ceiling is $0.3–1.1M a year, a lifestyle or wedge business (S710 / GA17).
9. **First-100 path, no ads:** founder's own shop live first → ten Hampton Roads visits → direct messages to a named list of shops → one post on alantani.com's live Service Centers board → rodbuilding.org and the ICRBE expo (2,000–2,500 builders, Feb 20–21 2027, S669 / R18) → supplier mentions → each shop's indexable public page; 70–160 paying in 12 months on stated assumptions (S708 / GA15), 10–25 by day 90 (S709 / GA16).
10. **Step zero is a $0 test:** within 21 days the founder contacts ≥20 named shops and gets ≥5 written commitments (next 10 jobs at $1 each, card on file, Stripe connected); fewer than 3 stops the project before build money is spent (C0).
11. **Outstanding founder actions: 15** (3 this week, 7 before deploy, 5 before launch), none blocking the deliverables; detail in §10.
12. **Deliverables:** this report (`deliverables/report.md`, `deliverables/report.html`), `docs/product-definition.md`, `docs/validation-gate.md`, `research/red-team.md`, `docs/sources.md`; the `/app` starter and `deliverables/prototype.html` are in progress and their sections are marked `TODO` in §5.

---

## 1. What the app is

**Name:** Bench Tag. **Tagline:** *Every reel on the bench, every customer in the loop.*
(`docs/product-definition.md` §1; three names were checked, `benchtag.com` is registered and parked, S725 / PD13.)

**Pitch.** Bench Tag is job tracking for the one-person reel and rod shop. A customer sends in a reel
or orders a rod from the shop's own public page and pays the deposit; the shop sees every job on one
board with a promised date; parts are quoted and approved online instead of by phone; the customer
watches a private status page and gets an email at each step; the shop sends a payment link when the
work is done and the money lands in the shop's own Stripe account. It costs $1 per job, never more
than $29 a month, and $0 in a month the shop is closed (PD §1b).

**Target user (the buyer).** A reel technician, rod repairer or custom rod builder: one person, often
part-time and seasonal, doing 10–100 jobs a month (S485 / V3: "fixing reels at a clip of about 100 a
month"; S489 / V11: "backed up 35 orders"; S487 / V5: "keeping me busy on a part time basis"), taking
50% deposits and parts payments by hand (S491 / V13; S496 / V22), with intake by text, call, printed
form or a two-hour meeting (S484 / V2; S486 / V4; S551 / V47; S489 / V11). What they will not do:
learn a POS, pay $99 a month, hold a customer's money, or scale (PD §2a; S494 / V20; S543 / N-V17).
Customer zero is the founder's own workshop, Storm Proof Tackle in Virginia Beach, whose site today
has a dead "Book NOW" button and a "$0.00" repairs heading (S340 / P1; S672 / R21).

**The end user (the shop's customer).** An angler who left a $30–$500 reel with a shop and wants to
know when it comes back, who found the shop through a forum or Facebook (S552 / V51; S140 / M20) and
will switch shops over silence (S547 / V40; S548 / V44). The product has to deliver the positive
version of the same need: "my reels are always done before the estimated date given at drop off"
(S547 / V41).

**Not the target in v1** (PD §2c): multi-tech shops with counters and staff (served by RepairDesk and
Tower at $99–A$298, S698 / GA5, S524 / VS42); anyone whose problem is point-of-sale or parts stock;
directories and marketplaces; OEM service centres; anglers as paying users.

---

## 2. The problem it solves

### 2a. What they do today

Intake arrives by phone, text, Facebook message, a printed form shipped in the box, a web form that is
re-typed into a text, or a two-hour meeting; the queue is dates written on the outside of the box or a
list in the tech's head; status is a phone call from the customer, or from the tech when the work is
done; money is a 50% deposit collected by hand (builders), parts prepaid through a hand-raised
invoice, cheques that must clear, or cash on pickup; uncollected work is handled by a rule printed on a
paper receipt (`research/evidence-repair-shop-tool.md` §1 summary). Three of the seven shops with
public price lists close for 4–8 weeks in season (S408 / P69; S409 / P70; S410 / P71), and the one
mainstream tool a rod builder tried, Square, cannot express a two-to-three-week lead time (S483 / V1).

### 2b. Verbatim evidence (24 people, 12 platforms)

B = business side (the buyer), A = angler side (the buyer's customer). Independence and recency count:
24 quotes, 24 distinct people, 12 platforms, 13 of 24 dated 2020–2026 (S712 / GA19).

| # | Side | Verbatim | Who | Where | Date | Source |
|---|---|---|---|---|---|---|
| 1 | B | "each build takes anywhere from a few days to two or three weeks depending on complexity and parts availability" … "from what I can see I can only change the item prep time and that's only up to one day of prep." | Travis1836, custom rod builder | Square Seller Community | 2023-02-26 | [S483 / V1](https://community.squareup.com/t5/Questions-How-To/How-would-I-show-my-customers-order-wait-time-or-how-long-an/td-p/639869) |
| 2 | B | "The first thing I'm going to do when I receive a reel for service is review the form the sender submits online" … "send a text or email confirming receipt and condition" | Doug Lemons, Doug's Reel Repair (Hudson, OH) | Pond Boss magazine | 2023-03 | [S484 / V2](https://www.pdbmagazine.com/2023/03/preseason-reel-repair) |
| 3 | B | "fixing reels at a clip of about 100 a month." … "i've got about 60 reels in line right now." … "write the "shipped on ...." date and the "please return by ...." date on the OUTSIDE of the box." | Alan Tani | alantani.com | 2009–2011 | [S485 / V3](https://alantani.com/index.php/topic,277.0.html) |
| 4 | B | "Text or email me for a repair/service quote." … "parts are an extra charge if needed" … "Text or email is best. (Greasy Hands, cannot always pick up the phone.)" | Scott Rodriguez, Maybe We Can Fix It (Orange, CA) | alantani.com | 2020-10-24 | [S486 / V4](https://alantani.com/index.php/topic,32169.0.html) |
| 5 | B | "Last night a guy picked up a repair I did and brought two 100 dollar bills for a $25.00 repair." … "How do you guys handle repair jobs with clients you don't know? Pay first?" | Harry Bell | rodbuilding.org | 2014-09-27 | [S488 / V6](https://www.rodbuilding.org/read.php?2,429833) |
| 6 | B | "I call my customers and let them know the repair is complete and the charge is X amount" … "If it's a person I have not dealt with and they want write a check I tell them no rod until check clears." | Dave Loren | rodbuilding.org | 2014-09-27 | S488 / V7 |
| 7 | B | "their receipt for it states, goods left over 120 days without payment will be sold for charges." … "Bottom line, no payment, no rod." | Ron Weber | rodbuilding.org | 2014-09-27 | S488 / V8 |
| 8 | B | "With repairs, I'll probably just do cash in advance for everyone except repeat customers" | John E Powell | rodbuilding.org | 2014-09-29 | S488 / V10 |
| 9 | B | "Right now I am backed up 35 orders." … "I do not take a deposit as I do not want to hold onto someone's money." … "a 2 hour customer meeting takes place before ordering a rod" | Capt Neil Faulkner | rodbuilding.org | 2013-10-01 | [S489 / V11](https://www.rodbuilding.org/read.php?2,414727) |
| 10 | B | "Got a few people who dropped rods off to be wrappd a while ago, haven't been given a deposit or even heard from them" | Billy Vivona | rodbuilding.org | 2010-09-13 | [S490 / V12](https://www.rodbuilding.org/read.php?2,342991) |
| 11 | B | "Yes. I require a minimum 50% non-refundable deposit to accept an order for production." … "Any balance due must be collected before shipment or at the time delivery." | Jim Gamble | rodbuilding.org | 2010-12-16 | [S491 / V13](https://www.rodbuilding.org/read.php?2,348911) |
| 12 | B | "No fishing reel repairs are completed without customer approval." … "If repair cost appear to be getting out of line you will be contacted with an estimate" … "Come see us and drop off your reels at the shows:" | Mat's Reel Repair (Eagle River, WI) | shop website (GoDaddy builder) | 2026 | [S495 / V21](https://matsreelrepair.com/) |
| 13 | B | "In the case of repairs requiring parts, we will provide you with a quote for the parts and labor before proceeding." … "After invoicing you for the parts—which must be paid prior to the commencement of repairs—we will begin the work." … "Upon completion, we will invoice you for the labor and return shipping costs." | Valley Reel Works (Rock Hill, SC) | shop website (Webador) | 2026 | [S496 / V22](https://www.valleyreelworks.com/) |
| 14 | B | "PLEASE CALL OR TEXT ANYTIME BEFORE ARRIVING AT MY RESIDENCE (706) 761-2779" … "will reopen on 9/21/2026" | Rod & Reel Repair Guy (Valley, AL) | shop website (GoDaddy builder) | 2026 | [S531 / V23](https://fixreels.com/) |
| 15 | A | "I used OE's guy (doesn't do reels anymore) once and he had my reel for three months." … "I had to start calling him every day, finally got it back but what a pain...." | Bodofish | Northwest Fishing Reports forum | 2012-06-18 | [S545 / V34](https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=160872) |
| 16 | A | "they took months and I had to call them to continually get an update." … "$35 was the charge since I did not need any parts replaced." | shoffer | Texas Kayak Fisherman forum | 2024-02-13 | [S547 / V38](https://texaskayakfisherman.com/forum/viewtopic.php?p=2339973) |
| 17 | A | "they blew there timeline and the kicker was that they told me my reels were ready when they weren't." | OldTownYakBoi | Texas Kayak Fisherman forum | 2025-01-13 | S547 / V39 |
| 18 | A | "FTU takes forever but the work they do is fine." … "my reels are always done before the estimated date given at drop off." | LocoSeamonkey | Texas Kayak Fisherman forum | 2025-02-21 | S547 / V41 |
| 19 | A | "I entrusted my reel to Otto's for repair, with the expectation of a prompt resolution within approximately two weeks." … "subsequent updates on the progress were scarce." … "Despite assurances of timely communication upon completion, I received no further updates." | Chris, 1-star review of Otto's Tackle World (Sydney) | Trustpilot | 2024-03-13 | [S548 / V44](https://ie.trustpilot.com/review/ottostackleworld.com.au) |
| 20 | A | "I sent a reel in under warranty 6 weeks ago for repair and have not heard anything back" (snippet) | reviewer (PENN) | Trustpilot | n.d. | [S549 / V45](https://es.trustpilot.com/review/pennfishing.com) |
| 21 | A | "Any recommendations on where I can take them for a quickish fix?" … "I didn't even know shops did this." … "East county has a 8 week backlog. Ugh" | Shawnster | sdfish.org | 2026-06-16/18 | [S174 / M1](https://www.sdfish.org/viewtopic.php?p=28999) |
| 22 | A | "They have a website with a repair form to print and put in box with reel." … "One just needed cleaning $29.99 and $15.00 FedEx." | HomerRudd | TigerDroppings | 2025-10-18 | [S551 / V47](https://www.tigerdroppings.com/rant/outdoor/fishin-reel-repair/120703280/) |
| 23 | A | "Rochester Reel Repair check him out on Facebook. Brian at 585-455-1792" | oneluvunknown | Lake Ontario United | 2020-04-28 | [S552 / V51](https://www.lakeontariounited.com/fishing-hunting/topic/85867-reel-repairs/) |
| 24 | A | "It might take a while @ Haddrell's, I was on a 5 week wait." | in_the_grass | charlestonfishing | 2012-05-20 | [S142 / M26](https://forum.charlestonfishing.com/t/reels/38461) |

Eight of the fourteen business-side quotes are rodbuilding.org threads from 2004–2014; the gate did
not take them on faith. The 2026 shop pages (rows 12–14) still describe call/text intake, approval by
phone and a two-invoice parts flow; the 2023 profile (row 2) still has a web form re-typed into texts;
the 2024–2026 angler complaints (rows 16–19, 21) are about the same silence. The workflow has not
changed (gate §1a). The only 2026 first-person software ask found anywhere in the trade, "Wondering
what you all are using and what you would recommend for software to keep track of inventory, costs,
sales, etc.", was answered with "I personally use Google Spreadsheet." (S667 / R16).

### 2c. Feature → pain (what each piece of the product removes)

| Core feature | Business-side quotes | Angler-side quotes | Pain it removes |
|---|---|---|---|
| Public intake page (item, problem, contact) | V2, V4, V23, V3, V20, V21, V11 | V47, V51, M1, M20, M22, M25 | Intake that lives in texts, calls, boxes and printed forms; no front door a customer can find |
| Stripe deposit at intake | V6, V12, V13, V15–V17, V25, V10, V22 | customers already pay 10–30% deposits to guides (S425 / P86) and $15–20 estimate fees to shops (S406 / P67, S407 / P68) | Non-payment and abandoned work; the deposit flow builders already run by hand |
| Job board with statuses and a promised date | V3, V11, V27, V1, V30 | V39, V41, M26, S5 | A queue kept in the tech's head or on cardboard; promised dates that are blanket statements |
| Tokenised status page + automatic emails | V7, V4, V2, V21 | V34, V38, V44, V45, V46 | Status enquiries by phone in both directions |
| Quote-and-approve step for parts | V4, V21, V22, V28, S13 (S228 / I125) | V54, V42 | Approval by phone; two hand-raised invoices per job |
| Service history per customer and per item | V10, V12, V8, V9, V2 | M48 (S232 / I129), M27 (S143 / I40) | Who owns what, what was done last time, what is still uncollected |
| Payment link at completion | V7, V8, V3, V22, P72 (S411) | V47 | Cheques, cash on pickup, payment by phone |

---

## 3. The validation gate, completed

Rules (`.claude/skills/validation-gate-checklist`): a candidate must pass all six criteria; a
well-evidenced FAIL beats a weak PASS; criterion 1 needs ≥10 independent verbatim examples on ≥3
platforms describing a workaround or a loss; every criterion is argued to FAIL before it is scored
(`docs/validation-gate.md`). Gate order was (a) → (b) private logbook → (e) fly-tying inventory.

### 3a. The six criteria (gate verdicts)

| # | Criterion | Verdict | Evidence summary |
|---|---|---|---|
| 1 | Functionality case | **PASS** | 24 people, 12 platforms, workaround-or-loss in every row (§2b); strongest case to fail is that no tech asks for software and the busiest one ran 100 reels a month on box dates (S485 / N-V10, S543 / N-V17). Business-side intensity caps at 2; the 3s (switched shop, took the reel elsewhere) are the buyer's customers. |
| 2 | Willingness to pay | **PASS (lean, conditional)** | No fishing shop is shown paying for job tracking; shops run $0–30 website builders (S530–S533 / VS48–VS51) and take cheques and PayPal (S485 / V3, S407 / P68). Adjacent categories pay with volume: Tower A$265+/mo, 3,500+ AU/NZ customers (S524 / VS42); RepairDesk $99, 3,000+ stores (S698 / GA5); Jobber $21–49, 100K+ businesses (S699 / GA6); one rod builder already pays Square (S483 / V1). Supported price ≤$29/mo, metered (C1). |
| 3 | Organic marketability | **PASS (conditional)** | Named, counted channels: ≈1,560 YP-listed US repair businesses (S502–S506 / VS20–VS24), alantani.com 17,263 members (S511 / VS29), rodbuilding.org and ICRBE's 2,000–2,500 builders (S512–S513 / VS30–VS31), Mud Hole's 73.4K-subscriber channel (S526 / VS44), Hampton Roads in person; 70–160 paying in ~12 months (S708 / GA15), 10–25 in 90 days (S709 / GA16). Passes only with rod builders in scope (C2). |
| 4 | Low resource requirement | **PASS** | No licensed data, no network effect, no moderation, no hardware. At 10,000 jobs a month: Supabase Pro $25 (S467 / D1), Netlify $9 (S468 / D2), Resend $20–35 (S694 / GA1), Stripe on the platform's own invoices only (S469 / D3; S697 / GA4). SMS excluded: ~$384/mo plus unverified 10DLC fees (S696 / GA3, S711 / GA18). |
| 5 | Defensible enough | **PASS (weak)** | It is a form, a board and a status page; Paperform sells the intake half for $0 (S558 / V31, S659 / R8). Nobody bigger will take it: the prize is ≤$0.5–1.7M/yr at 100% penetration (S710 / GA17), below any sales team's threshold; Fishbrain, Garmin, onX and Omnia monetise anglers, not benches. The moat: founder as a working peer with a live reference shop, per-item history, the shop's public URL on tags, the trade's vocabulary. |
| 6 | Economics | **PASS** | Fixed costs $46–55/mo; break-even 3 shops (5 if all part-timers) (S705 / GA12); 100 shops ≈ $1,750/mo net in an active month at the gate's ARPU (S700 / GA7); plateau 155–400 shops after 40–45% churn (S706 / GA13). The constraint is the ceiling, not hosting. |

**Result:** PASS 6/6, conditional. Criterion 2 is the lean one: if the pilot condition is not met it
is re-scored FAIL and the gate moves to (b).

### 3b. Conditions C0–C7 (as amended by the red team)

| # | Condition | Protects |
|---|---|---|
| C0 | **Pre-build commitment test:** within 21 days the founder contacts ≥20 named external shops and obtains ≥5 written commitments (next 10 jobs at $1/job, card on file at signup, Stripe connected at onboarding). <3 → stop and record FAIL on criterion 2; 3–4 → proceed only with the lifestyle ceiling accepted in the decision log. | 2 |
| C1 | **Metered pricing:** $1.00 per job created, capped at $29 per shop per month, $0 in a month with no jobs; the shop may pass the dollar to the customer as a service-fee line; optional $290/yr prepay; charge from day one, no free season. Amended mechanics: the $1 is a Stripe application fee when a customer payment exists; residual jobs accrue on a ledger charged at ≥$5 or the cap. | 2, 6 |
| C2 | **Custom rod orders in v1:** an item is a reel or a rod build, with 50% deposit, promised date, status page and balance on completion. | 3 |
| C3 | **Email-only notifications in the MVP;** SMS later as an opt-in add-on at pass-through plus margin once 10DLC fees are verified. | 4, 6 |
| C4 | **Money settles to the shop's own Stripe account** (Connect, Standard behaviour, direct charges); the platform never holds deposits. Verified against Stripe's docs by the red team (S652–S657 / R1–R6). | 4, 6 |
| C5′ | **Launch mid-November to early December 2026, hard stop mid-February 2027.** Corrected rationale: winter is working season for mail-in techs (S681 / R30, S682 / R31); July–October is the dead window (S680 / R29, S409 / P70, S531 / V23). Founder's shop runs live first; presence at ICRBE Feb 20–21 2027. | 3 |
| C6′ | **Pilot gate tightened:** ≥5 external shops each with ≥10 jobs across ≥2 calendar months and ≥1 customer payment through its connected account by day 90; fewer → criterion 2 FAIL, gate re-opened. | 2 |
| C7 | **Each shop gets a public, indexable intake page** with prices, turnaround, LocalBusiness structured data, the "closed until" state and a "powered by" link: the only built-in distribution loop. | 3, 5 |

### 3c. Gate versus red team, side by side

The red team wrote its verdicts before reading the gate document (`research/red-team.md` §1).

| Criterion | Gate | Red team (independent) | Agreement |
|---|---|---|---|
| 1 Functionality | PASS | PASS (weak): buyers describe the process, never call it a problem; 14 of 29 business voices are 2004–2015; passes the workaround-or-loss test, not the "they asked for a product" test | Yes |
| 2 Willingness to pay | PASS (lean, conditional on C6) | **FAIL as written (marginal), convertible:** "The $0-idle metered price is itself an admission that a budget line does not exist"; convertible only by a commitment test with external shops, not by more desk research | **No** — same facts, different disposition; resolved by moving the kill switch in front of the build (C0) |
| 3 Organic marketability | PASS (conditional on C2, C5) | PASS (weak, 12-month horizon): alantani channel over-counted (its business board has been dormant since 2023-09-24, S664 / R13; the Service Centers board has four topics with 2025–26 activity, S663 / R12); Facebook unmeasured; founder's own distribution unverified | Yes on verdict, no on two inputs |
| 4 Low resource | PASS | PASS; both of the gate's VERIFY items resolved (Supabase compute credit, S687 / R36; Connect fee wording, S652–S657 / R1–R6) | Yes |
| 5 Defensible | PASS (weak) | PASS (weak): "Defensible because nobody wants it" is the same fact as criterion 2's weakness | Yes |
| 6 Economics | PASS; break-even 3–5 shops; ARPU $19 active / $17 averaged | PASS with a pricing-mechanics caveat; ARPU ≈ $12 active / $11.7 averaged (S692 / R41), so every downstream revenue figure in the gate is ~40% high; Stripe Billing on a $3 invoice costs 14%, so small balances must carry forward | Yes on verdict; ARPU corrected |

**Red team disposition:** APPROVE WITH REQUIRED CHANGES (17), on the grounds that a veto would send
the team to a runner-up that fails two criteria structurally, while this one's weakness is testable
in three weeks for $0. All 17 changes were accepted and recorded in `docs/product-definition.md` §16
(decision D13).

---
## 4. Why existing tools fail

### 4a. Competitor matrix for this job

Searches for "reel repair software", "reel service software", "tackle shop repair tracking" and each
repair-SaaS name with "fishing reel" returned only a GoCanvas form template and Tower Systems; no US
fishing-specific product exists (S542 / VS60).

| Product | Price | Who it is built for | What it covers of this job | What is missing for a one-person reel/rod shop | Source |
|---|---|---|---|---|---|
| RepairDesk | $99/mo ($79 annual), Growth $149 | phone, computer, jewellery, "mail-in" repair stores; "3,000+ Repair Stores", no fishing vertical | ticket, quote, status, pickup | 3–5× the budget of a shop grossing $750–5,000/mo; its own blog concedes a spreadsheet "can feel perfectly fine when … the same one or two people touch every repair" | S450 / P111, S698 / GA5, S543 / VS61 |
| RepairShopr | $69.99 / $139.99 / $149.99 | general repair shops, multi-tech | same workflow | priced for counters with staff; one reviewer: "a bit steep if you have many users" | S451 / P112, red team §3a |
| Digital Wrench, RepairTRAX, Orderry, Shop Pro | $39.95; $30/user; $39; $39.99 | generic single-user repair | same workflow | no deposit at intake, no fishing vocabulary, no customer-facing status page with promised date | S452 / P113, S677 / R26 |
| Jobber | Core $49 monthly, $21–24 annual (1 user); "100K+" businesses | home-service trades | quote → approve → job → invoice | built for site visits and scheduling, not for an item left on a bench for weeks; no mail-in intake page | S535 / VS53, S699 / GA6 |
| Square (Appointments / Invoices) | Free; Plus $49/location; Invoices Free 3.3% + 30¢ | small service businesses | deposit on an estimate, reminders, card on file | item "prep time" caps at one day, so a rod builder cannot express a 2–3-week build (V1); no queue, no status page, no per-item history | S441 / P102, S661 / R10, S483 / V1 |
| Shopify | Basic $39 ($29 annual) | retail e-commerce | one reel shop takes service orders through product checkout pages | a product catalogue, not a job; no promised date, status or approval step | S442 / P103, S409 / P70 |
| Paperform | Free (30 submissions/mo, Stripe included, badge cannot be removed); Pro $49 annual | horizontal forms; has a "Custom Fishing Rod Order Form" template whose copy is this product's pitch ("email threads and text messages become a tangled mess") | public intake page with deposit, for ≤30 jobs a month | job board, promised date, status page, quote-and-approve, history, metering; at 31+ jobs it is $49/mo | S537 / VS55, S558 / V31, S659 / R8 |
| Jotform | Starter free: 100 submissions, **10 payment submissions** a month; Bronze $39 | horizontal forms | intake with deposit for ≤10 deposits a month | the payment cap bites a 10-job shop immediately | S660 / R9 |
| GoCanvas | $29–49 per user, 3-user minimum → $87+/mo | mobile forms; has a "Fishing Rod and Reel Repair Request Form" template | the form only | no job board, no status page, priced above the whole shop's software budget | S536 / VS54, S559 / V32 |
| Tower Systems (AU/NZ) | A$265–298/mo inc GST annual; fishing shops priced at "$165/month" in 2023; "3,500+ customers" all verticals | Australian and New Zealand fishing and outdoor retailers; "Manage rod and lure repairs" is a named buying reason | repairs and job management with SMS inside a POS | POS-first, not sold in the US, priced for a store with a till; no sign of US intent | S524 / VS42, S538 / VS56, S539 / VS57 |
| Hubtiger (bike shops, nearest analogue) | Lite $52/mo (1 technician, 100 SMS credits), Professional $99, Premium $125; "average cost is $60 a month" | bicycle workshops | job cards "with colour coded statuses", "Keep customers informed automatically without manual follow-up" | not fishing; priced above the segment; proves one-tech shops in an adjacent trade do pay $30–60/mo for exactly this shape | S675 / R24, S676 / R25 |

**Why the fishing apps do not touch it.** Fishbrain (10M+ installs, $79.99/yr), Fishing Points, onX
Fish, Navionics and Omnia monetise anglers through subscriptions, ads, charts and retail (S236 / C1,
S255 / C20, S309 / C74; `research/competitors.md` §7); a tech's bench has no ad inventory, no map and no
catch data. The only maintenance-adjacent consumer app found is ReelKeep, a solo developer's
iPhone-only app from June 2026 with zero ratings (S314 / C79). The competitor file's own white-space
reading: gear maintenance and inventory "have no network effect and no ad inventory, so VC-funded
social apps skip them" (competitors §3).

### 4b. The gaps, in one table

| Gap | Nearest substitute | What the substitute leaves undone |
|---|---|---|
| A front door a customer can find ("[city] reel repair") | a Facebook page and a phone number (S552 / V51), a GoDaddy or Webador site (S530–S533 / VS48–VS51) | indexable page with prices, turnaround and a request form that creates a job |
| A deposit before parts are ordered | 50% collected by hand (S491 / V13), Paperform Free + Stripe (S659 / R8) | the deposit tied to a job, a promised date and a balance |
| A queue with promised dates | dates on boxes (S485 / V3), a mental list ("backed up 35 orders", S489 / V11) | overdue view, promised-date change notices |
| "Where is my reel?" answered without a call | the phone, both directions (S545 / V34, S488 / V7) | tokenised status page, emails at each step, short code and QR on the receipt |
| Parts approval in writing | a phone call or two hand-raised invoices (S496 / V22) | quote with lines, approve/decline on the status page, prepay-on-approval |
| What was done to this reel last time | memory (S488 / V10), nothing (S490 / V12) | per-item, per-customer history, searchable |
| Paid before it leaves | cheques that must clear, cash on pickup (S488 / V7, S488 / V8) | payment link on the shop's own Stripe account; "Mark paid cash" for the counter |

### 4c. The graveyard pattern

Every dead or neutered fishing product since 2018 was a social or data-sharing layer or a public-sector
native app replaced by web: Fishidy (850K users, sold to FLIR, now an empty shell, S328 / C93),
Fishhound (domain dead, S330 / C95), FishHunter's social layer removed in 2023 (S317 / C82), NOAA's iOS
reporting app folded into a web app in 2025 (S331 / C96), SmartTacklebox abandoned in 2016 (S312 / C77),
iCatch retired "due to lack of funding support" (S332 / C97). None was a paid private utility
(competitors §8). Bench Tag is a paid private utility with no social layer, which is the side of the
pattern that survives; its risk is not the graveyard's but failure mode 1 in §9 ("free and fine").

---

## 5. What it needs

### 5a. Feature list: 13 MVP features plus the red-team deltas

From `docs/product-definition.md` §4a, with the §16 amendments folded in.

| # | Feature | What it does | Pain rows | Condition |
|---|---|---|---|---|
| F1 | Shop account and onboarding wizard | Sign up by email (magic link + 6-digit code); profile, services menu with price or "quoted", deposit and turnaround per service, policy text, **card on file** (red-team change 9, before Stripe Connect) | V21–V23, P67–P72 | C1, C7 |
| F2 | Stripe Connect onboarding | Stripe-hosted onboarding for the shop's own account; `charges_enabled` gates only deposits and payment links; **jobs never wait on Stripe** (change 3) | V6, V7, V22 | C4 |
| F3 | Public shop page | `/s/:slug`, server-rendered, indexable, LocalBusiness JSON-LD with opening hours and the **"closed until <date>" state** (changes 4, 12), services, turnaround, mail-in instructions, "Powered by Bench Tag" | M20, M22, V47, V52 | C7 |
| F4 | Public request form | Reel or rod build; Turnstile; rate-limited; creates customer + item + job; redirects to Stripe Checkout on the shop's account when the service carries a deposit; confirmation email with the status link | V1, V2, V13, V25, V31 | C2, C4 |
| F5 | Counter intake | A drop-off logged in under 60 seconds on the phone: customer, item, service, problem, promised date defaulted from turnaround, deposit, camera photo | V3, V36, V47 | C1 |
| F6 | Job board | Every open job by status with promised date and overdue badge; status change in two taps; every change logged | V3, V11, V39, V41 | — |
| F7 | Customer status page and automatic emails | `/t/:token` (128-bit token, hashed at rest) shows item, status, promised date, history, quote, balance and Pay button; emails at each step; **a short code (e.g. `SPT-4F7K`) and QR on every receipt so the page works without email** (change 2) | V34, V38, V44, V45, V7, V4 | C3 |
| F8 | Quote and approve | Quote lines (labour, part, shipping, fee, discount), expiry; the customer approves or declines on the status page; shop may record a phone approval; optional collect-on-approval for prepaid parts | V4, V21, V22, V28, V54 | — |
| F9 | Payment link at completion | Balance computed in the database; Checkout on the shop's Stripe account; optional "$1.00 online service fee" line when the shop passes the fee on; "Mark paid (cash/check)"; closing with a balance needs an override | V7, V8, V3, V22, V47 | C1, C4 |
| F10 | Pickup, shipping and uncollected items | Close as picked up / shipped (tracking emailed) / returned unrepaired / abandoned; reminders at ready+7 and +30 days; final notice at the shop's configured day (default 90) | V8, V9, V12, S13 | — |
| F11 | Customers, items and history | Customer page, item service record, global search by name, phone, email, serial, job number | V10, V12, M48, M27 | — |
| F12 | Metered billing | Usage counted when a job reaches `received`; **$1 collected as a Stripe application fee on any customer payment through the shop's account; otherwise accrued on the shop ledger and charged to the card on file at ≥$5 or the $29 cap, smaller balances roll forward** (changes 6–7); **application-fee refund rule:** full deposit refund within 7 days refunds the $1 (change 8); $290/yr prepay credit; `/app/billing` shows the month's count | P67, P68, N-V8 | C1, C6 |
| F13 | Your data is yours | CSV export of customers, items, jobs, quotes, payments; shop deletion (30-day soft delete, then purge); **`delete_customer_pii` RPC** (change 5) | gate §5 | — |

Written out of scope for v1 (change 11): inventory, cost tracking, POS, SMS, parts catalogue, customer
accounts, multi-user roles beyond owner plus one helper, AI. One job object: a rod build is a job with
a deposit percentage and a longer promised date (change 10). v1.1 candidates: multi-item tickets,
staff logins, in-app refunds, printable QR hang tags, quote templates, bulk status updates, SMS as an
opt-in add-on (PD §4b).

### 5b. Supabase schema outline

Conventions (PD §6): uuid primary keys, `created_at`/`updated_at` with a shared trigger, money as
integer cents, `shop_id` on every tenant table and indexed, soft delete where listed, numbered
migrations under `app/supabase/migrations`, generated `Database` types.

| Table | Purpose | Notes |
|---|---|---|
| `shops` | the tenant: slug, name, contact, timezone, policies, `uncollected_days`, `pass_fee_to_customer`, Stripe account and billing status, `closed_until` / `closed_message` | `billing_exempt` (founder only) settable by service role only |
| `shop_members` | who may sign in for a shop (`owner`, `staff` reserved) | inserted only by `create_shop()` |
| `shop_pages` | the public page's copy and switches | one row per shop |
| `services` | the menu: kind (reel/rod), price or "quoted", deposit % or fixed, turnaround days, estimate-fee flag | |
| `customers` | the shop's customers: name, email, phone, ship address, `user_id` reserved for a future consumer link | unique email per shop; trigram search |
| `items` | the reel or rod: brand, model, serial, description | per-item history hangs here |
| `jobs` | the job: number, `short_code`, kind, source, status, problem, promised date, delivery, tracking, `token_hash`, deposit and service price, `service_fee_charged_at`, `group_id` reserved | unique `(shop_id, job_number)`; indexes on status, promised date |
| `job_status_transitions` | the allowed moves per kind | seeded from PD §5d; enforced by `transition_job()` |
| `job_status_history` | append-only log of every status change with actor and note | no update/delete policies |
| `quotes`, `quote_lines` | versioned quotes with lines; totals by trigger | discount lines are the only signed money |
| `payments` | deposits, quote payments, balances, offline payments; Stripe ids; refunds | view `job_balances` sums per job |
| `job_photos` | intake/progress/finished photos; `customer_visible` iff in the shared bucket | |
| `notifications` | the email outbox: template, recipient, payload, attempts, provider id, `dedupe_key` | nothing sends email except the worker that drains it |
| `usage_events` | one row per job for life, with `collection` (application fee / ledger) and the payment or fee id | counting twice is impossible |
| `billing_periods` | per shop per month: jobs counted, gross, capped, credit applied, `carried_forward_cents`, due, Stripe invoice | created lazily; an idle month has no row |
| `billing_credits` | prepay, promo and adjustment credits with expiry | $290 prepay = 29,000¢ for 12 months |
| `stripe_events` | webhook idempotency for both endpoints | |
| `rate_limits` | per-IP and per-email counters for the public forms and token misses | purged after 2 days |

**Row-level security in plain English** (PD §7c). Every table has RLS on. A signed-in person can read
and write only rows whose `shop_id` belongs to a shop they are a member of; status, token hash, job
number and billing columns change only through SQL functions, never by a direct update; history and
usage rows cannot be edited or deleted by anyone but the server. Anonymous visitors have no table
access at all: they reach the public page through one function (`public_shop(slug)`), the status page
through another (`job_by_token`), and may decide a quote through a third (`decide_quote_by_token`).
Edge functions and cron use the service role. The test file must prove, for two shops A and B, that A
cannot read or write any B row in any table, that a wrong token returns nothing, and that a quote
that is not `sent` cannot be decided; the code-review skill blocks a merge without it.

**The token approach** (PD §7b). Each job's status link carries 16 random bytes (128 bits) encoded as
22 characters; only its SHA-256 is stored, so a leaked table or backup exposes no live links.
"Resend link" rotates the token. The page shows the shop, the item, the status, the promised date,
customer-visible history and photos, the current quote and the balance; never internal notes, other
jobs, customer PII beyond first name, or Stripe ids. Lookups with no match are counted in
`rate_limits` and reported in the daily digest. The red team added the short code + QR so the page is
reachable from the printed receipt when an email goes to spam (change 2).

**Storage buckets** (PD §7d): `job-photos` (private, per-shop folders), `job-photos-shared` (public by
exact path, for photos the shop marks customer-visible), `shop-assets` (logo, hero). Photos are
resized on the device to ≤300 KB before upload (S702 / GA9).

### 5c. Netlify setup

- **Build:** repo-root `netlify.toml` sets `base = "app"`, `npm run build`, publish `dist`, Node 22;
  `app/netlify.toml` repeats it (both files exist in the repo today).
- **SPA:** `/*` → `/index.html` (200) so react-router owns the routes; PD §10a narrows this to
  `/app/*`, `/t/*`, `/auth/*` once the public-page function exists.
- **Public page function:** `public-page` is the one Netlify Function, rendering `/s/:slug`,
  `/s/:slug/request` and `/s/:slug/find` as plain HTML from `public_shop(slug)` with the anon key:
  services, turnaround, instructions, LocalBusiness JSON-LD, canonical, "Powered by Bench Tag", the
  request form with the Turnstile script; `Cache-Control: public, s-maxage=300,
  stale-while-revalidate=86400`; 404 for unpublished shops. It lives on Netlify because it is pure
  rendering with no writes and the CDN must cache it; everything that touches secrets or writes rows
  is a Supabase Edge Function (PD §8).
- **Headers** (`app/netlify.toml` today, PD §10a): `X-Frame-Options: DENY`, `X-Content-Type-Options:
  nosniff`, `Referrer-Policy: strict-origin-when-cross-origin` (tokens must not leak via referrer),
  `Permissions-Policy` restricting camera/microphone/geolocation, a CSP allowing only self, Supabase,
  `js.stripe.com`/`checkout.stripe.com`/`connect.stripe.com` and `challenges.cloudflare.com`;
  `X-Robots-Tag: noindex` on `/t/*` and `/app/*`; hashed assets cached for a year.
- **Secrets on Netlify:** only public-safe values (`SUPABASE_URL`, `SUPABASE_ANON_KEY`,
  `TURNSTILE_SITE_KEY`); the service-role key, Stripe secret key and Resend key never go in the
  Netlify build environment (`app/.env.example`).

### 5d. External services and what they cost

| Service | Role | Price | Limits that matter | Source |
|---|---|---|---|---|
| Supabase Pro | Postgres, Auth, Storage, Edge Functions, Cron | $25/mo (includes $10/mo compute credit covering one Micro instance; spend caps on by default) | 8 GB DB, 100 GB storage then $0.0213/GB, 250 GB egress, 100,000 MAU, 2M invocations | [S467 / D1](https://supabase.com/pricing), S687 / R36 |
| Netlify | SPA hosting + `public-page` function | Free (300 credits) → Personal $9 (1,000 credits) at ~40 GB/mo | 20 credits per GB bandwidth | [S468 / D2](https://www.netlify.com/pricing/), S703 / GA10 |
| Stripe Payments | shops' deposits and completion payments, on the shop's account | 2.9% + 30¢ per card charge, **paid by the shop** | — | [S469 / D3](https://stripe.com/pricing) |
| Stripe Connect | account creation, hosted onboarding, direct charges | $0 to the platform under "Stripe handles pricing"; "the connected account is responsible for the cost of Stripe fees, refunds, and chargebacks"; Stripe covers negative balances | the $2/active account and 0.25% + 25¢ payout fees apply only under "you handle pricing", which this design avoids | [S716 / PD4](https://stripe.com/connect/pricing), S652–S657 / R1–R6 |
| Stripe application fees | the $1 metered fee on customer payments | "There are no additional Stripe fees on the application fee itself" | fees are not refunded automatically (`refund_application_fee`) | [S713 / PD1](https://docs.stripe.com/connect/direct-charges), S653 / R2 |
| Stripe Invoicing | the monthly ledger invoice to each shop (platform account) | Starter 0.4% per paid invoice + card processing → $0.93 on $19, $1.50 on $29, $0.64 on $10 | Billing Meters not used (Stripe steers new usage billing to Metronome) | [S718 / PD6](https://stripe.com/invoicing/pricing), S717 / PD5 |
| Resend | every email, including Supabase Auth via custom SMTP | Free: 3,000/mo, 100/day; Pro $20: 50,000/mo; $35: 100,000; overage $0.90/1k; shared IPs by default | Free's 100/day is exceeded at ~17 jobs/day, so Pro within weeks of launch; idempotency keys kept 24 h | [S694 / GA1](https://resend.com/pricing), S688 / R37, S722 / PD10 |
| Cloudflare Turnstile | bot check on the public forms | $0 | 20 widgets, 10 hostnames per widget, unlimited challenges; works without proxying traffic through Cloudflare | [S723 / PD11](https://developers.cloudflare.com/turnstile/plans/) |
| Domain | product domain | ~$15/yr (**estimate**, registrar price not fetched) | `benchtag.com` is parked | S707 / GA14, S725 / PD13 |
| Twilio SMS (not in MVP) | text updates, later | $0.0083/segment + carrier fees; 10DLC registration fees not retrievable (VERIFY) | ~$384/mo at 10,000 jobs | [S696 / GA3](https://www.twilio.com/en-us/sms/pricing/us), S711 / GA18 |

No third-party fishing data, no licensed dataset, no network effect, no moderation, no hardware
(gate §4).

### 5e. Estimated build effort

The product definition assumes code-complete on **2026-11-30 after a five-week build** (PD §12); the
gap analysis judged 4–6 weeks (S480 / G7). The split by feature below is this report's **estimate**
(one developer, the `/app` scaffold already standing); it sums to the five weeks.

| Work | Weeks | Notes |
|---|---|---|
| Schema, RLS, SQL functions, SQL tests (PD §6–§7, §16 schema consequences) | 0.7 | the transition table, `create_job`, `transition_job`, token RPCs, billing SQL; the two-shop RLS test file |
| F1 onboarding wizard + F2 Stripe Connect | 0.5 | Stripe-hosted onboarding; card on file via Checkout `mode=setup` |
| F3 public page (Netlify function) + F4 request form + `public-intake` + Turnstile + rate limits | 0.6 | HTML template, JSON-LD, closed-until state |
| F5 counter intake + F6 job board | 0.5 | camera upload with device-side resize |
| F7 status page, short code/QR, email templates and the notifications outbox worker | 0.7 | ~18 templates (PD §5), Resend with idempotency keys, retries |
| F8 quotes and approval | 0.4 | versions, collect-on-approval |
| F9 payments: `create-checkout`, Connect webhook, balance view, offline payments | 0.5 | idempotent webhooks via `stripe_events` |
| F10 close/ship/uncollected + cron jobs (`flag_uncollected`, `expire_requests`, reminders) | 0.3 | |
| F11 customers, items, search | 0.3 | |
| F12 metered billing: usage events, application fees, ledger carry-forward, `bill-shops`, platform webhook, `/app/billing` | 0.6 | tested at the $4.99/$5.00 boundary and the cap |
| F13 export, deletion, `delete_customer_pii`; ops digest; scorecard views | 0.3 | |
| **Total** | **≈5.0** | range 4–6 weeks (G7); a slip past mid-February pushes the 90-day path onto Hampton Roads alone (PD §14 Q2) |

### 5f. Monthly third-party cost at scale

From PD §9c (**estimate**, S726 / PD14: 6 emails and 2 photos per job; one job ≈ one end customer;
platform invoices ≈ shops with ≥1 job that month, each costing Stripe 2.9% + 30¢ + 0.4%).

| Scale | Jobs/mo | Emails/mo | Supabase | Netlify | Resend | Turnstile | Domain | Stripe on platform invoices | **Total** |
|---|---|---|---|---|---|---|---|---|---|
| 100 end customers | 100 | 600 | $25 | $0 | $0 | $0 | $1.25 | ~$5 (≈5 invoices) | **≈ $31** |
| 1,000 end customers | 1,000 | 6,000 | $25 | $0 | $20 | $0 | $1.25 | ~$40 (≈40 invoices) | **≈ $86** |
| 10,000 end customers | 10,000 | 60,000 | $25 (+~$1 storage from year 2) | $9 | $35 | $0 | $1.25 | ~$370 (≈400 invoices) | **≈ $441** |
| 10 shops | ~250 | 1,500 | $25 | $0 | $0 | $0 | $1.25 | $9 | **≈ $35** |
| 100 shops | ~2,500 | 15,000 | $25 | $0 | $20 | $0 | $1.25 | $93 | **≈ $139** |
| 300 shops | ~7,500 | 45,000 | $25 | $9 | $20 ($35 for headroom) | $0 | $1.25 | $279 | **≈ $335–350** |

Two things lower these numbers after the red team: the $1 collected as an application fee carries no
Stripe fee at all (S653 / R2), so the "Stripe on platform invoices" column applies only to the ledger
share of shops; and the gate's independent arithmetic at 10,000 jobs a month was $55–70 of fixed stack
plus Stripe's percentage (S702 / GA9, S703 / GA10, S701 / GA8). Stripe's percentage is the only cost
that scales with revenue; the fixed stack stays under $75 a month at every scale in the table.

### 5g. What is already built in `/app`

<!-- TODO-5B: what is already built in /app (migrations, tests, vertical slice) and how to run it -->

*Section pending: phase 5b (schema, RLS, data layer, vertical slice) is in progress. At the time of
writing `/app` holds the product-independent scaffold: React 19 + Vite + TypeScript strict + Tailwind,
ESLint flat config, Prettier, Vitest, `supabase/migrations/0000_extensions_and_helpers.sql`, the plain-
Postgres test harness (`supabase/tests/run.sh`, stubs, helpers, `000_harness.sql`), `netlify.toml`,
`.env.example` and placeholder pages. Commands: `npm install`, `npm run check`, `npm run test:sql`
(`app/package.json`, `app/supabase/README.md`).*

### 5h. Prototype

<!-- TODO-PROTOTYPE: screenshots and flow list -->

*Section pending: `deliverables/prototype.html` is being produced by the prototype agent from
`docs/product-definition.md` §5 and §10 (flows: shop onboarding, public intake with deposit, counter
intake, job board, quote and approval on the status page, payment link, pickup/shipping, billing).*

---
## 6. Market data

Populations are stated each time because the three big sources count different people: RBFF/Outdoor
Foundation counts Americans 6+ who fished at least once; USFWS counts residents 16+; licence data
counts paid holders. Never add across them (`research/market-sizing.md` §0).

### 6a. Participation, spend, segments, churn, seasonality, demographics

| Measure | Value | Population / year | Source |
|---|---|---|---|
| Participants | **57.0M**, 18% of the population; first year-over-year drop since 2021 (57.9M in 2024, 50.1M in 2019) | 6+, 2025 | [S1 / M1](https://asafishing.org/wp-content/uploads/2026/07/2026-Special-Report-on-Fishing_WEB_FV.pdf), S2 / M2, S3 / M3 |
| Anglers | **39.9M**, 15% rate; 785M days, 463M trips | 16+, 2022 | [S27 / M27](https://www.fws.gov/sites/default/files/documents/Final_2022-National-Survey_101223-accessible-single-page.pdf) |
| Paid licence holders | 32.24M (2023); gross licence revenue $841M (2023 sales) and $871M (2024 sales) | licensed individuals | S39 / M39, S38 / M38 |
| Total spend | **$99.4B**; **$2,490 per angler**; trip-related $36.6B ($917); fishing equipment $8.7B (**$217 per angler**, $297 per spender); special equipment $27.7B ($695) | 16+, 2022 | S28 / M28 |
| Tackle lines | **rods & reels $2.3B**; lures $1.3B; lines $867M; hooks/sinkers $838M; electronics $782M; tackle boxes $475M; guides $2.2B; **online media subscriptions $166M (≈$4 per angler a year, S93 / E4)** | 16+, 2022 | [S35 / M35](https://asafishing.org/wp-content/uploads/2025/01/2024_ASA_Economic_Report_Digital_Spread.pdf) |
| Segments | freshwater ≈43M (14% rate); saltwater 15.5M (record; 56% in the South); fly 7.9M; 18% do more than one type | 6+, 2025 | S5 / M5, S6 / M6, S7 / M7, S20 / M20 |
| Segments (federal) | freshwater 35.1M; saltwater 12.7M; black bass ≈12–15M (**estimate** from the 2001 38% share) | 16+, 2022 | S27 / M27, S33 / M33, S92 / E3 |
| Growth | 45.7M (2015) → 50.1M (2019) → 54.7M (2020 spike) → 57.9M (2024) → 57.0M (2025); outings still rose to 918M | 6+ | S3 / M3, S13 / M13 |
| Churn | 18M joined or returned, **19M quit, churn rate 33%**, the highest on record; only 39M of 57M were continuing participants; USFWS three-year retention 50% | 6+, 2025 / 16+ | S4 / M4, S26 / M26, S32 / M32 |
| Avidity | 68% fish fewer than 12 times a year; **32% monthly or more** (41% in 2007); weekly <6% | 6+, 2025 | S13 / M13, S25 / M25 |
| Seasonality | Minnesota sells ~20% of annual licences before the early-May opener (217,100 of 1.1M in 2019; +45–48% in 2020); winter sales ~5–6%; West Virginia tournament hours peak in May (19% of the year); 36% of trips unplanned, 82% planned less than a week out | state data | S70 / M70, S71 / M71, S72 / M72, S57 / M57, S15 / M15 |
| Demographics | 37% female (21.1M); 67% male among 16+; 49% of adult anglers 45+ and 65+ the fastest-growing cohort; median household income ≈$55k; 70% urban; Hispanic participants doubled since 2015 to 6.9M | mixed | S9 / M9, S29 / M29, S11 / M11, S10 / M10 |
| Digital adoption | 85% own a smartphone, **25% use a fishing app**; 46% of non-users want to "leave technology behind"; apps used before (71%) far more than after (14%) a trip | active anglers, c. 2018 | [S59 / M59](https://www.southwickassociates.com/smartphone-app-use-and-todays-angler/), S187 / I84 |
| Adjacent businesses | 15,548 tackle shops (incl. online; no firm >5% share); 3,514 independent coastal bait-and-tackle stores (2013); ~5,700 charter enterprises; >2,000 B.A.S.S. Nation clubs | US | S47 / M47, S48 / M48, S46 / M46, S52 / M52 |
| Abroad | Canada 3.24M active adult anglers (2015); Australia ~4.2M a year; England 934,000 rod licences (2024/25) | | S77 / M77, S79 / M79, S75 / M75 |

What this means for Bench Tag: the hobby is large, older, modest-income, seasonal and leaky, and it
spends on going fishing rather than on software ($4 per angler a year on all online media, S93 / E4).
That is why the gate rejected every consumer candidate on distribution or willingness to pay and why
the chosen product sells to the business, not the angler: a shop's $25–$100 job (S406–S411 /
P67–P72) is the budget line, and the angler's $15–$44 service payment is already made without
complaint (S432 / P93, S433 / P94).

### 6b. The (a)-specific TAM / SAM / SOM, math shown

**Pool (the TAM in businesses).**

| Segment | Estimate | Derivation | Source |
|---|---|---|---|
| US businesses taking in reels for service or repair | **800–1,400** (core dedicated techs 500–900) | Yellow Pages "Fishing Tackle Parts & Repair": TX 36, FL 155, CA 60, NY 34, VA 7 (285 in four big states); those states hold 18.3% of 32.24M paid licence holders → ≈1,560 US listings; × 40–60% dedicated repair names; + 30–50% for Facebook-only techs not in directories | **estimate** [S564 / VS82](https://www.yellowpages.com/search?search_terms=Fishing+Tackle+Parts+%26+Repair&geo_location_terms=FL); S502–S506 / VS20–VS24; S39 / M39; S40 / M40 |
| US custom rod builders who sell to customers | **1,500–4,000** | ICRBE draws 2,000–2,500 builders a year (3,000 in 2011); 40–60% sell rods; attendees are one in two or three of all sellers | **estimate** S565 / VS83; S512–S514 / VS30–VS32 |
| US tackle shops with a service counter | 1,000–1,600 (overlaps the first row) | ≈1,560 repair-tagged listings ÷ 15,548 tackle shops ≈ 10% | evidence §2; S47 / M47 |
| **US total addressable** | **≈2,000–4,500** businesses | repair 800–1,400 + builders 1,500–4,000, less ~20% overlap | evidence §2 |
| UK, Canada, Australia | **250–450** | US pool scaled by angler ratios (Canada ≈10%, Australia ≈13%, UK ≈5–8%) | **estimate** S566 / VS84; S77 / M77; S79 / M79; S75 / M75 |
| Earlier, narrower estimates for comparison | 250–750 (monetization); 1,000–2,500 (market sizing) | one search surfacing 7 price-list shops; one service per 6–15 tackle shops | S462 / P123; S102 / E13 |

**Revenue per shop per year.** Two sourced estimates: the gate's active-month ARPU of $19 and
season-averaged $17 → $204/yr (S700 / GA7: 40% of shops at ~10 jobs, 40% at ~24, 20% at the cap;
10.5 billable months); the red team's segment-and-season model, $11.72/mo → $141/yr (S692 / R41:
30% rod builders at 4 builds, 30% part-timers at 8 jobs closed August, 25% techs at 18 closed
Aug–Sep, 15% busy counters at 40; monthly demand profile peaking at 1.4× in March–April and
troughing at 0.4× in August). This report's model (`scripts/revenue-model.py`) reproduces the red
team's figure at $133/yr. Low $141, high $204, midpoint $170.

```
TAM (businesses)  low  2,000 US + 250 abroad = 2,250     base 3,250 + 350 = 3,600     high 4,500 + 450 = 4,950
TAM ($/yr)        low  2,250 × $141 = $0.32M             base 3,600 × $170 = $0.61M   high 4,950 × $204 = $1.01M
   reference: at a flat $29/mo ($348/yr) the same pool is $0.78–1.72M (S710 / GA17)

SAM = shops with ≥10 jobs a month in season AND a web presence (site or Facebook page)
   volume filter   40% / 50% / 60%   (red team §3c: the realistic payer is the 15+-job shop; "perhaps 40–60% of the counted businesses")
   presence filter 80% / 90% / 100%  (estimate: 5 of 8 shops found run a site builder, S530–S533 / VS48–VS51; the rest are reachable on Facebook, S494 / V20, S552 / V51)
SAM (businesses)  low  2,250 × 0.40 × 0.8 =   720        base 3,600 × 0.50 × 0.9 = 1,620   high 4,950 × 0.60 × 1.0 = 2,970
SAM ($/yr)        low  720 × $141 = $0.10M               base 1,620 × $170 = $0.28M       high 2,970 × $204 = $0.61M

SOM (paying shops at year end; $/yr at the scenario's ARPU)
   bounds: channel math 70–160 acquired in 12 months (S708 / GA15); 10–25 by day 90 (S709 / GA16);
           churn 30–45%/yr (S706 / GA13); plateau = acquisitions ÷ churn = 155–400 shops (S706 / GA13), 93–229 if only reel techs convert
   year 1   low  ≈40 ($5.6K)      base ≈80 ($13.6K)      high ≈130 ($26.5K)     (model: 51 / 104 / 156 gross adds less churn)
   year 2   low  ≈60 ($8.5K)      base ≈130 ($22K)       high ≈220 ($45K)
   year 3   low  ≈95 ($13K)       base ≈170 ($29K)       high ≈300 ($61K)       (bounded by the 155–400 plateau; 300 = 6% of the high pool)
```

Reading: 100 paying shops is 2–5% of the US pool (S474 / G1), which is why the gate insisted on a
≥2,000-business pool (S475 / G2) and on rod builders in scope. At full penetration this is a
$0.3–1.1M-a-year business; at a realistic 20% it is $100–225K (S710 / GA17). The red team's row 6
reading, "lifestyle not venture", stands.

---

## 7. Monetization

### 7a. The recommended model (C1 as amended)

| Rule | Decision | Why |
|---|---|---|
| Unit | **$1.00 per job created** (a job = one reel or one rod build); counted the first time a job reaches `received`; public requests that never arrive and cancellations before receipt never count; declined quotes count; a 7-day void window for mistakes | billing a shop for a reel that never arrived would be the first complaint (PD §11); matches the trade's volume unit, "100 reels a month" (S485 / V3) |
| Cap | **$29 per shop per calendar month** in the shop's timezone | the ceiling the evidence supports: Shopify annual Basic $29 and Digital Wrench $39.95 are the lowest paid software one-person fishing and repair businesses are shown on (S442 / P103, S452 / P113); $29 is 0.6–4% of a $750–5,000 monthly service gross (evidence §4) |
| Idle | **$0 in a month with no jobs**; no invoice, no email | three of seven shops close 4–8 weeks (S408–S410 / P69–P71); flat annual plans would lapse at the first off-season renewal (monetization §9) |
| Prepay | optional **$290/yr** credit, expiring after 12 months; ten capped months for the price of ten | one invoice for shops that prefer it (PD §11) |
| Collection | **Application fee** of $1 on any customer payment through the shop's connected account (deposit or completion); "There are no additional Stripe fees on the application fee itself" (S653 / R2). Jobs with no Stripe payment accrue on the shop's ledger; the card on file is charged only when the balance is **≥$5** or the month hits the cap; smaller balances roll forward | a $1 Stripe invoice loses 34% to fees, $3 loses 14%, $5 10%, $10 6.6% (red team §3d); the ≥$5 rule keeps drag under 10% and keeps "$0 in an idle month" literally true |
| Pass-through | the shop may add an "Online service fee $1.00" line to the customer's Checkout (default off); the shop still owes the $1 either way | C1 "built in rather than a second plan"; wording and legality of a flat service fee to be checked (PD §14 Q5) |
| Refunds | a full deposit refund within 7 days of intake refunds the platform's $1 too; otherwise the fee is kept | one rule, no judgement calls (red-team change 8) |
| Card on file | required at onboarding, before Stripe Connect | the commitment signal and the mechanism for the ledger charge (change 9); "charge from day one", no free season (C1) |
| Failed card | past due → retries at days 3 and 7 → read-only at day 14 (no new jobs; existing jobs can still be moved, quoted, paid and closed) | the angler is not the debtor and must never be stranded (PD §11) |

Worked examples: a 10-job part-timer pays $10; a 30-job shop $29; Alan Tani at 100 a month $29; a
rod builder at 4 builds a month $4; a shop closed in September pays $0 and is still a customer in
November (gate §2c).

### 7b. Alternatives considered

| Model | Why rejected |
|---|---|
| Flat $29/mo | Charges a shop that is closed for August; the monetization file expects annual and monthly plans to lapse at the first off-season renewal (P§9 item 3); zero in-segment evidence of any flat software fee for job tracking; kept only as the cap |
| Flat $19/mo | Same renewal cliff at a lower ceiling; Stripe takes 5.2% of a $19 invoice (S704 / GA11); below the $30–60 the nearest paying neighbours (bike shops) accept (S675 / R24), so it buys nothing on conversion |
| Per seat | The buyer is one person; a second seat is v1.1; per-seat is the pricing of RepairDesk and GoCanvas ("3 user minimum", S536 / VS54), the products this pool does not buy |
| Customer-paid only (the angler pays a platform fee, the shop pays nothing) | The hobby's adopted B2B pattern (TourneyX $6.50/angler, Weighfish 6.5%, FareHarbor 6–8%: S396 / P57, S400 / P61, S438 / P99), but a third of jobs are paid in cash at the counter or never through Checkout, so revenue would depend on the shop's payment habits (PD §9a); kept as the optional pass-through line instead |
| Freemium | Paperform Free and Square Invoices Free already occupy "free" for intake and deposits (S659 / R8, S661 / R10); a free tier would train the pool that the status page is worth $0, and the gate's rule is "charge from day one" |
| One-time purchase | No recurring business; the switching cost accumulates with use, and the per-item history is the moat the gate credited; one-time pricing fits the consumer runner-up (b), not a B2B tool |
| Stripe Billing meters | Stripe now says "Unless you're maintaining an existing Meters integration, use Metronome" (S717 / PD5); meters would emit $0 lines in idle months and cannot express "capped after prepay credit"; the ledger plus Stripe Invoicing at 0.4% replaces it (S718 / PD6) |

### 7c. Revenue projections

**Estimate.** `scripts/revenue-model.py` (standard library; all inputs cited in the file). Launch
month 1 = December 2026 (C5′). Revenue per paying shop follows the red team's segment mix and
seasonal profile (S692 / R41), giving $11.64 in December, $15.69 in March–April, $2.88 in August and
$133 a year. Churn is applied monthly from an annual rate. Third-party cost follows PD §9c (S726 /
PD14) with the $1 collected as an application fee on half the shops (no Stripe fee) and a ledger
invoice on the other half.

| Assumption | Conservative | Base | Optimistic | Source of the range |
|---|---|---|---|---|
| Hampton Roads in person (months 1–2) | 3 | 5 | 6 | channel row 7: 10 shops at 30–60% (S567 / VS85); red team would use 20–40% |
| alantani.com Service Centers post + PMs (months 1–4) | 3 | 10 | 20 | gate 10–30 (row 2) corrected by the red team to 3–10 (S663 / R12, S664 / R13) |
| Direct outreach to ~1,000 listed shops at 2–4% (months 1–12) | 20 | 30 | 40 | channel row 1 (S502–S506 / VS20–VS24) |
| ICRBE Feb 20–21 2027, converting months 4–6 | 12 | 18 | 25 | channel row 3: 2,500 reached, 1–2% sign up, half pay (S512–S514 / VS30–VS32, S669 / R18) |
| Facebook groups and pages (months 2–12) | 8 | 20 | 30 | channel row 4, member counts unmeasured (S674 / R23); conservative halves the gate's low |
| Supplier mentions: Mud Hole, Smooth Drag, Mystic (months 4–12) | 5 | 15 | 20 | channel row 5 (S526 / VS44, S511 / VS29) |
| StripersOnline / YouTube creators | 0 | 2 | 5 | channel row 6 (S528 / VS46, S529 / VS47) |
| Public-page loop from month 7 | 0% | +10% | +20% of adds | channel row 8; no search-volume evidence on disk |
| Gross adds, year 1 / year 2 | 51 / 51 | 104 / 103 | 156 / 156 | sums; year 2 repeats the channels with ICRBE 2028 |
| Annual churn | 45% | 40% | 30% | 30–40% first-renewal loss + 5–10% retirements and closures (S706 / GA13; S545 / V35, S552 / V50) |
| Jobs per shop per month | segment mix 4 / 8 / 18 / 40 × seasonal profile 0.4–1.4, closures in Aug–Sep | same | same | S692 / R41 |

| Scenario | Month 3 (Feb 2027): paying shops / revenue | Month 12 (Nov 2027): shops / revenue / trailing 12 months | Month 24 (Nov 2028): shops / revenue / trailing 12 months | Cumulative, 24 months |
|---|---|---|---|---|
| Conservative | 11 / $147 | 38 / $442 / $3,137 | 59 / $689 / $6,914 | $10,051 |
| Base | 23 / $307 | 81 / $945 / $6,338 | 129 / $1,506 / $14,920 | $21,258 |
| Optimistic | 37 / $485 | 132 / $1,533 / $9,943 | 223 / $2,592 / $25,019 | $34,962 |

Base scenario by month, to show the seasonal swing (active paying shops, revenue, third-party cost):
Dec 2026 8 shops, $89, $29 cost → Mar 2027 37, $577, $61 → May 58, $810 → Aug 70, **$202**, $40 →
Nov 81, $945, $74 → Mar 2028 105, $1,643 → Aug 126, **$363** → Nov 2028 129, $1,506, $91. The August
trough is 19–25% of the spring peak, exactly the red team's warning (trough ÷ peak ≈ 0.19, S692 /
R41): monthly revenue swings five-fold across the year, which matters for the founder's attention,
not for solvency. For comparison, the gate's own figures at the same shop counts are ~40% higher
because its ARPU assumes a busier mix (100 shops ≈ $1,900 active month, S700 / GA7).

### 7d. Unit economics

| Item | Value | Source |
|---|---|---|
| ARPU, active month | $19 (gate mix) / $11.72 (red team mix) / $11.08 (this model's average month) | S700 / GA7; S692 / R41 |
| ARPU, per year | $204 / $141 / $133 | same |
| Stripe cost on a ledger invoice (2.9% + 30¢ + Invoicing 0.4%) | $0.64 on $10; $0.93 on $19; $1.50 on $29 (the gate assumed Billing's 0.7%: $0.66 / $0.98 / $1.34) | S718 / PD6, S726 / PD14, S469 / D3; S704 / GA11 |
| Stripe cost on an application fee | $0 ("no additional Stripe fees on the application fee itself"); the shop pays 2.9% + 30¢ on the customer's charge | S653 / R2, S713 / PD1 |
| Fee drag on tiny invoices | $1 → 34%, $3 → 14%, $5 → 10%, $10 → 6.6%; hence the ≥$5 ledger rule | red team §3d |
| Email cost per job | 6 emails (S726 / PD14) × $0.0004 (Resend Pro $20 for 50,000) ≈ $0.0024; $0 on the Free tier below 3,000 a month | S694 / GA1 |
| Contribution margin per shop-month (base) | $11.08 − ~$0.33 Stripe (half the shops ledger-billed at ~$0.67 each) − ~$0.03 email ≈ **$10.7 (≈96%)**; at the gate's $19: ≈ $18 (95%) | derivation from the rows above |
| Fixed stack | $46/mo at 100 shops, $55 at 300 (Supabase $25, Netlify $0–9, Resend $20, domain $1.25) | S705 / GA12, PD §9c |

### 7e. Break-even

Fixed costs ÷ net per shop: $46 ÷ ($19 − $0.98) = **3 shops**; all-part-timer case $46 ÷ ($10 −
$0.66) = **5 shops** (S705 / GA12). On the red team's blended $133–141 a year, $552 of annual fixed
cost needs **4–5 shops**; to cover an August bill from August revenue alone ($2.88 per shop) takes
~18 shops, which the base scenario passes in month 2. In every scenario of the model the first month
clears third-party costs. Break-even is never at risk; the ceiling is.

### 7f. The ceiling

- Full penetration: (2,000–4,500 US + 250–450 abroad) × $19 × 12 ≈ **$0.5–1.1M a year**; at a flat
  $29 ≈ $0.8–1.7M; at 20% penetration ≈ **$100–225K a year** (S710 / GA17). On the red team's ARPU the
  same pool is ≈ $0.3–0.7M at 100% (red team §1 row 6).
- Steady state: acquisitions ÷ churn = 70/yr ÷ 45% ≈ **155 shops** to 160/yr ÷ 40% ≈ **400 shops**
  (S706 / GA13) → $2,900–7,600 a month gross in active months at the gate's ARPU (gate §6), or
  $22–56K a year at the red team's (red team §3e). Downside (reel techs only, 42–103 acquisitions a
  year): 93–229 shops.
- Reading: a profitable side product for a working tech, or a wedge. The wedge candidates the
  evidence points at, none proven: the angler-owned gear record with a next-service reminder that
  routes back to the shop (gap-analysis candidate d), the directory through the public pages
  (candidate i), parts ordering. The decision log requires the founder to accept this ceiling in
  writing if C0 lands at 3–4 commitments (C0).

---

## 8. Organic go-to-market: the first 100 customers

### 8a. Step zero: the C0 commitment test (days 1–21, $0)

Before any build money beyond the scaffold, the founder personally contacts **≥20 named external
shops** and asks each for a written commitment (an email or message is enough) to three things:
run their next 10 jobs through Bench Tag at $1 a job, put a card on file at signup, connect their
Stripe at onboarding. The named list (red team §5 change 1; `research/evidence-repair-shop-tool.md`
§3): the seven shops with public price lists (S406–S411 / P67–P72, S412 / P73: Valley Reel Works,
Mat's, Dave's, Fischer Angling, Rod & Reel Repair Guy, Delaware Valley Tackle, Rick's); counters with
visible winter queues such as Grumpys Tackle, NJ, with ~150 reels queued in January (S681 / R30); the
six Houston shops anglers name (S547 / V38–V43); Haddrell's Point (S557 / V26); the Virginia 7
(S506 / VS24); the four alantani Service Centers posters with 2025–26 activity (S663 / R12); the
Hampton Roads drop-off network around Princess Anne Distributing (S340 / P1, S501 / VS19).
**Scoring:** ≥5 commitments → build; 3–4 → build only with the lifestyle ceiling accepted in
`docs/decision-log.md`; <3 → stop, record FAIL on criterion 2 in `docs/validation-gate.md`, and
re-open the gate with candidate (b).

### 8b. The channel table (reach × conversion = paying shops)

Conversion means a shop that creates jobs and is billed. Every assumption is the evidence file's
(S567 / VS85), restated per row; none is a sourced conversion rate.

| # | Channel | Reach (sourced) | Assumption | Paying shops | Timing |
|---|---|---|---|---|---|
| 0 | Founder's own shop (customer zero, unpaid) | 1 live reference installation; its dead "Book NOW" becomes the intake page | the demo is a live screen, not a slide | 0 | weeks −3 to 0 |
| 1 | Hampton Roads in person | VA 7 repair-tagged listings (S506 / VS24); 33 Virginia Beach "fishing reel repair" results incl. Princess Anne Distributing (S501 / VS19) | 10 shops visited; 30–60% (red team: 20–40%) | **3–6** | weeks 1–4 |
| 2 | Named direct-message list (the C0 list above, then ~300 of the ≈1,560 YP-listed shops) | ≈1,560 US listings extrapolated from TX 36, FL 155, CA 60, NY 34, VA 7 (S502–S506 / VS20–VS24); brand locators (S507–S509 / VS25–VS27) | 1,000 reachable; cold peer B2B 2–4% | **20–40** | months 1–12 |
| 3 | alantani.com: one post on the **"Reel Repair Service Centers"** board (live; 4 topics with 2025–26 posts), not "Member Services" (dormant since 2023-09-24); PMs to the 58 self-listed centres | 17,263 members, 454,887 posts, 91 users online on 2026-10-20 (S662 / R11, S511 / VS29) | visible working techs are dozens, not hundreds | **3–10** (gate said 10–30) | months 1–6 |
| 4 | rodbuilding.org + ICRBE, Winston-Salem, Feb 20–21 2027 | ≈96,000 topics (S515 / VS33); expo 2,000–2,500 builders, 60+ booths, floor space up 30% in 2026 (S512 / VS30, S669 / R18, S670 / R19) | a booth or a walker with QR cards reaches 2,500; 1–2% sign up, half pay | **12–25** | after Feb 2027 |
| 5 | Suppliers: Mud Hole, Smooth Drag/Carbontex, Mystic Reel Parts, Batson, Hedgehog Studio | Mud Hole YouTube 73.4K subscribers, 28.3M views (S526 / VS44); Smooth Drag and Mystic have their own alantani boards (S511 / VS29) | one newsletter or forum mention to a 5–10k list; 0.2–0.5% | **10–20** | months 3–12 |
| 6 | Facebook: "Custom Rod Builders" group (8,297 posts mirrored to rodbuilding.org since 2024-09), local fishing pages, shop pages | **member counts not retrievable** (login wall, S674 / R23); techs name Facebook as their channel (S494 / V20, S552 / V51) | assume 5–10k members; 0.3% | **15–30** (low confidence; re-compute after F2) | months 2–12 |
| 7 | StripersOnline boards (34.6k and 131.8k posts) and reel-repair YouTube creators (2nd Chance Tackle 42.8K subs) | S528 / VS46, S529 / VS47 | audiences are anglers and DIYers | **0–5** | any |
| 8 | **Public-page SEO loop:** each shop's indexable page for "[city] reel repair" with a "powered by" link; every status email carries the brand | the question is asked everywhere (S140 / M20, S141 / M22, S142 / M25, S552 / V51); **no search-volume evidence on disk** | starts after ~20 shops are live | **+10–20%** after month 6 | months 7–12 |

Sums: reel techs only 42–103; with custom rod builders (all rows) **70–160, midpoint ≈110**
(S708 / GA15). By day 90: **10–25 paying shops, $100–725 a month run-rate** (S709 / GA16), with C6′
(five shops with real usage) at the bottom of that range.

### 8c. The 90-day plan, week by week (PD §12 as amended by red-team changes 13–15)

Assumes code-complete **Monday 2026-11-30**; day 90 is **2027-03-01**, a billing day. ICRBE is
days 82–83. Revenue counted = billing to shops other than Storm Proof Tackle.

| Week | Dates | Actions | Target |
|---|---|---|---|
| −3 to 0 | Nov 9 – Dec 6 | C0 result in hand (day 21 ≈ Nov 11). Founder's shop live on production for 2–3 weeks before any pitch: price list and policies loaded, Stripe connected, every incoming reel logged, real customers opening the status page; `stormprooftackle.com`'s dead "Book NOW" points at `/s/stormproof` and the template site is replaced by the product's public page; daily bug list; ops digest running | 1 live shop, first 20 real jobs |
| 1–2 | Dec 7–20 | Hampton Roads in person: 10 shops incl. the drop-off partner Princess Anne Distributing and the VA repair-tagged listings; founder demos on his phone with his own board; sign up on the spot (card + Stripe in 15 minutes) | 3–6 shops signed |
| 2 | Dec 14–20 | alantani.com: one post in **"Reel Repair Service Centers"** per the board's rules; PM the 58 self-listed centres; rodbuilding.org post within the Solicitations sticky's rules (S515 / VS33) | 10–20 trials started |
| 3–4 | Dec 21 – Jan 3 | Direct-message batch 1: the C0 list first, then 100 shops from the YP repair category in VA, TX, FL, CA, NY and the Houston six, founder writing as a peer with his page as the proof. Holiday lull expected | 2–4 more signed |
| 5 | Jan 1 | **First billing run** (December usage). C6′ counter starts. Fix anything the invoice flow breaks | first charges to external shops |
| 5–8 | Jan 4–31 | Batches 2–3 (to ~300 contacted); ask Mud Hole, Smooth Drag, Mystic Reel Parts for one newsletter or forum mention; Facebook posts from the founder's and partner shops' pages ("Dont wait till March", S145 / I42) with the member counts measured in week −3 (F2) | cumulative 8–16 signed |
| 9 | Feb 1 | Second billing run. Review which shops create jobs and which signed and stalled; call the stalled ones | ≥5 external shops billed (early pass possible) |
| 10–12 | Feb 1–21 | ICRBE prep: **a walker's pass with QR cards unless a booth is confirmed and priced by 2026-12-01** (change 14; booth prices unpublished, S669 / R18); one-page handout with a QR to a demo shop page; rod-build flow polished (C2). Feb 20–21 at Winston-Salem | 20–40 builder sign-ups, most converting after day 90 |
| 13 | Mar 1 | Third billing run at 12:00 UTC, then **evaluate C6′**: ≥5 external shops each with ≥10 jobs across ≥2 calendar months and ≥1 customer payment through its connected account | pass → v1.1 and March–June outreach (backlogs peak, S174 / M1, S142 / M26); fail → criterion 2 FAIL, gate re-opens with (b); Bench Tag keeps serving paying shops at ~$46–86/month of fixed cost; founder decides by 2027-04-01 whether to keep it as a lifestyle tool or sunset with 60 days' notice and a final export |

Why these dates: winter is working season for mail-in techs (150 reels queued at a New Jersey counter
in January, S681 / R30; "Local shops are staying busy with winter rod and reel repairs", S682 / R31)
and the spring rush that makes the status page valuable is next; the wrong window is March–June,
when a shop with a 5–8-week backlog will not change how it takes reels in; July–October is the dead
window (S680 / R29, S409 / P70, S531 / V23). If the build slips past mid-February, expect the
external count to stall until July (red team §3f).

### 8d. Built-in loops

1. **The public page** (C7): indexable, with LocalBusiness structured data, prices, turnaround and
   the "closed until" state, so each shop answers "who fixes reels near me?" for its town and carries
   "Powered by Bench Tag" (F3).
2. **The status page and every email** carry the brand to every customer; the status URL goes on hang
   tags, Facebook posts and the printed form the shop already uses (S495 / V21, S551 / V47).
3. **Seasonal timing as a channel:** shops already push off-season specials ("Dont wait till March to
   get your reels serviced", S145 / I42); a January launch puts the pitch in the buying window and the
   product's proof in the pain window (gate §3c).
4. **The trade's forums are the support channel:** the forum owner at alantani.com is himself a
   repairman (S485 / VS3); a working tech's recommendation travels further there than any ad.

---
## 9. Risks and red-team findings

### 9a. Five failure modes (red team §4; probabilities are the red team's estimates for the first twelve months after launch, overlapping, not summing)

| # | Failure | Probability | Evidence | What must be true for it not to happen |
|---|---|---|---|---|
| 1 | **"Free and fine."** Shops sign up, create a few jobs, keep taking reels by text, phone and Facebook message; the status URL never goes on the tag; fewer than five external shops are genuinely using it by day 90 | **45%** | zero shops found paying for tracking in 54 pain rows, eight websites and two forum searches; the 2026 builder ask answered with "Google Spreadsheet" (S667 / R16); Paperform Free covers a ≤30-job shop's intake and deposit for $0 (S659 / R8); Square Invoices Free requests deposits (S661 / R10); "A repair shop spreadsheet can feel perfectly fine…" (S543 / N-V17); Alan Tani ran 100 a month on box dates (S485 / N-V10) | ≥5 shops commit before the build (C0); onboarding to a live public page in under 15 minutes; the first thing a shop sees after creating a job is the customer's status page and the email the customer gets; the shop's existing printed form is reproduced as the intake page |
| 2 | **Distribution never reaches the pool.** The founder's online reach is unmeasured and his site is a template; Facebook groups are unmeasured; the alantani business board is dormant; ICRBE booths are gone or unaffordable; outreach stalls at the shops he can drive to | **35%** | S672 / R21, S673 / R22, S674 / R23, S664 / R13; booth prices unpublished and demand high (S669 / R18); the 2–5% and 3–5% conversion rates are unsourced (gate §3b) | Facebook group sizes reported within a week (F2); an alantani Service Centers post gets replies from working techs; ten in-person visits in weeks 1–4; a walker's pass at ICRBE with a QR card if no booth; one supplier mention by month 3 |
| 3 | **It works and stays tiny.** 100 shops is ≈$14K a year with an August of ≈$300; the full-penetration ceiling is ≈$0.3–0.6M; the founder's attention drifts back to the bench | **60%** (conditional on surviving 1 and 2) | season model (S692 / R41); S710 / GA17; "lifestyle or wedge" is the gate's own phrase | the founder wants a profitable side product, or the shop tool becomes the wedge to something evidenced (the angler-owned gear record, parts ordering, the directory via the public pages); none proven; a known ceiling, not a surprise |
| 4 | **Churn above 40%.** Part-timers who onboard in winter go quiet in July–October and do not come back; techs retire, go back to a day job, or drop the service line; the plateau is 100–200 shops | **40%** | S545 / V35 ("doesn't do reels anymore"), S552 / V50 ("I thought he retired?"), retiring-tech thread (S555 / VS73, N-V4), closures (S680 / R29, S409 / P70, S531 / V23); S706 / GA13 | the $0 idle month keeps the account alive; the public page keeps taking requests while the shop is closed so the queue is waiting when it reopens; history makes the return automatic; the "closed until" switch is in v1 (change 4) |
| 5 | **The first promise breaks in front of a tight community.** Status emails land in spam, Stripe onboarding stalls a shop at KYC, or a public page gets spammed; customers call anyway; the tech tells alantani it "doesn't work" | **15%** | shared sending IPs by default (S688 / R37); Stripe-hosted KYC (S655 / R4, S656 / R5); "Greasy Hands, cannot always pick up the phone" (S486 / V4) means nobody will debug DNS | domain authentication (SPF, DKIM, DMARC) before the first external shop; status page reachable by short code and QR without email (change 2); deposits gated on `charges_enabled` but jobs never gated (change 3); rate-limited, Turnstile-checked public forms; a weekly deliverability check in the founder's own inbox |

A sixth pressure without a probability: **scope pull toward inventory and POS.** The only 2026
builder ask is inventory/costs/sales (S667 / R16) and tackle shops buy POS (S442 / P103, S443 / P104);
the product must refuse both in v1 or it becomes a bad Square (red team §4).

### 9b. Counter-evidence the gate weighed (evidence file §6)

- DIY culture: "Do it yourself. Believe it or not, reel repairs aren't that hard to do." (S552 /
  N-V1); a UK angler quoted £20+ by the OEM did it himself for £17 (S553 / N-V2).
- A shrinking trade: "All the little mom and pops have been wiped out, because it's not economically
  feasible." (S554 / N-V3, 2010); "He eventually had to close his business. Now, in my area, there are
  no tackle repairmen." (S690 / R39); PENN's "Reels No Longer Serviced" list and Shimano's refusal to
  authorise retailer warranty repairs (S684 / R33, S685 / R34). The red team's reading: OEM retreat
  from parts and older models pushes work *to* independents; what is shrinking is the number of
  techs who announce themselves publicly, which makes the pool harder to enumerate, not smaller
  (red team §3b).
- Techs who do not want to scale: "keeping me busy on a part time basis, which is what I wanted"
  (S487 / N-V11); "I do not take a deposit as I do not want to hold onto someone's money." (S489 /
  N-V12).
- Customers who tolerate slow service: "usually send reels in during the off-season and tell him no
  hurry" (S560 / N-V9).
- The vendor's own concession: RepairDesk, 2026: a spreadsheet "can feel perfectly fine when the
  day is calm, and the same one or two people touch every repair." (S543 / N-V17).
- Nothing found in the other direction: no tech saying "I don't want customers tracking jobs"
  (N-V20).

### 9c. Data, licensing and legal exposure (red team §3g)

None material. The product uses no third-party fishing data, no licensed dataset, no map tiles
(gate §4). What remains is ordinary SaaS exposure:

| Risk | Finding |
|---|---|
| Bailment (the shop holds the customer's reel) | The shop's contract with its customer; the platform is a record-keeper. Terms of service must say the platform is not a party to the repair and does not inspect, store or insure items; the status page names the shop as the business. |
| Holding customer money | None by construction: direct charges settle in the connected account (S652 / R1, S653 / R2); the platform receives only its application fee; no money-transmission question arises. |
| Chargebacks, refunds, disputes | Land on the shop's Stripe balance ("Refunds and chargebacks reduce the connected account's balance", S652 / R1); dispute fee payer is the connected account (S654 / R3); negative balances are covered by Stripe (S656 / R5, S657 / R6). The platform decides per the 7-day rule whether to refund its $1 (change 8). |
| KYC / identity | Stripe-hosted for Standard-behaviour accounts (S655 / R4). The product must work without a connected account and gate only deposits on `charges_enabled` (change 3). |
| PII | Names, emails, phones, item descriptions, photos; no card data touches the platform. Needs a privacy notice, per-shop isolation proven by the RLS tests, export and deletion (F13), a photo retention rule. Below CCPA/GDPR thresholds at this scale. |
| Email terms and deliverability | Transactional only; Resend shared IPs by default (S688 / R37); SPF/DKIM/DMARC on the product's own domain from day one; bounce and complaint suppression; the status page must not depend on email arriving (change 2). No SMS in v1 → no TCPA/10DLC exposure (C3). |
| Stripe terms | Connect platform agreement; restricted-business list irrelevant; application-fee refund behaviour as documented (S713 / PD1). |
| Tax | The shop's 1099-K and sales tax are the shop's (its own Stripe account). SaaS sales tax on the platform's $1 fee applies in some states above thresholds this business will not reach for years; ask the accountant (PD §14 Q4) and ignore until revenue is material. |

### 9d. How it fails without ad spend

Without paid acquisition the whole first-100 path rests on five things the founder does personally:
ten in-person visits, a named direct-message list, one credible forum post, a two-day expo, and his
own shop's public page ranking for its town. The three ways that chain breaks: (1) the founder's
online credibility is not fixed before outreach, so peers land on a template site with "Lorem ipsum"
testimonials and "100+ Active Worker" (S672 / R21); (2) the unmeasured channels (Facebook, S674 /
R23; Instagram, S346 / P7) turn out to be small, removing 15–30 of the 70–160; (3) the build slips
past mid-February, the spring rush arrives, and shops with 5–8-week backlogs will not change intake
until July (red team §3f). The public-page loop is the only compounding channel and it is not
counted before month 7 and has no search-volume evidence behind it (channel row 8).

### 9e. What would need to be true for this to work (checklist)

- [ ] ≥5 of 20 named shops commit in writing within 21 days (C0).
- [ ] The founder's own shop runs on it for 2–3 weeks with real customers opening the status page
      before any peer pitch (change 14).
- [ ] `stormprooftackle.com` is replaced by the product's public page before outreach (F3).
- [ ] Facebook group sizes are measured and channel row 6 recomputed (F2, change 15).
- [ ] A tech with 15+ reels a month in season values not answering "is it ready yet?" more than he
      values keeping his texts (red team §4 closing paragraph).
- [ ] The customer's status page becomes the thing the shop is known for ("my reels are always done
      before the estimated date given at drop off", S547 / V41).
- [ ] Code-complete by 2026-11-30; launch before early December; hard stop mid-February (C5′).
- [ ] Domain authentication done and a QR/short-code path on every receipt before the first external
      shop (change 2; S688 / R37).
- [ ] By day 90: ≥5 external shops with ≥10 jobs across ≥2 months and ≥1 customer payment each (C6′).
- [ ] The founder accepts, in the decision log, that the base outcome is a $14–20K-a-year side
      product unless a wedge proves out (failure mode 3).

---

## 10. Remaining actions for the founder

Everything below is outstanding as of 2026-10-21. Nothing is blocking the deliverables: the `/app`
starter runs on a local Postgres harness and in demo mode (`docs/approvals.md`). Ids: A = approvals
log, F = founder actions from the red team, Q = product-definition §14.

### 10a. Do this week

| Id | Action | How | Verify | Fallback |
|---|---|---|---|---|
| F1 | **C0 commitment test** (deadline: 21 days from 2026-10-21 → 2026-11-11) | 1. Take the named list in §8a (the seven price-list shops, Grumpys-type winter counters, the Houston six, Haddrell's, the Virginia 7, the four alantani Service Centers posters, the Princess Anne network). 2. Write as a peer, from your shop's email or Facebook page, with one screenshot of a job on your board and one of the customer's status page. 3. Ask for three things in writing: next 10 jobs at $1 a job, a card on file at signup, Stripe connected at onboarding. 4. Record each reply (yes / no / silent, date, channel) in `docs/decision-log.md`. | ≥5 written yeses → proceed; 3–4 → proceed only after writing the lifestyle-ceiling acceptance into the decision log; <3 → record FAIL on criterion 2 in `docs/validation-gate.md` §8 and reopen the gate with (b). | None; this is the kill switch. A late or partial result is reported as what it is, not rounded up (PD §12). |
| F2 | **Measure Facebook group sizes** (7 days) | While logged in, open the "Custom Rod Builders" group (`facebook.com/groups/customrodbuilders/`, S674 / R23) and every reel-repair / reel-restoration group you can find; note member count, posts per day and date checked; also your own page's follower count (S673 / R22) and your Instagram followers and posting cadence (S346 / P7). | Numbers appear in `docs/decision-log.md`; channel row 6 in §8b is recomputed from them before the first-100 claim is repeated anywhere. | If counts are under ~5,000 in total, move row 6 to the bottom of the plan and lean on rows 1–5. |
| F4a | **Domain decision** | Decide between acquiring `benchtag.com` (registered, parked lander, S725 / PD13: use the registrar's "make an offer" or a broker) and launching on `benchtag.app` or `getbenchtag.com` (availability unchecked). Do a quick trademark search (USPTO TESS) before paying for either. | Domain in your registrar account; DNS zone reachable (needed by A3, A7 and Stripe branding). | Launch on any `.app` you own: customers see the shop's page and status link, so the root domain carries little weight at launch (PD §1a). |

### 10b. Before deploy

| Id | Action | How | Verify | Fallback |
|---|---|---|---|---|
| A2 | **Supabase account and project** | 1. Create a Supabase organisation and a project in a US region on the **Pro** plan (Free pauses after a week idle; $25/mo, S467 / D1). 2. From the project's settings copy the project ref, the database password you set, the anon key and the service-role key. 3. Create a personal access token for the CLI. 4. Put `SUPABASE_ACCESS_TOKEN`, `SUPABASE_PROJECT_REF`, `SUPABASE_DB_PASSWORD` in the GitHub repository's environment secrets; put `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` in Netlify's build environment and in `app/.env.local` locally. 5. Enable the `pg_cron`, `pg_net` and Vault features the cron jobs need (Q10). 6. In Auth settings, set the site URL and redirect URLs to the app's domain and switch the email provider to custom SMTP once A7 is done (Q12). | `npx supabase@2 link --project-ref <ref>` then `npx supabase@2 db push` applies the migrations with no error; `npm run db:types` regenerates `app/src/lib/supabase/types.ts` unchanged. | The local harness (`npm run test:sql`) keeps proving migrations and RLS on plain Postgres 16 (decision D3, D7). |
| A3 | **Netlify account and site** | 1. Create a Netlify account; "Add new site → Import from Git" and pick the repo; Netlify reads the root `netlify.toml` (`base = "app"`, build `npm run build`, publish `dist`, Node 22). 2. Add build environment variables: `VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY`, `VITE_APP_URL`, `VITE_TURNSTILE_SITE_KEY` (public-safe values only; never the service-role key, Stripe secret or Resend key, `app/.env.example`). 3. Create a personal access token and note the site id; add `NETLIFY_AUTH_TOKEN` and `NETLIFY_SITE_ID` to GitHub secrets for CI deploys. 4. Point the domain from F4a at the site and let Netlify issue the certificate. | `curl -I https://<site>` returns 200 with the CSP and `X-Frame-Options` headers from `app/netlify.toml`; `/app` loads the SPA; `/s/<slug>` returns server-rendered HTML once the function ships. | `netlify.toml` and the README are in the repo; the prototype is published as an Artifact (A3 fallback). |
| A4 | **Stripe account, test mode, Connect enabled** | 1. Create the Stripe account (or use the shop's) and stay in **test mode**. 2. Connect settings → complete the platform profile and choose the model where **Stripe handles pricing** (connected accounts pay Stripe's fees; no $2 active-account or payout fees, S716 / PD4); confirm accounts will be created with controller defaults equal to Standard (`fees.payer=account`, `losses.payments=stripe`, `requirement_collection=stripe`, full Dashboard, S715 / PD3) (Q3). 3. Developers → API keys: copy the secret key and publishable key. 4. Developers → Webhooks: create **two** endpoints, one for "Events from your account" (`checkout.session.completed`, `invoice.paid`, `invoice.payment_failed`, `invoice.voided`) and one for "Events from connected accounts" (`checkout.session.completed`, `checkout.session.async_payment_*`, `payment_intent.succeeded`, `charge.refunded`, `application_fee.*`, `account.updated`, `account.application.deauthorized`) (S719 / PD7); copy each signing secret. 5. Store `STRIPE_SECRET_KEY`, `STRIPE_WEBHOOK_SECRET_PLATFORM`, `STRIPE_WEBHOOK_SECRET_CONNECT` as Supabase Edge Function secrets and `VITE_STRIPE_PUBLISHABLE_KEY` in Netlify. 6. Enable Stripe Invoicing on the platform account (Starter, 0.4%, S718 / PD6). | A test connected account completes hosted onboarding and shows `charges_enabled`; a test Checkout on it with `application_fee_amount=100` produces a $1 application fee on the platform balance; both webhook endpoints show 200s. | Billing behind a feature flag (A4 fallback); jobs, status pages and quotes work without Stripe (change 3). |
| A7 | **Resend** | 1. Create a Resend account; add a sending subdomain (e.g. `mail.<domain>`); add the SPF, DKIM and DMARC (`p=quarantine`) DNS records it gives you (Q12). 2. Create an API key → `RESEND_API_KEY` in Supabase Edge Function secrets. 3. Create SMTP credentials and enter them as Supabase Auth's custom SMTP so sign-in codes and status emails share one sender reputation (PD §7a). 4. Start on Free (3,000/mo, 100/day); upgrade to Pro $20 when daily volume approaches 100 (≈17 jobs a day, S694 / GA1, S721 / PD9). | The domain shows "verified" in Resend; a sign-in email and a test `status_update` land in your own inbox, not spam; the ops digest arrives daily. | Postmark is the priced alternative (S695 / GA2); the status page is reachable by short code and QR regardless (change 2). |
| T1 | **Cloudflare Turnstile keys** | 1. In a Cloudflare account (free), open Turnstile → Add site; hostnames: the product domain (one widget covers every shop page because all live on one hostname, S723 / PD11). 2. Copy the site key → `VITE_TURNSTILE_SITE_KEY` (Netlify and the `public-page` function) and the secret key → `TURNSTILE_SECRET_KEY` (Supabase secrets). | The request form renders the widget and `public-intake` rejects a missing or failed token with the plain-text error in PD §5b. | Rate limits alone protect the form until the key exists; custom domains per shop later need one widget per 10 hostnames (Q7). |
| E1 | **Environment variables, complete list** | Supabase Edge Function secrets: `SUPABASE_SERVICE_ROLE_KEY`, `STRIPE_SECRET_KEY`, `STRIPE_WEBHOOK_SECRET_PLATFORM`, `STRIPE_WEBHOOK_SECRET_CONNECT`, `RESEND_API_KEY`, `TURNSTILE_SECRET_KEY`, `CRON_SECRET` (also in Vault for the cron SQL, PD §8). Netlify build env: `VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY`, `VITE_APP_URL`, `VITE_TURNSTILE_SITE_KEY`, `VITE_STRIPE_PUBLISHABLE_KEY`, plus `SUPABASE_URL`, `SUPABASE_ANON_KEY`, `TURNSTILE_SITE_KEY` for the `public-page` function. GitHub environment secrets: `SUPABASE_ACCESS_TOKEN`, `SUPABASE_PROJECT_REF`, `SUPABASE_DB_PASSWORD`, `NETLIFY_AUTH_TOKEN`, `NETLIFY_SITE_ID`. | `app/.env.example` documents the browser-side set; a secrets scan in CI finds no secret in the bundle (PD §13). | — |
| A5 | Third-party data API keys | **Not needed.** The product uses no tide, weather, regulation or map data (gate §4). | — | — |

### 10c. Before launch

| Id | Action | How | Verify | Fallback |
|---|---|---|---|---|
| F3 | **Replace the stormprooftackle.com template** | Point the site's "Book NOW" and service pages at `/s/stormproof` (or redirect the whole domain to the Bench Tag public page); remove the Lorem-ipsum testimonials, "100+ Active Worker" counters and placeholder team (S672 / R21, S340 / P1, S341 / P2); publish your real price list (Spinning reel service $30, guide replacement from $10, S342 / P3, S343 / P4) and decide whether to charge an estimate fee like the $15–$20 your peers charge (Q14; S406 / P67, S407 / P68). | A peer who clicks from your Facebook page lands on a page with prices, turnaround and a working request button. | Do it before any outreach (change 14); the whole peer-credibility argument depends on it. |
| F4b | **Accountant question** | Ask: (1) sales-tax treatment of the $1/job platform fee for a Virginia seller and SaaS taxability in the shops' states, and when to switch on Stripe Tax on platform invoices (Q4); (2) the wording and legality of a flat "Online service fee $1.00" line on the customer's payment under card-network and state rules (Q5); (3) the prepay refund policy, proposed full refund within 30 days if unused (Q6). | Written answers filed in `docs/decision-log.md`; pricing-page sentence updated. | Launch with the pass-through switch **off** by default (it already is) and no tax on platform invoices (PD §11) until answered. |
| F4c | **ICRBE decision by 2026-12-01** | Contact the organiser (rodbuilding.org / Tom Kirkman; the 2027 vendor update thread is on the forum index, S666 / R15) for booth price, deadline and whether a floor presence without a booth is allowed (Q9). | Booth confirmed and priced by Dec 1, or a walker's pass bought and 200 QR cards printed (change 14). | Walker with QR cards; a demo shop page on the card. |
| A6 | **Domain live** | Finish F4a: DNS for the app (A3), the sending subdomain (A7) and Stripe's branding settings on the platform account. | `https://<domain>/s/stormproof` and `https://<domain>/t/<demo token>` answer from an external uptime check every 5 minutes (Q18, PD §13). | — |
| A1 | Reddit access (optional, research only) | Allow `reddit.com`, `www.reddit.com`, `old.reddit.com`, `api.pullpush.io` in the environment's network policy if a further evidence round is ever run. | `curl https://www.reddit.com/r/Fishing/.json` returns 200 (it returned 403 on 2026-10-20). | Search-engine snippets and reachable forums, as used throughout (decision D2). |

Count: 3 this week (F1, F2, F4a), 7 before deploy (A2, A3, A4, A7, T1, E1, A5-as-confirmation),
5 before launch (F3, F4b, F4c, A6, A1-optional) → **15 actions**, of which F1 is the one that decides
whether the rest happen.

---

## 11. Decision log highlights and runner-up opportunities

### 11a. The eight most consequential decisions (`docs/decision-log.md`)

| Id | Decision, in one line |
|---|---|
| D2 | Reddit is blocked by the environment; proceed on search-engine snippets of Reddit threads plus directly reachable forums, YouTube comments and app-store reviews rather than idle the team. |
| D3 / D7 | No Docker daemon → migrations and RLS are tested on a throwaway plain PostgreSQL 16 cluster with an `auth.uid()` shim; faithful because the schema is plain SQL. |
| D5 / D8 | Stack kept and pinned after a probe build: React 19.3, Vite 8.3, TypeScript 6.0, Tailwind 4.3, Vitest 5, ESLint 9 flat config with typescript-eslint 8.72, supabase-js 2.118, Zod 4.6, react-router 7.18, TanStack Query 5.104. |
| D9 | **Proceed with candidate (a)** under gate conditions C1–C7; (b) and (e) recorded as runners-up. |
| D10 / D12 | Phase 5 split: the product-independent scaffold (5a) started in parallel with the product definition; schema and vertical slice (5b) wait for it; the prototype launched as soon as the definition landed; `/app` work serialised to avoid two agents writing it at once. |
| D11 | **Bench Tag**; one 12-value `job_status` enum with a per-item `kind` instead of separate reel and rod flows; payment is a computed badge, not a status; customers reach status pages through a SECURITY DEFINER RPC with sha256-hashed 128-bit tokens; money settles on the shop's own Stripe account (Connect, direct charges); the platform bills from its own ledger through Stripe Invoicing, not Billing Meters. |
| D13 | **Red team pass 1 accepted in full** (17 changes: C0 pre-build commitment test, status pages that work without email, jobs independent of Stripe onboarding, the "closed until" switch, the $1 as an application fee with a ≥$5 ledger rule, the refund rule, card on file at signup, the corrected launch window, tightened C6, the day-90 scorecard); the starter and prototype are still delivered because they are the mission's deliverables and the vehicle for the C0 pilots. |
| C0 (via D13) | The kill switch moved from day 90 after launch to day 21 before the build: fewer than three written commitments ends the project at the cost of a few emails. |

### 11b. Runner-up opportunities

**(b) Private, exportable web-first logbook with automatic NOAA/NWS conditions** (gap-analysis rank 2,
61 points; `research/evidence-private-logbook.md` §6). Why it lost: willingness to pay is proven only
at $10–20/yr or $25–40 one-time (976 ratings on an $8.99 paper log, S595 / L29; Anglers' Log 100K+
downloads at $11.99/yr, S573 / L6) against (a)'s ~$11–19 a month; the 90-day organic path is a likely
FAIL (≈2,400 US searches a month for the log family and ≈130 with "app" intent, S604 / L38, S605 /
L39; 23–65 payers in 90 days on stated assumptions); Fishing Points already ships a private log with
automatic weather, solunar and tide, GPX import, a web app and sync to 10M+ installs (S624 / L58) and
101 log apps launched in 2026 (S650 / L87); retention is structural (33% of incentivised diarists
still logging at 12 months, 3–7% day-30 retention for apps, S637 / L71, S640 / L74). What would revive
it: C0 or C6′ failing for (a), plus a distribution partner (a forum or creator post) and a design that
removes entry effort (automatic conditions from a single tap). It also remains the natural consumer
companion to (a): the per-item service history the shop tool creates is the seed of an angler-owned
gear record.

**(e) Fly-tying materials inventory** (rank 3, 61 points). Why it lost: eleven handles on one platform
(FAOL) in threads from 2006–2013, half at intensity 1 — it fails criterion 1's three-platform rule on
current evidence; competition was never researched, so criterion 3 was capped at 2; break-even needs
~59 payers at $12/yr (S479 / G6). It scored high only because it is trivial to build. What would
revive it: ≥10 handles on ≥3 platforms dated 2020 or later and a competitor sweep nobody has done;
run it as a pain-mining round first.

**(c) Fishing club administration** (rank 8, 56 points). Why it lost: the pain is one club on one
forum (I-C1–C17, marked "provisional" by the immersion file); a volunteer director decides once a
year in winter; Fishing Chaos has an unpriced club module and "could ship it in a quarter" (S296 /
C61, competitors §7). What would revive it: an officer-side evidence set from more than one club, and a
club-first wedge (meetings, dues, roles, a public page) that hands tournaments to TourneyX/FishDonkey.

### 11c. Scoring grid, top 8 (`research/gap-analysis.md` §2; nine criteria, weights 3/3/2/1/2/2/1/2/2, max 90)

| Rank | Candidate | Pain | WTP | Comp. weak | Fit | Solo build | Time to $ | Defens. | Distrib. | Low resource | Weighted | Why it lost |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | a. Reel/rod service job tracker (B2B) | 2 | 3 | 4 | 4 | 4 | 4 | 4 | 3 | 5 | **63** | — (pain scored 2: no first-person shop complaint on disk; fixed by the evidence round) |
| 2 | b. Private web logbook, auto conditions | 4 | 4 | 3 | 3 | 3 | 3 | 2 | 3 | 4 | **61** | Fishing Points one feature away at 10M installs; export-by-design gives away the moat |
| 3 | e. Fly-tying materials inventory | 3 | 3 | 2 | 5 | 5 | 3 | 2 | 3 | 5 | **61** | one platform, 2006–2013 threads; competition unresearched |
| 4 | k. Tackle inventory with cost/value | 2 | 3 | 4 | 5 | 5 | 3 | 2 | 2 | 5 | **60** | one 2010 thread; "low-intensity except for fly tiers" |
| 5 | f. Small-club tournament director tool | 4 | 5 | 1 | 3 | 3 | 2 | 1 | 3 | 5 | **59** | four live incumbents priced per angler; "the slots are taken" |
| 6 | d. Personal gear record with reminders | 2 | 3 | 4 | 4 | 4 | 3 | 2 | 3 | 5 | **59** | one spreadsheet user; the pain is access and parts, not tracking |
| 7 | i. Reel-service directory + mail-in flow | 4 | 2 | 3 | 5 | 4 | 2 | 3 | 4 | 3 | **58** | no shop pays for leads; absorbed into (a) as the public shop page (C7) |
| 8 | c. Fishing club administration | 2 | 3 | 4 | 4 | 3 | 2 | 3 | 3 | 5 | **56** | one club, one forum; one volunteer decision a year |

---

## 12. Appendix

### 12a. Method

A lead agent ran the mission in eight phases (`docs/progress.md`): preflight and approvals (0),
setup (1), four parallel research agents for market sizing, hobby immersion, competitors and
monetization plus a lead-written infrastructure file (2), a desk-only gap-analysis agent and two
targeted evidence agents followed by the gate (3), a product-definition agent (4), a scaffold agent
and a schema/vertical-slice agent for `/app` (5a, 5b), a prototype agent (6), an independent red team
that re-ran the gate before reading the gate document and then attacked the pass with 31 searches and
36 fetches (7a; 7b, code review, follows 5b), and this report (8). Eight skills were written in phase
1 and used throughout (`docs/skills-log.md`): `source-logging` (one citation row format, so the lead
merges tables instead of reformatting), `pain-point-mining` (the search recipe and evidence table the
gate consumes), `competitor-teardown`, `market-size-triangulation`, `opportunity-scoring` (fixed
anchors and weights so two agents score the same way), `validation-gate-checklist` (the six pass
conditions as tests; the red team re-runs the same checklist), `code-review-against-standards`, and
`approvals-audit`. Numbers in this report were not re-derived except where stated (the (a)-specific
TAM/SAM/SOM in §6b and `scripts/revenue-model.py` in §7c, both labelled estimates with cited inputs).

### 12b. Evidence limits

- **Reddit blocked** by the environment's network policy (403 via proxy, and Reddit blocks reader
  proxies); every agent's `site:reddit.com` searches returned nothing (nine attempts by the red team
  alone). Fallback: search-engine snippets of Reddit threads plus directly reachable forums
  (alantani.com, rodbuilding.org, StripersOnline, Texas Kayak Fisherman, Northwest Fishing Reports,
  charlestonfishing, Lake Ontario United, TigerDroppings, sdfish, NESA) (decision D2; approvals A1).
- **Search budgets:** the shared WebSearch budget ran out part-way through market sizing and at about
  two-thirds of the monetization plan; later work used direct fetches of primary PDFs. Google Trends
  could not be pulled, so seasonality rests on licence-sales and tournament data (market-sizing
  tooling note; monetization §0).
- **Unmeasured Facebook:** group and page pages are login walls; no member counts anywhere in the
  evidence (S674 / R23). Channel row 6 (15–30 shops) is therefore the least reliable number in the
  plan and is to be recomputed after F2.
- **Founder reach unmeasured:** Instagram returned HTTP 429 on every attempt by two agents (S346 /
  P7, S673 / R22); the Facebook page shows no follower count to a logged-out fetch.
- **Rate-limited or blocked pages:** Shopify-hosted manufacturer pages (PENN, Daiwa, Shimano) and
  Square's own pricing page returned 429; Trustpilot.com, Yelp, yell.com, BassResource and The Hull
  Truth returned 403/502; quotes from those are marked "snippet" and are from search excerpts or
  country mirrors (evidence file §0; monetization §0).
- **Age of the business-side evidence:** eight of the fourteen business-side quotes in §2b are
  2004–2014 rodbuilding.org threads; the gate weighed them against 2023–2026 shop pages and complaints
  that show the same workflow (gate §1a).
- **Unsourced conversion rates:** the 2–4% cold-outreach, 3–5% forum and 30–60% in-person rates in
  the channel table are assumptions, stated as such (S567 / VS85); the red team would use 20–40% for
  in-person.
- **Two estimates the gate used that the red team corrected:** active-month ARPU ($19 → ≈$12) and the
  alantani channel (10–30 → 3–10); both are shown side by side in §6b, §7 and §8.

### 12c. Source list

The full table is [`docs/sources.md`](../docs/sources.md): 727 rows merged from the research files'
source tables by `scripts/merge-sources.py` (market-sizing 103, hobby-immersion 132, competitors 104,
monetization 127, infrastructure 7, gap-analysis 9, evidence-repair-shop-tool 85,
evidence-private-logbook 84, red-team 42, validation-gate 19, product-definition 15). The forty most
relied on in this report:

| S | Local | Claim used | URL |
|---|---|---|---|
| S1 | M1 | 57.0M US participants 6+ in 2025 | https://asafishing.org/wp-content/uploads/2026/07/2026-Special-Report-on-Fishing_WEB_FV.pdf |
| S4 | M4 | 19M quit in 2025; churn 33% | same |
| S13 | M13 | 32% fish monthly or more; 918M outings | same |
| S27 | M27 | 39.9M anglers 16+ in 2022 | https://www.fws.gov/sites/default/files/documents/Final_2022-National-Survey_101223-accessible-single-page.pdf |
| S28 | M28 | $99.4B spend; $2,490 per angler; $217 tackle | same |
| S35 | M35 | rods & reels $2.3B; online media subscriptions $166M | https://asafishing.org/wp-content/uploads/2025/01/2024_ASA_Economic_Report_Digital_Spread.pdf |
| S39 | M39 | 32.24M paid licence holders (2023) | https://www.statista.com/statistics/247669/fishing-license-holders-in-the-us/ |
| S40 | M40 | paid licence holders by state, 2021 | https://stacker.com/your-state/states-most-registered-anglers |
| S47 | M47 | 15,548 tackle shops | https://www.ibisworld.com/united-states/market-research-reports/tackle-shops-industry/ |
| S59 | M59 | 25% of active anglers use a fishing app | https://www.southwickassociates.com/smartphone-app-use-and-todays-angler/ |
| S142 | I39 | charlestonfishing "Reels" thread: 5-week wait at Haddrell's | https://forum.charlestonfishing.com/t/reels/38461 |
| S174 | I71 | sdfish thread: "8 week backlog", "didn't even know shops did this" | https://www.sdfish.org/viewtopic.php?p=28999 |
| S314 | C79 | ReelKeep, the only maintenance app, unrated | (competitors.md C79) |
| S340 | P1 | founder's site: template, dead "Book NOW" | https://www.stormprooftackle.com/ |
| S406 | P67 | Valley Reel Works price list and intake | https://www.valleyreelworks.com/ |
| S407 | P68 | Mat's Reel Repair prices, printed form | https://matsreelrepair.com/service-pricing |
| S408 | P69 | Dave's Reel Service: 8-week turnaround, closed Aug 25–Oct 15 | https://www.davesreelservice.com/rates/ |
| S409 | P70 | Fischer Angling: 10-day turnaround, closed Jul 15–Sep 15 | https://fischeranglingpro.com/ |
| S450 | P111 | RepairDesk $99/$149 | https://www.repairdesk.co/pricing |
| S452 | P113 | no reel-specific repair software; Digital Wrench $39.95, RepairTRAX $30 | https://www.capterra.com/p/130999/RepairTRAX/ |
| S467 | D1 | Supabase Pro $25 and quotas | https://supabase.com/pricing |
| S468 | D2 | Netlify credits and plans | https://www.netlify.com/pricing/ |
| S469 | D3 | Stripe 2.9% + 30¢; Billing 0.7% | https://stripe.com/pricing |
| S483 | VS1 | Square: rod builder's one-day prep-time limit (V1) | https://community.squareup.com/t5/Questions-How-To/How-would-I-show-my-customers-order-wait-time-or-how-long-an/td-p/639869 |
| S485 | VS3 | Alan Tani: 100 reels a month, dates on boxes (V3) | https://alantani.com/index.php/topic,277.0.html |
| S488 | VS6 | rodbuilding.org "stiffed for a repair" (V6–V10) | https://www.rodbuilding.org/read.php?2,429833 |
| S496 | VS14 | Valley Reel Works two-invoice parts flow (V22) | https://www.valleyreelworks.com/ |
| S502–S506 | VS20–VS24 | Yellow Pages "Fishing Tackle Parts & Repair" counts TX/FL/CA/NY/VA | https://www.yellowpages.com/search?search_terms=Fishing+Tackle+Parts+%26+Repair&geo_location_terms=FL |
| S511 | VS29 | alantani.com member and board counts | https://alantani.com/ |
| S512 | VS30 | ICRBE attendance 2,000–2,500 | https://www.visitwinstonsalem.com/event/international-custom-rod-building-exposition-icrbe |
| S524 | VS42 | Tower Systems pricing and repairs module | https://www.towersystems.com.au/pricing.html |
| S545 | VS63 | NWFR: "calling him every day" (V34) | https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=160872 |
| S547 | VS65 | Texas Kayak Fisherman: told "ready" when not (V38–V43) | https://texaskayakfisherman.com/forum/viewtopic.php?p=2339973 |
| S564–S567 | VS82–VS85 | pool, builders, abroad, first-100 math (estimates) | (evidence-repair-shop-tool.md §2–§3) |
| S653 | R2 | application fees carry no Stripe fee | https://docs.stripe.com/connect/direct-charges |
| S659 | R8 | Paperform Free: 30 submissions a month, Stripe included | https://paperform.com/pricing |
| S667 | R16 | 2026 rodbuilding.org software ask → "Google Spreadsheet" | https://www.rodbuilding.org/read.php?2,584503,584503 |
| S669 | R18 | ICRBE 2027: Feb 20–21, Winston-Salem, 60+ booths | https://www.sharedaudiences.com/events/international-custom-rod-building-exposition-2027 |
| S672 | R21 | founder's site observed 2026-10-21 | https://www.stormprooftackle.com/ |
| S675 | R24 | Hubtiger bike-shop job cards $52–125/mo | https://apps.shopify.com/hubtiger |
| S681 | R30 | Grumpys Tackle: ~150 reels queued in January 2026 | https://www.thefisherman.com/contributor/grumpys-tackle/ |
| S692 | R41 | red team season and metering model | (red-team.md §3e; scratchpad script) |
| S694 | GA1 | Resend pricing | https://resend.com/pricing |
| S700 | GA7 | gate active-month ARPU $19 (estimate) | (validation-gate.md §6) |
| S706 | GA13 | plateau 155–400 shops (estimate) | (validation-gate.md §6) |
| S708 | GA15 | first-100 sums 42–103 / 70–160 (estimate) | (validation-gate.md §3) |
| S710 | GA17 | ceiling $0.5–1.1M at full penetration (estimate) | (validation-gate.md §5) |
| S716 | PD4 | Connect pricing under "Stripe handles pricing" | https://stripe.com/connect/pricing |
| S718 | PD6 | Stripe Invoicing 0.4% | https://stripe.com/invoicing/pricing |
| S723 | PD11 | Turnstile free plan limits | https://developers.cloudflare.com/turnstile/plans/ |
| S726 | PD14 | cost-table arithmetic (estimate) | (product-definition.md §9c) |

*End of report. Sections 5g and 5h carry `TODO` placeholders for the `/app` starter and the
prototype; re-run `python3 scripts/build-report-html.py` after they are filled.*
