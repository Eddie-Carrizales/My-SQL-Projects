/*
Author: Edilberto F. Carrizales
Date: 02/20/2022

Description: This is a list of different SQL queries used on the Guitar_Shop_Database.sql

*/

/* Returns four columns from the Products table and sorts the result set by list price in descending sequence*/
SELECT 
    product_code, product_name, list_price, discount_percent
FROM
    PRODUCTS
ORDER BY list_price DESC;

/* 
* Returns one column from the Customers table named full_name that joins the last_name and first_name columns
* Sorts the result set by last name in ascending sequence and returns only the customers whose last name begins with letters from M to Z.
*/
SELECT 
    CONCAT(last_name, ', ', first_name) AS full_name
FROM
    CUSTOMERS
WHERE
    last_name > 'M'
ORDER BY last_name;

/* 
* Returns three columns from the Orders table
* Returns only the rows with a list price that’s greater than 500 and less than 2000.
* Sorts the result set in descending sequence by the date_added column. 
*/
SELECT 
    product_name, list_price, date_added
FROM
    PRODUCTS
WHERE
    list_price > 500 AND list_price < 2000
ORDER BY date_added DESC;

/* 
* Returns three columns from the Orders table 
* Returns only the rows where the ship_date column contains a null value
*/
SELECT 
    order_id, order_date, ship_date
FROM
    ORDERS
WHERE
    ship_date IS NULL;

/* 
* Joins the Categories table to the Products table and returns these columns: category_name, product_name, list_price. 
* The result set is sorted by category_name and then by product_name in ascending sequence.
*/
SELECT 
    category_name, product_name, list_price
FROM
    CATEGORIES
        JOIN
    PRODUCTS ON CATEGORIES.category_id = PRODUCTS.category_id
ORDER BY category_name , product_name;

/* 
* Joins the Customers table to the Addresses table and returns these columns: first_name, last_name, line1, city, state, zip_code. 
* Returns one row for each customer, but only returns addresses that are the shipping address for a customer
*/
SELECT 
    first_name, last_name, line1, city, state, zip_code
FROM
    CUSTOMERS
        JOIN
    ADDRESSES ON CUSTOMERS.customer_id = ADDRESSES.customer_id
        AND CUSTOMERS.shipping_address_id = ADDRESSES.address_id;

/*
* Joins the Customers, Orders, Order_Items, and Products tables.
* Returns the columns: last_name, first_name, order_date, product_name, item_price, discount_amount, and quantity.
* The final result set is sorted by last_name, order_date, and product_name.
* (Uses aliases for the tables)
*/
SELECT 
    c.last_name,
    c.first_name,
    o.order_date,
    p.product_name,
    oi.item_price,
    oi.discount_amount,
    oi.quantity
FROM
    CUSTOMERS AS c
        JOIN
    ORDERS AS o ON c.customer_id = o.customer_id
        JOIN
    ORDER_ITEMS AS oi ON o.order_id = oi.order_id
        JOIN
    PRODUCTS AS p ON oi.product_id = p.product_id
ORDER BY last_name , order_date , product_name;