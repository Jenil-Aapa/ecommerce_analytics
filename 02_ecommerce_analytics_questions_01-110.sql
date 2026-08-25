-- SELECT * FROM customers;
-- SELECT * FROM customer_reviews;
-- SELECT * FROM categories;
-- SELECT * FROM order_items;
-- SELECT * FROM orders;
-- SELECT * FROM products;


-- LEVEL 1 — SELECT / WHERE


-- Q1 Display all customers.
SELECT 
	* 
FROM customers c;

-- Q2 Display customer names and cities. 

SELECT 	
	c.customer_name, 
    c.city 
FROM customers c;

-- Q3 Find customers who live in Bangalore.

SELECT 
	* 
FROM customers c 
WHERE c.city = 'Bangalore';

-- Q4 Find customers older than 30.

SELECT 
	* 
FROM customers c
WHERE c.age > 30;

-- Q5 Find all products with price greater than ₹10,000.

SELECT 
	* 
FROM products p 
WHERE p.price > 10000;

-- Q6 Find products belonging to category 1.

SELECT 
	* 
FROM products p 
WHERE p.category_id = 1; 

-- Q7 Find all delivered orders.

SELECT 
	* 
FROM orders o
WHERE o.status = 'Delivered';

-- Q8 Find orders paid using UPI.

SELECT 
	* 
FROM orders o
where o.payment_method = 'UPI';

-- Q9 Find customers from Karnataka or Maharashtra.

SELECT 
	* 
FROM customers c
WHERE c.state IN ('Karnataka', 'Maharashtra');

-- Q10 Find products whose price is between ₹2,000 and ₹10,000.

SELECT 
	* 
FROM products p
WHERE p.price BETWEEN 2000 AND 10000; 


-- LEVEL 2 ORDER BY / LIMIT / DISTINCT


-- Q11 Find the 5 most expensive products.

SELECT 
	*
FROM products p
ORDER BY p.price DESC 
LIMIT 5;

-- Q12 Find the cheapest product.

SELECT 
	* 
FROM products p
ORDER BY p.price ASC
LIMIT 1;

-- Q13 Find the 3 oldest customers.

SELECT 
	* 
FROM customers c
ORDER BY c.age DESC 
LIMIT 3; 

-- Q14 Display customers ordered by age descending.

SELECT 
	* 
FROM customers c
ORDER BY c.age DESC;

-- Q15 Find all unique cities.

SELECT 
	DISTINCT c.city 
FROM customers c;

-- Q16 Find all unique payment methods.

SELECT 
	DISTINCT o.payment_method 
FROM orders o;

-- Q17 Find the 2nd most expensive product.

SELECT 
	* 
FROM products p
ORDER BY p.price DESC 
LIMIT 1 OFFSET 1;

-- Q18 Find the 3rd most expensive product.

SELECT 
	* 
FROM products p
ORDER BY p. price DESC 
LIMIT 2,1;


-- LEVEL 3 — Aggregate Functions

-- Q19 Find the total number of customers.

SELECT 
	count(c.customer_id) AS total_customers
FROM customers c;

-- Q20 Find the average customer age.

SELECT 
	AVG(c.age) AS avg_customer_age
FROM customers c;

-- Q21 Find the maximum product price.

SELECT 
	MAX(p.price) AS max_product_price
FROM products p;

-- Q22 Find the minimum product price.

SELECT 
	MIN(p.price) min_product_price 
FROM products p;

-- Q23 Find the total number of orders.

SELECT 
	COUNT(o.order_id) AS total_num_orders
FROM orders o;

-- Q24 Find the number of delivered orders.

SELECT 
	COUNT(o.status) AS delivered_status
FROM orders o
WHERE o.status = 'Delivered';

-- Q25 Find the total quantity of products sold.

SELECT 
	SUM(oi.quantity) AS Total_quantity 
FROM order_items oi;

-- Q26 Find the average product price.

SELECT 
	AVG(p.price) AS avg_price 
FROM products p; 


-- LEVEL 4 — GROUP BY


-- Q27 Count customers by gender.

