# 🛒 Ecommerce Analytics — SQL Interview Question Bank

This question bank contains **110 SQL interview questions** and **10 advanced SQL challenges** designed for practicing MySQL and preparing for Data Analyst interviews.

The questions progress from basic SQL concepts to advanced business analytics problems.

> **Practice rule:** Try to solve these questions yourself in MySQL before checking your solutions.

---

## 📊 Topics Covered

* SELECT and WHERE
* ORDER BY and LIMIT
* DISTINCT
* Aggregate Functions
* GROUP BY
* HAVING
* JOINs
* Business Calculations
* CASE WHEN
* Subqueries
* CTEs
* Window Functions
* Date Functions
* Business Analytics Questions
* Advanced Interview Challenges

---

# 🟢 LEVEL 1 — SELECT / WHERE

### Q1. Display all customers.

### Q2. Display customer names and cities.

### Q3. Find customers who live in Bangalore.

### Q4. Find customers older than 30.

### Q5. Find all products with price greater than ₹10,000.

### Q6. Find products belonging to category 1.

### Q7. Find all delivered orders.

### Q8. Find orders paid using UPI.

### Q9. Find customers from Karnataka or Maharashtra.

### Q10. Find products whose price is between ₹2,000 and ₹10,000.

---

# 🟡 LEVEL 2 — ORDER BY / LIMIT / DISTINCT

### Q11. Find the 5 most expensive products.

### Q12. Find the cheapest product.

### Q13. Find the 3 oldest customers.

### Q14. Display customers ordered by age descending.

### Q15. Find all unique cities.

### Q16. Find all unique payment methods.

### Q17. Find the 2nd most expensive product.

### Q18. Find the 3rd most expensive product.

---

# 🟠 LEVEL 3 — AGGREGATE FUNCTIONS

### Q19. Find the total number of customers.

### Q20. Find the average customer age.

### Q21. Find the maximum product price.

### Q22. Find the minimum product price.

### Q23. Find the total number of orders.

### Q24. Find the number of delivered orders.

### Q25. Find the total quantity of products sold.

### Q26. Find the average product price.

---

# 🔵 LEVEL 4 — GROUP BY

### Q27. Count customers by gender.

### Q28. Count customers by city.

### Q29. Count customers by state.

### Q30. Find average age by gender.

### Q31. Count orders by status.

### Q32. Count orders by payment method.

### Q33. Find total quantity sold for each product.

### Q34. Find the average rating for each product.

### Q35. Find the number of customers who signed up each month.

---

# 🟣 LEVEL 5 — HAVING

### Q36. Find cities having more than 1 customer.

### Q37. Find products that have sold more than 2 units.

### Q38. Find payment methods used in more than 3 orders.

### Q39. Find products whose average rating is greater than 4.

### Q40. Find customers who have placed more than 1 order.

---

# 🔥 LEVEL 6 — JOINS

This is where real **Data Analyst interview preparation** begins.

### Q41. Display order ID along with customer name.

### Q42. Display customer name, order date and order status.

### Q43. Display product name and category name.

### Q44. Display order ID, product name and quantity.

### Q45. Display customer name, product name and quantity purchased.

### Q46. Display customer name, order date, product name and quantity.

### Q47. Find all customers who have placed an order.

### Q48. Find customers who have never placed an order.

### Q49. Find products that have never been ordered.

### Q50. Find all orders along with customer information.

---

# 🔥🔥 LEVEL 7 — BUSINESS CALCULATIONS

Now start thinking like a Data Analyst.

### Q51. Calculate revenue for each order item.

**Formula:**

```text
revenue = price × quantity
```

### Q52. Calculate revenue after discount.

### Q53. Calculate profit for each product sold.

**Formula:**

```text
profit = (price - cost) × quantity
```

### Q54. Find total revenue.

### Q55. Find total profit.

### Q56. Find revenue by product.

### Q57. Find revenue by category.

### Q58. Find revenue by customer.

### Q59. Find the top 5 products by revenue.

### Q60. Find the top 5 customers by total spending.

---

# 🟤 LEVEL 8 — CASE WHEN

### Q61. Classify customers based on age.

```text
Age < 25       → Young
25–35          → Adult
> 35           → Senior
```

### Q62. Classify products based on price.

```text
< 2000         → Low
2000–10000     → Medium
> 10000        → High
```

### Q63. Create an order priority.

```text
Delivered → Completed
Pending   → Open
Cancelled → Lost
```

### Q64. Calculate profit margin for every product.

### Q65. Identify products where selling price is more than 30% higher than cost.

---

# 🔴 LEVEL 9 — SUBQUERIES

### Q66. Find products more expensive than the average product price.

### Q67. Find customers older than the average customer age.

### Q68. Find the most expensive product.

### Q69. Find customers whose spending is greater than the average customer spending.

### Q70. Find the second-highest product price.

### Q71. Find products whose price is higher than the average price of their category.

---

# 🔥🔥 LEVEL 10 — CTEs

### Q72. Create a CTE containing total revenue by product. Then find the top 5 products.

