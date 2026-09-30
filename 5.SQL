SELECT 
    p.product_name,
    CASE 
        WHEN SUM(o.sales) IS NULL THEN 0 
        ELSE SUM(o.sales) 
    END AS total_sales
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name;

git add .
git commit -m "Add task 5 "
git push