SELECT 
	c.gender, 
	COUNT(c.gender) AS total_customers
FROM customers c
GROUP BY c.gender;

-- Q28 Count customers by city.

SELECT 
	c.city, 
	COUNT(c.city) AS total_custoers
FROM customers c 
GROUP BY c.city;

-- Q29 Count customers by state.

SELECT 
	c.state, 
    COUNT(state) AS total_customers
FROM customers c
GROUP BY c.state;

-- Q30 Find average age by gender.

SELECT 
	c.gender, 
	AVG(c.age) AS avg_gender_age
FROM customers c 
GROUP BY c.gender;

-- Q31 Count orders by status.

SELECT 
	o.status, 
    COUNT(o.status) AS total_orders 
FROM orders o
GROUP BY o.status;

-- Q32 Count orders by payment method.

SELECT 
	o.payment_method, 
	COUNT(o.payment_method) AS total_payments
FROM orders o
GROUP BY o.payment_method;

-- Q33 Find total quantity sold for each product.

SELECT 
	oi.product_id, 
	SUM(oi.quantity) AS total_quantity_sold 
FROM order_items oi
GROUP BY oi.product_id;

-- Q34 Find the average rating for each product.

SELECT 
	cr.product_id, 
	AVG(cr.rating) AS avg_rating_for_each_product
FROM customer_reviews cr
GROUP BY cr.product_id;

-- Q35 Find the number of customers who signed up each month.

SELECT 
	YEAR(c.signup_date) AS signup_year, 
	MONTH(c.signup_date) AS signup_month, 
	COUNT(c.customer_id) AS total_customers 
FROM customers c 
GROUP BY YEAR(c.signup_date), MONTH(c.signup_date) 
ORDER BY signup_year, signup_month;

    
-- LEVEL 5 — HAVING


-- Q36 Find cities having more than 1 customer.

SELECT 
	c.city, 
    COUNT(c.customer_name) AS customer_count 
FROM customers c 
GROUP BY c.city 
HAVING customer_count > 1;

-- Q37 Find products that have sold more than 2 units.	

SELECT 
	oi.product_id, 
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
GROUP BY oi.product_id
HAVING total_quantity_sold > 2;

-- Q38 Find payment methods used in more than 3 orders.

SELECT 
	o.payment_method, 
    COUNT(o.payment_method) AS payment_method_count
FROM orders o
GROUP BY o.payment_method
HAVING payment_method_count > 3;

-- Q39 Find products whose average rating is greater than 4.

SELECT  
	cr.product_id, 
    AVG(cr.rating) AS avg_rating 
FROM customer_reviews cr
GROUP BY cr.product_id
HAVING avg_rating > 4;

-- Q40 Find customers who have placed more than 1 order.

SELECT 
	o.customer_id, 
    COUNT(o.order_id) AS Total_Orders
FROM orders o
GROUP BY o.customer_id
HAVING Total_Orders > 1;
    
    
-- LEVEL 6 — JOINS
-- This is where your real Data Analyst interview preparation starts.


-- Q41 Display order ID along with customer name.

SELECT 
	c.customer_name, 
    o.order_id 
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id;

-- Q42 Display customer name, order date and order status.
    
SELECT 
	c.customer_name, 
	o.order_date, 
    o.status
FROM customers c
JOIN orders o 
	ON c.customer_id = o.customer_id; 

-- Q43 Display product name and category name.

SELECT 
	p.product_name, 
    cat.category_name
FROM products p
JOIN categories cat 
    ON p.category_id = cat.category_id;

-- Q44 Display order ID, product name and quantity.

SELECT 
	oi.order_id, 
    p.product_name, 
    oi.quantity
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.product_id;

-- Q45 Display customer name, product name and quantity purchased.
      
SELECT 
	c.customer_name, 
	p.product_name, 
    oi.quantity
FROM customers c
JOIN orders o 
		ON c.customer_id = o.customer_id
JOIN order_items oi
		ON o.order_id = oi.order_id
JOIN products p 
		ON oi.product_id = p.product_id;

