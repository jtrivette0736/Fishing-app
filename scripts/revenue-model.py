#!/usr/bin/env python3
"""Revenue projection for the report (deliverables/report.md §7). Standard library only.

Every input is a sourced estimate; the ids are the research files' local ids as merged in
docs/sources.md. Run from anywhere: `python3 scripts/revenue-model.py`. Output is Markdown.

Inputs
- Seasonal demand profile and shop segment mix: red team season model (R41 / S692).
- Pricing: $1 per job created, capped at $29 per shop-month, $0 idle (C1, gate §7).
- Acquisition by channel: the gate's first-100 table (VS85 / S567; GA15 / S708) with the red
  team's corrections (alantani row 3–10 instead of 10–30, R12/R13; Facebook unmeasured, R23).
- Churn: 30–45% a year (GA13 / S706; red team §3e).
- Costs: product definition §9c (PD14 / S726): Supabase $25, Netlify $0 then $9, Resend $0/$20/$35,
  domain $1.25, Stripe on platform invoices 2.9% + 30¢ + 0.4% (D3 / S469; PD6 / S718).
"""
from __future__ import annotations

# Month 1 = December 2026 (launch per PD §16 change 13). Index 0..23.
MONTH_NAMES = ["Dec 26", "Jan 27", "Feb 27", "Mar 27", "Apr 27", "May 27", "Jun 27", "Jul 27",
               "Aug 27", "Sep 27", "Oct 27", "Nov 27", "Dec 27", "Jan 28", "Feb 28", "Mar 28",
               "Apr 28", "May 28", "Jun 28", "Jul 28", "Aug 28", "Sep 28", "Oct 28", "Nov 28"]
