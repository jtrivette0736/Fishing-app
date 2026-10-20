# Hobby immersion: how anglers behave, and what they complain about

Research file for the Fishing-app discovery team. Agent: Hobby Immersion. Access date for every
row: 2026-10-20 (UTC). Source IDs are prefixed `I` (section 10). Quotes are verbatim inside
quotation marks; where a fetch tool truncated a sentence the cut is shown with `…`. Anything not
in quotation marks is my paraphrase.

## 0. Method and limits (read first)

- **What worked.** Direct fetch of forum.charlestonfishing.com (Discourse, incl. its `search.json`
  endpoint), stripersonline.com (forum indexes + threads), flyanglersonline.com (Discourse),
  sdfish.org, southfloridasharkclub.com, northwestfishingreports.com, forums.androidcentral.com,
  paflyfish.com, App Store listings (apps.apple.com) plus review mirrors (justuseapp.com,
  worldsapps.com, mwm.ai, onclarity.com), the iTunes Search API (for app IDs, ratings and counts),
  Trustpilot, Product Hunt, trade press (On The Water, Outdoor Life, The Fisherman, Texas
  Saltwater Fishing Magazine) and one agency survey PDF (Alaska ADF&G 2018).
- **What did not.** reddit.com (403 direct and `allowed_domains` refused; `site:` operator ignored
  by the engine, so zero Reddit snippets), bassresource.com (403; reader proxy 401), thehulltruth
  and iceshanty (bot wall), ifish.net / walleyecentral / paddling.com / fishingmagic (tollbit
  402 paywall-for-bots), Google Play (reviews not rendered), YouTube (results pages and comments
  not extractable; no video IDs recoverable), Facebook (no search path). The shared WebSearch
  budget ran out about 60% of the way through; the back half is direct fetches only.
- **Bias this creates.** Over-representation of Southeast US inshore saltwater (Charleston),
  Northeast surf (StripersOnline) and fly tying (FAOL); under-representation of freshwater bass
  boat/bank anglers (only App Store reviews and BassResource search snippets without handles),
  ice, catfish/crappie and kayak. Treat the heatmap cells for those segments as "not measured"
  rather than "no pain".
- **Independence.** Each evidence row names a handle; rows from the same handle in one job are
  merged into one row. Rows marked `handle n/a` (search snippets, anonymous survey respondents,
  vendor case studies) are shown for context and are NOT counted toward the ≥8 / ≥10 thresholds.
- **Intensity.** 1 = mild annoyance; 2 = built or bought a workaround; 3 = quit, paid, or asked
  for a product by name (skill vocabulary).

---

## 1. Segment profiles

### 1.1 Freshwater bank / boat (general, non-tournament)
Who: the largest segment; the Fishbrain/ANGLR/Bubba review corpus is mostly this group (lakes,
ponds, rivers). Typical trip: half-day, often solo or with kids; spots found by word of mouth,
Google Earth and increasingly by app pins. What they track: little, informally; photos on the
phone ("hunting through pictures on my phone trying to remember what they were biting when and
where", I4). Tools named: Fishbrain (free tier gutted in 2024–26, I86–I90), ANGLR (crashes, I93–
I94), Anglers' Log ($11.99/yr, I95), Bubba scale app (I105), Navionics (I107), state regulation
apps (I100–I101). Before: weather radar, a forecast app, maybe a rules look-up. During: phone in
pocket; 53% of app users use one on the water (I84). After: 14% use an app after the trip (I84),
which is where logging dies. Evidence rows: E-series, F-series, H-series.