-- Q46 Display customer name, order date, product name and quantity.
    
SELECT 
	c.customer_name, 
	p.product_name, 
    o.order_date, 
    oi.quantity
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN order_items oi 
    ON o.order_id = oi.order_id
JOIN products p
    ON p.product_id = oi.product_id;

-- Q47 Find all customers who have placed an order.

SELECT 
	DISTINCT c.customer_name
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id;
  
-- Q48 Find customers who have never placed an order.

SELECT 
	c.*
FROM customers c 
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- Q49 Find products that have never been ordered.

SELECT 
	p.*
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
        
-- Q50 Find all orders along with customer information.

SELECT 
	c.*, 
    o.*
FROM orders o
LEFT JOIN customers c
    ON c.customer_id = o.customer_id;
   
   
-- LEVEL 7 — Business Calculations 
-- Now start thinking like a Data Analyst.


-- Q51 Calculate revenue for each order item.
-- Formula: revenue = price × quantity
    
SELECT 
	p.product_name, 
	p.price, oi.quantity, 
	p.price * oi.quantity AS revenue 
FROM order_items oi
LEFT JOIN products p
    ON p.product_id = oi.product_id;


-- Q52 Calculate revenue after discount.
    
SELECT 
	p.product_name, 
	p.price, 
    oi.quantity, 
    oi.discount,
    (p.price * oi.quantity) * (1 - oi.discount / 100) AS revenue
FROM order_items oi
LEFT JOIN products p
    ON p.product_id = oi.product_id;


-- Q53 Calculate profit for each product sold.
-- profit = (price - cost) × quantity

SELECT 
	p.product_name, 
    p.price, 
    p.cost, 
    oi.quantity,
    (p.price - p.cost) * oi.quantity AS profit
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id; 
    
-- Q54 Find total revenue.

SELECT 
	SUM(p.price * oi.quantity) AS Total_revenue
FROM order_items oi
JOIN products p
	ON p.product_id = oi.product_id;

-- Q55 Find total profit.
    
SELECT 
	SUM((p.price - p.cost) * oi.quantity) AS Total_profit
FROM products p
JOIN order_items oi    
	ON p.product_id = oi.product_id;

-- Q56 Find revenue by product.

SELECT 
	p.product_name,
    SUM(p.price * oi.quantity) AS Revenue_By_Product
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

-- Q57 Find revenue by category.
    
SELECT 
	cat.category_name,
    SUM(p.price * oi.quantity) AS Revenue_By_Category
FROM products p
JOIN order_items oi
	ON p.product_id = oi.product_id
JOIN categories cat
	ON cat.category_id = p.category_id
GROUP BY cat.category_id, cat.category_name;

-- Q58 Find revenue by customer.

SELECT 
	c.customer_name,
    SUM(p.price * oi.quantity) AS Revenue_By_Customer
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
JOIN products p
	ON oi.product_id = p.product_id
GROUP BY c.customer_name, c.customer_id;

-- Q59 Find the top 5 products by revenue.

SELECT 
	p.product_name,
    SUM(p.price * oi.quantity) AS Revenue_By_Product
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY Revenue_By_Product DESC 
LIMIT 5;

-- Q60 Find the top 5 customers by total spending.

SELECT 
	c.customer_name,
    SUM(p.price * oi.quantity) AS total_spending
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
JOIN products p
	ON oi.product_id = p.product_id
GROUP BY c.customer_name, c.customer_id
ORDER BY total_spending DESC
LIMIT 5;


-- LEVEL 8 — CASE WHEN


-- Q61 Classify customers:
-- Age < 25       → Young
-- 25–35          → Adult
-- > 35           → Senior

SELECT 
	c.age,
	CASE
		WHEN c.age < 25 THEN 'Young'
		WHEN c.age <= 35 THEN 'Adult'
        ELSE 'Senior'
	END AS age_classify
FROM customers c;
    
-- Q62 Classify products based on price:
-- < 2000         → Low
-- 2000–10000     → Medium
-- > 10000        → High

