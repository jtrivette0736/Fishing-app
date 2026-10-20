# Evidence round: job tracking for small fishing-gear service businesses

Candidate: an intake form (reel model, problem, Stripe deposit), a job board with statuses, a
customer-facing status page with automatic updates, a quote/approve step for parts, service
history per customer and per reel, and a public "send us your reel" page, for reel techs, rod
repairers, custom rod builders and tackle-shop service counters. Customer zero: the founder's
own workshop (Storm Proof Tackle, Virginia Beach; P1, P3, P4).

Gathered 2026-10-20 by the targeted-evidence agent. This file ADDS to `hobby-immersion.md`
sections 3.6 (M rows), 3.11 (S rows) and the workarounds table, and to `monetization.md` 4b, 4c,
7b, 7f (P67–P78, P102–P104, P111–P113, P123–P126). Existing rows are cited by id, not repeated.

ID scheme in this file: pain rows are `V1…`; source rows in section 8 are `VS1…`.

---

## 0. Method and limits

**What was done.** 44 WebSearch queries and ~110 WebFetch calls, in priority order Q1 → Q5.
Direct fetches of: stripersonline (forum index + Reel Maintenance and Repair board),
rodbuilding.org (index, 4 sticky/thread pages, 6 business threads found via its own search),
alantani.com (index, 2 boards, 4 threads), Northwest Fishing Reports (2 threads), Texas Kayak
Fisherman, TigerDroppings, Lake Ontario United, NESA (UK), charlestonfishing, Trustpilot (ie.
mirror), Square Seller Community, PDB Magazine, WJLA, Boston Globe, 8 shop websites, Tower
Systems (3 pages), Paperform, Jobber, GoCanvas, QuickBooks pricing, Yellow Pages (10 searches),
vidIQ. Reddit, BassResource, Yelp and Trustpilot.com were used only through search snippets,
as instructed; snippet quotes are marked "(snippet)".

**What could not be reached (and what that costs the evidence).**
- Facebook group and page pages return the login wall; Bing and DuckDuckGo HTML searches did not
  return group listings (DDG served a bot captcha). **No Facebook group member counts in this
  file.** Facebook is named as a channel by two techs (V20, V51), so this is a real gap.
- Shopify-hosted manufacturer pages (pennfishing.com, daiwa.us, okumafishingusa.com,
  abugarcia.com, fishshopcanada.shimano.com, tackleworld.com.au) and squareup.com returned
  HTTP 429 on every attempt (six rounds over ~40 minutes). Manufacturer authorised-centre counts
  are therefore from search snippets and the earlier P75/P79/P80 rows; the Shimano US page
  points its "map" at brands.locally.com, which is not enumerable here.
- fish.shimano.com (403), yell.com UK (403), northforkcomposites.com builder directory (403),
  socialcounts.org (403), yelp.com (403), youtube.com search pages (JS only), Invidious mirrors
  (captcha/502). **No per-video DIY view counts**; channel totals are used instead.
- yellowpages.com.au returned an unrelated category for the query; yellowpages.ca indexes only 2
  listings for "fishing reel repair". UK/CA/AU pool sizes are therefore derived, not counted.
- The fetch tool sometimes paraphrases long posts. Where I only have a paraphrase it is marked
  "[paraphrase]" and not counted toward the independence rule.

