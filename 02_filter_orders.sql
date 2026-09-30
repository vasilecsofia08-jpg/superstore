SELECT o.orders_id, c.name_customer, o.sales FROM orders o JOIN customers c ON o.customer_id = c.customer_id WHERE o.sales >500 ORDER BY o.sales DESC;
git add .
git commit -m "Add task 2 filter orders"
git push
