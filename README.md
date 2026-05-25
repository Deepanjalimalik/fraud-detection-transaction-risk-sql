# Fraud Detection & Transaction Risk Analysis
**SQL | SQLite | 1.29M+ Transactions**

## Overview
Credit card fraud costs the US financial industry $10B+ annually. This project uses SQL to analyze 1.29M real transactions — identifying which merchant categories, geographies, and spending patterns carry the highest fraud risk.

## Key Findings
- **Fraud rate: 0.58%** — 7,506 fraudulent transactions out of 1.29M+
- **Online shopping** had the highest fraud rate at **1.76%**
- Fraudulent transactions averaged **$927 more** than legitimate ones in online shopping
- **New York** had the most fraud cases (555); **Ohio** had the highest fraud rate (0.69%)
- High-value **travel transactions** ($10K+) were the most frequently flagged category

## Queries Covered
1. Overall fraud overview — totals, fraud rate, volume
2. Fraud breakdown by merchant category
3. High-risk transaction classification using CASE statements
4. Geographic fraud analysis by US state
5. Spending anomaly detection — fraud vs. legitimate transaction amounts

*Techniques: aggregation, GROUP BY, CASE statements, subqueries, fraud rate calculation, anomaly thresholds*

## Tools
**SQL, SQLite, DB Browser for SQLite**

## Dataset
[Credit Card Fraud Detection — Kaggle](https://www.kaggle.com/datasets/kartik2112/fraud-detection)

## Files
- `fraud_detection.sql` — all 5 SQL queries
- `Fraud_Detection_SQL_Analysis.pdf` — full analysis with results and insights

---
*Part of my data analytics portfolio — [github.com/Deepanjalimalik](https://github.com/Deepanjalimalik)*
