-- ecommerce_queries.sql
SELECT product_id, SUM(sales) AS revenue
FROM orders
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 5;
