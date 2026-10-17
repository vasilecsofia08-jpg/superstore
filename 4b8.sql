WITH FirstPurchases AS (
    SELECT 
        customer_id,
        MIN(DATE_TRUNC('month', order_date)::DATE) AS first_purchase_month
    FROM orders
    GROUP BY customer_id
)
SELECT COUNT(*) AS returning_customers_count
FROM FirstPurchases fp
WHERE fp.first_purchase_month = '2024-06-01'
  AND EXISTS (
      SELECT 1 
      FROM orders o 
      WHERE o.customer_id = fp.customer_id 
        AND DATE_TRUNC('month', o.order_date)::DATE > fp.first_purchase_month
  );

  git add .
git commit -m "uloha 8"
git push