SELECT 
	p.price,
    CASE 
		WHEN p.price < 2000 THEN 'Low'
        WHEN p.price <= 10000 THEN 'Medium'
        ELSE 'High'
	END AS Price_classify
FROM products p;

-- Q63 Create an order priority:
-- Delivered → Completed
-- Pending   → Open
-- Cancelled → Lost

SELECT 
	o.status,
	CASE 
		WHEN o.status = 'Delivered' THEN 'Completed'
        WHEN o.status = 'Pending' THEN 'Open'
        WHEN o.status = 'Cancelled' THEN 'Lost'
	END AS order_priority
FROM orders o;

-- Q64 Calculate profit margin for every product.

SELECT
	p.product_name,
    p.price,
    p.cost,
	CONCAT(ROUND(((p.price - p.cost) / p.price) * 100), '%' ) AS profit_margin
FROM products p;


-- Q65 Identify products where selling price is more than 30% higher than cost.

SELECT
    product_name,
    price,
    cost
FROM products
WHERE price > cost * 1.30;


-- LEVEL 9 — SUBQUERIES 


-- Q66 Find products more expensive than the average product price.

SELECT 
		*
FROM products p
WHERE p.price > (SELECT AVG(p2.price) AS avg_price FROM products p2);


-- Q67 Find customers older than the average customer age.

SELECT 
	c.customer_name,
	c.age
FROM customers c
WHERE c.age > (SELECT AVG(c2.age) AS avg_age FROM customers c2);

-- Q68 Find the most expensive product.

SELECT 
	* 
FROM products p
WHERE p.price = (SELECT MAX(p2.price) AS max_price FROM products p2);


-- Q69 Find customers whose spending is greater than the average customer spending.

SELECT 
	c.customer_name,
   SUM(p.price * oi.quantity) AS total_spending
FROM customers c
JOIN orders o 
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
JOIN products p
	ON p.product_id = oi.product_id
GROUP BY c.customer_name, c.customer_id
HAVING SUM(p.price * oi.quantity) > 
	(SELECT AVG(customer_spending) 
		FROM(SELECT o2.customer_id, SUM(p2.price * oi2.quantity) AS customer_spending FROM orders o2 
			JOIN order_items oi2 
				ON o2.order_id = oi2.order_id
			JOIN products p2
				ON p2.product_id = oi2.product_id
			GROUP BY o2.customer_id
		) AS customer_totals
);


-- Q70 Find the second-highest product price.

SELECT *
FROM products p
ORDER BY p.price DESC 
limit 1,1;

-- Q71 Find products whose price is higher than the average price of their category.

SELECT 
	p.product_name,
    p.category_id,
    p.price
FROM products p
WHERE p.price > (SELECT AVG(p2.price) FROM products p2 WHERE p2.category_id = p.category_id);


-- LEVEL 10 — CTEs 


-- Q72 Create a CTE containing total revenue by product.
-- Then find the top 5 products.

WITH product_revenue AS(
	SELECT 
		p.product_name,
        p.price,
        SUM(p.price * oi.quantity) AS total_revenue
	FROM products p
    JOIN order_items oi
		ON p.product_id = oi.product_id
        GROUP BY p.product_id, p.product_name
)
SELECT * 
	FROM product_revenue
	ORDER BY total_revenue DESC
    LIMIT 5;

-- Q73 Create a CTE containing total spending by customer. 
-- Find customers spending more than ₹50,000.  

WITH customer_spending AS (
	SELECT 
		c.customer_name,
        SUM(p.price * oi.quantity) AS total_spending
	FROM customers c
    JOIN orders o
		ON c.customer_id = o.customer_id
	JOIN order_items oi
		ON o.order_id = oi.order_id
	JOIN products p
		ON p.product_id = oi.product_id
	GROUP BY c.customer_name, c.customer_id
)
SELECT 
	customer_name,
    total_spending
FROM customer_spending
WHERE total_spending > 50000; 

-- Q74 Create a CTE for monthly revenue. 
-- Find the month with the highest revenue.

