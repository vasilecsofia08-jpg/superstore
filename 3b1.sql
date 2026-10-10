WITH daily_sales AS (
    SELECT 
        sale_date,
        SUM(total_amount) AS total_amount
    FROM 
        flourmills_sales
    GROUP BY 
        sale_date
)
SELECT 
    sale_date,
    total_amount
FROM 
    daily_sales
WHERE 
    total_amount > 3000000
ORDER BY 
    total_amount DESC;
git add .
git commit -m " uloha 1 "
git push