-- =========================================================
-- Step 2: Load data/Sample-Superstore.csv into MySQL
-- =========================================================
-- Requires --local-infile enabled on the client and server:
--   SET GLOBAL local_infile = 1;
--   mysql --local-infile=1 -u root -p

USE superstore;

LOAD DATA LOCAL INFILE 'data/Sample-Superstore.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(row_id, order_id, @order_date, @ship_date, ship_mode, customer_id, customer_name,
 segment, country, city, state, postal_code, region, product_id, category,
 sub_category, product_name, sales, quantity, discount, profit)
SET
    order_date = STR_TO_DATE(@order_date, '%m/%d/%Y'),
    ship_date  = STR_TO_DATE(@ship_date,  '%m/%d/%Y');

-- Quick sanity check after loading:
SELECT COUNT(*) AS total_rows FROM orders;
SELECT MIN(order_date), MAX(order_date) FROM orders;
