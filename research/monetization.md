# Monetization: what anglers and fishing businesses already pay for

Monetization Agent, 2026-10-20 (all access dates 2026-10-20 UTC). Source IDs are `P` rows in
section 11. Numbers without a `P` row do not appear here. "snippet" in a row means the page was
read only through a search-result snippet (the page itself was rate-limited or blocked);
"estimate" rows show their derivation.

Research-environment limits: the shared WebSearch budget ran out at roughly two-thirds of the
plan, and six pages returned HTTP 429 on every retry (Rick's Reel Service, PENN service page,
Shimano service pages, Square's own pricing page, Reel Coquina, and the founder's Instagram
profile). Where that happened I used the search snippet and said so. reddit.com and Trustpilot
were blocked; quotes come from fishing forums, App Store review pages and vendor community forums.

## 1. Summary

- **S1 — Consumer price bands are narrow and proven.** The dominant annual price for fishing
  apps is $35–$60/yr (onX Fish $34.99 [P12], Omnia Core/PRO $39/$59 [P29], TroutRoutes Pro
  $39.99–$58.99 [P27], Navionics $49.99 [P15], Fishing Points $49.99 [P18]); forecast and
  education products sit at $80–$140/yr (Fishbrain $79.99 [P8], FishTrack and Buoyweather
  $95.99 [P19][P23], Bass University $139.99 [P52]). Monthly is $9.99–$16.99 everywhere.
- **S2 — The biggest paying base is small in absolute terms.** Fishbrain, the category leader,
  projected 305,000 paid subscribers for end-2022 on $10.4M 2021 revenue (unaudited) [P11]; a
  third-party tracker now estimates ~$700K/month [P10, estimate]. Everyone else is a fraction
  of that (ratings counts: Fishbrain 76K, Fishing Points 31K, FishTrack 6.3K, TroutRoutes 3.9K,
  Navionics 2.4K, onX Fish 1.8K, Buoyweather 1.1K, Fish Rules 198) [P8][P18][P19][P27][P15]
  [P13][P23][P24].
- **S3 — Subscriptions provoke visible backlash.** Navionics sits at 2.9 stars with reviews like
  "When I first bought the app it was $15, then jumped to $30, going to $50 on renewal... I'm not
  paying another penny" [P16]; a Fishbrain review aggregator reports ~40% of complaints about
  paywalls and ~15% about unexpected charges [P97]; Windy's $25.99→$34.99 rise produced "I will
  opt out" posts [P21]. The hobby tolerates ~$3–5/month but punishes price rises and lost
  "lifetime" promises.
- **S4 — Anglers spend far more on things than on information.** Average fishing-equipment spend
  is $217 per angler per year ($297 per spender; 73% buy any) within $2,490 total per angler
  [P89]; rods and reels alone are $2.3B/yr, lures $1.3B, tackle boxes $475M [P90]. A $40/yr app
  is 1.6% of the average angler's annual fishing outlay.
- **S5 — Reel servicing is a real, priced, fragmented service.** Seven independent shops publish
  price lists: $25–$50 for a freshwater spinning/baitcast clean, $35–$100 for saltwater, $40–$85
  for premium models, parts extra, plus $10–$20 return shipping; turnaround ranges from
  "10 Day" to "8 Week"; most take orders by email, phone, or a printed form in the box, and
  several close for months in season [P67–P73]. Manufacturers (PENN, Shimano, Daiwa) charge
  $10 handling plus $20–$50 labor and quote 20–30 business days [P75–P78].
- **S6 — B2B software prices that fishing businesses already pay:** marketplaces take 10–30%
  (FishingBooker, captains choose; most-booked pick 15–20%) [P39][P40]; booking software adds a
  6–8% customer-paid fee (FareHarbor) or card-rate-only (Xola 2.39% + $0.30) [P99][P100];
  tournament platforms charge $5–$6.50 per angler (TourneyX) or 6.5% angler-paid (Weighfish)
  with nothing from the director [P56][P57][P61]; general small-business SaaS runs $39–$149/mo
  (Shopify $39, Square Appointments Plus $49, RepairDesk $99, Lightspeed $89, Wild Apricot $66,
  Dockwa $169+) [P102][P103][P104][P108][P110][P111].
- **S7 — The strongest B2B angle for this founder is reel-repair job tracking.** No
  fishing-specific repair software exists [P113]; the shops found run on email, phone, PayPal
  invoices and paper forms [P67–P72]; general repair-shop SaaS is priced $69.99–$149/mo
  [P111][P112], which is too much for a one-person reel shop doing $25–$50 jobs. A $19–$39/mo
  tool is a plausible band, but the buyer pool is small (estimate 250–750 US shops [P123]).
- **S8 — Tournament organisers are the second angle:** the three incumbents already prove
  per-angler pricing at club level and have processed 18,000 (FishDonkey), 40K+ (Fishing Chaos)
  and 1,300 in 2025 (Weighfish) events [P59][P60][P61]. The model works; the slots are taken.
- **S9 — The founder's brand gives no measurable distribution advantage today.**
  stormprooftackle.com is a WordPress template with Lorem-ipsum testimonials, placeholder team
  members and template stats ("100+ active workers") [P1][P2]; its Shop lists six generic
  products ($2–$55) [P1]; its real services are a $30 spinning-reel service and $10+ guide
  replacement with drop-off at a Virginia Beach distributor [P3][P4]. The site links an
  Instagram (@stormprooftackle) and a Facebook page [P6], but the Instagram follower count
  could not be retrieved (HTTP 429 ×4) [P7]. The advantage is trust and persona-fit for a
  repair-shop tool, not reach.