WITH monthly_revenue AS(
	SELECT 
		YEAR(o.order_date) AS year,
        MONTH(o.order_date) AS month,
		SUM(p.price * oi.quantity) AS total_revenue
	FROM orders o
    JOIN order_items oi
		ON o.order_id = oi.order_id
	JOIN products p 
		ON p.product_id = oi.product_id
	GROUP BY YEAR(o.order_date), MONTH(o.order_date)
)
SELECT 
	*
FROM monthly_revenue
ORDER BY total_revenue DESC 
LIMIT 1;	


-- Q75 Create a CTE calculating product profit.
-- Find the most profitable product.

WITH product_profit AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM((p.price - p.cost) * oi.quantity) AS total_profit
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name
)

SELECT
    product_name,
    total_profit
FROM product_profit
ORDER BY total_profit DESC
LIMIT 1;


-- Q76 Create a CTE calculating customer order count.
-- Find customers with more than one order.

WITH customer_orders AS (
    SELECT
        c.customer_id,
        c.customer_name,
        COUNT(o.order_id) AS order_count
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
)

SELECT
    customer_name,
    order_count
FROM customer_orders
WHERE order_count > 1;



-- LEVEL 11 — WINDOW FUNCTIONS 
-- These are very important for analyst interviews.



-- Q77 Rank products by price.
-- Use:
-- RANK()
SELECT 
	p.product_name,
    p.price,
    RANK() OVER (ORDER BY price DESC) AS price_rank
FROM products p;


-- Q78 Rank customers by total spending.

SELECT 
	c.customer_name,
    SUM(p.price * oi.quantity) AS total_spending,
    RANK() OVER (ORDER BY SUM(p.price * oi.quantity) DESC) AS rank_by_spending
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
JOIN products p 
	ON p.product_id = oi.product_id
GROUP BY c.customer_id, c.customer_name;


-- Q79 Find the top 3 products by revenue.
-- Using: ROW_NUMBER()

SELECT 
	p.product_name,
    ROW_NUMBER() OVER (ORDER BY SUM(p.price * oi.quantity) DESC) AS row_num,
	SUM(p.price * oi.quantity) AS total_revenue 
FROM products p
JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 3;

-- Q80 Find the highest-revenue product in each category.

WITH ranked_products AS (
    SELECT
        p.product_name,
        cat.category_name,
        SUM(p.price * oi.quantity) AS total_revenue,
        RANK() OVER (
            PARTITION BY cat.category_id
            ORDER BY SUM(p.price * oi.quantity) DESC
        ) AS revenue_rank
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN categories cat
        ON p.category_id = cat.category_id
    GROUP BY
        cat.category_id,
        cat.category_name,
        p.product_id,
        p.product_name
)
SELECT *
FROM ranked_products
WHERE revenue_rank = 1;

-- Q81 Find the second-highest product in each category.

SELECT *
	FROM(
		SELECT 
			p.product_name,
            cat.category_name,
            p.price,
            RANK() OVER(
				PARTITION BY cat.category_id
                ORDER BY p.price DESC
				) AS price_rank
			FROM products p
            JOIN  categories cat
				ON p.category_id = cat.category_id
) AS ranked_products
WHERE price_rank = 2;


-- Q82 Calculate running monthly revenue.

WITH monthly_revenue AS (
    SELECT
        YEAR(o.order_date) AS year,
        MONTH(o.order_date) AS month,
        SUM(p.price * oi.quantity) AS total_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON p.product_id = oi.product_id
    GROUP BY YEAR(o.order_date), MONTH(o.order_date)
)

SELECT
    year,
    month,
    total_revenue,
    SUM(total_revenue) OVER (
        ORDER BY year, month
    ) AS running_revenue
FROM monthly_revenue;

-- Q83 Calculate each product's percentage contribution to total revenue.

WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(p.price * oi.quantity) AS total_revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name
)

SELECT
    product_name,
    total_revenue,
    ROUND(
        (total_revenue / SUM(total_revenue) OVER ()) * 100,2
    ) AS revenue_percentage
FROM product_revenue;


