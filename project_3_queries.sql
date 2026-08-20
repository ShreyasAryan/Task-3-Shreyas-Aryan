-- Project 3: SQL Data Analysis
-- Database: sales_analysis.db

-- 01_all_records
SELECT * FROM sales LIMIT 20;

-- 02_selected_columns
SELECT order_id, customer_name, category, sales
FROM sales
LIMIT 15;

-- 03_where_high_sales
SELECT order_id, customer_name, category, sales
FROM sales
WHERE sales > 10000
ORDER BY sales DESC;

-- 04_order_by_sales
SELECT order_id, category, sales
FROM sales
ORDER BY sales DESC
LIMIT 10;

-- 05_count_orders
SELECT COUNT(*) AS total_orders
FROM sales;

-- 06_total_sales
SELECT ROUND(SUM(sales), 2) AS total_sales
FROM sales;

-- 07_average_order_value
SELECT ROUND(AVG(sales), 2) AS average_order_value
FROM sales;

-- 08_total_units
SELECT SUM(units_sold) AS total_units_sold
FROM sales;

-- 09_category_group_by
SELECT
    category,
    COUNT(*) AS order_count,
    SUM(units_sold) AS total_units,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(sales), 2) AS average_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

-- 10_city_group_by
SELECT
    city,
    COUNT(*) AS order_count,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(sales), 2) AS average_sales
FROM sales
GROUP BY city
ORDER BY total_sales DESC;

-- 11_payment_group_by
SELECT
    payment_method,
    COUNT(*) AS transactions,
    ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY payment_method
ORDER BY total_sales DESC;

-- 12_category_having
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY category
HAVING SUM(sales) > 150000
ORDER BY total_sales DESC;

-- 13_monthly_sales
SELECT
    strftime('%Y-%m', order_date) AS month,
    COUNT(*) AS orders,
    ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY strftime('%Y-%m', order_date)
ORDER BY month;

-- 14_top_customers
SELECT
    customer_name,
    COUNT(*) AS orders,
    ROUND(SUM(sales), 2) AS customer_spend
FROM sales
GROUP BY customer_name
ORDER BY customer_spend DESC
LIMIT 10;

-- 15_case_sales_level
SELECT
    order_id,
    category,
    sales,
    CASE
        WHEN sales >= 10000 THEN 'High'
        WHEN sales >= 5000 THEN 'Medium'
        ELSE 'Low'
    END AS sales_level
FROM sales
ORDER BY sales DESC;

-- 16_between_filter
SELECT order_id, category, sales
FROM sales
WHERE sales BETWEEN 5000 AND 10000
ORDER BY sales DESC;

-- 17_distinct_categories
SELECT DISTINCT category
FROM sales
ORDER BY category;

-- 18_highest_order
SELECT order_id, customer_name, category, sales
FROM sales
WHERE sales = (SELECT MAX(sales) FROM sales);

-- 19_category_rank
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS sales_rank
FROM sales
GROUP BY category
ORDER BY sales_rank;

-- 20_city_category_summary
SELECT
    city,
    category,
    COUNT(*) AS orders,
    ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY city, category
ORDER BY city, total_sales DESC;