**Independence tally (section 1).** Business-side: 29 distinct people/shops across 9 platforms
(Square community, PDB Magazine, alantani.com, rodbuilding.org, five independent shop sites,
WJLA, charlestonfishing, a UK rod maker's FAQ). Angler-side: 21 distinct handles across 7
platforms (NWFR, Texas Kayak Fisherman, Trustpilot ×2 sites, BassResource snippet,
TigerDroppings, Lake Ontario United, NESA UK). Two people appear twice and are counted once
(Bodofish, The Quadfather).

---

## 1. Pain evidence table

Job tags: `shop-ops` = the business side of taking in, tracking, quoting, charging and returning
customer gear; `gear-maintenance` = the angler trying to get gear serviced. Intensity: 1 = mild;
2 = built/bought a workaround or lost time/money; 3 = quit, switched, paid, or asked for a product.

### 1a. Business side (reel techs, rod builders, shop counters)

| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Int |
|---|---|---|---|---|---|---|---|
| V1 | "each build takes anywhere from a few days to two or three weeks depending on complexity and parts availability" … "from what I can see I can only change the item prep time and that's only up to one day of prep." … "I don't want someone to place an order and show up at my house an hour later expecting their rod to be build." | Travis1836 (custom rod builder), Square Seller Community | https://community.squareup.com/t5/Questions-How-To/How-would-I-show-my-customers-order-wait-time-or-how-long-an/td-p/639869 | 2023-02-26 | shop-ops (rod orders) | missing-feature, manual-workaround | 2 |
| V2 | "The first thing I'm going to do when I receive a reel for service is review the form the sender submits online" … (he will) "send a text or email confirming receipt and condition" … "a growing number of clients nationwide annually mail him a box of fishing reels" … "He estimates 80 percent of the reels sent to him need service" | Doug Lemons, Doug's Reel Repair (Hudson, OH), profiled by Dan Armitage, Pond Boss (PDB) | https://www.pdbmagazine.com/2023/03/preseason-reel-repair | 2023-03 | shop-ops | manual-workaround (web form + hand-typed text/email per reel) | 2 |
| V3 | "fixing reels at a clip of about 100 a month." … "i've got about 60 reels in line right now." … "write the "shipped on ....." date and the "please return by ...." date on the OUTSIDE of the box." … "send me a check in the return envelope that will be send out with the bill." … "i've gotten a little backed up, more family stuff that fishing stuff." | alantani (Alan Tani), Reel Repair by Alan Tani forum, "having your reels fixed here" | https://alantani.com/index.php/topic,277.0.html | 2009-03-17; 2009-04-10; 2011-03-23 | shop-ops | manual-workaround (dates written on boxes as the queue; cheques by mail) | 2 |
| V4 | "Text or email me for a repair/service quote." … "All quoted service prices do not include parts, parts are an extra charge if needed" … "and will be quoted prior to purchase and/or installation." … "Text or email is best. (Greasy Hands, cannot always pick up the phone.)" | Maybe We Can Fix It (Scott Rodriguez, Orange, CA; Okuma employee moonlighting), alantani.com | https://alantani.com/index.php/topic,32169.0.html | 2020-10-24 | shop-ops | manual-workaround (text/email intake and parts approval) | 2 |
| V5 | "Got off to an anticipated slow start." … "But business is picking up quickly now and is keeping me busy on a part time basis, which is what I wanted." … "I have picked up a few commercial accounts, Guides and charter companies in the area." … "I have branched out and now do repairs on fishing rods as well as repair reels." | retiredandfishing (Steve, new reel/rod repair business, North Oregon Coast), alantani.com | https://alantani.com/index.php/topic,27641.0.html | 2019-09-26 | shop-ops | (part-time scale; B2B guide accounts) | 1 |
| V6 | "Last night a guy picked up a repair I did and brought two 100 dollar bills for a $25.00 repair." … "I'm a retired dentist and have seen all the tricks to not pay." … "How do you guys handle repair jobs with clients you don't know? Pay first?" … "but in the future it'll be pay first." | Harry Bell, rodbuilding.org "stiffed for a repair" | https://www.rodbuilding.org/read.php?2,429833 | 2014-09-27 | shop-ops (rod repair) | manual-workaround (no deposit, no payment capture) | 2 |
| V7 | "I call my customers and let them know the repair is complete and the charge is X amount" … "If it's a person I have not dealt with and they want write a check I tell them no rod until check clears." | Dave Loren, rodbuilding.org | https://www.rodbuilding.org/read.php?2,429833 | 2014-09-27 | shop-ops | manual-workaround (phone call = status update; cheques) | 2 |
| V8 | "On a repair, I do not command an up front fee." … "their receipt for it states, goods left over 120 days without payment will be sold for charges." … "Bottom line, no payment, no rod." | Ron Weber, rodbuilding.org | https://www.rodbuilding.org/read.php?2,429833 | 2014-09-27 | shop-ops | manual-workaround (paper receipt carries the policy) | 2 |
| V9 | "My policy is 21 days after I inform you that the rod is done." | Gary Marquardt, rodbuilding.org | https://www.rodbuilding.org/read.php?2,429833 | 2014-09-27 | shop-ops | (uncollected-work rule, tracked by hand) | 1 |
| V10 | "With repairs, I'll probably just do cash in advance for everyone except repeat customers" … "they've already demonstrated to me they'll handle a financial transaction in a professional manner" | John E Powell, rodbuilding.org | https://www.rodbuilding.org/read.php?2,429833 | 2014-09-29 | shop-ops | (deposit need; repeat-customer memory) | 2 |
| V11 | "Right now I am backed up 35 orders." … "I do not take a deposit as I do not want to hold onto someone's money." … "a 2 hour customer meeting takes place before ordering a rod" … "I charge them $125 to design and build a basic rod" | Capt Neil Faulkner, rodbuilding.org "how much to charge?" | https://www.rodbuilding.org/read.php?2,414727 | 2013-10-01 | shop-ops (rod orders) | (backlog; intake by meeting) | 2 |
| V12 | "Got a few people who dropped rods off to be wrappd a while ago, haven't been given a deposit or even heard from them" | Billy Vivona, rodbuilding.org "When does it become mine?" | https://www.rodbuilding.org/read.php?2,342991 | 2010-09-13 | shop-ops | manual-workaround (no deposit, no contact record, stock sitting a year) | 2 |
| V13 | "Yes. I require a minimum 50% non-refundable deposit to accept an order for production." … "Any balance due must be collected before shipment or at the time delivery." … "100% deposits may be required for highly specialized orders." | Jim Gamble, rodbuilding.org "HOw to handle ordering" | https://www.rodbuilding.org/read.php?2,348911 | 2010-12-16 | shop-ops | (deposit flow, handled manually) | 2 |
| V14 | "50% down, 50% upon delivery puts you both on the hook. It's probably the most fair way to handle things." … (2004) "Underpromise and overdeliver," | Tom Kirkman (RodMaker editor; owner of rodbuilding.org), rodbuilding.org | https://www.rodbuilding.org/read.php?2,348911 ; https://www.rodbuilding.org/read.php?2,77606 | 2010-12-16; 2004-01-12 | shop-ops | (deposit norm; promised-date discipline) | 1 |
| V15 | "Before I purchase the componets to build a rod, I ask 50%." … "This does not give me enough to get all of the stuff, but it lets me know that the customer is serious." … "After I send them the rod and they approve of it, I ask for the other 50%." | Chris Newberg, rodbuilding.org "Taking an Order" | https://www.rodbuilding.org/read.php?2,77606 | 2004-01-12 | shop-ops | (deposit; backorders blow delivery dates [paraphrase of a further sentence]) | 2 |
| V16 | "I am thinking of having the customer pay a deposit which would cover the cost of materials when the order is placed" … "with the balance to be paid upon delivery of the finished rod." … "I was advised to set a 6-8 week delivery time, to protect against any unforseen delays, etc." | David Gilberg, rodbuilding.org | https://www.rodbuilding.org/read.php?2,77606 | 2004-01-12 | shop-ops | (deposit; lead-time promise) | 1 |
| V17 | "I also require 50% up front....NON-REFUNDABLE." | Don Morse, rodbuilding.org "charging customer?" | https://www.rodbuilding.org/read.php?2,392982 | 2012-09-13 | shop-ops | (deposit) | 1 |
| V18 | "Up until now, I've never taken payment from anyone until the work was done and approved of." | Jay Lancaster, rodbuilding.org | https://www.rodbuilding.org/read.php?2,392982 | 2012-09-13 | shop-ops | (no deposit: counter-signal) | 1 |
| V19 | "Agree on price and deposit." … "Get it in writing." | John DeMartini, rodbuilding.org | https://www.rodbuilding.org/read.php?2,392982 | 2012-09-14 | shop-ops | manual-workaround (paper) | 1 |
| V20 | "In 2015 I started my small business, offering my services on local facebook fishing pages." … "What started as a casual side hustle officially became known as Shisa Reel Service in 2020." … "a personal consultation is required before any shipped reel is accepted" (site text) … "It depends on how busy it is at the time of your request." … "We will communicate with you in advance whether your reel is repairable before any payment is required." | Shisa Reel Service (Honolulu), own site | https://shisareelservice.onuniverse.com/ourstory ; https://shisareelservice.onuniverse.com | n.d. (business 2015/2020) | shop-ops | (Facebook as the channel; consultation-by-message intake) | 1 |
| V21 | "No fishing reel repairs are completed without customer approval." … "If repair cost appear to be getting out of line you will be contacted with an estimate" … "Come see us and drop off your reels at the shows:" … "We return all questions as soon as possible." | Mat's Reel Repair (Eagle River, WI), own site (GoDaddy Website Builder) | https://matsreelrepair.com/ | 2026 (lists five 2026 expos) | shop-ops | manual-workaround (approval by phone; expo drop-offs; printed form, P68) | 2 |
| V22 | "In the case of repairs requiring parts, we will provide you with a quote for the parts and labor before proceeding." … "After invoicing you for the parts—which must be paid prior to the commencement of repairs—we will begin the work." … "Upon completion, we will invoice you for the labor and return shipping costs." … "You may pay this invoice online, and as soon as we receive the payment, we will promptly ship your reel back to you." | Valley Reel Works (Rock Hill, SC), own site (Webador) | https://www.valleyreelworks.com/ | 2026 | shop-ops | manual-workaround (two hand-raised invoices per job) | 2 |
| V23 | "PLEASE CALL OR TEXT ANYTIME BEFORE ARRIVING AT MY RESIDENCE (706) 761-2779" … (every day) "By Appointment" … "will reopen on 9/21/2026" … "Let me know if you plan on shipping or dropping off a rod or reel." | Rod & Reel Repair Guy (Valley, AL), own site (GoDaddy Website Builder) | https://fixreels.com/ | 2026 | shop-ops | manual-workaround (call/text intake; seasonal closure) | 1 |
| V24 | "All the little mom and pops have been wiped out, because it's not economically feasible." … (business) "requires 'hundreds of thousands of parts'" | Phil Evans, Rod and Reel Repair (Arlington, VA; ~30 years), WJLA "The Holdouts" | https://wjla.com/archive/the-holdouts-rod-and-reel-repair-3022 | 2010-10-12 | shop-ops | (shrinking trade; also counter-evidence N-V3) | 2 |
| V25 | "we will take a 50% non-refundable deposit to commence work, with the balance payable upon completion." … "We usually ship each custom rod within 1-3 months of ordering." … orders via "complete our Order Form" | Chris Clemes (UK split-cane rod maker), FAQ | https://www.chrisclemes.com/faq | n.d. | shop-ops (rod orders, UK) | (deposit via order form; no stated update process) | 1 |
| V26 | "Haddrell's Point is a factory authorized service station for Shimano, Penn, Daiwa, and Quantum." … "ask for Benji Griner M-F 8:30AM to 6:00PM." | iceman1051 (shop voice), charlestonfishing | https://forum.charlestonfishing.com/t/rod-and-reel-repair/30348 | 2011-03-19 | shop-ops | (phone intake to a named person) | 1 |
| V27 | "As a part job I'm nearly full in less than one year" … "I explain I not only ask money for my workmanship, but my expertise too." | Eric MONTACLAIR, rodbuilding.org | https://www.rodbuilding.org/read.php?2,414727 | 2013-10-02 | shop-ops | (capacity full) | 1 |
| V28 | "Do job pricing." … "Show parts cost on invoice as separate line item with shipping." … "clear communication of what the client is getting and an honest approach to everything" | Lou Auret, rodbuilding.org | https://www.rodbuilding.org/read.php?2,414727 | 2013-10-01 | shop-ops | (itemised invoice by hand) | 1 |
| V29 | "I try to incorporate the information in this book (and others) in my initial build request conversations." | Bob Stack, rodbuilding.org "custom rod as a side gig?" | https://www.rodbuilding.org/read.php?2,586864 | 2026-10-20 | shop-ops | (intake by conversation) | 1 |
| V30 | "wait times are just to long to run a business using their blanks." | anonymous builder, Facebook "Custom Rod Builders" post mirrored by moderator on rodbuilding.org | https://www.rodbuilding.org/read.php?2,569368,page=320 | 2025-01-17 | shop-ops | (supplier lead time pushes builders' promised dates) | 1 |

Vendor voices describing the same pain (not counted as independent sufferers):

| # | Verbatim quote | Who / where | URL | Date | Note |
|---|---|---|---|---|---|
| V31 | "For tackle shops and independent rod builders managing multiple custom orders" … "email threads and text messages become a tangled mess that's easy to lose track of." … "connect Stripe or PayPal to take deposits or full payment upfront." | Paperform, "Custom Fishing Rod Order Form" template | https://paperform.com/templates/custom-fishing-rod-order-form/ | n.d. | A form vendor has already written this candidate's pitch. |
| V32 | "makes it easy for custom rod builders, reel repair services and fishing rod service centers to generate work request forms" (snippet) | GoCanvas, "Fishing Rod and Reel Repair Request Form" template | https://gocanvas.com/mobile-forms-apps/11152-Fishing-Rod-and-Reel-Repair-Request-Form | n.d. | Form only; integrations "QuickBooks, Google Sheets, Dropbox, Salesforce". |
| V33 | "Retailers are purchasing the software to handle:" … "Manage rod and lure repairs." | Tower Systems (AU/NZ POS vendor) blog | https://blog.towersystems.com.au/?p=16275 | 2016-08-12 | Repairs is a named buying reason for AU fishing shops. |

### 1b. Angler side (new rows; see also M1, M2, M20–M26, M29, M33–M37, S3–S7, S13, S14, P93–P95)

| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Int |
|---|---|---|---|---|---|---|---|
| V34 | "I used OE's guy (doesn't do reels anymore) once and he had my reel for three months." … "I had to start calling him every day, finally got it back but what a pain...." … "I sent my reel to him via OE and it came back in a week with "changed my mind, don't really want to service reels"" … (2015) "you never know if their reel repair guy of the week is going to show up and actually work on the reel" | Bodofish, Northwest Fishing Reports forum | https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=160872 ; https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=216314 | 2012-06-18; 2015-02-04 | gear-maintenance | (no status; chasing by phone; tech churn) | 2 |
| V35 | "Turns out they dont service reels anymore." … (2015) "He told me that the guy who was doing reels for him, has since gone back to Boeing." | The Quadfather, NWFR | same two URLs | 2012-06-18; 2015-02-10 | gear-maintenance | abandoned (service disappears) | 2 |
| V36 | "Good Luck. I used to drop reels and Downriggers off at John's. Now what?" … "You can drop off your reels at John's and Mahomid will come get them." … "Or call him direct at (425) 259-1811." | MotoBoat, NWFR | https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=160872 | 2012-06-19 | gear-maintenance | (intake via a counter and a phone number) | 2 |
| V37 | "I called John about a year ago and was told they could not get bearings for common reels." | strider43, NWFR | https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=216314 | 2015-02-11 | gear-maintenance | missing (parts) | 1 |
| V38 | "they took months and I had to call them to continually get an update." … (another shop) "they were fantastic. Highly recommended." … "$35 was the charge since I did not need any parts replaced." | shoffer, Texas Kayak Fisherman forum | https://texaskayakfisherman.com/forum/viewtopic.php?p=2339973 | 2024-02-13 | gear-maintenance | (no status; price anchor) | 2 |
| V39 | "they blew there timeline and the kicker was that they told me my reels were ready when they weren't." … "Tackle hut was cheaper and much quicker than FTU." | OldTownYakBoi, TKF | same | 2025-01-13 | gear-maintenance | inaccurate (wrong "ready" status) | 3 |
| V40 | "After discovering Tackle Hut in Houston (and just horrific experience at FTU), I'll never use anyone else." | 1963Christopher, TKF | same | 2025-01-15 | gear-maintenance | (switched shop) | 3 |
| V41 | "FTU takes forever but the work they do is fine." … "my reels are always done before the estimated date given at drop off." | LocoSeamonkey, TKF | same | 2025-02-21 | gear-maintenance | (a date given at drop-off is the differentiator) | 2 |
| V42 | "Cost $70 and really didn't make much of an improvement." | karstopo, TKF | same | 2025-01-08 | gear-maintenance | too-expensive / inaccurate | 1 |
| V43 | "Anglers Anonymous doesn't service reels the size I have." | deptrai, TKF | same | 2024-02-13 | gear-maintenance | missing (scope) | 1 |
| V44 | "I entrusted my reel to Otto's for repair, with the expectation of a prompt resolution within approximately two weeks." … "subsequent updates on the progress were scarce." … "Despite assurances of timely communication upon completion, I received no further updates." | Chris, Trustpilot (Otto's Tackle World, Sydney; 1 star) | https://ie.trustpilot.com/review/ottostackleworld.com.au | 2024-03-13 | gear-maintenance | (no status; search summary says he took the reel elsewhere after ~4 months) | 3 |
| V45 | "I sent a reel in under warranty 6 weeks ago for repair and have not heard anything back" (snippet) | reviewer, Trustpilot (PENN) | https://es.trustpilot.com/review/pennfishing.com | n.d. | gear-maintenance | (OEM: no status) | 2 |
| V46 | "didn't call me back when he said he would and never responded to my voice messages" (snippet) | handle n/a, BassResource "Daiwa warranty" | https://www.bassresource.com/bass-fishing-forums/topic/144588-daiwa-warranty/ | n.d. | gear-maintenance | (no callbacks) | 2 |
| V47 | "They have a website with a repair form to print and put in box with reel." … "One just needed cleaning $29.99 and $15.00 FedEx." | HomerRudd, TigerDroppings | https://www.tigerdroppings.com/rant/outdoor/fishin-reel-repair/120703280/ | 2025-10-18 | gear-maintenance | manual-workaround (printed form in the box) | 1 |
| V48 | "They can get backed up at times but do a good job." … "usually gets it turned around in about a week." | The Last Coco, TigerDroppings | same | 2025-10-21 | gear-maintenance | (backlog) | 1 |
| V49 | "Not too difficult to box up your reels and ship them to him." | Sea Hoss, TigerDroppings | same | 2025-10-18 | gear-maintenance | (mail-in norm) | 1 |
| V50 | "Tony did a bunch of work for me years ago but I thought he retired?" | chowder, Lake Ontario United | https://www.lakeontariounited.com/fishing-hunting/topic/85867-reel-repairs/ | 2020-04-28 | gear-maintenance | abandoned (retirement uncertainty) | 1 |
| V51 | "There is a guy on Facebook. Rochester reel repair." / "Rochester Reel Repair check him out on Facebook. Brian at 585-455-1792" | hookedupf7 / oneluvunknown, Lake Ontario United | same | 2020-04-28 | gear-maintenance | (discovery via Facebook + a phone number; no web intake) | 1 |
| V52 | "Don't want to ship to tuna toms if it's not required." (and asks how long repairs take) … reply "I would guess 2-3 weeks" | JonZ / scobar, Lake Ontario United | same | 2020-04-28 | gear-maintenance | (no published turnaround) | 1 |
| V53 | "more drop off local, it is a £500 reel so not to happy about sending it in the post" … "Spoke to them £20+ any parts with pnp included in that price." … (six days later, DIY) "2x spool bearings and 1x drag bearing at a cost of £17, runs like a dream now" | northeast1, NESA forum (UK) | http://nesa.co.uk/forum/forum/nesa/boat-fishing/347502-servicing-of-shimano-reels | 2015-11-04 to 11-10 | gear-maintenance (UK) | DIY after no local option (counter-evidence too) | 2 |
| V54 | "engineer will tell you exact price, and any parts needed based on individual requiements over the phone." | Raptor1, NESA (UK) | same | 2015-11-05 | gear-maintenance (UK) | (quoting by phone, even at the OEM) | 1 |

Paraphrased by the fetch tool, not counted, kept for context: Mike Barkley (rodbuilding.org,
2010-09-13) requires a signed form that rods not collected within 30 days of the completion
notice are disposed of; John M. Hernandez uses a signed 90-day window with three notices; Doc
Labanowski's contracts had 50% deposit, balance on delivery, 90-day pickup; Capt Neil Faulkner
(2010-09-14) said that from 2011 a deposit would be required before scheduling. All at
https://www.rodbuilding.org/read.php?2,342991.

**Three-line summary.** Today: techs and builders take jobs by phone, text, Facebook message, a
printed form in the box or a two-hour meeting; the queue is dates written on boxes or a mental
list; status is a phone call from the customer, or from the tech when it's done; money is 50%
deposits (builders), parts prepaid by hand-raised invoice, cheques that must clear, or cash on
pickup; uncollected work is handled by a rule on a paper receipt. They want: fewer calls
("Greasy Hands, cannot always pick up the phone"), a date promised at drop-off and kept
(V41, V39), customers who are "serious" (a deposit, V15), and a parts-approval step that
protects them (V21, V22). Price said: nobody on the business side names a software budget; the
only money numbers are the job prices ($20–$70 per reel, $100–$125+ per rod) and 50% deposits.

**Feature → pain map (for criterion 1).**

| Core feature | Resolves |
|---|---|
| Intake form with reel model/problem | V2 (web form + manual re-typing), V3 (box marking), V4/V23 (text/call intake), V20 (consultation by message), V36/V51 (phone-number intake), V47 (printed form) |
| Stripe deposit at intake | V6, V10, V12, V13, V15–V17, V19, V25 (deposits done by hand or not at all; non-payment) |
| Job board with statuses and promised date | V3 (60 in line), V11 (35 orders), V27 (full), V39 (told "ready" when not), V41 (date at drop-off), M26/S4/S5 (5–8 week waits) |
| Customer status page + automatic updates | V7 (phone call when done), V34, V38, V44–V46, V52 (customers chasing), M1/S5 |
| Quote/approve step for parts | V4, V21, V22, S13 (quote before work, parts prepaid by invoice), V54 (quoting by phone) |
| Service history per customer/reel | V10 (repeat-customer memory), V12 (no record of who dropped what), V8/V9 (uncollected rules), M48 (one angler keeps a spreadsheet) |
| Public "send us your reel" page | M20, M22, M25, V35–V37, V50–V51 (anglers can't find or re-find a tech; discovery via Facebook and word of mouth) |

---

## 2. Pool size with derivations

| Segment | Estimate | Derivation (inputs by id) | Confidence |
|---|---|---|---|
| (a) US businesses that take in reels for service/repair | **800–1,400 listed; core dedicated techs 500–900** | Yellow Pages category "Fishing Tackle Parts & Repair": TX 36, FL 155, CA 60, NY 34, VA 7 (VS20–VS24). The four states with licence counts (TX 1,837,344; CA 1,610,505; FL 1,566,816; NY 882,451 = 5,897,116, M40) hold 18.3% of 32.24M US paid licence holders (M39) → 285 ÷ 0.183 ≈ **1,560** US listings carrying the tag. Spot checks: in VA 4 of 7 are dedicated repair names (Rod & Reel Repair, Larry's Rod & Reel Repair, SharpReel, Kippersticks); in TX and CA roughly half are generic bait-and-tackle or manufacturers (Daiwa Corp, Phenix) → dedicated share 40–60% ≈ 600–950. Correction upward for techs who are not in YP at all (Facebook-only: Rochester Reel Repair V51; Shisa V20; the six Houston shops named in V38–V43 vs three YP-tagged in Houston, VS15): +30–50%. Prior estimates: P123 250–750; E13 1,000–2,500. New range sits between them. | Low–medium |
| (a′) Manufacturer-authorised centres (a floor and an outreach list) | **tens, not hundreds**, per brand | Shimano US: 2 direct centres (Ladson SC, Irvine CA) plus a locally.com map not enumerable (VS25); "26 Satellite Service Centers" in dated press (P80). PENN: Philadelphia factory, "local authorized reel warranty center" with no public list, two named Canadian shops (VS26). Daiwa US: "Authorized Warranty Centers" via a locator link (snippet, VS27). Multi-brand overlap is the norm (Haddrell's: Shimano, Penn, Daiwa, Quantum, V26). ORCA repairmen list: 4 (VS28). alantani.com "Reel Repair Service Centers" board: 58 topics (VS29). | Medium (as a floor) |
| (b) US custom rod builders who sell to customers | **1,500–4,000** | ICRBE draws 2,000–2,500 builders a year (2011: ~3,000; VS30–VS32), 60+ booths. rodbuilding.org ≈ 1,926 pages × 50 ≈ 96,000 topics (VS33). Kirkman: "Some people make a full time living at it. Others would starve trying that." (VS34) and a promotion push could add "many hundreds" of builders a year (VS35). Assume 40–60% of expo attendees sell rods (800–1,500) and attendees are one in two to three of all sellers → 1,600–4,500. YP "custom fishing rods" finds only FL 6, TX 6, CA 4 (VS36): home-based builders are invisible to directories, so directory counts are useless here. One factory (Kistler) alone assembles ~10,000 rods/yr (VS37). | Low |
| (c) Rod repair services | **no separate pool** | Rod repair is done by the same people: Rod & Reel Repair Guy (P71), Mat's, Steve in Oregon "branched out" (V5), Ed's (P74), Harry Bell (V6). Add 0–20% to (a). | — |
| (d) Tackle shops with a service counter | **1,000–1,600 (overlaps a)** | ≈1,560 YP repair-tagged listings (above) ÷ 15,548 tackle shops (M47) ≈ 10%. Pattern confirmed by shop-inside-store examples: Haddrell's (V26), FTU/Tackle Hut/Serious Tackle/Anglers Anonymous (V38–V41), Otto's (V44), Marine Deals (S13). | Low–medium |
| (e) UK, Canada, Australia | **250–450 combined** | Scale by angler counts vs US 32.24M licence holders (M39): Canada 3.24M (M77) ≈ 10% → 80–140 (YP.ca indexes only 2, VS38; PENN names 2 authorised Canadian shops; Mike's Reel Repair employs five, VS39). Australia 4.2M (M79) ≈ 13% → 100–180 (Shimano AU central centre, 20 business days, VS40; Daiwa AU central, P77; Otto's ~1 week, VS41; Tower Systems prices fishing shops as its own vertical, VS42). UK: 0.83M licensed freshwater anglers (M75) plus unlicensed sea anglers; Shimano UK service is one central site (Felindre, V53–V54); yell.com blocked → 50–120. | Low |
| **US total addressable** | **≈2,000–4,500 businesses** (repair 800–1,400 + builders 1,500–4,000, less ~20% overlap) | | Low |

Volume per business (sets the tool's value): Alan Tani, as a side business, "fixing reels at a
clip of about 100 a month" with "60 reels in line" (V3); a Shimano technician posting sets a
quota of "ten reels per day" (snippet, VS43) ≈ 2,400/yr per full-time tech; Mike's Reel Repair
runs a 2,300 sq ft warehouse with five employees (VS39); Capt Neil Faulkner "backed up 35
orders" (V11); Dave's "8 Week Turnaround" (P69). Most independents are one person, part-time
(V5, V20, Steve "part time basis").

---

## 3. Named channels with reach and first-100 math

Assumptions stated per row; conversion = trial that becomes paying within the period. Prices
assumed $19–$39/mo (monetization §7f).

| # | Channel | Reach (sourced) | Assumption | Paying users |
|---|---|---|---|---|
| 1 | Direct outreach to listed repair businesses (email/phone/FB page), founder as peer | ≈1,560 US YP repair-tagged listings (derived, VS20–VS24, M39, M40); alantani service-centre board 58 topics (VS29); ORCA 4 (VS28); brand locators (VS25–VS27) | 1,000 reachable; cold B2B peer outreach 2–4% | **20–40** |
| 2 | alantani.com (Reel Repair by Alan Tani) | 17,263 members, 454,886 posts, 35,661 topics; boards: Reel Repair Service Centers 58/1,215, Member Services 33/386, CJ's Reel and Rig 16/149 (VS29) | 300–600 members are working or side-hustle techs; a peer thread offering a free season: 3–5% | **10–30** |
| 3 | rodbuilding.org + ICRBE (Winston-Salem, Feb 20–21 2027) | ~96k topics (VS33); "Solicitations" sticky governs commercial posts (VS33); expo 2,000–2,500 builders, 60+ booths (VS30–VS32) | A booth or a sponsor post reaches 2,500; 1–2% sign up, half pay | **12–25** (not inside 90 days: expo is Feb 2027) |
| 4 | Facebook: "Custom Rod Builders" group (its posts are mirrored to rodbuilding.org: 8,297 mirrored posts since 2024-09, VS33), local fishing pages (V20), shop pages (V51) | **Member counts not retrievable** (login wall; see §0) | Assume 5–10k members; 0.3% | **15–30** (low confidence) |
| 5 | Supplier partners: Mud Hole (YouTube 73.4K subs / 28.3M views, VS44; classes, 50-year anniversary VS45), Smooth Drag/Carbontex (alantani board 324 topics, VS29), Mystic Reel Parts/Scott's Bait & Tackle (alantani board 37 topics), Batson, Hedgehog Studio | One partner newsletter/forum mention to its builder/tech customers | 0.2–0.5% of a 5–10k list | **10–20** |
| 6 | stripersonline Reel Maintenance and Repair (34.6k posts) and Rod Building Forum (131.8k posts) (VS46) | Mostly anglers, a few techs; useful for the customer-facing page and SEO | — | **0–5** |
| 7 | YouTube reel-repair creators: 2nd Chance Tackle 42,809 subs / 4,203 videos / ~11.1M views (snippet, VS47); Mud Hole (above) | DIY audiences, not buyers; a creator might adopt the status page for their own mail-in service | — | **0–5** |
| 8 | Hampton Roads in person: VA 7 repair-tagged (VS24), Virginia Beach "fishing reel repair" 33 listings incl. Princess Anne Distributing (VS19), the founder's drop-off partner (P1) | 10 shops visited | 30–60% | **3–6** |
| 9 | Built-in loop: every shop's public "send us your reel"/status page is indexable for "[city] reel repair" (demand shown by M20, M22, M25, V35–V37, V50–V52) and carries a "powered by" link | Starts producing after ~20 shops are live | — | +10–20% after month 6 |

**Sum:** 70–160 paying over about 12 months if all channels are worked; **inside 90 days,
realistically 10–25** (rows 1, 2 and 8), because (i) the expo is in February, (ii) several shops
close in late summer/autumn (Fischer Jul 15–Sep 15, P70; Dave's Aug 25–Oct 15, P69; fixreels
reopened 9/21/2026, V23) and techs change tooling in the November–February lull ("Dont wait till
March", M44), and (iii) Facebook reach is unmeasured.

---

## 4. What they pay today

| Item | Evidence | Price | Src |
|---|---|---|---|
| Website builders actually used by reel shops | Fischer Angling: WordPress; Mat's and Rod & Reel Repair Guy: GoDaddy Website Builder; Valley Reel Works: Webador; Shisa: Universe; Storm Proof: template site with "Book NOW" → "#" | $0–$30/mo class | VS48–VS51, P1 |
| Payment today | cheque in the return envelope (V3); cash/check/card/PayPal (P68); check/money order/PayPal, pay before return (P72); parts invoice then labour invoice, paid online (V22); cash on pickup, cheques must clear (V7, V8) | Processor fees only | V3, V7, V8, V22, P68, P72 |
| Square Appointments | Free $0; Plus $49/mo per location; Premium $149; 2.6%+15¢ (own page 429 here and in P102) | $0–$149 | P102 |
| Square item "prep time" for a rod builder | "only up to one day of prep" — workaround was a checkout note | — | V1 |
| Shopify | Basic $39/mo ($29 annual); Grow $105; POS Pro $89/location | $39+ | P103 |
| Lightspeed Retail | $89 / $149 / $289 | $89+ | P104 |
| QuickBooks Online | Simple Start $38; Essentials $85; Plus $140; Advanced $340 (regular prices) | $38+ | VS52 |
| Jobber (field-service) | Core $49/mo monthly, $21/mo annual (1 user); Connect $139 monthly / $70 annual | $21–$139 | VS53 |
| RepairDesk / RepairShopr / Digital Wrench / RepairTRAX | $99 ($79 annual) / $69.99 / $39.95 / $30 per user | $30–$149 | P111–P113 |
| GoCanvas (has a rod & reel repair form template) | $29 / $39 / $49 per user per month, "3 user minimum, billed annually" → $87+/mo | $87+ | VS54, V32 |
| Paperform (has a custom rod order template with Stripe deposits) | Free $0 (Stripe included); Pro $49/mo annual ($59 monthly); Business $124 ($149) | $0–$149 | VS55, V31 |
| Tower Systems (AU/NZ fishing-shop POS with "Repairs and Job Management") | Startup A$145, Standard A$233, Advanced A$265, Ultimate A$298 inc GST per month billed annually ($149/$250/$285/$320 monthly); Repairs module in Advanced and Ultimate only; 2023 blog priced "Fishing and outdoors businesses" at "$165/month"; "3,500+ customers in Australia and New Zealand" (all verticals) | A$265+/mo for repairs | VS42, VS56, VS57 |
| Job prices (what the tool protects) | $25/$29/$35 service, $20 tune-up (Doug's, VS58); $35 no-parts (V38); $29.99 + $15 FedEx (V47); $70 (V42); £20+ UK OEM (V53); P67–P73 tables | $20–$100 per reel | VS58, V38, V42, V47, V53, P67–P73 |
| Rod job prices | $125 basic custom (V11); "less than $100 per rod" is the floor Kirkman names (VS59); $25 repair (V6); 50% deposits standard (V13–V17, V25) | $25–$275+ | V6, V11, V13–V17, V25, P71 |
| Deposit / turnaround policies | 50% non-refundable (builders); estimate fee $15–$20 waived if work proceeds (P67, P68); parts prepaid (V22); 5–7 business days (P67), ~1 week (VS41, V38), 2 weeks (V20), 10 days (P70), 3 weeks for a repair (VS58), 4+ weeks (S13), 8 weeks (P69), 20–30 business days OEM (P77), 6–8 weeks rod (V16), 1–3 months rod (V25); uncollected: 21 days (V9), 30 days (Barkley, paraphrase), 120 days (V8), 3 months (S13) | — | as listed |

Read-across: at 30–100 reels a month × $25–$50, a shop grosses $750–$5,000/mo; $29/mo is 0.6–4%
of that. Rod builders already run 50% deposits by hand, so a deposit flow is a fit, not a new
behaviour. Nobody surveyed pays for a job-tracking tool today; the nearest paid tools are generic
($30–$149) or a form builder with a free tier (Paperform), which caps the price.

---

## 5. Incumbents and defensibility

**Fishing-specific job/repair tracking products found: none in the US.** Searches for "reel
repair software", "reel service software", "tackle shop repair tracking", and each repair-SaaS
name with "fishing reel"/"rod and reel" returned only (VS60):
- **Tower Systems** (AU/NZ): POS for "Fishing Store" retailers; "Repairs and Job Management" in
  the A$265+ tiers; search summary of its feature post says it tracks repairs in house or with
  third parties and texts customers when items are ready (VS42, VS56, VS57). Not sold in the US;
  POS-first; 3,500+ customers across all retail verticals.
- **GoCanvas** "Fishing Rod and Reel Repair Request Form" template (form only; $87+/mo; V32).
- **Paperform** "Custom Fishing Rod Order Form" template (form + Stripe deposits; Free tier; V31).
- **RepairDesk / RepairShopr** market to phone/computer/jewellery shops; RepairDesk's 2026 blog
  "Still Using Spreadsheets to Run Your Repair Shop?" is generic (VS61). No fishing marketing
  found.
- **Fishbrain, Omnia, Mud Hole:** nothing. Mud Hole sells components, classes and media
  (VS44, VS45); its revamped website is a store (VS62).
- **Square:** a rod builder asked for multi-week lead times in 2023 and got a workaround from a
  community champion (V1).

**Switching costs once adopted:** per-reel and per-customer service history accumulates (the
"repeat customer" memory in V10); the shop's public intake/status URL goes on tags, Facebook
posts and the printed form; Stripe deposits and parts invoices run through it; customers learn
the status page. Data is small and exportable, so lock-in is moderate, not strong.

**Why an incumbent would not trivially take it:** the pool is 2,000–4,500 US businesses paying
$19–$39/mo (ceiling ≈ $1–2M/yr), below Square/Shopify's attention; Tower is AU/NZ POS; general
repair SaaS prices at $70–$149 for multi-tech shops. The founder's distribution (peer on
alantani/rodbuilding, own shop as live demo, Hampton Roads shops) is the only moat that exists
on day one. Risks: Paperform/Jotform templates plus a Stripe link already cover intake +
deposit for $0; Mud Hole could bundle an order tool for builders (no sign of it).

---

## 6. Counter-evidence

| # | Verbatim quote / fact | Who / where | URL | Date | Note |
|---|---|---|---|---|---|
| N-V1 | "Do it yourself. Believe it or not, reel repairs aren't that hard to do." | sszoldra, Lake Ontario United | https://www.lakeontariounited.com/fishing-hunting/topic/85867-reel-repairs/ | 2020-04-28 | DIY culture |
| N-V2 | "2x spool bearings and 1x drag bearing at a cost of £17, runs like a dream now" (after being quoted £20+ by the OEM) | northeast1, NESA (UK) | http://nesa.co.uk/forum/forum/nesa/boat-fishing/347502-servicing-of-shimano-reels | 2015-11-10 | DIY beats the shop on price |
| N-V3 | "All the little mom and pops have been wiped out, because it's not economically feasible." | Phil Evans, WJLA | https://wjla.com/archive/the-holdouts-rod-and-reel-repair-3022 | 2010-10-12 | Shrinking pool |
| N-V4 | "Just looking to see if there's any interest on someone purchasing my parts supply?" (thread titled "Retiring") | reel bob, alantani.com | https://alantani.com/index.php/topic,37014.0.html | 2023-06-26 | Tech retiring; see also M27/S17 (Mr Blocker, 2010) and V50 |
| N-V5 | "Turns out they dont service reels anymore." / "changed my mind, don't really want to service reels" | The Quadfather / Bodofish, NWFR | https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=160872 | 2012-06-18 | Shops drop the service line; part-timers quit |
| N-V6 | "I used to drop reels and Downriggers off at John's. Now what?" … "Mahamad got called back to Boeing and that was the reel repair guy" | MotoBoat, NWFR | same | 2012-06-19 | The tech is one person with a day job |
| N-V7 | "friend's repair business … eventually had to close his business" (snippet paraphrase) | handle n/a, BassResource "tackle repair" | https://www.bassresource.com/bass-fishing-forums/topic/221029-tackle-repair/ | n.d. | Closure |
| N-V8 | Fischer Angling "will be on an extended vacation from July 15th through September 15th"; Dave's closed Aug 25–Oct 15; fixreels "will reopen on 9/21/2026" | shop sites | https://fischeranglingpro.com/ ; P69 ; https://fixreels.com/ | 2026 | Seasonal closures → annual plans lapse (monetization §9) |
| N-V9 | "usually send reels in during the off-season and tell him no hurry" | handle n/a, BassResource (S20) | https://www.bassresource.com/bass-fishing-forums/topic/114466-mike-at-dvt/ | n.d. | Customers tolerate slow off-season service; little pressure for status |
| N-V10 | "fixing reels at a clip of about 100 a month." with dates written on boxes and cheques by mail | Alan Tani | https://alantani.com/index.php/topic,277.0.html | 2009 | A respected tech ran 100/month with no software |
| N-V11 | "keeping me busy on a part time basis, which is what I wanted." / "What started as a casual side hustle" | retiredandfishing; Shisa | https://alantani.com/index.php/topic,27641.0.html ; https://shisareelservice.onuniverse.com/ourstory | 2019; n.d. | Many techs do not want to scale; a $29/mo tool competes with "free and fine" |
| N-V12 | "I do not take a deposit as I do not want to hold onto someone's money." … "a 2 hour customer meeting takes place before ordering a rod" | Capt Neil Faulkner, rodbuilding.org | https://www.rodbuilding.org/read.php?2,414727 | 2013-10-01 | Relationship-based intake; deposits seen as unfriendly by some |
| N-V13 | "Up until now, I've never taken payment from anyone until the work was done and approved of." | Jay Lancaster, rodbuilding.org | https://www.rodbuilding.org/read.php?2,392982 | 2012-09-13 | No deposit culture (minority) |
| N-V14 | "Come see us and drop off your reels at the shows:" | Mat's Reel Repair | https://matsreelrepair.com/ | 2026 | Intake at expos, not online |
| N-V15 | "Generally not, due to the risk of breakage during disassembly and lack of parts available." (on servicing spinning reels) | Shisa Reel Service | https://shisareelservice.onuniverse.com | n.d. | Supply constraint, not demand |
| N-V16 | Paperform Free tier includes Stripe payments; template exists for custom rod orders | Paperform | https://paperform.com/pricing ; https://paperform.com/templates/custom-fishing-rod-order-form/ | 2026 | $0 substitute for intake + deposit |
| N-V17 | "A repair shop spreadsheet can feel perfectly fine when the day is calm, and the same one or two people touch every repair." (snippet) | RepairDesk blog | https://blog.repairdesk.co/2026/04/28/still-using-spreadsheets-to-run-your-repair-shop-heres-what-its-costing-you/ | 2026-04-28 | Even the vendor concedes spreadsheets suffice at one-or-two-person scale, which is most of this pool |
| N-V18 | DIY audiences: Mud Hole 28.3M views, 73.4K subs; 2nd Chance Tackle ~11.1M views, 42.8K subs; Van Staal publishes a "Self-Service" page; service interval 12–18 months light use | vidIQ; socialcounts snippet; Pure Fishing | https://vidiq.com/youtube-stats/channel/@MudHoleCustomTackle/ ; https://socialcounts.org/youtube-live-subscriber-count/UCbNyOpdEZDO6H93bLm6lP9w ; https://www.purefishing.com/van-staal-self-service | 2026-10-18; 2026-08; n.d. | Per-video view counts not obtainable (§0) |
| N-V19 | YP Texas "custom fishing rods": of 6 listings, 2 marked CLOSED, 1 MOVED, 1 "closed now" | Yellow Pages | https://www.yellowpages.com/search?search_terms=custom+fishing+rods&geo_location_terms=TX | 2026-10-20 | Storefront builders are rare and closing; builders are home-based |
| N-V20 | No tech found saying "I don't want customers tracking jobs". Closest is the opposite: "Greasy Hands, cannot always pick up the phone." (V4). Absence noted. | — | — | — | — |

---

## 7. Honest verdict per gate criterion

| Criterion | Likely | Why (≤80 words) |
|---|---|---|
| 1 Functionality case | **PASS** | 29 business-side and 21 angler-side independent verbatim examples across 9 and 7 platforms. The pain is concrete: intake by call/text/box, status by phone, deposits and parts approval by hand, uncollected work, wrong "ready" calls. Weakness: much of it is 2004–2015 forum material and the workarounds are cheap and tolerated; intensity is mostly 2, with 3s on the angler side (switched shops) rather than the buyer side. |
| 2 Willingness to pay | **MARGINAL (lean PASS at $19–$29)** | Nobody in this pool pays for job tracking today; sites run on GoDaddy/Webador/WordPress and PayPal/cheques. Comparable paid tools exist ($30–$149 generic repair SaaS; Tower A$265+ in AU) but for larger shops. Free substitutes (Paperform + Stripe, Square Free) cap price. Supporting signals: 50% deposits are already the norm (builders), $25–$100 jobs, 100 reels/month at one side business. Needs 5 paying pilots to pass cleanly. |
| 3 Organic marketability | **MARGINAL (FAIL at 90 days, PASS at ~12 months)** | Pool ≈2,000–4,500 US businesses, 250–450 abroad. Channels are real but narrow: direct outreach to ~1,500 listings, alantani.com (17,263 members), rodbuilding.org/ICRBE (2,500 builders, Feb 2027), supplier partners. Facebook reach unmeasured. Math gives 70–160 paying in 12 months, 10–25 in 90 days; season closures and off-season tooling decisions push conversions to Nov–Feb. |
| 4 Low resource requirement | **PASS** | No licensed data, no network effect, no moderation at scale, no hardware. Inputs are the shop's own jobs; Stripe for deposits; email/SMS for updates (SMS cost is the only variable). Nothing here depends on third-party fishing data. |
| 5 Defensible enough | **PASS (weak)** | No fishing-specific incumbent in the US; Tower is AU/NZ POS; general repair SaaS ignores fishing; Square/Shopify treat multi-week custom jobs as an edge case. Segment too small for them. Moat is founder distribution and accumulated per-reel history; lock-in moderate. Form-builder templates (Paperform, GoCanvas) are the realistic substitute. |
| 6 Economics | **PASS at price ≥$19, if churn is seasonal-tolerant** | 100 users × $19–$29 = $1,900–$2,900/mo against Supabase Pro $25 + Netlify + email/SMS; break-even well under 100 users. Risk is churn at the first off-season renewal (monetization §9) and the $1–2M/yr ceiling at full penetration (P126 arithmetic), which makes it a wedge or lifestyle product, not a scale outcome. Not re-costed here. |

---

## 8. Sources

| ID | Claim / number | Value | Publisher | URL | Published | Accessed | Used in |
|----|----------------|-------|-----------|-----|-----------|----------|---------|
| VS1 | Travis1836 (custom rod builder) on Square: prep time "only up to one day"; builds "a few days to two or three weeks" | verbatim | Square Seller Community (user post) | https://community.squareup.com/t5/Questions-How-To/How-would-I-show-my-customers-order-wait-time-or-how-long-an/td-p/639869 | 2023-02-26 | 2026-10-20 | V1, §4, §5 |
| VS2 | Doug's Reel Repair: online form, text/email confirmation, 80% service / 20% repair, $25/$29/$35, $20 tune-up, repair "may take three weeks" | verbatim | Pond Boss (PDB) magazine, Dan Armitage | https://www.pdbmagazine.com/2023/03/preseason-reel-repair | 2023-03 | 2026-10-20 | V2, VS58, §4 |
| VS3 | Alan Tani intake rules: "about 100 a month", "about 60 reels in line", dates on the box, cheque in return envelope, "a little backed up" | verbatim | alantani.com (forum owner post) | https://alantani.com/index.php/topic,277.0.html | 2009-03-17 to 2013-02-10 | 2026-10-20 | V3, §2, §6 |
| VS4 | Maybe We Can Fix It (Orange, CA): "Text or email me for a repair/service quote"; parts "quoted prior to purchase"; "Greasy Hands" | verbatim | alantani.com (shop owner post) | https://alantani.com/index.php/topic,32169.0.html | 2020-10-24 to 2020-12-13 | 2026-10-20 | V4 |
| VS5 | North Oregon Coast reel/rod repair start-up: slow start, part-time, guide/charter accounts; Bryan Young "I talk with every part I send out and each reel I repair" | verbatim | alantani.com | https://alantani.com/index.php/topic,27641.0.html | 2019-02-08 to 2019-09-26 | 2026-10-20 | V5, §6 |
| VS6 | rodbuilding.org "stiffed for a repair": Bell, Loren, Weber, Marquardt, Powell quotes | verbatim | rodbuilding.org (Tom Kirkman's board) | https://www.rodbuilding.org/read.php?2,429833 | 2014-09-27 to 09-29 | 2026-10-20 | V6–V10 |
| VS7 | rodbuilding.org "how much to charge?": Faulkner "backed up 35 orders", no deposit, 2-hour meeting, $125; Montaclair "nearly full"; Auret invoice line items; Kirkman "<$100 per rod" floor | verbatim | rodbuilding.org | https://www.rodbuilding.org/read.php?2,414727 | 2013-09-30 to 2016-06-15 | 2026-10-20 | V11, V27, V28, VS59 |
| VS8 | rodbuilding.org "When does it become mine?": Vivona dropped-off rods, no deposit; Barkley 30-day signed form, Hernandez 90 days, Labanowski contract (paraphrases) | verbatim + paraphrase | rodbuilding.org | https://www.rodbuilding.org/read.php?2,342991 | 2010-09-13/14 | 2026-10-20 | V12, §1 note |
| VS9 | rodbuilding.org "HOw to handle ordering": Gamble 50% non-refundable; Kirkman 50/50 | verbatim | rodbuilding.org | https://www.rodbuilding.org/read.php?2,348911 | 2010-12-16 | 2026-10-20 | V13, V14 |
| VS10 | rodbuilding.org "Taking an Order": Newberg 50%; Gilberg deposit for materials, 6–8 weeks; Kirkman "Underpromise and overdeliver" | verbatim | rodbuilding.org | https://www.rodbuilding.org/read.php?2,77606 | 2004-01-12 | 2026-10-20 | V14–V16 |
| VS11 | rodbuilding.org "charging customer?": Morse, Lancaster, DeMartini and 12 others on 50% deposits | verbatim | rodbuilding.org | https://www.rodbuilding.org/read.php?2,392982 | 2012-09-13/14 | 2026-10-20 | V17–V19 |
| VS12 | Shisa Reel Service: started 2015 "on local facebook fishing pages"; consultation before shipping; 2 weeks; spinning reels "Generally not" | verbatim | Shisa Reel Service (shop site) | https://shisareelservice.onuniverse.com/ourstory ; https://shisareelservice.onuniverse.com | n.d. | 2026-10-20 | V20, N-V11, N-V15, §4 |
| VS13 | Mat's Reel Repair: approval before repairs, estimate if cost rises, drop off at five 2026 expos; GoDaddy builder | verbatim | Mat's Reel Repair (shop site) | https://matsreelrepair.com/ | 2026 | 2026-10-20 | V21, N-V14, §4 |
| VS14 | Valley Reel Works: parts quoted and prepaid by invoice, labour invoiced on completion, paid online; $15 estimate; 5–7 business days; Webador | verbatim | Valley Reel Works (shop site) | https://www.valleyreelworks.com/ | 2026 | 2026-10-20 | V22, §4 |
| VS15 | Yellow Pages "fishing reel repair" Houston: "Showing 1-30 of 47"; repair-tagged in first 30: Fischer Angling, FTU ×2 | 47 | yellowpages.com | https://www.yellowpages.com/search?search_terms=fishing+reel+repair&geo_location_terms=Houston%2C+TX | 2026-10-20 | 2026-10-20 | §2 |
| VS16 | Yellow Pages "fishing reel repair" Los Angeles: 18 results; 1 repair-tagged (Jeff's Tackle) | 18 | yellowpages.com | https://www.yellowpages.com/search?search_terms=fishing+reel+repair&geo_location_terms=Los+Angeles%2C+CA | 2026-10-20 | 2026-10-20 | §2 |
| VS17 | Yellow Pages "fishing reel repair" Miami: 74 results; 2 repair-tagged in first 30 | 74 | yellowpages.com | https://www.yellowpages.com/search?search_terms=fishing+reel+repair&geo_location_terms=Miami%2C+FL | 2026-10-20 | 2026-10-20 | §2 |
| VS18 | Yellow Pages "fishing reel repair" Seattle: 26 results; 1 repair-tagged (commercial marine) | 26 | yellowpages.com | https://www.yellowpages.com/search?search_terms=fishing+reel+repair&geo_location_terms=Seattle%2C+WA | 2026-10-20 | 2026-10-20 | §2 |
| VS19 | Yellow Pages "fishing reel repair" Virginia Beach: 33 results; 1 repair-tagged (C-Tackle, Norfolk); Princess Anne Distributing listed | 33 | yellowpages.com | https://www.yellowpages.com/search?search_terms=fishing+reel+repair&geo_location_terms=Virginia+Beach%2C+VA | 2026-10-20 | 2026-10-20 | §2, §3 |
| VS20 | Yellow Pages category "Fishing Tackle Parts & Repair", Texas: "Showing 1-30 of 36"; 29/30 tagged | 36 | yellowpages.com | https://www.yellowpages.com/search?search_terms=Fishing+Tackle+Parts+%26+Repair&geo_location_terms=TX | 2026-10-20 | 2026-10-20 | §2 |
| VS21 | Same category, Florida: "Showing 1-30 of 155"; 28/30 tagged | 155 | yellowpages.com | https://www.yellowpages.com/search?search_terms=Fishing+Tackle+Parts+%26+Repair&geo_location_terms=FL | 2026-10-20 | 2026-10-20 | §2 |
| VS22 | Same category, California: "Showing 1-30 of 60"; 29/30 tagged (incl. Daiwa Corp, Phenix Rods) | 60 | yellowpages.com | https://www.yellowpages.com/search?search_terms=Fishing+Tackle+Parts+%26+Repair&geo_location_terms=CA | 2026-10-20 | 2026-10-20 | §2 |
| VS23 | Same category, New York: "Showing 1-30 of 34"; 30/30 tagged | 34 | yellowpages.com | https://www.yellowpages.com/search?search_terms=Fishing+Tackle+Parts+%26+Repair&geo_location_terms=NY | 2026-10-20 | 2026-10-20 | §2 |
| VS24 | Same category, Virginia: "Showing 1-7 of 7" (C-Tackle, Rod & Reel Repair, Bass Pro, Larry's Rod & Reel Repair, Sova, SharpReel, Kippersticks Custom Rods) | 7 | yellowpages.com | https://www.yellowpages.com/search?search_terms=Fishing+Tackle+Parts+%26+Repair&geo_location_terms=VA | 2026-10-20 | 2026-10-20 | §2, §3 |
| VS25 | Shimano US service centers page: Ladson SC and Irvine CA named; "U.S. Authorized Service Centers Map" links to https://brands.locally.com; 2026 Serviceable List PDF | 2 named | Shimano North America (fishshop.shimano.com) | https://fishshop.shimano.com/pages/service-centers | 2026 | 2026-10-20 | §2 |
| VS26 | PENN repairs page (snippets; page 429 on fetch): Philadelphia factory service, "local authorized reel warranty center", Canadian shops Aikman's (Mississauga) and Mike's Reel Repair (Chilliwack), "$10.00 per reel processing & handling fee" | as listed | PENN / Pure Fishing (search snippets) | https://pennfishing.com/pages/repairs-services | 2026 | 2026-10-20 | §2 |
| VS27 | Daiwa US FAQ (snippet; page 429 on fetch): reels to "Authorized Warranty Centers or to our North American Service Center"; locator link; rods to Foothill Ranch CA | — | Daiwa US (search snippet) | https://daiwa.us/pages/faq | 2026 | 2026-10-20 | §2 |
| VS28 | ORCA repairmen list: Berinson (Temecula CA), Dick Janak (New Paltz NY), Mat Hegy (Eagle River WI), Glenn's (Des Moines IA); "ORCA does not endorse or warrant anyone or their work." | 4 | Old Reel Collectors Association | https://www.orcaonline.org/services/reel-repair/ | n.d. | 2026-10-20 | §2, §3 |
| VS29 | alantani.com totals: 454,886 posts, 35,661 topics, 17,263 members; boards: Reel Repair Service Centers 58 topics/1,215 posts; Member Services 33/386; CJ's Reel and Rig 16/149; Smoothdrag.com 324/2,623; MysticParts/Scott's 37/355 | as listed | alantani.com index | https://alantani.com/ ; https://alantani.com/index.php/board,27.0.html ; https://alantani.com/index.php/board,43.0.html | 2026-10-20 | 2026-10-20 | §2, §3 |
| VS30 | ICRBE: "attendance has consistently ranged between 2,000 and 2,500 participants annually"; held in Winston-Salem since 2013; hosted by Tom Kirkman (snippets) | 2,000–2,500 | Visit Winston-Salem / trade press | https://www.visitwinstonsalem.com/event/international-custom-rod-building-exposition-icrbe | n.d. | 2026-10-20 | §2, §3 |
| VS31 | ICRBE 2027 listing: "over 60 booths", "more than 2,500 custom rod builders", Feb 20–21 2027, Winston-Salem Marriott (snippet) | 60+ booths | sharedaudiences.com (event listing) | https://www.sharedaudiences.com/events/international-custom-rod-building-exposition-2027 | 2026 | 2026-10-20 | §3 |
| VS32 | ICRBE 2011 (High Point): "just over 3000 custom rod builders visiting over 50 rod building supply manufactures and dealers exhibiting in 75 booths"; 2026 show "30 per cent expansion in floor space" (snippets) | as listed | OutdoorHub; Tackle Trade World (press) | https://www.outdoorhub.com/?p=19200 ; https://tackletradeworld.com/custom-rod-building-show-going-strength-strength | 2011–2012; 2025/26 | 2026-10-20 | §2 |
| VS33 | rodbuilding.org: 1,926 pages of topics (≈50 per page); sticky "Custom Rod Builders FB Posts" mirrors a Facebook group, 8,297 replies since 2024-09-24; "Solicitations" sticky; search "deposit" 119 results, "waiting list" 96 results | as listed | rodbuilding.org | https://www.rodbuilding.org/index.php ; https://www.rodbuilding.org/read.php?2,569368 | 2026-10-20 | 2026-10-20 | §2, §3, V30 |
| VS34 | Kirkman: "Some people make a full time living at it. Others would starve trying that." | verbatim | rodbuilding.org "custom rod as a side gig?" | https://www.rodbuilding.org/read.php?2,586864 | 2026-10-19 | 2026-10-20 | §2, V29 |
| VS35 | Kirkman on custom rods as "a very tiny number" of rods sold; builders "large enough in themselves to support a small industry of dealers and manufactures"; a push could add "many hundreds" of builders a year (snippets) | — | FlyAnglersOnline (RodMaker reprint) | https://www.flyanglersonline.com/t/promoting-custom-rods-and-custom-rod-building/10752 | n.d. | 2026-10-20 | §2 |
| VS36 | Yellow Pages "custom fishing rods": FL 6, TX 6 (2 CLOSED, 1 MOVED), CA 4 | as listed | yellowpages.com | https://www.yellowpages.com/search?search_terms=custom+fishing+rods&geo_location_terms=FL (and TX, CA) | 2026-10-20 | 2026-10-20 | §2, N-V19 |
| VS37 | Kistler Custom Fishing Rods: ~10,000 custom rods assembled annually (snippet) | 10,000/yr | Community Impact (press) | https://communityimpact.com/tomball-magnolia/business/kistler-custom-fishing-rods-celebrates-20-years-business-magnolia/ | n.d. | 2026-10-20 | §2 |
| VS38 | yellowpages.ca "fishing reel repair" Canada: 2 results (Gun Fishin, Merritt BC; Drift Outfitters, Toronto) | 2 | yellowpages.ca | https://www.yellowpages.ca/search/si/1/fishing+reel+repair/Canada | 2026-10-20 | 2026-10-20 | §2 |
| VS39 | Mike's Reel Repair (Chilliwack BC): "2,300 square foot warehouse, employing five individuals"; ships worldwide; demand "quickly became overwhelming" | 5 staff | Mike's Reel Repair (history page) | https://www.mikesreelrepair.com/history/ | n.d. | 2026-10-20 | §2, §4 |
| VS40 | Shimano Australia: Caringbah NSW service centre; "We will endeavour to get your reel back within 20 business days"; 10-year warranty excludes non-authorised repairs (snippet) | 20 business days | Shimano Australia | https://fish.shimano.com/en-AU/service/c/ServiceCentre.html | 2026 | 2026-10-20 | §2 |
| VS41 | Otto's Tackle World (Sydney): "a general reel servicing takes approximately 1 week"; "you must leave your reel with us" (snippets; page rendered as storefront) | ~1 week | Otto's Tackle World | https://www.ottostackleworld.com.au/Ottos-Tackle-World-Sydney-Reel-Repairs-Servicing | 2026 | 2026-10-20 | §2, §4 |
| VS42 | Tower Systems pricing: Startup $145, Standard $233, Advanced $265, Ultimate $298 inc GST per month billed annually ($149/$250/$285/$320 monthly); "Repairs and Job Management" in Advanced and Ultimate; "3,500+ customers in Australia and New Zealand"; /fishing-outdoor-stores.html | as listed | Tower Systems (company pages) | https://www.towersystems.com.au/pricing.html ; https://www.towersystems.com.au/ | 2026 | 2026-10-20 | §4, §5, (e) |
| VS43 | Reel Service Technician I job posting (Shimano): "meet or exceed reel repair quotas of ten reels per day" (snippet; original URL now redirects) | 10 reels/day | Angling Trade jobs (snippet) | https://anglingtrade.com/?p=35156 | 2025-03-24 | 2026-10-20 | §2, §4 |
| VS44 | Mud Hole Custom Tackle YouTube: 73.4K subscribers, 28,313,134 views, started 2007-11-27, "Last updated Oct 18, 2026" | as listed | vidIQ (third-party stats) | https://vidiq.com/youtube-stats/channel/@MudHoleCustomTackle/ | 2026-10-18 | 2026-10-20 | §3, N-V18 |
| VS45 | Mud Hole self-report: YouTube "approaching 700 videos, 71,000 subscribers, and more than 25 million views"; 50-year anniversary (snippet) | as listed | Mud Hole (company blog) | https://mudhole.com/blogs/news/mud-holes-50-year-anniversary | n.d. | 2026-10-20 | §3 |
| VS46 | StripersOnline board sizes: Reel Maintenance and Repair 34.6k posts; Rod Building Forum 131.8k; Main Forum 2.4m; Tackle Collectors 106.7k | as listed | stripersonline.com forum index | https://www.stripersonline.com/surftalk/ | 2026-10-20 | 2026-10-20 | §3 |
| VS47 | 2nd Chance Tackle YouTube: 42,809 subscribers, 4,203 videos, ~11.1M views; description "Fishing Reel Repair & Service - Vintage to Modern Reels" (snippets; page 403 on fetch) | as listed | socialcounts.org (third-party) | https://socialcounts.org/youtube-live-subscriber-count/UCbNyOpdEZDO6H93bLm6lP9w | 2026-08 | 2026-10-20 | §3, N-V18 |
| VS48 | Fischer Angling site: WordPress; "10 Day Turnaround*"; closed Jul 15–Sep 15 | — | Fischer Angling | https://fischeranglingpro.com/ | 2026 | 2026-10-20 | §4, N-V8 |
| VS49 | Rod & Reel Repair Guy: GoDaddy Website Builder; call/text before arriving; by appointment; reopen 9/21/2026 | — | fixreels.com | https://fixreels.com/ | 2026 | 2026-10-20 | V23, §4 |
| VS50 | Mat's Reel Repair: GoDaddy Website Builder | — | matsreelrepair.com | https://matsreelrepair.com/ | 2026 | 2026-10-20 | §4 |
| VS51 | Valley Reel Works: "Powered by Webador" | — | valleyreelworks.com | https://www.valleyreelworks.com/ | 2026 | 2026-10-20 | §4 |
| VS52 | QuickBooks Online regular prices: Simple Start $38, Essentials $85, Plus $140, Advanced $340 (promo halves them) | as listed | Intuit (pricing page) | https://quickbooks.intuit.com/pricing/ | 2026 | 2026-10-20 | §4 |
| VS53 | Jobber: Core $49/mo monthly, $24 with 1-year commitment, $21 annual (1 user); Connect 1 user $139/$72/$70; Grow $199/$102/$105; extra users $29 | as listed | Jobber (pricing page) | https://getjobber.com/pricing/ | 2026 | 2026-10-20 | §4 |
| VS54 | GoCanvas: Essentials $29, Pro $39, Max $49 per user/month, "3 user minimum, billed annually" | as listed | GoCanvas (pricing page) | https://www.gocanvas.com/pricing | 2026 | 2026-10-20 | §4, §5 |
| VS55 | Paperform: Free $0 (Stripe payments included); Pro $49/mo annual, $59 monthly; Business $124 / $149; no Paperform transaction fee | as listed | Paperform (pricing page) | https://paperform.com/pricing | 2026 | 2026-10-20 | §4, §5, N-V16 |
| VS56 | Tower Systems blog: "Fishing and outdoors businesses" "$165/month"; rental includes licences for unlimited computers, 6-day help desk | $165/mo | Tower Systems blog | https://blog.towersystems.com.au/?p=24994 | 2023-06-28 | 2026-10-20 | §4 |
| VS57 | Tower Systems blog 2016: fishing retailers buy it to "Manage rod and lure repairs", "Sale of bait by weight", "Sell fishing licences"; help-centre tiers $195/$218/$246 inc GST (older, snippet) | — | Tower Systems blog / help centre | https://blog.towersystems.com.au/?p=16275 ; https://help.towersystems.com.au/portal/en/kb/articles/how-much-is-your-pos-software | 2016-08-12; n.d. | 2026-10-20 | V33, §5 |
| VS58 | Doug's Reel Repair prices: $25 freshwater spinning, $29 baitcaster, $35 saltwater, $20 tune-up; repair "may take three weeks" | as listed | Pond Boss (PDB) | https://www.pdbmagazine.com/2023/03/preseason-reel-repair | 2023-03 | 2026-10-20 | §4 |
| VS59 | Kirkman: "I wouldn't think you'd be doing very well if you made less than $100 per rod, and that would be a bare minimum." | verbatim | rodbuilding.org | https://www.rodbuilding.org/read.php?2,414727 | 2013-10-01 | 2026-10-20 | §4 |
| VS60 | Searches "reel repair software" / "reel service software" / "tackle shop repair tracking" / RepairDesk|RepairShopr|Jobber|RepairQ + "fishing reel": only GoCanvas template and Tower Systems returned; no US fishing-specific product | none | WebSearch (this agent) | — | 2026-10-20 | 2026-10-20 | §5 |
| VS61 | RepairDesk blog "Still Using Spreadsheets to Run Your Repair Shop?": "A repair shop spreadsheet can feel perfectly fine when the day is calm, and the same one or two people touch every repair." (snippet) | verbatim | RepairDesk (vendor blog) | https://blog.repairdesk.co/2026/04/28/still-using-spreadsheets-to-run-your-repair-shop-heres-what-its-costing-you/ | 2026-04-28 | 2026-10-20 | §5, N-V17 |
| VS62 | Mud Hole: revamped website and expanded Oviedo FL showroom; no builder directory or order tool found | — | Tackle Trade World; The Fisherman (press) | https://tackletradeworld.com/node/592064 ; https://www.thefisherman.com/article/mud-hole-expands-product-offering-with-new-improved-website/ | 2025/26 | 2026-10-20 | §5 |
| VS63 | NWFR "reel repair" thread: Bodofish three months / "calling him every day"; Quadfather "dont service reels anymore"; MotoBoat "Now what?" | verbatim | Northwest Fishing Reports forum | https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=160872 | 2012-06-18/19 | 2026-10-20 | V34–V36, N-V5, N-V6 |
| VS64 | NWFR "Reel Repair / Maintenance" thread: "reel repair guy of the week"; "gone back to Boeing"; "could not get bearings for common reels"; "a couple weeks" | verbatim | Northwest Fishing Reports forum | https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=216314 | 2015-01-31 to 02-11 | 2026-10-20 | V34, V35, V37 |
| VS65 | Texas Kayak Fisherman "Reel service?": shoffer, OldTownYakBoi, 1963Christopher, LocoSeamonkey, karstopo, deptrai quotes; six Houston-area shops named | verbatim | texaskayakfisherman.com | https://texaskayakfisherman.com/forum/viewtopic.php?p=2339973 | 2024-02-11 to 2025-02-21 | 2026-10-20 | V38–V43, §2 |
| VS66 | Trustpilot (ie.) Otto's Tackle World: Chris, 1-star, "updates on the progress were scarce" | verbatim | Trustpilot (consumer review) | https://ie.trustpilot.com/review/ottostackleworld.com.au | 2024-03-13 | 2026-10-20 | V44 |
| VS67 | Trustpilot PENN: "I sent a reel in under warranty 6 weeks ago for repair and have not heard anything back" (snippet) | verbatim snippet | Trustpilot (consumer review) | https://es.trustpilot.com/review/pennfishing.com | n.d. | 2026-10-20 | V45 |
| VS68 | BassResource "Daiwa warranty": "didn't call me back when he said he would and never responded to my voice messages" (snippet) | verbatim snippet | bassresource.com | https://www.bassresource.com/bass-fishing-forums/topic/144588-daiwa-warranty/ | n.d. | 2026-10-20 | V46 |
| VS69 | TigerDroppings "reel repair": HomerRudd printed form, $29.99 + $15 FedEx, "$39.56 plus shipping"; The Last Coco "backed up at times", ~1 week; Sea Hoss | verbatim | tigerdroppings.com | https://www.tigerdroppings.com/rant/outdoor/fishin-reel-repair/120703280/ | 2025-10-18 to 10-21 | 2026-10-20 | V47–V49 |
| VS70 | Lake Ontario United "Reel repairs": chowder "I thought he retired?"; Rochester Reel Repair "on Facebook"; "2-3 weeks"; sszoldra DIY | verbatim | lakeontariounited.com | https://www.lakeontariounited.com/fishing-hunting/topic/85867-reel-repairs/ | 2020-04-28/29 | 2026-10-20 | V50–V52, N-V1 |
| VS71 | NESA (UK) "servicing of shimano reels": Felindre service centre, "£20+ any parts", DIY "£17" | verbatim | nesa.co.uk forum | http://nesa.co.uk/forum/forum/nesa/boat-fishing/347502-servicing-of-shimano-reels | 2015-11-04 to 11-10 | 2026-10-20 | V53, V54, N-V2 |
| VS72 | WJLA "The Holdouts: Rod and Reel Repair": Phil Evans, ~30 years, "All the little mom and pops have been wiped out" | verbatim | WJLA (TV news) | https://wjla.com/archive/the-holdouts-rod-and-reel-repair-3022 | 2010-10-12 (updated 2015-07-15) | 2026-10-20 | V24, N-V3 |
| VS73 | alantani.com "Retiring": reel bob selling parts supply "@ 50% retail" | verbatim | alantani.com | https://alantani.com/index.php/topic,37014.0.html | 2023-06-26 | 2026-10-20 | N-V4 |
| VS74 | Chris Clemes FAQ: 50% non-refundable deposit; 1–3 months; order form | verbatim | Chris Clemes (UK rod maker) | https://www.chrisclemes.com/faq | n.d. | 2026-10-20 | V25 |
| VS75 | Haddrell's Point "factory authorized service station for Shimano, Penn, Daiwa, and Quantum" | verbatim | charlestonfishing forum (shop voice) | https://forum.charlestonfishing.com/t/rod-and-reel-repair/30348 | 2011-03-19 | 2026-10-20 | V26 |
| VS76 | Paperform "Custom Fishing Rod Order Form" template: "For tackle shops and independent rod builders managing multiple custom orders"; "email threads and text messages become a tangled mess" | verbatim | Paperform | https://paperform.com/templates/custom-fishing-rod-order-form/ | n.d. | 2026-10-20 | V31, §5 |
| VS77 | GoCanvas "Fishing Rod and Reel Repair Request Form": for "custom rod builders, reel repair services and fishing rod service centers"; integrations QuickBooks, Salesforce, Google Docs, Dropbox (snippet) | verbatim snippet | GoCanvas | https://gocanvas.com/mobile-forms-apps/11152-Fishing-Rod-and-Reel-Repair-Request-Form | n.d. | 2026-10-20 | V32, §5 |
| VS78 | BassResource "tackle repair": friend's repair business "had to close his business" (snippet paraphrase); "Mike at DVT": reels back in about five to six weeks, peak season (snippet) | paraphrase | bassresource.com | https://www.bassresource.com/bass-fishing-forums/topic/221029-tackle-repair/ ; https://www.bassresource.com/bass-fishing-forums/topic/114466-mike-at-dvt/ | n.d. | 2026-10-20 | N-V7, N-V9 |
| VS79 | Van Staal self-service guidance: light use "every 12 to 18 months", heavy use "two to three times a year" (snippet) | — | Pure Fishing (Van Staal page) | https://www.purefishing.com/van-staal-self-service | n.d. | 2026-10-20 | N-V18 |
| VS80 | Boston Globe, Surfland Bait & Tackle (Plum Island): repair "cult following"; sticker "Martha lubes my reel." | verbatim | Boston Globe | https://www.bostonglobe.com/2024/06/22/metro/fishing-gear-repair-plum-island-surfland-bait-tackle | 2024-06-22 | 2026-10-20 | §2 context |
| VS81 | Custom Rod Builders FB mirror, 2025-01-17: "wait times are just to long to run a business using their blanks." | verbatim | rodbuilding.org (mirrored Facebook post) | https://www.rodbuilding.org/read.php?2,569368,page=320 | 2025-01-17 | 2026-10-20 | V30 |
| VS82 | US pool extrapolation | **estimate:** 285 four-state YP repair listings (VS20–VS23) ÷ (5,897,116 ÷ 32,240,000 = 18.3%, M40/M39) ≈ 1,560; × 40–60% dedicated, +30–50% unlisted → 800–1,400; core 500–900 | estimate | — | — | 2026-10-20 | §2 |
| VS83 | US custom rod builders selling to customers | **estimate:** 2,000–2,500 ICRBE attendees (VS30) × 40–60% sellers × 2–3 (attendee share) ≈ 1,500–4,000 | estimate | — | — | 2026-10-20 | §2 |
| VS84 | UK/CA/AU pool | **estimate:** US 800–1,400 scaled by angler ratios (CA 10%, AU 13%, UK ~5–8%; M77, M79, M75 vs M39) ≈ 250–450 | estimate | — | — | 2026-10-20 | §2 |
| VS85 | First-100 math | **estimate:** per-channel reach × assumed conversion as in §3; 70–160 in 12 months, 10–25 in 90 days | estimate | — | — | 2026-10-20 | §3 |