### Q73. Create a CTE containing total spending by customer. Find customers spending more than ₹50,000.

### Q74. Create a CTE for monthly revenue. Find the month with the highest revenue.

### Q75. Create a CTE calculating product profit. Find the most profitable product.

### Q76. Create a CTE calculating customer order count. Find customers with more than one order.

---

# 🔥🔥🔥 LEVEL 11 — WINDOW FUNCTIONS

These are **very important for Data Analyst interviews**.

### Q77. Rank products by price.

Use:

```sql
RANK()
```

### Q78. Rank customers by total spending.

### Q79. Find the top 3 products by revenue.

Use:

```sql
ROW_NUMBER()
```

### Q80. Find the highest-revenue product in each category.

### Q81. Find the second-highest product in each category.

### Q82. Calculate running monthly revenue.

### Q83. Calculate each product's percentage contribution to total revenue.

### Q84. Compare each customer's spending with the previous customer.

Use:

```sql
LAG()
```

### Q85. Find the difference between current month's revenue and previous month's revenue.

---

# 📅 LEVEL 12 — DATE FUNCTIONS

### Q86. Find all orders placed in January 2025.

### Q87. Find monthly order count.

### Q88. Find monthly revenue.

### Q89. Find the number of orders placed each day.

### Q90. Find customers who signed up in 2024.

### Q91. Find the first order date of every customer.

### Q92. Find the latest order date of every customer.

### Q93. Find customers who placed an order within 30 days of signup.

---

# 🚀 LEVEL 13 — REAL INTERVIEW BUSINESS QUESTIONS

These questions are designed to simulate real Data Analyst interview and business-analysis scenarios.

### Q94. Who are our top 5 customers by revenue?

### Q95. Which product generates the highest revenue?

### Q96. Which category generates the highest revenue?

### Q97. Which products have high sales but low ratings?

### Q98. Which customers have never purchased anything?

### Q99. Which products have never been purchased?

### Q100. What is our monthly revenue trend?

### Q101. What percentage of orders are cancelled?

### Q102. Which payment method generates the highest revenue?

### Q103. What is the average order value (AOV)?

**Formula:**

```text
AOV = Total Revenue / Number of Orders
```

### Q104. What is the repeat customer rate?

### Q105. Which customers placed more than one order?

### Q106. Which product has the highest profit margin?

### Q107. Which category has the highest average rating?

### Q108. What are the top 3 products in each category?

### Q109. Which month had the highest revenue?

### Q110. Which customers spent above the average customer spending?

---

# 🧠 FINAL INTERVIEW CHALLENGES

Once you complete **Q1–Q110**, try these challenges **without being told which SQL concept to use**.

These are designed to test your ability to independently identify the appropriate SQL approach.

---

## 🏆 Challenge 1 — Top 10% Customers

> The company wants to identify its most valuable customers. Find customers whose total spending is in the top 10%.

---

## 🏆 Challenge 2 — Highest Revenue Product by Category

> Management wants the highest-revenue product from every category.

---

## 🏆 Challenge 3 — Multiple Categories Purchased

> Find customers who purchased products from at least 2 different categories.

---

## 🏆 Challenge 4 — Consecutive-Month Orders

> Find customers who placed orders in consecutive months.

---

## 🏆 Challenge 5 — Category Revenue Contribution

> Find the percentage of total revenue generated by each category.

---

## 🏆 Challenge 6 — Above-Average Product Revenue

> Find products whose revenue is above the average revenue of all products.

---

## 🏆 Challenge 7 — Customer With Most Orders

> Find the customer with the highest number of orders.

---

## 🏆 Challenge 8 — First and Most Recent Purchase

> Find each customer's first and most recent purchase.

---

## 🏆 Challenge 9 — Electronics but Never Clothing

> Find customers who have purchased **Electronics but never purchased Clothing**.

---

## 🏆 Challenge 10 — Top 3 Customers by City

> Find the top 3 customers in every city based on spending.

---

# 🎯 Skills Practiced

By completing this question bank, you will practice:

* `SELECT`
* `WHERE`
* `DISTINCT`
* `ORDER BY`
* `LIMIT`
* Aggregate functions
* `GROUP BY`
* `HAVING`
* `INNER JOIN`
* `LEFT JOIN`
* `CASE WHEN`
* Subqueries
* CTEs
* `RANK()`
* `ROW_NUMBER()`
* `LAG()`
* Date functions
* Revenue calculations
* Profit calculations
* Customer analysis
* Product analysis
* Category analysis
* Business KPIs
* Advanced analytical SQL

---

## 📌 Practice Goal

**Complete Q1–Q110 first.**

Then attempt the **10 Final Interview Challenges** without looking at previous solutions.

The goal is not only to write SQL syntax, but to understand **how to translate a business question into a SQL query**.

---

### 📁 Related Project Files

* `01_ecommerce_analytics_database_setup.sql` — Database and table setup
* `02_ecommerce_analytics_questions_01-110.sql` — SQL solutions for Q1–Q110
* `ecommerce_analytics_question_bank.md` — Question bank and interview challenges
