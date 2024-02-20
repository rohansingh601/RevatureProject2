-- 1. Highest Rate of Order Refunds
-- Columns Used: category, status, order_id
-- Aim: Identify product categories with the highest refund rates by comparing the number of refunded orders to the total number of orders.

SELECT 
  category,
  COUNTIF(status = 'Refunded') AS refund_count,
  COUNT(order_id) AS total_orders,
  (COUNTIF(status = 'Refunded') / COUNT(order_id)) * 100 AS refund_rate
FROM 
  `eminent-prism-412914.project2.2021_Sales`
GROUP BY 
  category
ORDER BY 
  refund_rate DESC;



-- 2. Products Popularity Over Time Viz
-- Columns Used: order_date, prod_code, qty_ordered
-- Aim: Track product popularity over time based on the quantity ordered.

SELECT 
  FORMAT_DATE('%Y-%m', order_date) AS order_month,
  prod_code,
  SUM(qty_ordered) AS total_quantity
FROM 
  `eminent-prism-412914.project2.2021_Sales`
GROUP BY 
  order_month, prod_code
ORDER BY 
  order_month ASC, total_quantity DESC;

-- 3. How Time of Year Affects Revenue
-- Columns Used: order_date, total
-- Aim: Analyze how revenue varies across different months or seasons.

SELECT 
  FORMAT_DATE('%Y-%m', order_date) AS order_month,
  SUM(total) AS monthly_revenue
FROM 
  `eminent-prism-412914.project2.2021_Sales`
GROUP BY 
  order_month
ORDER BY 
  order_month ASC;

-- 4. Customer Savings with Discounts
-- Columns Used: discount_amount, order_id
-- Aim: Calculate the total savings customers obtained through discounts.

SELECT 
  SUM(discount_amount) AS total_savings
FROM 
  `eminent-prism-412914.project2.2021_Sales`;

-- 5. Geographic/Demographic Influence on Buying Patterns
-- Columns Used: county, city, state, age, gender, category, qty_ordered
-- Aim: Understand how geographic and demographic factors influence purchasing patterns across different product categories.

SELECT 
  county, 
  city, 
  state, 
  gender, 
  AVG(age) AS average_age,
  category,
  SUM(qty_ordered) AS total_quantity
FROM 
  `eminent-prism-412914.project2.2021_Sales`
GROUP BY 
  county, city, state, gender, category
ORDER BY 
  total_quantity DESC;

-- 6. Sales Changes Over Time
-- Columns Used: order_date, total
-- Aim: Observe how total sales have evolved over the available time period.

SELECT 
  FORMAT_DATE('%Y-%m', order_date) AS order_month,
  SUM(total) AS monthly_sales
FROM 
  `eminent-prism-412914.project2.2021_Sales`
GROUP BY 
  order_month
ORDER BY 
  order_month ASC;


