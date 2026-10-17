WITH CustomerActivity AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        MAX(o.order_date) OVER (PARTITION BY c.customer_id) AS last_order_date,
        MAX(o.order_date) OVER () AS latest_order_date
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
)
SELECT DISTINCT
    customer_id,
    customer_name,
    last_order_date
FROM CustomerActivity
WHERE last_order_date < latest_order_date - INTERVAL '90 days'
ORDER BY last_order_date ASC;

git add .
git commit -m "uloha 6"
git push