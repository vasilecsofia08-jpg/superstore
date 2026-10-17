SELECT 
    c.region,
    c.customer_name,
    SUM(o.profit) AS total_profit,
    RANK() OVER (
        PARTITION BY c.region 
        ORDER BY SUM(o.profit) DESC
    ) AS rank_profit,
    DENSE_RANK() OVER (
        PARTITION BY c.region 
        ORDER BY SUM(o.profit) DESC
    ) AS dense_rank_profit
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region, c.customer_id, c.customer_name
ORDER BY c.region, total_profit DESC;

git add .
git commit -m "uloha 2"
git push