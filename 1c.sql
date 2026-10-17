CREATE DATABASE retail;
CREATE TABLE retail_sales (
    invoice_no VARCHAR(20),
    stock_code VARCHAR(50),
    description TEXT,
    quantity INTEGER,
    invoice_date TIMESTAMP,
    unit_price DECIMAL(10, 2),
    customer_id INTEGER,
    country VARCHAR(100)
);
git add .
 git commit -m "uloha 1"
git push

echo "# superstore" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/vasilecsofia08-jpg/superstore.git
git push -u origin main

