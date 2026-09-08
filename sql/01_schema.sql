-- =========================================================
-- Project: Superstore Retail Sales Analysis
-- Step 1: Schema creation (MySQL 8.0+)
-- =========================================================

CREATE DATABASE IF NOT EXISTS superstore;
USE superstore;

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    row_id          INT PRIMARY KEY,
    order_id        VARCHAR(20)    NOT NULL,
    order_date      DATE           NOT NULL,
    ship_date       DATE           NOT NULL,
    ship_mode       VARCHAR(30),
    customer_id     VARCHAR(20),
    customer_name   VARCHAR(100),
    segment         VARCHAR(30),
    country         VARCHAR(50),
    city            VARCHAR(100),
    state           VARCHAR(50),
    postal_code     VARCHAR(10),
    region           VARCHAR(20),
    product_id      VARCHAR(30),
    category        VARCHAR(30),
    sub_category    VARCHAR(30),
    product_name    VARCHAR(200),
    sales           DECIMAL(10,2),
    quantity        INT,
    discount        DECIMAL(4,2),
    profit          DECIMAL(10,2)
);

-- Helpful indexes for the business questions in 03_business_questions.sql
CREATE INDEX idx_orders_category      ON orders (category, sub_category);
CREATE INDEX idx_orders_region        ON orders (region, state);
CREATE INDEX idx_orders_order_date    ON orders (order_date);
CREATE INDEX idx_orders_customer      ON orders (customer_id);

