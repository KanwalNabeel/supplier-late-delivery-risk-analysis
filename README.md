# Supplier Delivery Risk & Cost Analysis

**Business question:** Which shipping tiers are driving late deliveries across our network, why, and what is it costing in profit?

## Key Finding

Overall late delivery rate is **57.3%** across ~180K orders — but the problem isn't spread evenly. It's concentrated almost entirely in the "fast" shipping tiers:

| Shipping Mode | Late Rate | Promised Days | Actual Days |
|---|---|---|---|
| First Class | **100.0%** | 1.0 | 2.0 |
| Second Class | 79.8% | 2.0 | 4.0 |
| Same Day | 47.9% | 0.0 | 0.5 |
| Standard Class | 39.8% | 4.0 | 4.0 |

**First and Second Class consistently take ~2x their promised delivery window — every time, not occasionally.** Standard Class, by contrast, hits its promised window exactly. This rules out random operational failure; the pattern points to the promised delivery windows for "fast" tiers being structurally unrealistic rather than a fulfillment slowdown.

**Cost impact:** Late orders earn ~$1.09 less profit on average than on-time orders ($21.62 vs. $22.71). Across ~99,000 late orders, that's an estimated **~$108,000** in reduced profit — a small per-order gap that compounds at scale.

## Recommendation

Re-evaluate the promised delivery windows for First Class and Second Class shipping specifically — either the fulfillment process needs restructuring to actually hit a 1-2 day window, or the promise itself should be adjusted to match realistic fulfillment capacity (as Standard Class already does).

## Dashboard

🔗 [Live interactive dashboard on Tableau Public](https://public.tableau.com/app/profile/kanwal.nabeel/viz/SupplyChainDeliveryRiskAnalysis/Dashboard?publish=yes)

## Methodology

- **Data:** DataCo Smart Supply Chain dataset (~180K orders)
- **Tools:** PostgreSQL (via DBeaver) for analysis, Tableau Public for visualization
- Canceled orders excluded from all rate calculations, since an order that never shipped can't be classified as late or on-time
- See `/sql/` for full query set

## Repo Structure

```
├── README.md
├── sql/
│   ├── 01_baseline_late_rate.sql
│   ├── 02_shipping_mode_breakdown.sql
│   ├── 03_scheduled_vs_actual.sql
│   └── 04_profit_by_status.sql
└── data/
    └── (exported summary CSVs used in dashboard)
```