- **S10 — Willingness to pay is lower than the headline numbers:** 31–32% of anglers fish
  monthly or more (down from 41% in 2007) [P114][P115]; a third to half of self-described
  anglers do not fish in a given year [P90]; 33% of adult anglers are 55+ [P90]; free
  incumbents exist for regulations (Fish Rules free with the Gulf Council) [P25], weather
  (Windy free tier) [P20] and spooling (free at Bass Pro and Cabela's) [P81]. Churn is seasonal
  and structural.

## 2. Consumer subscriptions anglers pay for

| Product | Price | What the paid tier adds | Evidence of paying base | Src |
|---|---|---|---|---|
| Fishbrain Pro / "Power Fishing Package" | $12.99–$14.99/mo; $41.99/qtr; $79.99/yr (App Store); Android 2022 deck: $7.99/mo, $59.99/yr | Navionics/C-MAP depth charts, "BiteTime" forecasts, Top Baits, private waypoints, regulations in 30+ states | 4.7★ / 76K ratings; 2021 revenue $10.4M (unaudited); +15% paying subs 2021; projected 305,000 paid subs end-2022; 15% GMV commission on gear marketplace; third-party est. ~$700K/mo revenue, 200K downloads/mo (undated); ranked 7th top-grossing US iPhone Sports (undated) | P8, P9, P10, P11, P118 |
| onX Fish (Midwest) | $34.99/yr after 7-day trial; 13 states | Species/lake filters, contour maps, regulations, stocking history, private-land layer, offline maps | 4.6★ / 1.8K ratings (launched 2023) | P12, P13 |
| onX Hunt (comparator from the same company) | Premium (one state) $34.99/yr; Premium+ two-state $49.99; Elite nationwide $99.99/yr or $14.99/mo | Landownership, public land, offline | — (pricing only) | P14 |
| Navionics Boating (Garmin) | $49.99/yr US & Canada; $59.99 Central/West Europe; $69.99 Adriatic; Wavve guide: USA-only $39.99, Worldwide $99.99, up from $24.99 in 2023 | Chart downloads, SonarChart, updates; "Downloading map areas requires an active subscription" | 2.9★ / 2.4K ratings; reviews complain of $15→$30→$50 renewal path | P15, P16, P17 |
| Fishing Points: Map & Forecast | Premium $9.99/mo; Yearly $49.99; Basic $29.99 | Nautical charts, forecasts, tides, moon | 4.7★ / 31K ratings | P18 |
| FishTrack | $14.99/mo; $95.99/yr (also "FishTrack.com & App" $79.99) | SST/chlorophyll charts, offshore forecasts | 4.6★ / 6.3K ratings; last update 10/09/2024 | P19 |
| Windy Premium | App Store IAP $24.99 / $29.99 (one-time 1-yr) / $2.99; forum: renewal rose $25.99→$34.99 from 28 Dec 2024 | 1-hour & 15-day outlook, 4–6× daily updates, radar archives, model comparison | 4.8★ / 80K ratings (general weather app, not fishing-only) | P20, P21 |
| Buoyweather Premium | $14.99/mo; $95.99/yr; "1 Year" $79.99 | 16-day wind/wave/tide, multiple saved spots | 4.7★ / 1.1K ratings | P23 |
| Fish Rules | Free; "ProStaff" $29.99 IAP; paid reef maps; ad removal; free versions funded by Gulf Council partnership | Pro ID help, reef locations, no ads | 3.9★ / 198 ratings; "Contains Advertising" | P24, P25 |
| FishVerify (regulations/ID comparator) | $5.99/mo; $29.99/yr; $6.99 scan pack (5 scans) | AI fish ID + regs | — (pricing only) | P26 |
| TroutRoutes | Pro $39.99/yr (also listed $58.99/yr) or $9.99/mo; Single-State $19.99/yr; 7-day trial | 50,000+ trout streams, 280,000 access points, public land, offline | 4.5★ / 3.9K ratings; Fly Fisherman lists Pro at $58.99 | P27, P28 |
| Omnia Fishing membership | Core $39/yr; PRO $59/yr (older: Premium $29/yr, PRO $49.99) | C-MAP/Navionics contours in the shopping app; 5%/10% credit back; free shipping | — (retailer loyalty; no subscriber count) | P29, P30 |
| B.A.S.S. membership | $34/yr; $750 life; $40 international | Bassmaster magazine, members area, tournament eligibility, "$50 in free gear" | B.A.S.S. Nation 30,000+ members, clubs in 47 states (2018) | P31, P33 |
| B.A.S.S. Nation club dues (national portion) | $30/yr from 1 Sep 2023; discounted B.A.S.S. membership $10 | Club affiliation, state/national qualifier path | 958 HS clubs / 10,585 anglers (2018) | P32, P33 |
| MLF Phoenix Bass Fishing League (entry, not membership) | 2026: $200 boater / $100 co-angler per qualifier; $300/$150 Super Tournament; $350/$175 Regional | 20% of field cashes; $4,000 top boater at 100 boats | 24 divisions × 4 qualifiers + 24 Supers + 6 Regionals in 2026 | P34, P35 |
| Trout Unlimited | Regular $45; Contributor $50; Family $55; Sponsor $100; Conservator $250 (national form, 2026). Chapter pages still show $35 regular, $20 senior, $12 youth (undated) | TROUT magazine, chapter access, gear discounts | 350,000+ "members and supporters", 400+ chapters (2025) | P36, P37, P38 |
| FishingBooker (marketplace take rate) | Captain chooses 10%–30% commission in 5% steps; no listing or subscription fee; "most bookings" captains pick 15%–20%; marketing claim: "25–30% most platforms take" | Listing, instant book, payments, reviews | 9,463 captains evaluated for the 2026 award (8,732 for 2025) | P39, P40, P41, P42, P43 |
| Captain Experiences | Free listing; commission on completed trips, rate not published; QR-code payout via Stripe; "bring 20% cash as a tip" | Marketplace | "over 2,000 Damn Good Guides" (Aug 2023) | P44, P45 |
| Guidesly | Commission per booking, rate not published; "Guidesly Pro" tools, price not published; claims guides "earn up to $8,100/month" | Marketplace + guide CRM | — | P46, P47 |
| Bass University (education) | $16.99/mo; $139.99/yr (older pages: $14.99 / $149.99) | 1,300+ seminar videos | 4.8★ / 146 ratings | P52 |
| Salt Strong Insider Club (education/community) | Not published; testimonial "For $97 a year" | Spots app, courses, gear discounts, coaching calls | "65,000+ Salt Strong Insiders" (self-reported; page also says 60,000+) | P53 |
| Local bass club dues and entry fees | Dues $30–$120/yr (forum range), e.g. $35/yr; club events $30–$50 per boat (FL listings), $40 per event (RI, 2014), $75 per boat high end | Club series, points, big-bass pots; ~90% paid back | — | P54, P55 |

Note on conflicts: Fishbrain, TroutRoutes and Omnia each show two live price points (App Store
IAP lists carry old and new SKUs). I used the App Store list as the primary source and the
company page where one existed (Omnia). Navionics' App Store price ($49.99) and the Wavve guide
agree for US & Canada.

## 3. One-time purchases (what "information" costs when sold once)

| Item | Price | Notes | Src |
|---|---|---|---|
| Garmin Navionics+ chart card (microSD) | $149.99–$199.99 by region (Bass Pro); update card $139.95 (The GPS Store) | Replaced by the app's $49.99/yr for phone use; card still required for plotters | P63, P64 |
| Garmin LakeVü G3 US inland card | $129.95; BlueChart+LakeVü update $107.95 | — | P64 |
| Garmin LiveScope Plus (transducer + module) | $1,700 | Head unit extra; bundle example $2,999.99 (ECHOMAP Ultra 2 10") | P65, P66 |
| Humminbird MEGA Live (transducer) | $1,500 (gen 1); XPLORE 9 + MEGA Live 2 bundle $2,599.98 | — | P65, P66 |
| Windy Premium one-time | $29.99 for one year (non-renewing) | Anglers prefer non-renewing options; Windy offers both | P20 |
| FishVerify scan pack | $6.99 for 5 scans | Micro-transaction alternative to subscription | P26 |
| Fish Rules ProStaff | $29.99 (listed as single IAP) | — | P24 |
| Reel upgrade parts (sold with service) | Ceramic bearings "starting at $9.95 ea." (2–3 needed); Carbontex drag washers $8–$10; Boca tuning upgrade $39.99 | Upsell on a $26.95 service | P72 |
| Courses (comparator) | Bass University yearly $139.99; live classes $24.99 (subscribers) / $49.99 (non-subscribers) | — | P52 |

Books and generic online courses were not researched before the search budget ran out; the
Bass University and Salt Strong rows stand in for the education band.

## 4. Services anglers pay for

### 4a. Guide and charter trips

| Trip type | Price | Source quality | Src |
|---|---|---|---|
| Half-day (4 h) inshore, mid-market coastal | $400–$600 (2026) | Vendor pricing calculator (Reservety); not a survey | P83 |
| Half-day inshore, premium destinations (Keys, OBX, Cape Cod) | $650–$900 | same | P83 |
| 4-h offshore | ~$1,000 baseline; $1,800–$2,500 premium markets | same | P83 |
| Kona half-day / full-day | $800–$1,500 / $1,500–$3,000+ by boat and season | Marketing guide (snippet) | P84 |
| Florida average (blog, date unclear) | $527 full day; $415 half-day | Charter operator blog (snippet) | P85 |
| Deposit practice | Deposits 10–30% of trip price; balance paid to captain by cash, card or platform; card fees "typically around 2–5%" passed to customer | FishingBooker help (snippet) | P86 |

### 4b. Reel servicing (independent shops with public price lists)

| Shop (location) | Freshwater spinning / baitcast | Saltwater / conventional | Premium or lever-drag / 2-speed | Fees | Turnaround | How they take orders | Src |
|---|---|---|---|---|---|---|---|
| Stormproof Tackle Co. (Virginia Beach, VA) — the founder | Spinning reel service $30.00 | "Small conventional" and "Large conventional / lever drag" listed, no price | Stormproof Upgrade (ultrasonic, bearings, carbon drag), no price | Repairs: "$0.00" heading, "basic service charge will incur at the time of inspection"; guide replacement from $10 | Not stated | "Service Request" web form; "Book NOW" button links to "#"; phone/email; drop-off at Princess Anne Distributing Co. | P1, P3, P4, P5 |
| Valley Reel Works (Rock Hill, SC) | $25 (+$5 if very dirty) | $35 spinning/conventional; Bait Runner $35 | Lever drag $40; 2-speed $45 | Repairs from $20 + parts; estimate $15 (waived if done); return ship $13.50 + $2/addl | Repairs 5–7 business days | Contact form / email; invoiced after work; cash or card | P67 |
| Mat's Reel Repair (Eagle River, WI; prices 10/09/23) | Standard $35; Select $60 | Saltwater $100 | Premium (Stella, Steeze) $80 | $20 minimum; $20 estimate; $10 reassembly; +$10 very dirty; expedited 2×; line winding $5; return ship $15.50 + $2 | "as quickly as possible"; expedited ~1 week | Printed Reel Service Form in the box; phone/email; cash, check, card, PayPal | P68 |
| Dave's Reel Service (Vernon Hills, IL) | Basic freshwater $50 | Saltwater spinning/trolling $100 | Musky $75; select Shimano/Daiwa $85; salt corrosion surcharge $25; rush +$25 | Return ship min $20; unrepaired reels $20 | "8 Week Turnaround on all repairs"; closed Aug 25–Oct 15 | Download/print Service Request Form; phone/email | P69 |
| Fischer Angling (Houston, TX) | Baitcast $28.75 | — | Large casting $39.75; dual speed $50; super tuning $44.25 | — | "10 Day Turnaround*"; vacation Jul 15–Sep 15 | Online product pages (checkout per reel type) | P70 |
| Rod & Reel Repair Guy (Valley, AL) | Re-lube $25; overhaul $30; super-tune $40 | Saltwater $45 | — | Diagnose $15; bagged/dirty +$15; shipping $9.95 + $2 | Not stated; "will reopen on 9/21/2026" | Call/text; contact form; mail-in by appointment | P71 |
| Delaware Valley Tackle (Fort Plain, NY) | Deep cleaning $26.95; econo $18 | — | Tuning upgrade $39.99 (+ bearings from $9.95, Carbontex $8–10) | Shop rate $20/hr after 1.5 h; parts and shipping extra | "varies by season", first come first served | Printable work order in box; USPS; check/money order/PayPal; pay in full before return | P72 |
| Rick's Reel Service (snippet; site rate-limited) | Basic spinning $40; advanced $42–$55 | Standard conventional $40 | Lever drag/large trolling $40–$55; higher for 2-speed | — | — | — | P73 |

Manufacturer service: PENN charges "$10.00 per reel processing & handling" plus flat labor by
model (table "effective January, 2014": $20 Fierce, $25 Battle/Spinfisher, $50 Internationals),
parts at list, UPS shipping, payment by phone [P75]. Shimano US repairs out-of-warranty "for a
specific fee" after an estimate; bearings are not covered; two direct centers (Ladson SC, Irvine
CA) plus 26 satellite centers per dated press [P79][P80]. Shimano Australia: ~AUD $30 reel /
$50 game reel labour, 20 business days [P76]. Daiwa Australia: $40 standard / $70 tournament /
$100 electric ex-GST, 20–30 business days [P77]; Daiwa NZ: $50 basic spin / $80 premium [P78].

Read-across: the independent shops undercut or match manufacturers on price and beat them on
turnaround, but every one of them runs intake by email, phone, PayPal invoice or a paper form,
and three of seven close for 4–8 weeks in peak season [P69][P70][P71].

### 4c. Rod repair and line spooling

- Rod guides and tips $12; re-guide entire rod "$40.00 On Up"; handle/reel seat "$30.00 On Up";
  custom rods $185–$275+ [P71]. Tip replacement $5 + tip; single-foot guide $10; rear cork $20
  (Ed's, MN) [P74]. The founder's own basic guide replacement "starts at $10" [P4].
- Spooling: Cabela's and Bass Pro spool free (line charged if not yours); Dick's ~$5 labor
  [P81]. Forum: 150 yd PowerPro 20# ~$15; by the yard "$.09–.10"; shops put line on free if
  bought there [P82]. Mat's: $5 per reel if you supply the line [P68]. Spooling is a loss-leader,
  not a revenue line.

### 4d. Tournament entry fees and clubs

- Club level: $30–$50 per boat (FL listings), $40 per event (RI club, 2014), $75 per boat high
  end with ~90% payback; dues $30–$120/yr [P54][P55]. Team trails ~ $400 per team; an angler
  "typically spends about $2,000 on a single tournament" all-in (2020 newspaper survey cite)
  [P88].
- Regional trail (MLF BFL 2026): $200/$100 qualifiers, $300/$150 Supers, $350/$175 Regionals
  [P34][P35].
- Reader letter on rising fees: "the entry fees have been on the rise as well ... This poses a
  challenge for many anglers, particularly those with limited financial means" [P87].
- Platform fees on top of entry: TourneyX $5 (2017) → "$6.50 per angler" (from Jan 2024)
  [P56][P57]; Weighfish 6.5% ($1 min) paid by the angler [P61]; FishDonkey "Fishermen pay a
  service fee", amount unpublished [P59]; Fishing Chaos ticketed events e.g. $35 / $55 with
  shirt [P62].

### 4e. Tackle subscription boxes

Mystery Tackle Box (Catch Co.): Regular $19.99/mo, Pro $31.99, Elite $44.99, plus $4.99 shipping
on monthly plans (free on 4- and 6-month prepay) [P48]. Trajectory: $15/mo and ~200 subscribers
in its first week (Jul 2012) [P50] → "55,000 anglers subscribe" (Oct 2016) [P49] → Catch Co.
"nearly $300 million in revenue since its inception in 2012", sold to Gordon Brothers in March
2024 (press snippet) [P51]. No current subscriber count is published.

## 5. Gear spend tied to specific problems

| Signal | Value | Src |
|---|---|---|
| Total fishing spend per angler (2022, age 16+) | $2,490 avg per angler; $2,558 per spender; 38.9M spenders (97%) | P89 |
| Fishing-equipment spend per angler | $217 avg per angler; $297 per spender; 29.1M spenders (73%); $8.66B total | P89 |
| Trip spend per angler | $917 avg; $36.6B total | P89 |
| Tackle category sizes (2022) | Rods & reels $2.3B; lures $1.3B; lines & leaders $867M; hooks/sinkers $838M; depth finders & electronics $782M; tackle boxes $475M; creels/nets $440M | P90 |
| Lure spend, earlier survey (2016) | $852M lures/flies/bait; $367M hooks/sinkers | P92 |
| Lost-lure spend | **No survey found.** Only the lure category total exists. Estimate not attempted; any "lost lure" number would be invented. | — |
| Replacement reels because of no maintenance | **No quantitative evidence found.** Forum evidence only: "For $60 you are almost at the cost of a new reel" (refusing manufacturer service) [P93]; "spend $25 a year on simple maintenance" lets an expensive reel last 10+ years [P94]; a $20–30 cleaning "is more than some of the reels I have are worth!" [P94]. The economics only favor service for reels above roughly $100–$150, which bounds the serviceable market to premium owners. | P93, P94 |
| Organisation products as a proxy for inventory pain | Tackle boxes are a $475M/yr category [P90]; Plano was the most-purchased storage brand in a 2014 Southwick survey and sells 170+ storage SKUs [P91]. Nobody publishes a "lost track of my tackle" number. | P90, P91 |

Derived (estimate, P121): the 29.1M anglers who buy any equipment spend $297 each; the annual
reel-service price ($25–$50) is 8–17% of that figure, so a serviced reel is a plausible
once-a-year purchase for the "spender" cohort but not for the 27% who buy nothing.

## 6. Willingness-to-pay signals (verbatim)

| # | Quote | Price mentioned | Stance | Where / when | Src |
|---|---|---|---|---|---|
| 1 | "When I first bought the app it was $15, then jumped to $30, going to $50 on renewal." ... "I'm not paying another penny." | $15→$30→$50/yr | Refuse (Navionics) | App Store review, Rick in MA, 10/03/2023 | P16 |
| 2 | "It's hard to believe that a $50 annual subscription doesn't buy better software support" | $50/yr | Paying, unhappy (Navionics) | App Store review, ErikExp, ~Mar 2025 | P16 |
| 3 | "it costs $9.99 to renew the subscription, that does not auto-renew, for a whole year." | $9.99/yr | Happy to pay (Navionics, 2018 pricing) | App Store review, danthefiaherman, 07/24/2018 | P16 |
| 4 | "Ill probably buy it every year until they stop updating the maps." | annual | Pays (Navionics) | App Store review, Smelly mole, 01/16/2020 | P16 |
| 5 | "I'm forced to pay twice for the info" ... "Having to pay full price for both is a sleazy tactic." | 2 × full price (card + app) | Refuse double-pay (Navionics) | App Store review, Bsangs, 07/18/2025 | P16 |
| 6 | "I will not be renewing my subscription" | — | Churn (Navionics) | App Store review, Angler chick, 07/12/2023 | P16 |
| 7 | "Ever since the previous update I feel I'm not getting the value I was but still paying the same price." | same price | Paying, at risk (Fishbrain) | App Store review, GingerGoo, 07/31/2024 | P8 |
| 8 | "I was charged $80 without warning and have struggled to get a refund, which is very disappointing." | $80/yr | Billing complaint (Fishbrain) | Review aggregator, Oct 2026 | P97 |
| 9 | "The app used to be good, but now everything is hidden behind a paywall, making it virtually unusable." | — | Refuse paywall (Fishbrain) | Review aggregator, Oct 2026 | P97 |
| 10 | "from $25.99/year to $34.99/year starting on December 28, 2024." ... "Thanks for a good site, but I will opt out." | $25.99→$34.99/yr | Churn on price rise (Windy) | Windy community, howi / MikeOhSee | P21 |
| 11 | "as well as the increased price, are the main reasons for me to cancel my premium account." | $34.99/yr | Cancel (Windy) | Windy community, icpart | P21 |
| 12 | "No new features but raise the price of "Premium" 25% just because you haven't in the past?" | +25% | Opposed (Windy) | Windy community, mprosto | P21 |
| 13 | "I can't justify paying $30 a year for an android app even though I use it every single day." ... "I'd rather have 10, $10 subscriptions than 2, $30 subscribers." | $30/yr vs $10/yr | Refuse at $30, would pay $10 (Windy) | Windy community, Christopher 0 | P22 |
| 14 | "It literally 8.2 cents a day. Sheesh!" / "it is 20$ per year so 0.055$ a day!" | ~$20–30/yr | Pays, defends price (Windy) | Windy community, aftcg / Yves70 | P22 |
| 15 | "Local tackle shop charges to clean and grease $25" ... "Let them clean it once through for $25" | $25 | Pays for reel service | SurfTalk (StripersOnline), dleopoldi914, Apr 2017 | P93 |
| 16 | "For $60 you are almost at the cost of a new reel." | $60 (PENN estimate $40–45 + fees) | Refuse manufacturer service; DIY | SurfTalk, nowildwood, Apr 2017 | P93 |
| 17 | "it is more than some of the reels I have are worth!" (on $20–$30 cleaning) | $20–$30 | Hesitant | NW Fishing Reports, TrackerPro16, Dec 28, 2017 | P94 |
| 18 | "He charges $20." ... "$20 cleaning charge -VS- $1.50 IPA" | $20 | Pays, cheap relative to beer | NW Fishing Reports, AJ's Dad, Dec 2017 | P94 |
| 19 | "He was $25 for clean and lube, and maybe $10 for upgraded drags." ... "spend $25 a year on simple maintenance" | $25 + $10 | Pays yearly, worth it for 10+ yr reel life | NW Fishing Reports, The Quadfather, Dec 2017 | P94 |
| 20 | "it'd cost too much having all my reels serviced yearly" | — | Pays for some reels only (every other year) | NW Fishing Reports, spokey9, Dec 2017 | P94 |
| 21 | "The Basic Service for the SX Raptor cost $44." ... "I think it was worth it considering this was the first service I paid for in 5 years." | $44 + $14 + $24.25 shipping | Pays, once in 5 years (Avet) | Hawaii Nearshore Fishing, Oct 20, 2025 | P96 |
| 22 | "I think they charge 10 bucks for a complete cleaning and service." ... "They do terrific work at very reasonable prices." | $10–$20 | Pays (2009 prices) | FishingTX, Scotta/Craig, Aug 2009 | P95 |
| 23 | "I usually spool my own reels b/c it's cheaper." | — | Refuse spooling fee | Charleston Fishing forum, C_Tackle, Feb 2010 | P82 |
| 24 | "I can't complain about the amount of bookings I receive from FB" ... "Seems to me it is still all about the $$$$ commissions." (listing "close to bottom at 10%") | 10% commission | Captain pays 10%, suspects ranking by commission | FishingBooker blog comment, Capt Marc Laurin, May 27, 2022 | P40 |
| 25 | "the entry fees have been on the rise as well" ... "This poses a challenge for many anglers, particularly those with limited financial means" | — | Price resistance (tournaments) | On The Line reader letter, Oct 8, 2023 | P87 |

Pattern: anglers readily pay $20–$50 once a year for a tangible outcome (a serviced reel, a
chart year) and defend prices under ~$30/yr as "pennies a day"; they resist (a) renewals that
climb, (b) paying twice for the same data, (c) any charge that approaches the price of the
underlying gear, and (d) fees on top of a tournament entry.

## 7. B2B / B2B2C angles

For each: how they work today, software and price, buyer count (with derivation), sales cycle,
and the realistic no-ad path to the first 10 paying customers in 90 days.

### 7a. Guides and charters

- **Today:** marketplace listings (FishingBooker 9,463 captains in the 2026 award pool [P41];
  Captain Experiences "over 2,000" guides [P45]) plus direct bookings by phone; deposits 10–30%,
  balance paid at the dock by cash or card, card fees 2–5% passed on [P86]; Captain Experiences
  settles the balance by QR scan through Stripe and tells customers to bring 20% cash for the
  tip [P44].
- **Software and price:** FishingBooker 10–30% commission, captain-chosen, no subscription
  [P39]; Captain Experiences commission (unpublished) [P44]; Guidesly commission (unpublished)
  + "Guidesly Pro" (unpriced) [P46][P47]; FareHarbor: no subscription, 6–8% booking fee added at
  checkout and paid by the customer, operator pays processing ~2.9% + $0.30 [P99]; Xola: "No
  subscriptions", customer-paid partner fee, 2.39% + $0.30 cards [P100]; Peek Pro: quote only,
  reported ~6–8% per booking [P101]; Square Appointments: Free / Plus $49 / Premium $149 per
  location per month, 2.6% + 15¢ in person [P102]; a small competitor (Guidr) charges guides a
  10% fee per booking [P119].
- **Buyer count:** IBISWorld estimates 5,773 US fishing-boat-charter businesses in 2026 [P106];
  FishingBooker's pool is worldwide; NOAA counted 1,904 active Great Lakes charter captains in
  2011 [P107]. Estimate (P122): 6,000–10,000 US for-hire operators (IBISWorld 5,773 as a floor;
  part-time guides without a NAICS registration push it higher).
- **Sales cycle:** days to weeks per captain, but seasonal: captains buy tools in the off-season
  (Nov–Feb for most of the US) and will not switch mid-season. The incumbents charge the
  customer, not the captain, so a captain-paid subscription is a harder sell than another
  "free to you" marketplace.
- **90-day path to 10 payers:** direct, in-person outreach to the Hampton Roads / Chesapeake
  charter fleet (local operator count not researched; Virginia Beach is a charter port),
  offering a customer-paid booking fee of 3–5% (below FareHarbor's 6–8% [P99]) rather than a
  monthly fee. Risk: the first ten will ask why not FishingBooker, which already brings them
  customers at a captain-chosen 10% [P39][P117].

### 7b. Tackle shops

- **Today:** POS plus Shopify for online; NOAA's 2013 study frame had 3,514 independent coastal
  bait-and-tackle businesses, average $426,000 in saltwater bait/tackle sales each [P105].
- **Software and price:** Shopify Basic $39/mo ($29 annual), Grow $105, Advanced $399; POS Pro
  +$89/location [P103]; Lightspeed Retail $89 / $149 / $289 per month, 1.5% card-present
  [P104]; Square (same tiers as above) [P102].
- **Buyer count:** estimate (P124) at least 7,000 independent shops: 3,514 coastal (2013 frame,
  P105) plus inland shops serving 35.1M freshwater anglers vs 12.7M saltwater [P90]; the inland
  count is unmeasured, so this is a floor with low confidence.
- **Sales cycle:** owner-operated, cash-poor, seasonal; replacing a POS is a multi-month decision.
  Add-on tools (a reel-service intake module, a spooling log, a consignment-reel ledger) that
  sit beside the POS are a faster sale than replacing it.
- **90-day path:** the founder's drop-off partner (Princess Anne Distributing Co. [P1]) and the
  Hampton Roads shops he already knows; sell a $29–$49/mo "service counter" add-on. Ten shops in
  90 days is achievable only locally and in person.

### 7c. Tournament organisers

- **Today:** three platforms own club and trail formats. TourneyX: "$6.50 per angler" from Jan
  2024, invoiced after the event via PayPal or deducted via Stripe; "no contracts, monthly or
  annual fees" for directors; 115.9k active anglers, 144 active tourneys [P57][P58][P116]. FishDonkey: "It is FREE to host a tournament", anglers pay an
  unpublished service fee; 18,000 tournaments and 171,000 anglers as of 10/11/2025 [P59].
  Fishing Chaos: "40 K+" tournaments, no public pricing [P60]. Weighfish: angler pays 6.5% ($1
  min), "You receive the full fee"; 1,300+ tournaments and 24,000+ entries in 2025; Free / Pro /
  Elite director plans [P61].
- **Buyer count:** B.A.S.S. Nation alone had 30,000+ members and clubs in 47 states (2018)
  [P33]; MLF BFL runs 96 qualifiers + 24 Supers + 6 Regionals in 2026 [P34]. Estimate (P125):
  10,000–25,000 club-level bass events per year in the US (≈2,000 affiliated adult clubs if
  30,000 members ÷ ~15 per club, × 5–8 events each, plus non-affiliated clubs and kayak series;
  low confidence). FishDonkey's cumulative 18,000 since ~2016 (≈2,000/yr) and Weighfish's 1,300
  in 2025 show that platforms capture a small share of that.
- **Sales cycle:** one decision per club per season, made in winter by a volunteer director;
  price sensitivity is extreme because fees come out of the angler's entry.
- **90-day path:** the only open wedge is a format the incumbents under-serve (e.g. weigh-in
  clubs that refuse photo judging, or saltwater/pier/club-points series). Ten clubs in 90 days
  would require the founder to already sit in those clubs; the model (per-angler $5–6.50, zero
  to the director) is proven but the field is crowded.

### 7d. Clubs (membership and dues)

- **Today:** dues $30–$120/yr collected by hand, PayPal or a membership platform; B.A.S.S.
  Nation club dues $30/yr national portion [P32]; TU chapters route everything through the
  national office [P37].
- **Software and price:** Wild Apricot $66/mo for 100 contacts ($59.40 annual) [P108]; tiers
  $63–$556/mo by contact count [P109].
- **Buyer count:** B.A.S.S. Nation clubs (estimate ~2,000, P125) + 958 HS clubs [P33] + 400+
  TU chapters [P38]. Most are too small to pay $66/mo; a $10–$20/mo club tool is the band.
- **Sales cycle and path:** same volunteer-director dynamics as 7c; realistically a feature of
  a tournament product, not a standalone business.

### 7e. Marinas

- **Today / software:** Dockwa sells modular SaaS: Transient from $169/mo, Captains & Contracts
  from $180, Point of Sale from $249, Fuel $199, add-ons $84–$139, "Trusted by 4,000+ Marinas
  and 500,000+ Boaters" (vendor claim) [P110].
- **Fit:** marinas are a boating, not fishing, buyer; the price band ($169–$249/mo per module)
  and the incumbent make this a poor solo-founder angle. No further work recommended.

### 7f. Reel repair shops (the founder's own trade)

- **Today:** intake by phone, email, contact form or a printed form shipped with the reel;
  estimates by email; payment by PayPal, check, card over the phone or cash on pickup; return
  shipping quoted per reel; turnaround communicated as a blanket statement ("8 Week
  Turnaround", "10 Day Turnaround*") or not at all [P67–P72]. Three of seven shops close for
  4–8 weeks at a time [P69][P70][P71]. The founder's own site has a "Book NOW" button that links
  to "#" and a web form [P1][P3].
- **Software and price:** nothing fishing-specific exists [P113]. General repair-shop SaaS:
  RepairDesk Essential $99/mo ($79 annual), Growth $149 [P111]; RepairShopr Starter $69.99,
  Repair Shop $139.99, Big Chain $149.99 [P112]; Digital Wrench $39.95/mo, RepairTRAX $30 per
  user, OpenRMA $185 one-time [P113]. Illustrative arithmetic (not a sourced figure): at the
  $25–$50 per-job prices in P67–P73, a shop doing 30 reels a month grosses ~$750–$1,500, so a
  $99/mo tool would be 7–13% of revenue, consistent with these shops running on paper and email.
- **Buyer count:** Shimano lists 2 direct + 26 satellite service centers (dated) [P80]; PENN and
  Daiwa publish no counts. Estimate (P123): 250–750 US independent reel-service businesses,
  from one search surfacing 7 shops with public price lists across 7 states and assuming 5–15
  per state; low confidence, and many are one-person side businesses.
- **Sales cycle:** the buyer is the founder's peer; trust is high, budget is tiny; a $19–$39/mo
  tool with Stripe checkout, intake form, status page and customer text/email updates is the
  realistic product. Annual revenue ceiling at full penetration: 750 × $29 × 12 ≈ $261K
  (estimate, P126), so this is a lifestyle business or a wedge, not a venture outcome.
- **90-day path to 10 payers:** (1) run it in his own shop first and publish the public status
  page; (2) post the before/after in the forums where reel-service customers and shops already
  talk (the threads in P93–P95 are examples); (3) offer the 7 shops above [P67–P73] and
  Shimano's 26 satellite centers [P80] a free season in exchange for a testimonial, aiming to
  convert 10 of the ~33 contacted. This is the one angle where the founder's trade is the
  distribution channel.

### 7g. Summary of B2B price benchmarks

| Buyer | Proven model and price | Who pays | Src |
|---|---|---|---|
| Guides/charters | 10–30% commission (marketplace); 6–8% customer-paid booking fee; or $49–$149/mo SaaS | Mostly the customer | P39, P99, P102 |
| Tackle shops | $39–$289/mo POS/e-commerce | Shop | P103, P104 |
| Tournament directors | $5–$6.50 per angler; or 6.5% ($1 min) angler-paid; $0 to director | Angler | P57, P61 |
| Clubs | $66/mo (100 contacts) | Club | P108 |
| Marinas | $169–$249/mo per module | Marina | P110 |
| Repair shops (general) | $69.99–$149/mo; $30/user; $185 one-time | Shop | P111, P112, P113 |

## 8. Pricing recommendation framework

Proven bands in this hobby:

| Band | Evidence | Verdict |
|---|---|---|
| Consumer annual $30–$60 (≈$3–5/mo) | onX Fish $34.99, B.A.S.S. $34, TU $45, Omnia $39–59, TroutRoutes $39.99, Navionics $49.99, Fishing Points $49.99 [P12][P31][P36][P29][P27][P15][P18]; forum users defend ~$20–30/yr as "8.2 cents a day" and balk at $30+ rises [P22][P21] | Safest consumer band; price annually, offer a non-renewing one-year option (Windy's $29.99 one-time model [P20]) |
| Consumer annual $80–$140 (≈$7–12/mo) | Fishbrain $79.99, FishTrack/Buoyweather $95.99, Bass University $139.99, Salt Strong ~$97 [P8][P19][P23][P52][P53] | Only for forecasting data or education with a visible outcome; smaller bases (6.3K, 1.1K, 146 ratings) |
| Consumer monthly $9.99–$16.99 | Every app above | Keep as the "try it" tier; expect seasonal churn (S10) |
| Physical subscription $20–$45/mo | Mystery Tackle Box [P48] | Works because it ships goods; irrelevant to a software-only product |
| B2B per-transaction (customer-paid) 3–8% | FareHarbor 6–8%, Weighfish 6.5%, TourneyX $6.50/angler [P99][P61][P57] | Best fit for guides and tournaments: the business pays nothing |
| B2B SaaS $19–$49/mo | Shopify Basic $39, Square Plus $49, Digital Wrench $39.95 [P103][P102][P113] | Upper limit for one-person fishing businesses; $99+ (RepairDesk, Lightspeed) is enterprise-feeling to them |
| Marketplace take rate 10–30% | FishingBooker (captain-chosen) [P39]; Fishbrain gear marketplace 15% GMV [P11] | Requires demand generation the founder cannot do without ads |

Models that worked / failed, with examples:

- **Freemium → subscription (worked at scale, with VC and backlash):** Fishbrain (305K projected
  payers, 2022; ~40% of complaints are paywall complaints) [P11][P97]; onX (hunt first, fish
  second) [P14][P12].
- **Paid-only data (worked, small):** FishTrack, Buoyweather, Bass University — stable, niche,
  low ratings counts [P19][P23][P52].
- **One-time → forced subscription (failed on reputation):** Navionics, 2.9 stars, reviews cite
  "lifetime access to the charts included" and $15→$50 renewal [P15][P16]. Do not sell
  "lifetime" and then convert.
- **Angler-paid platform fee, organiser pays nothing (worked at club level):** TourneyX,
  Weighfish, FishDonkey [P57][P61][P59].
- **Marketplace commission chosen by the seller (worked):** FishingBooker 10–30% [P39].
- **Loyalty membership that pays back credit (works for a retailer):** Omnia Core/PRO $39/$59
  with 5–10% back [P29] — only viable with a store attached.
- **Donation-framed subscription (works for a beloved free tool):** Windy, "considered as a
  donation with small advantages" [P22]; Windy also dropped its $2.99 monthly plan and keeps a
  one-time, non-renewing year "for users who do not want to enter subscription mode" [P120].
- **Affiliate:** no fishing example found with published numbers; Fishbrain's 15% GMV commission
  is the nearest proxy [P11].

Recommendation for a solo founder: price B2B at $19–$39/mo or 3–5% customer-paid per
transaction; price consumer at $29–$39/yr with a one-time non-renewing option; never above
$9.99/mo monthly; expect to need either a shipped good or a visible saved cost to exceed $60/yr.

## 9. Why willingness to pay may be lower than it looks

1. **Free incumbents.** Fish Rules regulations are free because the Gulf Council funds them
   [P25]; Windy's free tier is the product for most users [P20]; Bass Pro and Cabela's spool
   reels free [P81]; manufacturers service under warranty at no charge [P79].
2. **Ad-supported norms.** Fish Rules "Contains Advertising" at 3.9 stars with 198 ratings [P24];
   Fishbrain's paywall on "previously free features" is its top complaint theme [P97].
3. **Seasonality and churn.** Only 31–32% of participants fish monthly or more, down from 41% in
   2007 [P114][P115]; "a third to half of people who consider themselves anglers do not fish each
   year" [P90]; participation churn was "negative 23 percent in 2023" with half of lost
   participants over 45 [P114]. Repair shops themselves shut for 4–8 weeks in season [P69][P70]
   [P71]. Expect annual plans to lapse at the first off-season renewal.
4. **Older demographic.** Adult anglers by age (2022): 16–17 4%, 18–24 11%, 25–34 17%, 35–44 19%,
   45–54 16%, 55–64 17%, 65+ 16% — one-third are 55+, half are 45+ [P90]. The reel-service
   forum voices are explicitly DIY-first ("service reels yourself") [P93].
5. **Hobby budget competes with gear.** $217/yr average on fishing equipment, $695 on boats and
   big-ticket items, $917 on trips [P89]; a $20–30 cleaning "is more than some of the reels I
   have are worth" [P94]; "$60 you are almost at the cost of a new reel" [P93].
6. **Platform price drift is punished.** Windy's 35% rise and Navionics' $15→$50 path produced
   cancellations in writing [P21][P16]; a 15% billing-complaint share at Fishbrain [P97], whose
   third-party quality score fell 15 points in the 30 days to 2026-10-20 [P98].
7. **B2B buyers are volunteers or one-person shops.** Tournament directors pass every fee to
   anglers [P61]; repair shops gross $25–$50 per job [P67–P73]; the only businesses paying
   $100+/mo are marinas and retailers with POS needs [P110][P104].

## 10. Top 10 takeaways for the lead

1. The proven consumer price is $29–$49/yr; $80+/yr exists only for forecasting data or
   education, with much smaller bases. Price annually, keep monthly ≤ $9.99, offer a
   non-renewing year.
2. Fishbrain is the ceiling: $10.4M revenue (2021, unaudited, including marketplace) against
   ~250–305K paid subscribers, i.e. roughly $35–$40 per payer per year blended (my arithmetic
   on P11). A solo founder's realistic consumer target is 1–3K payers ($40–$120K/yr, P127), and
   only with organic distribution the founder does not currently have.
3. Reel servicing is a real $25–$100 per-job market run on paper, email and PayPal; nobody has
   built fishing-specific job tracking. It is the founder's strongest trust-and-persona fit, and
   its revenue ceiling (~$260K/yr at full penetration, estimate) makes it a wedge, not a venture.
4. Tournament platforms prove angler-paid per-entry pricing ($5–$6.50 or 6.5%) with the
   organiser paying nothing. Any tournament product must copy that or lose.
5. Guides pay commissions to marketplaces that bring customers; they will not pay a monthly fee
   for software that doesn't. If building for guides, price as a customer-paid 3–5% booking fee.
6. The founder's website undermines rather than builds trust (Lorem-ipsum testimonials,
   "100+ active workers", a dead "Book NOW" button). Fixing that is a prerequisite for any
   B2B pitch to peers.
7. Instagram reach is unverified (profile rate-limited); assume small until the founder supplies
   follower, post-cadence and engagement numbers. Do not plan on it as a distribution channel.
8. Spooling, tip repair and other "small" services are priced at $0–$12 and are loss-leaders;
   they cannot carry a product.
9. Anglers' written refusals cluster at price rises, paying twice for the same data, and fees
   approaching the gear's value. Design pricing to never trip those three.
10. The hobby is older (33% are 55+), seasonal (31% fish monthly) and DIY-leaning; plan on
    high first-renewal churn and sell outcomes (a serviced reel back in 7 days, an entry fee
    collected) rather than information.

## 11. Sources

| ID | Claim / number | Value | Publisher | URL | Published | Accessed | Used in |
|----|----------------|-------|-----------|-----|-----------|----------|---------|
| P1 | Stormproof Tackle Co. home: services list, Shop products ($18 Crossfire reel, $45 baits, $35 net, $55 kit box, $2 "Globeride", $25 "Spin"), template stats ("25+ Great Of Experience", "2500+ happy clients", "100+ active workers"), Lorem-ipsum testimonials, drop-off at Princess Anne Distributing Co., 700 21st St, Virginia Beach; "Book NOW" links to "#" | as listed | Stormproof Tackle Co. (founder) | https://www.stormprooftackle.com/ | © 2025; blog posts dated 2023-10-31 | 2026-10-20 | founder, 7f, S9 |
| P2 | About page: "started as a small hobby at the kitchen table"; placeholder team names with info@example.com; Instagram @stormprooftackle | — | Stormproof Tackle Co. | https://www.stormprooftackle.com/about-us/ | undated | 2026-10-20 | founder |
| P3 | Spinning Reel Service price; teardown, ultrasonic bearing clean, lube, test; order via "Service Request" form | $30.00 | Stormproof Tackle Co. | https://www.stormprooftackle.com/all-services/spinning-reel-service/ | undated | 2026-10-20 | 4b |
| P4 | Basic Guide Replacement "Pricing starts at $10" | $10+ | Stormproof Tackle Co. | https://www.stormprooftackle.com/all-services/basic-guide-replacement/ | undated | 2026-10-20 | 4b, 4c |
| P5 | Repair Services: "$0.00" heading; "basic service charge will incur at the time of inspection" | — | Stormproof Tackle Co. | https://www.stormprooftackle.com/all-services/repair-services/ | undated | 2026-10-20 | 4b |
| P6 | Contact page: Instagram https://www.instagram.com/stormprooftackle ; Facebook profile id 61581914922846; phone (757) 354-2128 | — | Stormproof Tackle Co. | https://www.stormprooftackle.com/contact-us/ | undated | 2026-10-20 | founder |
| P7 | Instagram profile metrics (followers, posts, cadence) | **not retrieved** (HTTP 429 on 4 attempts) | Instagram | https://www.instagram.com/stormprooftackle/ | — | 2026-10-20 | founder, S9 |
| P8 | Fishbrain US App Store: 4.7★, 76K ratings; Monthly Power Fishing Package $12.99 / $14.99; Premium $14.99; Quarter $41.99; Annual $79.99; Pro feature list; review GingerGoo 07/31/2024 "not getting the value I was but still paying the same price" | as listed | Apple App Store | https://apps.apple.com/us/app/fishbrain-fishing-app/id477967747 | v9.65.0, 2026-10 | 2026-10-20 | 2, 6, S1 |
| P9 | Fishbrain IAP tracker: Annual $79.99; monthly $9.99 and $12.99; quarterly $24.99; Premium $7.99/$5.99 (snippet) | as listed | App Pricing Lab (third party) | https://www.apppricinglab.com/iap/apple/477967747 | 2026-03 | 2026-10-20 | 2 |
| P10 | Fishbrain estimated monthly revenue and downloads; IAP $5.99 1-mo, $39.99 1-yr, $89.99 annual (older SKUs); "7th on the 'Top Grossing iPhone Apps' chart in the 'Sports' category" (rank from search snippet of the same page; undated) | **estimate (third party):** "$700K in monthly revenue and 200K in monthly downloads" | Adapty paywall library | https://adapty.io/paywall-library/fishbrain/ | paywall captured 2022-10-07; "latest info update" 2026-10-19 | 2026-10-20 | 2, S2 |
| P11 | Fishbrain investor pages: 2021 revenue "$10.4m ... unaudited management accounts"; subscription sales +15% YTD 2022; paying subscribers +15% in 2021; "projected 305,000 paid subscribers by the end of 2022"; ~20% CAGR paid users; 15% commission on marketplace GMV (snippets; both pages returned 403 on fetch) | as listed | Seedrs / Republic (company-issued crowdfunding pages) | https://www.seedrs.com/fishbrain and https://republic.com/fishbrain | 2022 | 2026-10-20 | 2, S2, 8 |
| P12 | onX Fish: "costs $34.99 per year" after 7-day trial; 13 states; paid adds filters, contours, regulations, offline | $34.99/yr | onX Maps (company FAQ) | https://www.onxmaps.com/fish/app/faq | 2026 | 2026-10-20 | 2, S1 |
| P13 | onX Fish Midwest App Store: 4.6★, 1.8K ratings; Midwest Region Yearly $34.99 | as listed | Apple App Store | https://apps.apple.com/us/app/onx-fish-midwest/id6466307868 | v26.41.0, 2026-10 | 2026-10-20 | 2, S2 |
| P14 | onX Hunt pricing: Elite $99.99/yr or $14.99/mo; Premium $34.99/yr; Premium Two State $49.99/yr (snippet) | as listed | onX Maps | https://www.onxmaps.com/hunt/app/pricing | 2026 | 2026-10-20 | 2, 8 |
| P15 | Navionics Boating App Store: IAP US & Canada $49.99; Central/West Europe $59.99; Adriatic $69.99; 2.9★, 2.4K ratings; v24.4 | as listed | Apple App Store | https://apps.apple.com/us/app/navionics-boating/id744920098 | v24.4, Sep 28 (year not shown) | 2026-10-20 | 2, 8 |
| P16 | Navionics App Store reviews: Rick in MA 10/03/2023 ("$15, then jumped to $30, going to $50 on renewal" / "I'm not paying another penny"); ErikExp ("$50 annual subscription doesn't buy better software support"); danthefiaherman 07/24/2018 ("$9.99 to renew"); Smelly mole 01/16/2020; Bsangs 07/18/2025 ("forced to pay twice"); Angler chick 07/12/2023; user-app99 06/28/2024 ("lifetime access to the charts included") | verbatim | Apple App Store (user reviews) | https://apps.apple.com/us/app/navionics-boating/id744920098?see-all=reviews | 2018–2025 | 2026-10-20 | 6, 8, 9 |
| P17 | Navionics pricing guide: US & Canada $49.99, USA Only $39.99, Worldwide $99.99; "rose from $24.99 in 2023" (snippet) | as listed | Wavve Boating (competitor blog) | https://www.wavveboating.com/?p=16552 | 2025–26 | 2026-10-20 | 2 |
| P18 | Fishing Points App Store: Premium $9.99/mo; Yearly Premium $49.99; Basic Premium $29.99; 4.7★, 31K ratings | as listed | Apple App Store | https://apps.apple.com/us/app/fishing-points-map-forecast/id1203032512 | v4.2.7, Oct 6 | 2026-10-20 | 2, S1 |
| P19 | FishTrack App Store: Premium Monthly $14.99; Annual $95.99; "FishTrack.com & App" $79.99; 4.6★, 6.3K ratings; v3.0.1 | as listed | Apple App Store | https://apps.apple.com/us/app/fishtrack-charts-forecasts/id952022603 | 2024-10-09 | 2026-10-20 | 2, 8 |
| P20 | Windy App Store: Premium IAP $24.99, $29.99 (one-time 1-yr), $2.99; 4.8★, 80K ratings; Premium features | as listed | Apple App Store | https://apps.apple.com/us/app/windy-com-weather-radar/id1161387262 | v51.030224, Oct 9 | 2026-10-20 | 2, 3, 8 |
| P21 | Windy price rise thread: "from $25.99/year to $34.99/year starting on December 28, 2024"; MikeOhSee "I will opt out"; icpart cancel; mprosto "raise the price ... 25%"; hopi13 "not an affordable price" | verbatim | Windy community forum (users) | https://community.windy.com/topic/37725/35-premium-subscription-price-hike | 2024-12 | 2026-10-20 | 2, 6, 9 |
| P22 | Windy "price too high" thread: Christopher 0 "$30 a year ... I'd rather have 10, $10 subscriptions"; aftcg "8.2 cents a day"; Yves70 "20$ per year"; moderator "considered as a donation" | verbatim | Windy community forum (users) | https://community.windy.com/topic/14883/subscription-price-too-high | undated | 2026-10-20 | 6, 8 |
| P23 | Buoyweather App Store: $14.99/mo; $95.99/yr; "1 Year Subscription" $79.99; 4.7★, 1.1K ratings | as listed | Apple App Store | https://apps.apple.com/us/app/buoyweather-marine-forecasts/id686664992 | v5.11.0, 2026-10 | 2026-10-20 | 2, 8 |
| P24 | Fish Rules App Store: free; IAP "ProStaff" $29.99; 3.9★, 198 ratings; "Contains Advertising" | as listed | Apple App Store | https://apps.apple.com/us/app/fish-rules-local-fishing-laws/id597875361 | v6.86.34, 2026-10 | 2026-10-20 | 2, 9 |
| P25 | Fish Rules: free app, paid reef maps, ad removal, ProStaff; Gulf Council partnership "FREE mobile apps" (snippets) | — | Fish Rules LLC; Gulf of Mexico Fishery Management Council | https://fishrulesapp.com/ and https://gulfcouncil.org/fish-rules-mobile-app/ | undated | 2026-10-20 | 2, 9 |
| P26 | FishVerify App Store: Monthly $5.99 (3-day trial); Yearly $29.99; Scan Pack $6.99 for 5 scans (snippet) | as listed | Apple App Store | https://apps.apple.com/app/id1121514756 | 2025–26 | 2026-10-20 | 2, 3 |
| P27 | TroutRoutes App Store: Pro Annual $39.99 and $58.99; Monthly $9.99 and $8.99; Single-State $19.99 and $34.99; 4.5★, 3.9K ratings; Pro contents | as listed | Apple App Store | https://apps.apple.com/us/app/troutroutes-fly-fishing-app/id1423989574 | v5.4.8, 2026-10 | 2026-10-20 | 2, S1 |
| P28 | TroutRoutes review: Basic free, State $19.99/yr, Pro $58.99/yr (snippet) | as listed | Fly Fisherman (press) | https://www.flyfisherman.com/editorial/hatches-troutroutes-app-review/539268 | undated | 2026-10-20 | 2 |
| P29 | Omnia memberships: Core "$39/YR($3.25/month)" C-MAP contours, 5% credit; PRO "$59/YR($4.92/month)" Navionics HD + C-MAP, 10% credit | as listed | Omnia Fishing (company page) | http://www.omniafishing.com/pro | 2026 | 2026-10-20 | 2, 8 |
| P30 | Omnia older pricing: Premium $29/yr; Premium PRO $49.99 annual, $20 upgrade (snippets; help page now 404) | as listed | Omnia help center; ODU Magazine (press) | https://help.omniafishing.com/en/articles/7967388-upgrading-to-premium-pro ; https://www.odumagazine.com/?p=80338 | 2023–24 | 2026-10-20 | 2 |
| P31 | B.A.S.S. membership: "$34" annual; Life "$750"; international $40; includes magazine and "$50 in free gear" | as listed | B.A.S.S. (membership FAQ) | https://www.bassmaster.com/bass-membership-faqs | 2026 | 2026-10-20 | 2, 8 |
| P32 | B.A.S.S. Nation club dues "will increase to $30 per year on Sept. 1, 2023"; "discounted B.A.S.S. membership will remain $10" | $30; $10 | B.A.S.S. | https://www.bassmaster.com/college/news/b-a-s-s-nation-club-dues-increase-sept-1-2023/ | 2023-09-01 | 2026-10-20 | 2, 7d |
| P33 | B.A.S.S. Nation at 50: "more than 30,000 members"; clubs in 47 states and 10 nations; 958 HS clubs / 10,585 anglers; 200+ colleges (snippet) | as listed | AnglersChannel (press, B.A.S.S. release) | https://anglerschannel.com/b-a-s-s-celebrates-the-50th-birthday-of-the-b-a-s-s-nation/ | 2018 | 2026-10-20 | 2, 7c, 7d |
| P34 | 2026 BFL entry fees: qualifiers $200/$100; Super Tournaments $300/$150; Regionals $350/$175; 24 divisions, 96 qualifiers, 24 Supers, 6 Regionals; 20% of field paid | as listed | In-Fisherman (press, MLF release) | https://www.in-fisherman.com/editorial/lower-entry-fees-improved-payouts-on-tap-for-2026-bfls/538061 | 2025-10-15 | 2026-10-20 | 2, 4d, 7c |
| P35 | Same 2026 BFL fees and event counts | as listed | SportsDestinations (press) | https://www.sportsdestinations.com/sports/fresh-water-sports/news/mlf-announces-lower-entry-fees-bigger-payouts-2026-36790 | 2026-01-08 | 2026-10-20 | 2, 4d |
| P36 | Trout Unlimited national join form: Regular $45.00; Contributor $50; Family $55; Sponsor $100; Conservator $250 | as listed | Trout Unlimited (join form) | https://crm.tu.org/eweb/SnapFormsDonations.aspx?tu_source=WACQHP&instance=tujoinbase | 2026 | 2026-10-20 | 2, 8 |
| P37 | TU chapter page: Regular $35; Senior $20; Stream Explorer $12; Family $50; Life $1,000 (undated; conflicts with P36 — P36 used as it is the live national form) | as listed | TU Rhode Island chapter | https://rhodeisland.tu.org/node/71484 | undated | 2026-10-20 | 2 |
| P38 | TU "350,000+ members and supporters", "400+ councils and chapters in 44 states" (snippet) | as listed | Trout Unlimited (New Leader Orientation deck) | https://www.tu.org/wp-content/uploads/2025/06/New-Leader-Orientation-2025.-v2.0.pdf | 2025-06 | 2026-10-20 | 2, 7d |
| P39 | FishingBooker: "not a subscription-based platform"; commission floor 10%, ceiling 30%, 5-point steps, captain-chosen | 10–30% | FishingBooker help center | https://help.fishingbooker.com/hc/en-us/articles/360010929733-What-is-the-cost-of-listing-on-FishingBooker- | © 2026 | 2026-10-20 | 2, 7a, 8 |
| P40 | FishingBooker commission blog: most-booked captains choose "around 15%–20%"; comment by Capt Marc Laurin 2022-05-27 ("Seems to me it is still all about the $$$$ commissions", listing "close to bottom at 10%") | verbatim | FishingBooker blog | https://fishingbooker.com/blog/?p=37072 | updated 2025-08-21 | 2026-10-20 | 2, 6, 7a |
| P41 | "Out of 9,463 captains from all across the world", 791 winners (8.3%) | 9,463 captains | FishingBooker blog | https://fishingbooker.com/blog/?p=76319 | updated 2026-04-08 | 2026-10-20 | 2, 7a |
| P42 | 2025 award: "Out of 8,732 captains ... 672 received" (snippet) | 8,732 | FishingBooker blog | https://fishingbooker.com/blog/?p=76319 (2025 edition) | 2025 | 2026-10-20 | 2 |
| P43 | "commission starts at just 10%, well below the 25–30% most platforms take" (marketing claim, snippet) | 10% vs 25–30% | FishingBooker join page | https://updates.fishingbooker.com/join | 2026 | 2026-10-20 | 2 |
| P44 | Captain Experiences guide FAQ: "there are no fees ever"; "we only get paid when you get paid"; rate not stated; QR-code balance via Stripe; "bring 20% cash as a tip" | commission, unpublished | Captain Experiences (company FAQ) | https://captainexperiences.com/guidefaqs | 2026 | 2026-10-20 | 2, 7a |
| P45 | "over 2,000 Damn Good Guides"; balance charged to deposit card by QR scan | 2,000+ guides | Captain Experiences blog | https://captainexperiences.com/blog/captain-experiences-explained | updated 2023-08-03 | 2026-10-20 | 2, 7a |
| P46 | Guidesly guide page: "earn up to $8,100/month"; Guidesly Pro unpriced; no fee stated | — | Guidesly (company page) | https://guidesly.com/become-a-guide | 2026 | 2026-10-20 | 2, 7a |
| P47 | Guidesly "earns revenue from a commission on each booking", rate not given (snippet) | — | Dealroom (database) | https://app.dealroom.co/companies/guidesly | undated | 2026-10-20 | 2, 7a |
| P48 | Mystery Tackle Box: Regular $19.99/mo; Pro $31.99; Elite $44.99; monthly shipping $4.99 (Canada $9.99); multi-month free shipping | as listed | Mystery Tackle Box help center | https://help.mysterytacklebox.com/article/696-how-do-i-subscribe-to-mystery-tackle-box-and-how-much-does-it-cost | 2025-10-07 | 2026-10-20 | 4e, 8 |
| P49 | "55,000 anglers subscribe to the service"; "millions in revenue"; first shipment to 441 people | 55,000 subs (2016) | Built In Chicago (press) | https://www.builtinchicago.org/articles/mystery-tackle-box-article | 2016-10-19 | 2026-10-20 | 4e |
| P50 | MTB launch: "$15 per" month, "$13.75 per month" on longer plans; ~200 subscriptions; "$3,000 in revenue in their first week" | as listed | TechCrunch (press) | https://techcrunch.com/?p=611716 | 2012-07-18 | 2026-10-20 | 4e |
| P51 | Catch Co. "nearly $300 million in revenue since its inception in 2012"; acquired by Gordon Brothers March 2024 (snippets) | as listed | ABF Journal; Preqin (press/database) | https://www.abfjournal.com/tag/catch-co/ ; https://preqin.com/data/profile/asset/catch-co-/404195 | 2024 | 2026-10-20 | 4e |
| P52 | Bass University App Store: Monthly $16.99; Yearly $139.99; 4.8★, 146 ratings; live classes $24.99/$49.99 (older posts) | as listed | Apple App Store; Bassmaster blog (snippet) | https://apps.apple.com/us/app/bass-university-fishing-app/id1507812871 ; https://www.bassmaster.com/blog/bass-university-goes-mobile | v10.401.1, Aug 22 | 2026-10-20 | 2, 3, 8 |
| P53 | Salt Strong: "65,000+ Salt Strong Insiders" (also "60,000+ members"); testimonial "For $97 a year it's just unbelievable"; no published price | as listed | Salt Strong (company page) | https://info.saltstrong.com/pricing | 2026 | 2026-10-20 | 2, 8 |
| P54 | Club trail entry fee "$40" per event, five events, 2014 season | $40 | Hillsgrove RI Bass Anglers (club page) | https://hillsgroveribass.yolasite.com/club-tournament-trail.php | 2014 | 2026-10-20 | 2, 4d |
| P55 | Club dues forum range ~$30–$120/yr; "$35.00 per year for each angler"; FL club events "$40 per boat", "$30 a boat", "$50 per boat"; "$75.00 per boat ... about 90%" paid out; IL club $50 two-day / $40 one-day (snippets) | as listed | BassResource forum; club pages (via search) | https://www.bassresource.com/bass-fishing-forums/topic/151529-bass-clubs-annual-dues/ | various, undated | 2026-10-20 | 2, 4d |
| P56 | "each CKA angler pays a $5 use fee for each tournament" to TourneyX | $5/angler | Carolina Kayak Anglers (club) | https://www.carolinakayakanglers.com/?p=1704 | 2017-01-20 | 2026-10-20 | 4d, 7c |
| P57 | TourneyX director pricing: "Starting January 2024 our pricing will change to $6.50 per angler"; PayPal invoice after event or Stripe deduction | $6.50/angler | TourneyX (pricing page) | https://tourneyx.com/app/pricing/ | 2024-01 | 2026-10-20 | 4d, 7c, 8, S6 |
| P58 | TourneyX stats: "115.9k active anglers", "144 active tourneys", "2276.7k fish caught" | as listed | TourneyX (home) | https://tourneyx.com/ | 2026 | 2026-10-20 | 7c |
| P59 | FishDonkey: "It is FREE to host a tournament"; "Fishermen pay a service fee"; 18,000 tournaments; 171,000 anglers; 1,800,000 fish photos (as of 10/11/2025) | as listed | FishDonkey (home) | https://www.fishdonkey.com/ | 2025-10-11 | 2026-10-20 | 4d, 7c, S8 |
| P60 | Fishing Chaos: "40 K+" tournaments; "1,000,000 +" fish submitted; no public pricing | as listed | Fishing Chaos (home) | https://www.fishingchaos.com/ | 2026 | 2026-10-20 | 7c, S8 |
| P61 | Weighfish: "The angler pays a 6.5% service fee ($1 minimum)"; "You receive the full fee"; 2025: 300+ series, 1,300+ tournaments, 24,000+ entries; Free/Pro/Elite director plans | as listed | Weighfish (company page) | https://www.weighfish.com/ | 2025 | 2026-10-20 | 4d, 7c, 8, S6 |
| P62 | Phins Fishing Classic tickets via Fishing Chaos: $35 open; $55 with shirt; $10 donation tickets (snippet) | as listed | KOGT (local press) | https://kogt.com/?p=64942 | 2025 | 2026-10-20 | 4d |
| P63 | Garmin Navionics+ chart cards "$149.99 - $199.99" (snippet; page 403) | $149.99–$199.99 | Bass Pro Shops (retailer) | https://www.basspro.com/shop/en/navionics-cartography-chart-card-us-east-gn-3426459 | 2026 | 2026-10-20 | 3 |
| P64 | Garmin Navionics+ built-in update $139.95; LakeVü G3 US Inland $129.95; BlueChart G3 + LakeVü update $107.95 | as listed | The GPS Store (retailer) | https://thegpsstore.com/GPS-Maps-Software/Garmin-Maps-Software/Marine-Charts | 2026 | 2026-10-20 | 3 |
| P65 | Humminbird MEGA Live "$1,500 (transducer only)"; Garmin LiveScope Plus "$1,700 (transducer and sonar module only)" | as listed | Outdoor Life (press) | https://www.outdoorlife.com/gear/mega-live-vs-livescope/ | 2024-07-08 | 2026-10-20 | 3 |
| P66 | ECHOMAP Ultra 2 10" LiveScope Plus bundle $2,999.99; XPLORE 9 + MEGA Live 2 bundle $2,599.98 (snippet) | as listed | Walmart (retailer) | https://www.walmart.com/browse/sports-outdoors/fish-finder-bundles/4125_546956_111667_5923509_6143846 | 2026 | 2026-10-20 | 3 |
| P67 | Valley Reel Works (Rock Hill, SC): FW $25 (+$5 dirty); SW spinning/conventional $35; lever drag $40; 2-speed $45; repairs from $20; estimate $15; return $13.50 + $2; repairs 5–7 business days; email/form; invoiced after work | as listed | Valley Reel Works (shop) | https://www.valleyreelworks.com/ | 2026 | 2026-10-20 | 4b, 7f |
| P68 | Mat's Reel Repair (Eagle River, WI): Standard $35; Select $60; Premium $80; Saltwater $100; $20 min; $20 estimate; $10 reassembly; expedited 2×; line winding $5; return $15.50 + $2; printed Reel Service Form | as listed | Mat's Reel Repair (shop) | https://matsreelrepair.com/service-pricing | prices updated 2023-10-09 | 2026-10-20 | 4b, 4c, 7f |
| P69 | Dave's Reel Service (Vernon Hills, IL): Basic FW $50; Musky $75; SW $100; select Shimano/Daiwa $85; salt surcharge $25; "8 Week Turnaround on all repairs"; closed Aug 25–Oct 15; rush +$25; return min $20; printed form | as listed | Dave's Reel Service (shop) | https://www.davesreelservice.com/rates/ | 2026 | 2026-10-20 | 4b, 7f, 9 |
| P70 | Fischer Angling (Houston): Baitcast $28.75; Large casting $39.75; Dual speed $50; Super tuning $44.25; "10 Day Turnaround*"; vacation Jul 15–Sep 15; online product pages | as listed | Fischer Angling (shop) | https://fischeranglingpro.com/ | 2026 | 2026-10-20 | 4b, 7f, 9 |
| P71 | Rod & Reel Repair Guy (Valley, AL): re-lube $25; overhaul $30; super-tune $40; saltwater $45; diagnose $15; guides/tips $12; reguide $40+; handle $30+; custom rods $185/$225/$275+; dirty +$15; shipping $9.95 + $2; "will reopen on 9/21/2026"; call/text | as listed | fixreels.com (shop) | https://fixreels.com/ | 2026 | 2026-10-20 | 4b, 4c, 7f, 9 |
| P72 | Delaware Valley Tackle (Fort Plain, NY): deep cleaning $26.95; econo $18; shop rate $20/hr after 1.5 h; tuning upgrade $39.99; ceramic bearings from $9.95 ea; Carbontex $8–$10; turnaround "varies by season"; printable work order; check/PayPal; pay before return | as listed | Delaware Valley Tackle (shop) | https://www.delawarevalleytackle.com/services | 2026 | 2026-10-20 | 3, 4b, 7f |
| P73 | Rick's Reel Service: standard conventional and basic spinning $40; advanced spinning $42–$55; lever drag/large trolling $40–$55 (snippet; site 429 ×4) | as listed | Rick's Reel Service (shop) | https://www.ricksreelservice.com/ | 2026 | 2026-10-20 | 4b |
| P74 | Ed's Rod Building (MN): tip $5 + tip; single-foot guide $10; rear cork handle $20 (snippet) | as listed | Ed's Rod Building and Repair | https://eds-resources.com/rodrepair.htm | undated | 2026-10-20 | 4c |
| P75 | PENN repairs: "$10.00 per reel processing & handling fee" + flat labor by model + parts + UPS; table "All prices below effective January, 2014" ($20 Fierce, $25 Battle/Spinfisher, $50 Internationals); payment by phone (snippets; page 429 ×4) | as listed | PENN / Pure Fishing (company page) | https://www.purefishing.com/penn-repairs-service | 2014 table; page live 2026 | 2026-10-20 | 4b, S5 |
| P76 | Shimano Australia: ~AUD $30 reel / $50 conventional or game reel, labour only; "within 20 business days"; shipping $16.50 + GST (snippet) | as listed | Shimano Australia (company page) | https://fish.shimano.com/en-AU/service/c/ServiceCentre.html | 2026 | 2026-10-20 | 4b |
| P77 | Daiwa Australia: $40 standard / $70 tournament / $100 electric, ex-GST; "20-30 business days" (snippet) | as listed | Daiwa Australia (company page) | https://daiwafishing.com.au/pages/service-spare-parts-and-repair-forms | 2026 | 2026-10-20 | 4b |
| P78 | Daiwa NZ: labour $50 basic spin / $80 premium spin / $50 baitcast / $80 Saltiga / $180 Seaborg; shipping $10 (snippet) | as listed | Daiwa New Zealand (company page) | https://www.daiwa.co.nz/servicing/ | 2026 | 2026-10-20 | 4b |
| P79 | Shimano US: out-of-warranty issues "repaired or replaced for a specific fee"; "a full estimate will be provided for your approval"; bearings not covered (snippet; page 429) | — | Shimano North America (warranty page) | https://fishshop.shimano.com/pages/warranty-service | 2026 | 2026-10-20 | 4b, 9 |
| P80 | Shimano service centers: direct Ladson SC and Irvine CA; "26 Satellite Service Centers" (dated press; page 429) | 2 + 26 | Shimano; WesternBass (press) | https://fishshop.shimano.com/pages/service-centers ; https://www.westernbass.com/article/new-shimano-authorized-service-warranty-center-opened | undated | 2026-10-20 | 4b, 7f |
| P81 | Spooling: Cabela's and Bass Pro spool free (line charged if not yours); Dick's "around $5 in labor" (snippet) | $0–$5 | Outdoor Empire (blog) | https://outdoorempire.com/where-get-a-fishing-reel-spooled/ | undated | 2026-10-20 | 4c, 9 |
| P82 | Spooling thread: "a 150yd spool of Power Pro 20# will cost you roughly $15.00"; "it runs .09-.10 cents a yard"; "will put the line on free if you bought it there"; "I usually spool my own reels b/c it's cheaper." | verbatim | Charleston Fishing forum (users) | https://forum.charlestonfishing.com/t/where-can-i-take-my-reels-to-get-spooled/25452 | 2010-02-24 | 2026-10-20 | 4c, 6 |
| P83 | Charter prices 2026: half-day inshore mid-market "$400 to $600"; premium "$650 to $900"; 4-h offshore ~$1,000, $1,800–$2,500 premium | as listed | Reservety (booking-software vendor page) | https://reservety.com/tools/fishing-charters/charter-pricing-calculator.html | © 2026 | 2026-10-20 | 4a |
| P84 | Kona: half-day $800–$1,500; full day $1,500–$2,500 off-season, $2,000–$3,000+ peak (snippet) | as listed | go.lexus.no guide (low-quality content site) | https://go.lexus.no/post/kona-fishing-charter-prices | undated | 2026-10-20 | 4a |
| P85 | Florida: "$527 for a full day and $415 for a half-day" (snippet; page 429) | as listed | Reel Coquina Fishing (charter blog) | https://www.reelcoquinafishing.com/blogs/florida-fishing-blog/what-is-a-fishing-charter | undated | 2026-10-20 | 4a |
| P86 | Deposits "10–30% of the trip price"; balance to captain by cash/card/platform; card fees "typically around 2-5%" passed to customer (snippets) | as listed | FishingBooker help center | https://fishingbooker.helpjuice.com/360010810474-What-is-the-deposit- | 2026 | 2026-10-20 | 4a, 7a |
| P87 | Reader letter: "the entry fees have been on the rise as well"; "This poses a challenge for many anglers, particularly those with limited financial means" | verbatim | On The Line newsletter | https://ontheline.beehiiv.com/p/when-are-bass-tournament-entry-fees-just-too-expensive | 2023-10-08 | 2026-10-20 | 4d, 6 |
| P88 | Team tournaments "typically it costs about $400 per team"; survey: "about $2,000 on a single tournament" all-in (snippet) | as listed | Lake County Record-Bee (press) | https://www.pressreader.com/usa/lake-county-record-bee/20201230/281608128051411 | 2020-12-30 | 2026-10-20 | 4d |
| P89 | USFWS 2022 National Survey, "Expenditures for Fishing for 2022": total $99,422,180,761, $2,490 per angler, 38,862,006 spenders (97%), $2,558 per spender; trip-related $36.6B / $917; fishing equipment $8,660,298,983 / $217 per angler / 29,126,920 spenders (73%) / $297 per spender; auxiliary $4.3B / $108; special equipment $27.7B / $695 | as listed | U.S. Fish & Wildlife Service (table hosted by AFWA) | https://www.fishwildlife.org/download_file/view/5328/255 | 2022 data (published 2023) | 2026-10-20 | 5, 9, S4 |
| P90 | ASA/Southwick 2024 report (2022 data): 39.9M anglers 16+, 9.5M youth 6–15, 35.1M freshwater / 12.7M saltwater; "Anywhere from a third to half of people who consider themselves anglers do not fish each year"; age 16–17 4%, 18–24 11%, 25–34 17%, 35–44 19%, 45–54 16%, 55–64 17%, 65+ 16%; equipment $8.7B: rods & reels $2.3B, lines $867M, lures $1.3B, hooks/sinkers $838M, tackle boxes $475M, creels/nets $440M, depth finders & electronics $782M, ice $500M, other $799M; total $99.4B | as listed | American Sportfishing Association / Southwick Associates | https://asafishing.org/wp-content/uploads/2025/01/2024_ASA_Economic_Report_Digital_Spread.pdf | 2024 (2022 data) | 2026-10-20 | 5, 7b, 9, S4, S10 |
| P91 | Plano "purchased ... more in 2014 than any other brand" (Southwick survey); "over 170 unique tackle storage products" (snippet) | — | ODU Magazine (press, company-linked) | https://www.odumagazine.com/?p=58869 | 2015 | 2026-10-20 | 5 |
| P92 | 2016 survey: $852M artificial lures/flies/baits; $367M hooks, sinkers, swivels (snippet) | as listed | Realtree Business (press, USFWS 2016 data) | https://business.realtree.com/node/659 | 2016 data | 2026-10-20 | 5 |
| P93 | SurfTalk "Price to service a reel": dleopoldi914 "Local tackle shop charges to clean and grease $25"; nowildwood "For $60 you are almost at the cost of a new reel."; PENN account "Estimate would be $40-$45"; pasted 2014 PENN list "$25.00" + $10 handling | verbatim | StripersOnline SurfTalk forum (users; PENN company account) | https://www.stripersonline.com/surftalk/topic/691132-price-to-service-a-reel/ | 2017-04-11/12 | 2026-10-20 | 5, 6, 9 |
| P94 | NW Fishing Reports "Reel Cleaning Service. Anyone Here Use Them?": TrackerPro16 "$20-$30 ... more than some of the reels I have are worth!"; AJ's Dad "He charges $20." / "$20 cleaning charge -VS- $1.50 IPA"; The Quadfather "$25 for clean and lube, and maybe $10 for upgraded drags" / "spend $25 a year on simple maintenance"; spokey9 "it'd cost too much having all my reels serviced yearly" | verbatim | Northwest Fishing Reports forum (users) | https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=239771 | 2017-12-28 to 30 | 2026-10-20 | 5, 6, 7f, 9 |
| P95 | FishingTX "Reel cleaning and repair": Scotta "I think they charge 10 bucks for a complete cleaning and service." / "They do terrific work at very reasonable prices."; Craig "the price was more like $20" | verbatim | FishingTX forum (users) | https://fishingtx.com/threads/reel-cleaning-and-repair.16903 | 2009-08-11/12 | 2026-10-20 | 6 |
| P96 | Avet SX Raptor service from Hawaii: "Basic Service ... cost $44"; "$14 to ship"; return "$24.25"; "I think it was worth it considering this was the first service I paid for in 5 years." | verbatim | Hawaii Nearshore Fishing (blog) | https://hawaiinearshorefishing.com/tag/is-it-worth-sending-your-avet-reel-in-for-service-from-hawaii/ | 2025-10-20 | 2026-10-20 | 6 |
| P97 | Fishbrain review analysis: "approximately 40% of users are frustrated by paywalls"; "around 15% of users report issues with unexpected charges"; quotes "I was charged $80 without warning..." and "now everything is hidden behind a paywall..." | as listed | Clarity (third-party review aggregator) | https://www.onclarity.com/leaderboard/insight/fishbrain | 2026-10-20 | 2026-10-20 | 6, 8, 9, S3 |
| P98 | Fishbrain unitQ score 52 ("fair"), 15-point drop in 30 days, 124 reports (79 iOS / 45 Android) | as listed | unitQ (third-party) | https://www.unitq.com/unitq-scorecards/fishbrain/ | 2026-10-20 | 2026-10-20 | (context) |
| P99 | FareHarbor: "6–8% booking fee added at checkout"; "This fee is passed to the customer"; processing "2.9% + $0.30 per transaction in the US" borne by operator | as listed | CaptainBook (competitor blog) | https://www.captainbook.io/blog/fareharbor-pricing-fees-explained | 2026-04-09 | 2026-10-20 | 7a, 8, S6 |
| P100 | Xola: "No subscriptions"; "small partner fee to your customers on every purchase"; cards 2.39% and $0.30 | as listed | Xola (company pricing page) | https://www.xola.com/pricing/ | 2026 | 2026-10-20 | 7a, S6 |
| P101 | Peek Pro: no public price; "roughly 6–8% per booking" (snippet; page 403) | ~6–8% | G2 / CaptainBook (third party) | https://g2.com/products/peek-pro/pricing | 2026 | 2026-10-20 | 7a |
| P102 | Square Appointments: Free $0; "Plus plan costs $49/month per location"; "Premium plan is $149/month per location"; 2.6% + 15¢ in person (Free), 2.5% + 15¢ (paid); Square's own page returned 429 | as listed | Koalendar (third-party pricing guide) | https://www.koalendar.com/blog/square-appointments-pricing | 2026-10-07 | 2026-10-20 | 7a, 7b, 8 |
| P103 | Shopify: Basic $39/mo ($29 annual); Grow $105 ($79); Advanced $399 ($299); Plus from $2,300; POS Pro $89/location | as listed | Shopify (company pricing page) | https://www.shopify.com/pricing | 2026 | 2026-10-20 | 7b, 8 |
| P104 | Lightspeed Retail: Basic $89/mo; Core $149; Plus $289; card-present 1.5% | as listed | Lightspeed (company pricing page) | https://www.lightspeedhq.com/pos/retail/pricing/ | 2026 | 2026-10-20 | 7b, 9 |
| P105 | NOAA bait & tackle study: "surveyed 3,500 independent, primarily small, businesses"; 944 responded; "average retailer sold about $426,000 in saltwater bait, tackle and related equipment in 2013"; $2.3B impact; ~16,000 jobs; sample frame 3,514 (report) | as listed | NOAA Fisheries (media release; report) | https://www.fisheries.noaa.gov/media-release/noaa-study-finds-bait-and-tackle-retailers-generate-23-billion-us-economy ; https://repository.library.noaa.gov/view/noaa/5322 | 2015-07-15 (2013 data) | 2026-10-20 | 7b |
| P106 | US fishing boat charter businesses "5,773 as of 2026, up 4.6% from 2025" (snippet; page 405) | 5,773 | IBISWorld (market-research estimate) | https://www.ibisworld.com/industry-statistics/number-of-businesses/fishing-boat-charter-united-states/ | 2026 | 2026-10-20 | 7a |
| P107 | Great Lakes "1,904 active licensed charter captains" (2011) (snippet) | 1,904 | NOAA repository (study) | https://repository.library.noaa.gov/view/noaa/46383 | 2011 data | 2026-10-20 | 7a |
| P108 | Wild Apricot 100 contacts: $66.00/mo monthly; $59.40/mo prepay 1 yr; $56.10/mo prepay 2 yr | as listed | Wild Apricot (company pricing page) | https://www.wildapricot.com/pricing | 2026 | 2026-10-20 | 7d, 8 |
| P109 | Wild Apricot tiers: 100 $63; 250 $78; 500 $147; 2,000 $252; 5,000 $462; 15,000 $556 per month (snippet) | as listed | Capterra (third party) | https://www.capterra.com/p/76116/Wild-Apricot/pricing/ | 2026 | 2026-10-20 | 7d |
| P110 | Dockwa: Transient from $169/mo; Captains & Contracts from $180; POS from $249; Fuel $199; Spaces $180; add-ons $84–$139; "Trusted by 4,000+ Marinas and 500,000+ Boaters" | as listed | Dockwa (company pricing page) | https://marinas.dockwa.com/marina-software-pricing | 2026 | 2026-10-20 | 7e, 9 |
| P111 | RepairDesk: Essential $99/store/mo ($79 annual); Growth $149 ($119 annual); Advanced custom | as listed | RepairDesk (company pricing page) | https://www.repairdesk.co/pricing | 2026 | 2026-10-20 | 7f, 8, S7 |
| P112 | RepairShopr: Starter $69.99; Repair Shop $139.99; Big Chain $149.99; annual $59.99 / $129.99 / $139.99 | as listed | RepairShopr (company pricing page) | https://www.repairshopr.com/pricing | 2026 | 2026-10-20 | 7f, S7 |
| P113 | Repair-shop software roundup: no reel-specific product found; Repair-CRM $89/mo 5 users; RepairTRAX $30/user/mo; Digital Wrench $39.95/mo; OpenRMA $185 one-time (snippets) | as listed | Capterra / SourceForge / GetApp listings | https://www.capterra.com/p/130999/RepairTRAX/ ; https://sourceforge.net/software/product/Repair-Spots/alternatives | 2026 | 2026-10-20 | 7f, 8, S7 |
| P114 | 2024 Special Report (2023 data): "net increase of 3.2 million fishing participants in 2023"; "annual churn rate" "negative 23 percent in 2023, the same level as in 2022"; "Only 31 percent fished at least once a month in 2023, down from 41 percent in 2007"; lost participants "half over 45"; 4.2M first-timers | as listed | SGB Online (press, RBFF/Outdoor Foundation report) | https://sgbonline.com/report-fishing-participation-sees-growth-but-too-much-turnover/ | 2024-07-16 | 2026-10-20 | 9, S10 |
| P115 | 2025 Special Report (2024 data): 57.9M participants age 6+, 19%; "Just 32 percent fished once a month or more in 2024, down from 37 percent a decade ago" (snippets) | as listed | SportsDestinations / MRAA (press, RBFF report) | https://www.sportsdestinations.com/sports/water-sports/2025-special-report-fishing-36399 ; https://mraa.com/?p=26533 | 2025 | 2026-10-20 | 9, S10 |
| P116 | TourneyX Pro listing: "no contracts, monthly or annual fees"; directors pay per tournament "flat-fee scale or based on the number of anglers" (snippet) | — | Apple App Store via AppFollow | https://apps.appfollow.io/ios/tourneyx-pro/1478882171?country=us | 2026 | 2026-10-20 | 7c |
| P117 | FishingBooker example: a captain "gets 160 bookings a year while investing just 10% commission" (snippet) | 160/yr at 10% | FishingBooker blog | https://fishingbooker.com/blog/?p=39920 | undated | 2026-10-20 | 7a |
| P118 | Fishbrain 2022 sponsor deck: Android $7.99 monthly, $59.99 annual (snippet) | as listed | Fishbrain / RBFF (deck) | https://www.takemefishing.org/getmedia/df89f1a2-d59d-467c-87d1-382c23338f09/Sponsor-Presentation-Fishbrain-FINAL.pdf | 2022 | 2026-10-20 | 2 |
| P119 | Guidr "charges guides a 10% fee per booking" (snippet; separate small company, not Guidesly) | 10% | Gust (startup listing) | https://gust.com/companies/james-s-startup-576 | undated | 2026-10-20 | 7a |
| P120 | Windy monthly plan $2.99 "discontinued" per staff; one-time plan "for users who do not want to enter subscription mode" (snippets) | — | Windy community (staff posts) | https://community.windy.com/topic/19128/the-difference-between-the-two-premium-subscribtions | undated | 2026-10-20 | 8 |
| P121 | Reel service as share of equipment spend | **estimate:** $25–$50 service ÷ $297 per spender (P89) = 8–17% | estimate | — | — | 2026-10-20 | 5 |
| P122 | US for-hire fishing operators | **estimate:** 6,000–10,000; floor = IBISWorld 5,773 (P106); upper bound adds unregistered part-time guides (FishingBooker lists 9,463 worldwide, P41) | estimate | — | — | 2026-10-20 | 7a |
| P123 | US independent reel-service businesses | **estimate:** 250–750; one search surfaced 7 shops with public price lists in 7 states (P67–P73); assume 5–15 per state × 50; Shimano's 26 satellite centers (P80) are a subset; low confidence | estimate | — | — | 2026-10-20 | 7f, S7 |
| P124 | US independent tackle shops | **estimate:** ≥7,000; 3,514 coastal frame (P105) + inland shops serving 35.1M freshwater vs 12.7M saltwater anglers (P90); inland count unmeasured; low confidence | estimate | — | — | 2026-10-20 | 7b |
| P125 | Club-level bass tournaments per year, US | **estimate:** 10,000–25,000; ~2,000 affiliated adult clubs (30,000 members ÷ ~15, P33) × 5–8 events + non-affiliated and kayak series; cross-check: FishDonkey 18,000 cumulative since ~2016 ≈ 2,000/yr (P59), Weighfish 1,300 in 2025 (P61); low confidence | estimate | — | — | 2026-10-20 | 7c, 7d |
| P126 | Reel-shop SaaS revenue ceiling | **estimate:** 750 shops (P123 upper) × $29/mo × 12 ≈ $261K/yr at 100% penetration | estimate | — | — | 2026-10-20 | 7f, 10 |
| P127 | Solo-founder consumer app target | **estimate:** 1,000–3,000 payers × $40/yr = $40K–$120K/yr; derived from the $30–$60 band (S1) and the ratings-count scale of second-tier apps (P13, P23: 1.1K–1.8K ratings) | estimate | — | — | 2026-10-20 | 10 |