### 1.2 Bass tournament (club and trail)
Who: club anglers fishing monthly points events plus trail anglers (kayak and boat). Typical
trip: pre-fish days, tournament day with a weigh-in or photo-measure submission. What they
track: points, standings, Angler/Team of the Year, payouts; the Midlands Striper Club threads
(I25–I32) are the best first-hand record of club-side admin even though the species is striper.
Tools named: Weighfish ($9.99–$69.99/yr director tiers, I98), TourneyX PRO (kayak, I111), iAngler
Tournament (2.8★, I113), FishDonkey (I114), Fishing Chaos (I99), paper weigh-in forms and a
member-built Excel scoring model (I26, I32). Off-season: bylaws, elections ("no one wants to do
the tournament director job", I25), dues, schedule. Evidence rows: T-series, C-series. Caveat:
BassResource was unreachable, so the freshwater bass club voice is thin.

### 1.3 Fly
Who: trout/steelhead/saltwater fly anglers and fly tiers; older skew in the FAOL corpus. Typical
trip: wading, access-point dependent; 76% want "all the regulations they need in one place"
(Alaska survey, I85). What they track: fly boxes and tying materials far more than catches:
"I have no idea how mch tying stuff I have, even when I try to organize it." (I54). Tools named:
Excel inventories kept 7–8 years (I53, I54), SuperFly database (I53), TroutRoutes ($39.99/yr PRO,
I116), onWater, Orvis app ($14.99, debated, I57), TU chapters and clubs as the learning channel
(I59). Strong spot-secrecy norm; Outdoor Life's "burn victims" piece (I78) centres on this group.
Evidence rows: G4–G13, G27–G29, L1–L14, F21, F22.

### 1.4 Saltwater inshore (boat, bay, flats)
Who: the Charleston forum population: boat owners fishing redfish, trout, flounder; many also
offshore. Typical trip: dawn launch timed to tide; bait stop; 2–6 hrs. What they track: tide,
wind, water temp, bait, spots; the most prolific loggers found (tide-log books, Excel since 1995,
waterproof notepads, Word docs printed quarterly: I4–I8). Tools named: Navionics ("best 10 bucks
I spent", I16), SailFlow/Wind Alert, Tides Near Me, tides4fishing.com, saltwatertides.com, Fish
Rules, SC DNR app, Fishing Points, FishTales/My Fishing Companion/FishInt log apps. Off-season:
reel service at the local shop (Haddrell's; 5-week waits, I39), licence renewal 1 July (I23),
club meetings and points audits. Evidence rows: most of E, P, R, M, T, C, S series.

### 1.5 Offshore / charter
Who: private offshore boats and six-pack charter captains; customers booking through
FishingBooker. Typical trip: long runs, no signal ("No good opening it 50 miles out with no
signal and running old regulations.", I20), SST/chlorophyll charts. What they track: numbers
(GPS), regs, weather windows; captains track bookings, deposits, weather reschedules. Tools
named: FishTrack ($95.99/yr, billing complaints, I117), Navionics (2.9★ after subscription
changes, I107), Fish Rules, FishingBooker (10%+ commission; ranking-by-commission accusations,
I121), TripWorks/FareHarbor-class booking tools (I122), QuickBooks (I123). Evidence rows: P18–
P27, R12–R13, B1–B22, O1–O16.

### 1.6 Surf
Who: Northeast striped bass surfcasters (StripersOnline). Typical trip: night tides, mobile,
drive 160–180 miles round trip (I62), gear abuse by sand and salt. What they track: tide height,
wind, water colour, "Documented misery" (I61); many kept logs since the early 2000s and some
are abandoning them as the fishery declines. Tools named: no app culture visible at all in the
Main Forum index (I69 listing: zero app threads in 50); reel maintenance is a dedicated
sub-forum (I69) with Van Staal/ZeeBaas/Penn service, bearings sourcing and JDM-reel service
gaps. Off-season: full reel teardown, respool, plug building. Evidence rows: E36–E39, M31–M39,
M51–M52, L9.

### 1.7 Kayak
Who: paddle/pedal anglers, strong tournament sub-culture (photo-measure events). Typical trip:
launch logistics, weather/wind sensitivity, fish-finder battery woes (I69 kayak index). What
they track: TourneyX submissions, waypoints, safety. Tools named: TourneyX PRO ("needed to submit
fish in tourneys", BassResource snippet I131), Navionics, weather apps. Evidence is thin (no
kayak-specific complaint thread reached beyond index titles); rows T22, I131.

### 1.8 Ice
Who: Upper Midwest/Northeast hard-water anglers. Not reached: iceshanty.com is bot-walled and
the only snippet found was a Fishbrain thread with one user calling it "worthless" (I133, handle
not visible). Treat as unmeasured.

### 1.9 Catfish / panfish / crappie
Who: large but under-served online; crappie.com returned 410 and no other reachable forum was
found before the search budget ended. Treat as unmeasured. Relevant indirect signal: Fishbrain's
"BiteTime" tab lacks "walleye, crappie, or any other fish not preloaded" (I86).

---

## 2. Workflow maps

**Before a trip** (71% of app-using anglers use apps here, I84): check weather radar and wind
(Bluefin, SailFlow, Windy, Wind Alert), tide (Tides Near Me, tides4fishing, printed tide log),
water temp and buoy data (NOAA buoy readers), solunar/"fish activity" (Fishing Points, Solunar
Time; widely distrusted, P10–P14), regulations and emergency orders (Fish Rules, state apps; only
27% of Alaskans "always" check emergency orders, I85), pick spots (Navionics, Google Earth,
waypoint lists, last year's log if it survived), buy bait, rig rods, load tackle (lure boxes
sorted by species/trip). Clubs: pay entry fee and turn in the entry form by Friday night (I30).

**During**: most phones stay in pockets (46% want to "leave technology behind", I84). Logging in
the moment fails ("are you really going to be punching in fish identifications in a gps?", I9);
what survives is a waypoint drop per fish, a photo, a voice memo, or circling the tide-log page.
Regs apps cannot refresh offshore (R12–R13). Tournament day: paper weigh-in forms, a laptop if
someone volunteers one, live leaderboard apps if the club adopted one.

**After** (only 14% of app users touch an app here, I84): rinse reels, note the trip in Excel /
notebook / Word doc / tide log (or intend to and lapse: "I miss one entry, then another, then
another", I76), post a photo to a forum thread or Facebook group (spot-burning etiquette fights),
club directors tally weights, compute points and payouts, post standings and corrections (I27,
I28). Guides: clean and refuel, "get bait and ice rounded up and ready for tomorrow" (I50), chase
customers about weather (I122), categorise fuel in QuickBooks (I123).

**Off-season**: dump every box and re-inventory ("get reacquainted with long-forgotten gear",
I80); send reels for service ("Dont wait till March… beat the spring rush", I42; 4–8 week
backlogs, M1, M28, S13); respool line ("Mono and even braided line neglect is a common cause of
angler misery", I80); rod guides checked; licence renewal (multi-year licences create a new
"remember what year it expires" problem, R2); club AGM, elections, bylaws disputes (I25),
points audits (I31), dues; fly tiers take inventory "usually a snowny January weekend" (I54).

---

## 3. Pain evidence tables (one per job)

Columns: `#` | verbatim quote | who / where | URL | date | job | pain type | intensity. Rows whose
handle is `n/a` are context only (see §0).

### 3.1 log-trips (E rows) — 46 independent handles, 7 platforms

| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Int |
|---|---|---|---|---|---|---|---|
| E1 | "then inevitably, I miss one entry, then another, then another," … "I've made Microsoft Excel spreadsheets that only require quick, numerical entries," … "short of hiring a fishing stenographer, I don't know what else I can do." | Jimmy Fee, On The Water (blog) | https://onthewater.com/the-challenge-of-keeping-an-up-to-date-fishing-log | 2012-01-11 | log-trips | manual-workaround, complexity | 2 |
| E2 | "I set too high of a standard." … "then playing catch-up, and then abandoning the project all together." … "I won't find myself at the end of the season trying to translate my own chicken scratch" | dave, flyanglersonline.com | https://www.flyanglersonline.com/t/the-fishing-log/6126 | 2004-06-28 | log-trips | manual-workaround | 2 |
| E3 | "Looking for a fishing log software. What do y'all use and like?" | Bryan, forum.charlestonfishing.com (Midlands Striper Club) | https://forum.charlestonfishing.com/t/fishing-log-software/50371 | 2013-08-20 | log-trips | missing-feature | 2 |
| E4 | "I have a spreadsheet I keep on each trip, but the software I downloaded on the ipad is very good as well." | VanMan, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-software/50371 | 2013-08-30 | log-trips | manual-workaround | 2 |
| E5 | "I haven't been diligent about keeping a log (manually)" … "Anyone using one they really like and would recommend?" | DownLow, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-app/72425 | 2016-05-02 | log-trips | manual-workaround, missing-feature | 2 |
| E6 | "would manually still need to enter water depth, water temp, bait" (on My Fishing Companion) | FishSticks, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-app/72425 | 2016-05-03 | log-trips | missing-feature | 1 |
| E7 | "Anybody have a favorite fish log app for their phone?" | JLeephoto, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-apps/70256 | 2016-01-15 | log-trips | missing-feature | 1 |
| E8 | "I have not downloaded the paid version yet but really like the free version so far." … "I have often wondered if it's logging this information on a database somewhere." | Goob, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-apps/70256 | 2016-01-15 | log-trips | privacy | 1 |
| E9 | "excel spreadsheet… make your own columns etc, tides, bait water temp etc…been doing it since 1995" | saltfisher, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-journal-record-keeping/30965 | 2011-04-28 | log-trips | manual-workaround | 2 |
| E10 | "have a small notebook while fishing then transcribe everything to the spreadsheet." | Lowcountryboy, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 | 2019-03-06 | log-trips | manual-workaround | 2 |
| E11 | "I find myself hunting through pictures on my phone trying to remember what they were biting when and where." … "No log here, but I drop a waypoint on each fish caught." | friogatto, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 ; https://forum.charlestonfishing.com/t/fishing-log-book/84966 | 2019-03-06; 2018-03-22 | log-trips | manual-workaround | 2 |
| E12 | "I have used a sprial note book for years!" (later says he misplaced it) | boatpoor, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 | 2019-03-07 | log-trips | manual-workaround | 2 |
| E13 | "once a month or so I will write trends in my journal." | Optiker, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 | 2019-03-07 | log-trips | manual-workaround | 1 |
| E14 | "I kept small pocket calendars for many years." … "I mostly just mark waypoints on the depthfinder." | Spoonmaster, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 | 2019-03-07 | log-trips | manual-workaround | 2 |
| E15 | "Stop by Haddrell's and ask for a Tide Log book." | Copahee_Hound, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 | 2019-03-07 | log-trips | manual-workaround | 2 |
| E16 | kept a detailed log "for a couple of years and then got lazy and seldom go." | Fred67, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 | 2019-03-07 | log-trips | complexity | 1 |
| E17 | "I need to start doing this. Would be much easier to find patterns." | yakgotstuck, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 | 2019-03-13 | log-trips | missing-feature | 1 |
| E18 | "Cool, been looking for an app that wasn't social. Can you export the data?" (developer reply: "You cannot export the data at this point") | kgearhart, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 | 2019-10-01 | log-trips | data-lock-in, privacy | 2 |
| E19 | "The key would be figuring out the important data whether it be water temp, tide, moon phase, bait, color of lure" | Downbytheriver, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 | 2019-03-11 | log-trips | complexity | 1 |
| E20 | "I started a log this year and i use an excell spreadsheet. Have columns for all pertinent details." | drterry, charlestonfishing | https://forum.charlestonfishing.com/t/keeping-a-log/78798 | 2017-03-09 | log-trips | manual-workaround | 2 |
| E21 | "What I started with is a googledocs form." … "I like paper instead so may change but this is what I am trying right now." | Shane0714, charlestonfishing | https://forum.charlestonfishing.com/t/keeping-a-log/78798 | 2017-03-09 | log-trips | manual-workaround | 2 |
| E22 | "I use a waterproof notepad that I found at lowe's. Usually use a new one for each year." | sea_tonic, charlestonfishing | https://forum.charlestonfishing.com/t/keeping-a-log/78798 | 2017-03-09 | log-trips | manual-workaround | 2 |
| E23 | "I have Microsoft Word documents labeled "Fall 2016 Fishing Report", "Spring 2017 Fishing Report", etc." … "I print them at the end of each quarter in case the computer dies." | spec, charlestonfishing | https://forum.charlestonfishing.com/t/keeping-a-log/78798 | 2017-03-09 | log-trips | manual-workaround, data-lock-in | 2 |
| E24 | "Buy a tide log every year and keep notes on the days you fish." … "Ditto on the tidelog. I have them dating back to 2001" | CaptFritz, charlestonfishing | https://forum.charlestonfishing.com/t/keeping-a-log/78798 ; https://forum.charlestonfishing.com/t/fishing-journal-record-keeping/30965 | 2017-03-09; 2011-04-28 | log-trips | manual-workaround | 2 |
| E25 | "This year I started keeping track of the weather everyday on my log wether I fish those days or not." | CaptDan, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-journal-record-keeping/30965 | 2011-04-28 | log-trips | manual-workaround | 2 |
| E26 | "I was considering making an app (Andriod) for that." … "Basically, you would just enter bait used, fish caught, weather info, etc." | Knotty_Hooker, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-journal-record-keeping/30965 | 2011-04-29 | log-trips | missing-feature | 2 |
| E27 | "Just want to make it as easy as possible so when I go back to look at conditions for that day" | Bootlegger, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-journal-record-keeping/30965 | 2011-04-28 | log-trips | complexity | 1 |
| E28 | "I keep mine on a bound calendar with the moon phases on it." … "I've kept it since 2008" | TIMBUKTU, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-journal-record-keeping/30965 | 2011-05-04 | log-trips | manual-workaround | 2 |
| E29 | "I'm looking for advice on a good Fishing log which is free or cheap." … "Tried Google search, was not impressed with the results." | KW186, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-online-software/29939 | 2011-02-08 | log-trips | missing-feature | 2 |
| E30 | "Excel gives me raw data, I think GoogleDocs would work." | spanishking, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-online-software/29939 | 2011-02-09 | log-trips | manual-workaround | 1 |
| E31 | "I'm missing logs as well that I wish I hadn't." … "I just prefer my method of using the boating app and saving screenshots for easy access." … "My memory tends to go after a few years, ha." | captfields_sc, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-book/84966 | 2018-03-20/22 | log-trips | manual-workaround | 2 |
| E32 | "too bad I haven't kept every trip logged though." | StumpNocker, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-book/84966 | 2018-03-20 | log-trips | complexity | 1 |
| E33 | "get years of logs into some sort of program like excel or something else to view patterns over the years?" | CackalackyHappy, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-book/84966 | 2018-03-20 | log-trips | missing-feature | 2 |
| E34 | "my idea for a software enhancement is to add a fishing log capability." | FlickerFisher, charlestonfishing | https://forum.charlestonfishing.com/t/gps-enhancement-idea/80483 | 2017-05-28 | log-trips | missing-feature | 2 |
| E35 | "I've been thinking about making a phone\tablet app to do this since most phones are GPS capable nowadays." | skinneej, charlestonfishing | https://forum.charlestonfishing.com/t/gps-enhancement-idea/80483 | 2017-05-30 | log-trips | missing-feature | 2 |
| E36 | "I'm finding more and more that I can't reference my log," | Bmawds, stripersonline.com Main Forum | https://www.stripersonline.com/surftalk/topic/922281-are-logs-still-relevant-in-the-surf/ | 2026-10-13 (year from forum index) | log-trips | inaccurate | 1 |
| E37 | "Logs are relevant especially for skunks, that's what mine would look like." (first season since 2003 without a log) | LowEnd, stripersonline | https://www.stripersonline.com/surftalk/topic/922281-are-logs-still-relevant-in-the-surf/ | 2026-10-14 | log-trips | complexity | 1 |
| E38 | "I use to believe my logs and would plan my outings around them and most times they paid off." | suburban86, stripersonline | https://www.stripersonline.com/surftalk/topic/922281-are-logs-still-relevant-in-the-surf/ | 2026-10-14 | log-trips | inaccurate | 1 |
| E39 | "Start tracking your trips, wind, tides, weather, water( white water, dirty, weedy) skunked, caught." | Cascade, stripersonline | https://www.stripersonline.com/surftalk/topic/922464-time-spent-on-a-spot/ | 2026-10-20 | log-trips | manual-workaround | 1 |
| E40 | "their catch data is near worthless" … "by default it'll just pick the closest one for you." | Joseph.Dancer, App Store review (Fishbrain) | https://apps.apple.com/us/app/fishbrain-fishing-app/id477967747 | 2021-05-05 | log-trips | inaccurate | 2 |
| E41 | "the app does not allow you to create a new body of water." | Ryan Cassady, App Store (Fishbrain) | https://apps.apple.com/us/app/fishbrain-fishing-app/id477967747 | 2021-07-24 | log-trips | missing-feature | 1 |
| E42 | "It crashes at least once per trip." … "You can't really enter past trips or catches because it won't save changes you make to the date." … "Data analysis is truly dismal compared to other logging apps." | MLMRyan, App Store (ANGLR) | https://apps.apple.com/us/app/fishing-app-anglr-logbook/id1142347232 | 2021-01-11 | log-trips | inaccurate, complexity | 2 |
| E43 | "The downside is that this app crashes so often." … "I wish there was a way to select more than one gear during gear selection." … "being able to log terminal tackle like hooks, weights, and swivels would be awesome too." | unnamed reviewer ("App is good, but often crashes"), App Store (ANGLR) | https://apps.apple.com/us/app/fishing-app-anglr-logbook/id1142347232 | 2021-06-26 | log-trips | missing-feature | 1 |
| E44 | "FishingApp crashes and force closes ALL THE TIME." … "the GPS stopped recording after my first catch." | JakeVdub608, justuseapp mirror (ANGLR) | https://justuseapp.com/en/app/1142347232/fishing-app-anglr-logbook/reviews | n.d. (accessed 2026-10-20) | log-trips | inaccurate | 2 |
| E45 | "it would be great to have a way to export the catch log to a spreadsheet" | Flyfishdoc, justuseapp (ANGLR) | https://justuseapp.com/en/app/1142347232/fishing-app-anglr-logbook/reviews | n.d. | log-trips | data-lock-in | 2 |
| E46 | "The ability to easily sort past trips by location, time, trip name, etc would be extremely helpful." | Rpa011, justuseapp (ANGLR) | https://justuseapp.com/en/app/1142347232/fishing-app-anglr-logbook/reviews | n.d. | log-trips | missing-feature | 1 |
| E47 | "The app needs to fix bugs. Crashed multiple times. Lost a major portions of 2 days on the water." | Bru7979, App Store (BUBBA) | https://apps.apple.com/us/app/bubba/id1607037466 | 2025-04-05 | log-trips | inaccurate | 2 |
| E48 | "Trips won't save sometimes, the app crashes when trying to end a trip." … "What would be great would be the ability to export this data. Is that possible???" | Rehawtho, App Store (BUBBA) | https://apps.apple.com/us/app/bubba/id1607037466 | 2025-01-06 | log-trips | data-lock-in | 2 |
| E49 | "ability to add multiple lures, baits, photos, weights and locations to one fishing trip" … "ability to download a usable file (csv file, excel, etc)." | CentONE, justuseapp (Anglers' Log) | https://justuseapp.com/en/app/959989008/anglers-log-fishing-journal/reviews | n.d. | log-trips | data-lock-in, missing-feature | 1 |
| E50 | "Can toy make an option to group notes together i fish many lakes and want to be able to group my logs by lake" | TheR3ALRudy, justuseapp (Anglers' Log) | https://justuseapp.com/en/app/959989008/anglers-log-fishing-journal/reviews | n.d. | log-trips | missing-feature | 1 |
| E51 | "I wish their were more stats I could track such as retrieval specific catches, lure specific catches" | Tboat777, justuseapp (Anglers' Log) | https://justuseapp.com/en/app/959989008/anglers-log-fishing-journal/reviews | n.d. | log-trips | missing-feature | 1 |
| E52 | "Only thing I wish is that the app had more kinds of statistics to view and compare." | Jovohfdvbh, App Store (Anglers' Log) | https://apps.apple.com/us/app/anglers-log-fishing-journal/id959989008 | 2018-05-13 | log-trips | missing-feature | 1 |
| E53 | "So many Fishing apps are bloated with junk; this one is designed with purpose and fulfills that purpose perfectly." … "I would pay a one time iap to support the app if you could add a database of fish & bait (lures)" | Thalinor, App Store (Anglers' Log) | https://apps.apple.com/us/app/anglers-log-fishing-journal/id959989008 | 2019-05-14 | log-trips | complexity | 3 |
| E54 | "I've tried them all. If an app throws a "premium" ad in my face every other button tap I delete it." | not so super monkey man, App Store (Anglers' Log) | https://apps.apple.com/us/app/anglers-log-fishing-journal/id959989008 | Sep 4 (year not shown) | log-trips | ads | 3 |
| E55 | "I have used the Fisherslog for two years now." … "have logged every one of those days. Even the Skunk days." | Jim Ziola, On The Water comment | https://onthewater.com/4-tips-for-fishing-log-success | 2012-01-20 | log-trips | manual-workaround (paid tool) | 2 |
| E56 | "I used to do almost all that you've described," (now records voice memos on his phone and transcribes later) | Marlon Violette, On The Water comment | https://onthewater.com/the-challenge-of-keeping-an-up-to-date-fishing-log | 2012-01-18 | log-trips | manual-workaround | 2 |
| E57 | "I started several trips to test. Then go and delete them. Go back later and they are still there." | Cdvfishing, justuseapp (ANGLR) | https://justuseapp.com/en/app/1142347232/fishing-app-anglr-logbook/reviews | n.d. | log-trips | inaccurate | 1 |
| E58 | "Each year I start a new log, and at the end of the year I cut and paste the info into a master excel spreadsheet." | handle n/a (search snippet), bassresource.com | https://www.bassresource.com/bass-fishing-forums/topic/151461-fishing-logs/ | n.d. (snippet) | log-trips | manual-workaround | 2 |

Summary: Today they log in Excel/Google Sheets, tide-log books, waterproof notepads, Word docs,
pocket calendars, phone photos and GPS waypoints, and most lapse within a season. They want
automatic capture of conditions (tide, weather, water temp, moon) at the moment of a catch, a
private (non-social) record they can export and query for patterns across years, and no premium
nags. Price said: $12/yr happily paid (E54–E55 reviewers), a one-time IAP preferred (E53), "free or
cheap" (E29).

### 3.2 find-spots (F rows) — 26 independent handles, 6 platforms

| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Int |
|---|---|---|---|---|---|---|---|
| F1 | "Does anyone know any iPhone apps that work well for marking and storing saltwater, inshore fishing points" … "have begun to hand type all of my gps coordinates into it that I had stored" | stokes, charlestonfishing | https://forum.charlestonfishing.com/t/gps-iphone-apps/53288 | 2013-11-30; 2013-12-06 | find-spots | manual-workaround | 2 |
| F2 | "Navionics, best 10 bucks I spent." | tigerfin, charlestonfishing | https://forum.charlestonfishing.com/t/gps-iphone-apps/53288 | 2013-12-02 | find-spots | (WTP) | 3 |
| F3 | "I use one called fish logger" | jeff462v, charlestonfishing | https://forum.charlestonfishing.com/t/gps-iphone-apps/53288 | 2013-11-30 | find-spots | manual-workaround | 1 |
| F4 | "The free version only allows you to record about 10 waypoints" … "I have about a dozen I would be happy to share with you." | Badbobflyfishing, charlestonfishing | https://forum.charlestonfishing.com/t/gps-apps/85786 | 2018-05-19 | find-spots | too-expensive | 1 |
| F5 | "I use the non-free version of Navionics on Android as Plan B" | DillyDally, charlestonfishing | https://forum.charlestonfishing.com/t/gps-apps/85786 | 2018-05-27 | find-spots | (WTP) | 2 |
| F6 | "I save a waypoint everywhere I hook up with decent fish." | Fogman, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-software/50371 | 2013-08-21 | find-spots | manual-workaround | 2 |
| F7 | "you're forced to pick from a few predetermined fishing locations." | Joseph.Dancer, justuseapp (Fishbrain) | https://justuseapp.com/en/app/477967747/fishbrain-fishing-app/reviews | n.d. (review dated 2021-05-05 on App Store) | find-spots | inaccurate | 2 |
| F8 | "It defaults by showing your exact location." | Lee57one, justuseapp (Fishbrain) | https://justuseapp.com/en/app/477967747/fishbrain-fishing-app/reviews | n.d. | find-spots | privacy | 2 |
| F9 | "This makes membership almost deceptive since you're really paying for that location info." | Sedsman, justuseapp (Fishbrain) | https://justuseapp.com/en/app/477967747/fishbrain-fishing-app/reviews | n.d. | find-spots | too-expensive | 2 |
| F10 | "it gives me all the catches worldwide, not just at Oneida Lake." | ERrkre3487, justuseapp (Fishbrain) | https://justuseapp.com/en/app/477967747/fishbrain-fishing-app/reviews | n.d. | find-spots | inaccurate | 1 |
| F11 | "The app has a glitch and it's putting the wrong catches on a location." | Ha Ke, justuseapp (Fishbrain) | https://justuseapp.com/en/app/477967747/fishbrain-fishing-app/reviews | 2022-07-09 | find-spots | inaccurate | 1 |
| F12 | "searching for a location will place the camera at a random location" | Elite_Phantom16, justuseapp (Fishbrain) | https://justuseapp.com/en/app/477967747/fishbrain-fishing-app/reviews | n.d. | find-spots | inaccurate | 1 |
| F13 | "There are so many spots that just don't exist around my area so it's mainly just useless" | C., worldsapps mirror (Fishbrain) | https://worldsapps.com/reviews-fishbrain-fishing-app | 2024-07-25 | find-spots | inaccurate | 2 |
| F14 | "I bought this app an got some PB fish as well as a few trespassing charges!" | kendrick L., worldsapps (Fishbrain) | https://worldsapps.com/reviews-fishbrain-fishing-app | 2024-04-22 | find-spots | inaccurate | 3 |
| F15 | "If I want better location I have to pay a ton of money for premium" | J., worldsapps (Fishbrain) | https://worldsapps.com/reviews-fishbrain-fishing-app | 2024-04-22 | find-spots | too-expensive | 2 |
| F16 | "But now everything is behind a paywall and they track where your catches are" | I., worldsapps (Fishbrain) | https://worldsapps.com/reviews-fishbrain-fishing-app | 2025-12-13 | find-spots | privacy | 2 |
| F17 | "Many locations marked as fishing spots are actually private, which is misleading and frustrating." | handle n/a (aggregated excerpt), onclarity.com | https://www.onclarity.com/leaderboard/insight/fishbrain | 2026-10-20 (report date) | find-spots | inaccurate | 2 |
| F18 | "Some "Spots" are placed to through you off." | Lavxa, App Store (Fishing Spots by FishAngler) | https://apps.apple.com/us/app/fishing-spots-fish-maps/id417922502 | 2025-07-07 | find-spots | inaccurate | 1 |
| F19 | "Literally none of the lakes or rivers I fish are visible in this app." … "definitely not worth $50 a year." | Markh142, App Store (Fishing Points) | https://apps.apple.com/us/app/fishing-points-map-forecast/id1203032512 | 2025-08-12 | find-spots | inaccurate, too-expensive | 3 |
| F20 | "Why can't I search for a location on the map?" | User4678, justuseapp (Fishing Points) | https://justuseapp.com/en/app/1203032512/fishing-points-map-forecast/reviews | n.d. | find-spots | missing-feature | 1 |
| F21 | "The parking suggestions are a joke. You CANNOT rely on this information." … "Not a complete waste, but not worth the price." | tywalkerdev, App Store (TroutRoutes) | https://apps.apple.com/us/app/troutroutes-fly-fishing-app/id1423989574 | 2023-06-13 | find-spots | inaccurate, too-expensive | 3 |
| F22 | "People want to show off, and they don't care if they're revealing their location when they show off." … "But at the same time, I'd prefer nobody posted anything on the app ever." | Pete Scharf (Fishbrain user), quoted in Outdoor Life | https://www.outdoorlife.com/fishing/are-fishing-apps-doing-more-harm-than-good/ | 2022-07-20 | find-spots | privacy | 2 |
| F23 | "I'd posit that fishing apps produce more burn victims than any other platform." … "This pond used to feel like a little secret, but now it's being served up on a silver platter." | Joe Cermele (author), Outdoor Life | https://www.outdoorlife.com/fishing/are-fishing-apps-doing-more-harm-than-good/ | 2022-07-20 | find-spots | privacy | 2 |
| F24 | "Not producing? Move. If nothing happens in an hour, I'm moving on to the next spot on my list." | DSem215, stripersonline | https://www.stripersonline.com/surftalk/topic/922464-time-spent-on-a-spot/ | 2026-10-20 | find-spots | manual-workaround | 1 |
| F25 | "there is no feature that lets you submits requests for a new water to be added on the map" | Veggie_licker67, mwm.ai mirror (Fishbrain) | https://mwm.ai/apps/fishbrain-fishing-app/477967747 | 2026-05-10 | find-spots | missing-feature | 1 |
| F26 | "would love to see more reviews on fishing spots" | c/Hick/a, mwm.ai (Fishbrain) | https://mwm.ai/apps/fishbrain-fishing-app/477967747 | 2026-05-10 | find-spots | missing-feature | 1 |
| F27 | "you should be able to fill in the coordinates manually, not just drag the map around blindly." | B27.., justuseapp (Anglers' Log) | https://justuseapp.com/en/app/959989008/anglers-log-fishing-journal/reviews | n.d. | find-spots | missing-feature | 1 |
| F28 | "The only thing missing is the ability to mark spots where I have caught fish throughout my day." | Mee2yoo, justuseapp (Anglers' Log) | https://justuseapp.com/en/app/959989008/anglers-log-fishing-journal/reviews | n.d. | find-spots | missing-feature | 1 |
| F29 | "I would like to see the ability to quickly mark depth to make a contour map." | Sara Isaacs, justuseapp (Fishing Points) | https://justuseapp.com/en/app/1203032512/fishing-points-map-forecast/reviews | n.d. | find-spots | missing-feature | 1 |

Summary: Today they keep spots as chartplotter/Navionics waypoints, hand-typed coordinate lists,
or in crowd-sourced apps whose pins are wrong, private land, or deliberately misleading. They want
private, searchable, exportable spot records tied to catches; they resent paying $50–100/yr for
location data and fear location leakage. Price said: $10 one-time for Navionics praised twice;
$50/yr rejected.

### 3.3 plan-conditions (P rows) — 31 independent handles, 6 platforms

| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Int |
|---|---|---|---|---|---|---|---|
| P1 | "I have a half-dozen apps and sites on my phone that tell me everything from wind direction" … "We are glued to these damn things." | Scott Null (guide/columnist), Texas Saltwater Fishing Magazine | https://www.texassaltwaterfishingmagazine.com/fishing/by-type/opinion-narrative/please-leave-message | 2016-03 | plan-conditions | complexity | 2 |
| P2 | "I haven't found a decent app, but saltwatertides.com is a great site." | Drippin_Wett, charlestonfishing | https://forum.charlestonfishing.com/t/tide-apps/67853 | 2015-09-15 | plan-conditions | missing-feature | 2 |
| P3 | "Can anyone suggest a good fishing/tide app for android phones? Thanks." | BigFishFan, charlestonfishing | https://forum.charlestonfishing.com/t/tide-apps/67853 | 2015-09-15 | plan-conditions | missing-feature | 1 |
| P4 | "I also use tides4fishing.com. Very accurate and good solunar info too." | Cracker_Larry, charlestonfishing | https://forum.charlestonfishing.com/t/tide-apps/67853 | 2015-09-16 | plan-conditions | (satisfied, web not app) | 1 |
| P5 | "What does everyone use for weather radar on their phones" … "Question ?? How often it is up-dated" | dlwhite001, charlestonfishing | https://forum.charlestonfishing.com/t/weather-apps/49479 | 2013-07-25 | plan-conditions | inaccurate | 1 |
| P6 | "Does anyone know of a good wind/wave smartphone app?" | btodag, charlestonfishing | https://forum.charlestonfishing.com/t/best-smartphone-apps-wind-wave-etc/31362 | 2011-05-16 | plan-conditions | missing-feature | 1 |
| P7 | "Works pretty well, but could always be better." (Bluefin marine weather) | CH_Allen, charlestonfishing | https://forum.charlestonfishing.com/t/best-smartphone-apps-wind-wave-etc/31362 | 2011-05-16 | plan-conditions | inaccurate | 1 |
| P8 | "Can anyone who has been using it for awhile tell me how accurate it is?" | tandt1205, charlestonfishing | https://forum.charlestonfishing.com/t/best-smartphone-apps-wind-wave-etc/31362 | 2011-05-18 | plan-conditions | inaccurate | 1 |
| P9 | "Someone was showing me an app they had on their phone a month or so ago that shows the current water temps" … "What is it called?" | Chad, charlestonfishing | https://forum.charlestonfishing.com/t/water-temp-and-fishing-app/78496 | 2017-02-20 | plan-conditions | missing-feature | 1 |
| P10 | "I've never caught fish on so called high fish activity days." … "these forecasts on here mean nothing and don't make any sense" | Shoreline C, App Store (Fishing Points) | https://apps.apple.com/us/app/fishing-points-map-forecast/id1203032512 | 2023-10-30 | plan-conditions | inaccurate | 2 |
| P11 | "FishingPoints provides incredibly inaccurate data." | Fishhhin, justuseapp (Fishing Points) | https://justuseapp.com/en/app/1203032512/fishing-points-map-forecast/reviews | n.d. | plan-conditions | inaccurate | 2 |
| P12 | "As far as fish activity rating of FishingPoints goes, it is horrible." | Fwolfe49, justuseapp (Fishing Points) | https://justuseapp.com/en/app/1203032512/fishing-points-map-forecast/reviews | n.d. | plan-conditions | inaccurate | 2 |
| P13 | "All 3 times we were skunked...not a bite and no activity in the water." | ShowHorses, justuseapp (Fishing Points) | https://justuseapp.com/en/app/1203032512/fishing-points-map-forecast/reviews | n.d. | plan-conditions | inaccurate | 2 |
| P14 | "FishingPoints is ok, but it's not accurate and probably making up random stuff." | Con1434, justuseapp (Fishing Points) | https://justuseapp.com/en/app/1203032512/fishing-points-map-forecast/reviews | n.d. | plan-conditions | inaccurate | 1 |
| P15 | "Want to see the forecast for tomorrow, though? Ooooooo... yea, that'll be $10." | InstagramMyNuts, justuseapp (Fishing Points) | https://justuseapp.com/en/app/1203032512/fishing-points-map-forecast/reviews | n.d. | plan-conditions | too-expensive | 2 |
| P16 | "there is no easy way to unsubscribe from FishingPoints" | Tank Us, justuseapp (Fishing Points) | https://justuseapp.com/en/app/1203032512/fishing-points-map-forecast/reviews | n.d. | plan-conditions | too-expensive | 2 |
| P17 | "it only allows me to store 5 locations. It says reactivate premium." | John Nolan, justuseapp (Fishing Points) | https://justuseapp.com/en/app/1203032512/fishing-points-map-forecast/reviews | 2021-10-23 | plan-conditions | too-expensive | 2 |
| P18 | "I started noticing last year that me and a charter captain I know we're getting totally different forecasts" … "It really bums me out that it's totally unreliable." | Tommydeez1161, App Store (FishTrack) | https://apps.apple.com/us/app/fishtrack-charts-forecasts/id952022603 | 2019-05-13 | plan-conditions | inaccurate | 3 |
| P19 | "Please don't subscribe." … "after two days some of the features (latest sst and chlorophyll) has ceased to show" | abookulsum, App Store (FishTrack) | https://apps.apple.com/us/app/fishtrack-charts-forecasts/id952022603 | 2018-07-22 | plan-conditions | too-expensive, abandoned-app | 3 |
| P20 | "continued automatic transactions without authorization of user." … "There's no option to unsubscribe the Visa card." | gayyoom, App Store (FishTrack) | https://apps.apple.com/us/app/fishtrack-charts-forecasts/id952022603 | 2019-10-17 | plan-conditions | too-expensive | 3 |
| P21 | "Fish Track billed me for service but my account is not accessible as their change password function is not working." … "Tried their support function; got a 404 error." | Healthy Skeptic # 3612244896, App Store (FishTrack) | https://apps.apple.com/us/app/fishtrack-charts-forecasts/id952022603 | 2022-06-21 | plan-conditions | too-expensive | 3 |
| P22 | "It's hard to believe that a $50 annual subscription doesn't buy better software support" | ErikExp, App Store (Navionics Boating) | https://apps.apple.com/us/app/navionics-boating/id744920098 | Mar 27 (year not shown) | plan-conditions | too-expensive | 2 |
| P23 | "the most recent update is TERRIBLE and reduced the quality to crap for relief shading." … "When my subscription is up I'm going to another charting system unless they bring it back." | Serious angler, App Store (Navionics) | https://apps.apple.com/us/app/navionics-boating/id744920098 | 2023-05-15 | plan-conditions | inaccurate | 3 |
| P24 | "What once was a great app is now a very expensive subscription service." … "No nautical chart is included in the subscription price!" | New Family Tree, justuseapp (Navionics) | https://justuseapp.com/en/app/744920098/navionics-boating/reviews | n.d. | plan-conditions | too-expensive | 2 |
| P25 | "Now they have disappeared, gone!" … "You cannot rely on the charts you need to be on your devices." | Jwcbjc, justuseapp (Navionics) | https://justuseapp.com/en/app/744920098/navionics-boating/reviews | n.d. | plan-conditions | data-lock-in, offline | 3 |
| P26 | "Garmin is now forcing users to create an account before allowing access to Navionics" … "Even if you have a current subscription purchased under the old model." | Puget Boater, justuseapp (Navionics) | https://justuseapp.com/en/app/744920098/navionics-boating/reviews | n.d. | plan-conditions | data-lock-in | 2 |
| P27 | "Taking away the ability to view/use the Govt NOAA charts is the last straw example of this company's greed." … "your Caribbean Charts subscription has increased from about $8 to $28 per year." | 24K2, justuseapp (Navionics) | https://justuseapp.com/en/app/744920098/navionics-boating/reviews | n.d. | plan-conditions | too-expensive | 3 |
| P28 | "Ever since the previous update I feel I'm not getting the value I was but still paying the same price." … "the ability to see walleye, crappie, or any other fish not preloaded in the "BiteTime" tab" | GingerGoo, App Store (Fishbrain) | https://apps.apple.com/us/app/fishbrain-fishing-app/id477967747 | 2024-07-31 | plan-conditions | missing-feature, too-expensive | 2 |
| P29 | "One thing I'd love to see is a moon phase and tide indicator tied to each trip entry" | Nuray Kıcırlı, Product Hunt (AnglerSlate) | https://www.producthunt.com/products/anglerslate-fishing-log | ~2026-07 ("3mo ago") | plan-conditions | missing-feature | 1 |
| P30 | "Would love a built-in lunar phase and tide chart you can pull up from a trip record." | Hamza Nazlıoğlu, Product Hunt (AnglerSlate) | https://www.producthunt.com/products/anglerslate-fishing-log | ~2026-07 | plan-conditions | missing-feature | 1 |
| P31 | "SailFlow is a good app as well as wind alert which is by the same developer." | captfields_sc, charlestonfishing | https://forum.charlestonfishing.com/t/best-fishing-boating-related-apps/77205 | 2016-12-20 | plan-conditions | (multi-app stack) | 2 |
| P32 | "Best $10 app on the market = navionics - US East." … "the first download/install iteration takes hours and a WiFi connection." | PalmerScott, charlestonfishing | https://forum.charlestonfishing.com/t/any-good-fishing-apps/33867 | 2011-08-30 | plan-conditions | complexity | 2 |
| P33 | "Besides a buoy app I haven't found anything cool…" (iPad) | breadandbobbers, charlestonfishing | https://forum.charlestonfishing.com/t/any-good-fishing-apps/33867 | 2011-08-29 | plan-conditions | missing-feature | 1 |
| P34 | "It listed peak time yesterday at a time I would have never had great luck" … "had my best trout day this year" | jghall, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-points-app/91118 | 2019-09-15 | plan-conditions | (satisfied) | 1 |

Summary: Today they run a stack of 4–6 free apps/sites (radar, wind, tide, buoy, chart) and
distrust paid "fish activity" scores. They want accurate, cheap, offline-capable charts and
tide/moon data attached to their own records rather than another forecast. Price said: $10
one-time charts praised; $50/yr Navionics and $10 "forecast for tomorrow" resented; FishTrack
billing practices drove 1-star reviews.

### 3.4 regulations (R rows) — 30 independent handles, 7 platforms

| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Int |
|---|---|---|---|---|---|---|---|
| R1 | "Just want to throw a reminder out for everyone that as of today, July 1, we have to renew our fishing and hunting licenses!" … "I would hate for someone to forget and get a ticket this week." | spotsnslots, charlestonfishing | https://forum.charlestonfishing.com/t/license-renewal/48645 | 2013-07-01 | regulations | manual-workaround | 1 |
| R2 | "I bought the 3 year license. Now I have to remember what year it expires." | DFreedom, charlestonfishing | https://forum.charlestonfishing.com/t/license-renewal/48645 | 2013-07-01 | regulations | manual-workaround | 2 |
| R3 | "thanks… forgot all about it" | Sasha_and_Abby, charlestonfishing | https://forum.charlestonfishing.com/t/license-renewal/48645 | 2013-07-01 | regulations | complexity | 1 |
| R4 | "Bought the lifetime, so one less thing to try to remember…" | pitviper0404, charlestonfishing | https://forum.charlestonfishing.com/t/license-renewal/48645 | 2013-07-01 | regulations | manual-workaround | 2 |
| R5 | "Be careful relying on the lifetime license. I got mine years ago and the thing doesnt cover SALTWATER or WMA hunting" | sniper7, charlestonfishing | https://forum.charlestonfishing.com/t/license-renewal/48645 | 2013-07-01 | regulations | complexity | 2 |
| R6 | "I thought I read that the state legislature was enacting a law that would let the license be good for a full year" | retiredbc72, charlestonfishing | https://forum.charlestonfishing.com/t/license-renewal/48645 | 2013-07-02 | regulations | complexity | 1 |
| R7 | "i want to know if you forgot your license and got a ticket if you can appeal it." | Rizzla, northwestfishingreports.com | https://northwestfishingreports.com/forum/viewtopic.php?p=4846 | 2007-06-08 | regulations | complexity | 2 |
| R8 | "A friend of mine was caught without his license and was fined. He saw that a first time offense was $250" | Palmer, northwestfishingreports | https://northwestfishingreports.com/forum/viewtopic.php?p=4846 | 2007-06-10 | regulations | complexity | 2 |
| R9 | "Hard to keep up with all the rules, slot sizes, etc." … "My brain is near full and doesn't have room to memorize SC laws and FL laws." | DFreedom, charlestonfishing | https://forum.charlestonfishing.com/t/fish-rules-app/87913 | 2018-11-04; 2019-02-12 | regulations | complexity | 2 |
| R10 | "this app has saved me from breaking laws on fish I couldn't identify" | rebelstate, charlestonfishing | https://forum.charlestonfishing.com/t/fish-rules-app/87913 | 2018-11-03 | regulations | (adopted tool) | 3 |
| R11 | "LOVE that app… As much traveling as I do, it keeps me legal nationwide!" | Saxitalis, charlestonfishing | https://forum.charlestonfishing.com/t/fish-rules-app/87913 | 2019-02-11 | regulations | (adopted tool) | 3 |
| R12 | "it will update once a day when you open it and can't do it with no signal offshore." | Head_East, charlestonfishing | https://forum.charlestonfishing.com/t/fish-rules-app/87913 | 2019-02-12 | regulations | offline | 2 |
| R13 | "No good opening it 50 miles out with no signal and running old regulations." | Charleston, charlestonfishing | https://forum.charlestonfishing.com/t/fish-rules-app/87913 | 2019-02-12 | regulations | offline | 2 |
| R14 | "Total horse hocky that you need a dadburn smart phone application" … "the way everything changes it should be easier." | OldSchool, charlestonfishing | https://forum.charlestonfishing.com/t/fish-rules-app/87913 | 2019-02-06; 2019-02-10 | regulations | complexity (anti-app) | 2 |
| R15 | "Little fush are harder to identify." | mdaddy, charlestonfishing | https://forum.charlestonfishing.com/t/fish-rules-app/87913 | 2019-02-12 | regulations | complexity | 1 |
| R16 | "It turns out you may get a response to your photo 49 hours later (maybe) in your email." … "I promptly cancelled my subscription, but I'm stuck with this app for the remaof the year." | bagmart, App Store (Fish Rules) | https://apps.apple.com/us/app/fish-rules-local-fishing-laws/id597875361 | 2024-12-06 | regulations | inaccurate, too-expensive | 3 |
| R17 | "I launched the app to look up the species and noticed we were fishing in a restricted area" | elcastillian, App Store (Fish Rules) | https://apps.apple.com/us/app/fish-rules-local-fishing-laws/id597875361 | 2021-12-19 | regulations | (adopted tool) | 3 |
| R18 | "I simply cannot log in on the iS app." … "Up until now, I haven't received a single response." | Maikoll.social, App Store (Fish Rules) | https://apps.apple.com/us/app/fish-rules-local-fishing-laws/id597875361 | 2025-09-25 | regulations | inaccurate | 2 |
| R19 | "Unreliable to use offshore, without data connection" … "This is a For-Profit App that can get you in trouble in more than one way." | X-Gladius, justuseapp (Fish Rules) | https://justuseapp.com/en/app/597875361/fish-rules-local-fishing-laws/reviews | n.d. | regulations | offline | 2 |
| R20 | "FishRules mixes freshwater and saltwater regulations so some are incorrect." … "There are additional regulations that are in my state's book of laws that aren't readily disclosed" | LOLGEVOS, justuseapp (Fish Rules) | https://justuseapp.com/en/app/597875361/fish-rules-local-fishing-laws/reviews | n.d. | regulations | inaccurate | 2 |
| R21 | "they cover maybe 10 states. Recommend getting some coverage in MT,WY,CO,SD,ND,ID." | Tommy Trller, justuseapp (Fish Rules) | https://justuseapp.com/en/app/597875361/fish-rules-local-fishing-laws/reviews | n.d. | regulations | missing-feature | 2 |
| R22 | "After update, it automatically sets my location to Ga State Waters because that is where I live." | JeeperSSS, justuseapp (Fish Rules) | https://justuseapp.com/en/app/597875361/fish-rules-local-fishing-laws/reviews | n.d. | regulations | inaccurate | 1 |
| R23 | "every time I open it, it gives me a message that says it failed to sync" | Fan of Starbucks, App Store (Fish Washington) | https://apps.apple.com/us/app/fish-washington/id1329839426 | 2018-06-14 | regulations | inaccurate | 1 |
| R24 | "the app downloads the regs fine, then stalls updating for 10+ minutes before I get frustrated and shut the app down." | Lil rowbot, App Store (Fish Washington) | https://apps.apple.com/us/app/fish-washington/id1329839426 | 2018-08-14 | regulations | complexity | 2 |
| R25 | "it takes FOREVER for the emergency rules to update and half the time I just get frustrated and close the app." … "I do find it hard to know where you are looking sometimes because nothing is named." | tallcurt, App Store (Fish Washington) | https://apps.apple.com/us/app/fish-washington/id1329839426 | 2020-12-04 | regulations | complexity | 2 |
| R26 | "If you do not go update at beginning up new season you are potentially viewing incorrect information" … "changes made during the year like closings do not show up." | 456357865, App Store (Texas Outdoor Annual) | https://apps.apple.com/us/app/texas-outdoor-annual/id874391813 | 2022-08-24 | regulations | inaccurate | 2 |
| R27 | "If something is out of date ya better check the Tech data first to see the the change." | Angle 73, App Store (Texas Outdoor Annual) | https://apps.apple.com/us/app/texas-outdoor-annual/id874391813 | 2018-07-19 | regulations | inaccurate | 1 |
| R28 | "Wish it had a place to add your boat & motor registration as well, maybe it does & I missed it." | areeldrag, charlestonfishing | https://forum.charlestonfishing.com/t/new-sc-dnr-app/94359 | 2022-03-15 | regulations | missing-feature | 1 |
| R29 | "i'm going to have to try this because i bought me and wife fishing licenses 3 to 4 weeks ago" … "they haven't showed up in the mail yet." | hammurred, charlestonfishing | https://forum.charlestonfishing.com/t/new-sc-dnr-app/94359 | 2022-06-15 | regulations | complexity | 1 |
| R30 | "Has the app quit working for anybody with an Apple device? Seems as if it stopped working with the latest version of iOS." (SAFMC regs app) | dreamin-on, charlestonfishing | https://forum.charlestonfishing.com/t/safmc-app-quit-working/77449 | 2016-12-29 | regulations | abandoned-app | 2 |
| R31 | "it would be nice to actually have up to date regulations right in the app." | Dini Chats het dich ufgesse, App Store (TroutRoutes) | https://apps.apple.com/us/app/troutroutes-fly-fishing-app/id1423989574 | 2026-06-22 | regulations | missing-feature | 1 |
| R32 | "inaccurate class information. Different classes were given than my state wildlife gave" | tywalkerdev, App Store (TroutRoutes) | https://apps.apple.com/us/app/troutroutes-fly-fishing-app/id1423989574 | 2023-06-13 | regulations | inaccurate | 2 |
| R33 | "I sometimes find it difficult interpreting the paper copy when out fishing specific waters." … "This app is long overdue! It would save us a lot of time, and it would eliminate all confusion about emergency orders." … "also make it a free app or one that comes free with license purchase." | handle n/a (anonymous survey respondents), ADF&G survey report | https://www.adfg.alaska.gov/static/fishing/PDFs/sport/Survey_Report-2018-9-19.pdf | 2018-09-19 | regulations | complexity | 2 |

Summary: Today they rely on Fish Rules (saltwater), state apps (WA, TX, SC DNR), paper booklets,
and reminders from forum friends for licence renewal; multi-year licences shift the problem to
remembering the expiry year. They want current rules by location/species that work offline,
emergency-order alerts, licence storage and expiry reminders, and coverage beyond coastal states.
Price said: free (survey respondents; "comes free with license purchase"); a paid Fish Rules
add-on was cancelled over a 49-hour ID turnaround (R16).

### 3.5 gear-inventory (G rows) — 26 independent handles, 6 platforms

| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Int |
|---|---|---|---|---|---|---|---|
| G1 | "Hey guys I am looking for a good inventory app?" … "I will be using it to take inventory of all my fishing tackle." … "I would like some thing that I can put the amount, size, color, and product name in." | boos1906, forums.androidcentral.com | https://forums.androidcentral.com/threads/inventory-app.33715 | 2010-09-08 | gear-inventory | missing-feature | 2 |
| G2 | "Interested in this as well" | jzajzz, androidcentral | https://forums.androidcentral.com/threads/inventory-app.33715 | 2010-09-09 | gear-inventory | missing-feature | 1 |
| G3 | "Excel Spreadsheet with Documents To Go." … "why be at the mercy of having your data locked in a mom & pop developer's closed black box proprietary format?" | Gekko, androidcentral | https://forums.androidcentral.com/threads/inventory-app.33715 | 2010-09-09 | gear-inventory | data-lock-in, manual-workaround | 2 |
| G4 | "I have no idea how mch tying stuff I have, even when I try to organize it." | DG1, flyanglersonline | https://www.flyanglersonline.com/t/my-inventory-is-growing-uh-oh/36860 | 2009-08-29 | gear-inventory | complexity | 1 |
| G5 | "did I really need that fourth hare's mask just because it was one shade a darker olive than the one I already had?" | coughlin, FAOL | https://www.flyanglersonline.com/t/my-inventory-is-growing-uh-oh/36860 | 2009-08-29 | gear-inventory | complexity (duplicate buying) | 1 |
| G6 | "I myself tend to go overboard with orders and end up with a tonne of stuff i dont use much." | DazWah, FAOL | https://www.flyanglersonline.com/t/my-inventory-is-growing-uh-oh/36860 | 2009-08-29 | gear-inventory | complexity | 1 |
| G7 | "go buy another one. bring it home, and it will find the one you knew you had." | CaseyP, FAOL | https://www.flyanglersonline.com/t/my-inventory-is-growing-uh-oh/36860 | 2009-08-29 | gear-inventory | complexity (duplicate buying) | 1 |
| G8 | "When I started, I kept a small 4x6 spiral notebook with a list of materials so I knew what I had" … "About once a year I actually take inventory (usually a snowny January weekend)" … "I'm looking at setting up an MySQL server to house my fly-Intranet." | Bass_Bug (shown as "system"), FAOL | https://www.flyanglersonline.com/t/my-inventory-is-growing-uh-oh/36860 | 2009-08-30 | gear-inventory | manual-workaround | 2 |
| G9 | "I've used Office Excel to catalog all my tying material and keep track of my tying." … "I've used Excel for seven or eight years." … "I color code items in black when new or hardly used, yellow when they are used past the halfway point" | Eight_Thumbs, FAOL | https://www.flyanglersonline.com/t/material-database/19651 ; https://www.flyanglersonline.com/t/my-inventory-is-growing-uh-oh/36860 | 2006-05-16; 2009-08-30 | gear-inventory | manual-workaround | 2 |
| G10 | "Does anyone have a free database program to keep track of materials and flypatterns?" | birddog, FAOL | https://www.flyanglersonline.com/t/material-database/19651 | 2006-05-14 | gear-inventory | missing-feature | 2 |
| G11 | "you can put all your materials in it, plus fly patterns and materials used to tie them" (SuperFly software) | jkwnt9, FAOL | https://www.flyanglersonline.com/t/material-database/19651 | 2006-05-15 | gear-inventory | manual-workaround (paid tool) | 2 |
| G12 | "Can't you create one with Microsoft 'Works' or similar spreadsheet?" | system (FAOL staff account), FAOL | https://www.flyanglersonline.com/t/material-database/19651 | 2006-05-14 | gear-inventory | manual-workaround | 1 |
| G13 | "I have to separate, count out and package myself" (bulk hooks) | lepomac, FAOL | https://www.flyanglersonline.com/t/hook-inventory-recommendations/38496 | 2009-12-14 | gear-inventory | complexity | 1 |
| G14 | "I am currently filling in holes in the inventory I want to have on hand when they become virtually completely unavailable." | gandolf, FAOL | https://www.flyanglersonline.com/t/hook-inventory-recommendations/38496 | 2009-12-15 | gear-inventory | complexity | 1 |
| G15 | "Sorted out my entire inventory into three categories - flies I use regularly and will keep," | JohnScott, FAOL (search blurb) | https://www.flyanglersonline.com/t/starting-over/32346 | 2008-10-04 | gear-inventory | manual-workaround | 2 |
| G16 | "First, I took every fly out of every box I have and separated them into 3 categories" | zaxaca, FAOL (search blurb) | https://www.flyanglersonline.com/t/how-to-orginize-your-fly-box/52005 | 2013-08-09 | gear-inventory | manual-workaround | 2 |
| G17 | "I am embarrassed to admit that I have over 60 rods." | shortrod, paflyfish.com | https://www.paflyfish.com/posts/1038714/ | 2026-07-06 | gear-inventory | complexity | 1 |
| G18 | "I have entirely too many reels that I have never used or will never use again." | gfenlikestolosepasswords, paflyfish | https://www.paflyfish.com/posts/1038714/ | 2026-07-07 | gear-inventory | complexity | 1 |
| G19 | "Didn't even realize." (counted eleven rods only while listing them) | TerrellBFly, paflyfish | https://www.paflyfish.com/posts/1038714/ | 2026-07-07 | gear-inventory | complexity | 1 |
| G20 | "used to have close to 100 now around 30 left." | sandflyx, paflyfish | https://www.paflyfish.com/posts/1038714/ | 2026-07-07 | gear-inventory | complexity | 1 |
| G21 | "Was excited for this app, paid the pro version, and I practically cant do anything on this app. So a waste of money 🙃" | TiffTiffMiller, App Store (SmartTacklebox, 1.0★/2 ratings) | https://apps.apple.com/us/app/smarttacklebox/id1021114662 | 2018-02-12 | gear-inventory | abandoned-app, too-expensive | 3 |
| G22 | "There is no way to share the data across devices or back up your tackle box." | Stormrider78, App Store (The Tackle Box) | https://apps.apple.com/us/app/the-tackle-box/id1516432631 | 2024-07-08 | gear-inventory | data-lock-in | 2 |
| G23 | "The "Name" field doesn't allow enough characters resulting in cutoff names." | KILLOW GUCCI, App Store (The Tackle Box) | https://apps.apple.com/us/app/the-tackle-box/id1516432631 | 2021-12-14 | gear-inventory | complexity | 1 |
| G24 | "Do you have a spreadsheet of what you have, or pics you can post?" (to a seller of a large tackle lot) | pitcher, charlestonfishing | https://forum.charlestonfishing.com/t/massive-inshore-nearshore-tackle-sale/76931 | 2016-11-29 | gear-inventory | manual-workaround | 1 |
| G25 | "My biggest complaint is the lack of company's listed for rods reels and baits." | Salt Water Fisher, justuseapp (ANGLR) | https://justuseapp.com/en/app/1142347232/fishing-app-anglr-logbook/reviews | n.d. | gear-inventory | missing-feature | 1 |
| G26 | "you have to make a separate entry each time you put that bait on a different rig" | MLMRyan, justuseapp (ANGLR) | https://justuseapp.com/en/app/1142347232/fishing-app-anglr-logbook/reviews | n.d. | gear-inventory | complexity | 1 |
| G27 | "I have also yet to be able to populate the 'Gear' details for a catch." | Jewcoob, justuseapp (ANGLR) | https://justuseapp.com/en/app/1142347232/fishing-app-anglr-logbook/reviews | n.d. | gear-inventory | missing-feature | 1 |
| G28 | "This practice will help get reacquainted with long-forgotten gear and the present gear." … "all tackle boxes and bags must be inspected for damage, rust, and mildew" | Tony Salerno (author), The Fisherman | https://www.thefisherman.com/article/winter-workshop-tackling-the-tackle/ | 2022-02 | gear-inventory | manual-workaround (editorial) | 1 |
| G29 | "Is there any apps out there that keeps track of your tackle and inventory?" | handle n/a (search snippet), bassresource.com | https://bassresource.com/bass-fishing-forums/topic/187059-apps | n.d. (snippet) | gear-inventory | missing-feature | 2 |

Summary: Today fly tiers run Excel inventories with colour-coded stock levels or a notebook and an
annual January count; everyone else does not know what they own and buys duplicates. They want a
simple, exportable, multi-device catalogue (photo, name, size, colour, quantity) that links gear
to catches without re-entering per rig. Price said: one-time $5.99 Pro purchases exist and get
bought (then regretted when the app fails, G21); nobody asked for a subscription.

### 3.6 gear-maintenance (M rows) — 44 independent handles, 7 platforms

| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Int |
|---|---|---|---|---|---|---|---|
| M1 | "I failed miserably" … "Any recommendations on where I can take them for a quickish fix?" … "I didn't even know shops did this." … "East county has a 8 week backlog. Ugh" | Shawnster, sdfish.org (Barrett Lake forum) | https://www.sdfish.org/viewtopic.php?p=28999 | 2026-06-16 to 2026-06-18 | gear-maintenance | complexity, (wait) | 3 |
| M2 | "Some shops do it in house while others send to different vendors." … "I've seen some places have a 1-2 month turnaround time." … "It's not too hard to get it back together as long as you have the schematics." | lazyfisherman, sdfish | https://www.sdfish.org/viewtopic.php?p=28999 | 2026-06-17 | gear-maintenance | (wait) | 2 |
| M3 | "Most tackle stores will want a few days to service a reel." … "Best bet is a friend in the know with a bit of time on his hands." | JWall, sdfish | https://www.sdfish.org/viewtopic.php?p=28999 | 2026-06-16 | gear-maintenance | manual-workaround | 1 |
| M4 | "after every 2 trips i completely tear down my reels, clean the bearings/gears and then add fresh oil/grease to them." … "How often do y'all do a complete breakdown and cleaning?" | Pescador843, charlestonfishing | https://forum.charlestonfishing.com/t/reel-maintence/83938 | 2017-12-27 | gear-maintenance | complexity (no interval standard) | 2 |
| M5 | "I grease/oil them maybe once a year." … "Honeslty I think washing them thoroughly is the main factor." | Screamingdrag, charlestonfishing | https://forum.charlestonfishing.com/t/reel-maintence/83938 | 2017-12-27 | gear-maintenance | complexity | 1 |
| M6 | "Can you guys recommend some videos or instructions on how to break down spinning reels?" … "it's making a new sound I want to figure out before it turns into something serious." | Surf_or_Fish, charlestonfishing | https://forum.charlestonfishing.com/t/reel-maintence/83938 | 2018-01-02 | gear-maintenance | complexity (symptom-driven) | 2 |
| M7 | "Where can one get a star but small enough to take screws out of the Ci4?" | Hookem_CHS, charlestonfishing | https://forum.charlestonfishing.com/t/reel-maintence/83938 | 2018-01-03 | gear-maintenance | complexity | 1 |
| M8 | "Always forget to wash them." … "Generally I wait until the bail doesn't flip smoothly." … "Usually about once a year." | Narcosis, charlestonfishing | https://forum.charlestonfishing.com/t/clean-reels-after-every-use/51998 | 2013-10-11 | gear-maintenance | manual-workaround (symptom-driven) | 2 |
| M9 | "One a year service reel and grease drag." | cobia256, charlestonfishing | https://forum.charlestonfishing.com/t/clean-reels-after-every-use/51998 | 2013-10-11 | gear-maintenance | complexity | 1 |
| M10 | "before I knew any better I bought cheap equipment…I got what I paid for" … "now I invest in my equipment and take care of it" | Bonzo72, charlestonfishing | https://forum.charlestonfishing.com/t/clean-reels-after-every-use/51998 | 2013-10-13 | gear-maintenance | complexity | 2 |
| M11 | "Rinse after every trip with a mist of water." … "do a full service type deal every other year or so." | jughed, charlestonfishing | https://forum.charlestonfishing.com/t/clean-reels-after-every-use/51998 ; https://forum.charlestonfishing.com/t/get-the-salt-out/49157 | 2013-10-14; 2013-07-17 | gear-maintenance | complexity | 1 |
| M12 | "if you don't spray them at all, they will look rough in a hurry." | Old_Cat, charlestonfishing | https://forum.charlestonfishing.com/t/clean-reels-after-every-use/51998 | 2013-10-11 | gear-maintenance | complexity | 1 |
| M13 | "There's gotta be a cheaper way dawns expensive" | tree_my_dog, charlestonfishing | https://forum.charlestonfishing.com/t/get-the-salt-out/49157 | 2013-07-16 | gear-maintenance | too-expensive | 1 |
| M14 | "I just started using "reel butter" that i got from wal mart." … "2 trips later it's seized up." … "Wont reel at all. So don't buy that crap." | ovsoldier, charlestonfishing | https://forum.charlestonfishing.com/t/get-the-salt-out/49157 | 2013-07-22 | gear-maintenance | inaccurate (bad product) | 2 |
| M15 | "I've been meaning to grab somereel cleaner though." | yakman72, charlestonfishing | https://forum.charlestonfishing.com/t/get-the-salt-out/49157 | 2013-07-19 | gear-maintenance | complexity (procrastination) | 1 |
| M16 | "What and how often do you normally clean and do maintenance on your reels after a fishing trip to the beach?" | smokinya, southfloridasharkclub.com | https://www.southfloridasharkclub.com/community/big-shark-gear/reel-maintenance/ | 2009-06-22 | gear-maintenance | complexity | 1 |
| M17 | "if you go seldom and are real careful you don't have to do it often but at least once a year" | maddawg, southfloridasharkclub | https://www.southfloridasharkclub.com/community/big-shark-gear/reel-maintenance/ | 2009-06-22 | gear-maintenance | complexity | 1 |
| M18 | "If reel is used at all, total break down and tune up during off season in winter." | RJT, southfloridasharkclub | https://www.southfloridasharkclub.com/community/big-shark-gear/reel-maintenance/ | 2009-06-22 | gear-maintenance | complexity | 1 |
| M19 | "Penn parts are getting more costly." | Pantyhosesharker, southfloridasharkclub | https://www.southfloridasharkclub.com/community/big-shark-gear/reel-maintenance/ | 2009-06-22 | gear-maintenance | too-expensive | 1 |
| M20 | "Does anybody know anywhere in the midlands that does reel servicing" | ReelScout16, charlestonfishing | https://forum.charlestonfishing.com/t/columbia-reel-servicing/60137 | 2014-09-25 | gear-maintenance | missing-feature (no local service) | 2 |
| M21 | "Most reels aren't that hard to repair. The hard part, many times, is finding parts for them." | Spoonmaster, charlestonfishing | https://forum.charlestonfishing.com/t/columbia-reel-servicing/60137 | 2014-09-25 | gear-maintenance | missing-feature (parts) | 2 |
| M22 | "Hey everyone, I was wondering if anyone knew a good place to take a reel to be serviced?" | AlwaysGrouperFishing, charlestonfishing | https://forum.charlestonfishing.com/t/reel-service/77551 | 2017-01-03 | gear-maintenance | missing-feature | 2 |
| M23 | "When I took an Avet to Haddrell's, they sent it into Avet to get the bearings done." | Rapchizzle, charlestonfishing | https://forum.charlestonfishing.com/t/reel-service/77551 | 2017-01-03 | gear-maintenance | (wait, two-hop service) | 2 |
| M24 | "if all you need is clean and lube, no need to spend $35 plus shipping for an Avet." … "Give it a look and try it yourself, Avets are easy to work on." | Long_Enuff, charlestonfishing | https://forum.charlestonfishing.com/t/reel-service/77551 | 2017-01-04 | gear-maintenance | too-expensive | 2 |
| M25 | "Who do you use for reel service/repair?" … "So I was thinking I would just have the wife drop it off to be serviced" | brav302, charlestonfishing | https://forum.charlestonfishing.com/t/reels/38461 | 2012-05-18/20 | gear-maintenance | missing-feature | 2 |
| M26 | "It might take a while @ Haddrell's, I was on a 5 week wait." | in_the_grass, charlestonfishing | https://forum.charlestonfishing.com/t/reels/38461 | 2012-05-20 | gear-maintenance | (wait) | 2 |
| M27 | "End of an era for many of us." … "I've had my reels serviced by him for as long as I can remember." | Apickett, charlestonfishing (reel repairman retiring) | https://forum.charlestonfishing.com/t/mr-blocker-has-officially-retired/28976 | 2010-10-24 | gear-maintenance | abandoned (service succession) | 2 |
| M28 | "The man worked on 3 generations of my family's reels." … "Avet's 35 dollar flat fee per reel service is hard to beat too." … "All bearings replaced whether they need it or not, and reel cleaned up and lubed for 35 bucks." | Phin, charlestonfishing | https://forum.charlestonfishing.com/t/mr-blocker-has-officially-retired/28976 ; https://forum.charlestonfishing.com/t/bottom-fishing-rod-reel-setup/38698 | 2010-10-25; 2012-06-01 | gear-maintenance | (WTP) | 3 |
| M29 | "I think they are a little backed up at the moment with allot of people getting their reels serviced." … "Haddrels does a diagnostic fee for 10 bucks." | runbabyrun, charlestonfishing | https://forum.charlestonfishing.com/t/all-sold/78101 | 2017-01-31 | gear-maintenance | (wait) | 2 |
| M30 | "All 3 reels just fully serviced by Haddrell's Point & Tackle in Mount Pleasant SC ($90 spent for all 3)." | retired_young, charlestonfishing | https://forum.charlestonfishing.com/t/sold-2-shimano-stradic-ci4-3000s-1-shimano-c/75430 | 2016-09-13 | gear-maintenance | (WTP) | 3 |
| M31 | "Steve, I have a 1000 frame Penn Battle that is in need of TLC." … "It is not as smooth as it once was." | fishtales, charlestonfishing | https://forum.charlestonfishing.com/t/penn-fishing-reel-parts-service-and-warranty/43360 | 2012-11-26 | gear-maintenance | (symptom-driven) | 2 |
| M32 | "What is the charge for a service on a Sargus 3000?" (shop reply: "a straight clean and lube full service on it would be $20.") | DFreedom, charlestonfishing | https://forum.charlestonfishing.com/t/full-service-for-spring/44699 | 2013-01-30 | gear-maintenance | (WTP enquiry) | 2 |
| M33 | "But, if I can't get one serviced it's kind of throwing money away." … "Any solutions other than learning to do it myself (which ain't gonna happen)?" … "needs to be someone who can get parts from Japan too." | EBHarvey, stripersonline Reel Maintenance and Repair | https://www.stripersonline.com/surftalk/topic/918266-will-anyone-service-jdm-shimanos/ | 2026-06-20 | gear-maintenance | missing-feature (service access) | 3 |
| M34 | "Shimano had told me that they won't service JDM reels in the US." … "Youe option is to find a local shop or service it yourself." | bellows, stripersonline | https://www.stripersonline.com/surftalk/topic/918266-will-anyone-service-jdm-shimanos/ | 2026-06-20 | gear-maintenance | missing-feature | 2 |
| M35 | "I'm in Australia where there's no Van Staal service support so I was on my own" … "I stripped two of the plastic wrenches before I got it open." | snowy, stripersonline | https://www.stripersonline.com/surftalk/topic/913338-van-staal-vr-service/ | 2026-02-16/19 | gear-maintenance | missing-feature, complexity | 2 |
| M36 | "on both reels I couldn't loosen the nut, both stripped-out plastic VR wrench." … "I also have to drop off a VS200 for service so that is what I'm going to do." | no name, stripersonline | https://www.stripersonline.com/surftalk/topic/913338-van-staal-vr-service/ | 2026-02-13/16 | gear-maintenance | complexity | 2 |
| M37 | "Is the only way to service an old VS nowadays to send it in to someone you know." | brickk, stripersonline | https://www.stripersonline.com/surftalk/topic/922240-van-staal-service/ | 2026-10-12 | gear-maintenance | missing-feature | 2 |
| M38 | "I really got tired of cleaning the handle bearings every year" … "Think they charged me $1 a piece if I ordered a 10 pack." | DerrickT, stripersonline | https://www.stripersonline.com/surftalk/topic/885761-where-to-buy-good-bearings/ | 2024-04-29 | gear-maintenance | complexity | 2 |
| M39 | "Where do you guys buy your bearings." … "I am currently looking for 4 x 7 x 2.5 probably 10 packs." | Cadman T, stripersonline | https://www.stripersonline.com/surftalk/topic/885761-where-to-buy-good-bearings/ | 2024-04-18 | gear-maintenance | missing-feature (parts) | 2 |
| M40 | "Has anyone measured or know the bearing dimensions for Van Staal vs200bx2 reel?" … "it really helps to know what dimension to order and quantity." | Drycounty71, stripersonline | https://www.stripersonline.com/surftalk/topic/885761-where-to-buy-good-bearings/ | 2025-09-25 | gear-maintenance | missing-feature (specs) | 2 |
| M41 | "I wish you titled it where to buy good bearings  cheap..." | R.R. Bridge Fisher, stripersonline | https://www.stripersonline.com/surftalk/topic/885761-where-to-buy-good-bearings/ | 2024-04-28 | gear-maintenance | too-expensive | 1 |
| M42 | "That is state of Shimano USA customer service these days" … "the shimano USA themselves didn't know anything about the shims and weren't even bothered to check" | Busanga, stripersonline Main Forum | https://www.stripersonline.com/surftalk/topic/922315-having-a-right-back-and-forth-with-shimano-usa/ | 2026-10-15 (Thursday, year from forum index) | gear-maintenance | inaccurate (OEM support) | 2 |
| M43 | "wondering what products you all use to clean and grease your spinning reel gears and drag washers." | 27conch, stripersonline | https://www.stripersonline.com/surftalk/topic/913092-spinning-reel-maintenance-questions/ | 2026-02-07 | gear-maintenance | complexity | 1 |
| M44 | "Dont wait till March to get your reels serviced." … "So get them in for service now and beat the spring rush." | HaddrellsFan (Steve Baysinger, repair shop manager), charlestonfishing | https://forum.charlestonfishing.com/t/full-service-for-spring/44699 | 2013-01-29 | gear-maintenance | (seasonal backlog, shop voice) | 2 |
| M45 | "Spinning reels will be $15 (regularly $18) labor and Lever Drag reels will be $20 (reg $25) labor." | ReelHunter (Scott Hammond, Haddrell's West Ashley), charlestonfishing | https://forum.charlestonfishing.com/t/reel-service-special/24605 | 2009-12-04 | gear-maintenance | (price anchor) | 1 |
| M46 | "We recommend that people have their reels serviced at least annually, depending on the use." … "Not doing so can fall under the 'neglect' category and void a warranty." … "Please allow for at least four weeks turnaround (longer during summer) with all reel servicing." … "A general service starts at $75." … "Items that are not collected after three months will be sold/disposed of to cover costs." | Marine Deals (NZ retailer help centre) | https://help.marine-deals.co.nz/support/solutions/articles/44002335033-all-about-reel-servicing | n.d. (accessed 2026-10-20) | gear-maintenance | (shop voice: backlog, uncollected reels) | 2 |
| M47 | "Mono and even braided line neglect is a common cause of angler misery." … "Fishing rods are pretty much forgotten about during the winter season." … "At least once a year, quality saltwater reels should be taken to a tackle professional for a complete tune-up." | Tony Salerno, The Fisherman | https://www.thefisherman.com/article/winter-workshop-tackling-the-tackle/ | 2022-02 | gear-maintenance | complexity (editorial) | 1 |
| M48 | "I keep track of my reel maintenance on one but that's about it for me. I choose not to take time away from fishing to record data." (spreadsheet) | handle n/a (search snippet), bassresource.com | https://www.bassresource.com/bass-fishing-forums/topic/151461-fishing-logs/ | n.d. (snippet) | gear-maintenance | manual-workaround | 2 |
| M49 | "Our current turnaround is 20-30 business days this can vary depending on workload." | Daiwa Australia service page (search snippet; page returned 429 on fetch) | https://daiwafishing.com.au/pages/service-spare-parts-and-repair-forms | n.d. | gear-maintenance | (OEM backlog) | 1 |

Summary: Today anglers service reels on a symptom ("wait until the bail doesn't flip smoothly"),
an annual/off-season habit, or never; they ask forums where to get service, wait 5–8 weeks or
20–30 business days, hunt for parts and bearing sizes, and lose access when a repairman retires
or an OEM refuses grey-market reels. Nobody described tracking service dates except one
spreadsheet user. They want a trusted local tech with a known price and a short, honest
turnaround, parts/schematics by model, and someone to tell them when service is due. Price
said: $15–$35 per reel labour accepted; $75 NZ; $35 + shipping too much for a clean-and-lube.

### 3.7 tournament (T rows) — 18 independent handles, 5 platforms (one club dominates; see caveat)

| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Int |
|---|---|---|---|---|---|---|---|
| T1 | "We weigh fish to hundreds of a pound, which means the tournament directors will really need to be on their toes" … "If running a leaderboard is too much effort for two tournament directors" | Reality_Bites, charlestonfishing (Midlands Striper Club) | https://forum.charlestonfishing.com/t/2015-tournaments/61884 | 2014-12-12 | tournament | complexity | 2 |
| T2 | "It does take some effort and there is equipment to haul around." … "TD's just cannot do it without significantly slowing down the weigh in process." … "At a cost of $2700 plus carrying case I am not sure that is something we would want to spend our money on." … "As long as I am TD I will still use the paper forms as well as a tracking model." … "special thanks to Van Cook for building the new scoring model. Much easier for the TD's and displays much better data." … "I should have had a list to sign in. We will do that next time." | Chipman (tournament director), charlestonfishing | https://forum.charlestonfishing.com/t/2015-tournaments/61884 ; https://forum.charlestonfishing.com/t/february-tournament-results/63124 ; https://forum.charlestonfishing.com/t/march-tournament-results/55392 | 2014-12-12 to 2015-02-24; 2014-03-17 | tournament | manual-workaround, too-expensive | 2 |
| T3 | "I am sure many of us could make a spreadsheet for scoring" … "a good software program designed to tally the weights and put them in order quickly" … "computes the placement of all entries and winners, points awarded, & the payouts automatically" … "it's half the workload" … "I promised Joby no more tweaks or changes for a couple weeks" | VanMan (built the club's Excel scoring model), charlestonfishing | https://forum.charlestonfishing.com/t/2015-tournaments/61884 ; https://forum.charlestonfishing.com/t/february-tournament-results/63124 | 2014-12-14 to 2015-03-06 | tournament | manual-workaround | 3 |
| T4 | "I will see what kind of program we could design" … "Riff was nominated and ran unopposed because no one wants to do the tournament director job." | shipwreck, charlestonfishing | https://forum.charlestonfishing.com/t/2015-tournaments/61884 ; https://forum.charlestonfishing.com/t/tournament-director/73298 | 2014-12-12; 2016-06-15 | tournament | complexity | 3 |
| T5 | "I always advocated the club purchase a laptop for the TX directors to use and enter the info at the weigh-ins." | wildlifesc, charlestonfishing | https://forum.charlestonfishing.com/t/2015-tournaments/61884 | 2014-12-13 | tournament | manual-workaround | 2 |
| T6 | "I can imagine that extra load on the tx directors for this." | Murrymaker, charlestonfishing | https://forum.charlestonfishing.com/t/2015-tournaments/61884 | 2014-12-13 | tournament | complexity | 1 |
| T7 | "Maybe an additional TD or sub committee could handle the leader board" … "Danny and Liz have a thankless tough job" | Tom_Gitto, charlestonfishing | https://forum.charlestonfishing.com/t/2015-tournaments/61884 ; https://forum.charlestonfishing.com/t/tournament-director/73298 | 2014-12-14; 2016-06-09 | tournament | complexity | 2 |
| T8 | "Even if you nominated two more directors it will still be a challenge" … "please go to your respective App Stores and download this app" (AtTheRamp, "in early development", "geared more towards Bass Clubs") | Lawcrusher, charlestonfishing | https://forum.charlestonfishing.com/t/2015-tournaments/61884 ; https://forum.charlestonfishing.com/t/new-fishing-club-app/81964 | 2014-12-14; 2017-08-14 | tournament | complexity (adopted an app) | 3 |
| T9 | "Only recommendation I would make is sort it by highest total weight, per tournament and YTD." | Rick_K, charlestonfishing | https://forum.charlestonfishing.com/t/february-tournament-results/63124 | 2015-03-05 | tournament | missing-feature | 1 |
| T10 | "There is a correction in the TOTY standings." … "No sheet –no points." … "Remember tournament directors must know Friday night anyone fishing who has not prepaid for the tournament." | motleyfan81, charlestonfishing | https://forum.charlestonfishing.com/t/toty-standings-correction/77345 ; https://forum.charlestonfishing.com/t/march-msc-tournament/71327 | 2016-12-21; 2016-03-15 | tournament | manual-workaround | 2 |
| T11 | "Our tournament spreadsheet didn't get hacked by the Russians did it?" | Jon_Boy, charlestonfishing | https://forum.charlestonfishing.com/t/toty-standings-correction/77345 | 2016-12-21 | tournament | inaccurate (standings errors) | 1 |
| T12 | "Thanks for all you do to keep this stuff straight every tournament." | Billfish_OBX, charlestonfishing | https://forum.charlestonfishing.com/t/corrected-ytd-points/63618 | 2015-03-24 | tournament | complexity | 1 |
| T13 | "the tournament committee is meeting in July to audit the points going into the sailfish tournament." | SCSSA (club account), charlestonfishing | https://forum.charlestonfishing.com/t/scssa-summer-oceanic-results/32489 | 2011-06-22 | tournament | manual-workaround | 1 |
| T14 | "The only criticism we heard from anglers was the website didn't automatically reload for them." … "One thing I would like to see is have the ability for anglers to pre-register for the tournament." … "It truly is free to use without annoying ads." | 19JL47, App Store (Weighfish) | https://apps.apple.com/us/app/weighfish-fishing-tournament-manager/id1355191001 | 2021-02-28 | tournament | missing-feature | 2 |
| T15 | "Good amount of tournaments. Poor app. Some tournament interfaces are fine. Some are half off of the screen." | Hnrhxuhebdjujs, App Store (iAngler Tournament, 2.8★) | https://apps.apple.com/us/app/iangler-tournament/id872669180 | 2019-01-10 | tournament | inaccurate | 2 |
| T16 | "none of the tournaments will pull up I click view and it just loads for ever never can see one" | e104kinglife, App Store (iAngler Tournament) | https://apps.apple.com/us/app/iangler-tournament/id872669180 | 2021-04-01 | tournament | inaccurate | 2 |
| T17 | "I can't save my address so that I can search tournaments near me." | does it matter!@#, App Store (iAngler Tournament) | https://apps.apple.com/us/app/iangler-tournament/id872669180 | 2018-10-31 | tournament | missing-feature | 1 |
| T18 | "I have email them 4 times no response as to how many places are been paid and how much for 2nd no answer" | ADRIAN ALVAREZ, justuseapp (TourneyX PRO) | https://justuseapp.com/en/app/1478882171/tourneyx-pro/reviews | 2021-06-19 | tournament | complexity (payout opacity) | 2 |
| T19 | "Just had a tournament with 123 boats and it worked flawlessly!!!" | Westside Bassmasters, App Store (Weighfish) | https://apps.apple.com/us/app/weighfish-fishing-tournament-manager/id1355191001 | 2021-08-06 | tournament | (satisfied) | 3 |
| T20 | Job posting for a "bass fishing tournament management app" with automated payouts, AOY/TOY standings and PDF/spreadsheet exports; "21 quotes received" | handle n/a (search snippet; page 403), guru.com | https://www.guru.com/jobs/bass-fishing-tournament-management-app/2119825 | n.d. (snippet) | tournament | missing-feature | 3 |
| T21 | "Creel Points, Attendance Points, 1st Place Points, 2nd Place Points, etc." (tie-break order); "Each angler will receive 3 points for each legal fish weighed-in, to a maximum of 9 points (3 fish) per day." | Hawg Hawlers Bass Club rules page (club site) | https://www.hawghawlers.com/points.html | 2013 (copyright) | tournament | complexity (rules) | 1 |

Caveat: T1–T13 are one club (MSC) on one forum over 2011–2017; they are rich but not independent
across platforms. The App Store rows add 5 more handles on 3 apps. BassResource/Reddit bass-club
voices were unreachable.

Summary: Today small clubs run weigh-ins on paper forms plus a member-built Excel model, post
standings and corrections to a forum, and audit points by committee; directors burn out. They
want weigh-in entry that is as fast as paper, automatic points/payouts/AOY, pre-registration,
prepaid-entry tracking and a live leaderboard, free of ads. Price said: refused $2,700 hardware
(T2); Weighfish director tiers $9.99/mo–$69.99/yr exist (I98) and get 5-star reviews from clubs.

### 3.8 club-admin (C rows) — 15 independent handles, but 1 forum + 2 vendor pages (provisional)

| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Int |
|---|---|---|---|---|---|---|---|
| C1 | "Danny has decided to step down as our co-tournament director." … "we will hold nominations and elections at the June meeting." | gar-heart, charlestonfishing (MSC) | https://forum.charlestonfishing.com/t/tournament-director/73298 | 2016-06-07 | club-admin | complexity (officer churn) | 1 |
| C2 | "Doesn't that mean we ask for nominations at the June meeting and vote at the July meeting?" … "Two tournament directors is optional, otherwise the bylaws would state that we are to have two tournament directors." | Reality_Bites, charlestonfishing | https://forum.charlestonfishing.com/t/tournament-director/73298 | 2016-06-15 | club-admin | complexity (bylaws) | 1 |
| C3 | "Riff was nominated and ran unopposed because no one wants to do the tournament director job." | shipwreck, charlestonfishing | https://forum.charlestonfishing.com/t/tournament-director/73298 | 2016-06-15 | club-admin | complexity | 2 |
| C4 | "Danny and Liz have a thankless tough job" | Tom_Gitto, charlestonfishing | https://forum.charlestonfishing.com/t/tournament-director/73298 | 2016-06-09 | club-admin | complexity | 1 |
| C5 | "Riff and Liz managed the Leader Board in 2015" … "make sure you input your City & State information." | Lawcrusher, charlestonfishing | https://forum.charlestonfishing.com/t/tournament-director/73298 ; https://forum.charlestonfishing.com/t/new-fishing-club-app/81964 | 2016-06-15; 2017-08-14 | club-admin | manual-workaround | 2 |
| C6 | "All teams must turn in a Tournament Entry Form to receive points for that month's tournament" … "No sheet –no points." … "Remember tournament directors must know Friday night anyone fishing who has not prepaid for the tournament." | motleyfan81, charlestonfishing | https://forum.charlestonfishing.com/t/march-msc-tournament/71327 | 2016-03-15 | club-admin | manual-workaround | 2 |
| C7 | "If you fished and did not get points and did not weigh in fish please let me know." … "I should have had a list to sign in. We will do that next time." … "I had corrected the spelling of Team Pitt Crew which was mispelled in February." … "Just one the the things we have to figure out since we have grown so much." | Chipman, charlestonfishing | https://forum.charlestonfishing.com/t/march-tournament-results/55392 ; https://forum.charlestonfishing.com/t/corrected-ytd-points/63618 ; https://forum.charlestonfishing.com/t/february-tournament-results/63124 | 2014-03-17; 2015-03-24; 2015-02-24 | club-admin | manual-workaround, inaccurate | 2 |
| C8 | "Thanks for the work on the stats!!" | awscwi94, charlestonfishing | https://forum.charlestonfishing.com/t/corrected-ytd-points/63618 | 2015-03-25 | club-admin | complexity | 1 |
| C9 | "Thanks for all you do to keep this stuff straight every tournament." | Billfish_OBX, charlestonfishing | https://forum.charlestonfishing.com/t/corrected-ytd-points/63618 | 2015-03-24 | club-admin | complexity | 1 |
| C10 | "There is no waiting list for Summerville so far. As we grow we will cap it, but we are not there yet." … "contact our Membership director Neal at sswamembership@gmail.com" | Optiker (SSWA officer), charlestonfishing | https://forum.charlestonfishing.com/t/any-saltwater-clubs-taking-new-members/54593 | 2014-02-06 | club-admin | manual-workaround (email/membership) | 1 |
| C11 | "I thought I saw where Summerville had a waiting list though. But I could try and contact them." … "I just looked at there site and will call the contact # they have up tomorrow." | Foxtrot24, charlestonfishing | https://forum.charlestonfishing.com/t/any-saltwater-clubs-taking-new-members/54593 | 2014-02-05 | club-admin | complexity (discoverability) | 1 |
| C12 | "I'll be at the Membership table, so please drop by." | Crimson_Tide, charlestonfishing | https://forum.charlestonfishing.com/t/any-saltwater-clubs-taking-new-members/54593 | 2014-02-06 | club-admin | manual-workaround | 1 |
| C13 | "events targeted specifically for youths that are free to them with family membership." … "If you aren't certain whether you want to join come by and check out our meeting and then decide." | Vinman, charlestonfishing | https://forum.charlestonfishing.com/t/any-saltwater-clubs-taking-new-members/54593 | 2014-02-06 | club-admin | (membership tiers) | 1 |
| C14 | "We meet on the second Monday of the month in James Island, We have members from all over the lowcountry." (+ club website) | kamakozee, charlestonfishing | https://forum.charlestonfishing.com/t/any-saltwater-clubs-taking-new-members/54593 | 2014-02-06 | club-admin | manual-workaround | 1 |
| C15 | "Our tournament spreadsheet didn't get hacked by the Russians did it?" | Jon_Boy, charlestonfishing | https://forum.charlestonfishing.com/t/toty-standings-correction/77345 | 2016-12-21 | club-admin | inaccurate | 1 |
| C16 | "Make a reservation and view menu, View and pay your bill, View calendar of events, Sign up for Club parties, contests and more, Update your member profile, View member directory and contact info" (custom club app, no ratings) | The Belmar Fishing Club Inc, App Store listing | https://apps.apple.com/us/app/belmar-fishing-club/id6761139117 | n.d. (accessed 2026-10-20) | club-admin | manual-workaround (built own app) | 3 |
| C17 | Thread "Ditch Troll Membership List" kept as a forum thread since 2016 (title only) | Ditch Trolls club sub-forum, stripersonline | https://www.stripersonline.com/surftalk/topic/642408-ditch-troll-membership-list/ | 2016-02-11 | club-admin | manual-workaround | 1 |

Summary: Today club admin is volunteers, bylaws arguments, forum posts for standings and
corrections, email addresses for membership, a thread as the membership list, and in one
affluent case a bespoke app. They want (implicitly) fewer thankless officer hours: prepaid-entry
tracking, sign-in lists, standings that don't need public corrections, and easier recruiting. No
price signal found; the only spend seen is the custom Belmar app (C16). This job did NOT reach
three independent complaint platforms; treat as provisional.

### 3.9 guide-booking (B rows) — 21 independent handles, 4 platforms

| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Int |
|---|---|---|---|---|---|---|---|
| B1 | "Mentioning it is downpayment but that is the money they make." … "The more commission the charter company pays to them the higher the ranking will be on the platform" | Charles Heldewier (captain; FishingBooker reply addresses "Captain Charles"), Trustpilot | https://www.trustpilot.com/review/fishingbooker.com | 2026-09-26 | guide-booking | too-expensive | 3 |
| B2 | "it shows customers the captains that pay fishbooker the most money. I would not advise any captain to use this platform." | AA Fishing Charter Aquaholics (operator), Trustpilot | https://www.trustpilot.com/review/fishingbooker.com?stars=1&stars=2 | 2026-06-02 | guide-booking | too-expensive | 3 |
| B3 | "Terrible customer service and high fees." | JL, Trustpilot (FishingBooker) | https://www.trustpilot.com/review/fishingbooker.com | 2026-05-20 | guide-booking | too-expensive | 2 |
| B4 | "I cancelled and could not get a refund, even though the trip would not have been as advertised." | Gold Attic, Trustpilot | https://www.trustpilot.com/review/fishingbooker.com | 2026-09-13 | guide-booking | complexity (cancellation) | 2 |
| B5 | "neither the captain nor FishingBooker were willling to offer a full refund." | Simon S, Trustpilot | https://www.trustpilot.com/review/fishingbooker.com | 2026-08-15 | guide-booking | complexity | 2 |
| B6 | "only to find out that the charter already had a trip planned." | Matthew Chetty, Trustpilot | https://www.trustpilot.com/review/fishingbooker.com | 2026-08-08 | guide-booking | inaccurate (double booking) | 2 |
| B7 | "The company refuses to let me leave a review because the boat captain canceled the trip." | ashley morris, Trustpilot | https://www.trustpilot.com/review/fishingbooker.com | 2026-08-18 | guide-booking | complexity | 2 |
| B8 | "I had a trip coming up that had conflicting information about my booking time." | Cary Henry, Trustpilot | https://www.trustpilot.com/review/fishingbooker.com | 2026-09-06 | guide-booking | inaccurate | 2 |
| B9 | "Captain never showed up, and did not respond to phone calls." | Lee, Trustpilot | https://www.trustpilot.com/review/fishingbooker.com?page=2&stars=1 | 2025-04-20 | guide-booking | inaccurate (no-show) | 3 |
| B10 | "No one contacted us about location and then next morning boat was no running for mechanical issues." | Gordon Nixon, Trustpilot | https://www.trustpilot.com/review/fishingbooker.com?page=2&stars=1 | 2024-03-11 | guide-booking | complexity (comms) | 2 |
| B11 | "the third party piece of crap did not send any emails or notifications about the cancellation" | Albert Wang, Trustpilot | https://www.trustpilot.com/review/fishingbooker.com?page=2&stars=1 | 2024-07-02 | guide-booking | complexity (comms) | 2 |
| B12 | "Captain accepts an order, then there was no communication from his." … "Then on day of trip we show up at Marina and captain was missing." | Alex Lukonen, Trustpilot | https://www.trustpilot.com/review/fishingbooker.com?page=2&stars=1 | 2022-12-07 | guide-booking | inaccurate (no-show) | 3 |
| B13 | "Do NOT wait at the pick up location assuming your guide will show." … "he responded that he was never told about our reservation." | Carol, Trustpilot | https://www.trustpilot.com/review/fishingbooker.com?page=2&stars=1 | 2022-07-30 | guide-booking | inaccurate (sync failure) | 3 |
| B14 | "Can't communicate normally with people it's block all messages." | Ramzan Vasso, Trustpilot | https://www.trustpilot.com/review/fishingbooker.com?page=2&stars=1 | 2022-07-02 | guide-booking | complexity | 2 |
| B15 | "Some charters advertise species they either cannot legally target" | Todd S, Trustpilot | https://www.trustpilot.com/review/fishingbooker.com | 2026-09-24 | guide-booking | inaccurate | 1 |
| B16 | "he calls the morning of the trip while I am driving to meet him to tell me" … "I have a close mutual friend who said he double booked for that day." | shrimpchoppin, charlestonfishing | https://forum.charlestonfishing.com/t/murrells-inlet-guide/73622 | 2016-06-24; 2016-08-02 | guide-booking | inaccurate (double booking) | 2 |
| B17 | "you don't build a good business by dbl booking clients." | mtodd, charlestonfishing | https://forum.charlestonfishing.com/t/murrells-inlet-guide/73622 | 2016-08-03 | guide-booking | complexity | 1 |
| B18 | "Before TripWorks, we had all kinds of trouble communicating with our customers." … "We were always having to chase them down individually with updates about bad weather, cancellations, rescheduling trips..." … "And since we had no way of saving their credit card information upfront, we lost a lot of business to no-call, no shows." | Hunter, Poseidon Fishing Charters (vendor case study, TripWorks) | https://www.tripworks.com/case-study/platform-grows-with-my-business | n.d. (accessed 2026-10-20) | guide-booking | manual-workaround | 3 |
| B19 | "I got no response to my e-mails." | cancom, flyanglersonline | https://www.flyanglersonline.com/t/what-do-you-expect-from-a-guided-trip/12451 | 2005-03-14 | guide-booking | complexity (comms) | 1 |
| B20 | "What is cancellation policy?" (list of what a guide should state up front) | fcch, flyanglersonline | https://www.flyanglersonline.com/t/what-do-you-expect-from-a-guided-trip/12451 | 2005-03-08 | guide-booking | complexity | 1 |
| B21 | "he should tell the client that at the time of the booking, not when the client arrives at the fly shop." | Bob_Widmaier, flyanglersonline | https://www.flyanglersonline.com/t/what-do-you-expect-from-a-guided-trip/12451 | 2005-03-09 | guide-booking | complexity | 1 |
| B22 | "FISHING BOOKER has turned out to be such a vital asset to the business." | Jason LaMagna (operator), Trustpilot | https://www.trustpilot.com/review/fishingbooker.com?page=2&stars=1 | 2026-02-03 | guide-booking | (satisfied) | 3 |

Summary: Today customers book via a marketplace (10%+ commission) and still hit double bookings,
no-shows and missing cancellation notices; captains resent ranking-by-commission and pay for
booking software to hold cards and automate weather messages. Both sides want reliable two-way
communication, clear cancellation terms and deposits. Price said: captains accept flat-fee
software (TripWorks class) and object to percentage commissions.

### 3.10 guide-ops (O rows) — 13 independent handles, 5 platforms (first-person admin pain thin)

| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Int |
|---|---|---|---|---|---|---|---|
| O1 | "To get your OUPV license you must have 360 days of documented time on the water." … "I used to average of 300 trips a year and seldom cancelled for weather." … "get bait and ice rounded up and ready for tomorrow." … "Boat payments, dockage, insurance, house payments, living expenses, everything still goes on in the winter." … "In a good season you can make a lot of money, then you blow an engine, bust a prop, or shaft, or rudder." | Cracker_Larry (retired charter captain), charlestonfishing | https://forum.charlestonfishing.com/t/career-searching/62670 | 2015-01-28/29 | guide-ops | complexity | 2 |
| O2 | "Just not knowing whether you will have enough to pay the bills from week to week is enough for me to not want to do it." | tigerfin, charlestonfishing | https://forum.charlestonfishing.com/t/career-searching/62670 | 2015-01-28 | guide-ops | complexity | 1 |
| O3 | "I would start from the business aspect rather than the product aspect." | LunaSea83, charlestonfishing | https://forum.charlestonfishing.com/t/career-searching/62670 | 2015-01-28 | guide-ops | complexity | 1 |
| O4 | "you see the strain of stress on the captains face." | claim, charlestonfishing | https://forum.charlestonfishing.com/t/career-searching/62670 | 2015-01-28 | guide-ops | complexity | 1 |
| O5 | "I have to be able to catch em 24/7/365." | Dockman (guide), charlestonfishing | https://forum.charlestonfishing.com/t/career-searching/62670 | 2015-01-29 | guide-ops | complexity | 1 |
| O6 | "Fishing for fun is a loooot different than fishing as a job." | Rapchizzle, charlestonfishing | https://forum.charlestonfishing.com/t/career-searching/62670 | 2015-01-29 | guide-ops | complexity | 1 |
| O7 | "Just make sure and keep a part time job…" | troutman3, charlestonfishing | https://forum.charlestonfishing.com/t/career-searching/62670 | 2015-01-29 | guide-ops | complexity | 1 |
| O8 | "I run a fishing guide service, and need to figure out the appropriate category to categorize gas" … "purchased for the boat used for fishing trips." | jstarwalt, QuickBooks Community | https://quickbooks.intuit.com/learn-support/en-us/reports-and-accounting/how-do-i-categorize-boat-gas-fishing-guide-service/00/1015468 | 2022-01-19 | guide-ops | complexity (bookkeeping) | 2 |
| O9 | "It was a mess." (customer comms before software; see B18) | Hunter, Poseidon Fishing Charters (TripWorks case study) | https://www.tripworks.com/case-study/platform-grows-with-my-business | n.d. | guide-ops | manual-workaround | 3 |
| O10 | "Increasingly I'm seeing this same thing on my charters. And that's a real shame." … "His phone was dinging, buzzing and ringing every couple minutes and he was helpless to ignore it." | Scott Null (guide), Texas Saltwater Fishing Magazine | https://www.texassaltwaterfishingmagazine.com/fishing/by-type/opinion-narrative/please-leave-message | 2016-03 | guide-ops | (client experience) | 1 |
| O11 | guide "used his cell phone to make 3 personal calls while on the water." … "hardly spoke during the whole trip, even when a direct question was asked." | Litehen55, flyanglersonline | https://www.flyanglersonline.com/t/what-do-you-expect-from-a-guided-trip/12451 | 2005-03-10 | guide-ops | (service quality) | 1 |
| O12 | "I have several local clients that prefer to hire me over having their own boat." | CaptFritz (guide), charlestonfishing (search blurb) | https://forum.charlestonfishing.com/t/i-might-need-to-get-my-boga-checked-out/57003 | 2014-05-20 | guide-ops | (repeat-client base) | 1 |
| O13 | "For someone needing to get a client list going, there is no better way in this day and age." (Groupon for guides) | Too_Busy, charlestonfishing (search blurb) | https://forum.charlestonfishing.com/t/groupon-poof/35126 | 2011-11-12 | guide-ops | manual-workaround (marketing) | 2 |

Summary: Today guides juggle licensing paperwork, daily bait/ice/fuel logistics, seasonal cash
swings, QuickBooks categorisation and client messaging by phone; the only first-person software
pain found is bookkeeping (O8) and pre-software comms (O9, vendor-published). They want steadier
bookings and less chasing. No price signal beyond adopting TripWorks-class tools. Thin: no
guide-only forum was reachable.

### 3.11 shop-ops (S rows) — 19 independent handles, 6 platforms (customer-side; no first-person tech software complaint found)

| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Int |
|---|---|---|---|---|---|---|---|
| S1 | "Weather you need a complete overhaul or simple repair I can have you on the water." … "Dont wait till March to get your reels serviced." … "So get them in for service now and beat the spring rush." | HaddrellsFan (Steve Baysinger, Repair Shop Manager, Haddrell's Point Tackle), charlestonfishing | https://forum.charlestonfishing.com/t/penn-fishing-reel-parts-service-and-warranty/43360 ; https://forum.charlestonfishing.com/t/full-service-for-spring/44699 | 2012-11-15; 2013-01-29 | shop-ops | (seasonal demand smoothing) | 2 |
| S2 | "Spinning reels will be $15 (regularly $18) labor and Lever Drag reels will be $20 (reg $25) labor." … "a straight clean and lube full service on it would be $20." | ReelHunter (Scott Hammond, Haddrell's West Ashley), charlestonfishing | https://forum.charlestonfishing.com/t/reel-service-special/24605 ; https://forum.charlestonfishing.com/t/full-service-for-spring/44699 | 2009-12-04; 2013-01-31 | shop-ops | (pricing; off-season promo) | 1 |
| S3 | "I think they are a little backed up at the moment with allot of people getting their reels serviced." … "Haddrels does a diagnostic fee for 10 bucks." | runbabyrun, charlestonfishing | https://forum.charlestonfishing.com/t/all-sold/78101 | 2017-01-31 | shop-ops | (backlog) | 2 |
| S4 | "It might take a while @ Haddrell's, I was on a 5 week wait." | in_the_grass, charlestonfishing | https://forum.charlestonfishing.com/t/reels/38461 | 2012-05-20 | shop-ops | (backlog) | 2 |
| S5 | "East county has a 8 week backlog. Ugh" | Shawnster, sdfish | https://www.sdfish.org/viewtopic.php?p=28999 | 2026-06-18 | shop-ops | (backlog) | 3 |
| S6 | "Some shops do it in house while others send to different vendors." … "I've seen some places have a 1-2 month turnaround time." | lazyfisherman, sdfish | https://www.sdfish.org/viewtopic.php?p=28999 | 2026-06-17 | shop-ops | (backlog, outsourcing) | 2 |
| S7 | "When I took an Avet to Haddrell's, they sent it into Avet to get the bearings done." | Rapchizzle, charlestonfishing | https://forum.charlestonfishing.com/t/reel-service/77551 | 2017-01-03 | shop-ops | (two-hop service) | 2 |
| S8 | "provide repair/replacement service that is well accepted by the hardcore fishermen and charter fleets." … "Hard pressed to be all things to all people." | springtide, charlestonfishing | https://forum.charlestonfishing.com/t/new-tackle-shop-maybe/47264 | 2013-05-31 | shop-ops | complexity (positioning) | 1 |
| S9 | "the most impressive aspect of this store is their spooling station, reel servicing, and archery department." … "there's only one legit tackle shop in Charleston…Hadrell's." | archer, charlestonfishing | https://forum.charlestonfishing.com/t/new-tackle-shop-maybe/47264 | 2013-06-05 | shop-ops | (service as differentiator) | 1 |
| S10 | "there is already a tackle shop in charleston that is well stocked on tackle, bait, information" | StretchArmStrong, charlestonfishing | https://forum.charlestonfishing.com/t/new-tackle-shop-maybe/47264 | 2013-06-01 | shop-ops | complexity (competition) | 1 |
| S11 | "what products would everybody like to see? Baits, rigs, reels, rods, etc." | Juice15 (prospective shop owner), charlestonfishing | https://forum.charlestonfishing.com/t/new-tackle-shop-maybe/47264 | 2013-05-22 | shop-ops | complexity (inventory choice) | 1 |
| S12 | "I'm tired of having to run down to Chs Angler or Hadrell's and then run back out to Limehouse!!!" | sea_tonic, charlestonfishing | https://forum.charlestonfishing.com/t/new-tackle-shop-maybe/47264 | 2013-05-29 | shop-ops | (location) | 1 |
| S13 | "Please allow for at least four weeks turnaround (longer during summer) with all reel servicing." … "Items that are not collected after three months will be sold/disposed of to cover costs." … "If the work goes beyond a basic service, in that parts need replacing, we will quote the work before commencement." | Marine Deals (NZ retailer) help centre | https://help.marine-deals.co.nz/support/solutions/articles/44002335033-all-about-reel-servicing | n.d. | shop-ops | (backlog, uncollected reels, quoting) | 2 |
| S14 | "Our current turnaround is 20-30 business days this can vary depending on workload." | Daiwa Australia (search snippet; 429 on fetch) | https://daiwafishing.com.au/pages/service-spare-parts-and-repair-forms | n.d. | shop-ops | (OEM backlog) | 1 |
| S15 | "Bringing over 30 years of dedicated bench experience to the angling community" … "reliable turnaround times, and unmatched technical advice" | Mike, Owner & Master Technician, Mike's Reel Repair | https://www.mikesreelrepair.com/fishing-reel-maintenance-guide/ | 2024-06-17 | shop-ops | (turnaround as selling point) | 1 |
| S16 | "I think they fear that with this much information in the palm of your hand, people will no longer need to come into the shop" | Zach Pope (TroutRoutes founder, on fly-shop objections), Outdoor Life | https://www.outdoorlife.com/fishing/are-fishing-apps-doing-more-harm-than-good/ | 2022-07-20 | shop-ops | complexity (apps vs foot traffic) | 2 |
| S17 | "Richard Blocker has retired from rod and reel repair after many many years of first class service" … "If ya cant swing by, please feel free to sign the little appreciation book we have at the counter" | ReelHunter (shop), charlestonfishing | https://forum.charlestonfishing.com/t/mr-blocker-has-officially-retired/28976 | 2010-10-18/30 | shop-ops | (tech succession) | 2 |
| S18 | "Shimano had told me that they won't service JDM reels in the US." | bellows, stripersonline | https://www.stripersonline.com/surftalk/topic/918266-will-anyone-service-jdm-shimanos/ | 2026-06-20 | shop-ops | (OEM gap → independent techs) | 2 |
| S19 | "Most reels aren't that hard to repair. The hard part, many times, is finding parts for them." | Spoonmaster, charlestonfishing | https://forum.charlestonfishing.com/t/columbia-reel-servicing/60137 | 2014-09-25 | shop-ops | (parts sourcing) | 2 |
| S20 | "usually send reels in during the off-season and tell him no hurry" | handle n/a (search snippet), bassresource.com ("Mike at DVT") | https://www.bassresource.com/bass-fishing-forums/topic/114466-mike-at-dvt/ | n.d. (snippet) | shop-ops | (seasonality) | 1 |

Summary: Today reel service is a local-shop or mail-in craft business with spring backlogs
(5–8 weeks; 20–30 business days at OEMs; "longer during summer"), uncollected reels, two-hop
outsourcing to OEMs, parts hunting, and retiring one-person techs. Shops push off-season specials
to flatten demand. Nobody on the shop side complained about their own tracking software, which
is itself a finding: no visible tooling layer exists for them. Price anchors: $15–$25 labour
(2009–2013 SC), $35 Avet flat fee, $75 NZ, $10 diagnostic.

### 3.12 learning (L rows) — 22 independent handles, 6 platforms

| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Int |
|---|---|---|---|---|---|---|---|
| L1 | "I am totally new to fly fishing and I would like to get some input from experienced fly fishers on what to buy" | Garrison, flyanglersonline | https://www.flyanglersonline.com/t/equipment-suggestions-advice-to-an-absolute-beginner/41147 | 2010-05-08 | learning | complexity | 1 |
| L2 | "please don't get overwhelmed with fly fishing. There is SO MUCH information out there on how to fly fish" | flyracer77, FAOL | https://www.flyanglersonline.com/t/equipment-suggestions-advice-to-an-absolute-beginner/41147 | 2010-05-17 | learning | complexity | 1 |
| L3 | "Your probably going to get a lot of opinions on this one." | Ron_Eagle_Elk, FAOL | https://www.flyanglersonline.com/t/equipment-suggestions-advice-to-an-absolute-beginner/41147 | 2010-05-08 | learning | complexity (conflicting advice) | 1 |
| L4 | "Your absolute best investment would be a lesson or two from a pro, or a days worth of guiding" | Mato_Kuwapi, FAOL | https://www.flyanglersonline.com/t/equipment-suggestions-advice-to-an-absolute-beginner/41147 | 2010-05-08 | learning | manual-workaround (paid lesson) | 2 |
| L5 | "an even better way to get off to a good start is to join up with a Trout Unlimited Chapter" | peregrines, FAOL | https://www.flyanglersonline.com/t/equipment-suggestions-advice-to-an-absolute-beginner/41147 | 2010-05-09 | learning | manual-workaround (club) | 1 |
| L6 | "Trouts Unlimited clubs would be a great source of info." | MSD53X, FAOL | https://www.flyanglersonline.com/t/equipment-suggestions-advice-to-an-absolute-beginner/41147 | 2010-05-09 | learning | manual-workaround | 1 |
| L7 | "would like to join a good club to learn not only how to fish it but also the does and don'ts." | Foxtrot24, charlestonfishing | https://forum.charlestonfishing.com/t/any-saltwater-clubs-taking-new-members/54593 | 2014-02-05 | learning | manual-workaround | 2 |
| L8 | "Can you guys recommend some videos or instructions on how to break down spinning reels?" | Surf_or_Fish, charlestonfishing | https://forum.charlestonfishing.com/t/reel-maintence/83938 | 2018-01-02 | learning | missing-feature (how-to by model) | 2 |
| L9 | "Where can one get a star but small enough to take screws out of the Ci4?" | Hookem_CHS, charlestonfishing | https://forum.charlestonfishing.com/t/reel-maintence/83938 | 2018-01-03 | learning | complexity | 1 |
| L10 | "How long do you more seasoned anglers give a spot before saying this isn't happening I need to move on?" | TripleC, stripersonline | https://www.stripersonline.com/surftalk/topic/922464-time-spent-on-a-spot/ | 2026-10-20 | learning | complexity | 1 |
| L11 | "Anybody know of a good Fly Pattern app for the Android phones/tablets?" | rvrwader, FAOL | https://www.flyanglersonline.com/t/android-apps/48265 | 2012-02-22 | learning | missing-feature | 2 |
| L12 | "I found it very awesome, and worth the steep $14.99 price." … "if you're NOT a novice - this probably isn't the app for you." … "EVERYTHING on the app can be found online, for free." | icall2much, FAOL (Orvis app) | https://www.flyanglersonline.com/t/orvis-ultimate-fly-fishing-app-review/46053 | 2011-06-07/08 | learning | (WTP) | 3 |
| L13 | "like most things Orvis it is over-priced pure and simple." | Brian_Moffitt, FAOL | https://www.flyanglersonline.com/t/orvis-ultimate-fly-fishing-app-review/46053 | 2011-06-07 | learning | too-expensive | 2 |
| L14 | "found it to be very useful, especially the videos for casting." … "unless I download all the videos it does me no good" … "I never did receive my $10." | system (FAOL member account), FAOL | https://www.flyanglersonline.com/t/orvis-ultimate-fly-fishing-app-review/46053 | 2011-06-08 | learning | offline | 2 |
| L15 | "this app didn't give me the result I expected. It gave me 3 different pictures" | fortniteBadbruh, App Store (Picture Fish) | https://apps.apple.com/us/app/picture-fish-fish-identifier/id1474584436 | 2021-07-25 | learning | inaccurate | 1 |
| L16 | "I signed up for a free trial of the premium service when I downloaded the app" … "It is unacceptable that they don't have a way to cancel the subscription in the app" | Benjeeta, App Store (Picture Fish) | https://apps.apple.com/us/app/picture-fish-fish-identifier/id1474584436 | 2020-02-17 | learning | too-expensive | 3 |
| L17 | "It turns out you may get a response to your photo 49 hours later (maybe) in your email." (Fish ID add-on) | bagmart, App Store (Fish Rules) | https://apps.apple.com/us/app/fish-rules-local-fishing-laws/id597875361 | 2024-12-06 | learning | inaccurate | 3 |
| L18 | "Little fush are harder to identify." | mdaddy, charlestonfishing | https://forum.charlestonfishing.com/t/fish-rules-app/87913 | 2019-02-12 | learning | complexity | 1 |
| L19 | "Always looking for help in trying to figure the fish out." | Downbytheriver, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-points-app/91118 | 2019-09-24 | learning | complexity | 1 |
| L20 | "I am looking for someone to teach me as much as I can about the location." | JohnP, FAOL | https://www.flyanglersonline.com/t/what-do-you-expect-from-a-guided-trip/12451 | 2005-03-08 | learning | manual-workaround (paid guide) | 2 |
| L21 | "although it's not the most beginner friendly." | i hate coverfire, App Store (Fishing Spots) | https://apps.apple.com/us/app/fishing-spots-fish-maps/id417922502 | 2024-01-22 | learning | complexity | 1 |
| L22 | "It actually has a bit more than I need, making it feel a little cluttered." | jeremyberimy, App Store (Fishing Spots) | https://apps.apple.com/us/app/fishing-spots-fish-maps/id417922502 | 2020-04-29 | learning | complexity | 1 |
| L23 | "Start out with 1 or 2 techniques and get confidence on them." … "Don't just aimlessly watch or read random videos. Go in with a specific question and stay focused on it." | handle n/a (search snippets), bassresource.com | https://bassresource.com/bass-fishing-forums/topic/181890-just-starting-out ; https://bassresource.com/bass-fishing-forums/topic/225106-advice-for-new-anglers | n.d. (snippets) | learning | complexity | 1 |

Summary: Today beginners get conflicting forum opinions, YouTube overload, paid lessons, guides
and clubs; model-specific how-to (reel teardown, tool sizes) is asked for by name. They want
focused, offline-capable reference tied to their own gear and water, and fish ID that answers in
seconds, not 49 hours. Price said: $14.99 one-time contested (worth it vs "over-priced");
subscription fish-ID trials resented.

### 3.13 sharing (H rows) — 18 independent handles, 5 platforms

| # | Verbatim quote | Who / where | URL | Date | Job | Pain type | Int |
|---|---|---|---|---|---|---|---|
| H1 | "But at the same time, I'd prefer nobody posted anything on the app ever." | Pete Scharf, quoted in Outdoor Life | https://www.outdoorlife.com/fishing/are-fishing-apps-doing-more-harm-than-good/ | 2022-07-20 | sharing | privacy | 2 |
| H2 | "the people drive me insane commenting on my post saying that I'm a criminal" | F., worldsapps (Fishbrain) | https://worldsapps.com/reviews-fishbrain-fishing-app | 2024-04-22 | sharing | complexity (toxicity) | 2 |
| H3 | "they charge users just to browse pictures and enjoy the community side of fishing." | BraydinRoss, mwm.ai (Fishbrain) | https://mwm.ai/apps/fishbrain-fishing-app/477967747 | 2026-05-07 | sharing | too-expensive | 2 |
| H4 | "SIMPLY VIEWING OTHER CATCHES SHOULD NOT REQUIRE A SUBSCRIPTION!!" | Got_Goats, mwm.ai (Fishbrain) | https://mwm.ai/apps/fishbrain-fishing-app/477967747 | 2026-05-15 | sharing | too-expensive | 3 |
| H5 | "simple looking at the pictures people take of them catching fish shouldn't be a paid benefit in my opinion." | RubenFishes, mwm.ai (Fishbrain) | https://mwm.ai/apps/fishbrain-fishing-app/477967747 | 2026-05-22 | sharing | too-expensive | 2 |
| H6 | "you have to have a membership just to view any of the pictures posted there." | Trapper Savage, mwm.ai (Fishbrain) | https://mwm.ai/apps/fishbrain-fishing-app/477967747 | 2026-05-19 | sharing | too-expensive | 2 |
| H7 | "the free version should atleast show catch pins and catch information that somebody posted as public" | F0rmundacheeze, mwm.ai (Fishbrain) | https://mwm.ai/apps/fishbrain-fishing-app/477967747 | 2026-05-17 | sharing | too-expensive | 2 |
| H8 | "Make Fishbrain usable for us again. Please make features everyone should use free." | MADMAX994D, mwm.ai (Fishbrain) | https://mwm.ai/apps/fishbrain-fishing-app/477967747 | 2026-04-22 | sharing | too-expensive | 2 |
| H9 | "Not sure how it has 400 recommendations when access is limited?" | dd_2016, mwm.ai (Fishbrain) | https://mwm.ai/apps/fishbrain-fishing-app/477967747 | 2026-05-13 | sharing | too-expensive | 1 |
| H10 | "It seems like a brainless app which generates meaningless content" | Bugsy, justuseapp (Fishbrain) | https://justuseapp.com/en/app/477967747/fishbrain-fishing-app/reviews | 2022-08-31 | sharing | complexity | 2 |
| H11 | "Paying for it is a waste. Plenty of free online groups with better information." | P., worldsapps (Fishbrain) | https://worldsapps.com/reviews-fishbrain-fishing-app | 2024-07-25 | sharing | too-expensive | 3 |
| H12 | "I have often wondered if it's logging this information on a database somewhere." | Goob, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-apps/70256 | 2016-01-15 | sharing | privacy | 1 |
| H13 | "Cool, been looking for an app that wasn't social." | kgearhart, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 | 2019-10-01 | sharing | privacy | 2 |
| H14 | "finally a fishing log that doesn't want my location or try to sync everything to some cloud" | Sabri, Product Hunt (AnglerSlate) | https://www.producthunt.com/products/anglerslate-fishing-log | ~2026-07 | sharing | privacy | 2 |
| H15 | "The offline-only setup is genuinely refreshing, especially no location permission." | Gürsel Otman, Product Hunt (AnglerSlate) | https://www.producthunt.com/products/anglerslate-fishing-log | ~2026-07 | sharing | privacy | 2 |
| H16 | "Love the offline-first approach and no tracking, that's a real differentiator." | Nuray Kıcırlı, Product Hunt (AnglerSlate) | https://www.producthunt.com/products/anglerslate-fishing-log | ~2026-07 | sharing | privacy | 2 |
| H17 | "I've watched people called out online, others chirp in who weren't even involved, and just slandering that isn't necessary." … "fights break out online over stuff that could be prevented." | Matt Broderick (editor), The Fisherman | https://www.thefisherman.com/article/editors-log-facebook-fishing-wars/ | 2023-11 | sharing | complexity (toxicity) | 2 |
| H18 | "I have about a dozen I would be happy to share with you." (private waypoint sharing by message) | Badbobflyfishing, charlestonfishing | https://forum.charlestonfishing.com/t/gps-apps/85786 | 2018-05-19 | sharing | manual-workaround | 1 |
| H19 | "No GPS, no map — your secret spots stay secret." … "No community. No cloud sync. No subscription — just you and the water." | FishBench app description (vendor claim, $2.99) | https://apps.apple.com/us/app/fishbench/id6775768374 | n.d. (accessed 2026-10-20) | sharing | privacy (positioning) | 1 |

Summary: Today sharing happens in forums, Facebook groups and Fishbrain; the public feed is now
paywalled and toxic, spots leak, and a counter-market of "not social, no location, no cloud" logs
is forming. They want small-circle or no sharing at all, with their data staying theirs. Price
said: free browsing expected; $2.99 one-time private log accepted; "free online groups" beat a
paid feed.

---

## 4. Workarounds people describe

| Workaround | Verbatim quote | Who / where | URL | Date | Row |
|---|---|---|---|---|---|
| Excel / Google Sheets log kept for decades | "excel spreadsheet… make your own columns etc, tides, bait water temp etc…been doing it since 1995" | saltfisher, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-journal-record-keeping/30965 | 2011-04-28 | E9 |
| Spreadsheet built to be quick, still abandoned | "I've made Microsoft Excel spreadsheets that only require quick, numerical entries," | Jimmy Fee, On The Water | https://onthewater.com/the-challenge-of-keeping-an-up-to-date-fishing-log | 2012-01-11 | E1 |
| Notebook on the water, transcribed later | "have a small notebook while fishing then transcribe everything to the spreadsheet." | Lowcountryboy, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 | 2019-03-06 | E10 |
| Waterproof notepad, new one each year | "I use a waterproof notepad that I found at lowe's. Usually use a new one for each year." | sea_tonic, charlestonfishing | https://forum.charlestonfishing.com/t/keeping-a-log/78798 | 2017-03-09 | E22 |
| Printed tide-log book annotated | "Buy a tide log every year and keep notes on the days you fish." | CaptFritz, charlestonfishing | https://forum.charlestonfishing.com/t/keeping-a-log/78798 | 2017-03-09 | E24 |
| Word docs printed quarterly as backup | "I print them at the end of each quarter in case the computer dies." | spec, charlestonfishing | https://forum.charlestonfishing.com/t/keeping-a-log/78798 | 2017-03-09 | E23 |
| Google Docs form | "What I started with is a googledocs form." | Shane0714, charlestonfishing | https://forum.charlestonfishing.com/t/keeping-a-log/78798 | 2017-03-09 | E21 |
| Pocket calendars, then chartplotter waypoints | "I kept small pocket calendars for many years." … "I mostly just mark waypoints on the depthfinder." | Spoonmaster, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 | 2019-03-07 | E14 |
| Waypoint per fish as the log | "No log here, but I drop a waypoint on each fish caught." | friogatto, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-book/84966 | 2018-03-22 | E11 |
| Phone photos as the log | "I find myself hunting through pictures on my phone trying to remember what they were biting when and where." | friogatto, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 | 2019-03-06 | E11 |
| Boating-app screenshots in dated folders | "I just prefer my method of using the boating app and saving screenshots for easy access." | captfields_sc, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-book/84966 | 2018-03-21 | E31 |
| Voice memos transcribed later | "I used to do almost all that you've described," (now records audio on his phone) | Marlon Violette, On The Water | https://onthewater.com/the-challenge-of-keeping-an-up-to-date-fishing-log | 2012-01-18 | E56 |
| Google Doc spreadsheet edited from the phone | "keeps his fishing logs in a Google Doc Excel Spreadsheet" (article text) | Nate Bent via Jimmy Fee, On The Water | https://onthewater.com/4-tips-for-fishing-log-success | 2012-01-19 | — |
| Paid log software (FishersLog) | "I have used the Fisherslog for two years now." | Jim Ziola, On The Water comment | https://onthewater.com/4-tips-for-fishing-log-success | 2012-01-20 | E55 |
| Hand-typing stored GPS numbers into an app | "have begun to hand type all of my gps coordinates into it that I had stored" | stokes, charlestonfishing | https://forum.charlestonfishing.com/t/gps-iphone-apps/53288 | 2013-12-06 | F1 |
| Excel tackle inventory via Documents To Go | "Excel Spreadsheet with Documents To Go." | Gekko, androidcentral | https://forums.androidcentral.com/threads/inventory-app.33715 | 2010-09-09 | G3 |
| Excel materials inventory, colour-coded stock | "I color code items in black when new or hardly used, yellow when they are used past the halfway point" | Eight_Thumbs, FAOL | https://www.flyanglersonline.com/t/my-inventory-is-growing-uh-oh/36860 | 2009-08-30 | G9 |
| 4x6 notebook, annual January count, planned MySQL | "About once a year I actually take inventory (usually a snowny January weekend)" | Bass_Bug, FAOL | https://www.flyanglersonline.com/t/my-inventory-is-growing-uh-oh/36860 | 2009-08-30 | G8 |
| Reel maintenance tracked in a spreadsheet | "I keep track of my reel maintenance on one but that's about it for me." | handle n/a, bassresource (snippet) | https://www.bassresource.com/bass-fishing-forums/topic/151461-fishing-logs/ | n.d. | M48 |
| Symptom-driven service instead of a schedule | "Generally I wait until the bail doesn't flip smoothly." | Narcosis, charlestonfishing | https://forum.charlestonfishing.com/t/clean-reels-after-every-use/51998 | 2013-10-11 | M8 |
| Friend who services reels | "Best bet is a friend in the know with a bit of time on his hands." | JWall, sdfish | https://www.sdfish.org/viewtopic.php?p=28999 | 2026-06-16 | M3 |
| Paid shop service, 5-week wait | "I was on a 5 week wait." | in_the_grass, charlestonfishing | https://forum.charlestonfishing.com/t/reels/38461 | 2012-05-20 | M26 |
| Multi-year / lifetime licence to avoid renewal | "Bought the lifetime, so one less thing to try to remember…" | pitviper0404, charlestonfishing | https://forum.charlestonfishing.com/t/license-renewal/48645 | 2013-07-01 | R4 |
| Forum post as the renewal reminder | "Just want to throw a reminder out for everyone that as of today, July 1, we have to renew" | spotsnslots, charlestonfishing | https://forum.charlestonfishing.com/t/license-renewal/48645 | 2013-07-01 | R1 |
| Paper weigh-in forms plus tracking model | "As long as I am TD I will still use the paper forms as well as a tracking model." | Chipman, charlestonfishing | https://forum.charlestonfishing.com/t/2015-tournaments/61884 | 2014-12-16 | T2 |
| Member-built Excel scoring model | "special thanks to Van Cook for building the new scoring model." | Chipman, charlestonfishing | https://forum.charlestonfishing.com/t/february-tournament-results/63124 | 2015-02-24 | T2/T3 |
| Volunteer with laptop at weigh-in | "Warren has Pam sitting there with a laptop." | Chipman, charlestonfishing | https://forum.charlestonfishing.com/t/2015-tournaments/61884 | 2014-12-16 | T2 |
| Standings corrections posted publicly | "There is a correction in the TOTY standings." | motleyfan81, charlestonfishing | https://forum.charlestonfishing.com/t/toty-standings-correction/77345 | 2016-12-21 | T10 |
| Membership list as a forum thread | thread title "Ditch Troll Membership List" | Ditch Trolls, stripersonline | https://www.stripersonline.com/surftalk/topic/642408-ditch-troll-membership-list/ | 2016-02-11 | C17 |
| Club builds its own app | "View and pay your bill, View calendar of events, Sign up for Club parties, contests and more" | Belmar Fishing Club, App Store | https://apps.apple.com/us/app/belmar-fishing-club/id6761139117 | n.d. | C16 |
| Booking software to hold cards | "since we had no way of saving their credit card information upfront, we lost a lot of business to no-call, no shows." | Hunter, Poseidon Fishing Charters (TripWorks) | https://www.tripworks.com/case-study/platform-grows-with-my-business | n.d. | B18 |
| QuickBooks with ad-hoc categories | "need to figure out the appropriate category to categorize gas" | jstarwalt, QuickBooks Community | https://quickbooks.intuit.com/learn-support/en-us/reports-and-accounting/how-do-i-categorize-boat-gas-fishing-guide-service/00/1015468 | 2022-01-19 | O8 |
| Stack of free web tide/weather sites instead of apps | "I haven't found a decent app, but saltwatertides.com is a great site." | Drippin_Wett, charlestonfishing | https://forum.charlestonfishing.com/t/tide-apps/67853 | 2015-09-15 | P2 |
| Private waypoint sharing by message | "I have about a dozen I would be happy to share with you." | Badbobflyfishing, charlestonfishing | https://forum.charlestonfishing.com/t/gps-apps/85786 | 2018-05-19 | H18 |

## 5. Explicit wishes ("is there an app that…", "I wish…")

| # | Verbatim wish | Who / where | URL | Date | Job |
|---|---|---|---|---|---|
| W1 | "Looking for a fishing log software. What do y'all use and like?" | Bryan, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-software/50371 | 2013-08-20 | log-trips |
| W2 | "I'm looking for advice on a good Fishing log which is free or cheap." | KW186, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-online-software/29939 | 2011-02-08 | log-trips |
| W3 | "I haven't been diligent about keeping a log (manually) and thought an app would make it easier" | DownLow, charlestonfishing (search blurb, full sentence) | https://forum.charlestonfishing.com/t/fishing-log-app/72425 | 2016-05-02 | log-trips |
| W4 | "Anybody have a favorite fish log app for their phone?" | JLeephoto, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-apps/70256 | 2016-01-15 | log-trips |
| W5 | "I was considering making an app (Andriod) for that." | Knotty_Hooker, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-journal-record-keeping/30965 | 2011-04-29 | log-trips |
| W6 | "I've been thinking about making a phone\tablet app to do this since most phones are GPS capable nowadays." | skinneej, charlestonfishing | https://forum.charlestonfishing.com/t/gps-enhancement-idea/80483 | 2017-05-30 | log-trips |
| W7 | "my idea for a software enhancement is to add a fishing log capability." | FlickerFisher, charlestonfishing | https://forum.charlestonfishing.com/t/gps-enhancement-idea/80483 | 2017-05-28 | log-trips |
| W8 | "get years of logs into some sort of program like excel or something else to view patterns over the years?" | CackalackyHappy, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-book/84966 | 2018-03-20 | log-trips |
| W9 | "Cool, been looking for an app that wasn't social. Can you export the data?" | kgearhart, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 | 2019-10-01 | log-trips |
| W10 | "it would be great to have a way to export the catch log to a spreadsheet" | Flyfishdoc, justuseapp (ANGLR) | https://justuseapp.com/en/app/1142347232/fishing-app-anglr-logbook/reviews | n.d. | log-trips |
| W11 | "What would be great would be the ability to export this data. Is that possible???" | Rehawtho, App Store (BUBBA) | https://apps.apple.com/us/app/bubba/id1607037466 | 2025-01-06 | log-trips |
| W12 | "I wish there was a way to select more than one gear during gear selection." … "being able to log terminal tackle like hooks, weights, and swivels would be awesome too." | unnamed reviewer, App Store (ANGLR) | https://apps.apple.com/us/app/fishing-app-anglr-logbook/id1142347232 | 2021-06-26 | log-trips |
| W13 | "I would pay a one time iap to support the app if you could add a database of fish & bait (lures)" | Thalinor, App Store (Anglers' Log) | https://apps.apple.com/us/app/anglers-log-fishing-journal/id959989008 | 2019-05-14 | log-trips |
| W14 | "Only thing I wish is that the app had more kinds of statistics to view and compare." | Jovohfdvbh, App Store (Anglers' Log) | https://apps.apple.com/us/app/anglers-log-fishing-journal/id959989008 | 2018-05-13 | log-trips |
| W15 | "I wish their were more stats I could track such as retrieval specific catches, lure specific catches" | Tboat777, justuseapp (Anglers' Log) | https://justuseapp.com/en/app/959989008/anglers-log-fishing-journal/reviews | n.d. | log-trips |
| W16 | "Can toy make an option to group notes together i fish many lakes and want to be able to group my logs by lake" | TheR3ALRudy, justuseapp (Anglers' Log) | https://justuseapp.com/en/app/959989008/anglers-log-fishing-journal/reviews | n.d. | log-trips |
| W17 | "I would really like a place to write a note about the trip whenever looking through my log book." | It's Slayder, justuseapp (ANGLR) | https://justuseapp.com/en/app/1142347232/fishing-app-anglr-logbook/reviews | n.d. | log-trips |
| W18 | "One thing I'd love to see is a moon phase and tide indicator tied to each trip entry" | Nuray Kıcırlı, Product Hunt | https://www.producthunt.com/products/anglerslate-fishing-log | ~2026-07 | plan-conditions |
| W19 | "Would love a built-in lunar phase and tide chart you can pull up from a trip record." | Hamza Nazlıoğlu, Product Hunt | https://www.producthunt.com/products/anglerslate-fishing-log | ~2026-07 | plan-conditions |
| W20 | "Does anyone know of a good wind/wave smartphone app?" | btodag, charlestonfishing | https://forum.charlestonfishing.com/t/best-smartphone-apps-wind-wave-etc/31362 | 2011-05-16 | plan-conditions |
| W21 | "Can anyone suggest a good fishing/tide app for android phones?" | BigFishFan, charlestonfishing | https://forum.charlestonfishing.com/t/tide-apps/67853 | 2015-09-15 | plan-conditions |
| W22 | "anyone have one of these apps on their phone? How accurate have you found it too be and last but not least." … "What is it called?" (water temps) | Chad, charlestonfishing | https://forum.charlestonfishing.com/t/water-temp-and-fishing-app/78496 | 2017-02-20 | plan-conditions |
| W23 | "Does anyone know any iPhone apps that work well for marking and storing saltwater, inshore fishing points" | stokes, charlestonfishing | https://forum.charlestonfishing.com/t/gps-iphone-apps/53288 | 2013-11-30 | find-spots |
| W24 | "The only thing missing is the ability to mark spots where I have caught fish throughout my day." | Mee2yoo, justuseapp (Anglers' Log) | https://justuseapp.com/en/app/959989008/anglers-log-fishing-journal/reviews | n.d. | find-spots |
| W25 | "I will be using it to take inventory of all my fishing tackle. I would like some thing that I can put the amount, size, color, and product name in." | boos1906, androidcentral | https://forums.androidcentral.com/threads/inventory-app.33715 | 2010-09-08 | gear-inventory |
| W26 | "Does anyone have a free database program to keep track of materials and flypatterns?" | birddog, FAOL | https://www.flyanglersonline.com/t/material-database/19651 | 2006-05-14 | gear-inventory |
| W27 | "Is there any apps out there that keeps track of your tackle and inventory?" | handle n/a, bassresource (snippet) | https://bassresource.com/bass-fishing-forums/topic/187059-apps | n.d. | gear-inventory |
| W28 | "Anybody know of a good Fly Pattern app for the Android phones/tablets?" | rvrwader, FAOL | https://www.flyanglersonline.com/t/android-apps/48265 | 2012-02-22 | learning |
| W29 | "Can you guys recommend some videos or instructions on how to break down spinning reels?" | Surf_or_Fish, charlestonfishing | https://forum.charlestonfishing.com/t/reel-maintence/83938 | 2018-01-02 | gear-maintenance |
| W30 | "Any solutions other than learning to do it myself (which ain't gonna happen)?" … "needs to be someone who can get parts from Japan too." | EBHarvey, stripersonline | https://www.stripersonline.com/surftalk/topic/918266-will-anyone-service-jdm-shimanos/ | 2026-06-20 | gear-maintenance |
| W31 | "Does anybody know anywhere in the midlands that does reel servicing" | ReelScout16, charlestonfishing | https://forum.charlestonfishing.com/t/columbia-reel-servicing/60137 | 2014-09-25 | gear-maintenance |
| W32 | "it really helps to know what dimension to order and quantity." (bearing specs by reel model) | Drycounty71, stripersonline | https://www.stripersonline.com/surftalk/topic/885761-where-to-buy-good-bearings/ | 2025-09-25 | gear-maintenance |
| W33 | "Wish it had a place to add your boat & motor registration as well" | areeldrag, charlestonfishing | https://forum.charlestonfishing.com/t/new-sc-dnr-app/94359 | 2022-03-15 | regulations |
| W34 | "it would be nice to actually have up to date regulations right in the app." | Dini Chats het dich ufgesse, App Store (TroutRoutes) | https://apps.apple.com/us/app/troutroutes-fly-fishing-app/id1423989574 | 2026-06-22 | regulations |
| W35 | "Recommend getting some coverage in MT,WY,CO,SD,ND,ID." | Tommy Trller, justuseapp (Fish Rules) | https://justuseapp.com/en/app/597875361/fish-rules-local-fishing-laws/reviews | n.d. | regulations |
| W36 | "Would LOVE to see the app with whatever Emergency Orders are in effect for your current location, as well as the ability to look them up for other locations." | handle n/a (survey respondent), ADF&G report | https://www.adfg.alaska.gov/static/fishing/PDFs/sport/Survey_Report-2018-9-19.pdf | 2018-09-19 | regulations |
| W37 | "a good software program designed to tally the weights and put them in order quickly" … "if we found a software we liked for tracking our weigh-ins and yearly totals" | VanMan, charlestonfishing | https://forum.charlestonfishing.com/t/2015-tournaments/61884 | 2014-12-15/16 | tournament |
| W38 | "I always advocated the club purchase a laptop for the TX directors to use and enter the info at the weigh-ins." | wildlifesc, charlestonfishing | https://forum.charlestonfishing.com/t/2015-tournaments/61884 | 2014-12-13 | tournament |
| W39 | "One thing I would like to see is have the ability for anglers to pre-register for the tournament." | 19JL47, App Store (Weighfish) | https://apps.apple.com/us/app/weighfish-fishing-tournament-manager/id1355191001 | 2021-02-28 | tournament |
| W40 | "I will see what kind of program we could design" | shipwreck, charlestonfishing | https://forum.charlestonfishing.com/t/2015-tournaments/61884 | 2014-12-12 | tournament |
| W41 | "Only recommendation I would make is sort it by highest total weight, per tournament and YTD." | Rick_K, charlestonfishing | https://forum.charlestonfishing.com/t/february-tournament-results/63124 | 2015-03-05 | tournament |
| W42 | "Anybody got any good fishing/fishing-related apps to recommend?" (wanted forecasts, rigging, safety, navigation, knots, regulations) | NaClH20, charlestonfishing | https://forum.charlestonfishing.com/t/any-good-fishing-apps/33867 | 2011-08-25 | other:all-in-one |

## 6. Willingness-to-pay signals

| # | Signal | Verbatim quote | Who / where | URL | Date | Direction |
|---|---|---|---|---|---|---|
| Y1 | Paid $12/yr for a log they did not need to pay for | "The free version of this app would have done me fine, but I love it so much that I just paid the $12 for the year." | SuccorMidstSorrow, App Store (Anglers' Log) | https://apps.apple.com/us/app/anglers-log-fishing-journal/id959989008 | Sep 19 (year n/s) | pays |
| Y2 | One-time IAP preferred over subscription | "I would pay a one time iap to support the app if you could add a database of fish & bait (lures)" | Thalinor, App Store (Anglers' Log) | https://apps.apple.com/us/app/anglers-log-fishing-journal/id959989008 | 2019-05-14 | pays (one-time) |
| Y3 | $10 one-time chart app praised | "Navionics, best 10 bucks I spent." | tigerfin, charlestonfishing | https://forum.charlestonfishing.com/t/gps-iphone-apps/53288 | 2013-12-02 | pays |
| Y4 | $15 one-time, worth it | "pretty cool app…think I paid $15 for it a couple years ago…worth it at that price…free is mo betta!" | Bonzo72, charlestonfishing | https://forum.charlestonfishing.com/t/free-navionics-app/57347 | 2014-06-02 | pays |
| Y5 | $10 one-time | "Best $10 app on the market = navionics - US East." | PalmerScott, charlestonfishing | https://forum.charlestonfishing.com/t/any-good-fishing-apps/33867 | 2011-08-30 | pays |
| Y6 | Annual chart renewal accepted | "Ill probably buy it every year until they stop updating the maps." | Smelly mole, App Store (Navionics) | https://apps.apple.com/us/app/navionics-boating/id744920098 | 2020-01-16 | pays |
| Y7 | $9.99/yr non-auto-renew praised | "it costs $9.99 to renew the subscription, that does not auto-renew, for a whole year." | danthefiaherman, App Store (Navionics) | https://apps.apple.com/us/app/navionics-boating/id744920098 | 2018-07-24 | pays |
| Y8 | $5–10/yr "very very reasonable" | "The price for premium is very very reasonable at $5 or $10 a YEAR." | FishingNate, App Store (Fishing Points) | https://apps.apple.com/us/app/fishing-points-map-forecast/id1203032512 | 2018-12-15 | pays |
| Y9 | App replaces $500 hardware | "buy a $500 navigating system but now I don't have to" | Chokoloskee Steve, App Store (Fishing Points) | https://apps.apple.com/us/app/fishing-points-map-forecast/id1203032512 | 2021-07-31 | pays |
| Y10 | $50/yr rejected | "definitely not worth $50 a year." | Markh142, App Store (Fishing Points) | https://apps.apple.com/us/app/fishing-points-map-forecast/id1203032512 | 2025-08-12 | refuses |
| Y11 | $50/yr expects support | "For $50/yr, I expect that this serious problem working with IOS would be resolved." | ErikExp, App Store (Navionics) | https://apps.apple.com/us/app/navionics-boating/id744920098 | Mar 27 (year n/s) | pays grudgingly |
| Y12 | $70/yr "crazy" | "Over $70 for a year is crazy." | A$HL3Y™, mwm.ai (Fishbrain) | https://mwm.ai/apps/fishbrain-fishing-app/477967747 | 2026-05-14 | refuses |
| Y13 | $80–100/yr "for simple stuff" | "But I just don't get why we have to pay $80-$100 just for simple stuff." | Porter F., worldsapps (Fishbrain) | https://worldsapps.com/reviews-fishbrain-fishing-app | 2024-07-25 | refuses |
| Y14 | $6/mo rejected | "You have to pay 6 bucks a month just to see what they used to catch the fish half the timer" | Nolan L., worldsapps (Fishbrain) | https://worldsapps.com/reviews-fishbrain-fishing-app | 2024-07-25 | refuses |
| Y15 | $82 charged, resented | "they took a full years worth for the amount of $82 and some change." | ChrisIsAGod, justuseapp (Fishbrain) | https://justuseapp.com/en/app/477967747/fishbrain-fishing-app/reviews | n.d. | refuses |
| Y16 | "Absolutely not worth the money." | "Absolutely not worth the money." | Frank Kirby, justuseapp (Fishbrain) | https://justuseapp.com/en/app/477967747/fishbrain-fishing-app/reviews | 2023-06-15 | refuses |
| Y17 | Paying but value fell | "Ever since the previous update I feel I'm not getting the value I was but still paying the same price." | GingerGoo, App Store (Fishbrain) | https://apps.apple.com/us/app/fishbrain-fishing-app/id477967747 | 2024-07-31 | pays, churn risk |
| Y18 | Free groups beat paid feed | "Paying for it is a waste. Plenty of free online groups with better information." | P., worldsapps (Fishbrain) | https://worldsapps.com/reviews-fishbrain-fishing-app | 2024-07-25 | refuses |
| Y19 | Fishbrain list prices | "Fishbrain Premium: $14.99" (monthly); "Annual Power Fishing Package: $79.99" | App Store listing | https://apps.apple.com/us/app/fishbrain-fishing-app/id477967747 | accessed 2026-10-20 | anchor |
| Y20 | $14.99 one-time learning app: split | "I found it very awesome, and worth the steep $14.99 price." vs "like most things Orvis it is over-priced pure and simple." | icall2much / Brian_Moffitt, FAOL | https://www.flyanglersonline.com/t/orvis-ultimate-fly-fishing-app-review/46053 | 2011-06-07 | split |
| Y21 | $5.99 Pro bought, regretted | "paid the pro version, and I practically cant do anything on this app. So a waste of money" | TiffTiffMiller, App Store (SmartTacklebox) | https://apps.apple.com/us/app/smarttacklebox/id1021114662 | 2018-02-12 | paid, churned |
| Y22 | $2.99 private log exists, no reviews yet | "$2.99" (price); "No subscription" | FishBench listing | https://apps.apple.com/us/app/fishbench/id6775768374 | accessed 2026-10-20 | anchor |
| Y23 | Reel service: $35 flat fee "hard to beat" | "Avet's 35 dollar flat fee per reel service is hard to beat too." | Phin, charlestonfishing | https://forum.charlestonfishing.com/t/bottom-fishing-rod-reel-setup/38698 | 2012-06-01 | pays |
| Y24 | Reel service: $90 for 3 reels | "($90 spent for all 3)" | retired_young, charlestonfishing | https://forum.charlestonfishing.com/t/sold-2-shimano-stradic-ci4-3000s-1-shimano-c/75430 | 2016-09-13 | pays |
| Y25 | Reel service: $35 + shipping too much for clean-and-lube | "no need to spend $35 plus shipping for an Avet." | Long_Enuff, charlestonfishing | https://forum.charlestonfishing.com/t/reel-service/77551 | 2017-01-04 | refuses |
| Y26 | Reel service labour anchors | "$15 (regularly $18) labor" / "$20 (reg $25) labor" | ReelHunter (Haddrell's), charlestonfishing | https://forum.charlestonfishing.com/t/reel-service-special/24605 | 2009-12-04 | anchor |
| Y27 | Reel service NZ anchor | "A general service starts at $75." | Marine Deals NZ | https://help.marine-deals.co.nz/support/solutions/articles/44002335033-all-about-reel-servicing | n.d. | anchor |
| Y28 | Club refused $2,700 hardware | "At a cost of $2700 plus carrying case I am not sure that is something we would want to spend our money on." | Chipman, charlestonfishing | https://forum.charlestonfishing.com/t/2015-tournaments/61884 | 2014-12-13 | refuses |
| Y29 | Weighfish director tiers | "Director Pro Monthly: $9.99" … "Director Pro Annual: $69.99" … "Director Elite Annual: $284.99" | App Store listing | https://apps.apple.com/us/app/weighfish-fishing-tournament-manager/id1355191001 | accessed 2026-10-20 | anchor |
| Y30 | Captains object to commission model | "The more commission the charter company pays to them the higher the ranking will be on the platform" | Charles Heldewier, Trustpilot | https://www.trustpilot.com/review/fishingbooker.com | 2026-09-26 | refuses |
| Y31 | Fish ID subscription cancelled | "I promptly cancelled my subscription, but I'm stuck with this app for the remaof the year." | bagmart, App Store (Fish Rules) | https://apps.apple.com/us/app/fish-rules-local-fishing-laws/id597875361 | 2024-12-06 | churned |
| Y32 | Regs app should be free with licence | "also make it a free app or one that comes free with license purchase." | survey respondent (n/a), ADF&G | https://www.adfg.alaska.gov/static/fishing/PDFs/sport/Survey_Report-2018-9-19.pdf | 2018-09-19 | refuses |
| Y33 | Would keep paying if price rose | reviewer "only says they would keep paying if the price rose" (fetch summary; verbatim not captured) | Hijhjhh, justuseapp (Anglers' Log) | https://justuseapp.com/en/app/959989008/anglers-log-fishing-journal/reviews | n.d. | pays |

Reading: the accepted band for individual-angler utilities is ~$3–$15 one-time or ~$10–$12/yr;
$50+/yr draws refusal unless it replaces hardware (charts). Clubs spend on volunteer time, not
money. Reel owners pay $15–$35 per reel without complaint; the complaint is the wait.

## 7. Counter-evidence

| # | Verbatim quote | Who / where | URL | Date | Note |
|---|---|---|---|---|---|
| N1 | "46 percent, also cited the desire to leave technology behind" … "most, 56 percent, simply don't recognize the need" … "only 25 percent of those anglers use apps related to fishing" | Southwick Associates (AnglerSurvey.com) | https://www.southwickassociates.com/smartphone-app-use-and-todays-angler/ | ~2018 ("8 years ago") | survey |
| N2 | "I don't do a fishing log, but feel like I carry one with me wherever I go" | Fogman, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-software/50371 | 2013-08-21 | memory beats log |
| N3 | "Besides in a heavy bite situation are you really going to be punching in fish identifications in a gps?" (never kept a log) | Fred67, charlestonfishing | https://forum.charlestonfishing.com/t/gps-enhancement-idea/80483 | 2017-05-29 | in-trip entry rejected |
| N4 | "FlickerFisher, your idea may work, but it seems too complicated to me." | spec, charlestonfishing | https://forum.charlestonfishing.com/t/gps-enhancement-idea/80483 | 2017-05-29 | prefers Word doc |
| N5 | "I like paper instead so may change but this is what I am trying right now." | Shane0714, charlestonfishing | https://forum.charlestonfishing.com/t/keeping-a-log/78798 | 2017-03-09 | paper preference |
| N6 | "Total horse hocky that you need a dadburn smart phone application" | OldSchool, charlestonfishing | https://forum.charlestonfishing.com/t/fish-rules-app/87913 | 2019-02-06 | anti-app, regs |
| N7 | "I cannot imagine ever needing an app on a phone having to do with flyfishing, especially one from Orvi$." … "Info here at FAOL is FREE. Leave the phone at home and enjoy the outdoors." | DG1, FAOL | https://www.flyanglersonline.com/t/orvis-ultimate-fly-fishing-app-review/46053 | 2011-06-07 | anti-app |
| N8 | "Just mt 2% of a dollar, YMMV." (objects to using a phone while fishing) | Kaboom1, FAOL | https://www.flyanglersonline.com/t/orvis-ultimate-fly-fishing-app-review/46053 | 2011-06-07 | anti-app |
| N9 | "There was a time when I didn't allow cell phones in my boat." … "I'm more focused on fishing and enjoying my time away from it all" | Nick Simonson (columnist), Marshall Independent | https://www.marshallindependent.com/opinion/local-columns/2024/07/disconnect | 2024-07-24 | just go fishing |
| N10 | "I know my smartphone has made me dumber and I don't want the latest technology to do the same when it comes to fishing." … "To me most of this stuff only muddies the water and confuses us more and more" | Jason Houchins, On The Line | https://ontheline.beehiiv.com/p/is-all-that-necessary-by-jason-houchins | 2014-06-08 | just go fishing |
| N11 | "Put the phone away and enjoy it." | Scott Null (guide), Texas Saltwater Fishing Magazine | https://www.texassaltwaterfishingmagazine.com/fishing/by-type/opinion-narrative/please-leave-message | 2016-03 | guide's view |
| N12 | "But at the same time, I'd prefer nobody posted anything on the app ever." | Pete Scharf, Outdoor Life | https://www.outdoorlife.com/fishing/are-fishing-apps-doing-more-harm-than-good/ | 2022-07-20 | spot burning |
| N13 | "As long as I am TD I will still use the paper forms as well as a tracking model." | Chipman, charlestonfishing | https://forum.charlestonfishing.com/t/2015-tournaments/61884 | 2014-12-16 | paper at weigh-in |
| N14 | "Documented misery." … (now rarely logs; fishes when he can) | D1fishr / suburban86, stripersonline | https://www.stripersonline.com/surftalk/topic/922281-are-logs-still-relevant-in-the-surf/ | 2026-10-13/14 | logs abandoned as fishery declines |
| N15 | "I choose not to take time away from fishing to record data." | handle n/a, bassresource (snippet) | https://www.bassresource.com/bass-fishing-forums/topic/151461-fishing-logs/ | n.d. | anti-logging |
| N16 | "shut it off...stick it in the glove box....fish." | handle n/a, bassresource (snippet) | https://www.bassresource.com/bass-fishing-forums/topic/161812-phone-apps/ | n.d. | anti-app |
| N17 | "Paying for it is a waste. Plenty of free online groups with better information." | P., worldsapps (Fishbrain) | https://worldsapps.com/reviews-fishbrain-fishing-app | 2024-07-25 | free alternatives suffice |
| N18 | "I mostly just mark waypoints on the depthfinder." | Spoonmaster, charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 | 2019-03-07 | hardware suffices |

---

## 8. Pain heatmap (jobs × segments, 0–3 from the evidence above)

0 = no evidence found (often "not measured", see §0); 1 = mentions; 2 = repeated complaints with
workarounds; 3 = many independent handles, workarounds built or money spent. Cells scoring 3 are
justified below the table.

| Job | FW bank/boat | Bass tourn. | Fly | SW inshore | Offshore/charter | Surf | Kayak | Ice | Cat/crappie |
|---|---|---|---|---|---|---|---|---|---|
| log-trips | 2 | 1 | 2 | **3** | 1 | 2 | 1 | 0 | 0 |
| find-spots | **3** | 1 | 2 | 2 | 1 | 1 | 1 | 0 | 0 |
| plan-conditions | 1 | 1 | 1 | **3** | **3** | 2 | 1 | 0 | 0 |
| regulations | 2 | 0 | 1 | **3** | 2 | 1 | 0 | 0 | 0 |
| gear-inventory | 2 | 1 | **3** | 1 | 0 | 1 | 0 | 0 | 0 |
| gear-maintenance | 2 | 1 | 1 | **3** | 2 | **3** | 1 | 0 | 0 |
| tournament | 1 | 2 | 0 | **3** | 1 | 0 | 2 | 0 | 0 |
| club-admin | 0 | 1 | 1 | 2 | 0 | 1 | 0 | 0 | 0 |
| guide-booking | 0 | 0 | 2 | 2 | **3** | 0 | 0 | 0 | 0 |
| guide-ops | 0 | 0 | 1 | 2 | 2 | 0 | 0 | 0 | 0 |
| shop-ops | 2 | 0 | 1 | **3** | 1 | 2 | 0 | 0 | 0 |
| learning | 1 | 0 | **3** | 2 | 0 | 1 | 0 | 0 | 0 |
| sharing | **3** | 0 | 2 | 1 | 0 | 1 | 0 | 0 | 0 |

Justifications for 3s:
- log-trips × SW inshore: 30+ Charleston handles across six threads 2011–2019 (E3–E35) describing
  spreadsheets, tide logs, notebooks, lapses and app wishes.
- find-spots × FW bank/boat: Fishbrain's spot data drew the largest single complaint cluster (F7–
  F17), including a trespassing charge (F14) and "deceptive" membership (F9).
- plan-conditions × SW inshore: five app-recommendation threads (P2–P9) plus the Fishing Points
  accuracy/pricing cluster (P10–P17).
- plan-conditions × offshore: FishTrack billing and forecast complaints at intensity 3 (P18–P21)
  and the Navionics subscription/chart-loss cluster (P22–P27).
- regulations × SW inshore: licence-renewal thread (R1–R6), Fish Rules thread with offline
  failure offshore (R9–R15), SC DNR app (R28–R29).
- gear-inventory × fly: ten FAOL handles on materials/fly inventories with Excel and database
  workarounds (G4–G16).
- gear-maintenance × SW inshore: 20+ Charleston handles on service frequency, where to service,
  5-week waits, $15–$35 pricing and a retiring repairman (M4–M32, M44–M45).
- gear-maintenance × surf: a dedicated StripersOnline sub-forum; JDM service refusal, Van Staal
  wrench failures, bearing sourcing, OEM support complaints (M33–M43).
- tournament × SW inshore: one striper club's directors and members documented paper forms, a
  self-built scoring model, standings corrections and director burnout (T1–T13).
- guide-booking × offshore/charter: 15 Trustpilot handles incl. two operators on commission
  ranking, plus no-shows and lost cancellations (B1–B15).
- shop-ops × SW inshore: shop manager's own posts on seasonal rush and pricing (S1–S2), customer
  reports of backlog (S3–S4, S7), tech retirement (S17).
- learning × fly: beginner thread with "SO MUCH information" (L1–L6) and the Orvis app price debate
  (L12–L14).
- sharing × FW bank/boat: eight 2026 Fishbrain reviews on paywalled browsing (H3–H9) plus toxicity
  (H2) and spot-burning (H1).

## 9. Top 10 takeaways for the lead

1. **Logging fails on habit, not features; the ask is capture-for-me, not share-with-everyone.**
   46 handles; the dominant pattern is start-lapse-regret (E1, E2, E5, E16, E31, E32, E37) with
   Excel/tide-log/notebook workarounds (§4). The most repeated explicit wishes are automatic
   condition capture, export and pattern analysis (W6–W11, W14–W15, P29–P30). Non-social and
   no-location are named as selling points (E18, H13–H16).
2. **Reel service is the strongest founder-fit pain and it sits on the access side.** 44 handles.
   Anglers do not know where to go (M20, M22, M25, M37), wait 5–8 weeks or 20–30 business days
   (M1, M26, M29, M46, M49), cannot get parts or specs (M21, M33, M39, M40), and lose techs to
   retirement (M27). Service is symptom-driven ("wait until the bail doesn't flip smoothly", M8;
   "Always forget", M8). A shop-side intake/status/history tool with angler-side reminders has no
   visible incumbent; validate with reel techs by interview because no first-person tech software
   complaint was found (§3.11 summary).
3. **Small-club tournament admin is paper + a volunteer's spreadsheet, and the volunteers quit.**
   T1–T13: "no one wants to do the tournament director job" (T4), $2,700 hardware refused (T2), a
   member built the scoring model (T3), standings corrections are public (T10–T12). Weighfish
   proves clubs will pay $70–$285/yr (Y29) when it works at the ramp (T19). Caveat: evidence is
   one club deep; needs BassResource/Reddit confirmation.
4. **Fishbrain's paywall defines the price ceiling and the opening.** Y12–Y18, H3–H9: $6/mo and
   $70–100/yr are refused for "simple stuff"; $10–$15 one-time or ~$12/yr is paid gladly (Y1–Y5,
   Y7–Y8). Any paid utility should be priced under $20/yr or one-time.
5. **Forecast/"fish activity" scores are distrusted; tide/moon context attached to one's own data
   is wanted.** P10–P14, P18 vs P29–P30, W18–W19. Do not build forecasting; integrate NOAA tide and
   weather into the record automatically.
6. **Regulations are a strong need already served by agencies and Fish Rules; residual pains are
   offline refresh offshore (R12–R13, R19), coverage (R21), stale state apps (R24–R27) and
   remembering multi-year licence expiry (R2, R4).** Only a reminder/licence-wallet sliver is open
   to a solo founder, and the Alaska survey shows users expect it free (Y32).
7. **Spot data is a liability as much as an asset.** Wrong/private/misleading pins (F11–F17) and
   location leakage (F8, F16, F22–F23) are the second-largest complaint cluster; a private
   waypoint record with manual coordinate entry and export (W23–W24, F27) is the safe version.
8. **Tackle inventory is real but low-intensity except for fly tiers**, who already run Excel
   with stock levels (G8–G9) and would use a database (G10–G11). Demand is for one-time price,
   multi-device sync and backup (G21–G22, Y21), and for gear records to link to catches without
   per-rig re-entry (G26–G27). Best bundled with gear-maintenance history, not sold alone.
9. **Guide/charter pain is communication and commissions, not fish.** No-shows and missed
   cancellation notices on both sides (B6–B13, B16, B18), captains resenting ranking-by-commission
   (B1–B2). Established flat-fee vendors exist; opportunity is niche (e.g., weather-reschedule
   messaging) rather than a new marketplace.
10. **Design for the desk after the trip, not the deck.** 46% of non-app anglers want to leave
    tech behind (N1); in-trip data entry is rejected (N3, N13); apps are used before (71%) far more
    than after (14%) a trip (I84), which is exactly when logs, service records and club results
    get written. Counter-evidence also warns that a declining fishery erodes logging motivation
    (N14) and that free forums satisfy sharing (N17).

Jobs below the ≥8 independent-handle bar or failing the 3-platform rule: **club-admin** (15
handles but effectively one forum/one club; provisional), **guide-ops** (13 handles, but only two
first-person admin complaints), **kayak / ice / catfish-crappie segments** (not measured).

## 10. Sources

One row per page or numeric claim. Quote rows in §§3–7 carry their own URL and date and map to the
page IDs below via the URL. `Published` is the page's own date; `n.d.` = none shown.

| ID | Claim / number | Value | Publisher | URL | Published | Accessed | Used in |
|----|----------------|-------|-----------|-----|-----------|----------|---------|
| I1 | Thread "Fishing Log Software" (quotes) | — | forum.charlestonfishing.com | https://forum.charlestonfishing.com/t/fishing-log-software/50371 | 2013-08-20 | 2026-10-20 | E3, E4, F6, N2, W1 |
| I2 | Thread "Fishing Log App" | — | charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-app/72425 | 2016-05-02 | 2026-10-20 | E5, E6, W3 |
| I3 | Thread "Fishing Log Apps?" | — | charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-apps/70256 | 2016-01-15 | 2026-10-20 | E7, E8, H12, W4 |
| I4 | Thread "Fishing Log/Journal" | — | charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-journal/89081 | 2019-03-06 | 2026-10-20 | E10–E19, H13, W9 |
| I5 | Thread "Keeping a log" | — | charlestonfishing | https://forum.charlestonfishing.com/t/keeping-a-log/78798 | 2017-03-08 | 2026-10-20 | E20–E24, N5 |
| I6 | Thread "Fishing journal/record keeping" | — | charlestonfishing | https://forum.charlestonfishing.com/t/fishing-journal-record-keeping/30965 | 2011-04-28 | 2026-10-20 | E9, E24–E28, W5 |
| I7 | Thread "Fishing Log Online/software" | — | charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-online-software/29939 | 2011-02-08 | 2026-10-20 | E29, E30, W2 |
| I8 | Thread "Fishing Log Book" | — | charlestonfishing | https://forum.charlestonfishing.com/t/fishing-log-book/84966 | 2018-03-19 | 2026-10-20 | E11, E31–E33, W8 |
| I9 | Thread "GPS Enhancement Idea" | — | charlestonfishing | https://forum.charlestonfishing.com/t/gps-enhancement-idea/80483 | 2017-05-28 | 2026-10-20 | E34, E35, N3, N4, W6, W7 |
| I10 | Thread "tide apps" | — | charlestonfishing | https://forum.charlestonfishing.com/t/tide-apps/67853 | 2015-09-15 | 2026-10-20 | P2–P4, W21 |
| I11 | Thread "Weather Apps" | — | charlestonfishing | https://forum.charlestonfishing.com/t/weather-apps/49479 | 2013-07-25 | 2026-10-20 | P5 |
| I12 | Thread "Best Smartphone Apps? Wind/Wave, etc" | — | charlestonfishing | https://forum.charlestonfishing.com/t/best-smartphone-apps-wind-wave-etc/31362 | 2011-05-16 | 2026-10-20 | P6–P8, W20 |
| I13 | Thread "Water temp and fishing app" | — | charlestonfishing | https://forum.charlestonfishing.com/t/water-temp-and-fishing-app/78496 | 2017-02-20 | 2026-10-20 | P9, W22 |
| I14 | Thread "Fishing Points app" | — | charlestonfishing | https://forum.charlestonfishing.com/t/fishing-points-app/91118 | 2019-09-15 | 2026-10-20 | P34, L19 |
| I15 | Thread "Best Fishing / Boating related apps" | — | charlestonfishing | https://forum.charlestonfishing.com/t/best-fishing-boating-related-apps/77205 | 2016-12-13 | 2026-10-20 | P31 |
| I16 | Thread "GPS iPhone Apps?" | — | charlestonfishing | https://forum.charlestonfishing.com/t/gps-iphone-apps/53288 | 2013-11-30 | 2026-10-20 | F1–F3, W23, Y3 |
| I17 | Thread "GPS Apps" | — | charlestonfishing | https://forum.charlestonfishing.com/t/gps-apps/85786 | 2018-05-16 | 2026-10-20 | F4, F5, H18 |
| I18 | Thread "Any Good Fishing Apps?" | — | charlestonfishing | https://forum.charlestonfishing.com/t/any-good-fishing-apps/33867 | 2011-08-25 | 2026-10-20 | P32, P33, W42, Y5 |
| I19 | Thread "free Navionics app" | — | charlestonfishing | https://forum.charlestonfishing.com/t/free-navionics-app/57347 | 2014-06-02 | 2026-10-20 | Y4 |
| I20 | Thread "Fish rules app" | — | charlestonfishing | https://forum.charlestonfishing.com/t/fish-rules-app/87913 | 2018-11-03 | 2026-10-20 | R9–R15, L18, N6 |
| I21 | Thread "New SC DNR app" | — | charlestonfishing | https://forum.charlestonfishing.com/t/new-sc-dnr-app/94359 | 2022-03-15 | 2026-10-20 | R28, R29, W33 |
| I22 | Thread "SAFMC App Quit Working" | — | charlestonfishing | https://forum.charlestonfishing.com/t/safmc-app-quit-working/77449 | 2016-12-29 | 2026-10-20 | R30 |
| I23 | Thread "License Renewal!!" | — | charlestonfishing | https://forum.charlestonfishing.com/t/license-renewal/48645 | 2013-07-01 | 2026-10-20 | R1–R6 |
| I24 | Thread "NEW FISHING CLUB APP" (AtTheRamp) | — | charlestonfishing | https://forum.charlestonfishing.com/t/new-fishing-club-app/81964 | 2017-08-14 | 2026-10-20 | T8, C5 |
| I25 | Thread "Tournament Director" | — | charlestonfishing | https://forum.charlestonfishing.com/t/tournament-director/73298 | 2016-06-07 | 2026-10-20 | T4, T7, C1–C5 |
| I26 | Thread "2015 tournaments" | — | charlestonfishing | https://forum.charlestonfishing.com/t/2015-tournaments/61884 | 2014-12-12 | 2026-10-20 | T1–T8, W37, W38, W40, Y28, N13 |
| I27 | Thread "TOTY Standings - Correction" | — | charlestonfishing | https://forum.charlestonfishing.com/t/toty-standings-correction/77345 | 2016-12-21 | 2026-10-20 | T10, T11, C15 |
| I28 | Thread "Corrected YTD points" | — | charlestonfishing | https://forum.charlestonfishing.com/t/corrected-ytd-points/63618 | 2015-03-24 | 2026-10-20 | T12, C7–C9 |
| I29 | Thread "March Tournament results" | — | charlestonfishing | https://forum.charlestonfishing.com/t/march-tournament-results/55392 | 2014-03-17 | 2026-10-20 | T2, C7 |
| I30 | Thread "March MSC Tournament" | — | charlestonfishing | https://forum.charlestonfishing.com/t/march-msc-tournament/71327 | 2016-03-15 | 2026-10-20 | T10, C6 |
| I31 | Thread "SCSSA Summer Oceanic Results" | — | charlestonfishing | https://forum.charlestonfishing.com/t/scssa-summer-oceanic-results/32489 | 2011-06-21 | 2026-10-20 | T13 |
| I32 | Thread "February tournament results" | — | charlestonfishing | https://forum.charlestonfishing.com/t/february-tournament-results/63124 | 2015-02-24 | 2026-10-20 | T2, T3, T9, W41 |
| I33 | Thread "Any saltwater clubs taking new members" | — | charlestonfishing | https://forum.charlestonfishing.com/t/any-saltwater-clubs-taking-new-members/54593 | 2014-02-05 | 2026-10-20 | C10–C14, L7 |
| I34 | Thread "Reel Maintence" | — | charlestonfishing | https://forum.charlestonfishing.com/t/reel-maintence/83938 | 2017-12-27 | 2026-10-20 | M4–M7, L8, L9, W29 |
| I35 | Thread "Get the salt out" | — | charlestonfishing | https://forum.charlestonfishing.com/t/get-the-salt-out/49157 | 2013-07-16 | 2026-10-20 | M11, M13–M15 |
| I36 | Thread "Clean reels after every use?" | — | charlestonfishing | https://forum.charlestonfishing.com/t/clean-reels-after-every-use/51998 | 2013-10-11 | 2026-10-20 | M8–M12 |
| I37 | Thread "Columbia reel servicing?" | — | charlestonfishing | https://forum.charlestonfishing.com/t/columbia-reel-servicing/60137 | 2014-09-25 | 2026-10-20 | M20, M21, S19, W31 |
| I38 | Thread "Reel service" (2017) | — | charlestonfishing | https://forum.charlestonfishing.com/t/reel-service/77551 | 2017-01-03 | 2026-10-20 | M22–M24, S7, Y25 |
| I39 | Thread "Reels" (2012) | — | charlestonfishing | https://forum.charlestonfishing.com/t/reels/38461 | 2012-05-18 | 2026-10-20 | M25, M26, S4 |
| I40 | Thread "Mr Blocker has officially retired" | — | charlestonfishing | https://forum.charlestonfishing.com/t/mr-blocker-has-officially-retired/28976 | 2010-10-18 | 2026-10-20 | M27, M28, S17 |
| I41 | Thread "Reel Service Special"; labour $15/$18 and $20/$25 | $15–$25 | charlestonfishing (Haddrell's staff post) | https://forum.charlestonfishing.com/t/reel-service-special/24605 | 2009-12-04 | 2026-10-20 | M45, S2, Y26 |
| I42 | Thread "Full Service for Spring"; $20 clean-and-lube | $20 | charlestonfishing (Haddrell's staff) | https://forum.charlestonfishing.com/t/full-service-for-spring/44699 | 2013-01-29 | 2026-10-20 | M32, M44, S1 |
| I43 | Thread "PENN FISHING REEL PARTS, SERVICE AND WARRANTY" | — | charlestonfishing | https://forum.charlestonfishing.com/t/penn-fishing-reel-parts-service-and-warranty/43360 | 2012-11-15 | 2026-10-20 | M31, S1 |
| I44 | Thread "All Sold"; $10 diagnostic fee | $10 | charlestonfishing | https://forum.charlestonfishing.com/t/all-sold/78101 | 2017-01-31 | 2026-10-20 | M29, S3 |
| I45 | Thread "Bottom Fishing rod/reel setup"; Avet $35 flat fee | $35 | charlestonfishing | https://forum.charlestonfishing.com/t/bottom-fishing-rod-reel-setup/38698 | 2012-05-28 | 2026-10-20 | M28, Y23 |
| I46 | Thread "SOLD 2 Shimano Stradic…"; $90 for 3 reels serviced | $90 | charlestonfishing | https://forum.charlestonfishing.com/t/sold-2-shimano-stradic-ci4-3000s-1-shimano-c/75430 | 2016-09-13 | 2026-10-20 | M30, Y24 |
| I47 | Thread "New Tackle Shop, Maybe" | — | charlestonfishing | https://forum.charlestonfishing.com/t/new-tackle-shop-maybe/47264 | 2013-05-22 | 2026-10-20 | S8–S12 |
| I48 | Thread "Massive inshore/nearshore tackle sale" | — | charlestonfishing | https://forum.charlestonfishing.com/t/massive-inshore-nearshore-tackle-sale/76931 | 2016-11-28 | 2026-10-20 | G24 |
| I49 | Thread "Murrells Inlet guide" | — | charlestonfishing | https://forum.charlestonfishing.com/t/murrells-inlet-guide/73622 | 2016-06-21 | 2026-10-20 | B16, B17 |
| I50 | Thread "Career Searching" | — | charlestonfishing | https://forum.charlestonfishing.com/t/career-searching/62670 | 2015-01-28 | 2026-10-20 | O1–O7 |
| I51 | Search blurbs (guide/clients; apps; spreadsheet; club points) | — | charlestonfishing search.json | https://forum.charlestonfishing.com/search.json?q=guide%20clients%20booking | n.d. | 2026-10-20 | O12, O13, §1.4 |
| I52 | Thread "The Fishing Log" | — | flyanglersonline.com | https://www.flyanglersonline.com/t/the-fishing-log/6126 | 2004-06-28 | 2026-10-20 | E2 |
| I53 | Thread "material database" | — | flyanglersonline | https://www.flyanglersonline.com/t/material-database/19651 | 2006-05-14 | 2026-10-20 | G9–G12, W26 |
| I54 | Thread "My Inventory is Growing Uh Oh..." | — | flyanglersonline | https://www.flyanglersonline.com/t/my-inventory-is-growing-uh-oh/36860 | 2009-08-29 | 2026-10-20 | G4–G9 |
| I55 | Thread "Hook Inventory Recommendations" | — | flyanglersonline | https://www.flyanglersonline.com/t/hook-inventory-recommendations/38496 | 2009-12-14 | 2026-10-20 | G13, G14 |
| I56 | Thread "Android Apps" | — | flyanglersonline | https://www.flyanglersonline.com/t/android-apps/48265 | 2012-02-22 | 2026-10-20 | L11, W28 |
| I57 | Thread "Orvis Ultimate Fly Fishing App Review"; $14.99 | $14.99 | flyanglersonline | https://www.flyanglersonline.com/t/orvis-ultimate-fly-fishing-app-review/46053 | 2011-06-07 | 2026-10-20 | L12–L14, N7, N8, Y20 |
| I58 | Thread "What do you expect from a guided trip???" | — | flyanglersonline | https://www.flyanglersonline.com/t/what-do-you-expect-from-a-guided-trip/12451 | 2005-03-08 | 2026-10-20 | B19–B21, O11, L20 |
| I59 | Thread "Equipment Suggestions/Advice to an absolute beginner" | — | flyanglersonline | https://www.flyanglersonline.com/t/equipment-suggestions-advice-to-an-absolute-beginner/41147 | 2010-05-08 | 2026-10-20 | L1–L6 |
| I60 | Search blurbs: "Starting Over", "how to orginize your fly box????" | — | flyanglersonline search.json | https://www.flyanglersonline.com/search.json?q=fly%20box%20inventory | n.d. | 2026-10-20 | G15, G16 |
| I61 | Thread "Are logs still relevant in the surf?" | — | stripersonline.com | https://www.stripersonline.com/surftalk/topic/922281-are-logs-still-relevant-in-the-surf/ | 2026-10-13 | 2026-10-20 | E36–E38, N14 |
| I62 | Thread "Time spent on a spot" | — | stripersonline | https://www.stripersonline.com/surftalk/topic/922464-time-spent-on-a-spot/ | 2026-10-20 | 2026-10-20 | E39, F24, L10 |
| I63 | Thread "Will Anyone Service JDM Shimanos?" | — | stripersonline | https://www.stripersonline.com/surftalk/topic/918266-will-anyone-service-jdm-shimanos/ | 2026-06-20 | 2026-10-20 | M33, M34, S18, W30 |
| I64 | Thread "Van Staal VR service" | — | stripersonline | https://www.stripersonline.com/surftalk/topic/913338-van-staal-vr-service/ | 2026-02-13 | 2026-10-20 | M35, M36 |
| I65 | Thread "Van Staal Service" | — | stripersonline | https://www.stripersonline.com/surftalk/topic/922240-van-staal-service/ | 2026-10-12 | 2026-10-20 | M37 |
| I66 | Thread "Where to Buy Good Bearings" | — | stripersonline | https://www.stripersonline.com/surftalk/topic/885761-where-to-buy-good-bearings/ | 2024-04-18 | 2026-10-20 | M38–M41, W32 |
| I67 | Thread "Having a right back and forth with Shimano USA" | — | stripersonline | https://www.stripersonline.com/surftalk/topic/922315-having-a-right-back-and-forth-with-shimano-usa/ | 2026-10-15 | 2026-10-20 | M42 |
| I68 | Thread "Spinning reel maintenance questions" | — | stripersonline | https://www.stripersonline.com/surftalk/topic/913092-spinning-reel-maintenance-questions/ | 2026-02-07 | 2026-10-20 | M43 |
| I69 | Forum indexes: Main Forum (no app threads in 50), Reel Maintenance and Repair (50 threads), Kayak | — | stripersonline | https://www.stripersonline.com/surftalk/forum/52-reel-maintenance-and-repair/ | n.d. | 2026-10-20 | §1.6, §1.7 |
| I70 | Ditch Trolls club forum index; "Ditch Troll Membership List" thread | — | stripersonline | https://www.stripersonline.com/surftalk/forum/42-ditch-trolls/ | 2016-02-11 (thread) | 2026-10-20 | C17 |
| I71 | Thread "Really a reel question" | — | sdfish.org | https://www.sdfish.org/viewtopic.php?p=28999 | 2026-06-16 | 2026-10-20 | M1–M3, S5, S6 |
| I72 | Thread "Reel Maintenance" (Big Shark Gear) | — | southfloridasharkclub.com | https://www.southfloridasharkclub.com/community/big-shark-gear/reel-maintenance/ | 2009-06-22 | 2026-10-20 | M16–M19 |
| I73 | Thread "Game Warden Tickets"; $250 first offence (hearsay) | $250 | northwestfishingreports.com | https://northwestfishingreports.com/forum/viewtopic.php?p=4846 | 2007-06-08 | 2026-10-20 | R7, R8 |
| I74 | Thread "inventory app" | — | forums.androidcentral.com | https://forums.androidcentral.com/threads/inventory-app.33715 | 2010-09-08 | 2026-10-20 | G1–G3, W25 |
| I75 | Thread "How Many Rods in Your Quiver?" (page 2 of 6) | — | paflyfish.com | https://www.paflyfish.com/posts/1038714/ | 2026-07-05 | 2026-10-20 | G17–G20 |
| I76 | Article "The Challenge of Keeping an Up-To-Date Fishing Log" + comments | — | On The Water (Jimmy Fee) | https://onthewater.com/the-challenge-of-keeping-an-up-to-date-fishing-log | 2012-01-11 | 2026-10-20 | E1, E56 |
| I77 | Article "4 Tips for Fishing Log Success" + comments | — | On The Water (Jimmy Fee) | https://onthewater.com/4-tips-for-fishing-log-success | 2012-01-19 | 2026-10-20 | E55, §4 |
| I78 | Article "Are Fishing Apps Doing More Harm Than Good?" | — | Outdoor Life (Joe Cermele) | https://www.outdoorlife.com/fishing/are-fishing-apps-doing-more-harm-than-good/ | 2022-07-20 | 2026-10-20 | F22, F23, H1, S16, N12 |
| I79 | Editor's Log "Facebook Fishing Wars" | — | The Fisherman (Matt Broderick) | https://www.thefisherman.com/article/editors-log-facebook-fishing-wars/ | 2023-11 | 2026-10-20 | H17 |
| I80 | Article "Winter Workshop: Tackling The Tackle" | — | The Fisherman (Tony Salerno) | https://www.thefisherman.com/article/winter-workshop-tackling-the-tackle/ | 2022-02 | 2026-10-20 | G28, M47, §2 |
| I81 | Column "Please leave message" | — | Texas Saltwater Fishing Magazine (Scott Null) | https://www.texassaltwaterfishingmagazine.com/fishing/by-type/opinion-narrative/please-leave-message | 2016-03 | 2026-10-20 | P1, O10, N11 |
| I82 | Column "Disconnect" | — | Marshall Independent (Nick Simonson) | https://www.marshallindependent.com/opinion/local-columns/2024/07/disconnect | 2024-07-24 | 2026-10-20 | N9 |
| I83 | Post "Is all that necessary?" | — | On The Line (Jason Houchins) | https://ontheline.beehiiv.com/p/is-all-that-necessary-by-jason-houchins | 2014-06-08 | 2026-10-20 | N10 |
| I84 | Anglers owning smartphones / using fishing apps / reasons not / when used | 85% own; 25% use apps; 56% no need; 46% leave tech behind; 71% before, 53% during, 14% after | Southwick Associates (AnglerSurvey.com) | https://www.southwickassociates.com/smartphone-app-use-and-todays-angler/ | ~2018 ("8 years ago") | 2026-10-20 | N1, §1, §2, takeaway 10 |
| I85 | Alaska licence holders: 14% understood regs "well"; 60% at least somewhat confusing; 29% "easy" to find; 82% would use an ADF&G app; 88% want regs for current location; 76% want all regs in one place; n=3,955 | as listed | ADF&G / DJ Case & Associates (Daniel Escher) | https://www.adfg.alaska.gov/static/fishing/PDFs/sport/Survey_Report-2018-9-19.pdf | 2018-09-19 | 2026-10-20 | R33, W36, Y32, §1.3 |
| I86 | Fishbrain App Store listing: 4.7★, 76K ratings; Premium $14.99/mo; Annual package $79.99; reviews | 4.7; 76K; $14.99; $79.99 | Apple App Store | https://apps.apple.com/us/app/fishbrain-fishing-app/id477967747 | accessed | 2026-10-20 | E40, E41, P28, Y17, Y19 |
| I87 | Fishbrain negative reviews (mirror) | — | justuseapp.com | https://justuseapp.com/en/app/477967747/fishbrain-fishing-app/reviews | n.d. | 2026-10-20 | F7–F12, H10, Y15, Y16 |
| I88 | Fishbrain negative reviews (mirror); rating split 45/10/25/20% | — | worldsapps.com | https://worldsapps.com/reviews-fishbrain-fishing-app | 2024–2026 (review dates) | 2026-10-20 | F13–F16, H2, H11, Y13, Y14, Y18 |
| I89 | Fishbrain complaint shares: paywalls ~40%, billing ~15%, private spots ~10%, family sharing ~5% (AI aggregate; treat as rough) | 40/15/10/5% | onclarity.com | https://www.onclarity.com/leaderboard/insight/fishbrain | 2026-10-20 | 2026-10-20 | F17 |
| I90 | Fishbrain rating 4.1/5 from ~11k reviews (7,380 five-star; 1,614 one-star) and May 2026 reviews (mirror) | 4.1; 11k | mwm.ai | https://mwm.ai/apps/fishbrain-fishing-app/477967747 | accessed | 2026-10-20 | F25, F26, H3–H9, Y12 |
| I91 | Fish Rules listing: 3.9★, 198 ratings; ProStaff $29.99; reviews | 3.9; 198; $29.99 | Apple App Store | https://apps.apple.com/us/app/fish-rules-local-fishing-laws/id597875361 | accessed | 2026-10-20 | R16–R18, L17, Y31 |
| I92 | Fish Rules negative reviews (mirror) | — | justuseapp.com | https://justuseapp.com/en/app/597875361/fish-rules-local-fishing-laws/reviews | n.d. | 2026-10-20 | R19–R22, W35 |
| I93 | ANGLR listing: 4.2★, 635 ratings; PRO $39.99; reviews | 4.2; 635; $39.99 | Apple App Store | https://apps.apple.com/us/app/fishing-app-anglr-logbook/id1142347232 | accessed | 2026-10-20 | E42, E43, W12 |
| I94 | ANGLR negative reviews (mirror) | — | justuseapp.com | https://justuseapp.com/en/app/1142347232/fishing-app-anglr-logbook/reviews | n.d. | 2026-10-20 | E44–E46, E57, G25–G27, W10, W17 |
| I95 | Anglers' Log listing: 4.7★, 303 ratings; Pro $1.49/mo, $11.99/yr; reviews | 4.7; 303; $11.99/yr | Apple App Store | https://apps.apple.com/us/app/anglers-log-fishing-journal/id959989008 | accessed | 2026-10-20 | E52–E54, W13, W14, Y1, Y2 |
| I96 | Anglers' Log reviews (mirror; 302 analysed, 20 shown) | — | justuseapp.com | https://justuseapp.com/en/app/959989008/anglers-log-fishing-journal/reviews | n.d. | 2026-10-20 | E49–E51, F27, F28, W15, W16, W24, Y33 |
| I97 | SmartTacklebox listing: 1.0★, 2 ratings; Pro $5.99; free tier 20 lures | 1.0; $5.99 | Apple App Store | https://apps.apple.com/us/app/smarttacklebox/id1021114662 | accessed | 2026-10-20 | G21, Y21 |
| I98 | Weighfish listing: 4.7★, 106 ratings; Director Pro $9.99/mo, $69.99/yr; Elite $284.99/yr | as listed | Apple App Store | https://apps.apple.com/us/app/weighfish-fishing-tournament-manager/id1355191001 | accessed | 2026-10-20 | T14, T19, W39, Y29 |
| I99 | Fishing Chaos listing: 3.9★, 86 ratings; free | 3.9; 86 | Apple App Store | https://apps.apple.com/us/app/fishing-chaos/id1494960277 | accessed | 2026-10-20 | §1.2 |
| I100 | Fish Washington listing: 4.3★, 7K ratings; reviews | 4.3; 7K | Apple App Store | https://apps.apple.com/us/app/fish-washington/id1329839426 | accessed | 2026-10-20 | R23–R25 |
| I101 | Texas Outdoor Annual listing: 3.6★, 258 ratings; reviews | 3.6; 258 | Apple App Store | https://apps.apple.com/us/app/texas-outdoor-annual/id874391813 | accessed | 2026-10-20 | R26, R27 |
| I102 | ReelLicense listing: $19.95/yr; reminders 30/7/0 days; no ratings | $19.95 | Apple App Store | https://apps.apple.com/us/app/reellicense/id6782386257 | accessed | 2026-10-20 | §1, takeaway 6 |
| I103 | Fishing Spots (FishAngler) listing: 4.7★, 11K ratings; VIP $6.99/$49.99 | 4.7; 11K | Apple App Store | https://apps.apple.com/us/app/fishing-spots-fish-maps/id417922502 | accessed | 2026-10-20 | F18, L21, L22 |
| I104 | "Fishing Log" (2012 app) listing: $4.99 + IAP; last update 2023-07-24 | $4.99 | Apple App Store | https://apps.apple.com/us/app/fishing-log/id508487103 | accessed | 2026-10-20 | §4 context |
| I105 | BUBBA listing: 4.8★, 3.1K ratings; reviews | 4.8; 3.1K | Apple App Store | https://apps.apple.com/us/app/bubba/id1607037466 | accessed | 2026-10-20 | E47, E48, W11 |
| I106 | FishBench listing: $2.99; offline/no-GPS/export claims; no ratings | $2.99 | Apple App Store | https://apps.apple.com/us/app/fishbench/id6775768374 | accessed | 2026-10-20 | H19, Y22 |
| I107 | Navionics Boating listing: 2.9★, 2.4K ratings; regions $49.99–$69.99/yr; reviews | 2.9; 2.4K; $49.99 | Apple App Store | https://apps.apple.com/us/app/navionics-boating/id744920098 | accessed | 2026-10-20 | P22, P23, Y6, Y7, Y11 |
| I108 | Navionics negative reviews (mirror) | — | justuseapp.com | https://justuseapp.com/en/app/744920098/navionics-boating/reviews | n.d. | 2026-10-20 | P24–P27 |
| I109 | Fishing Points listing: 4.7★, 31K ratings; Yearly Premium $49.99; reviews | 4.7; 31K; $49.99 | Apple App Store | https://apps.apple.com/us/app/fishing-points-map-forecast/id1203032512 | accessed | 2026-10-20 | F19, P10, Y8–Y10 |
| I110 | Fishing Points negative reviews (mirror) | — | justuseapp.com | https://justuseapp.com/en/app/1203032512/fishing-points-map-forecast/reviews | n.d. | 2026-10-20 | F20, F29, P11–P17 |
| I111 | TourneyX PRO listing: 4.7★, 111 ratings; free; reviews | 4.7; 111 | Apple App Store | https://apps.apple.com/us/app/tourneyx-pro/id1478882171 | accessed | 2026-10-20 | §1.7 |
| I112 | TourneyX reviews (mirror) | — | justuseapp.com | https://justuseapp.com/en/app/1478882171/tourneyx-pro/reviews | n.d. | 2026-10-20 | T18 |
| I113 | iAngler Tournament listing: 2.8★, 13 ratings; reviews | 2.8; 13 | Apple App Store | https://apps.apple.com/us/app/iangler-tournament/id872669180 | accessed | 2026-10-20 | T15–T17 |
| I114 | FishDonkey listing: 4.0★, 86 ratings; angler fee on join | 4.0; 86 | Apple App Store | https://apps.apple.com/us/app/fishdonkey/id1170550251 | accessed | 2026-10-20 | §1.2 |
| I115 | Picture Fish listing: 4.5★, 5.4K ratings; Premium $29.99/yr; reviews | 4.5; 5.4K; $29.99 | Apple App Store | https://apps.apple.com/us/app/picture-fish-fish-identifier/id1474584436 | accessed | 2026-10-20 | L15, L16 |
| I116 | TroutRoutes listing: 4.5★, 3.9K ratings; PRO $39.99/yr; reviews | 4.5; 3.9K; $39.99 | Apple App Store | https://apps.apple.com/us/app/troutroutes-fly-fishing-app/id1423989574 | accessed | 2026-10-20 | F21, R31, R32, W34 |
| I117 | FishTrack listing: 4.6★, 6.3K ratings; Premium $14.99/mo, $95.99/yr; reviews | 4.6; 6.3K; $95.99 | Apple App Store | https://apps.apple.com/us/app/fishtrack-charts-forecasts/id952022603 | accessed | 2026-10-20 | P18–P21 |
| I118 | The Tackle Box listing: 4.2★, 19 ratings; Pro $5.99 one-time; free tier 10 items | 4.2; 19; $5.99 | Apple App Store | https://apps.apple.com/us/app/the-tackle-box/id1516432631 | accessed | 2026-10-20 | G22, G23 |
| I119 | Belmar Fishing Club app listing (custom club app, free, no ratings) | — | Apple App Store | https://apps.apple.com/us/app/belmar-fishing-club/id6761139117 | accessed | 2026-10-20 | C16 |
| I120 | iTunes Search API ratings/counts: Navionics 2.86/2,352; Fishbrain 4.66/75,883; Fishing Points 4.66/30,997; Tides Near Me 4.79/163,182; FishAngler 4.77/13,893; onX Fish 4.65/1,791; TroutRoutes 4.47/3,900; TourneyX 4.71/111; iAngler 2.85/13; FishDonkey 3.95/86; Fishing Chaos 3.91/86; Picture Fish 4.46/5,410; FishVerify 4.61/2,216; Solunar Time 4.72/15,733; The Tackle Box 4.16/19 | as listed | Apple iTunes Search API | https://itunes.apple.com/search?term=fishing+tournament&entity=software&country=us&limit=10 | accessed | 2026-10-20 | §1, §8 |
| I121 | FishingBooker Trustpilot: TrustScore 4.3, 375 reviews; captain and customer reviews | 4.3; 375 | Trustpilot | https://www.trustpilot.com/review/fishingbooker.com | accessed (reviews 2022–2026) | 2026-10-20 | B1–B15, B22, Y30 |
| I122 | TripWorks case study, Poseidon Fishing Charters (vendor-published) | — | TripWorks | https://www.tripworks.com/case-study/platform-grows-with-my-business | n.d. | 2026-10-20 | B18, O9 |
| I123 | QuickBooks Community thread by a fishing guide | — | Intuit QuickBooks Community | https://quickbooks.intuit.com/learn-support/en-us/reports-and-accounting/how-do-i-categorize-boat-gas-fishing-guide-service/00/1015468 | 2022-01-19 | 2026-10-20 | O8 |
| I124 | Product Hunt page for AnglerSlate (maker + 5 comments) | — | Product Hunt | https://www.producthunt.com/products/anglerslate-fishing-log | ~2026-07 | 2026-10-20 | P29, P30, H14–H16, W18, W19 |
| I125 | Reel servicing policy: annual; warranty neglect; 4+ weeks turnaround (longer in summer); from $75; uncollected after 3 months sold | as listed | Marine Deals NZ help centre | https://help.marine-deals.co.nz/support/solutions/articles/44002335033-all-about-reel-servicing | n.d. | 2026-10-20 | M46, S13, Y27 |
| I126 | Reel maintenance guide; owner bio (30 years bench experience) | — | Mike's Reel Repair | https://www.mikesreelrepair.com/fishing-reel-maintenance-guide/ | 2024-06-17 | 2026-10-20 | S15 |
| I127 | Club points and tie-break rules | — | Hawg Hawlers Bass Club | https://www.hawghawlers.com/points.html | 2013 (copyright) | 2026-10-20 | T21 |
| I128 | Daiwa Australia service turnaround "20-30 business days" (search snippet; page 429 on fetch) | 20–30 business days | Daiwa Australia | https://daiwafishing.com.au/pages/service-spare-parts-and-repair-forms | n.d. | 2026-10-20 | M49, S14 |
| I129 | BassResource snippets (threads 151461, 187059, 114466, 161812, 181890, 225106); handles not visible | — | bassresource.com (via search snippets; site 403) | https://www.bassresource.com/bass-fishing-forums/topic/151461-fishing-logs/ | n.d. | 2026-10-20 | E58, G29, M48, S20, L23, N15, N16 |
| I130 | Guru.com job posting "bass fishing tournament management app"; 21 quotes received (snippet; page 403) | 21 quotes | guru.com | https://www.guru.com/jobs/bass-fishing-tournament-management-app/2119825 | n.d. | 2026-10-20 | T20 |
| I131 | BassResource kayak snippets: TourneyX "needed to submit fish in tourneys"; yearly membership for added features | — | bassresource.com (snippet) | https://www.bassresource.com/bass-fishing-forums/topic/211541-smart-phone-fishing-apps/ | n.d. | 2026-10-20 | §1.7 |
| I132 | iceshanty Fishbrain thread; one user "worthless" (snippet; site bot-walled) | — | iceshanty.com | https://iceshanty.com/threads/does-anyone-use-fishbrain.379708/ | n.d. | 2026-10-20 | §1.8 |
