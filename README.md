# Retail Sales Profitability Analysis — Superstore

A national retailer's leadership sees healthy total sales but shrinking overall profit. Finance can't tell whether the problem is a few bad product lines, aggressive discounting, unprofitable regions, or all three. This project answers that with SQL and visualizes the findings in an interactive dashboard.

**[Live dashboard →](https://sebastianacosta261004-create.github.io/superstore-portfolio/dashboard/dashboard.html)**

## Tools
MySQL · HTML/CSS/JS (dashboard)
## Dataset
["Superstore Dataset" — Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final), originally published by Tableau. `data/Sample-Superstore.csv` — 9,994 US retail orders (2014–2017): order/ship dates, customer segment, region, product category/sub-category, sales, discount, and profit.

## Repo structure
```
superstore-portfolio/
├── data/
│   └── Sample-Superstore.csv
├── sql/
│   ├── 01_schema.sql              # table + indexes
│   ├── 02_load_data.sql           # CSV import
│   └── 03_business_questions.sql  # the 8 analysis queries below
├── dashboard/
│   └── dashboard.html
└── README.md
```

## Setup
```sql
SOURCE sql/01_schema.sql;
SOURCE sql/02_load_data.sql;
SOURCE sql/03_business_questions.sql;
```

## Business questions
1. Which sub-categories drive lots of revenue but are actually losing money?
2. Which region + category combinations are net unprofitable?
3. Is discounting killing margin? (profit margin by discount tier)
4. Who are the top 10 customers by actual profit contribution (not just order volume)?
5. Are we over-promising on fast shipping? (avg. delivery days by ship mode)
6. What does the monthly sales/profit trend look like — any seasonality?
7. Which states lose money despite decent sales volume?
8. Which customer segment (Consumer / Corporate / Home Office) is actually profitable?

## Dashboard
Four views built from the queries above: **Overview** (KPIs + monthly sales/profit trend), **Product Profitability** (margin by sub-category, region × category breakdown, loss-making states), **Discounting Impact** (margin by discount tier), and **Customers & Fulfillment** (top customers by profit, segment profitability, delivery time by ship mode).

## Key findings
Total sales are **$2.30M** with only **$286K** in profit — a **12.5%** overall margin, across 5,009 orders and 793 customers. That gap traces to three specific causes:

- **Two product lines are quietly losing money at scale.** Furniture > Tables loses **-$17,725** on $206,966 in sales (**-8.6%** margin) — the single biggest problem line in the dataset — and Bookcases is also net-negative (-3.0%). Both are top-6 sub-categories by sales, so the loss is easy to miss if you only look at revenue.
- **Discounting past 30% is actively destroying profit.** Orders with no discount run a healthy **+29.5%** margin; once discount passes 30%, margin flips to **-48.2%**. Capping standard discounts at 15% (still **+12.8%** margin) would protect most at-risk revenue without cutting all discounting.
- **Ten states lose money despite real sales volume**, even though only one region+category combination (Central/Furniture) is unprofitable overall — the state-level view catches losses the region-level view hides. Texas is the worst single market: **-$25,729** on $170,188 in sales, followed by Ohio (-$16,971) and Pennsylvania (-$15,560).

Two smaller findings: **Home Office is the most profitable segment (14.0% margin)** despite having the fewest customers (148 vs. 409 for Consumer), and **Same Day shipping delivers same-day as promised (0.04 days avg.)** while Standard Class averages 5 days.
