SELECT 
    product_name, 
    total_amount 
FROM 
    flourmills_sales 
WHERE 
    total_amount > (SELECT AVG(total_amount) FROM flourmills_sales);
git add .
git commit -m " uloha 1 "
git push