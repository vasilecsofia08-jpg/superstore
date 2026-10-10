
CREATE OR REPLACE VIEW analyst_orders AS
SELECT 
    order_id,
    customer_id,
    product_id,
    sales,
    quantity,
    discount
FROM 
    orders;

SELECT *
FROM analyst_orders;

git add .
git commit -m " uloha 3 "
git push