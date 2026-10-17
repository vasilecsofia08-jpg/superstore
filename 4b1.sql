WITH RankedOrders AS (
    SELECT 
        c.customer_name,
        o.order_id,
        o.order_date,
        ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date DESC) AS rn
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
)
SELECT 
    customer_name,
    order_id,
    order_date
FROM RankedOrders
WHERE rn <= 2
ORDER BY customer_name, rn;
git add .
git commit -m "uloha 1"
git push