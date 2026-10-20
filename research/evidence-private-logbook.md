# Evidence file: private, exportable, web-first fishing logbook

Targeted evidence for the validation gate, FOR and AGAINST. Candidate: a private web-first
fishing log that auto-captures tide, weather, wind, pressure, moon and sun times from free
NOAA/NWS data per entry, cross-year "conditions on my best days" analysis, CSV/GPX import and
export, no social feed, no public map, no ads, about $29/yr with a one-time non-renewing option.

Access date for every row: **2026-10-20** (UTC). Source IDs are prefixed `L` (section 7). Quotes
are verbatim inside quotation marks; `…` marks a cut; anything outside quotation marks is my
paraphrase. Existing evidence is cited by its ids (`E`, `W`, `Y`, `N` in
`research/hobby-immersion.md`; `C` in `research/competitors.md`; `D` in
`research/infrastructure-and-data.md`) and not repeated.

---

## 0. Method and limits (read first)

**What worked.** The iTunes Search API (full JSON, 184/175/169/173 results per query, parsed
locally) [L1–L4]; App Store listing pages (prices, ratings, 2–10 reviews each); Google Play
detail pages and Amazon's search page when fetched with `curl` and a phone user agent (the
WebFetch tool got 503/403 from both) [L29, L58]; YouTube search pages via the same route, parsing
the embedded `ytInitialData` JSON for titles and view counts [L48–L50]; PaFlyFish, Fly Anglers
Online, FishingMinnesota, Northwest Fishing Reports, Sea Angling Ireland and charlestonfishing
threads; seodata.dev and rankhero keyword pages; GummySearch subreddit pages; the Cefas Sea
Angling Diary report PDF (extracted with `pdftotext`) [L71]; Fishbrain's privacy policy and
feature pages; onX, ANGLR and Fishing Points public pages.

**What did not.** `site:reddit.com` is ignored by the search engine (zero Reddit snippets in
this session too; Bing returned unrelated results); reddit.com, bassresource.com (Cloudflare),
fishraider.com.au/community.deckee.com (Cloudflare; page also exceeds the fetch tool's 10 MB cap),
thehulltruth, texasfishingforum, ohiogamefishing and michigan-sportsman (tollbit), Etsy (403 on
search, listing and market pages, including with a browser UA), eBay (403/429), Walmart and
DuckDuckGo (bot walls), B&N and bookshop.org (404/500), web.archive.org (not permitted),
Fishbrain's Zendesk support site (403 in every form), fishingpoints.app (403), FishAngler's
feature-guide PDF (>10 MB), Google Trends (429), Amazon product pages' "Best Sellers Rank" (the
phone layout omits it; desktop URLs return a 3.7 KB interstitial), the FAOL thread "Does anyone
keep a fishing journal?" (404 on both URL forms). WebSearch budget used: 48 queries.

**Bias this creates.** BassResource (the largest bass forum) is snippet-only, so bass-angler
quotes carry no handles and do not count toward independence. Fly (PaFlyFish, FAOL), Great
Lakes/Midwest (FishingMinnesota, NW Fishing Reports), UK/Ireland sea (Sea Angling Ireland) and
app-store reviewers are well covered; Australia is snippet-only; kayak is one Charleston thread.
Paper-log evidence is one Amazon results page (24 listings parsed, no BSR) rather than product
pages. Template (Etsy) review counts could not be obtained at all.

**Independence.** Rows name a handle; `handle n/a` rows (search snippets) are context only and
excluded from the ≥10 count. One handle appearing twice in a job is one row.

---

## 1. Willingness-to-pay evidence

### 1.1 Paper fishing log books (Amazon.com search "fishing log book", 2026-10-20) [L29]

Amazon reports **709 results** for the query. First results page, in order shown (sponsored
placements marked), parsed from the page HTML:

| Listing (ASIN) | Price | Stars | Ratings | Badges / signals |
|---|---|---|---|---|
| The Ultimate Fishing Log Book: The Essential Accessory For The Tackle Box (1987645979), 103 pages | $8.99 | 4.5 | **976** | organic #1 non-sponsored; also bought sponsored slot |
| Legend Fishing Log Book, Fish Journal, Fisherman Gift 5.8x8.3 Deep Sea (B0D2WHCGK5) | $16.99 | 4.8 | 125 | Amazon's Choice |
| Fishing Log Book: Fishing Journal to Record Fishing Activities… (B09XZRMJLV) | $8.99 | 4.7 | 83 | sponsored |
| My Fishing Log Book: Simple Fishing Journal for Kids (B09KN24WTN) | $6.69 | 4.5 | 96 | |
| Fishing Log – Medium Size… 104 pages covering 52 Fishing Trips (B0C3J532JT) | $12.50 | 4.6 | 91 | |
| Clever Fox Fishing Log Book, Journal for Fishermen & Kids (B0FXH4S854) | $9.99 | 4.8 | 41 | "50+ bought in past month" |
| Tenceur 2 Pcs Leather Fishing Log Book (B0CCRZTYFF) | $15.99 | 4.3 | 38 | |
| Fishing Catch Log Book, 122 Pages Stone Paper Water-Resistant (B0GRVZMG9V) | $14.99 | 4.9 | 33 | sponsored |
| The Fisherman's Journal (Outdoor Journals), Weldon Owen, 2021, 168 pp (1681886456) | $16.69 | 4.9 | 27 | traditional publisher [L30] |
| Fulmoon Fishing Log Book Leather Journal for Men, 96 Pages (B0FJ29TV4H / B0FJ29V138) | $8.99 | 4.6 | 24 | |
| Fishing Log Book: Track and Record Fishing Trips, Catches, Weather, and Locations (B0FB3BB2RG) | $7.99 | 4.4 | 11 | |
| RAW HYD Leather Fishing Log Book for Anglers, Hand-Stitched (B0CGXP6PVB) | $24.95 | 4.9 | 10 | sponsored |
| Leather Fishing Log Book for Anglers – Made in Canada (B0CPCDL9SZ) | $37.00 | 4.3 | 9 | sponsored |
| Fulmoon 2 Pcs Leather Fishing Log Book Brown Journal with Template (B0CBC384Q1) | $13.99 | 4.5 | 9 | |
| 2 Pcs Waterproof Fishing Log Book… Spiral Bound PP Cover (B0GH2614Q8) | $15.99 | 4.6 | 3 | sponsored |

Other paper anchors: Pro-Log Fishing Records logbook, 150 pages, "29 Data Points", $15.95, 0
reviews at a chart retailer [L31]; Rite in the Rain weatherproof journals $17.95–$37.21 at
Walmart with 2–15 reviews each (generic notebooks, not fishing-specific) [L32]; Etsy personalised
fishing journal about $28.80 (snippet only) [L37]; KDP "fishing logbook interior" templates sold
to self-publishers for about $1, i.e. a flooded supply side [L36].

Reading: the paper category is real but small-ticket: **$7–$17 one-time**, one title with
~1,000 ratings and a long tail under 100. Leather "gift" versions reach $25–$37. Sponsored
placements in 7 of 24 slots show sellers are paying to compete for the keyword.

### 1.2 Dedicated log apps and their paid tiers

App Store supply, from the iTunes Search API on 2026-10-20 [L1–L4, L87]:

| Query | Results | Released in 2026 | Zero ratings | ≥100 ratings | ≥1,000 ratings | Not updated since 2025-01 | Paid up front |
|---|---|---|---|---|---|---|---|
| "fishing log" | 184 | 94 | 40 | 45 | 28 | 10 | 4 |
| "fishing journal" | 175 | 73 | 32 | 44 | 21 | 18 | 6 |
| "fishing diary" | 169 | 17 | 6 | 122 | 82 | 49 | 8 |
| "catch log" | 173 | 95 | 50 | 21 | 9 | 13 | 4 |

Across the four queries there are 450 unique apps, of which **101 log/journal/diary/catch-named
apps were released in 2026 alone** [L87]. Only two log-named fishing apps have ≥100 ratings on
iOS: Anglers' Log (303) and ANGLR (635) [L1]; everything else is single or double digits. The
"≥1,000" column is Fishbrain, Fishing Points, FishAngler, Fishbox, BassForecast and non-log apps
that match the words.

