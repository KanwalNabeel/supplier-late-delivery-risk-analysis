-- Breaks down late delivery rate by shipping mode to identify 
-- which tiers are driving the overall late rate
SELECT 
  "Shipping Mode",
  COUNT(*) AS total_shipped,
  SUM(CASE WHEN "Delivery Status" = 'Late delivery' THEN 1 ELSE 0 END) AS late_count,
  ROUND(
    SUM(CASE WHEN "Delivery Status" = 'Late delivery' THEN 1 ELSE 0 END)::numeric 
    / COUNT(*) * 100, 
    1
  ) AS late_rate_pct
FROM orders_raw
WHERE "Delivery Status" != 'Shipping canceled'
GROUP BY "Shipping Mode"
ORDER BY late_rate_pct DESC;
