SELECT 
    c.customer_name,
    SUM(o.sales) AS total_sales,
    NTILE(4) OVER (ORDER BY SUM(o.sales) DESC) AS quartile
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_sales DESC;
git add .
git commit -m "uloha 3"
git push
