-- Calculates overall late delivery rate, excluding canceled orders 
-- (which never shipped and shouldn't count as "on time" or "late")
SELECT 
  COUNT(*) AS total_shipped,
  SUM(CASE WHEN "Delivery Status" = 'Late delivery' THEN 1 ELSE 0 END) AS late_count,
  ROUND(
    SUM(CASE WHEN "Delivery Status" = 'Late delivery' THEN 1 ELSE 0 END)::numeric 
    / COUNT(*) * 100, 
    1
  ) AS late_rate_pct
FROM orders_raw
WHERE "Delivery Status" != 'Shipping canceled';
