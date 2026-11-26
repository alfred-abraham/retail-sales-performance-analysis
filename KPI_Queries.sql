
-- 1. Find total sales
SELECT SUM(sales_amount) as Total_Sales
FROM gold_datasets.sales;

-- 2. Find the number of distinct orders
SELECT COUNT(DISTINCT order_number) as Distinct_Orders
FROM gold_datasets.sales;

-- 3. Find the number of customers
SELECT COUNT(DISTINCT customer_id) as Customers
FROM gold_datasets.customers;

-- 4. Find the number of products in the catalog
SELECT COUNT(product_id) as Products
FROM gold_datasets.products;

-- 5. Find the total units sold
SELECT SUM(quantity) as units_sold
FROM gold_datasets.sales;

-- 6. Find the total cost 
SELECT SUM(quantity*cost) as Total_Cost
FROM gold_datasets.sales s
JOIN gold_datasets.products p
ON s.product_key = p.product_key;

-- 7. Find the gross profit
SELECT (SUM(sales_amount) - SUM(quantity*cost)) as Gross_Profit
FROM gold_datasets.sales s
JOIN gold_datasets.products p
ON s.product_key = p.product_key;

-- 8. Find the gross profit margin 
SELECT (SUM(sales_amount) - SUM(quantity*cost))/(SUM(sales_amount)) as Gross_Profit_Margin
FROM gold_datasets.sales s
JOIN gold_datasets.products p
ON s.product_key = p.product_key;

-- 9. Find the average order value
SELECT (SUM(sales_amount)/COUNT(DISTINCT order_number)) as Average_Order_Value
FROM gold_datasets.sales;

-- 10. Find the average revenue per customer 
SELECT (SUM(sales_amount)/COUNT(DISTINCT customer_key)) as Revenue_Per_Customer
FROM gold_datasets.sales;

-- 11. Find the number of repeat customers
WITH order_count as (
SELECT customer_key, COUNT(DISTINCT order_number)
FROM gold_datasets.sales
GROUP BY customer_key
HAVING COUNT(DISTINCT order_number) > 1)
SELECT COUNT(customer_key) as Repeat_Customers
FROM order_count;

-- 12. Find the repeat purchase rate

WITH order_count AS (
    SELECT
        customer_key,
        COUNT(DISTINCT order_number) AS total_orders
    FROM gold_datasets.sales
    GROUP BY customer_key
    HAVING COUNT(DISTINCT order_number) > 1
),
repeat_customer_count AS (
    SELECT COUNT(*) AS repeat_customers
    FROM order_count
),
purchasing_customer_count AS (
    SELECT COUNT(DISTINCT customer_key) AS purchasing_customers
    FROM gold_datasets.sales
)
SELECT (repeat_customers/purchasing_customers) as Repeat_Purchase_Rate
FROM repeat_customer_count
CROSS JOIN purchasing_customer_count;