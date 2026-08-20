# Project 3: SQL Data Analysis

## 1. Project Title
**Retail Sales Data Analysis Using SQL**

## 2. Objective
The objective of this project is to use SQL queries to extract useful insights from a retail sales database. The project demonstrates SELECT, WHERE, ORDER BY, GROUP BY, HAVING, aggregate functions, DISTINCT, CASE, subqueries and window functions.

## 3. Dataset
The database contains **150 retail orders**.

### Columns
- `order_id` – unique order identifier
- `customer_name` – customer name
- `order_date` – date of order
- `city` – customer/order city
- `category` – product category
- `units_sold` – number of units
- `unit_price` – price per unit
- `discount` – discount rate
- `sales` – final sales amount
- `payment_method` – payment method

## 4. Database
**SQLite** is used because it is lightweight and does not require a separate database server.

Database file: `sales_analysis.db`

Table: `sales`

## 5. SQL Concepts Demonstrated
1. SELECT
2. WHERE
3. ORDER BY
4. DISTINCT
5. COUNT()
6. SUM()
7. AVG()
8. GROUP BY
9. HAVING
10. BETWEEN
11. CASE
12. Subquery
13. Date functions
14. Window function / RANK()
15. Multi-column grouping

## 6. Key Results
- Total orders: **150**
- Total units sold: **799**
- Total sales: **₹1,512,481.53**
- Average order value: **₹10,083.21**
- Highest-sales category: **Electronics**
- Highest-sales city: **Meerut**
- Highest-sales payment method: **UPI**
- Highest individual order: **₹70,208.06** (Order ID 1112)

## 7. Important Queries

### Find all orders above ₹10,000
```sql
SELECT order_id, customer_name, category, sales
FROM sales
WHERE sales > 10000
ORDER BY sales DESC;
```

### Calculate total sales
```sql
SELECT ROUND(SUM(sales), 2) AS total_sales
FROM sales;
```

### Category-wise analysis
```sql
SELECT category,
       COUNT(*) AS order_count,
       SUM(units_sold) AS total_units,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(AVG(sales), 2) AS average_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;
```

### City-wise analysis
```sql
SELECT city,
       COUNT(*) AS order_count,
       ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY city
ORDER BY total_sales DESC;
```

### Monthly sales
```sql
SELECT strftime('%Y-%m', order_date) AS month,
       COUNT(*) AS orders,
       ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY strftime('%Y-%m', order_date)
ORDER BY month;
```

### Find the highest-value order
```sql
SELECT order_id, customer_name, category, sales
FROM sales
WHERE sales = (SELECT MAX(sales) FROM sales);
```

## 8. Business Insights
- Category-level grouping identifies the strongest product segment.
- City-level grouping shows which locations generate the most revenue.
- Payment-method aggregation shows customer payment preferences.
- Monthly aggregation can help identify seasonal sales changes.
- High-value orders can be investigated separately for business opportunities or anomalies.
- Customer-level grouping identifies high-value customers.

## 9. Conclusion
This project demonstrates how SQL can convert raw transactional data into meaningful business information. Using filtering, sorting, grouping and aggregate functions, important sales patterns can be extracted efficiently. The database can later be connected to Power BI/Tableau for interactive dashboards or extended with customer segmentation and sales forecasting.

## 10. How to Run
1. Install Python 3.x.
2. Open the project folder in VS Code.
3. Install dependencies:
   `pip install -r requirements.txt`
4. Run:
   `python run_sql_analysis.py`
5. For direct SQL practice, open `project_3_queries.sql` and execute the queries against `sales_analysis.db`.
