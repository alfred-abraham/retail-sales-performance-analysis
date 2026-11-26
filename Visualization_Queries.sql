
-- 1. Find total sales by month and year, filtering out December 2010 and January 2014 due to incomplete data.
SELECT
    Date_Format(order_date, '%Y-%m') AS order_date,
    SUM(sales_amount) AS total_sales
FROM gold_datasets.sales
WHERE order_date >= '2011-01-01'
    AND order_date < '2014-01-01'
GROUP BY Date_Format(order_date, '%Y-%m')
ORDER BY Date_Format(order_date, '%Y-%m');
-- 2. Find monthly total sales, filtering out the above months as well. 
SELECT
    Date_Format(order_date,"%M") AS order_month,
    SUM(sales_amount) AS total_sales
FROM gold_datasets.sales
WHERE order_date >= '2011-01-01'
    AND order_date < '2014-01-01'
GROUP BY MONTH(order_date),Date_Format(order_date,"%M")
ORDER BY Month(order_date),Date_Format(order_date,"%M");
-- 3. Find total sales by category
    SELECT
        category,
        SUM(sales_amount) AS total_sales
    FROM gold_datasets.sales s
    JOIN gold_datasets.products p
        ON p.product_key = s.product_key
    GROUP BY category
    ORDER BY SUM(sales_amount) DESC;

-- 4. Find percentage breakdown of bike sales by category
WITH bike_sales AS (
    SELECT
        subcategory,
        SUM(s.sales_amount) AS total_sales
    FROM gold_datasets.sales s
    JOIN gold_datasets.products p
        ON p.product_key = s.product_key
	WHERE category = "Bikes"
    GROUP BY subcategory
)
SELECT
    subcategory as bike_type,
    total_sales,
    ROUND((CAST(total_sales AS FLOAT) / SUM(total_sales) OVER ()) * 100, 2) AS percentage_of_total
FROM bike_sales
ORDER BY total_sales DESC;

-- 5. Year-over-year sales growth
WITH yearly_sales AS (
    SELECT
        YEAR(order_date) AS sales_year,
        SUM(sales_amount) AS total_sales
    FROM gold_datasets.sales
    WHERE YEAR(order_date) BETWEEN 2011 AND 2013
    GROUP BY YEAR(order_date)
),
previous_sales AS (
    SELECT
        sales_year,
        total_sales,
        LAG(total_sales) OVER (
            ORDER BY sales_year
        ) AS previous_year_sales
    FROM yearly_sales
)
SELECT
    sales_year,
    total_sales,
    previous_year_sales,
    ROUND(
        100.0 * (total_sales - previous_year_sales)
        / NULLIF(previous_year_sales, 0), 2
    ) AS yoy_growth_pct
FROM previous_sales
ORDER BY sales_year;

-- 6. Find both revenue and gross profit by category
SELECT category,SUM(sales_amount) as revenue,  SUM(sales_amount - cost*quantity) as gross_profit
FROM gold_datasets.products p
JOIN gold_datasets.sales s
ON p.product_key = s.product_key
GROUP BY category
ORDER BY SUM(sales_amount) DESC, SUM(sales_amount - cost*quantity) DESC;

-- 7. Find top 10 products by gross profit
SELECT product_name, SUM(sales_amount - cost*quantity) as gross_profit
FROM gold_datasets.products p
JOIN gold_datasets.sales s
ON p.product_key = s.product_key
GROUP BY product_name
ORDER BY SUM(sales_amount - cost*quantity) DESC
LIMIT 10;
-- 8. Find the top 10 subcategories by gross profit margin
SELECT subcategory, (SUM(sales_amount - cost*quantity)/SUM(sales_amount)) as gross_profit_margin
FROM gold_datasets.products p
JOIN gold_datasets.sales s
ON p.product_key = s.product_key
GROUP BY subcategory
ORDER BY (SUM(sales_amount - cost*quantity)/SUM(sales_amount)) DESC
LIMIT 10;
-- 10. Create a table of metrics such as total units sold, total sales, gross profit, and gross profit margin by product
SELECT category, subcategory, product_name, SUM(quantity) as total_units_sold, SUM(sales_amount) as total_sales, SUM(sales_amount - cost*quantity) as gross_profit, (SUM(sales_amount - cost*quantity)/SUM(sales_amount)) as gross_profit_margin
FROM gold_datasets.products p
JOIN gold_datasets.sales s
ON p.product_key = s.product_key
GROUP BY category, subcategory, product_name;

-- 11. Find the number of purchasing customers per country
SELECT country, COUNT(DISTINCT s.customer_key) as customers
FROM gold_datasets.customers c
JOIN gold_datasets.sales s
ON c.customer_key = s.customer_key
GROUP BY country
ORDER BY COUNT(DISTINCT customer_key) DESC;

-- 12. Find the number of purchasing customers by gender
SELECT gender, COUNT(DISTINCT s.customer_key) as customers
FROM gold_datasets.customers c
JOIN gold_datasets.sales s
ON c.customer_key = s.customer_key
GROUP BY gender
ORDER BY COUNT(DISTINCT customer_key) DESC;

-- 13. Find top five customers by revenue
SELECT CONCAT(first_name, " ",last_name) as full_name, SUM(sales_amount) as Revenue
FROM gold_datasets.customers c
JOIN gold_datasets.sales s
ON c.customer_key = s.customer_key
GROUP BY CONCAT(first_name, " ",last_name)
ORDER BY SUM(sales_amount) DESC
LIMIT 5;

-- 14. Create a table of relevant information such as country, gender, number of purchasing customers, average order value, revenue per customer, and repeat purchase rate

WITH customer_orders AS (
    SELECT
        customer_key,
        COUNT(DISTINCT order_number) AS total_orders
    FROM gold_datasets.sales
    GROUP BY customer_key
)
SELECT
    c.country,
    c.gender,
    COUNT(DISTINCT s.customer_key) AS Purchasing_Customers,

    ROUND(SUM(s.sales_amount) /
        COUNT(DISTINCT s.order_number), 2)
        AS Average_Order_Value,

    ROUND(SUM(s.sales_amount) /
        COUNT(DISTINCT s.customer_key), 2)
        AS Revenue_Per_Customer,

    ROUND(
        COUNT(DISTINCT CASE
            WHEN co.total_orders > 1 THEN s.customer_key
        END) * 100.0 /
        COUNT(DISTINCT s.customer_key), 2
    ) AS Repeat_Purchase_Rate

FROM gold_datasets.customers c
JOIN gold_datasets.sales s
    ON c.customer_key = s.customer_key
JOIN customer_orders co
    ON s.customer_key = co.customer_key
GROUP BY c.country, c.gender;







