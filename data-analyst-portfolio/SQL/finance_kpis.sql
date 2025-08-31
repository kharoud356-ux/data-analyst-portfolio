-- finance_kpis.sql
-- MRR, churned revenue, and Net Revenue Retention (example schema)
WITH invoices AS (
  SELECT customer_id, invoice_month, amount, is_churned
  FROM billing
),
mrr AS (
  SELECT invoice_month, SUM(amount) AS mrr
  FROM invoices
  GROUP BY 1
),
churn_rev AS (
  SELECT invoice_month, SUM(amount) AS churned_rev
  FROM invoices
  WHERE is_churned = 1
  GROUP BY 1
)
SELECT mrr.invoice_month, mrr.mrr, COALESCE(churn_rev.churned_rev,0) AS churned_revenue
FROM mrr
LEFT JOIN churn_rev ON churn_rev.invoice_month = mrr.invoice_month
ORDER BY 1;
