# Bench Tag prototype

Interactive, single-file prototype of **Bench Tag**: job tracking for reel service techs, rod
repairers and custom rod builders. Built from `docs/product-definition.md` (§4a features, §5
flows and email subjects, §5d status enum and labels, §10 routes, §11 pricing, §16 red-team
revisions), the pain quotes in `docs/validation-gate.md` §1 and the price points in
`research/monetization.md` §4.

## Open it

`deliverables/prototype.html` is one file: inline CSS and JS, system fonts, no build step, no
external requests of any kind. 222 KB.

- Double-click it (file://) or serve the folder (`python3 -m http.server` in `deliverables/`) and
  open `prototype.html`. Works the same either way.
- It is a hash-routed mini app. Useful entry points:
  - `#/` landing and pricing → "Open the demo" starts the 30-second tour
  - `#/s/storm-proof-tackle` the shop's public page; `/request` the request form
  - `#/t/<token>` a customer's status page (the Customer switch in the top bar lists the links)
  - `#/app` today board · `#/app/jobs` · `#/app/jobs/new` · `#/app/jobs/:id` · `#/app/customers`
    · `#/app/billing` · `#/app/settings` · `#/app/page`
- The top bar is the demo harness: a role switch (Shop · Customer · Public page), Tour, Reset
  demo. Everything below it is the product as its user sees it.
- State lives in memory. Nothing is written to localStorage; a reload restores the seed data
  (so does "Reset demo").
- Light and dark theme follow the system setting; the demo clock is frozen on Wed 2026-10-21 so
  the dates stay realistic.

## The demo shop

Storm Proof Tackle, Virginia Beach, VA. 14 open jobs across the statuses (Penn Spinfisher VI
4500 "drag slips under load" with a quote waiting, Shimano Stradic FL 3000 diagnosing, Daiwa BG
4000 on the bench, Abu Garcia Revo SX waiting for back-ordered bearings with a moved promised
date, Van Staal VS150 and Penn Senator 113H ready, a 7'6" inshore custom build with a 50%
deposit, a tip replacement, a guide re-wrap, two public-page requests, a declined Curado, an
overdue Saltist, an approved Makaira with prepaid parts), 14 closed jobs for history, 14
customers, 13 services with real-world prices and turnarounds, a payments history, every
customer and shop email per §5 in each job's timeline, and the October meter at 23 jobs → $23.00
of the $29.00 cap (14 collected as a fee on customer card payments, 9 on the ledger). All names,
numbers and addresses are fictional; emails use example.com.

## Flows that are real across views (one in-memory state)

1. **Public page → request.** Kind toggle, service list filtered by kind, brand/model/serial/
   problem, contact, return method, demo Turnstile. Submit creates a customer, item and job at
   `requested`, writes `intake_received` (customer) and `new_request` (shop), and shows the
   confirmation with the short job code (e.g. `SPT-4F7K`), a QR placeholder and the status link
   that opens the customer view for that job. A rod service with a deposit opens the demo
   checkout; paying it moves a rod order to `received` ("Order confirmed") and writes
   `deposit_paid`.
2. **Find my job** on the public page: job code + phone or email opens the status page without
   the email (§16 #2).
3. **Today board** (overdue, new requests, due this week, ready and waiting with the 7-day
   reminder, waiting on the customer) → **job detail** → the big **Next step** button follows the
   §5d transition table for the item's kind; "Other" lists the rest. `received` records the usage
   event (meter +1) and emails `item_received` with the promised date defaulted from the
   service's turnaround; `received → diagnosing` sends nothing; in_progress / waiting_parts /
   finishing send `status_update`; ready asks pickup or ship and sends `ready_pickup` /
   `ready_ship` with the balance; the close sheet does picked up / shipped (carrier + tracking,
   `shipped` email) / returned unrepaired / abandoned, and refuses to close with a balance unless
   "Close anyway" with a reason.
4. **Quote.** Add lines (part, labour, shipping, fee, discount), note, expiry → Send → job
   `quote_sent`, email *Quote from {Shop} for your {item}: ${total}*. Revise supersedes. The shop
   can record a phone approval or decline on the customer's behalf.
5. **Customer status page** (`/t/:token`): status hero with the §5d customer label, promised
   date, shop contact, quote card with Approve / Decline, balance card, customer-visible photos,
   shipping card when shipped, timeline of visible history, emails and payments, policy footer,
   "Powered by Bench Tag". Approve → job `approved`, shop email *{First} approved your quote for
   #{n} (${total})*.
6. **Payments.** Balance = service price + approved quote + return shipping (if shipped) +
   estimate fee (if declined) − deposits − payments. Send payment link (email), Collect by card
   now (checkout on the shop's phone), Mark paid cash/check. The customer's Pay button opens the
   demo checkout; success records the payment, shows the receipt line, emails the shop
   *Payment received: ${amount} for #{n} {item}*, and moves that job's $1 from the ledger to the
   fee-collected side of the meter. The optional "$1.00 online service fee" line appears when
   pass-the-fee is on in Settings.
7. **Counter intake** (`/app/jobs/new`): customer picker by phone/email/name or new, kind
   toggle, service filtered by kind, price, promised date defaulted from turnaround, deposit
   chooser (none / estimate fee / 50% / custom; card on the phone, cash, check), photo add.
   Save → job at `received`, meter +1, `item_received` email, then a hang-tag **receipt** with
   the job code and QR placeholder and "Add another item for this customer".
8. **Customers**: search, items, job history, payments, contact editor, "Delete contact
   details" (PII deletion that keeps history, §16 #5).
9. **Billing**: this-month meter split into fee-collected and ledger with the ledger rule
   sentence, cap, idle-months note, $290 prepay (demo checkout → credit), card on file, invoice
   history.
10. **Settings**: profile, policies, Stripe as a state (Not connected / Charges enabled). With
    Stripe disconnected, intake, status emails and quotes keep working; only Deposit by card and
    Send payment link are disabled with a one-line explanation (§16 #3). Pass-the-fee toggle,
    CSV export of customers / items / jobs / quotes / payments (real Blob download plus a Copy
    alternative), danger zone with 30-day soft delete and undo.
11. **Public page settings**: publish switch, copy link, QR placeholder, "Closed until" switch
    (§16 #4) that puts "Closed until Tue Jan 12, 2027 — requests are still accepted and queued"
    on the public page while the form stays open, page text, phone-framed live preview.
12. **Tour**: five steps, each deep-linking to the matching screen with the relevant element
    highlighted (request form → next-step button → status hero → quote panel → billing meter).

## What is mocked

- **Stripe Checkout** is a modal labelled "Demo checkout — no card needed"; Pay succeeds after a
  short delay. No Stripe Connect onboarding (Settings just flips the state).
- **Cloudflare Turnstile** is a look-alike widget: tap to verify. The form refuses to submit
  until it is verified.
- **Email** is an in-memory outbox: every email the product would send is written with the §5
  subject and a one-line body and shown in the job timeline and on the status page. Nothing is
  sent.
- **Photos** are placeholder tiles (the file picker works; the image itself is not read).
- **QR codes** are deterministic placeholder patterns, not scannable.
- **Status tokens** are plain random strings in memory (the product hashes them at rest).
- No server, no auth, no persistence; the data is seeded in the file.

## Not shown

Onboarding wizard (`/app/onboarding`), login, `/app/services` editor (services come from the
seed), `/app/items/:id` (items appear on the customer page), scheduled reminders and expiries
(the 7-day reminder is seeded on one job; nothing runs on a timer), refunds, SMS, the
`/s/:slug/find` route as its own page (the form sits on the public page), and the day-90
scorecard (§16 #17).

## Verification

Script: `/tmp/claude-0/-home-user/822949d5-ad3f-50fc-bdc3-49b9599a745f/scratchpad/toolchain/probe/bt-verify.cjs`
(Playwright 1.56.1, headless Chromium 1194; kept out of the repo as instructed). It serves the
file over `python3 -m http.server`, drives it on a 390×844 mobile context and a 1280×800 desktop
context, and asserts each step.

Result on 2026-10-21: **96 of 96 assertions passed, 0 failed, 0 console errors, 0 page errors.**

Steps asserted (the core flow in order): landing headline, pricing sentence and three trade
quotes → tour opens at step 1 and deep-links to the request form with the highlight → public page
name, services with prices, policies, Find-my-job form → request form blocks submit until
Turnstile → submit creates job #1052 at `requested` from the public page with an unambiguous
short code, `intake_received` + `new_request` written, meter still 23 (14 fee + 9 ledger) →
status link opens that job's customer page ("Request received", item, code, shop phone) →
Find my job by code + phone opens the same page → today board lists the new request and an
overdue job → job detail: Next step = "Mark received" → `received` (promised date defaulted to
Nov 4 from the 14-day turnaround, meter 24, `item_received` subject correct) → "Start
diagnosing" → `diagnosing` with no extra email → Other-statuses sheet lists exactly
in_progress, waiting_parts, ready, cancelled → "Send a quote" opens the editor; two lines total
$24.95; send → `quote_sent`, subject *Quote from Storm Proof Tackle for your Penn Slammer IV
4500: $24.95* → customer page shows "Waiting for your approval" and both lines; Approve →
`approved`, shop email *Test approved your quote for #1052 ($24.95)* → shop: balance $69.95,
Send payment link writes the email → customer: Pay $69.95 opens the demo checkout; Pay →
"Paid in full" with the receipt line, balance 0, shop email *Payment received: $69.95 for #1052
Penn Slammer IV 4500* → job detail shows Paid in full → billing meter reads "24 jobs → $24.00",
split $15.00 fee-collected (15 jobs) / $9.00 ledger (9 jobs), with the ledger rule sentence.

Extra assertions: counter intake lands at `received` (meter 25) with the code on the receipt;
Stripe disconnected disables Send payment link while Next step still works; Closed-until banner
appears and the request form stays; Reset demo restores 23; 29 horizontal-overflow checks
(`scrollWidth <= innerWidth`) across 13 routes at 360 px and 390 px plus desktop, all pass; all
13 screenshots under 300 KB.

## Screenshots (`prototype/screenshots/`)

Phone 390 px: `phone-landing.png`, `phone-public-page.jpg`, `phone-status-page.png`
(quote waiting), `phone-today-board.png`, `phone-job-detail.png` (quote just sent),
`phone-billing.png`.
Desktop 1280 px: `desktop-landing.png`, `desktop-public-page.jpg`, `desktop-status-page.png`,
`desktop-today-board.png`, `desktop-job-detail.png` (#1047 with its quote and photos),
`desktop-billing.png`, `desktop-today-board-dark.png` (dark theme).

## Note on the claude.ai artifact copy

The same file is published as a private claude.ai artifact for click-through. The artifact viewer
blocks file downloads, so the Settings → "Export CSV" buttons do nothing there; they work when the
file is opened directly from disk or served locally.