| App (platform) | Price / paid tier | Ratings | Last update | Log features relevant to us | 1–3★ or critical complaints, verbatim | Source |
|---|---|---|---|---|---|---|
| Anglers' Log (iOS, Android) | Free; Pro $1.49/mo or **$11.99/yr** | iOS 4.7 (303); Play 4.6 (776), **100K+ downloads** | 2026-10-08 / 2026-10-07 | Pro: "Auto-fetch weather, atmosphere & tide data for any location"; "Export your full catch history to CSV/spreadsheet"; "Automatic cloud backup"; release note 2.7.10 "Added a warning to reflect the unreliability of cloud backup." | Play, A Google user, 5★, 2020-02-06: "I have all but finished an entry only to hit the back button w/o thinking to add the fishing spot and erased everything too many times." (plus E49–E54, Y1, Y2) | L5, L6 |
| LogIT – Fishing Log & Journal (iOS; German dev) | Free; Pro $1.99/mo, **$9.99/yr**, **$29.99 lifetime** | 4.7 (25) | 2026-10-19 | "Fetch and Log temperature, wind, air pressure, water clarity, and moon phase"; "Export all your data or specific years as a CSV file with images neatly packed in a ZIP archive."; "Fishing spot location is never shared to protect your privacy" | Alfred -Three, Apr 16: "my only complaint is the the barometer reading in in mbar which isn't used in the US." … "I emailed the developer about this and got no reply." RylanTheKid13, Jun 13: "Like not having to show your location if you don't want to" | L7 |
| Fishing Deluxe (iOS) | **$2.99 up front**; Premium Lifetime $39.99 | 4.5 (496) | 2026-09-20 | "Log catches with photos, notes, and locations"; pressure trends, solunar | Cyylus, 2015-12-04, "Subscriptions really???": "Now you have to subscribe for a monthly fee for the new features that the update comes with." BabesOfGaming, 2016-12-29: "This is worth paying $2.99 for." | L8 |
| Fishing Calendar & Tide Times (iOS, TOP APP d.o.o.) | Free; subs $18.99/yr and $49.99/yr; "Full version" $5.99–$7.99 one-time | 4.4 (12K) | 2026-10-13 | "Photo catch log with species, size, weight, weather, bait, tackle"; cloud sync; no export or stats mentioned | Codefyi, 2024-07-09: "Free version offers nothing enticing enough to even think about paying for it." … "a constant attempt to get me to pay for something behind a pay wall." | L9 |
| FishLogger: Fishing Journal (iOS) | Pro **$9.99/yr** (7-day trial) or **$29.99 lifetime**; CSV export in Pro | 5.0 (4) | 2026-07-16 | "no social network", ad-free | none shown | L23 |
| CatchIQ: Fishing Analytics Log (iOS) | Free w/ ads; Pro $9.99/mo or **$59.99/yr** | 5.0 (8) | 2026-06-09 | "Weather conditions are auto-populated at the time of each catch."; "No social feed. No public data. No sharing."; iCloud only; no export, no web | none critical (launch reviews) | L16, L17 |
| finScribe: Fishing Logbook (iOS/Android, UK) | Free; Premium **£29.99/yr** ($29.99), Premium Plus £34.99; "£9.99 first year" promo | iOS US 5.0 (2); UK 5.0 (1); Play 4.2 (24), 10K+ downloads | 2026-06-23 / 2026-08-04 | "Weather, tidal and lunar data."; "Your logs are private by default"; "Trusted by 17,000+ anglers", 18,615 catches logged | none shown | L12–L15 |
| Log.Fish (iOS) | Monthly subscription **$9.99/mo** | 3.7 (3) | 2026-09-01 | "pull robust NOAA data on all the conditions - ranging from water depth & temp to tide & moon phase" | brosa1450, May 25, "Good idea, painful to use": "Constantly buggy, and nothing is simple." | L11 |
| Fish Swami: Fishing Log & Map (iOS) | Basic $9.99/yr; Premium $19.99/yr | 4.0 (9) | 2026-10 | weather download, online logging | Lazybuttjay, 2023-05-17: "the weather download feature has stopped working altogether" … "I have reached out to the developers to separate times and received zero response." … "since there hasn't been an update in a year that support for the app may be going away." | L21 |
| Catch Log: Fishing Journal (iOS) | Pro is a "one-time purchase" (price not shown) | no ratings | 2026 | "One tap captures GPS, moon phase, tide, and conditions automatically"; "Export your journal as CSV or PDF"; "NO social network. NO account required. NO subscription." | none | L20 |
| GotOne! (iOS) | Free (no IAP listed) | 4.5 (29) | 2026-06-11 | "seamlessly records water temperature, moon phase, tide, wind and other environmental information."; data shared with Louisiana LDWF by opt-in | East End Seal, 2023-08-19: "The one thing that seems to be missing is the ability to add your own species." | L22 |
| MyCatch (Angler's Atlas, citizen science) | Free | 4.8 (250) | 2026-08-04 | "Secret Spots Stay Secret"; no export, no weather | Icevaine, May 23: "Would like to see a option to keep track of time of day, water temp and lure to remember what worked"; Tim Fruhauf, 2020-06-14: "it doesn't have many of the fish I catch so I can't log them" | L10 |
| Hooper: Saltwater Fishing Log (iOS/Android, Aug 2026) | Free | 0 | 2026-08-31 | voice logging; "Hooper fills in the conditions for you" (depth, current, temps, moon); release note "export a GPX pin for chart plotter apps" | none | L18, L19 |
| Fishing Diary (Android, com.fishingdiary.app) | IAP | 4.6, **100+ downloads** | 2026-10-09 | "Private & Secure Your fishing spots stay confidential" | none visible | L26, L27 |
| FishingLog – Simple Catch Log (Android/iOS) | Free + IAP, ads | Play 4.6, 1K+ downloads; iOS 0 | 2026-09-28 | "Export to CSV for other apps" | none visible | L28, L1 |
| Fishing Friend (iOS) | **$4.99** up front | 1 | 2023-07-24 | CSV and KML export | — | L82 |
| FishersLog (Mac/PC desktop) | **$20** one-time, 7-day trial | — | — | reports and graphs by moon phase, location, wind direction, water temperature | — (E55 user kept it two years) | L24 |
| fishing.idealog.net (web, 2007) | "39 US dollars" | — | dead | "everything is graphed for you.." | stevecrow74: "not cheap 39 US dollars.. but well worth it in the end though..." | L56 |
| mydailyfishinglog.com (web) | — | — | **DNS not found 2026-10-20** | linked by a PaFlyFish poster in 2023 | — | L78 |
| Paid up-front log apps launched 2025–26 (My Fishing Log $4.99, FishM $5.99, Landed $4.99, Catch: Fishing Log $3.99, Fishing Catch Log $1.99, Chuck Fluff $0.99, Hog Log $4.99) | $0.99–$5.99 | 0–4 ratings each | 2025–26 | — | — | L1, L2 |

### 1.3 Spreadsheet and printable templates

| Product | Price | Reviews / usage | Source |
|---|---|---|---|
| Lure & Line Designs, Google Sheets "Fishing Trip Log Sheet" (dropdowns, auto charts) | CAD $5.49 | no reviews shown; listing page 404 on fetch | L33 |
| Lure & Line Designs, "Interactive Fishing Log" offline HTML tracker with CSV export | CAD $6.99 | no reviews shown | L34 |
| JotForm "Fishing Log App" template | free | "3" clones | L35 |
| KDP interior templates for self-publishing a fishing logbook | ~$1 | 1 rating (one listing) | L36 |
| Etsy "fishing log" listings | ~$28.80 (personalised journal) | not obtainable (403) | L37 |
| BassResource free fishing log template; Instructables paper template | free | referenced in threads, no counts | L76 |

Reading: templates are a near-zero-revenue layer; the paid examples have no visible reviews.
They matter as the incumbent "product" (Excel/Sheets) rather than as a market.

### 1.4 Incumbents already prove log+forecast pays

Fishing Points $49.99/yr Yearly Premium, 10M+ Play installs, 219K reviews, "private catch
logbook", conditions added automatically [C20, C22, L58, L59]; Fishbrain $79.99/yr, 76K App
ratings [C1]; FishAngler $49.99/yr [C16]; ANGLR PRO "$2.50/month - billed annually at $29.99"
[L66]; onX Fish $34.99/yr [L68]. Refusals: "definitely not worth $50 a year." (Y10); Fishing
Points Play, A Google user, 1★, 2019-05-10: "$6/m for paid. … I'd pay $1/m to see tomorrow's
forecast. no more." [L58]; Fishbrain $70–$100 "crazy" (Y12, Y13).

### 1.5 The price point the evidence supports

- Every dedicated log app with real users prices its annual tier at **$9.99–$11.99** (Anglers'
  Log, LogIT, FishLogger, Fish Swami Basic) and offers a **$29.99–$39.99 lifetime** (LogIT,
  FishLogger, Fishing Deluxe) [L5, L7, L8, L23]. Users praise exactly this band: "$12 for the
  year" (Y1), "$9.99 … does not auto-renew, for a whole year" (Y7), "$5 or $10 a YEAR" (Y8).
- $29–$35/yr exists only where maps or forecasts are bundled (ANGLR PRO $29.99 with 14 map
  layers; onX $34.99; Fishing Points Basic $29.99) or in products with tiny bases (finScribe
  £29.99, 24 Play reviews) [L66, L68, C20, L15].
- $49.99+/yr draws explicit refusal unless it replaces hardware (Y9, Y10, L58).
- One-time purchase is repeatedly requested ("I would pay a one time iap", Y2; "NO subscription"
  as a selling point, L20; Bamboozle's warning against software you can lose, L52).

Supported band: **$10–$20/yr subscription, or $25–$40 one-time (non-renewing)**. $29/yr sits at
the top of the evidenced band; it is defensible only if the buyer perceives the auto-conditions
and cross-year analysis as "forecast-app" value, and the one-time option is what converts the
anti-subscription segment. A $19/yr + $39 one-time pair is the most evidence-aligned.

---

## 2. Demand and channels

### 2.1 Search demand (US monthly searches, Google Ads data via seodata.dev; rankhero global)

| Keyword | US monthly | CPC | Note | Source |
|---|---|---|---|---|
| fishing journal | 590 | $0.75 | | L38 |
| fishing logs | 390 | $0.18 | | L38 |
| fish log | 390 | $0.24 | | L38 |
| fishing logbook | 390 | $0.18 | | L38 |
| fishing log book | 320 | $0.46 | paper intent | L38 |
| fishing log | 210 (US); 390 global, KD 30 "Easy", CPC $0.48, 260–480/mo Sep 2025–Aug 2026 | $0.44 | | L38, L40 |
| fishing log app / fishing log apps | 50 / 50 | $4.04 | | L39 |
| fishing journal app | 30 | | | L39 |
| fishing log template / spreadsheet / excel / best fishing log app | no page (below the tool's threshold) | | | L38, L39 |
| fishing app / fishing apps / best fishing apps / best fishing app / apps fishing | 5,400 / 1,900 / 1,900 / 1,300 / 1,600 | | generic | L39 |
| fishing spot apps | 590 | | | L39 |

Head-term total for the log family ≈ **2,400 US searches/month**; the explicit "app" intent is
≈130/month. Google Trends could not be read (429). The whole "fishing app" family is ≈12,000.

### 2.2 Proxies

- App Store: 184 results for "fishing log", 175 for "fishing journal"; 101 log-named apps
  launched in 2026 (supply responding to perceived demand, almost none converting: 40–50 apps
  with zero ratings per query) [L1–L4, L87].
- Top log-app bases: Anglers' Log 100K+ Play downloads, 303 iOS + 776 Play ratings; finScribe
  10K+ downloads, "17,000+ anglers"; ANGLR 50K+ (C14) [L6, L14, L15].
- Amazon: 709 "fishing log book" results; top title 976 ratings; "50+ bought in past month" on
  a $9.99 title [L29].
- YouTube (parsed search pages) [L48–L50]: the evergreen videos are old and modest: "Fishing Log
  with John Skinner" (SurfcastersJournal) 42,814 views, 14 y; "Fishing Log Books By Rustico"
  40,408, 7 y; "How to Keep a Fishing Log - Part 1 FishersLog" (John Skinner Fishing) 16,002,
  16 y; "Track Every Catch | Angler Stats Fishing Log App" (Ask Apps) 13,105, 7 mo; "FishMemo"
  8,803, 10 y; "Fishing Log Journal Tutorial" (VectoriaDesigns) 7,785, 1 y; "Why You NEED to Keep
  a Fly Fishing Journal" (Fly Fish University) 1,247, 5 y; "How to Create a Fishing Journal for
  FREE" (NodakAngler) 966, 4 y; "How To Catch More Fish? Keep a Fishing Log!" (New2U Fishing)
  448, 4 y. The one broad-reach adjacent video is "Top 9 Fishing Apps of 2022" (Catfish Edge)
  72,889 views. Counter-video: "Why Bass Fishing Logbooks Are A Thing Of The Past…" (Randy
  Blaukat) 3,176 views [L77]. New app makers are already posting tutorials (Biggin, 2 videos,
  0–2 views, Oct 2026) [L49].

### 2.3 Named channels and reach

| Channel | Reach | Source |
|---|---|---|
| r/Fishing | 3.1M members (+1.2%/yr), 2026-10-17 | L41 |
| r/FishingForBeginners | 472k (+13.1%) | L41 |
| r/Fishing_Gear | 465k | L42 |
| r/flyfishing | 411k (+7.9%) | L41 |
| r/bassfishing | 336k (+9.7%), 2026-09-30 | L42 |
| r/kayakfishing | 229k (+8.3%) | L41 |
| r/troutfishing | 187k | L41 |
| r/CarpFishing | 148k | L42 |
| r/SurfFishing | 131k | L42 |
| r/FishingAustralia | 93k | L42 |
| r/saltwaterfishing | 67k (+35.1%) | L41 |
| r/fishingUK | 46k | L41 |
| r/kayakbassfishing | 8k | L42 |
| StripersOnline (NE surf/boat): Main Forum 2.4m posts; Fly 332.1k; Kayak 188.5k; Freshwater 164k; Massachusetts 683.6k; New Jersey 485.2k | post counts; members not shown | L45 |
| forum.charlestonfishing.com | 15,679 users; 107 active in 30 days; 146 posts in 30 days | L43 |
| Fly Anglers Online | 6,265 users; 35 active in 30 days; 25 posts in 30 days | L44 |
| Sea Angling Ireland | 3,512 members; 383,422 posts | L46 |
| FishingMinnesota | per-forum: Metro reports 124k posts, Ice Fishing 16k | L47 |
| PaFlyFish | thread with 20+ posts in 2016 and 20+ in 2023 on this exact topic | L51, L52 |
| Facebook groups about fishing logs/journals | **none found** in two searches; only general regional groups ("several thousand members", The Fisherman) | L76 |

Threads where a founder could legitimately reply (people asking "what do you use?"):
BassResource "Do you keep a fishing log?" (223411), "Fishing journal/logbook" (212691),
"Keeping/maintaining a log" (213050), "Fishing journal/log input wanted" (122166) [L76];
PaFlyFish "Fishing Journal" (2023) [L52]; charlestonfishing "Fishing Log/Journal" (E5–E18, the
developer who said "You cannot export the data at this point"); Sea Angling Ireland "Fishing
logs" [L56]; NW Fishing Reports "Keeping a fishing log" [L55]; the MacRumors "fish logger" thread
(403 here) and r/Fishing "is there an app" threads (not reachable).

### 2.4 First-100 math (assumptions stated; all `estimate`, logged as L88)

| Channel | Assumption | 90-day paying |
|---|---|---|
| Replies in 10 evergreen "what log do you use" threads | 2,000–5,000 views each over 90 days (no view counts available; estimate), 3% click, 20% sign-up, 10% pay | 12–30 |
| SEO on the log keyword family | 2,400 US searches/mo [L38]; a new site reaches top-3 on a few terms by month 3 and captures 10–20% of clicks = 250–500 visits/mo; 2% visitor→paid | 5–15 (ramp is slow) |
| One founder YouTube video + comments on the 10 videos above | category videos earn 400–16,000 views over years [L48–L50]; 1,000 views in 90 days, 1% pay | 1–5 |
| Product Hunt / HN / Indie launch | 300–1,000 visits, 1–2% pay (AnglerSlate got comments but no visible traction, W18) | 3–10 |
| Switchers importing CSV/GPX (Anglers' Log CSV, Fishbrain GDPR export, Navionics GPX) | niche; needs the import to exist on day one | 2–5 |
| **Total** | | **23–65** |

At a $29 price, 65 payers is ~$1.9k. Reaching 100 paying in 90 days needs either a sponsorship
or partner post in a large forum/subreddit, or a shareable artifact that spreads. The channel
reach exists (millions of subscribers), but the conversion chain for a habit product is long and
the retention data in §5 say most sign-ups stop logging.

### 2.5 Built-in loops (evidence for and against)

- **Season-recap image.** No log app markets one; the nearest evidence that private loggers will
  share when location is hidden: Sea Angling Diary added an opt-in shared dashboard with precise
  locations hidden and "In 2019, 31% of recorded sessions were shared." [L71]. NW Fishing Reports
  posters wanted exactly that split: "I dont mind scoring my skunks but I also wouldn't want to
  post my hard work for the world to see." (danielt) [L55].
- **SEO "conditions on this day/place" pages.** Fishbrain already ranks programmatic pages
  ("Anglers using Fishbrain have logged: 5,155 catches for Largemouth…" for one Texas town) [L79]
  and FishAngler/Fishermap do the same; a public conditions-archive page is feasible from NOAA
  data without exposing any user data, but competes with those incumbents for the same queries.
- **GPX/CSV import as a switching hook.** Fishing Points imports GPX/KMZ but does not export
  [L59]; onX exports waypoints as GPX/KML from "My Content" on desktop [L69]; Navionics imports and
  exports GPX (C9); Anglers' Log exports CSV (Pro) [L5]; Fishbrain export is a GDPR request by
  email [L61]. A one-click import from each is cheap and unique.

---

## 3. Pain top-up: new independent examples (skill format)

Segments not covered by the immersion file: fly (PaFlyFish, FAOL), Great Lakes/Midwest
(FishingMinnesota, NW Fishing Reports), UK/Ireland sea (Sea Angling Ireland), kayak
(charlestonfishing kayak thread), bass (BassResource snippets, handle n/a), app-store reviewers
of log apps (2019–2026). 34 new handles across 8 platforms.

| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Int |
|---|---|---|---|---|---|---|---|
| L-P1 | "it just became a hassle cause I would miss a trip or too then it would just get away from me." (wants to dictate notes on the phone and transfer later) | Acristickid, PaFlyFish | https://paflyfish.com/threads/journal.42965 | 2016-10-23 | log-trips | complexity, manual-workaround | 2 |
| L-P2 | "I keep notes on stream in a 3x5 ringed notebook on about 75% of my outings." (then a custom iPad form at home) | just_jon, PaFlyFish | https://paflyfish.com/threads/journal.42965 | 2016-10-23 | log-trips | manual-workaround | 2 |
| L-P3 | "2009 was the last year for me." (paper binder with printed forms since the early 1980s; "I consider them valuable fly fishing artifacts (at least for me).") | Dave_W, PaFlyFish | https://paflyfish.com/threads/journal.42965 | 2016-10-22 | log-trips | manual-workaround | 2 |
| L-P4 | "I've kept one at times, but haven't been faithful to it." (sees value in correlating hatch timing with flows and temps over years) | Swattie87, PaFlyFish | https://paflyfish.com/threads/journal.42965 | 2016-10-24 | log-trips | complexity, missing-feature | 1 |
| L-P5 | "I just keep a crappy little blog nobody reads." … "I haven't entered anything in a while." | PocketWater, PaFlyFish | https://paflyfish.com/threads/journal.42965 | 2016-10-24 | log-trips | manual-workaround | 2 |
| L-P6 | "I write down notes after fishing on my computer." (one file per stream; searching all notes for a year is hard) → 2023: "All those notes are on an old Mac which no longer works, and I'm not techie enough to know how to retrieve those files" | troutbert, PaFlyFish | https://paflyfish.com/threads/journal.42965 ; https://www.paflyfish.com/goto/post?id=925686 | 2016-11-07; 2023-01-22 | log-trips | data-lock-in, missing-feature | 2 |
| L-P7 | "all the data is stored in a SQLite database, which I can copy off and run queries against." (phone app chosen for exportability) | salmonoid, PaFlyFish | https://paflyfish.com/threads/journal.42965 | 2016-11-07 | log-trips | data-lock-in (solved by workaround) | 2 |
| L-P8 | "I should also begin taking water temps too." (3x5 spiral notebook: stream, weather, flows, insects, flies, count) | John96, PaFlyFish | https://paflyfish.com/threads/journal.42965 | 2016-11-06 | log-trips | manual-workaround | 2 |
| L-P9 | "It also had graphing of results by any parameter like location, rod used, weather, fly choice, hatches" … "the program wasn't quite up to the task of managing a large database over many years of use without getting sluggish." … "the information in it is pretty much unrecoverable and useless." (creator closed shop) … "These days I can't be bothered keeping a journal." | Bamboozle, PaFlyFish | https://www.paflyfish.com/goto/post?id=925686 | 2023-01-22 | log-trips | data-lock-in, abandoned-app | 3 |
| L-P10 | "Gave it up after three or four seasons." (tally sheet: fish, flies, weather) | Oregon_OwlII, PaFlyFish | https://www.paflyfish.com/goto/post?id=925686 | 2023-01-22 | log-trips | complexity | 1 |
| L-P11 | "I tried this at the start of the new year a number of times, but I always failed." … would "inevitably abandon the journal in disgust." … "Maybe I need to start in April..." | hooker-of-men, PaFlyFish | https://www.paflyfish.com/goto/post?id=925686 | 2023-01-22 | log-trips | complexity | 1 |
| L-P12 | "I simply write up a fishing report for each day on my computer." … "Details include date, location, weather conditions (sky, temp, wind)," plus water clarity, temp, catch counts, and a yearly spreadsheet | a23fish, PaFlyFish | https://www.paflyfish.com/goto/post?id=925686 | 2023-01-21 | log-trips | manual-workaround | 2 |
| L-P13 | "I bought one off Amazon that covers a good bit of stats for the trip." (asks "if and how everyone tracks their outings for the year") | noahq814, PaFlyFish | https://www.paflyfish.com/goto/post?id=925686 | 2023-01-21 | log-trips | manual-workaround (paid paper) | 2 |
| L-P14 | "I've been keeping a fishing journal for 14 years now." … "stream name, date, weather, stream conditions (flow/temp/clarity), fish caught, and "comments"." … "A lot of folks say they've kept a journal, but hardly ever actually looked back on it." | wildtrout2, PaFlyFish | https://www.paflyfish.com/goto/post?id=925686 | 2023-01-22 | log-trips | manual-workaround | 2 |
| L-P15 | "I just never found myself the time or bothered to pick up a pen and start dabbling" (switched to an online log in 2010) … "all my fishing musing will be lost to some harddrive somewhere" | Shakeyfly, Fly Anglers Online | https://www.flyanglersonline.com/t/the-angler-s-log-book-neil-july-19-2010/42168 | 2010-07-22 | log-trips | complexity, data-lock-in | 2 |
| L-P16 | "the information written down, does help in review what has worked and what did not" (custom log sheet modelled on Marv Taylor's journal, shared as PDF) | Steven_McGarthwaite, FAOL | https://www.flyanglersonline.com/t/the-angler-s-log-book-neil-july-19-2010/42168 | 2010-07-19 | log-trips | manual-workaround | 2 |
| L-P17 | "I started for a while but then I gave it up..." … "I was spending almost as much time fishing as I was looking at patterns and documenting stuff" | goblueM, FishingMinnesota | https://fishingminnesota.com/forums/topic/117616-journals | 2008-04-12 | log-trips | complexity | 1 |
| L-P18 | "The Log is an Excel document and the journal is a Word Document" … "I keep rough notes in the boat and then transfer them to the Log & Journal the next day or that evening." … "Moon Phase: 97%+", "Air Temp: 60", "Surface Temp: 72", "Water Level: 675.3'" | SteveD, FishingMinnesota | https://fishingminnesota.com/forums/topic/117616-journals | 2008-04-12 | log-trips | manual-workaround | 2 |
| L-P19 | "I add gps numbers also to track where fish were on certain days" … "It takes no time at all to fill it in" (paper; bait, weather, wind, depth) | Walli1, FishingMinnesota | https://fishingminnesota.com/forums/topic/117616-journals | 2008-04-13 | log-trips | manual-workaround | 2 |
| L-P20 | "I keep past emails that I have secretly sent out, to see what, where, when." | marble-eye, FishingMinnesota | https://fishingminnesota.com/forums/topic/117616-journals | 2008-04-13 | log-trips | manual-workaround, privacy | 2 |
| L-P21 | "I have kept a log of every trip for more than 30 years" … "I only used it briefly." (a fill-in template) … "many anglers will be reluctant to post their skunk trips or perhaps secret location trips" | bob johansen, Northwest Fishing Reports | https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=21290 | 2008-01-10/12 | log-trips | manual-workaround, privacy | 2 |
| L-P22 | "I used to keep a logbook, but I got too lazy to maintain one." … "It's on my to-do list for the upcoming season." | cavdad45, NW Fishing Reports | https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=21290 | 2008-01-11 | log-trips | complexity | 1 |
| L-P23 | "I dont mind scoring my skunks but I also wouldn't want to post my hard work for the world to see." … "So will this new feature be open for everyone to see or something each person can do and keep to ourselves" | danielt, NW Fishing Reports | https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=21290 | 2008-01-12 | log-trips | privacy | 2 |
| L-P24 | "It's hard enough posting photos while trying to obscure some of the locations." … "I keep marks on my printed copies of topo maps." | dilbert, NW Fishing Reports | https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=21290 | 2008-01-12 | log-trips | privacy, manual-workaround | 2 |
| L-P25 | wants a database of "time of year, fish species, location, water temperature, water clarity, weather conditions" … praises a form with "moon phases, wind, and barometer." | HillbillyGeek, NW Fishing Reports | https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=21290 | 2008-01-10 | log-trips | missing-feature | 1 |
| L-P26 | "I keep a fishing log in a spreadsheet." … columns Date, Location, Fishing time, Tide state, Weather, Methods, Baits, Catch, comments … "It's sometimes hard to record blank trips, but these provide as much info." | Manxfisher, Sea Angling Ireland | https://sea-angling-ireland.org/forum/viewtopic.php?p=62039 | 2007-01-05 | log-trips | manual-workaround | 2 |
| L-P27 | "this is what i use..." (fishing.idealog.net) … "everything is graphed for you.." … "not cheap 39 US dollars.. but well worth it in the end though..." | stevecrow74, Sea Angling Ireland | https://sea-angling-ireland.org/forum/viewtopic.php?p=62039 | 2007-01-05 | log-trips | manual-workaround (paid) | 3 |
| L-P28 | "i use an a4 hardback book, onto my 3rd one now." … "every session for 8 years (hundreds of sessions)" … fields: venue, date, time, depth, clarity, bait/method, tide, wind direction, water temp, pressure, weather, moon phase … "really helps you to pick out patterns over time." | Adam S, Sea Angling Ireland | https://sea-angling-ireland.org/forum/viewtopic.php?p=62039 | 2007-01-08 | log-trips | manual-workaround | 2 |
| L-P29 | "Have kept one since 1989, they make great reading." … "Plan to start paying more attention to and recording atmos pressure, water temps and moon phases." | pete, Sea Angling Ireland | https://sea-angling-ireland.org/forum/viewtopic.php?p=62039 | 2007-01-11 | log-trips | manual-workaround, missing-feature | 2 |
| L-P30 | "With time I am recording less material and the topics are changing." (one year in; suggests a spreadsheet) | alancooper, Sea Angling Ireland | https://sea-angling-ireland.org/forum/viewtopic.php?p=62039 | 2007-01-04 | log-trips | complexity | 1 |
| L-P31 | "I like to read a book instead of a screen." (A4 hardback notebook used to "check on past weather, the best tides, best times") | MC, Sea Angling Ireland | https://sea-angling-ireland.org/forum/viewtopic.php?p=62039 | 2007-01-01 | log-trips | manual-workaround | 2 |
| L-P32 | kayak log entry records "outgoing tide", "rising barometer", "SSW 14MPH", launch/return times, lures, line | dlwhite001, charlestonfishing (kayak) | https://forum.charlestonfishing.com/t/kayak-fishing-log-book-entry/71542 | 2016-03-24 | log-trips | manual-workaround | 2 |
| L-P33 | "overall a solid app especially for weather, tides, Moon. … if you delete it all catches are also deleted" … "I wish I could export all my data into a spreadsheet. trapped within the app is not ideal." … "gets time but not location from photos" | Caleb Clapp, Google Play review of Fishing Points (3★) | https://play.google.com/store/apps/details?id=com.gregacucnik.fishingpoints | 2022-06-09 | log-trips | data-lock-in, missing-feature | 2 |
| L-P34 | "I have all but finished an entry only to hit the back button w/o thinking to add the fishing spot and erased everything too many times." | A Google user, Play review of Anglers' Log (5★) | https://play.google.com/store/apps/details?id=com.cohenadair.anglerslog | 2020-02-06 | log-trips | inaccurate | 1 |
| L-P35 | "the weather download feature has stopped working altogether" … "I have reached out to the developers to separate times and received zero response." | Lazybuttjay, App Store (Fish Swami) | https://apps.apple.com/us/app/id1457861289 | 2023-05-17 | log-trips | abandoned-app | 2 |
| L-P36 | "my only complaint is the the barometer reading in in mbar which isn't used in the US." … "I emailed the developer about this and got no reply." | Alfred -Three, App Store (LogIT) | https://apps.apple.com/us/app/fishing-log-journal-logit/id6667102943 | 2026-04-16 | log-trips | inaccurate | 1 |
| L-P37 | "Like not having to show your location if you don't want to" | RylanTheKid13, App Store (LogIT) | https://apps.apple.com/us/app/fishing-log-journal-logit/id6667102943 | 2026-06-13 | log-trips | privacy | 1 |
| L-P38 | "Would like to see a option to keep track of time of day, water temp and lure to remember what worked" | Icevaine, App Store (MyCatch) | https://apps.apple.com/us/app/mycatch-fishing-app/id1361831677 | 2026-05-23 | log-trips | missing-feature | 1 |
| L-P39 | "Constantly buggy, and nothing is simple." … "Errors with location not being found, even when trying to log a fish from directly in the app" | brosa1450, App Store (Log.Fish, $9.99/mo) | https://apps.apple.com/us/app/id6475374664 | 2026-05-25 | log-trips | inaccurate | 2 |
| L-P40 | "a constant attempt to get me to pay for something behind a pay wall." | Codefyi, App Store (Fishing Calendar & Tide Times) | https://apps.apple.com/us/app/fishing-calendar-tide-times/id414676749 | 2024-07-09 | log-trips | ads, too-expensive | 2 |
| L-P41 | "Each year he starts a new log, then at year end pastes the info into a master Excel spreadsheet" (≈12 years); "It felt to much like work."; "over time I just kinda stopped caring"; "the spreadsheet is for sorting and viewing info looking for trends" (OneNote + Sheets) | handle n/a (search snippets), BassResource | https://bassresource.com/bass-fishing-forums/topic/223411-do-you-keep-a-fishing-log ; https://www.bassresource.com/bass-fishing-forums/topic/151461-fishing-logs/ ; https://bassresource.com/bass-fishing-forums/topic/212691-fishing-journallogbook | n.d. | log-trips | manual-workaround, complexity | 2 |
| L-P42 | "plain text file in Dropbox" with screenshots of tide/moon from an AU tides app and BOM weather; another "handwritten records since 1968"; a third "a diary was hard to keep up, so they relied on memory" (snippet paraphrase) | handle n/a (search snippet), Fishraider (AU) | https://www.fishraider.com.au/topic/93289-fishing-diary/ | n.d. | log-trips | manual-workaround, complexity | 2 |

Thread sources for the rows above: L51, L52 (PaFlyFish), L53 (FAOL), L54 (FishingMinnesota),
L55 (NW Fishing Reports), L56 (Sea Angling Ireland), L57 (charlestonfishing kayak); store
sources L5–L11, L21, L58; snippet rows L76 and the Fishraider snippet in §0.

Summary: Today they log on paper (A4 hardbacks, 3x5 notebooks, Amazon log books), in
Excel/Word/OneNote/email/blogs, or in apps whose weather fetch broke or whose maker vanished.
They want automatic conditions (pressure, tide, moon, water temp, flows) with near-zero entry
effort, cross-year pattern views, privacy about spots and skunks, and a record they cannot lose
(Bamboozle, troutbert, Shakeyfly, Caleb Clapp). Price said: $39 "well worth it" (2007), $12/yr
(Y1), one-time preferred (Y2, L20).

**Fields people actually record** (for the MVP form): date and time in/out; location/mark
(often GPS numbers); tide state and high-tide time; wind direction and speed; barometer and its
trend; weather/sky; air temp; water temp; water clarity/colour; water level or river flow; moon
phase; swell/sea state (salt); bait/lure/fly and method; species, count, size/weight; who came
along; "skunk" entries; free-text comments. Sources: L-P12, L-P14, L-P18, L-P19, L-P26, L-P28,
L-P32, L-P38 above and E19, E39.

---

## 4. Incumbent facts: private logging, auto-conditions, analytics, export

| Product | Private log | Conditions captured automatically | Analytics | Export of catches | Web | Price / base | Source |
|---|---|---|---|---|---|---|---|
| **Fishbrain** | Yes, per catch: "Public catch location" / "Only share water name" / "Private - only share catch details" ("Visible to only you") | "let Fishbrain auto-fill the weather and location for you."; "Time of day, weather, air pressure, and temperature"; tide and moon not stated | "Your Logbook breaks catches down by month, weather, water temperature and more."; top baits, waters, species, personal best | **No in-app export documented** on logbook, Pro or home pages. Privacy policy: "You have the right to receive your personal data in a portable and machine-readable format." via support@fishbrain.com, "within 30 days" (GDPR-request-only) | Web shows map/discover; logbook "tied to your Fishbrain account, not a single device" (sync, not a web logbook) | $79.99/yr; 76K App ratings (C1) | L60, L61, L62, L63 |
| **Fishing Points** | "Revisit your trips with a private catch logbook" | "Weather, solunar and tide information are added automatically to your catches" | not mentioned in listing; webapp to "plan and analyze" | **Import only**: "Import kmz or gpx files"; no export; user: "trapped within the app is not ideal." | "Use Webapp to plan and analyze fishing trips on your computer."; "Access your saved data across all your computer and mobile devices." | $49.99/yr Yearly; Basic $29.99; 10M+, 219K Play reviews | L58, L59, C20 |
| **FishAngler** | "Keep your secret spots private."; private waypoints free since 5.2.1 | logbook "45+ attributes — species, bait used, weather, GPS location"; auto-capture not stated | "Automatic angler catch stats sharpen your FINN™ guide." | **Waypoints only**: "importing and exporting waypoints smoother" (4.5.6); no catch export | none | $49.99/yr; 14K App ratings | L64, C16 |
| **ANGLR** | "Personal data is only accessible by you."; "As fisherman, your privacy is of utmost importance to us." | real-time weather/water overlays (display), Bullseye gear-change logging; auto-capture into entries not stated | "fishing analytics dashboard" (C13); users: "Data analysis is truly dismal" (E42) | not mentioned in FAQ or PRO page; users ask for it (E45) | beta web app, "poor performance or experimental features" | PRO "$2.50/month - billed annually at $29.99"; 50K+ Play, 2.9★ (C14) | L65, L66, L67 |
| **onX Fish** | waypoints "we don't sell your data" | none (no catch log; "drop custom Waypoints to mark … your catch locations" with icons, notes, photos) | none | Waypoints export GPX/KML: My Content → Select → Export (desktop offers GPX or KML; mobile GPX) | "fully accessible on desktop" | $34.99/yr; 13 Midwest states | L68, L69 |
| **Navionics** | no catch log | — | — | "GPX IMPORT/EXPORT" of waypoints (C9) | — | $49.99/yr (C9) | C9 |
| Anglers' Log | yes (no social) | Pro: weather, atmosphere, tide | stats by spot, bait, time, weather | **CSV** (Pro); backup flagged unreliable by the developer | no | $11.99/yr; 100K+ Play | L5, L6 |
| LogIT | yes; location never shared | temp, wind, pressure, clarity, moon; tide logged manually | success rates, catches/hour | **CSV + ZIP of images** | no | $9.99/yr / $29.99 life | L7 |
| finScribe (UK) | "private by default" | "Weather, tidal and lunar data." | "Fishing Insight" | not mentioned | no | £29.99/yr; 17,000+ anglers claimed | L12–L15 |
| CatchIQ | "No social feed. No public data." | weather auto; solunar overlay; photo import for history | pattern analysis | none | no (iCloud) | $59.99/yr | L16, L17 |
| Catch Log: Fishing Journal | "Private forever." | GPS, moon, tide, conditions in one tap | tide correlation, lunar bite chart | **CSV / PDF** | no | one-time Pro | L20 |
| Hooper | — | depth, current, temps, moon | — | GPX pin only | no | free | L18, L19 |
| FishingWorldGuide "Catches" (web PWA) | blurred public position (±5 km), anonymous mode; but a public map, 3D globe and rankings | "Every catch gets enriched with weather, moon phase, solunar rating, tide" (Open-Meteo; tide is an astronomical estimate) | 11 charts incl. bite-hour, seasonality, moon donut | **ZIP of JSON + photos** by email link; GDPR pause/anonymise/delete | yes (web-first) | free, "explicitly NOT monetized", affiliate-funded | L70 |
| FishersLog (desktop) / idealog (web, 2007) / mydailyfishinglog.com | yes | manual | graphs by moon, wind, location, temp | files on your disk | desktop / web | $20 / $39; idealog and mydailyfishinglog are dead (DNS) | L24, L56, L78 |

Other small apps that already export, for completeness: CastNote (free, "One-Tap Data Export
(CSV/JSON)") [L83]; Fishing Log: Catch Journal (on-device only, CSV/PDF) [L84]; Fishmarks (GPX in
and out, with a web app, but for spots rather than catches) [L81]; Fishing Friend ($4.99, CSV and
KML, 1 rating) [L82].

Announced plans: none found for export or analytics at Fishbrain, Fishing Points, FishAngler,
ANGLR or onX (FAQ, feature and pricing pages read 2026-10-20). Fishbrain's export remains a
GDPR email request [L61].

**Defensibility read.** The feature set is not novel: Fishing Points already has a private log,
automatic weather/solunar/tide per catch, GPX/KMZ import, a web app and cross-device sync at
$29.99–$49.99 with 10M+ installs [L58, L59]. What it lacks is exactly the candidate's pitch:
export ("trapped within the app"), analysis views, no ads, and no social map. Fishbrain has the
analytics and privacy levels but no export, no web logbook and a social/ad model it will not
undercut [L60, L61]. The gap is therefore real but thin and copyable in weeks by Fishing Points;
the moat has to be trust (export, no ads, non-renewing), data ownership and web-first analysis,
not features. The 2026 flood of 101 new log apps on iOS [L87] shows the build is easy; none has
distribution.

---

## 5. Counter-evidence

| # | Verbatim quote / fact | Who / where | URL | Date | Note |
|---|---|---|---|---|---|
| L-N1 | "I started for a while but then I gave it up..." … "I was spending almost as much time fishing as I was looking at patterns and documenting stuff" | goblueM, FishingMinnesota | https://fishingminnesota.com/forums/topic/117616-journals | 2008-04-12 | quit: time cost |
| L-N2 | "That is the trouble with keeping a journal - you finally realize how few fish you really catch." | SteveD, FishingMinnesota | https://fishingminnesota.com/forums/topic/117616-journals | 2008-04-12 | logging is demoralising |
| L-N3 | "I used to keep a logbook, but I got too lazy to maintain one." | cavdad45, NW Fishing Reports | https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=21290 | 2008-01-11 | lapse |
| L-N4 | "it just became a hassle cause I would miss a trip or too then it would just get away from me." | Acristickid, PaFlyFish | https://paflyfish.com/threads/journal.42965 | 2016-10-23 | the "miss one, miss all" pattern (E1) |
| L-N5 | "Gave it up after three or four seasons." | Oregon_OwlII, PaFlyFish | https://www.paflyfish.com/goto/post?id=925686 | 2023-01-22 | quit |
| L-N6 | "I tried this at the start of the new year a number of times, but I always failed." | hooker-of-men, PaFlyFish | https://www.paflyfish.com/goto/post?id=925686 | 2023-01-22 | repeated failed starts |
| L-N7 | "I just enjoy the day I fish. Memories far outway the data entry which will never ever be used again." | joebamboo, PaFlyFish | https://www.paflyfish.com/goto/post?id=925686 | 2023-01-22 | memory is enough |
| L-N8 | "I've thought about it a few times but just never got the energy to keep a journal of any kind." | JerryC, PaFlyFish | https://www.paflyfish.com/goto/post?id=925686 | 2023-01-22 | never started |
| L-N9 | "A lot of folks say they've kept a journal, but hardly ever actually looked back on it." | wildtrout2, PaFlyFish | https://www.paflyfish.com/goto/post?id=925686 | 2023-01-22 | analysis rarely done, by a 14-year logger |
| L-N10 | "These days I can't be bothered keeping a journal." (after losing years of data in dead software) | Bamboozle, PaFlyFish | https://www.paflyfish.com/goto/post?id=925686 | 2023-01-22 | burned by software |
| L-N11 | "I don't keep a journal and the places I now fish have changed from back-in-the-day." | afishinado, PaFlyFish | https://paflyfish.com/threads/journal.42965 | 2016-11-07 | fisheries change makes old logs stale |
| L-N12 | "Not being a modern tech. wizard, I do not try computer-style programs." (paper since 1968) | rrt, PaFlyFish | https://www.paflyfish.com/goto/post?id=925686 | 2023-01-22 | paper loyalist |
| L-N13 | "I always wanted to do a handwritten journal over an electronic version." | wgmiller, PaFlyFish | https://www.paflyfish.com/goto/post?id=925686 | 2023-01-22 | paper preference |
| L-N14 | "I like to read a book instead of a screen." | MC, Sea Angling Ireland | https://sea-angling-ireland.org/forum/viewtopic.php?p=62039 | 2007-01-01 | paper preference |
| L-N15 | "It felt to much like work."; "over time I just kinda stopped caring"; "more trouble than it is worth"; "stopped keeping a fishing log many, many years ago"; pros heard from "don't keep logs" | handle n/a (snippets), BassResource | https://bassresource.com/bass-fishing-forums/topic/223411-do-you-keep-a-fishing-log ; https://www.bassresource.com/bass-fishing-forums/topic/151461-fishing-logs/ | n.d. | bass anglers quitting (N15, N16 also) |
| L-N16 | Video: "Why Bass Fishing Logbooks Are A Thing Of The Past…" | Randy Blaukat (Intuitive Angling), YouTube | https://www.youtube.com/watch?v=NlO2CA_DVFU | 5 y ago; 3,176 views | a pro arguing against logs |
| L-N17 | "Free version offers nothing enticing enough to even think about paying for it." | Codefyi, App Store (Fishing Calendar) | https://apps.apple.com/us/app/fishing-calendar-tide-times/id414676749 | 2024-07-09 | won't pay for log/calendar |
| L-N18 | "$6/m for paid. … I'd pay $1/m to see tomorrow's forecast. no more." | A Google user, Play (Fishing Points, 1★) | https://play.google.com/store/apps/details?id=com.gregacucnik.fishingpoints | 2019-05-10 | price ceiling |
| L-N19 | "a diary was hard to keep up, so they relied on memory" (snippet paraphrase) | handle n/a, Fishraider (AU) | https://www.fishraider.com.au/topic/93289-fishing-diary/ | n.d. | lapse |
| L-N20 | Government log app GoFishVic "is offline and under review" after feedback and unsupported software | Victorian Fisheries Authority | https://vfa.vic.gov.au/recreational-fishing/gofishvic | 2026 (page) | even funded log apps die [L75] |
| L-N21 | the web log a PaFlyFish poster linked in 2023, mydailyfishinglog.com, no longer resolves | DNS check | http://www.mydailyfishinglog.com/default.asp | 2026-10-20 | web-first logs die too |

**The habit problem: what fraction continue.** The only hard numbers found are from
incentivised citizen-science diaries, which are an upper bound for a paid consumer log:

- UK Sea Angling Diary (Cefas/Substance, free app, prizes, monthly reminder emails and texts):
  "A total of 1,706 diarists signed up in 2018 and 2,188 in 2019, with 736 in 2018 and 988 in 2019
  providing data on their fishing sessions." (43% and 45%). Table 13: of those signed up, 67.3%
  entered any data, **46.5% entered 6 months and 33.9% entered 12 months** (2018); 68.2% / 48.1%
  / 31.7% (2019). "Significant effort was put into following up with diarists to ensure that data
  were completed each month, but there were still issues with missing data." Retention across
  years fell when consent had to be re-confirmed: 1,387 existing diarists carried into 2018 vs
  652 into 2019. [L71]
- The same programme reports "Around 2,000 participants" (2021) [L72]; Connecticut's Volunteer
  Angler Survey has run since 1997 with "18 anglers … to 115 anglers" per year [L73].
- Consumer-app benchmarks (any category): Day-30 retention ≈ 3.1% iOS / 2.8% Android
  (Pushwoosh 2025), ≈ 6% (Plotline, Nov 2025), 5–7% (Phiture's cross-source range) [L74].
- Forum self-reports above: of 36 named posters in the two PaFlyFish threads, 9 say they
  quit or never kept one, 6 keep paper logs for 14–55 years, and about 10 keep a lapsing or
  partial log [L51, L52]. No survey of the share of anglers who keep a personal log was found;
  N1's Southwick finding (only 25% use any fishing app) still stands.

---

## 6. Honest verdict per gate criterion

**Criterion 1, functionality case (≥10 independent verbatim examples): PASS.** 46 handles in
the immersion file plus 40 new named handles here across PaFlyFish, FAOL, FishingMinnesota, NW
Fishing Reports, Sea Angling Ireland, charlestonfishing and App Store/Play reviews, spanning fly,
Midwest, UK/Ireland sea, kayak and app users. The pains are consistent for 20 years: lapse,
transcription, no automatic conditions, lock-in and lost data, spot privacy. Bass is snippet-only.

**Criterion 2, willingness to pay: PASS at $10–20/yr or $25–40 one-time; UNPROVEN at $29/yr.**
People pay for logs: 976 ratings on an $8.99 paper log [L29], Anglers' Log 100K+ downloads at
$11.99/yr [L6], LogIT/FishLogger $29.99 lifetime, a 2007 angler calling $39 "well worth it"
[L56]. No dedicated log app with a visible base charges $29/yr; that price belongs to
map/forecast bundles. The one-time option is what the evidence says converts.

**Criterion 3, organic path to 100 paying in 90 days: LIKELY FAIL (at risk).** Reach is huge
(r/Fishing 3.1M, r/flyfishing 411k, forum threads on this exact topic) but intent is thin:
≈2,400 US searches/month for the log family and ≈130 with "app" intent [L38, L39]; category
YouTube videos earn hundreds to tens of thousands of views over years [L48–L50]; no Facebook
groups on the topic. Stated-assumption math gives 23–65 payers in 90 days without a partner
post or a sharing loop.

**Criterion 4, low resource requirement: PASS** (unchanged from `infrastructure-and-data.md`,
D4–D7: NOAA/NWS key-less and public domain; hosting under $40/month to 1,000 users). The only new
cost signal is that competitors source non-US weather/tide from Open-Meteo, which is paid for
commercial use (D6).

**Criterion 5, defensibility: WEAK, conditional.** Fishing Points already ships a private log,
automatic weather/solunar/tide, GPX import, web app and sync to 10M+ installs at $29.99–49.99
[L58, L59]; it could add CSV export and charts in weeks. Fishbrain has analytics and privacy
levels but export only by GDPR email [L60, L61]. The defensible position is trust and
ownership (export, no ads, non-renewing, web-first analysis), which incumbents resist for
business reasons (C7 section), not a feature nobody can build; 101 log apps launched in 2026
prove the build is easy [L87].

**Criterion 6, economics: PASS on cost, FRAGILE on retention.** Break-even is a handful of
payers (D1–D3), but the only continuation data (33% of incentivised diarists still logging at 12
months; 3–7% Day-30 for apps) [L71, L74] imply renewal rates well below 50% unless the product
removes the entry effort entirely; the one-time option protects revenue but caps it.

---

## 7. Sources

| ID | Claim / number | Value | Publisher | URL | Published | Accessed | Used in |
|----|----------------|-------|-----------|-----|-----------|----------|---------|
| L1 | iTunes Search API "fishing log" (US, software): resultCount; per-app price, ratings, dates | 184 results; stats in §1.2 | Apple (iTunes Search API) | https://itunes.apple.com/search?term=fishing+log&entity=software&limit=200&country=us | live 2026-10-20 | 2026-10-20 | §1.2, §2.2 |
| L2 | iTunes Search API "fishing journal" | 175 results | Apple | https://itunes.apple.com/search?term=fishing+journal&entity=software&limit=200&country=us | live | 2026-10-20 | §1.2 |
| L3 | iTunes Search API "fishing diary" | 169 results | Apple | https://itunes.apple.com/search?term=fishing+diary&entity=software&limit=200&country=us | live | 2026-10-20 | §1.2 |
| L4 | iTunes Search API "catch log" | 173 results | Apple | https://itunes.apple.com/search?term=catch+log&entity=software&limit=200&country=us | live | 2026-10-20 | §1.2 |
| L5 | Anglers' Log App Store: 4.7 (303); Pro $1.49/mo, $11.99/yr; auto-fetch weather/atmosphere/tide; CSV export; cloud backup; "unreliability of cloud backup" note; reviews | as stated | Apple App Store | https://apps.apple.com/us/app/anglers-log-fishing-journal/id959989008 | v2.8.1 2026-10-08 | 2026-10-20 | §1.2, §4 |
| L6 | Anglers' Log Google Play: 100K+ downloads; 4.6; 776 reviews; updated Oct 7, 2026; CSV export; automatic weather/tide; review 2020-02-06 | as stated | Google Play | https://play.google.com/store/apps/details?id=com.cohenadair.anglerslog | 2026-10-07 | 2026-10-20 | §1.2, §3, §4 |
| L7 | LogIT App Store: 4.7 (25); Pro $29.99 / $9.99 yr / $1.99 mo; CSV+ZIP export; conditions logged; reviews Alfred -Three, RylanTheKid13 | as stated | Apple App Store | https://apps.apple.com/us/app/fishing-log-journal-logit/id6667102943 | v2.0.9 2026-10-19 | 2026-10-20 | §1.2, §3 |
| L8 | Fishing Deluxe App Store: $2.99; 4.5 (496); Premium Lifetime $39.99; reviews Cyylus 2015, BabesOfGaming 2016 | as stated | Apple App Store | https://apps.apple.com/us/app/fishing-deluxe/id485251405 | v4.0.1 2026-09-20 | 2026-10-20 | §1.2 |
| L9 | Fishing Calendar & Tide Times App Store: 4.4 (12K); subs $18.99/$49.99 yr; Full version $5.99–7.99; catch log; Codefyi review | as stated | Apple App Store | https://apps.apple.com/us/app/fishing-calendar-tide-times/id414676749 | v5.07 2026-10-13 | 2026-10-20 | §1.2, §5 |
| L10 | MyCatch App Store: 4.8 (250); free; reviews Icevaine, Jamie8495, Tim Fruhauf | as stated | Apple App Store | https://apps.apple.com/us/app/mycatch-fishing-app/id1361831677 | 2026-08-04 | 2026-10-20 | §1.2, §3 |
| L11 | Log.Fish App Store: 3.7 (3); $9.99/mo; NOAA conditions; brosa1450 review | as stated | Apple App Store | https://apps.apple.com/us/app/id6475374664 | v5.3.3 2026-09-01 | 2026-10-20 | §1.2, §3 |
| L12 | finScribe App Store US: 5.0 (2); Premium $29.99, Plus $34.99; £9.99 first-year promo | as stated | Apple App Store | https://apps.apple.com/us/app/id1614459075 | v1.5.22 2026-06-23 | 2026-10-20 | §1.2, §4 |
| L13 | finScribe App Store UK: £29.99/£34.99; 5.0 (1); review 2025-02-24 | as stated | Apple App Store (GB) | https://apps.apple.com/gb/app/id1614459075 | 2026 | 2026-10-20 | §1.2 |
| L14 | finScribe site: "Trusted by 17,000+ anglers"; 18,615 catches; "private by default"; free + Premium; no web app | as stated | Finscribe Ltd | https://www.finscribe.co.uk/ | live | 2026-10-20 | §1.2, §4 |
| L15 | finScribe Google Play: 10K+ downloads; 4.2; 24 reviews; updated Aug 4, 2026 | as stated | Google Play | https://play.google.com/store/apps/details?id=com.cgi.finscribe | 2026-08-04 | 2026-10-20 | §1.2 |
| L16 | CatchIQ App Store: 5.0 (8); Pro $9.99 / $59.99 annual; auto weather & solunar; iCloud private | as stated | Apple App Store | https://apps.apple.com/us/app/id6761931521 | v1.2 2026-06-09 | 2026-10-20 | §1.2, §4 |
| L17 | CatchIQ site: iOS only; Pro $9.99/mo or $59.99/yr; "No social feed. No public data. No sharing."; no export | as stated | CIQ, LLC | https://www.catchiqapp.com | live | 2026-10-20 | §4 |
| L18 | Hooper App Store: free; no ratings; "export a GPX pin"; conditions filled in | as stated | Apple App Store | https://apps.apple.com/us/app/id6764717728 | v1.1.1 2026-08-31 | 2026-10-20 | §1.2, §4 |
| L19 | Anglerlytics site: Hooper free; voice logging; fills in conditions; no web/export | as stated | Anglerlytics LLC | https://www.anglerlytics.com | live | 2026-10-20 | §4 |
| L20 | Catch Log: Fishing Journal App Store: one-tap GPS/moon/tide; CSV/PDF export; "NO social network. NO account required. NO subscription."; one-time Pro | as stated | Apple App Store | https://apps.apple.com/us/app/id6761413057 | 2026 | 2026-10-20 | §1.2, §4 |
| L21 | Fish Swami App Store: 4.0 (9); $9.99 / $19.99 yr; Lazybuttjay 2023-05-17 review | as stated | Apple App Store | https://apps.apple.com/us/app/id1457861289 | v1.31.4 | 2026-10-20 | §1.2, §3 |
| L22 | GotOne! App Store: 4.5 (29); free; auto tide/wind/moon/water temp; LDWF sharing; East End Seal review | as stated | Apple App Store | https://apps.apple.com/us/app/id6443849200 | v1.6.15 2026-06-11 | 2026-10-20 | §1.2 |
| L23 | FishLogger: Pro $9.99/yr (7-day trial) or $29.99 lifetime; CSV export in Pro; ad-free, no social; iOS 5.0 (4) | as stated | appshunter.io (search snippet) + L2 | https://appshunter.io/ios/app/fishlogger-fishing-journal/id6757573416 | 2026 | 2026-10-20 | §1.2 |
| L24 | FishersLog desktop: "$20; fisherslog.com"; Mac or PC; reports by moon phase, location, wind, water temp | $20 | Boating Magazine (search snippet; page 404 on fetch) | https://boatingmag.com/fisherslog-software | n.d. | 2026-10-20 | §1.2, §4 |
| L26 | Google Play search "fishing log": 14 apps visible incl. Fishing Diary (com.fishingdiary.app), finScribe, FishingLog | list | Google Play | https://play.google.com/store/search?q=fishing%20log&c=apps | live | 2026-10-20 | §1.2 |
| L27 | Fishing Diary Google Play: 100+ downloads; 4.6; updated Oct 9, 2026; "Private & Secure" | as stated | Google Play | https://play.google.com/store/apps/details?id=com.fishingdiary.app | 2026-10-09 | 2026-10-20 | §1.2 |
| L28 | FishingLog – Simple Catch Log Google Play: 1K+; 4.6; ads; "Export to CSV for other apps" | as stated | Google Play | https://play.google.com/store/apps/details?id=com.app.fishinglogkt | 2026-09-28 | 2026-10-20 | §1.2 |
| L29 | Amazon.com search "fishing log book": "709 results"; first-page listings with price, stars, ratings, badges, "50+ bought in past month" (fetched with a phone user agent, parsed from HTML) | table §1.1 | Amazon | https://www.amazon.com/s?k=fishing+log+book | live | 2026-10-20 | §1.1, §2.2 |
| L30 | The Fisherman's Journal: Weldon Owen, 2021-07-06, 168 pages, 4.9 stars, $16.69 | as stated | Amazon product page | https://www.amazon.com/dp/1681886456 | 2021 | 2026-10-20 | §1.1 |
| L31 | Pro-Log Fishing Records logbook: $15.95; 150 pages; "29 Data Points"; 0 reviews | as stated | noaachartmap.com (Pro-Knot) | https://www.noaachartmap.com/pro-log-fishing-records-logbook/ | n.d. | 2026-10-20 | §1.1 |
| L32 | Rite in the Rain journals: 350F 4.7 (15) $37.21; 390F 4.9 (8) $35.87; Expedition $17.95–$22.81; 1732 Fly Fishing Journal CAD $19.36 (out of stock) | as stated | Walmart / Knife Country / Modern Outpost (search snippets) | https://www.walmart.com/ip/48616680 ; https://modernoutpost.com/product/rite-in-the-rain-1732-fly-fishing-journal | n.d. | 2026-10-20 | §1.1 |
| L33 | Google Sheets fishing log template: CAD $5.49; dropdowns, auto charts; no reviews | CAD $5.49 | Lure & Line Designs, Gumroad (search snippet; page 404) | https://lureandlinedesigns.gumroad.com/l/ckkvh | n.d. | 2026-10-20 | §1.3 |
| L34 | Interactive Fishing Log (offline HTML, CSV export): CAD $6.99; no reviews | CAD $6.99 | Lure & Line Designs, Gumroad (snippet) | https://lureandlinedesigns.gumroad.com/l/tvuxas | n.d. | 2026-10-20 | §1.3 |
| L35 | JotForm Fishing Log App template: "3" clones; no ratings | 3 | JotForm | https://www.jotform.com/app-templates/fishing-log-app | live | 2026-10-20 | §1.3 |
| L36 | KDP fishing logbook interior templates sold for about $1; one listing with 1 rating | ~$1 | Gumroad sellers (search snippets) | https://thewhiteduck.gumroad.com/l/vzzkv | n.d. | 2026-10-20 | §1.1, §1.3 |
| L37 | Etsy personalised fishing log book about $28.80 on sale; Star Seller; reviews not visible | ~$28.80 | Etsy (search snippet; page 403) | https://www.etsy.com/listing/1618075969 | n.d. | 2026-10-20 | §1.1, §1.3 |
| L38 | "fishing log" US monthly searches 210, CPC $0.44, competition 0.75; related: fishing log book 320, fishing journal 590, fishing logs 390, fish log 390, fishing logbook 390 | as stated | seodata.dev (Google Ads data, updated 2026-07-16) | https://www.seodata.dev/keyword/fishing-log | 2026-07-16 | 2026-10-20 | §2.1 |
| L39 | "fishing log app" 50/mo, CPC $4.04; related: fishing app 5,400; best fishing apps 1,900; fishing apps 1,900; apps fishing 1,600; best fishing app 1,300; fishing spot apps 590; fishing log apps 50; fishing journal app 30 | as stated | seodata.dev (updated 2026-10-08) | https://www.seodata.dev/keyword/fishing-log-app | 2026-10-08 | 2026-10-20 | §2.1 |
| L40 | "fishing log" 390 searches/mo (global), KD 30 "Easy", CPC $0.48; monthly 260–480 Sep 2025–Aug 2026 | as stated | rankhero.com | https://www.rankhero.com/keywords/fishing-log | 2026 | 2026-10-20 | §2.1 |
| L41 | r/Fishing 3.1M (+1.2%/yr), updated 2026-10-17; related: FishingForBeginners 472k, flyfishing 411k, bassfishing 336k, kayakfishing 229k, troutfishing 187k, fishingUK 46k, saltwaterfishing 67k | as stated | GummySearch | https://gummysearch.com/r/Fishing/ | 2026-10-17 | 2026-10-20 | §2.3 |
| L42 | r/bassfishing 336k (+9.7%), updated 2026-09-30; related: Fishing_Gear 465k, SurfFishing 131k, CarpFishing 148k, FishingAustralia 93k, kayakbassfishing 8k | as stated | GummySearch | https://gummysearch.com/r/bassfishing | 2026-09-30 | 2026-10-20 | §2.3 |
| L43 | charlestonfishing forum: user_count 15,679; active 7d 59 / 30d 107; posts 7d 28 / 30d 146; 82,611 topics; 700,043 posts | as stated | Discourse about.json | https://forum.charlestonfishing.com/about.json | live | 2026-10-20 | §2.3 |
| L44 | Fly Anglers Online: 6,265 users; active 7d 16 / 30d 35; posts 7d 11 / 30d 25; 57,369 topics; 503,049 posts | as stated | Discourse about.json | https://www.flyanglersonline.com/about.json | live | 2026-10-20 | §2.3 |
| L45 | StripersOnline forum post counts: Main 2.4m; Fly 332.1k; Kayak 188.5k; Freshwater 164k; Massachusetts 683.6k; New Jersey 485.2k | as stated | StripersOnline | https://www.stripersonline.com/surftalk/ | live | 2026-10-20 | §2.3 |
| L46 | Sea Angling Ireland: "Total posts 383422"; "Total topics 47606"; "Total members 3512" | as stated | sea-angling-ireland.org | https://www.sea-angling-ireland.org/forum/index.php | live | 2026-10-20 | §2.3 |
| L47 | FishingMinnesota per-forum counts: Metro reports 124k posts; Ice Fishing 16k | as stated | fishingminnesota.com | https://fishingminnesota.com/forums/ | live | 2026-10-20 | §2.3 |
| L48 | YouTube search "fishing log book": titles, channels, views (Rustico 40,408; FishersLog Part 1 16,002; VectoriaDesigns 7,785; etc.) | as listed §2.2 | YouTube (ytInitialData parsed) | https://www.youtube.com/results?search_query=fishing+log+book | live | 2026-10-20 | §2.2 |
| L49 | YouTube search "fishing journal app": Ask Apps 13,105; Catfish Edge Top 9 apps 72,889; GotOne 341/360; Biggin tutorials 0–2 views | as listed | YouTube | https://www.youtube.com/results?search_query=fishing+journal+app | live | 2026-10-20 | §2.2 |
| L50 | YouTube search "keep a fishing log": SurfcastersJournal 42,814; Fly Fish University 1,247; NodakAngler 966; Catfish Edge online log 1,965; Randy Blaukat 3,176 | as listed | YouTube | https://www.youtube.com/results?search_query=keep+a+fishing+log | live | 2026-10-20 | §2.2, §5 |
| L51 | PaFlyFish thread "Journal" (2016): 20 posts; quotes Acristickid, just_jon, Dave_W, Swattie87, PocketWater, troutbert, salmonoid, John96, afishinado, rrt, Berks | verbatim | paflyfish.com | https://paflyfish.com/threads/journal.42965 | 2016-10-22 to 2016-11-07 | 2026-10-20 | §3, §5 |
| L52 | PaFlyFish thread "Fishing Journal" (2023): 20 posts; quotes noahq814, a23fish, Oregon_OwlII, hooker-of-men, Bamboozle, rrt, troutbert, JerryC, wgmiller, joebamboo, wildtrout2, Letort; link to mydailyfishinglog.com | verbatim | paflyfish.com | https://www.paflyfish.com/goto/post?id=925686 | 2023-01-21/23 | 2026-10-20 | §3, §5 |
| L53 | FAOL "THE ANGLER'S LOG BOOK" thread: Steven_McGarthwaite, predator55, texfly, Shakeyfly quotes | verbatim | flyanglersonline.com | https://www.flyanglersonline.com/t/the-angler-s-log-book-neil-july-19-2010/42168 | 2010-07-18/22 | 2026-10-20 | §3 |
| L54 | FishingMinnesota "journals" thread: wolkie, goblueM, SteveD, Turk, marble-eye, Walli1, b1gf1sh1 | verbatim | fishingminnesota.com | https://fishingminnesota.com/forums/topic/117616-journals | 2008-04-12/14 | 2026-10-20 | §3, §5 |
| L55 | NW Fishing Reports "Keeping a fishing log": bob johansen, dilbert, HillbillyGeek, cavdad45, EastsideRedneck, danielt, Mike Carey | verbatim | northwestfishingreports.com | https://cdn.northwestfishingreports.com/Forum/viewtopic.php?p=21290 | 2008-01-10/12 | 2026-10-20 | §3, §5, §2.5 |
| L56 | Sea Angling Ireland "Fishing logs": MC, pookie5488, contender, alancooper, lumpy, cortaz, Manxfisher, stevecrow74 ($39 idealog), Tanglerat, Adam S, pete | verbatim | sea-angling-ireland.org | https://sea-angling-ireland.org/forum/viewtopic.php?p=62039 | 2006-12-31 to 2007-01-12 | 2026-10-20 | §1.2, §3, §5 |
| L57 | charlestonfishing "Kayak Fishing Log Book entry": dlwhite001 fields; scgmc; Charleston | verbatim | forum.charlestonfishing.com | https://forum.charlestonfishing.com/t/kayak-fishing-log-book-entry/71542 | 2016-03-24/31 | 2026-10-20 | §3 |
| L58 | Fishing Points Google Play: 10M+; 4.4; 219K reviews; updated Oct 14, 2026; ads; reviews Caleb Clapp (3★, 2022-06-09, export wish), A Google user (1★, 2019-05-10, "$6/m"), Eric Gerber | as stated | Google Play | https://play.google.com/store/apps/details?id=com.gregacucnik.fishingpoints | 2026-10-14 | 2026-10-20 | §1.4, §3, §4, §5 |
| L59 | Fishing Points App Store description: "private catch logbook"; "Weather, solunar and tide information are added automatically to your catches"; "Import kmz or gpx files"; "Use Webapp…"; sync; IAPs | as stated | Apple App Store | https://apps.apple.com/us/app/id1203032512 | v4.2.7 2026-10-06 | 2026-10-20 | §4 |
| L60 | Fishbrain logbook page: auto-fill weather and location; conditions listed; three privacy levels; stats; no export; sync wording | as stated | Fishbrain | https://fishbrain.com/features/logbook | live | 2026-10-20 | §4 |
| L61 | Fishbrain privacy policy: portability right; requests to support@fishbrain.com; "within 30 days"; "Last updated: June 3rd, 2025"; no export/download wording | as stated | Fishbrain | https://fishbrain.com/privacy | 2025-06-03 | 2026-10-20 | §4 |
| L62 | Fishbrain Pro page: features (exact catch locations, bait recs, Garmin depth maps, regs, private waypoints); no prices; no export | as stated | Fishbrain | https://fishbrain.com/pro | live | 2026-10-20 | §4 |
| L63 | Fishbrain home: "The logbook can also fetch weather conditions from your catches, and provide useful insights and statistics."; "you decide whether you want catches shared"; support URL | as stated | Fishbrain | https://fishbrain.com/ | live | 2026-10-20 | §4 |
| L64 | FishAngler App Store: "45+ attributes"; waypoint import/export (4.5.6, 2025-07-30); private waypoints free (5.2.1); VIP $6.99/$49.99; no catch export | as stated | Apple App Store | https://apps.apple.com/us/app/id1073941118 | 2026-10 | 2026-10-20 | §4 |
| L65 | ANGLR FAQ: app and web "completely FREE"; PRO = map layers, weather overlays, gages; "your privacy is of utmost importance"; no export mention | as stated | ANGLR | http://www.anglr.com/frequently-asked-questions | live | 2026-10-20 | §4 |
| L66 | ANGLR PRO: "$2.50/month - billed annually at $29.99"; feature list | $29.99/yr | ANGLR | https://www.anglr.com/pro.html | live | 2026-10-20 | §1.4, §4 |
| L67 | ANGLR home: beta web app warning; "Personal data is only accessible by you."; 500K+ trips, 4M+ activities | as stated | ANGLR | https://anglr.com/ | live | 2026-10-20 | §4 |
| L68 | onX Fish FAQ: $34.99/yr after 7-day trial; desktop "nearly all the same features"; waypoints for catch locations; 13 states; no catch log/export Q&A | as stated | onX | https://www.onxmaps.com/fish/app/faq | live | 2026-10-20 | §1.4, §4 |
| L69 | onX export steps: My Content → Select → Export; desktop GPX or KML; mobile GPX | as stated | onWater support (third-party description of onX), 2026-04-07 | https://support.onwaterapp.com/en/articles/13498075-uploading-your-waypoints-to-onwater-fish-from-onx-or-google-my-maps | 2026-04-07 | 2026-10-20 | §2.5, §4 |
| L70 | FishingWorldGuide Catches: free PWA; auto weather/moon/solunar/tide (Open-Meteo); ZIP export (JSON + photos); GDPR; ±5 km blur; 11 charts; "explicitly NOT monetized" | as stated | FishingWorldGuide.com | https://www.fishingworldguide.com/en/catches/about | live | 2026-10-20 | §4 |
| L71 | Sea Angling Diary: 1,706 signed up 2018 / 736 provided data; 2,188 / 988 in 2019; Table 13 (67.3% / 46.5% / 33.9% in 2018; 68.2% / 48.1% / 31.7% in 2019); existing diarists 1,387 (2018) vs 652 (2019); "31% of recorded sessions were shared" (2019); follow-up effort quote | as stated | Cefas / Substance, "Participation, effort, and catches of sea anglers resident in the UK in 2018 & 2019", April 2021 (PDF, text extracted) | https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1004226/Sea_angling__2018-19_report.pdf | 2021-04 | 2026-10-20 | §2.5, §5, §6 |
| L72 | Sea Angling Diary "Around 2,000 participants"; free app; what is logged | as stated | Solway Firth Partnership | https://www.solwayfirthpartnership.co.uk/free-sea-angling-diary-mobile-app/ | 2021-05-05 | 2026-10-20 | §5 |
| L73 | Connecticut Volunteer Angler Survey: participants "18 anglers … to 115 anglers" per year since 1997; logbooks returned to volunteers | as stated | CT DEEP, F54R40 Job 2 annual report 2021 (PDF, text extracted) | https://portal.ct.gov/-/media/deep/fishing/publications/f54r40-job2-vas-annrpt-2021.pdf | 2021 | 2026-10-20 | §5 |
| L74 | App Day-30 retention: 3.10% iOS / 2.82% Android (Pushwoosh Benchmarks 2025); 6% all apps (Plotline, 2025-11-11); 5–7% cross-industry (Phiture) | as stated | Pushwoosh; Plotline; Phiture (search snippets) | https://www.pushwoosh.com/blog/increase-user-retention-rate ; https://www.plotline.so/blog/retention-rates-mobile-apps-by-industry ; https://phiture.com/mobilegrowthstack/managing-retention-rate-benchmarks-and-expectations/ | 2025–2026 | 2026-10-20 | §5, §6 |
| L75 | GoFishVic app "is offline and under review"; software no longer supported | as stated | Victorian Fisheries Authority (search snippet) | https://vfa.vic.gov.au/recreational-fishing/gofishvic | 2026 | 2026-10-20 | §5 |
| L76 | BassResource threads on fishing logs (snippets only; site 403): 223411 "Do you keep a fishing log?", 151461, 212691, 213050, 122166, 95756, 174145; quit and workaround quotes without handles; Facebook group search: none found | as stated | bassresource.com via search snippets | https://bassresource.com/bass-fishing-forums/topic/223411-do-you-keep-a-fishing-log ; https://www.bassresource.com/bass-fishing-forums/topic/151461-fishing-logs/ ; https://bassresource.com/bass-fishing-forums/topic/212691-fishing-journallogbook | n.d. | 2026-10-20 | §2.3, §3, §5 |
| L77 | Video "Why Bass Fishing Logbooks Are A Thing Of The Past…", Intuitive Angling With Randy Blaukat, 3,176 views, 5 y ago | as stated | YouTube | https://www.youtube.com/watch?v=NlO2CA_DVFU | ~2021 | 2026-10-20 | §2.2, §5 |
| L78 | mydailyfishinglog.com: DNS lookup fails (ENOTFOUND) | dead | DNS check | http://www.mydailyfishinglog.com/default.asp | — | 2026-10-20 | §1.2, §4, §5 |
| L79 | Fishbrain programmatic SEO city page: "Anglers using Fishbrain have logged: 5,155 catches for Largemouth…" (Malakoff, TX) | as stated | Fishbrain (Bing result snippet) | https://fishbrain.com/cities/us/tx/malakoff | live | 2026-10-20 | §2.5 |
| L81 | Fishmarks: GPX import from chartplotters and GPX export; web app for spots | as stated | Apple App Store (MT storefront, search snippet) | https://apps.apple.com/mt/app/id6761666919 | 2026 | 2026-10-20 | §4 |
| L82 | Fishing Friend: $4.99; CSV and KML export; 1 rating; last version 2023-07-24 | as stated | Apple App Store + L1 | https://apps.apple.com/us/app/fishing-friend/id508487103 | 2023-07-24 | 2026-10-20 | §1.2 |
| L83 | CastNote: free, no ads, "One-Tap Data Export (CSV/JSON)" | as stated | mwm.ai mirror (search snippet) | https://mwm.ai/apps/castnote/6779046515 | 2026 | 2026-10-20 | §4 |
| L84 | Fishing Log: Catch Journal: on-device only, CSV/PDF export | as stated | mwm.ai mirror (search snippet) | https://mwm.ai/apps/fishing-log-catch-journal/6793002667 | 2026 | 2026-10-20 | §4 |
| L87 | estimate: union of L1–L4 = 450 unique apps; 101 apps with log/journal/diary/catch in the name released on or after 2026-01-01; only Anglers' Log (303) and ANGLR (635) among log-named apps have ≥100 iOS ratings | derived with jq from L1–L4 | this file | — | 2026-10-20 | §1.2, §2.2, §4, §6 |
| L88 | First-100 math inputs: thread views 2,000–5,000 per 90 days, CTR 3%, sign-up 20%, pay 10%; SEO 10–20% click share, 2% visitor→paid; video 1,000 views, 1% paid; launch 300–1,000 visits, 1–2% paid | estimate (derivation in §2.4, using L38, L39, L48–L50) | this file | — | 2026-10-20 | §2.4 |
