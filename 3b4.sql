
WITH customer_type_sales AS (

    SELECT 
        customer_type,
        SUM(total_amount) AS revenue
    FROM 
        flourmills_sales
    GROUP BY 
        customer_type
),
percentage_calculation AS (

    SELECT 
        customer_type,
        revenue,
        SUM(revenue) OVER () AS total_revenue,
        ROUND((revenue * 100.0) / SUM(revenue) OVER (), 2) AS revenue_percentage
    FROM 
        customer_type_sales
)

SELECT 
    customer_type,
    revenue,
    total_revenue,
    revenue_percentage
FROM 
    percentage_calculation
ORDER BY 
    revenue DESC;

git add .
git commit -m " uloha 4"
git push