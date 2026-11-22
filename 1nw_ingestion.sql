CREATE SCHEMA IF NOT EXISTS bronze;

CREATE TABLE IF NOT EXISTS bronze.categories (
    categoryid INT,
    categoryname VARCHAR(25),
    description VARCHAR(255),
    _source_file TEXT DEFAULT 'categories.csv',
    _loaded_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS bronze.suppliers (
    supplierid INT,
    suppliername VARCHAR(50),
    contactname VARCHAR(50),
    address VARCHAR(50),
    city VARCHAR(20),
    postalcode VARCHAR(10),
    country VARCHAR(15),
    phone VARCHAR(15),
    _source_file TEXT DEFAULT 'suppliers.csv',
    _loaded_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS bronze.products (
    productid INT,
    productname VARCHAR(50),
    supplierid INT,
    categoryid INT,
    unit VARCHAR(25),
    price NUMERIC(10,2),
    _source_file TEXT DEFAULT 'products.csv',
    _loaded_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS bronze.customers (
    customerid INT,
    customername VARCHAR(50),
    contactname VARCHAR(50),
    address VARCHAR(50),
    city VARCHAR(20),
    postalcode VARCHAR(10),
    country VARCHAR(15),
    _source_file TEXT DEFAULT 'customers.csv',
    _loaded_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS bronze.employees (
    employeeid INT,
    lastname VARCHAR(15),
    firstname VARCHAR(15),
    birthdate TIMESTAMP,
    photo VARCHAR(25),
    notes VARCHAR(1024),
    _source_file TEXT DEFAULT 'employees.csv',
    _loaded_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS bronze.shippers (
    shipperid INT,
    shippername VARCHAR(25),
    phone VARCHAR(15),
    _source_file TEXT DEFAULT 'shippers.csv',
    _loaded_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS bronze.orders (
    orderid INT,
    customerid INT,
    employeeid INT,
    orderdate TIMESTAMP,
    shipperid INT,
    _source_file TEXT DEFAULT 'orders.csv',
    _loaded_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS bronze.orderdetails (
    orderdetailid INT,
    orderid INT,
    productid INT,
    quantity INT,
    _source_file TEXT DEFAULT 'orderdetails.csv',
    _loaded_at TIMESTAMPTZ DEFAULT now()
);

BEGIN;

TRUNCATE bronze.categories;
\COPY bronze.categories (categoryid, categoryname, description) FROM 'categories.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';', ENCODING 'UTF8')

TRUNCATE bronze.suppliers;
\COPY bronze.suppliers (supplierid, suppliername, contactname, address, city, postalcode, country, phone) FROM 'suppliers.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';', ENCODING 'UTF8')

TRUNCATE bronze.products;
\COPY bronze.products (productid, productname, supplierid, categoryid, unit, price) FROM 'products.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';', ENCODING 'UTF8')

TRUNCATE bronze.customers;
\COPY bronze.customers (customerid, customername, contactname, address, city, postalcode, country) FROM 'customers.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';', ENCODING 'UTF8')

TRUNCATE bronze.employees;
\COPY bronze.employees (employeeid, lastname, firstname, birthdate, photo, notes) FROM 'employees.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';', ENCODING 'UTF8')

TRUNCATE bronze.shippers;
\COPY bronze.shippers (shipperid, shippername, phone) FROM 'shippers.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';', ENCODING 'UTF8')

TRUNCATE bronze.orders;
\COPY bronze.orders (orderid, customerid, employeeid, orderdate, shipperid) FROM 'orders.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';', ENCODING 'UTF8')

TRUNCATE bronze.orderdetails;
\COPY bronze.orderdetails (orderdetailid, orderid, productid, quantity) FROM 'orderdetails.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';', ENCODING 'UTF8')

COMMIT;
