-- marketing_ab_testing.sql
-- Two-proportion z-test setup via SQL (counts per variant)
WITH summary AS (
  SELECT variant,
         SUM(CASE WHEN converted = 1 THEN 1 ELSE 0 END) AS conversions,
         COUNT(*) AS users
  FROM ab_events
  GROUP BY variant
)
SELECT *,
       (conversions::float / users) AS cr
FROM summary;
-- Statistical test usually done outside SQL, but these aggregates feed Python/R/BI.
