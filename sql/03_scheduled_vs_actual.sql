-- Compares promised (scheduled) vs. actual shipping days by mode
-- to test whether lateness is a fulfillment problem or a promise-setting problem
SELECT 
  "Shipping Mode",
  ROUND(AVG("Days for shipment (scheduled)"), 1) AS avg_scheduled_days,
  ROUND(AVG("Days for shipping (real)"), 1) AS avg_actual_days,
  ROUND(AVG("Days for shipping (real)" - "Days for shipment (scheduled)"), 1) AS avg_days_over
FROM orders_raw
WHERE "Delivery Status" != 'Shipping canceled'
GROUP BY "Shipping Mode"
ORDER BY avg_days_over DESC;
