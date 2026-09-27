-- Quantifies the profit impact of late deliveries vs. on-time/advance shipments
SELECT 
  "Delivery Status",
  COUNT(*) AS order_count,
  ROUND(AVG("Order Profit Per Order")::numeric, 2) AS avg_profit_per_order
FROM orders_raw
WHERE "Delivery Status" != 'Shipping canceled'
GROUP BY "Delivery Status"
ORDER BY avg_profit_per_order;
