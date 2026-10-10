
CREATE OR REPLACE PROCEDURE apply_regional_discount(
    p_region_name VARCHAR(20),
    p_discount_rate NUMERIC(5,2)
)
LANGUAGE plpgsql
AS $$
BEGIN
   
    UPDATE orders o
    SET sales = sales * (1 - p_discount_rate)
    FROM customers c
    WHERE o.customer_id = c.customer_id
      AND c.region = p_region_name;

    RAISE NOTICE 'Zľava % bola aplikovaná pre región %', p_discount_rate, p_region_name;
END;
$$;

CALL apply_regional_discount('West', 0.10);

git add .
git commit -m " uloha 9 "
git push