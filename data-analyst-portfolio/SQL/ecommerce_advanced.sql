-- ecommerce_advanced.sql
-- Monthly revenue, orders, and AOV
WITH agg AS (
  SELECT DATE_TRUNC('month', order_date) AS month,
         SUM(sales) AS revenue,
         COUNT(DISTINCT order_id) AS orders
  FROM orders
  GROUP BY 1
)
SELECT month, revenue, orders, revenue::numeric / NULLIF(orders,0) AS avg_order_value
FROM agg
ORDER BY month;

-- Top N customers by revenue per quarter
SELECT DATE_TRUNC('quarter', order_date) AS quarter, customer_id, SUM(sales) AS revenue
FROM orders
GROUP BY 1,2
QUALIFY ROW_NUMBER() OVER (PARTITION BY DATE_TRUNC('quarter', order_date) ORDER BY SUM(sales) DESC) <= 10;
