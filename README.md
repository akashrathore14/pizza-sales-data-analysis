# Pizza Sales Data Analysis

## Project Overview
This project analyzes pizza sales data to identify sales trends, customer purchasing patterns, and business performance using SQL, Excel, and Power BI.

## Tools & Technologies
- SQL
- Microsoft Excel
- Power BI
- Data Cleaning
- Data Analysis and Visualization

## Project Files
- **SQL Analysis:** Queries used to extract business insights.
- **Power BI Dashboard:** Interactive sales dashboard.
- **Excel Dataset:** Source data used for analysis.
- **Dashboard Image:** Preview of the report.
- **SQL Documentation:** Supporting query documentation.

📊 Key Performance Indicators (KPIs)

The SQL analysis calculates:
Total Revenue — Sum of total sales.
Total Orders — Count of order records.
Total Pizzas Sold — Sum of pizza quantities.
Average Order Value (AOV) — Total revenue divided by the number of distinct orders.
Average Pizzas per Order — Total quantity sold divided by the number of distinct orders.

📈 SQL Analysis & Business Questions
1. Order Trends
How do orders vary by day of the week?
Which months have the highest number of orders?

2. Sales Contribution
What percentage of revenue comes from each pizza category?
What percentage of revenue comes from each pizza size?

3. Product Performance
Which 5 pizzas generate the highest revenue?
Which 5 pizzas generate the lowest revenue?
Which 5 pizzas sell the highest and lowest quantities?
Which 5 pizzas appear in the highest and lowest numbers of distinct orders?

4. Additional Analysis
What is the quantity sold by pizza category in January?
Which 5 Classic pizzas appear in the fewest distinct orders?

💻 SQL Concepts Used
SUM() and COUNT()
COUNT(DISTINCT ...)
GROUP BY and ORDER BY
ROUND() and CAST()
TO_CHAR() for day and month formatting
EXTRACT() for month-based filtering
Common Table Expressions (CTEs)
Subqueries
LIMIT for top and bottom product analysis

🗃️ Dataset Structure
The pizza_sales table contains the following columns:
pizza_id
order_id
pizza_name_id
quantity
order_date
order_time
unit_price
total_price
pizza_size
pizza_category
pizza_ingredients
pizza_name

## Dashboard Preview
See `pizza-sales-dashboard.png` for a preview of the dashboard.

## Author
Akash Rathore
Aspiring Data Analyst | SQL | Excel | Power BI
