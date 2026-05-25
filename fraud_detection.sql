-- ============================================================
-- Fraud Detection & Transaction Risk Analysis
-- Tool: SQLite | Dataset: Credit Card Fraud Detection (Kaggle)
-- Transactions Analyzed: 1,296,675
-- ============================================================


-- Query 1: Fraud Overview
-- Purpose: Get a high-level summary of total transactions,
--          fraud cases, fraud rate, and total amount processed.

SELECT 
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS total_fraud_cases,
    ROUND(100.0 * SUM(is_fraud) / COUNT(*), 2) AS fraud_rate_pct,
    ROUND(SUM(amt), 2) AS total_amount_processed
FROM transactions;


-- Query 2: Fraud-Prone Merchant Categories
-- Purpose: Identify which merchant categories have the highest
--          fraud rates and total fraudulent amounts.

SELECT 
    category,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_cases,
    ROUND(100.0 * SUM(is_fraud) / COUNT(*), 2) AS fraud_rate_pct,
    ROUND(SUM(amt), 2) AS total_fraudulent_amount
FROM transactions
GROUP BY category
ORDER BY fraud_rate_pct DESC
LIMIT 5;


-- Query 3: High-Risk Transaction Classification
-- Purpose: Classify transactions into risk tiers based on
--          transaction amount and fraud status using CASE logic.

SELECT 
    merchant,
    category,
    amt,
    city,
    state,
    CASE
        WHEN amt > 500 AND is_fraud = 1 THEN 'Confirmed High Risk'
        WHEN amt > 500 AND is_fraud = 0 THEN 'Flagged for Review'
        WHEN amt BETWEEN 100 AND 500 AND is_fraud = 1 THEN 'Medium Risk Fraud'
        ELSE 'Low Risk'
    END AS risk_classification
FROM transactions
WHERE amt > 100
ORDER BY amt DESC
LIMIT 50;


-- Query 4: Geographic Fraud Analysis
-- Purpose: Find which US states have the most fraud cases
--          and the highest fraud rates.

SELECT 
    state,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_cases,
    ROUND(AVG(amt), 2) AS avg_transaction_amount,
    ROUND(100.0 * SUM(is_fraud) / COUNT(*), 2) AS fraud_rate_pct
FROM transactions
GROUP BY state
ORDER BY fraud_cases DESC
LIMIT 10;


-- Query 5: Spending Anomaly Detection
-- Purpose: Compare average transaction amounts between
--          fraudulent and legitimate transactions per category
--          to identify where fraud spikes the most.

SELECT 
    category,
    ROUND(AVG(CASE WHEN is_fraud = 1 THEN amt END), 2) AS avg_fraud_amount,
    ROUND(AVG(CASE WHEN is_fraud = 0 THEN amt END), 2) AS avg_legitimate_amount,
    ROUND(
        AVG(CASE WHEN is_fraud = 1 THEN amt END) -
        AVG(CASE WHEN is_fraud = 0 THEN amt END),
    2) AS spend_anomaly_gap
FROM transactions
GROUP BY category
ORDER BY spend_anomaly_gap DESC;