# Calendar month (1 = Jan) for each index.
CAL = [12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

# R41 demand profile relative to average, by calendar month.
PROFILE = {1: 1.0, 2: 1.1, 3: 1.4, 4: 1.4, 5: 1.2, 6: 1.0, 7: 0.6, 8: 0.4, 9: 0.5, 10: 0.7,
           11: 0.9, 12: 0.9}
# R41 segment mix: (share of shops, average jobs per month, calendar months closed).
SEGMENTS = [
    (0.30, 4, set()),          # rod builders, ~4 builds a month
    (0.30, 8, {8}),            # part-time techs, closed August
    (0.25, 18, {8, 9}),        # techs, closed Aug–Sep
    (0.15, 40, set()),         # counters / busy techs
]
PRICE_PER_JOB = 1.0
CAP = 29.0


def revenue_per_shop(cal_month: int) -> float:
    """Blended platform revenue per paying shop in a calendar month (R41 arithmetic)."""
    total = 0.0
    for share, jobs, closed in SEGMENTS:
        if cal_month in closed:
            continue
        units = jobs * PROFILE[cal_month]
        total += share * min(units * PRICE_PER_JOB, CAP)
    return total


# Gross new paying shops per month, by scenario. Each list has 24 entries (Dec 26 .. Nov 28).
# Derivation (12-month totals, year 1): conservative 51, base 105, optimistic 160.
#   conservative: Hampton Roads 3 (m1–2), alantani 3 (m1–4, R12/R13), outreach 20 (m1–12, 2% of
#     1,000), ICRBE 12 (m4–6), Facebook 8 (m2–12, half the gate low because unmeasured),
#     suppliers 5 (m4–12), loop 0.
#   base: Hampton Roads 5, alantani 10, outreach 30, ICRBE 18, Facebook 20, suppliers 15,
#     StripersOnline/YouTube 2, loop +10% of adds from m7 (≈5).
#   optimistic: Hampton Roads 6, alantani 20, outreach 40, ICRBE 25, Facebook 30, suppliers 20,
#     StripersOnline/YouTube 5, loop +20% from m7 (≈14).
# Year 2 repeats year 1's channel yields with the loop at 10% / 15% / 20% of adds.
def spread(total: float, months: list[int]) -> dict[int, float]:
    return {m: total / len(months) for m in months}


def build_adds(hr, alan, outreach, icrbe, fb, sup, misc, loop_share, year2_loop) -> list[float]:
    adds = [0.0] * 24
    plan = [
        spread(hr, [0, 1]), spread(alan, [0, 1, 2, 3]), spread(outreach, list(range(0, 12))),
        spread(icrbe, [3, 4, 5]), spread(fb, list(range(1, 12))), spread(sup, list(range(3, 12))),
        spread(misc, list(range(0, 12))),
        # year 2: same channels again (ICRBE Feb 2028 lands in m16–18)
        spread(alan * 0.5, [12, 13]), spread(outreach, list(range(12, 24))),
        spread(icrbe, [15, 16, 17]), spread(fb, list(range(12, 24))), spread(sup, list(range(12, 24))),
        spread(misc, list(range(12, 24))),
    ]
    for p in plan:
        for m, v in p.items():
            adds[m] += v
    for m in range(6, 24):
        adds[m] *= 1 + (loop_share if m < 12 else year2_loop)
    return adds


SCENARIOS = {
    "Conservative": dict(adds=build_adds(3, 3, 20, 12, 8, 5, 0, 0.0, 0.10), churn=0.45),
    "Base": dict(adds=build_adds(5, 10, 30, 18, 20, 15, 2, 0.10, 0.15), churn=0.40),
    "Optimistic": dict(adds=build_adds(6, 20, 40, 25, 30, 20, 5, 0.20, 0.20), churn=0.30),
}


def monthly_cost(shops: float, jobs: float) -> float:
    """PD §9c stack: Supabase $25; Netlify $0 (<300 shops) else $9; Resend by email volume
    (6 emails/job, PD14): Free ≤3,000, Pro $20 ≤50,000, $35 ≤100,000; domain $1.25.
    Stripe on platform invoices: assume 50% of active shops are billed through the ledger card
    charge (the rest through application fees, which carry no Stripe fee, R2/PD1); each ledger
    invoice costs 2.9% + $0.30 + 0.4% of the shop's monthly amount."""
    emails = jobs * 6
    resend = 0 if emails <= 3000 else 20 if emails <= 50000 else 35
    netlify = 9 if shops >= 300 else 0
    return 25 + netlify + resend + 1.25


def run(name: str, adds: list[float], churn: float) -> dict:
    monthly_churn = 1 - (1 - churn) ** (1 / 12)
    active = 0.0
    rows = []
    cumulative = 0.0
    for m in range(24):
        active = active * (1 - monthly_churn) + adds[m]
        cal = CAL[m]
        rps = revenue_per_shop(cal)
        revenue = active * rps
        # jobs implied: revenue below the cap equals jobs; approximate jobs from the segment model
        jobs = 0.0
        for share, j, closed in SEGMENTS:
            if cal in closed:
                continue
            jobs += active * share * j * PROFILE[cal]
        stripe = 0.5 * active * (0.033 * rps + 0.30) if active > 0 else 0.0
        cost = monthly_cost(active, jobs) + stripe
        cumulative += revenue
        rows.append(dict(month=MONTH_NAMES[m], active=active, rps=rps, revenue=revenue,
                         cost=cost, net=revenue - cost, cumulative=cumulative, jobs=jobs))
    return dict(name=name, rows=rows)


def fmt(x: float) -> str:
    return f"${x:,.0f}"


def main() -> None:
    print("Blended revenue per paying shop by calendar month (R41 segment model, $1/job, $29 cap):")
    print(", ".join(f"{m}: ${revenue_per_shop(m):.2f}" for m in range(1, 13)))
    annual = sum(revenue_per_shop(m) for m in range(1, 13))
    print(f"Annual per shop: ${annual:.0f}; average month ${annual / 12:.2f}\n")
    results = [run(n, s["adds"], s["churn"]) for n, s in SCENARIOS.items()]
    print("| Scenario | Month 3 (Feb 27): shops / revenue | Month 12 (Nov 27): shops / revenue / trailing 12 mo | Month 24 (Nov 28): shops / revenue / trailing 12 mo | Cumulative 24 mo | First month revenue ≥ costs |")
    print("|---|---|---|---|---|---|")
    for r in results:
        rows = r["rows"]
        m3, m12, m24 = rows[2], rows[11], rows[23]
        t12_a = sum(x["revenue"] for x in rows[0:12])
        t12_b = sum(x["revenue"] for x in rows[12:24])
        be = next((x["month"] for x in rows if x["net"] >= 0), "not in 24 months")
        print(f"| {r['name']} | {m3['active']:.0f} / {fmt(m3['revenue'])} | {m12['active']:.0f} / {fmt(m12['revenue'])} / {fmt(t12_a)} | {m24['active']:.0f} / {fmt(m24['revenue'])} / {fmt(t12_b)} | {fmt(m24['cumulative'])} | {be} |")
    print()
    print("Base scenario, month by month (active paying shops, revenue, third-party cost, net):")
    print("| Month | Shops | Rev/shop | Revenue | Cost | Net |")
    print("|---|---|---|---|---|---|")
    for x in results[1]["rows"]:
        print(f"| {x['month']} | {x['active']:.0f} | ${x['rps']:.2f} | {fmt(x['revenue'])} | {fmt(x['cost'])} | {fmt(x['net'])} |")
    print()
    for r in results:
        adds = SCENARIOS[r["name"]]["adds"]
        print(f"{r['name']}: gross adds year 1 = {sum(adds[:12]):.0f}, year 2 = {sum(adds[12:]):.0f}; churn {SCENARIOS[r['name']]['churn']:.0%}/yr")


if __name__ == "__main__":
    main()