-- Q84 Compare each customer's spending with the previous customer.
-- Use:
-- LAG()

WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(p.price * oi.quantity) AS total_spending
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON p.product_id = oi.product_id
    GROUP BY c.customer_id, c.customer_name
)

SELECT
    customer_name,
    total_spending,
    LAG(total_spending) OVER (
        ORDER BY customer_id
    ) AS previous_customer_spending
FROM customer_spending;


-- Q85 Find the difference between current month's revenue and previous month's revenue.

WITH monthly_revenue AS (
    SELECT
        MONTH(o.order_date) AS month,
        SUM(p.price * oi.quantity) AS total_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON p.product_id = oi.product_id
    GROUP BY MONTH(o.order_date)
)

SELECT
    month,
    total_revenue,
    LAG(total_revenue) OVER (
        ORDER BY month
    ) AS previous_month_revenue,
    total_revenue - LAG(total_revenue) OVER (
        ORDER BY month
    ) AS revenue_difference
FROM monthly_revenue;


-- LEVEL 12 — DATE FUNCTIONS


-- Q86 Find all orders placed in January 2025.

SELECT *
FROM orders
WHERE order_date >= '2025-01-01' AND order_date < '2025-02-01';

-- Q87 Find monthly order count.
    
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(*) AS order_count
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;


-- Q88 Find monthly revenue.

SELECT 
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    SUM(p.price * oi.quantity) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON p.product_id = oi.product_id
GROUP BY YEAR(o.order_date), MONTH(o.order_date)
ORDER BY year, month;

-- Q89 Find the number of orders placed each day.

SELECT 
    DATE(order_date) AS order_date,
    COUNT(*) AS total_orders
FROM orders
GROUP BY DATE(order_date)
ORDER BY order_date;

-- Q90 Find customers who signed up in 2024.

SELECT 
	c.customer_name,
    c.signup_date
FROM customers c
WHERE YEAR(c.signup_date) = 2024;

-- Q91 Find the first order date of every customer.

SELECT 
	c.customer_name,
       MIN(o.order_date) AS first_order_date
FROM orders o
JOIN customers c
	ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.customer_name;

-- Q92 Find the latest order date of every customer.

SELECT 
	c.customer_name,
       MAX(o.order_date) AS latest_order_date
FROM orders o
JOIN customers c
	ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.customer_name;

-- Q93 Find customers who placed an order within 30 days of signup.

SELECT
	c.customer_name,
    c.signup_date,
    o.order_date
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
WHERE DATEDIFF(o.order_date, c.signup_date) <= 30
	AND DATEDIFF(o.order_date, c.signup_date) >=0;


-- LEVEL 13 — REAL INTERVIEW BUSINESS QUESTIONS 
-- These are the ones I particularly want you to practice.


-- Q94 Who are our top 5 customers by revenue?

SELECT 
	c.customer_name,
    SUM(p.price * oi.quantity) AS total_revenue
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
JOIN products p
	ON p.product_id = oi.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC 
LIMIT 5;

-- Q95 Which product generates the highest revenue?

SELECT 
	p.product_id,
	p.product_name,
    SUM(p.price * oi.quantity) AS total_revenue
FROM products p
JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name 
ORDER BY total_revenue DESC
LIMIT 1;

-- Q96 Which category generates the highest revenue?

SELECT 
	cat.category_name,
     SUM(p.price * oi.quantity) AS total_revenue
FROM categories cat
JOIN products p
	ON cat.category_id = p.category_id
JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY cat.category_name,  cat.category_id
ORDER BY total_revenue DESC
LIMIT 1;


-- Q97 Which products have high sales but low ratings?

SELECT 
	p.product_name,
    SUM(p.price * oi.quantity) AS high_sales,
    AVG(cr.rating) AS average_rating
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN customer_reviews cr
    ON p.product_id = cr.product_id
GROUP BY p.product_id, p.product_name;

-- Q98 Which customers have never purchased anything?

SELECT 
	c.customer_name
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Q99 Which products have never been purchased?

SELECT 
	p.product_name
