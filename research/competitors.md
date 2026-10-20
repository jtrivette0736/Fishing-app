# Competitor teardown — recreational fishing apps and web tools

Phase 2 deliverable. Format follows `.claude/skills/competitor-teardown` and `source-logging`.
All store figures were read on **2026-10-20** (UTC). "App" = Apple App Store US listing, "Play" =
Google Play US listing. App Store review pages do not display per-review star ratings; reviews
quoted as "critical" are classified by content. Quotes are verbatim; the fetch tool capped each at
~125 characters, so some are short.

**Evidence limits (say so, don't guess):** reddit.com and trustpilot.com are blocked in this
environment, and the shared WebSearch budget ran out after 45 searches, before the planned
`site:reddit.com` / `"<app>" trustpilot` snippet pass. Complaint quotes below therefore come from
App Store review pages (1 page, ~10 reviews each) plus one forum/press page where reachable. A
follow-up pass with search restored would add Reddit and Trustpilot quotes. Pages that refused
(403/5xx): Wired2Fish, Esri newsroom, Capterra/GetApp, EU-Startups, SGI Europe, BassResource.

---

## 1. Summary (competitive landscape)

1. **Three VC-scale consumer platforms own "catch log + map + forecast":** Fishbrain (10M+ Play
   installs, 76K App ratings, $79.99/yr, "20 million anglers" claimed) [C1, C3, C5], Fishing Points
   (10M+, 219K Play reviews, $49.99/yr) [C20, C22] and FishAngler (1M+, $49.99/yr) [C16, C18]. All
   three are ad-supported freemium on Android ("Contains ads") [C3, C18, C22].
2. **Maps are owned by hardware makers:** Garmin (Navionics, 5M+ installs but 2.8–2.9 stars) [C9,
   C11, C12], Navico (C-MAP, Lowrance) [C80, C81], Deeper [C39]. onX entered in 2024 (onX Fish,
   TroutRoutes acquired 2024-03-20) at $34.99–39.99/yr with a web client [C25, C26, C29].
3. **Pricing clusters at $30–60/yr** for a single-purpose app and **$80–100/yr** for the big
   bundles (Fishbrain $79.99, FishTrack $95.99, Buoyweather $95.99, Windy PRO up to $164.99)
   [C1, C37, C84, C83]. Marine weather charges more than catch logging.
4. **Tournament software is a per-entry business, not a subscription:** TourneyX (per-angler fee
   deducted from registration) [C54], FishDonkey (free to host, angler service fee) [C57],
   Weighfish (6.5% + director tiers $69.99–$284.99/yr) [C61], Fishing Chaos (fees unpublished)
   [C59]. FishDonkey reports 171,000 anglers and 18,000 tournaments [C57].
5. **Guide marketplaces are commission businesses:** FishingBooker "starts at 10%" and markets that
   as "well below the 25–30% most platforms take" [C67]; Guidesly charges 3% / 10% / 15% by
   channel [C71]; Captain Experiences (3,000+ guides) does not publish fees [C72].
6. **Gear inventory is a graveyard niche:** SmartTacklebox last updated 2016 (1.0 stars) [C77];
   ANGLR, FishFriender and FishWise bolt a "virtual tackle box" onto a logbook [C13, C78, C91].
   No product tracks purchase cost, usage or resale value across a collection.
7. **Reel/rod maintenance logging is essentially unserved:** the only app found is ReelKeep
   (iPhone-only, Japanese solo developer, v1.0 Jun 2026, zero ratings, carries ads) [C79].
8. **Club management is unserved in the US:** Weighfish (mobile-only, series standings and dues)
   [C61] and Fishing Chaos's unpriced "club module" [C60] are the only candidates; angelflix is a
   German product [C106]. Nothing offers a web admin for a club's members, dues, points and comms.
9. **Data export is almost universally absent** from consumer apps' feature lists; exceptions are
   Navionics (GPX import/export) [C9] and Weighfish (PDF/CSV) [C61]. Fishing Points *imports*
   GPX/KMZ but does not advertise export [C20].
10. **The graveyard is social/map apps that depended on scale:** Fishidy (850K users, sold to FLIR
    2018, site is now an empty shell) [C93, C94], Fishhound (domain redirects to a dead host)
    [C95], FishHunter's social layer removed (2023) [C82], NOAA's iOS reporting app folded into a
    web app (2025) [C96].

---

## 2. Product cards

### A. Social / catch-log platforms

### Fishbrain — social fishing network with catch map, forecasts and Garmin depth charts
- Platforms: iOS / Android / web (fishbrain.com has Map, Discover, species and water pages; three
  Pro features are labelled "App only") [C4, C5]
- Pricing: free with ads [C3] | Fishbrain Pro $14.99/mo (also $12.99 variants), $41.99/quarter,
  $79.99/yr [C1]; 3-day free trial [C4]
- Business model: subscription + in-app ads + "Advertise" page for brands + gear reviews (affiliate)
  [C3, C5]
- Core features: catch log ("20M total catches logged", "14 million catch locations") [C5]; depth
  charts "from Garmin Navionics (USA & Canada) and C-Map Social" [C1]; "BiteTime fishing forecasts
  powered by advanced AI" [C1]; "local fishing regulations in 30+ US states" [C1]; private waypoints
  [C1]; gear reviews ("500k gear reviews") [C5]
- Ratings: App 4.7 (76K) [C1]; Play 4.5 (67.6K), 10,000,000+ installs [C3]
- Last update: App v9.65.0 "1d ago" (i.e. 2026-10-19) [C1]; Play "Oct 6, 2026" [C3]
- User base: "Join 20 million anglers on Fishbrain" (company claim) [C5]
- Owner / funding: FishBrain AB, Stockholm [C1]; $2.4M (2014, Northzone, Active) [C7]; $13.5M
  Series B (2018, B Capital, SoftBank Ventures Korea, Northzone, Industrifonden) [C6]; CB Insights
  lists $74.26M over 13 rounds, latest Series D $6M on 2023-08-07 (search snippet, page not
  fetched) [C8]
- Top complaints (App Store reviews, [C2]):
  - 06/04/2023 Troutkaster9000: "to charge for something you guys were not charging for before is outrageous."
  - 04/14/2024 So Supid: "now they removed all that u have to pay 70! dollars a year just to see catches"
  - 05/05/2021 Joseph.Dancer: "Unfortunately their catch data is near worthless"
  - 10/22/2022 _Lt_Dan_: "my local fishing spots started to hold less and less fish."
  - 09/27/2020 SpeciesMultidex: "They NEED moderators on here to limit the number of fake catches"
  - 07/31/2024 GingerGoo: "Customer service was dismissive and not helpful."
  - 07/24/2021 Ryan Cassady: "the app does not allow you to create a new body of water."
- Top praise: 07/24/2021 title "Great App With one Problem"; 05/05/2021 title "I love this app but..."
  (both mixed; the page's positive copy is Apple's "Editors' Choice" blurb, not a user) [C2]
- Gaps relevant to our candidates: no gear inventory or maintenance; no export; social model
  conflicts with privacy (spot-burning complaint); logbook forces a listed water body; paywall creep
  is the loudest complaint.
- Sources: C1–C8

### Fishing Points — map/forecast/logbook app with NOAA offline charts and a web app
- Platforms: iOS / Android / web ("Use Webapp to plan and analyze fishing trips on your computer") [C20]
- Pricing: free with ads [C22] | Premium $9.99 (monthly), Yearly Premium $49.99, "Basic Premium"
  $29.99, "Advanced Premium" $49.99 [C20]
- Business model: subscription + ads [C22]
- Core features: "Offline mode with nautical charts provided by NOAA"; "Import kmz or gpx files";
  regulations for FL, TX, GA, NC, LA; "private catch logbook"; depth/contour lake maps;
  tides/solunar/marine forecast [C20]
- Ratings: App 4.7 (31K) [C20]; Play 4.4 (219K), 10,000,000+ [C22]
- Last update: App v4.2.7 "Oct 6" [C20]; Play "Oct 14, 2026" [C22]
- User base: estimate 10–20M installs (Play band 10M+ [C22] plus iOS, unknown)
- Owner / funding: Fishing Points d.o.o. (Slovenia) [C20]; funding unknown
- Top complaints [C21]:
  - 08/12/2025 Markh142: "Literally none of the lakes or rivers I fish are visible in this app." / "...definitely not worth $50 a year."
  - 10/30/2023 Shoreline C: "these forecasts on here mean nothing and don't make any sense and will not help you catch fish whatsoever."
  - 03/19/2022 assholfever: "But the factors for fishing activity don't work."
  - 04/04/2025 B3hr057: "pretends to be free in order to get your personal info."
  - 08/29/2020 JWB310: "nor does it appear the source of their data is consistent."
- Top praise [C21]: 07/31/2021 Chokoloskee Steve: "It's definitely the best one ever!"; 12/15/2018
  FishingNate: "This is the fishing app I've been looking for for a long time."
- Gaps: inland coverage; no export (import only); no gear; forecast credibility.
- Sources: C20–C22

### FishAngler — "AI-powered" social logbook with 3D maps and forecasts
- Platforms: iOS / Android ("Available on IOS & Android") [C19]
- Pricing: free with ads [C18] | VIP $6.99/mo, $49.99/yr [C16]
- Business model: subscription + ads + brand "exclusive discounts" (search snippet) [C18]
- Core features: AI guide ("FINN"), "500 AI credits that refill monthly" (VIP); logbook "with 45+
  attributes"; "3D lake maps, depth charts, ocean floor mapping"; 7-day/14-day forecasts; "Keep
  your secret spots private"; angler groups [C16]
- Ratings: App 4.8 (14K) [C16]; Play 4.3 (15.5K), 1,000,000+ [C18]
- Last update: App v5.3.0 "5d ago" [C16]; Play "Oct 14, 2026" [C18]
- User base: "Trusted by millions of anglers worldwide" (claim) [C19]; estimate 1–3M installs
- Owner / funding: FishAngler, LLC [C16]; funding unknown
- Top complaints [C17]:
  - 04/07/2019 Skeem's: "if you delete pictures from your phone it effects the pics in the app..."
  - 07/08/2020 Home3681: "The app is subpar nothing spectacular in my opinion, lots of things don't need to be on it and things need to be added."
  - 06/13/2025 Ishzzy: "I was notified my account had gotten banned." (support did not reply)
  - 08/26/2021 Oliver Kloesov: "Can you add a feature or a "Return To Top" button within the feeds?"
- Top praise [C17]: 04/25/2024 EarlV007: "...FishAngler has surpassed them all, in my opinion.";
  08/22/2024: "it's literally fishtagram lol. Just an amazing app."
- Gaps: no web; photos tied to phone library; no export; no gear.
- Sources: C16–C19

### ANGLR — private-by-default logbook with gear tracking, analytics and Bullseye hardware
- Platforms: iOS / Android / web ("Welcome to our Beta Web App ... poor performance or
  experimental features") [C15]
- Pricing: free | ANGLR PRO $39.99, ANGLR MEMBER $2.99 and $29.99 (billing periods not shown)
  [C13]; Play IAP $1.99–$29.99 [C14]
- Business model: subscription + hardware accessory ("Pair with optional fish tracker accessories")
  [C13]
- Core features: "Build a virtual tackle box and track your fishing gear"; waypoints to MFDs; "fishing
  analytics dashboard"; "fishing forecast based on past data"; "100% free and private by default" [C13]
- Ratings: App 4.2 (635) [C13]; Play 2.9 (399), 50,000+ [C14]
- Last update: App v2.1.597 "Sep 5" [C13]; Play "Sep 5, 2026" [C14]
- User base: "500K+ Fishing trips recorded", "2.5M Waypoints logged" (claims) [C15]; installs
  50K+ on Play [C14]
- Owner / funding: App Store seller "Rough Stone Software, LLC" [C13]; whether this is the original
  ANGLR Labs or a successor owner is **unknown** (search budget exhausted before verifying)
- Top complaints [C13]: 06/26/2021: "The downside is that this app crashes so often."; 01/11/2021
  MLMRyan: "It crashes at least once per trip." / "Data analysis is truly dismal compared to other
  logging apps."
- Top praise [C13]: 11/21/2018 spudicus123: "this app isn't perfect, but it's the closest I've
  found"; 12/05/2019 jd.odell: "The beauty of the Anglr system is its simplicity."
- Gaps: the closest incumbent to a private gear-aware logbook, but tiny (50K+ Play), 2.9 on Play,
  web still beta, analytics called "dismal". Proof the segment exists and is under-served.
- Sources: C13–C15

### Fishbox — forecast-first app with 50,000+ lake maps, offline tiles and an AI assistant
- Platforms: iOS / Android [C41, C42]
- Pricing: free | "Fishbox Premium" $7.99, $9.99, $11.99, $19.99, $27.99, $35.99 (periods not
  shown) [C41]; Play IAP $5.99–$79.99 [C42]
- Business model: subscription (no ads flag on Play) [C42]
- Core features: "download offline map tiles"; "bathymetric and satellite maps covering 50,000+ U.S.
  lakes"; hyperlocal forecast + solunar; "AI-Powered Catch Assistant"; photo fish ID [C41]
- Ratings: App 4.6 (39K) [C41]; Play 4.6 (59.4K), 1,000,000+ [C42]
- Last update: App v6.36.0 "Oct 12" [C41]; Play "Sep 10, 2026" [C42]
- User base: estimate 1–3M installs (Play 1M+ [C42])
- Owner / funding: MEMS Group, Inc. [C41]; funding unknown
- Top complaints [C41]: 09/06/2025 Nkeegs: "they need to be more clear about going about canceling
  your subscription"; 08/21/2024 CreaRec: "Weather could use some work too, I use multiple apps to
  compare data, which is a pain."; Apr 3 Evgeniy.Rez1984: "for rivers, it definitely needs improvement."
- Top praise [C41]: titles "Paying, but Want More Updates!" (08/21/2024), "Great app with room for
  improvement" (Apr 3)
- Gaps: no catch log beyond a photo gallery; no regs; no export; no web.
- Sources: C41, C42

### Fishsurfing — Czech social fishing network (minor)
- iOS/Android; PRO $34.99/yr or $3.99/mo [C50]; App 3.6 (5 ratings), v2.122 "6d ago" [C50];
  Fishsurfing s.r.o.; 163K users claimed in 2020 (search snippet) [C50]. Negligible US presence.

### Indie catch logs (minor): FishTracker: Your Fishing Log — free, 4.5 (6), v18.0.0 2025-09-30, no
export mentioned, "developer does not collect any data" [C90]. Fly Fishing Log — free, 5.0 (1 rating),
private map [C89]. Pattern: private logs exist as hobby projects with single-digit ratings.

### B. Maps and sonar

### Navionics Boating (Garmin) — marine/lake charts with SonarChart, routing, Plotter Sync
- Platforms: iOS / Android; web ChartViewer: unknown (not in listing)
- Pricing: free app, "Try it free for a limited time" [C9] | one-year regional subscriptions:
  US & Canada $49.99; Mexico/Caribbean to Brazil $49.99; Mediterranean $59.99; Adriatic $69.99;
  Central & West Europe $59.99; others $49.99 [C9]; Play IAP $49.99–$149.99 [C11]
- Business model: subscription + hardware ecosystem (Plotter Sync) + ads on Play ("Contains ads") [C11]
- Core features: "detailed charts you can use offline"; "SONARCHART HD BATHYMETRY MAPS"; "GPX
  IMPORT/EXPORT"; weather/tides; AIS; Plotter Sync [C9]
- Ratings: App 2.9 (2.4K) [C9]; Play 2.8 (48.7K), 5,000,000+ [C11]
- Last update: App v24.4 "Sep 28" [C9]; Play "Aug 19, 2026" [C11]
- User base: estimate 5–10M installs (Play 5M+ [C11])
- Owner: Garmin Ltd, acquired Navionics 2017-10-27 [C12]
- Top complaints [C10]:
  - 05/15/2023 Serious angler: "the most recent update is TERRIBLE and reduced the quality to crap for relief shading"
  - Mar 27 (2025) ErikExp: "For $50/yr, I expect that this serious problem working with IOS would be resolved."
  - 06/28/2024 user-app99: "if I switch device I will loose access to my already purchased charts."
  - 07/12/2023 Angler chick: "the sonar overlay depths are now WAY off, showing holes and depths that are definitely not correct"
  - 04/12/2024 Afterburner5: "I just hope whoever the greedy people and HORRIBLE decision makers are" (maps not downloading)
  - 06/02/2018 Regular customer: "I was informed that there will be no update to allow this App to work" (legacy app sunset)
- Top praise [C10]: 01/16/2020 Smelly mole: "This app really did save me that night"; 07/24/2018:
  "The app is free and comes with a 2 week trial of Navionics+."
- Gaps: 2.8–2.9 stars on 50K+ reviews is the weakest satisfaction of any big incumbent; lock-in
  anger; no catch log; no regs.
- Sources: C9–C12

### onX Fish — lake finder with DNR survey data, contours, regs; Midwest only
- Platforms: iOS / Android [C25]; web: onX said onX Fish "will launch on iOS and on the web
  exclusively in Minnesota this spring" (2024) [C26]; no iPad version (review) [C24]
- Pricing: free tier | "onX Fish Midwest ($34.99/year)", 7-day trial [C23, C25]
- Business model: subscription (onX Hunt playbook)
- Core features: "onX Fish currently covers 13 states"; offline maps; "View regulations"; 3D topo
  lake maps; "size distribution survey data per lake"; trophy/abundance filters; ice-up imagery
  [C23, C25]
- Ratings: App 4.6 (1.8K) [C23]; Play: listing not found under tested package names
- Last update: App v26.41.0 "1d ago", 482 MB [C23]
- User base: unknown
- Owner / funding: onXmaps, Inc., Missoula; "nearly 400 employees" [C26]; blog sidebar headline
  "onX Secures $87.4M in Series B Funding" (investors not named on page) [C26]
- Top complaints [C24]:
  - 06/30/2024 Itascamom: "I have found that most of the lakes around my area and beyond simply have misleading information about them."
  - 12/19/2024 TheMNangler: "This makes lakes with unstable fish populations look way better than they actually are." / "if they don't make some major changes, I wouldn't pay for it."
  - 08/19/2025 jacobmnelson: "I subscribed on my phone, and I get the 'you should subscribe' notifications, but I already do." / "You need to make an iPad version."
  - Aug 11 Colton from ND: "a few of the lakes I fish regularly can be 20-30 feet low at times."
- Top praise [C24]: 09/15/2025 KLaRock: "worth every penny"; Jul 3 Looney507: $35 annual price "is not bad"
- Gaps: no catch log, no gear, 13 states; strongest-capitalised new entrant; would be the first to
  add a web-first logbook if it wanted one.
- Sources: C23–C26

### TroutRoutes (onX) — trout-stream mapping with access points, gauges, regs, desktop maps
- Platforms: iOS / Android / desktop ("Desktop Maps" at maps.troutinsights.com) [C29]
- Pricing: Basic free | PRO $39.99/yr "(org. $58.99)" or $9.99/mo; Single-State $19.99 or $34.99
  (App IAP) ; 7-day trial then charged for a year [C27, C29]
- Business model: subscription
- Core features: "over 50,000 trout streams ... across 48 states", "280,000+ hand-curated access
  points", offline maps, "live USGS stream gauge data", regulations, "Multi-platform access across
  desktop and mobile" [C27, C29]
- Ratings: App 4.5 (3.9K) [C27]; Play 3.4 (628), 100,000+ [C28]
- Last update: App v5.4.8 "7h ago" [C27]; Play "Oct 19, 2026" [C28]
- Owner: onXmaps, acquired 2024-03-20 (price undisclosed) [C26]
- Top complaints [C27]: Jul 31 Kevil, GB: "Yet when I go to use Trout Routes it is always requesting
  that I upgrade from the basic level."; 07/27/2024 Diesel: "I only have a limited amount of time
  before it starts crashing."; 06/13/2023 tywalkerdev: "Save your money and buy a few flies at a
  local fly shop."; Jun 22: "it would be nice to actually have up to date regulations right in the app"
- Top praise [C27]: Jul 31 title "Help does exist when you have a problem!"; Jun 22 title "Good but
  room for improvement!"
- Gaps: no catch log, no hatch charts, no gear; Play rating 3.4.
- Sources: C26–C29

### Fish Deeper (Deeper UAB) — castable-sonar companion with community bathymetry; works without sonar
- Platforms: iOS / Android / web (web-app badge on product page) [C39, C40]
- Pricing (App IAP): 1-Month Fish Deeper Premium $6.99; 12-Month Fish Deeper Premium $24.99;
  1-Year Premium+ Membership $59.99; 12-Month Premium Membership $45.99 [C39]. Site (EUR):
  Premium €24.99/yr or €5.99/mo after 7-day trial, €0.99 first month; Premium+ €39.99/yr with
  "Guaranteed one replacement per year" of the sonar and 20% off accessories [C40]
- Business model: hardware + subscription + insurance-style Premium+
- Core features: offline maps; catch log; "Create depth maps from shore, boat, kayak, or SUP"; 2D/3D
  depth and hardness maps ("Online only" for hardness) [C39, C40]
- Ratings: App 4.5 (654) [C39]; Play: listing not found under tested package names
- Last update: App v2.7.0 "Sep 30" [C39]
- Owner: Deeper UAB, Vilnius [C39]
- Top complaints [C39]: 02/23/2023 CGKleen: "Want to risk a private waterway's privacy?"; 12/27/2021
  rallx title "Awesome app, questionable privacy policy"; 09/01/2023 nublet4358: "For $200 it's not
  worth the price. It does not work under 3-4ft of water."
- Top praise [C39]: 11/16/2021: "I'm enjoying at least knowing the depth and structure that I'm fishing."
- Gaps: privacy of user-generated bathymetry is a live complaint; no gear; no regs.
- Sources: C39, C40

### C-MAP: Boating and Lowrance: app for anglers (Navico) — chart viewers tied to Lowrance/Simrad
- iOS/Android; annual subscription $14.99 / $29.99 / $39.99 / $49.99 tiers and region map packs
  $18.49–$39.99 [C80, C81]; C-MAP App 4.5 (2.4K), Lowrance App 4.6 (2.9K); both v4.6.1 "Jun 17" [C80, C81]
- Complaints [C80]: 07/12/2023 Heater911 (lost saved data after password reset): "Lowrance SHOULD be
  the gold standard in this industry."; 10/29/2025 NN MN title "Not stable. Frequent shutdowns"
  (lost waypoints after reinstall); [C81] 04/01/2023 MakingMovies: "this app has MANY long lived bugs"
- Gap: waypoint/data loss on reinstall is the recurring theme; no export advertised.

### Pro Angler (Open Ocean Apps) — saltwater hot spots, reports, regs (minor)
- iOS; "Pro Fishing Advantage" IAPs $9.99–$59.99 (periods not shown) [C47]; App 4.6 (6.2K), v9.9.10
  "Jun 8" [C47]; "110,000+ Fishing Hot Spots", "state and federal regulations", weekly captain reports
  [C47]. Complaint 01/12/2021 Hammerheadrandi: "I wouldn't put much faith in the what's biting now
  section."; praise 09/18/2025: "The reports in Pro Angler are one of the main reasons I use it every trip."

### C. Conditions, forecast and tides

### FishTrack (Surfline/Wavetrak) — offshore SST/chlorophyll charts and marine forecasts
- iOS / Android; Premium $14.99/mo, $95.99/yr; "FishTrack.com & App" $79.99/yr [C37]; Play IAP
  $14.99–$95.88 [C38]
- Ratings: App 4.6 (6.3K) [C37]; Play 3.3 (362), 100,000+ [C38]
- Last update: App v3.0.1 **10/09/2024** (a year stale) [C37]; Play "Jul 20, 2026" [C38]
- Features: "Save imagery and overlay data for offline use"; SST + chlorophyll; marine forecasts [C37]
- Complaints [C37]: 10/17/2019 gayyoom: "Please don't pay fishtrack as a premium user by using Visa
  card."; 06/21/2022 Healthy Skeptic: "Suggest you AVOID"; 07/22/2018 abookulsum: "Very bad customer
  care."; 05/13/2019 Tommydeez1161 title "Inaccurate and Dangerous"
- Praise: none shown on the fetched page
- Sister app **Buoyweather**: Premium $14.99/mo, $95.99/yr, also "1 Year Subscription $79.99"; App
  4.7 (1.1K); 10/10/2022 flamelas: "my experience is to trust up to seven days. After that it drops
  to a 50/50 scenario." [C84]

### FishWeather (WeatherFlow/Tempest) — marine wind/weather with station network
- iOS / Android; tiers Plus $3.99 (mo) / $5.49 / $44.99 (yr); Pro $14.99 / $19.99 "Pay As You Go" /
  $119.99 (yr); Gold $14.99 / $21.99 / $179.99 (yr) [C43]; Play IAP $5.49–$179.99, "Contains ads" [C44]
- Ratings: App 4.7 (5.2K) [C43]; Play 4.7 (1.72K), 100,000+ [C44]; last update App v7.14 "Oct 13",
  Play "Sep 28, 2026" [C43, C44]
- Complaints [C43]: 12/10/2020 Mannnygo: "My only complaint is that there is still ads even though I
  pay $3.99 a month."; 10/24/2023 Keegan I.: "it's been telling me to purchase a membership which I
  haven't had to do in the past 3+ years."
- Praise [C43]: 08/10/2019 Billy Rudow title "FishWeather is the best weather program for fishermen!"; 12/10/2020 title "Accurate."

### Windy.app — wind/tide/radar app with a "Fishing Pro" SKU
- iOS; App 4.7 (73K); WINDY PRO $39.99 / $59.99 / $99.99 / $164.99, 1-month $9.99 / $19.99,
  "Windy.app Fishing Pro: $49.99"; v15.8.5 "1d ago" [C83]. Signal: a weather app sells a fishing
  tier at the same $49.99 price point as the catch-log apps.

### Tides Near Me / Tide Charts — tide utilities with huge free bases
- Tides Near Me: App 4.8 (163K); Premium $1.99 (mo) / $14.99 (yr), Go Mode $2.99 / $19.99;
  v4.0.0 "Oct 7" [C48]. Tide Charts (7th Gear): App 4.8 (114K); "Remove Ads $1.99" one-time;
  v3.2.1 "6d ago" [C49]. Complaint [C49] 03/20/2019 cprphd: "I started to receive a lot of annoying
  and unprofessional advertising on it."; Oct 4 LizardCarp: "The tide status on the Apple Watch face
  is AWFUL!!!"
- Signal: 277K combined ratings on $2–15 utilities; tides are a feature, not a product.

### Stormglass — weather/tide API (B2B data source, not a consumer app)
- Free €0 (10 req/day, non-commercial), Small €19/mo (500/day), Medium €49/mo (5,000/day), Large
  €129/mo (25,000/day), 10% off annual [C85]. Relevant as a supplier for a forecast feature.

### D. Regulations and species ID

### Fish Rules — saltwater regs by GPS (NOAA-backed launch 2016), now with freshwater FL and a web app
- Platforms: iOS / Android / web ("Fish Rules now has a web application ... app.fishrulesapp.com") [C33]
- Pricing: free with ads [C32] | "ProStaff $29.99" (a reviewer calls it a "1-year subscription")
  [C30, C31]; ProStaff launched Feb 2021: "includes the ability to send a photo to Fish Rules" for
  human ID [C33]. Separate free "Fish Rules Commercial" app [C111]
- Ratings: App 3.9 (198) [C30]; Play 3.2 (1.98K), 500,000+ [C32]
- Last update: App v6.86.34 "5d ago" [C30]; Play "Oct 6, 2026" [C32]
- Owner: Fish Rules, LLC [C30]
- Complaints [C31]: 12/06/2024 bagmart: "It turns out you may get a response to your photo 49 hours
  later (maybe) in your email."; 09/25/2025 Maikoll.social: "I simply cannot log in on the iS app."
  (title "Don't bother contact them, they won't respond"); 09/06/2025 FloridasMan: "I paid 30 to
  use the app. The app did not give me premium, but apple charged me for it."
- Praise [C31]: 12/19/2021 elcastillian: "This is a must have app for ALL fisherman, novice and expert
  alike."; 02/10/2021 Kitegerm: "this is the one app I trust to make sure I am always certain that I am harvesting legally."
- Gaps: saltwater-centric; low Play rating; support.

### FishVerify — AI species ID + GPS regs + catch log (premium)
- iOS / Android; Monthly $5.99, Yearly $29.99, "Scan Pack one-time purchase (Price $ 6.99) ... Get 5
  Scans"; catch log is a "[Premium Feature]" [C34]; Play IAP $0.99–$47.99 [C35]
- Ratings: App 4.6 (2.2K) [C34]; Play 4.3 (668), 100,000+ [C35]; last update App v2.2.4 "Apr 13",
  Play "May 13, 2026" [C34, C35]
- User base: "surpassed 150,000 subscribers" (company announcement, 2022-03-11) [C36]
- Complaints [C34]: 12/07/2023 Gvlo949 (1 star): "I can take a picture to see what species I caught
  but nothing in the regulations"; 06/16/2021 KingZope title "Great app but lacks locations" (dropped
  subscription, PA not covered)
- Praise [C34]: 05/31/2023 title "Amazing and Accurate"; 11/14/2022 title "Love SC Fishing"
- Note: regs coverage is listed only as "Check the app for supported regulation areas" [C34].

### E. Tournament and club

### TourneyX — web-first catch-photo-release tournament platform (kayak bass heartland)
- Platforms: web + "TourneyX PRO" iOS/Android app (free) [C51, C52]
- Pricing: per-angler fee per series/event, built into registration ("is included in your tournament
  registration"; "the Tourneyx fee for individual event registration is deducted from the sign up
  fee"); optional paid judging ("paying Tourneyx to judge your fish") [C54]; exact amounts not
  published on reachable pages (pricing page 404)
- Business model: per-entry take; no subscription
- Stats: "115.9k active anglers", "144 active tourneys", "2276.7k fish caught"; "Club Tabs" in nav [C53]
- Ratings: App 4.7 (111) [C51]; Play 4.6 (188), 10,000+ [C52]; last update App v2.0.23 "Aug 31",
  Play "Aug 27, 2026"
- Praise [C51]: 03/11/2024: "there is nothing that compares to the GOAT -TourneyX."; 08/01/2024:
  "The developer actually listens to the users on a daily basis"
- Complaints: none on fetched page
- Gaps: director/club admin lives on the web but club membership/dues/points depth unknown.

### FishDonkey — tournament app with offline "Digital Livewell" and anti-cheat video
- Platforms: iOS / Android; web view at tourney.fishdonkey.com "but anglers still need the app to
  enter fish" [C57]
- Pricing: "It is FREE to host a tournament." "Fishermen pay a service fee." (amount not published);
  "Subscriptions and direct billing also available" [C57]
- Stats "As of 10/11/2025": 171,000 anglers; 18,000 tournaments; 1,800,000 fish photos; 276,000 live
  release videos; 10 countries [C57]
- Ratings: App 4.0 (86) [C55]; Play 3.9 (153), 50,000+, "Contains ads" [C56]; last update App v1.13.3
  "Sep 15", Play "Apr 20, 2026"
- Owner: Fishery Innovations, LLC [C55]
- Praise [C55]: 07/21/2022 B Fish'n: "Used know for 3 years and never has a glitch. Perfect and easy!!";
  04/27/2024 Tim gelking: "I use the app to manage all the fish entries for the ice fishing tournament I run annually."
- Complaints: none on fetched page

### Fishing Chaos — tournament platform with a club module and guide tools
- Platforms: web (app.fishingchaos.com) + iOS/Android [C59]
- Pricing: not published; "Request a Demo" [C59]; a 2023 press release describes "the Fishing Chaos
  club module allows clubs to manage member plans, registration, tournaments, series and more" and
  guide "tools for schedule management and online payments" [C60]
- Stats: "40K+ Tournaments & Counting", "1,000,000+ Fish Submitted" [C59]
- Ratings: App 3.9 (86), v3.0.30 "1d ago" [C58]
- Owner: Fishing Chaos, Inc., Columbia SC [C58, C60]
- Praise [C58]: 11/22/2024: "We have been using Fishing Chaos going on four years for our saltwater
  series- Florida Redfish Series."; 04/21/2023: "What started out as a search for software to manage
  weigh-ins resulted in finding a platform in Fishing Chaos"
- Gaps/threat: the only incumbent with a named club module; its depth (dues, points, standings,
  comms) and price are unverified.

### Weighfish — tournament director app with series standings and membership fees (mobile-only)
- Platforms: iOS / Android ("Works Offline"); no web [C61]
- Pricing: anglers free, "6.5% service fee ($1 minimum)" on online entry fees, "No subscription,
  ever"; Director Free $0 (1 tournament/mo, 20 entries); Director Pro $9.99/mo or $69.99/yr (75
  entries); Director Elite $39.99/mo or $284.99/yr (unlimited); PDF/CSV export on all tiers [C61]
- Features: "Automatic season standings, drop tournaments, and tiebreakers"; points methods
  "Decremental, variable spread, and weight-as-points"; membership fees "with separate boater and
  co-angler rates" [C61]
- Stats ("2025 Weighfish Stats"): 300+ series, 1,300+ tournaments, 24,000+ entries [C61]
- Ratings: site claims 4.6 (App) / 4.8 (Play); store listings not fetched
- Gaps: closest thing to club software, but tournament-centred and phone-only.

### iAngler Tournament, BASSTrakk, MLF app — official/legacy tournament apps (weak)
- iAngler Tournament: free, App 2.8 (13), v12.07 "Jun 18"; 04/01/2021: "This app has tournaments
  on it but none of the tournaments will pull up..."; 10/28/2024 Moog742: "Worth every penny! Junk" [C45]
- iAngler by Angler Action (research logbook): App 3.0 (2), v5.1.2 "Jul 15"; 04/30/2023: "App won't
  sync on iPhone or iPad so I can sign up." [C46]
- BASSTrakk (B.A.S.S.): App 2.5 (19), last version 1.8.7 **10/04/2023**; 04/23/2023 title "Bad app.
  Don't download." [C63]
- Major League Fishing: App 3.7 (6), v2.2.1 "May 14"; 12/14/2021 JW2976: "the stupid ad pops up over
  90% of the page"; May 17 Bassnc: "App and website started crashing on iPad but works on iPhone?" [C62]

### Club management software (non-tournament)
- **angelflix** (Germany): site title "Die Software für deinen Angelverein" (translation: "the
  software for your angling club"); pricing page unreachable; GetApp snippet lists a €20 starting
  price and free trial [C106]. Not US.
- **R2 Sports Fishing Tournament/League Software**: snippet lists "$30 activation fee per tournament"
  plus per-player charges [C107]. Generic league software, not fishing-native.
- No US fishing-club membership/dues/points/communications product with a web admin was found.

### F. Guide and charter marketplaces

### FishingBooker — charter marketplace (customer app + captain app)
- Platforms: web / iOS / Android, two apps [C64, C65, C66]
- Pricing: captains pay commission that "Starts at 10%", "well below the 25–30% most platforms
  take"; "No upfront cost. No subscription."; optional higher rate for visibility; deposit or
  pay-in-full flows [C67]
- Stats: "3.4M+ people on the water"; captains in "100+ countries" [C67]
- Ratings: Charters app 4.9 (5.5K) [C64]; Captains app 4.9 (2.2K) [C65]; Play 4.8 (1.44K), 100,000+
  [C66]; last update Charters v1.57.2 "4d ago", Captains v2.76.1 "Oct 13", Play "Oct 14, 2026"
- Complaints [C64]: 08/09/2025 TypingReallyHard: "Do not use Fishing Booker. Book through the charter
  companies directly."; 12/27/2025 Steph Erin KL: "This company is not reputable."
- Praise [C64, C65]: 08/28/2023: "Randy worked hard to put us on fish."; 08/24/2025 Capt. Srb:
  "Absolutely a pleasure to do business with."
- Trustpilot: not retrievable (blocked).

### Guidesly — marketplace + "Guidesly Pro" back office (website builder, POS, CRM)
- Platforms: web, Guidesly Trips app, Guidesly Pro app [C68, C69, C70]
- Pricing: "No monthly or annual fees, just a 10% booking fee per transaction" (own website); 3%
  for phone/in-person via POS; 15% via the Guidesly marketplace [C71]
- Stats: "3500+ expert guides" [C70]
- Ratings: Trips 4.4 (20), v1.0.51 "Aug 30" [C68]; Pro 3.6 (27), v2.0.1 "Oct 1" [C69]
- Complaints [C69, C68]: Aug 31 Bunz87: "The calendar operation is horrendous."; Aug 19 Capt
  Jamesweeks: "This app was perfect at the start but the more they try and improve the worse it
  gets!!!"; Aug 12 CmdrDeadman: "It isn't just that no one showed for the trip"
- Praise [C68]: 12/14/2021 madisonbarboza: "Love booking trips through Guidesly! Super easy..."

### Captain Experiences — curated guide marketplace (web only)
- "Book your next trip with one of our 3000+ vetted guides"; "4.9 / 5 Average Rating"; no app, no
  published fees [C72]; launched March 2020 in Austin by Jonathan Newar and Attison Barnes, ~900 guides
  by Aug 2022 [C73]. Funding unknown.

### G. Gear inventory and maintenance

### SmartTacklebox — photo-tagged tackle box (dead)
- iOS; Pro $5.99 one-time; App 1.0 (2 ratings); last version 1.4 on **11/29/2016** [C77]. Free
  version limited to "2 sides of 1 tackle box and 20 lures" with ads.

### FishFriender (France) — logbook with a "digital fishing box" and setups linked to catches
- Web + free iOS/Android app; "manage your digital fishing box in order to keep track of the tackle
  you own"; scan/catalog/add items; combine into setups linked to catches; premium pricing not shown [C78]

### FishWise — AI fish/lure ID with a 346-lure catalog, personal tackle box and Amazon links
- iOS; free, no subscription; App 5.0 (1 rating); v2.10.0 "Jun 17"; "Fish Cooler" catch log,
  location privacy controls [C91]. Tiny.

### LureLab AI — tackle inventory with weekly subscription / lifetime purchase
- Search snippet only; US listing returned 404 on fetch [C105]. Unverified.

### ReelKeep: Fishing Reel Care — the only reel/rod maintenance tracker found
- iPhone only (also listed for macOS/visionOS but "Not verified for macOS"); seller TsuzuKit (Ryo
  Tsudukihashi), English/Japanese; v1.0 "Jun 26", v1.0.1 "Sep 20" (2026); no ratings yet; "Contains:
  Advertising" [C79]
- Pricing: Premium (Weekly) $0.99, Premium (Lifetime) $19.99; description says $20 one-time or
  $1.49/week, no free trial (prices conflict on page) [C79]
- Features: care by trip count or days; saltwater rinse reminders; presets (line change, overhaul,
  bearing oiling, drag check, guide check...); collection with photos and costs; three-stage
  reminders; free tier = 1 gear item, 3 care items [C79]
- Verdict: proves the concept is buildable and that nobody with distribution has done it. 6.3 MB
  solo-dev utility; no Android, no web, no catch log, no inventory valuation.

### H. Retail and commerce with content

### Omnia Fishing — tackle retailer with "shop by lake", reports, and a PRO map tier
- Platforms: web store + iOS/Android app [C74, C75, C76]
- Pricing: Omnia PRO "$59/YR($4.92/month)" [C76]; "Free 7-day trial" [C74]; Play IAP $14.99–$35.99 [C75]
- Business model: retail margin + PRO subscription; PRO gives "10% cash back rewards" and free
  shipping, i.e. the subscription is a loyalty program [C76]
- Core features: map of 100K+ waterbodies, "20,000+ fishing reports", "Navionics depth charts" and
  C-MAP vegetation/bottom data (PRO), weather (PRO), "tackle warehouse of more than 25,000 products"
  [C74]; press release puts PRO at "an extra $20 per year" at launch (search snippet) [C76]
- Ratings: App 4.6 (3.8K) [C74]; Play 4.2 (1.12K), 100,000+ [C75]; last update App v3.88.0 "Aug 8",
  Play "Aug 7, 2026"
- Owner / funding: Omnia Fishing, Inc. (Minnesota) [C74]; funding unknown (press pages 503)
- Praise [C74]: 11/21/2023 MNSean: "I've been using the Omni app for four years now and it continues
  to get better."; 06/07/2024 jjalzen1: "Omnia is far and away the best online fishing store around."
- Complaints: none on fetched page
- Gaps/threat: owns purchase history, the raw material for a gear inventory; no catch log; no export.

### I. Fly-fishing, ice and species niches (short)
- **SnapHatch** (Glory Outdoors): hatch log works offline, catch log with fly/presentation/flow;
  $5.99/mo, $34.99/yr; App 4.7 (35); v1.0.13 "Sep 16"; Apr 18 danengr1 (3 stars): "there is no
  function at all unless you give them a credit card" [C87]
- **FlyFinder** (Sarah Lewis): Pro Annual $39.99 / Monthly $6.99 (description says $59.99/$9.99);
  no ratings; v1.4.3 "October 7" [C88]
- **Fly Fishing Log** (Anolev): free, 5.0 (1), private map [C89]; **Fishbums**, **FlyGuysNLies**,
  **Buggin** — regional hatch apps, search snippets only [C105]
- **Ice Report** (Split Rock): community ice thickness; Premium Supporter $9.99/yr; App 3.2 (82);
  last version 2.7.1 **12/03/2024**; 01/24/2021: "you can't add an ice report when you get home
  unless you buy the premium."; 01/25/2021 (1 star): "the entire purpose of it is ruined by a $9.99
  a month subscription fee." [C86]
- **LakeMonster**, **HookedUp** — ice/lake apps, US listings returned 404; snippets only [C105]
- **Catfish Hunter** — catfish guide app, snippet only; **Whisker Seeker** is a tackle brand, not
  an app; **Reelcast** — nothing found [C114]

### J. Dead or abandoned (details in section 8)
Fishidy, Fishhound, FishingCrew/FishingScout, FishHunter (social layer), NOAA Fish Online iOS,
iCatch, SmartTacklebox, BASSTrakk, Navionics legacy HD apps.

---

## 3. Feature matrix

Cells: `✓` built-in, `$` paid tier only, `~` partial/weak, `✗` absent or not mentioned in the store
description/site, `?` unknown. Ads = "Contains ads" on Play or ad complaints. Price/yr = cheapest
annual paid tier in USD unless noted.

| Product | Catch log | Offline | Maps/depth | Forecast/tides | Regulations | Gear inventory | Gear maint. log | Tournament | Club/group admin | Guide booking | B2B tools | Web app | Data export | Ads | Price/yr |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Fishbrain | ✓ | ? | $ | $ | $ (30+ states) | ~ (gear reviews) | ✗ | ✗ | ~ | ✗ | ~ (ad sales) | ~ | ✗ | ✓ | $79.99 |
| Fishing Points | ✓ | ✓ | ✓ | ✓ | ~ (5 states) | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ | ~ (import only) | ✓ | $49.99 |
| FishAngler | ✓ | ? | $ | ✓/$ | ? | ~ | ✗ | ✗ | ~ (groups) | ✗ | ✗ | ✗ | ✗ | ✓ | $49.99 |
| ANGLR | ✓ | ? | ✓ | ~ | ✗ | ✓ | ✗ | ✗ | ✗ | ✗ | ✗ | ~ (beta) | ~ (waypoints to MFD) | ✗ | $39.99 (period n/s) |
| Fishbox | ~ | ✓ | ✓ | ✓ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | $27.99–35.99 (period n/s) |
| Fishsurfing | ✓ | ? | $ | $ | ✗ | ✗ | ✗ | ✗ | ~ | ✗ | ✗ | ? | ✗ | ? | $34.99 |
| Navionics Boating | ✗ | $ | $ | $ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ? | ✓ (GPX) | ✓ | $49.99 |
| onX Fish | ✗ | $ | ✓ | ✓ | ✓ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ~ (MN web launch) | ? | ✗ | $34.99 |
| TroutRoutes | ✗ | $ | ✓ | ~ (gauges) | $ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ | ? | ✗ | $39.99 |
| Fish Deeper | ✓ | ✓ | ✓ | ✓ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ~ | ? | ? | $24.99 / $59.99 (Premium+) |
| C-MAP / Lowrance | ✗ | $ | $ | ✓ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ? | ? | $14.99–49.99 |
| Pro Angler | ✗ | ? | ~ | ✓ | ✓ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ? | $29.99–59.99 (period n/s) |
| FishTrack | ✗ | ✓ | ✓ (SST) | ✓ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ ($79.99 bundle) | ? | ✗ | $95.99 |
| Buoyweather | ✗ | ? | ✗ | ✓ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ | ✗ | ✗ | $79.99–95.99 |
| FishWeather | ✗ | ? | ~ | ✓ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ? | ✗ | ✓ | $44.99–179.99 |
| Windy.app | ✗ | ? | ✗ | ✓ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ | ✗ | ? | $39.99–164.99 |
| Tides Near Me | ✗ | ? | ✗ | ✓ (tides) | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ | $14.99 |
| Tide Charts | ✗ | ✓ | ✗ | ✓ (tides) | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ | $1.99 one-time |
| Fish Rules | ~ | ✓ | ✗ | ✗ | ✓ (saltwater) | ✗ | ✗ | ✗ | ✗ | ✗ | ~ (Commercial app) | ✓ | ✗ | ✓ | $29.99 |
| FishVerify | $ | ? | ✗ | $ | ✓ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | $29.99 |
| TourneyX | ✓ (entries) | ? | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ | ~ (Club Tabs) | ✗ | ✓ | ✓ | ? | ✗ | per-angler fee |
| FishDonkey | ✓ (entries) | ✓ | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ | ✗ | ✗ | ✓ | ~ (view) | ? | ✓ | angler service fee |
| Fishing Chaos | ✓ | ? | ~ | ✗ | ✗ | ~ (virtual tackle box, snippet) | ✗ | ✓ | ✓ (club module) | ~ (guide tools) | ✓ | ✓ | ? | ? | unpublished |
| Weighfish | ✓ (entries) | ✓ | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ | ✓ (series, dues) | ✗ | ✓ | ✗ | ✓ (PDF/CSV) | ✗ | $69.99 / $284.99 + 6.5% |
| iAngler Tournament | ✓ | ? | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ | ✗ | ✗ | ~ | ? | ✗ | ✗ | free |
| FishingBooker | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ | ✓ (captain app) | ✓ | ✗ | ✗ | 10%+ commission |
| Guidesly | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ | ✓ (site, POS, CRM) | ✓ | ✗ | ✗ | 3/10/15% |
| Captain Experiences | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ | ? | ✓ | ✗ | ✗ | unpublished |
| Omnia Fishing | ✗ (reports) | ✗ | $ | $ | ✗ | ~ (purchase history) | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ (store) | ✗ | ✗ | $59 |
| SmartTacklebox (dead) | ✗ | ✓ | ✗ | ✗ | ✗ | ✓ (photo tags) | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ | $5.99 one-time |
| FishFriender | ✓ | ? | ~ | ✓ | ✗ | ✓ | ✗ | ✗ | ~ | ✗ | ✗ | ✓ | ? | ? | unknown |
| FishWise | ✓ | ? | ~ | ✓ | ✓ | ~ | ✗ | ✗ | ~ | ✗ | ✗ | ✗ | ✗ | ✗ | free |
| ReelKeep | ~ (trip count) | ✓ | ✗ | ✗ | ✗ | ✓ (collection) | ✓ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✓ | $19.99 lifetime |
| SnapHatch | ✓ | ✓ | ~ | ~ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | $34.99 |
| FlyFinder | $ | $ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | $39.99 |
| Ice Report | ✗ | ✗ | ~ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ? | $9.99 |
| MLF / BASSTrakk | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ✗ | ~ (official) | ✗ | ✗ | ✗ | ✓ | ✗ | ✓ | free |

**White space paragraph.** Columns that are `✗`/`~` for every product with meaningful distribution
(>100K installs): **Gear maintenance log** (only ReelKeep, zero ratings) [C79]; **Gear inventory**
(ANGLR ✓ but 50K+ installs and 2.9 on Play; others are catalogs or photo tags) [C13, C14, C77,
C91]; **Club/group admin** (Weighfish and Fishing Chaos only, both tournament-first; no web admin
for dues/points/comms at scale) [C61, C60]; **Data export** (Navionics GPX, Weighfish CSV; the three
10M-install logbooks advertise none) [C9, C61, C1, C20, C16]; **Web app for the logbook** (Fishing
Points yes, ANGLR beta, FishFriender; Fishbrain/FishAngler phone-first) [C20, C15, C78]. Why:
inventory and maintenance have no network effect and no ad inventory, so VC-funded social apps skip
them; export is withheld deliberately (lock-in; Navionics users already complain about losing
purchases on device change [C10]); club admin is a small-ticket B2B sale per club that consumer apps
cannot justify; web logbooks lose to "phone at the water" culture unless the job is review/planning
at home, which is exactly where gear and club admin live.

---

## 4. White space analysis

| Gap | Evidence across incumbents | Why it is open (judgement) |
|---|---|---|
| **Reel/rod maintenance log** (service intervals, line changes, drag, saltwater rinse, cost history) | Only ReelKeep: iPhone-only, Jun 2026, no ratings, ad-supported, 1 free item [C79]. No incumbent mentions it [C1, C13, C16, C20, C23, C39, C74]. | **Overlooked + no network effect.** A maintenance log is a private utility; there is nothing to share, so social/ads models ignore it. Retail (Omnia) could attach it to line/lube reorders but hasn't. Not hard to build. |
| **Gear inventory with cost, usage and value** | ANGLR "virtual tackle box" (50K+ Play, 2.9) [C13, C14]; SmartTacklebox dead since 2016 [C77]; FishFriender/FishWise are catalogs [C78, C91]; Omnia has purchase history but no "my gear" [C74]. | **Overlooked.** Low virality, no ad hook. Omnia is the natural owner (purchase data) and the main threat. Forum demand exists (BassResource thread "fishing logs" asks for tackle/inventory tracking; page 403, snippet only [C108]). |
| **Club administration** (members, dues, points, standings, meetings, comms, web admin) | Weighfish: series standings + membership fees, mobile-only [C61]; Fishing Chaos: "club module" unpriced, demo-gated [C59, C60]; TourneyX "Club Tabs" [C53]; angelflix is German [C106]. | **Unprofitable for consumer apps, small B2B tickets.** Needs a web admin and a per-club price. Fishing Chaos could ship it in a quarter; Weighfish would need a web client. |
| **Private, exportable logbook with real analytics on the web** | Fishing Points has web + private log but import-only [C20]; ANGLR private but "Data analysis is truly dismal" [C13]; Fishbrain/FishAngler phone-first, no export, spot-burning complaint [C2, C17]. | **Killed by network effects on the social side, lock-in on the data side.** Incumbents' moat is the catch map; a private/export-first product undercuts it, so they won't copy. Hard part is distribution, not build. |
| **Regulations for freshwater/multi-state** | Fishbrain "30+ US states" (Pro) [C1]; onX Fish (13 states) [C23]; Fish Rules saltwater [C30]; TroutRoutes [C29]. | **Not white space.** Crowded, and regs data is a maintenance burden. Avoid as a core. |
| **Offline-first** | Navionics, onX, Fishing Points, Fishbox, FishDonkey all claim offline [C9, C23, C20, C41, C57]. | **Not white space**, but it is table stakes for anything used on the water. |
| **Guide back office** | Guidesly Pro (site, POS, CRM, 10%) [C71]; FishingBooker captain app (10%+) [C67]. | **Served.** Both have scale and commission economics; 3.6-star Pro app shows execution pain [C69] but not a gap a solo founder should attack. |
| **Ad-free paid tier** | Paying users still see ads: FishWeather [C43], Tide Charts [C49], MLF [C62]; Fishbrain/FishAngler/Fishing Points/Navionics/Fish Rules all "Contains ads" on Play [C3, C18, C22, C11, C32]. | **Deliberate** (two revenue lines). A clean "no ads, ever" positioning is cheap differentiation. |
| **Data portability (GPX/CSV in and out)** | Navionics GPX both ways [C9]; Weighfish CSV [C61]; Fishing Points import only [C20]; rest none. | **Withheld for lock-in.** Cheap to build; strong trust signal given lost-data complaints [C80, C10, C17]. |

---

## 5. Pricing landscape

Ratings counts are the proxy for paying base (App Store ratings count, Play reviews count).

| Product | Tier | Price | Period | Source | Ratings (App / Play) |
|---|---|---|---|---|---|
| Fishbrain | Pro (monthly) | $14.99 (also $12.99 SKUs) | month | C1 | 76K / 67.6K |
| Fishbrain | Pro (quarter) | $41.99 | 3 months | C1 | |
| Fishbrain | Pro (annual) | $79.99 | year | C1 | |
| Fishing Points | Premium | $9.99 | month | C20 | 31K / 219K |
| Fishing Points | Yearly Premium / Advanced | $49.99 | year | C20 | |
| Fishing Points | Basic Premium | $29.99 | year (per name) | C20 | |
| FishAngler | VIP Monthly | $6.99 | month | C16 | 14K / 15.5K |
| FishAngler | VIP Yearly | $49.99 | year | C16 | |
| ANGLR | PRO | $39.99 | not shown | C13 | 635 / 399 |
| ANGLR | MEMBER | $2.99 / $29.99 | not shown | C13 | |
| Fishbox | Premium | $7.99–$35.99 (6 SKUs) | not shown | C41 | 39K / 59.4K |
| Fishsurfing | PRO | $3.99 / $34.99 | month / year | C50 | 5 / n/a |
| Navionics Boating | US & Canada | $49.99 | year | C9 | 2.4K / 48.7K |
| Navionics Boating | Mediterranean / C&W Europe | $59.99 | year | C9 | |
| Navionics Boating | Adriatic & Ionian | $69.99 | year | C9 | |
| onX Fish | Midwest | $34.99 | year | C23, C25 | 1.8K / n/a |
| TroutRoutes | Pro | $39.99 ("org. $58.99") | year | C27, C29 | 3.9K / 628 |
| TroutRoutes | Pro monthly | $9.99 (also $8.99 SKU) | month | C27 | |
| TroutRoutes | Single-State | $19.99 / $34.99 | year | C27 | |
| Fish Deeper | Premium | $6.99 / $24.99 | month / year | C39 | 654 / n/a |
| Fish Deeper | Premium+ (sonar protection) | $59.99 | year | C39 | |
| Fish Deeper (site, EUR) | Premium / Premium+ | €24.99 / €39.99; €5.99 mo | year | C40 | |
| C-MAP: Boating | Annual subscription | $14.99 / $29.99 | year | C81 | 2.4K / n/a |
| Lowrance app | Annual subscription | $14.99 / $29.99 / $39.99 / $49.99 | year | C80 | 2.9K / n/a |
| Pro Angler | Pro Fishing Advantage | $9.99–$59.99 (9 SKUs) | not shown | C47 | 6.2K / n/a |
| FishTrack | Premium | $14.99 / $95.99 | month / year | C37 | 6.3K / 362 |
| FishTrack | FishTrack.com & App | $14.99 / $79.99 | month / year | C37 | |
| Buoyweather | Premium | $14.99 / $95.99; "1 Year" $79.99 | month / year | C84 | 1.1K / n/a |
| FishWeather | Plus | $3.99 / $5.49 / $44.99 | month / month / year | C43 | 5.2K / 1.72K |
| FishWeather | Pro | $14.99 / $19.99 PAYG / $119.99 | month / month / year | C43 | |
| FishWeather | Gold | $14.99 / $21.99 / $179.99 | month / month / year | C43 | |
| Windy.app | WINDY PRO | $39.99–$164.99; $9.99 / $19.99 | year / month | C83 | 73K / n/a |
| Windy.app | Fishing Pro | $49.99 | year (inferred from price band) | C83 | |
| Tides Near Me | Premium | $1.99 / $14.99 | month / year | C48 | 163K / n/a |
| Tides Near Me | Go Mode | $2.99 / $19.99 | month / year | C48 | |
| Tide Charts | Remove Ads | $1.99 | one-time | C49 | 114K / n/a |
| Stormglass (API) | Small / Medium / Large | €19 / €49 / €129 | month | C85 | n/a |
| Fish Rules | ProStaff | $29.99 | year (per review) | C30, C31 | 198 / 1.98K |
| FishVerify | Premium | $5.99 / $29.99 | month / year | C34 | 2.2K / 668 |
| FishVerify | Scan Pack (5 scans) | $6.99 | one-time | C34 | |
| Weighfish | Director Pro | $9.99 / $69.99 | month / year | C61 | site-claimed 4.6 / 4.8 |
| Weighfish | Director Elite | $39.99 / $284.99 | month / year | C61 | |
| Weighfish | Angler service fee | 6.5% ($1 min) | per entry | C61 | |
| TourneyX | per-angler fee | not published | per series/event | C54 | 111 / 188 |
| FishDonkey | angler service fee | not published; hosting free | per entry | C57 | 86 / 153 |
| Fishing Chaos | hosts | not published | — | C59 | 86 / n/a |
| FishingBooker | captain commission | "Starts at 10%" | per completed trip | C67 | 5.5K+2.2K / 1.44K |
| Guidesly Pro | booking fee | 3% POS / 10% own site / 15% marketplace | per booking | C71 | 20+27 / n/a |
| Captain Experiences | — | not published | — | C72 | n/a |
| Omnia Fishing | PRO | $59 ("$4.92/month") | year | C76 | 3.8K / 1.12K |
| SnapHatch | Monthly / Yearly | $5.99 / $34.99 | month / year | C87 | 35 / n/a |
| FlyFinder | Pro | $6.99 / $39.99 | month / year | C88 | n/a |
| Ice Report | Premium Supporter | $9.99 | year | C86 | 82 / n/a |
| ReelKeep | Premium | $0.99 weekly / $19.99 lifetime | week / one-time | C79 | 0 |
| SmartTacklebox | Pro | $5.99 | one-time | C77 | 2 |
| angelflix (DE club software) | starting price | €20 (snippet) | unknown | C106 | n/a |
| R2 Sports (league software) | activation | $30 per tournament (snippet) | per tournament | C107 | n/a |

Read-across: ~$40–50/yr is the accepted price for a single-purpose angler app with 1–10M installs;
~$80–100/yr only where the data is proprietary (SST imagery, marine models). Nothing in gear or
club admin has established a price yet.

---

## 6. Review-complaint themes (≥2 verbatim quotes each)

1. **Paywall creep / subscription fatigue**
   - Fishbrain, 06/04/2023, Troutkaster9000: "to charge for something you guys were not charging for before is outrageous." [C2]
   - Fishbrain, 04/14/2024, So Supid: "now they removed all that u have to pay 70! dollars a year just to see catches" [C2]
   - Fishing Points, 04/04/2025, B3hr057: "pretends to be free in order to get your personal info." [C21]
   - TroutRoutes, Jul 31, Kevil, GB: "Yet when I go to use Trout Routes it is always requesting that I upgrade from the basic level." [C27]
   - FishWeather, 10/24/2023, Keegan I.: "it's been telling me to purchase a membership which I haven't had to do in the past 3+ years." [C43]
   - SnapHatch, Apr 18, danengr1: "there is no function at all unless you give them a credit card" [C87]
2. **Billing disputes and unresponsive support**
   - FishTrack, 10/17/2019, gayyoom: "Please don't pay fishtrack as a premium user by using Visa card." [C37]
   - FishTrack, 06/21/2022, Healthy Skeptic: "Suggest you AVOID" (title "Billing dispute") [C37]
   - Fish Rules, 09/06/2025, FloridasMan: "I paid 30 to use the app. The app did not give me premium, but apple charged me for it." [C31]
   - Fish Rules, 09/25/2025, Maikoll.social, title: "Don't bother contact them, they won't respond" [C30]
   - Fishbox, 09/06/2025, Nkeegs: "they need to be more clear about going about canceling your subscription" [C41]
   - Fishbrain, 07/31/2024, GingerGoo: "Customer service was dismissive and not helpful." [C2]
3. **Spot-burning and location privacy**
   - Fishbrain, 10/22/2022, _Lt_Dan_: "my local fishing spots started to hold less and less fish." [C2]
   - Fish Deeper, 02/23/2023, CGKleen: "Want to risk a private waterway's privacy?" [C39]
   - Fish Deeper, 12/27/2021, rallx, title: "Awesome app, questionable privacy policy" [C39]
4. **Inaccurate or "worthless" data and forecasts**
   - Fishbrain, 05/05/2021, Joseph.Dancer: "Unfortunately their catch data is near worthless" [C2]
   - Fishbrain, 01/05/2025, T0mmy Bahama: "the app shows yellow fin tuna caught within 100 meters of shore in "Brown's Cove"" [C2]
   - Fishing Points, 10/30/2023, Shoreline C: "these forecasts on here mean nothing and don't make any sense and will not help you catch fish whatsoever." [C21]
   - onX Fish, 12/19/2024, TheMNangler: "This makes lakes with unstable fish populations look way better than they actually are." [C24]
   - Navionics, 07/12/2023, Angler chick: "the sonar overlay depths are now WAY off, showing holes and depths that are definitely not correct" [C10]
   - Pro Angler, 01/12/2021, Hammerheadrandi: "I wouldn't put much faith in the what's biting now section." [C47]
5. **Coverage gaps (missing lakes, states, water bodies)**
   - Fishing Points, 08/12/2025, Markh142: "Literally none of the lakes or rivers I fish are visible in this app." [C21]
   - Fishbrain, 07/24/2021, Ryan Cassady: "the app does not allow you to create a new body of water." [C2]
   - Fishbrain, 08/04/2021, captken5807: "It forces one body of water that's nearby and is always misleading" [C2]
   - FishVerify, 06/16/2021, KingZope, title: "Great app but lacks locations" (PA not covered) [C34]
   - FishVerify, 12/07/2023, Gvlo949: "I can take a picture to see what species I caught but nothing in the regulations" [C34]
6. **Lost data, device lock-in, no export**
   - Navionics, 06/28/2024, user-app99: "if I switch device I will loose access to my already purchased charts." [C10]
   - Lowrance app, 07/12/2023, Heater911 (data lost after password reset): "Lowrance SHOULD be the gold standard in this industry." [C80]
   - Lowrance app, 10/29/2025, NN MN, title: "Not stable. Frequent shutdowns" (lost waypoints after reinstall) [C80]
   - FishAngler, 04/07/2019, Skeem's: "if you delete pictures from your phone it effects the pics in the app..." [C17]
7. **Ads even when paying**
   - FishWeather, 12/10/2020, Mannnygo: "My only complaint is that there is still ads even though I pay $3.99 a month." [C43]
   - Tide Charts, 03/20/2019, cprphd: "I started to receive a lot of annoying and unprofessional advertising on it." [C49]
   - Major League Fishing, 12/14/2021, JW2976: "the stupid ad pops up over 90% of the page" [C62]
8. **Crashes and instability**
   - ANGLR, 06/26/2021: "The downside is that this app crashes so often." [C13]
   - ANGLR, 01/11/2021, MLMRyan: "It crashes at least once per trip." [C13]
   - TroutRoutes, 07/27/2024, Diesel: "I only have a limited amount of time before it starts crashing." [C27]
   - Navionics, Mar 27 (2025), ErikExp: "it stops updating randomly after a few minutes which isn't always obvious" [C9]
   - C-MAP, 04/01/2023, MakingMovies: "this app has MANY long lived bugs" [C81]
9. **Abandonment and stale official apps**
   - iAngler Tournament, 04/01/2021, e104kinglife: "This app has tournaments on it but none of the tournaments will pull up..." [C45]
   - iAngler Tournament, 10/28/2024, Moog742: "Worth every penny! Junk" [C45]
   - BASSTrakk, 04/23/2023, Tyler 7107, title: "Bad app. Don't download." (last version 10/04/2023) [C63]
   - Navionics, 06/02/2018, Regular customer: "I was informed that there will be no update to allow this App to work" [C10]
   - FishTrack iOS last version 10/09/2024 while Play updated Jul 2026 [C37, C38]
10. **Phone-only, weak analytics, social noise**
    - onX Fish, 08/19/2025, jacobmnelson: "You need to make an iPad version." [C24]
    - MLF, May 17, Bassnc: "App and website started crashing on iPad but works on iPhone?" [C62]
    - ANGLR, 01/11/2021, MLMRyan: "Data analysis is truly dismal compared to other logging apps." [C13]
    - Ice Report, 01/24/2021, Mesa3578643257: "you can't add an ice report when you get home unless you buy the premium." [C86]
    - Fishbrain, 09/27/2020, SpeciesMultidex: "They NEED moderators on here to limit the number of fake catches" [C2]
    - Guidesly Pro, Aug 31, Bunz87: "The calendar operation is horrendous." [C69]

---

## 7. Incumbent threat assessment

| Likely gap | Could ship in a quarter | Business-model fit / will they? |
|---|---|---|
| Gear inventory (own tackle, cost, usage) | **Omnia** (has purchase history, 100K+ Play, web store) [C74, C75]; **Fishbrain** (gear reviews, 10M+) [C5]; **ANGLR** (already has it) [C13] | Omnia: strong fit (reorder, 10% credit loop) — the real threat. Fishbrain: weak fit, it monetises ads and the catch map; a private inventory adds no ad inventory. ANGLR: has it, but 50K+ installs and 2.9 stars — not a distribution threat. |
| Reel/rod maintenance log | Omnia (line/lube reorder hook); Deeper (hardware brand) [C39]; ReelKeep (exists, solo) [C79] | Low priority for all; no network effect, small ARPU. Most likely to stay open. Risk is a copycat solo app, not an incumbent. |
| Club admin (dues, points, standings, comms, web) | **Fishing Chaos** (club module exists, web, "40K+" tournaments) [C59, C60]; **Weighfish** (standings + dues, needs web) [C61]; TourneyX (web, "Club Tabs") [C53] | Fishing Chaos has the fit (B2B, demo-sold) and could deepen it fast. Weighfish is the feature-closest but mobile-only. Tournament-first products treat the club as a tournament container; a club-first product with meetings, dues, roles and a public page is a different wedge. |
| Private, exportable web logbook with analytics | **Fishing Points** (web app + private log, 10M+) [C20, C22]; **onX** (web client, $87.4M) [C26]; Fishbrain | Fishing Points could add export/analytics in weeks and has the installs — the main threat here. onX: fit is maps, not logs. Fishbrain: anti-fit (export erodes its moat). |
| Ad-free, no-dark-pattern pricing | Anyone | Nobody will drop ads voluntarily (two revenue lines). Cheap differentiation for us, not defensible alone. |
| Regulations (freshwater multi-state) | Fishbrain (30+ states), onX | Already served; data maintenance burden. Avoid. |
| Guide back office | Guidesly, FishingBooker | Served at 10–15% commission; not a solo-founder gap. |

---

## 8. Graveyard (since 2018, with cause where reported)

| Product | What happened | Date | Cause (as reported) | Source |
|---|---|---|---|---|
| Fishidy (Madison, WI) | Sold to FLIR Systems; "nearly 850,000 customers" at exit; fishidy.com now serves an empty Angular shell (title "Fishidy", no content, `Last-Modified: 30 May 2024`) | 2018 (sale); shell observed 2026-10-20 | Acquired, then folded; no public shutdown notice found | C93, C94 |
| FishingCrew / FishingScout, HuntingScout, Ryple | Acquired by Fishidy (2016 PR; BrightStar says FishingScout added "over 90,000 new members" in 2017) and absorbed; died with Fishidy | 2016–2018 | Consolidation | C92, C93 |
| Fishhound (fishing reports community) | fishhound.com 301-redirects to fishhound.scout.com, which does not resolve (DNS not found) | observed 2026-10-20 | Parent host (scout.com) gone; no notice found | C95 |
| FishHunter (Navico castable sonar app) | "removed the connected and social features to deliver a more secure experience"; last version 2.0 on 05/30/2023, 3.9 (766) | 2023-05-30 | Security/cost of social layer | C82 |
| NOAA Fish Online iOS eVTR app | "NOAA Fisheries will be discontinuing the NOAA Fish Online iOS eVTR app on January 31, 2025, after which all Fish Online eVTRs will need to be submitted through the Fish Online Web app" | notice 2024-06-25; sunset 2025-01-31 | "streamline reporting through one Fish Online platform" (native app replaced by web/PWA) | C96 |
| iCatch (England & Wales catch recording) | "retirement of the software due to lack of funding support" (headline; article 403) | unknown | Lack of funding | C97 |
| SmartTacklebox | Last version 1.4 on 11/29/2016; 1.0 stars (2) | 2016 | Abandoned | C77 |
| BASSTrakk (B.A.S.S.) | Last version 1.8.7 on 10/04/2023; 2.5 stars (19) | 2023 | Stale official utility | C63 |
| Navionics legacy HD apps | 2018 review: "I was informed that there will be no update to allow this App to work" (migration to the single Boating app) | 2018 | Consolidation after Garmin acquisition (2017-10-27) | C10, C12 |
| FishTrack iOS | No iOS release since 10/09/2024 while Android updated Jul 2026 | 2024– | Neglect (not confirmed dead) | C37, C38 |

Pattern: every dead or neutered product was a **social/community or data-sharing** layer (Fishidy,
Fishhound, FishingCrew, FishHunter social) or a **public-sector native app** replaced by web. None
was a paid private utility.

---

## 9. Top 10 takeaways for the lead

1. The catch-log/map/forecast category is saturated at $40–80/yr with 10M-install incumbents that
   are ad-supported and complained about for paywall creep [C1, C2, C20, C21]. Do not build another one.
2. Gear maintenance logging is the clearest `✗` across the whole matrix; the single existing app
   (ReelKeep) is three months old, iPhone-only and unrated [C79]. Buildable by one person; no
   incumbent has a business reason to copy it quickly.
3. Gear inventory is adjacent and proven-wanted (ANGLR built it; SmartTacklebox died trying) but
   Omnia is the one incumbent with both the data and the incentive to own it [C13, C77, C74].
4. Club administration (dues, points, standings, comms) has no US web product; Weighfish is the
   feature benchmark ($69.99–$284.99/yr director tiers + 6.5%) and Fishing Chaos the threat [C61, C60].
5. Tournament platforms monetise per entry, not per seat; a club product can price per club per year
   without colliding with them, and can hand off CPR tournaments to TourneyX/FishDonkey [C54, C57].
6. "Your data is yours" (export, no ads, private by default) is a positioning gap that every big
   incumbent has structural reasons to avoid [C9, C10, C80, C3].
7. Web-first is defensible for review/planning/admin jobs (gear, club, analytics); phone-first wins
   on the water. The NOAA sunset shows a web/PWA can replace a native app for a reporting job [C96].
8. Expect 3–4 star Play ratings on even well-funded products (Navionics 2.8, ANGLR 2.9, TroutRoutes
   3.4, Fish Rules 3.2) [C11, C14, C28, C32]; support responsiveness is a differentiator users notice.
9. Marine weather and regs are data-maintenance businesses with API suppliers (Stormglass €19–129/mo)
   [C85]; treat them as features bought in, never as the product.
10. Unverified this pass (needs search restored): Reddit/Trustpilot sentiment for Fishbrain and
    FishingBooker, ANGLR's current ownership, Fishing Chaos and FishDonkey fee amounts, Captain
    Experiences fees, Omnia and Fishing Chaos funding, LureLab/LakeMonster/HookedUp listings.

---

## 10. Sources

| ID | Claim / number | Value | Publisher | URL | Published | Accessed | Used in |
|----|----------------|-------|-----------|-----|-----------|----------|---------|
| C1 | Fishbrain App Store: rating, count, IAP prices, version, description features | 4.7 (76K); Pro $12.99/$14.99 mo, $41.99 qtr, $79.99 yr; v9.65.0 "1d ago"; depth charts Garmin Navionics & C-Map; regs 30+ states | Apple App Store | https://apps.apple.com/us/app/id477967747 | 2026-10 | 2026-10-20 | card, matrix, pricing |
| C2 | Fishbrain App Store reviews (quotes with dates) | see §2, §6 | Apple App Store | https://apps.apple.com/us/app/id477967747?see-all=reviews | 2020–2025 | 2026-10-20 | complaints |
| C3 | Fishbrain Google Play: installs, rating, reviews, updated, ads, IAP range | 10,000,000+; 4.5 (67.6K); Oct 6, 2026; Contains ads; $1.99–$199.99 | Google Play | https://play.google.com/store/apps/details?id=com.fishbrain.app | 2026-10-06 | 2026-10-20 | card, matrix |
| C4 | Fishbrain Pro page: trial and "App only" features | "Try Fishbrain Pro 3 days for free"; HD depth maps, bait recs, private waypoints "App only" | Fishbrain | https://fishbrain.com/premium | n/d | 2026-10-20 | card |
| C5 | Fishbrain homepage claims | "Join 20 million anglers"; 20M catches; 14M catch locations; 500k gear reviews; Map/Discover nav; Advertise page | Fishbrain | https://fishbrain.com/ | n/d | 2026-10-20 | card, summary |
| C6 | Fishbrain Series B | $13.5M led by B Capital; 5M anglers; freemium | tech.eu | https://tech.eu/brief/fishbrain-funding/ | 2018-03-07 | 2026-10-20 | card |
| C7 | Fishbrain 2014 round | $2.4M, Northzone + Active Venture Partners | ArcticStartup | https://arcticstartup.com/?p=50832 | 2014-07-10 | 2026-10-20 | card |
| C8 | Fishbrain total funding (search-result snippet; page not fetched) | $74.26M over 13 rounds; Series D $6M 2023-08-07 | CB Insights (via search snippet) | https://www.cbinsights.com/company/fishbrain/financials | 2023 | 2026-10-20 | card |
| C9 | Navionics Boating App Store: rating, IAP, version, description | 2.9 (2.4K); US & Canada $49.99/yr etc.; v24.4 Sep 28; offline, GPX import/export, SonarChart, Plotter Sync; review quote Mar 27 | Apple App Store | https://apps.apple.com/us/app/id744920098 | 2026 | 2026-10-20 | card, matrix, pricing |
| C10 | Navionics App Store reviews (quotes) | see §2, §6 | Apple App Store | https://apps.apple.com/us/app/id744920098?see-all=reviews | 2018–2025 | 2026-10-20 | complaints |
| C11 | Navionics Google Play | 5,000,000+; 2.8 (48.7K); Aug 19, 2026; Contains ads; $49.99–$149.99 | Google Play | https://play.google.com/store/apps/details?id=it.navionics.singleAppMarineLakesHD | 2026-08-19 | 2026-10-20 | card |
| C12 | Garmin acquired Navionics | 2017-10-27 | Wikipedia (secondary) | https://en.wikipedia.org/wiki/Navionics | n/d | 2026-10-20 | card, graveyard |
| C13 | ANGLR App Store: rating, IAP, version, description, reviews | 4.2 (635); PRO $39.99; MEMBER $2.99/$29.99; v2.1.597 Sep 5; virtual tackle box; quotes | Apple App Store | https://apps.apple.com/us/app/id1142347232 | 2026 | 2026-10-20 | card, matrix |
| C14 | ANGLR Google Play | 50,000+; 2.9 (399); Sep 5, 2026; $1.99–$29.99 | Google Play | https://play.google.com/store/apps/details?id=com.anglrtech.anglrapp | 2026-09-05 | 2026-10-20 | card |
| C15 | ANGLR site: beta web app, stats | "Welcome to our Beta Web App"; 500K+ trips; 2.5M waypoints | ANGLR | https://anglr.com/ | n/d | 2026-10-20 | card |
| C16 | FishAngler App Store | 4.8 (14K); VIP $6.99 mo / $49.99 yr; v5.3.0 "5d ago"; description features | Apple App Store | https://apps.apple.com/us/app/id1073941118 | 2026 | 2026-10-20 | card, pricing |
| C17 | FishAngler App Store reviews | see §2, §6 | Apple App Store | https://apps.apple.com/us/app/id1073941118?see-all=reviews | 2019–2025 | 2026-10-20 | complaints |
| C18 | FishAngler Google Play | 1,000,000+; 4.3 (15.5K); Oct 14, 2026; Contains ads; $6.99–$49.99 | Google Play | https://play.google.com/store/apps/details?id=com.fishangler.fishangler | 2026-10-14 | 2026-10-20 | card |
| C19 | FishAngler site | "Trusted by millions of anglers worldwide"; "Available on IOS & Android" | FishAngler | https://www.fishangler.com/ | 2026 | 2026-10-20 | card |
| C20 | Fishing Points App Store | 4.7 (31K); Premium $9.99, Yearly $49.99, Basic $29.99, Advanced $49.99; v4.2.7 Oct 6; NOAA offline, GPX/KMZ import, regs FL/TX/GA/NC/LA, web app | Apple App Store | https://apps.apple.com/us/app/id1203032512 | 2026 | 2026-10-20 | card, matrix, pricing |
| C21 | Fishing Points App Store reviews | see §2, §6 | Apple App Store | https://apps.apple.com/us/app/id1203032512?see-all=reviews | 2018–2025 | 2026-10-20 | complaints |
| C22 | Fishing Points Google Play | 10,000,000+; 4.4 (219K); Oct 14, 2026; Contains ads; $0.99–$49.99 | Google Play | https://play.google.com/store/apps/details?id=com.gregacucnik.fishingpoints | 2026-10-14 | 2026-10-20 | card |
| C23 | onX Fish App Store | 4.6 (1.8K); "onX Fish Midwest ($34.99/year)"; v26.41.0 "1d ago"; 482 MB; 13 states; offline; regs | Apple App Store | https://apps.apple.com/us/app/id6466307868 | 2026 | 2026-10-20 | card, matrix |
| C24 | onX Fish App Store reviews | see §2, §6 | Apple App Store | https://apps.apple.com/us/app/id6466307868?see-all=reviews | 2024–2026 | 2026-10-20 | complaints |
| C25 | onX Fish product page | $34.99/yr; 7-day trial; 13 states listed; iOS and Android | onX | https://www.onxmaps.com/fish | n/d | 2026-10-20 | card |
| C26 | onX acquires TroutRoutes; web launch; headcount; Series B headline | 2024-03-20; "launch on iOS and on the web exclusively in Minnesota"; "nearly 400 employees"; sidebar "onX Secures $87.4M in Series B Funding" | onX blog | https://www.onxmaps.com/blog/onx-acquires-troutroutes | 2024-03-20 | 2026-10-20 | card, summary |
| C27 | TroutRoutes App Store | 4.5 (3.9K); Pro $39.99/$58.99 yr, $9.99/$8.99 mo; Single-State $19.99/$34.99; v5.4.8 "7h ago"; reviews; description | Apple App Store | https://apps.apple.com/us/app/id1423989574 | 2026 | 2026-10-20 | card, pricing |
| C28 | TroutRoutes Google Play | 100,000+; 3.4 (628); Oct 19, 2026; $9.99–$39.99 | Google Play | https://play.google.com/store/apps/details?id=com.troutinsights.troutroutes | 2026-10-19 | 2026-10-20 | card |
| C29 | TroutRoutes site | PRO $39.99/yr "(org. $58.99)" or $9.99/mo; 7-day trial; Desktop Maps maps.troutinsights.com; 50,000 streams, 48 states | TroutRoutes | https://troutroutes.com/ | n/d | 2026-10-20 | card |
| C30 | Fish Rules App Store | 3.9 (198); ProStaff $29.99; v6.86.34 "5d ago"; review 09/25/2025 title | Apple App Store | https://apps.apple.com/us/app/id597875361 | 2026 | 2026-10-20 | card, pricing |
| C31 | Fish Rules App Store reviews | see §2, §6 | Apple App Store | https://apps.apple.com/us/app/id597875361?see-all=reviews | 2021–2025 | 2026-10-20 | complaints |
| C32 | Fish Rules Google Play | 500,000+; 3.2 (1.98K); Oct 6, 2026; Contains ads; $0.99–$29.99 | Google Play | https://play.google.com/store/apps/details?id=com.fishrulesapp.fishrules2013 | 2026-10-06 | 2026-10-20 | card |
| C33 | Fish Rules ProStaff launch, web app | "includes the ability to send a photo to Fish Rules"; web app at app.fishrulesapp.com | Fish Rules | https://app.fishrulesapp.com/news/version-6-now-with-prostaff-subscription | 2021-02-14 | 2026-10-20 | card |
| C34 | FishVerify App Store | 4.6 (2.2K); Monthly $5.99, Yearly $29.99, Scan Pack $6.99 (5 scans); v2.2.4 Apr 13; catch log premium; reviews | Apple App Store | https://apps.apple.com/us/app/id1121514756 | 2026 | 2026-10-20 | card, pricing |
| C35 | FishVerify Google Play | 100,000+; 4.3 (668); May 13, 2026; $0.99–$47.99 | Google Play | https://play.google.com/store/apps/details?id=com.fishverify | 2026-05-13 | 2026-10-20 | card |
| C36 | FishVerify subscriber claim | "surpassed 150,000 subscribers"; east coast, Gulf, CA, Australia | Hunting Life (press) | https://huntinglife.com/?p=325244 | 2022-03-11 | 2026-10-20 | card |
| C37 | FishTrack App Store | 4.6 (6.3K); Premium $14.99 mo / $95.99 yr; FishTrack.com & App $14.99 / $79.99; v3.0.1 10/09/2024; reviews; description | Apple App Store | https://apps.apple.com/us/app/id952022603 | 2024-10-09 | 2026-10-20 | card, pricing, graveyard |
| C38 | FishTrack Google Play | 100,000+; 3.3 (362); Jul 20, 2026; $14.99–$95.88 | Google Play | https://play.google.com/store/apps/details?id=com.fishtrack.android | 2026-07-20 | 2026-10-20 | card |
| C39 | Fish Deeper App Store | 4.5 (654); IAP $6.99 mo, $24.99 yr, Premium+ $59.99 yr, $45.99 "12-Month Premium Membership"; v2.7.0 Sep 30; reviews; description | Apple App Store | https://apps.apple.com/us/app/id1483380086 | 2026 | 2026-10-20 | card, pricing |
| C40 | Fish Deeper product page (EUR) | Premium €24.99/yr, €5.99/mo, €0.99 first month; Premium+ €39.99/yr, one replacement/yr, 20% off; web app badge | Deeper | https://deepersonar.com/pages/fish-deeper | n/d | 2026-10-20 | card |
| C41 | Fishbox App Store | 4.6 (39K); Premium $7.99–$35.99; v6.36.0 Oct 12; offline tiles; 50,000+ lakes; reviews | Apple App Store | https://apps.apple.com/us/app/id542238652 | 2026 | 2026-10-20 | card, pricing |
| C42 | Fishbox Google Play | 1,000,000+; 4.6 (59.4K); Sep 10, 2026; $5.99–$79.99; no ads flag | Google Play | https://play.google.com/store/apps/details?id=com.memsgroupinc.fishbox | 2026-09-10 | 2026-10-20 | card |
| C43 | FishWeather App Store | 4.7 (5.2K); Plus $3.99/$5.49/$44.99; Pro $14.99/$19.99/$119.99; Gold $14.99/$21.99/$179.99; v7.14 Oct 13; reviews | Apple App Store | https://apps.apple.com/us/app/id555644333 | 2026 | 2026-10-20 | card, pricing, complaints |
| C44 | FishWeather Google Play | 100,000+; 4.7 (1.72K); Sep 28, 2026; Contains ads; $5.49–$179.99 | Google Play | https://play.google.com/store/apps/details?id=com.windalert.android.fishweather | 2026-09-28 | 2026-10-20 | card |
| C45 | iAngler Tournament App Store | 2.8 (13); free; v12.07 Jun 18; reviews | Apple App Store | https://apps.apple.com/us/app/id872669180 | 2026 | 2026-10-20 | card, complaints |
| C46 | iAngler by Angler Action App Store | 3.0 (2); v5.1.2 Jul 15; review 04/30/2023 | Apple App Store | https://apps.apple.com/us/app/id526477620 | 2026 | 2026-10-20 | card |
| C47 | Pro Angler App Store | 4.6 (6.2K); IAP $9.99–$59.99; v9.9.10 Jun 8; 110,000+ hot spots; regs; reviews | Apple App Store | https://apps.apple.com/us/app/id572778910 | 2026 | 2026-10-20 | card, pricing |
| C48 | Tides Near Me App Store | 4.8 (163K); Premium $1.99/$14.99; Go Mode $2.99/$19.99; v4.0.0 Oct 7 | Apple App Store | https://apps.apple.com/us/app/id585223877 | 2026 | 2026-10-20 | card, pricing |
| C49 | Tide Charts App Store | 4.8 (114K); Remove Ads $1.99; v3.2.1 "6d ago"; reviews | Apple App Store | https://apps.apple.com/us/app/id957143504 | 2026 | 2026-10-20 | card, complaints |
| C50 | Fishsurfing App Store (+ search snippet for 163K users 2020) | 3.6 (5); PRO $34.99 yr / $3.99 mo; v2.122 "6d ago" | Apple App Store | https://apps.apple.com/us/app/id1235154377 | 2026 | 2026-10-20 | card |
| C51 | TourneyX PRO App Store | 4.7 (111); free; v2.0.23 Aug 31; praise quotes | Apple App Store | https://apps.apple.com/us/app/id1478882171 | 2026 | 2026-10-20 | card |
| C52 | TourneyX Google Play | 10,000+; 4.6 (188); Aug 27, 2026 | Google Play | https://play.google.com/store/apps/details?id=com.tourneyx.pro | 2026-08-27 | 2026-10-20 | card |
| C53 | TourneyX site stats | 115.9k active anglers; 144 active tourneys; 2276.7k fish; "Club Tabs" | TourneyX | https://tourneyx.com/ | n/d | 2026-10-20 | card |
| C54 | TourneyX fees as described by a club | per-angler fee "included in your tournament registration"; "deducted from the sign up fee"; paid judging | Carolina Kayak Anglers | https://www.carolinakayakanglers.com/?p=2861 | 2018-02-01 | 2026-10-20 | card, pricing |
| C55 | FishDonkey App Store | 4.0 (86); free; v1.13.3 Sep 15; praise quotes | Apple App Store | https://apps.apple.com/us/app/id1170550251 | 2026 | 2026-10-20 | card |
| C56 | FishDonkey Google Play | 50,000+; 3.9 (153); Apr 20, 2026; Contains ads | Google Play | https://play.google.com/store/apps/details?id=com.fishdonkey.android | 2026-04-20 | 2026-10-20 | card |
| C57 | FishDonkey site | "FREE to host"; "Fishermen pay a service fee"; 171,000 anglers; 18,000 tournaments; 1.8M photos; 276,000 videos; web view tourney.fishdonkey.com; Digital Livewell offline | FishDonkey | https://www.fishdonkey.com/ | "As of 10/11/2025" | 2026-10-20 | card, pricing |
| C58 | Fishing Chaos App Store | 3.9 (86); v3.0.30 "1d ago"; praise quotes; (search snippet: catch log, virtual tackle box) | Apple App Store | https://apps.apple.com/us/app/id1494960277 | 2026 | 2026-10-20 | card, matrix |
| C59 | Fishing Chaos site | "40K+ Tournaments"; "1,000,000+ Fish Submitted"; app.fishingchaos.com; club centralisation; Request a Demo | Fishing Chaos | https://www.fishingchaos.com/ | n/d | 2026-10-20 | card |
| C60 | Fishing Chaos club module and guide tools | "club module allows clubs to manage member plans, registration, tournaments, series and more"; guide "schedule management and online payments" | Lew's / Rather Outdoors press release | https://www.lews.com/media/news/2023-press-releases/rather-outdoors-partners-with-fishing-chaos-digital-platform-online-tournament-series-in-2023 | 2023-04-20 | 2026-10-20 | card, white space |
| C61 | Weighfish pricing, features, stats | 6.5% ($1 min); Director Free/Pro $9.99 mo or $69.99 yr/Elite $39.99 mo or $284.99 yr; standings, points methods, membership fees; PDF/CSV; 300+ series, 1,300+ tournaments, 24,000+ entries (2025); iOS/Android; Works Offline | Weighfish | https://weighfish.com/ | 2025 | 2026-10-20 | card, matrix, pricing |
| C62 | Major League Fishing App Store | 3.7 (6); v2.2.1 May 14; reviews | Apple App Store | https://apps.apple.com/us/app/id1338817609 | 2026 | 2026-10-20 | card, complaints |
| C63 | BASSTrakk App Store | 2.5 (19); v1.8.7 10/04/2023; review | Apple App Store | https://apps.apple.com/us/app/id972643854 | 2023-10-04 | 2026-10-20 | card, graveyard |
| C64 | FishingBooker Charters & Trips App Store | 4.9 (5.5K); v1.57.2 "4d ago"; reviews | Apple App Store | https://apps.apple.com/us/app/id1511475315 | 2026 | 2026-10-20 | card, complaints |
| C65 | FishingBooker for Captains App Store | 4.9 (2.2K); v2.76.1 Oct 13; reviews | Apple App Store | https://apps.apple.com/us/app/id1282278504 | 2026 | 2026-10-20 | card |
| C66 | FishingBooker Google Play (customer) | 100,000+; 4.8 (1.44K); Oct 14, 2026 | Google Play | https://play.google.com/store/apps/details?id=com.fishingbooker.customer.android | 2026-10-14 | 2026-10-20 | card |
| C67 | FishingBooker captain economics | commission "Starts at 10%"; "well below the 25–30% most platforms take"; "No upfront cost. No subscription."; 3.4M+ people; 100+ countries | FishingBooker | https://updates.fishingbooker.com/join | n/d | 2026-10-20 | card, pricing |
| C68 | Guidesly Trips App Store | 4.4 (20); v1.0.51 Aug 30; reviews | Apple App Store | https://apps.apple.com/us/app/id1529299568 | 2026 | 2026-10-20 | card |
| C69 | Guidesly Pro App Store | 3.6 (27); v2.0.1 Oct 1; reviews | Apple App Store | https://apps.apple.com/us/app/id1514216448 | 2026 | 2026-10-20 | card, complaints |
| C70 | Guidesly site | "3500+ expert guides" | Guidesly | https://www.guidesly.com/ | n/d | 2026-10-20 | card |
| C71 | Guidesly Pro pricing | 3% POS; 10% own website; 15% marketplace; "No monthly or annual fees" | Guidesly Pro | https://www.guideslypro.com/pricing | n/d | 2026-10-20 | card, pricing |
| C72 | Captain Experiences site | "3000+ vetted guides"; "4.9 / 5 Average Rating"; no app; no fees shown | Captain Experiences | https://captainexperiences.com/ | n/d | 2026-10-20 | card |
| C73 | Captain Experiences history | launched March 2020; ~900 guides; founders Newar & Barnes | InsideHook (press) | https://www.insidehook.com/travel-texas/captain-experiences-fishing-trips/amp | 2022-08-09 | 2026-10-20 | card |
| C74 | Omnia App Store | 4.6 (3.8K); v3.88.0 Aug 8; 100K waterbodies; 20,000+ reports; Navionics depth (PRO); 25,000 products; 10% credit; 7-day trial; reviews | Apple App Store | https://apps.apple.com/us/app/id1596505528 | 2026 | 2026-10-20 | card, matrix |
| C75 | Omnia Google Play | 100,000+; 4.2 (1.12K); Aug 7, 2026; $14.99–$35.99 | Google Play | https://play.google.com/store/apps/details?id=com.omniafishing.app | 2026-08-07 | 2026-10-20 | card |
| C76 | Omnia PRO price | "$59/YR($4.92/month)"; 10% cash back; free shipping; Navionics HD + C-MAP contours; (search snippet: launch PR "extra $20 per year") | Omnia Fishing | https://www.omniafishing.com/pro | n/d | 2026-10-20 | card, pricing |
| C77 | SmartTacklebox App Store | 1.0 (2); Pro $5.99; v1.4 11/29/2016; free limits | Apple App Store | https://apps.apple.com/us/app/id1021114662 | 2016-11-29 | 2026-10-20 | card, graveyard |
| C78 | FishFriender tackle feature | "manage your digital fishing box"; setups linked to catches; free app; web | FishFriender | https://www.fishfriender.com/fishing-tackle-on-fishfriender | 2026 | 2026-10-20 | card |
| C79 | ReelKeep App Store | no ratings; Premium weekly $0.99, lifetime $19.99 (desc. $20 / $1.49 wk); v1.0 Jun 26, v1.0.1 Sep 20; iPhone only; ads; features | Apple App Store | https://apps.apple.com/us/app/id6784576527 | 2026 | 2026-10-20 | card, white space |
| C80 | Lowrance app App Store | 4.6 (2.9K); annual $14.99–$49.99; v4.6.1 Jun 17; reviews (lost data) | Apple App Store | https://apps.apple.com/us/app/id1463931486 | 2026 | 2026-10-20 | card, complaints |
| C81 | C-MAP: Boating App Store | 4.5 (2.4K); annual $14.99/$29.99; regions $18.99–$39.99; v4.6.1 Jun 17; reviews | Apple App Store | https://apps.apple.com/us/app/id967289980 | 2026 | 2026-10-20 | card, complaints |
| C82 | FishHunter App Store | 3.9 (766); v2.0 05/30/2023; "removed the connected and social features" | Apple App Store | https://apps.apple.com/us/app/id742636886 | 2023-05-30 | 2026-10-20 | graveyard |
| C83 | Windy.app App Store | 4.7 (73K); PRO $39.99–$164.99; 1-month $9.99/$19.99; Fishing Pro $49.99; v15.8.5 | Apple App Store | https://apps.apple.com/us/app/id997079492 | 2026 | 2026-10-20 | card, pricing |
| C84 | Buoyweather App Store | 4.7 (1.1K); Premium $14.99 mo / $95.99 yr; 1 Year $79.99; v5.11.0; review 10/10/2022 | Apple App Store | https://apps.apple.com/us/app/id686664992 | 2026 | 2026-10-20 | card, pricing |
| C85 | Stormglass API pricing | Free €0; Small €19; Medium €49; Large €129 per month; 10% off annual | Stormglass | https://stormglass.io/pricing | n/d | 2026-10-20 | card, takeaways |
| C86 | Ice Report App Store | 3.2 (82); Premium Supporter $9.99 (per year per developer reply); v2.7.1 12/03/2024; reviews | Apple App Store | https://apps.apple.com/us/app/id1084838757 | 2024-12-03 | 2026-10-20 | card, complaints |
| C87 | SnapHatch App Store | 4.7 (35); Monthly $5.99; Yearly $34.99; v1.0.13 Sep 16; review Apr 18 | Apple App Store | https://apps.apple.com/us/app/id6504807770 | 2026 | 2026-10-20 | card, pricing |
| C88 | FlyFinder App Store | no ratings; Pro Annual $39.99 / Monthly $6.99 (desc. $59.99/$9.99); v1.4.3 October 7 | Apple App Store | https://apps.apple.com/us/app/id6757250849 | 2026 | 2026-10-20 | card, pricing |
| C89 | Fly Fishing Log App Store | 5.0 (1 rating); free | Apple App Store | https://apps.apple.com/us/app/id6784285478 | 2026 | 2026-10-20 | card |
| C90 | FishTracker: Your Fishing Log App Store | 4.5 (6); free; v18.0.0 09/30/2025; no export in description | Apple App Store | https://apps.apple.com/us/app/id6475622431 | 2025-09-30 | 2026-10-20 | card |
| C91 | FishWise App Store | 5.0 (1); free; v2.10.0 Jun 17; 346-lure catalog, tackle box, Amazon links | Apple App Store | https://apps.apple.com/us/app/id6760475234 | 2026 | 2026-10-20 | card |
| C92 | Fishidy acquires FishingCrew, HuntingScout, Ryple | premium 7-day forecasts | PR Newswire | https://www.prnewswire.com/news-releases/fishidy-announces-major-acquisitions-to-further-deliver-more-value-to-everyday-anglers-300289089.html | 2016-06-23 | 2026-10-20 | graveyard |
| C93 | Fishidy investor page | "nearly 850,000 customers"; FishingScout "over 90,000 new members" (2017); "Acquired in 2018 by FLIR Systems"; Portfolio Exit | BrightStar Wisconsin | https://brightstarwi.org/fishidy-inc/ | n/d | 2026-10-20 | graveyard, summary |
| C94 | fishidy.com current state (direct curl) | HTML shell with title "Fishidy" and `<app-root>` only; `Last-Modified: Thu, 30 May 2024`; no rendered content | Fishidy (observed) | https://www.fishidy.com/ | 2024-05-30 (Last-Modified) | 2026-10-20 | graveyard |
| C95 | fishhound.com current state | 301 to http://fishhound.scout.com/ ; host does not resolve (ENOTFOUND) | Fishhound (observed) | https://www.fishhound.com/ | n/d | 2026-10-20 | graveyard |
| C96 | NOAA Fish Online iOS app sunset | discontinued 2025-01-31; "streamline reporting through one Fish Online platform"; replaced by web app | NOAA/GARFO notice via CT DEEP | https://portal.ct.gov/-/media/deep/fishing/noticesfishermen/n24-27_2024_06-27-fish-online-ios-evtr-reporting-app-sunsetting.pdf | 2024-06-25 | 2026-10-20 | graveyard |
| C97 | iCatch retirement (headline via search snippet; page 403) | "retirement of the software due to lack of funding support" | The Fishing Daily (press) | https://thefishingdaily.com/latest-news/icatch-app-creator-announces-retirement-of-catch-recording-software/ | unknown | 2026-10-20 | graveyard |
| C98 | Reddit / Trustpilot sentiment | not collected: domains blocked; WebSearch budget exhausted after 45 searches | — | — | — | 2026-10-20 | limits |
| C105 | LureLab AI, LakeMonster, HookedUp, Fishbums, FlyGuysNLies, Buggin (search snippets only; US listings 404 or not fetched) | LureLab "weekly subscription or a one-time lifetime purchase"; LakeMonster paid tier "predictive ice safety mapping"; HookedUp premium overlays + offline lakes | Apple App Store (via search snippets) | https://apps.apple.com/us/app/-/id6757588416 ; https://apps.apple.com/us/app/lakemonster-fishing-ai/id1420223013 ; https://apps.apple.com/bf/app/fishing-app-hookedup/id1624354550 | n/d | 2026-10-20 | niche cards |
| C106 | angelflix (German club software) | site title "Die Software für deinen Angelverein"; GetApp snippet: starting price €20, free trial | angelflix / GetApp (snippet) | https://angelflix.de/ ; https://www.getapp.co.uk/software/2074743/angelflix | n/d | 2026-10-20 | club cards |
| C107 | R2 Sports fishing tournament software (search snippet) | "$30 activation fee per tournament" plus per-player charges | R2 Sports (snippet) | https://www.r2sports.com/cart/files/84/Fishing-Tournament-Software.asp | n/d | 2026-10-20 | club cards |
| C108 | BassResource forum thread on fishing logs / tackle tracking (page 403; search snippet says members want tackle/inventory tracking and use spreadsheets) | demand signal only | BassResource (snippet) | https://www.bassresource.com/bass-fishing-forums/topic/151461-fishing-logs/ | n/d | 2026-10-20 | white space |
| C111 | Fish Rules Commercial app (search result) | free; South Atlantic and Gulf councils | Apple App Store | https://apps.apple.com/us/app/-/id1534481224 | n/d | 2026-10-20 | card |
| C114 | Catfish Hunter (snippet), Whisker Seeker (tackle brand), Reelcast (no results) | — | AppFollow snippet; whiskerseeker.com | https://apps.appfollow.io/ios/catfish-hunter/590283641?country=us ; https://whiskerseeker.com/ | n/d | 2026-10-20 | niche cards |

Estimates used in the body: Fishing Points installs "10–20M" (Play band 10M+ [C22] + iOS unknown);
FishAngler "1–3M" (Play 1M+ [C18]); Fishbox "1–3M" (Play 1M+ [C42]); Navionics "5–10M" (Play 5M+
[C11]). Ratings-count-to-user conversions were not attempted because Play install bands are available.
