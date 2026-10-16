DROP TABLE IF EXISTS pizza_sales;

CREATE TABLE pizza_sales (
    pizza_id INTEGER PRIMARY KEY,
    order_id INTEGER ,
    pizza_name_id TEXT ,
    quantity INTEGER ,
    order_date DATE ,
    order_time TIME ,
    unit_price NUMERIC(10,2),
    total_price NUMERIC(10,2) ,
    pizza_size VARCHAR(10),
    pizza_category VARCHAR(50),
    pizza_ingredients TEXT,
    pizza_name TEXT
);

SELECT * FROM pizza_sales;

COPY pizza_sales (pizza_id, order_id, pizza_name_id, quantity, order_date, order_time, unit_price,
  total_price, pizza_size, pizza_category, pizza_ingredients, pizza_name)
FROM 'D:\Excel Learning\Linkedln project\pizza\pizza_sales.csv'
CSV HEADER;

-- KPI
-- 1) Total Revenue
SELECT SUM(total_price) AS total_revenue
FROM pizza_sales;
-- 2) Total Orders
SELECT COUNT(order_id) AS total_orders
FROM pizza_sales;
-- 3) Total Pizza Sold
SELECT SUM(quantity) AS total_pizza
FROM pizza_sales;
-- 4) Average Order Value
SELECT ROUND((SUM(total_price)/COUNT(DISTINCT order_id)), 2) AS average_order_value
FROM pizza_sales;
-- 5) Average Pizza Per Order 
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;

SELECT ROUND((SUM(quantity)/COUNT(DISTINCT order_id)), 2) AS average_order_value
FROM pizza_sales;


SELECT * FROM pizza_sales;
-- Visuals
-- 1) Daily Trend for Total Orders
SELECT 
     TO_CHAR(order_date, 'DAY') AS order_day,
	 COUNT(DISTINCT order_id) AS total_order
FROM pizza_sales
GROUP BY order_day
ORDER BY total_order DESC;

-- 2) Monthly Trend for Orders
SELECT 
     TO_CHAR(order_date, 'MONTH') AS order_month,
	 COUNT(DISTINCT order_id) AS total_order
FROM pizza_sales
GROUP BY order_month
ORDER BY total_order DESC;

-- 3) % of Sales by Pizza Category
SELECT pizza_category, 
CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

WITH category_sales AS (
    SELECT pizza_category,
      SUM(total_price) AS total_sales  
    FROM pizza_sales
    GROUP BY pizza_category       
)
SELECT pizza_category, total_sales,   
    CAST(total_sales * 100.0 / (SELECT SUM(total_sales) FROM category_sales)
      AS DECIMAL(10,2))   
     AS sales_percentage
FROM category_sales
ORDER BY sales_percentage DESC;

-- 4) % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

-- 5) Total Pizzas Sold by Pizza Category 
SELECT pizza_category, SUM(quantity) AS top_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY top_sold DESC;

-- 6) Total quantity sold only in January
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE EXTRACT(MONTH FROM order_date) = 1
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- 7) Top 5 Pizzas by Revenue
WITH top_pizza AS (
   SELECT pizza_name, SUM(total_price) AS total_revenue
   FROM pizza_sales
   GROUP BY pizza_name
)
SELECT *
FROM top_pizza
ORDER BY total_revenue DESC LIMIT 5;

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;


-- 8) Bottom 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;

-- 9) Top 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Top_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Top_quantity DESC
LIMIT 5;

-- 10) Bottom 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Bottom_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Bottom_quantity ASC
LIMIT 5;

-- 11) Top 5 Pizzas by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Top_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Top_orders DESC
LIMIT 5;

-- 12) Bottom 5 Pizzas by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Bottom_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Bottom_orders ASC
LIMIT 5;

-- 13) Finds the 5 Classic pizzas that appeared in the fewest unique orders
SELECT pizza_name, pizza_category, COUNT(DISTINCT order_id) AS total_order
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name, pizza_category
ORDER BY total_order ASC LIMIT 5;