FROM products p
LEFT JOIN order_items oi 
	ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

-- Q100 What is our monthly revenue trend?
    
SELECT 
	YEAR(o.order_date) AS year,
	MONTH(o.order_date) AS month,
    SUM(p.price * oi.quantity) AS revenue
FROM products p
JOIN order_items oi
	ON p.product_id = oi.product_id
JOIN orders o
	ON oi.order_id = o.order_id
GROUP BY YEAR(o.order_date), MONTH(o.order_date)
ORDER BY year, month;


-- Q101 What percentage of orders are cancelled?

SELECT
    ROUND(
        (COUNT(CASE WHEN status = 'Cancelled' THEN 1 END) / COUNT(*)) * 100,2) AS cancelled_order_percentage
FROM orders;

-- Q102 Which payment method generates the highest revenue?
    
SELECT 
	o.payment_method,
    SUM(p.price * oi.quantity) AS highest_revenue
FROM orders o
JOIN order_items oi
	ON o.order_id = oi.order_id
JOIN products p
	ON oi.product_id = p.product_id
GROUP BY payment_method
ORDER BY highest_revenue DESC
LIMIT 1;

    
-- Q103 What is the average order value (AOV)?
-- AOV = Total Revenue / Number of Orders

SELECT 
	SUM(p.price * oi.quantity) / COUNT(DISTINCT o.order_id) AS AOV
FROM order_items oi
JOIN orders o
	ON oi.order_id = o.order_id
JOIN products p 
	ON oi.product_id = p.product_id;

-- Q104 What is the repeat customer rate?

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS order_count
    FROM orders
    GROUP BY customer_id
)
SELECT
    ROUND(
        SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END)
        / COUNT(*) * 100,
        2
    ) AS repeat_customer_rate
FROM customer_orders;


-- Q105 Which customers placed more than one order?

SELECT 
	c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c 
JOIN orders o
	ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING total_orders > 1;

-- Q106 Which product has the highest profit margin?

SELECT
    p.product_id,
    p.product_name,
    ROUND(((p.price - p.cost) / p.price) * 100, 2) AS profit_margin
FROM products p
ORDER BY profit_margin DESC
LIMIT 1;

-- Q107 Which category has the highest average rating?
    
SELECT
    cat.category_name,
    AVG(cr.rating) AS average_rating
FROM categories cat
JOIN products p
    ON cat.category_id = p.category_id
JOIN customer_reviews cr
    ON p.product_id = cr.product_id
GROUP BY cat.category_id, cat.category_name
ORDER BY average_rating DESC
LIMIT 1;

-- Q108 What are the top 3 products in each category?

WITH ranked_products AS (
    SELECT
        p.product_name,
        cat.category_name,
        SUM(p.price * oi.quantity) AS total_revenue,
        RANK() OVER (
            PARTITION BY cat.category_id
            ORDER BY SUM(p.price * oi.quantity) DESC
        ) AS product_rank
    FROM products p
    JOIN categories cat
        ON p.category_id = cat.category_id
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY
        p.product_id,
        p.product_name,
        cat.category_id,
        cat.category_name
)
SELECT
    product_name,
    category_name,
    total_revenue,
    product_rank
FROM ranked_products
WHERE product_rank <= 3;

-- Q109 Which month had the highest revenue?
    
SELECT
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    SUM(p.price * oi.quantity) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY YEAR(o.order_date), MONTH(o.order_date)
ORDER BY total_revenue DESC
LIMIT 1;

-- Q110 Which customers spent above the average customer spending?

SELECT
    c.customer_name,
    SUM(p.price * oi.quantity) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(p.price * oi.quantity) > (
    SELECT AVG(customer_spending)
    FROM (
        SELECT
            o2.customer_id,
            SUM(p2.price * oi2.quantity) AS customer_spending
        FROM orders o2
        JOIN order_items oi2
            ON o2.order_id = oi2.order_id
        JOIN products p2
            ON oi2.product_id = p2.product_id
        GROUP BY o2.customer_id
    ) AS customer_totals
);