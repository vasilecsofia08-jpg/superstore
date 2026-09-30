SELECT 
    c.customer_name,
    o.order_id,
    o.sales
FROM customers c
FULL JOIN orders o ON c.customer_id = o.customer_id;


git add .
git commit -m "Add task 6 "
git push