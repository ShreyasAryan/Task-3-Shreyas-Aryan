import sqlite3
import pandas as pd

DB = "sales_analysis.db"
conn = sqlite3.connect(DB)

queries = {
    "Total Sales": "SELECT ROUND(SUM(sales),2) AS total_sales FROM sales;",
    "Average Order": "SELECT ROUND(AVG(sales),2) AS average_order_value FROM sales;",
    "Orders": "SELECT COUNT(*) AS total_orders FROM sales;",
    "Best Category": """
        SELECT category, ROUND(SUM(sales),2) AS total_sales
        FROM sales GROUP BY category
        ORDER BY total_sales DESC LIMIT 1;
    """,
    "Best City": """
        SELECT city, ROUND(SUM(sales),2) AS total_sales
        FROM sales GROUP BY city
        ORDER BY total_sales DESC LIMIT 1;
    """
}

for title, query in queries.items():
    print("\n" + title)
    print(pd.read_sql_query(query, conn).to_string(index=False))

conn.close()
