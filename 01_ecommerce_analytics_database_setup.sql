CREATE DATABASE ecommerce_analytics;

 USE ecommerce_analytics;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(20),
    age INT,
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    cost DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(30),
    payment_method VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    discount DECIMAL(5,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE customer_reviews (
    review_id INT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    product_id INT,
    rating INT,
    review_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home & Kitchen'),
(4, 'Beauty'),
(5, 'Sports');

INSERT INTO customers VALUES
(1, 'Rahul Sharma', 'Male', 24, 'Bangalore', 'Karnataka', '2024-01-15'),
(2, 'Priya Patel', 'Female', 29, 'Mumbai', 'Maharashtra', '2024-02-20'),
(3, 'Amit Kumar', 'Male', 32, 'Delhi', 'Delhi', '2024-03-10'),
(4, 'Neha Shah', 'Female', 26, 'Ahmedabad', 'Gujarat', '2024-03-25'),
(5, 'Rohan Mehta', 'Male', 35, 'Pune', 'Maharashtra', '2024-04-12'),
(6, 'Sneha Rao', 'Female', 23, 'Bangalore', 'Karnataka', '2024-05-05'),
(7, 'Karan Singh', 'Male', 41, 'Hyderabad', 'Telangana', '2024-05-18'),
(8, 'Anjali Verma', 'Female', 31, 'Delhi', 'Delhi', '2024-06-01'),
(9, 'Vikas Joshi', 'Male', 27, 'Jaipur', 'Rajasthan', '2024-06-15'),
(10, 'Pooja Desai', 'Female', 38, 'Surat', 'Gujarat', '2024-07-02'),
(11, 'Arjun Nair', 'Male', 30, 'Kochi', 'Kerala', '2024-07-20'),
(12, 'Meera Iyer', 'Female', 28, 'Chennai', 'Tamil Nadu', '2024-08-05'),
(13, 'Sahil Khan', 'Male', 25, 'Lucknow', 'Uttar Pradesh', '2024-08-18'),
(14, 'Kavya Reddy', 'Female', 33, 'Hyderabad', 'Telangana', '2024-09-10'),
(15, 'Manish Gupta', 'Male', 45, 'Noida', 'Uttar Pradesh', '2024-09-25');

INSERT INTO products VALUES
(1, 'iPhone 15', 1, 70000, 55000),
(2, 'Samsung Galaxy S24', 1, 65000, 50000),
(3, 'Dell Laptop', 1, 75000, 60000),
(4, 'Sony Headphones', 1, 12000, 8000),
(5, 'Nike Shoes', 5, 8000, 5000),
(6, 'Adidas T-Shirt', 2, 2500, 1400),
(7, 'Levis Jeans', 2, 4500, 2700),
(8, 'Puma Jacket', 2, 6000, 3800),
(9, 'Mixer Grinder', 3, 5000, 3200),
(10, 'Air Fryer', 3, 9000, 6000),
(11, 'Coffee Maker', 3, 7000, 4500),
(12, 'Face Wash', 4, 600, 300),
(13, 'Perfume', 4, 2500, 1300),
(14, 'Yoga Mat', 5, 1500, 800),
(15, 'Cricket Bat', 5, 5000, 3000);

INSERT INTO orders VALUES
(101, 1, '2025-01-05', 'Delivered', 'Credit Card'),
(102, 2, '2025-01-08', 'Delivered', 'UPI'),
(103, 3, '2025-01-12', 'Cancelled', 'Credit Card'),
(104, 4, '2025-01-15', 'Delivered', 'UPI'),
(105, 5, '2025-01-20', 'Delivered', 'Debit Card'),
(106, 6, '2025-02-02', 'Delivered', 'UPI'),
(107, 7, '2025-02-05', 'Pending', 'Credit Card'),
(108, 8, '2025-02-10', 'Delivered', 'Net Banking'),
(109, 9, '2025-02-15', 'Delivered', 'UPI'),
(110, 10, '2025-02-20', 'Cancelled', 'Debit Card'),
(111, 11, '2025-03-01', 'Delivered', 'UPI'),
(112, 12, '2025-03-05', 'Delivered', 'Credit Card'),
(113, 13, '2025-03-10', 'Delivered', 'UPI'),
(114, 14, '2025-03-15', 'Pending', 'Debit Card'),
(115, 15, '2025-03-20', 'Delivered', 'Credit Card'),
(116, 1, '2025-04-02', 'Delivered', 'UPI'),
(117, 2, '2025-04-05', 'Delivered', 'Credit Card'),
(118, 4, '2025-04-10', 'Delivered', 'UPI'),
(119, 6, '2025-04-15', 'Delivered', 'Debit Card'),
(120, 8, '2025-04-20', 'Delivered', 'UPI');

INSERT INTO order_items VALUES
(1,101,1,1,5),
(2,101,4,2,10),
(3,102,5,2,5),
(4,102,6,3,10),
(5,103,3,1,0),
(6,104,7,1,5),
(7,104,12,2,10),
(8,105,10,1,5),
(9,105,11,1,0),
(10,106,14,2,5),
(11,106,5,1,10),
(12,107,2,1,5),
(13,108,13,2,10),
(14,108,12,3,5),
(15,109,15,1,0),
(16,109,6,2,5),
(17,110,9,1,10),
(18,111,3,1,5),
(19,111,4,1,0),
(20,112,8,1,10),
(21,112,7,2,5),
(22,113,5,1,0),
(23,113,14,2,5),
(24,114,10,1,5),
(25,115,1,1,10),
(26,115,13,1,5),
(27,116,2,1,5),
(28,116,4,2,10),
(29,117,10,1,0),
(30,117,11,1,5),
(31,118,6,4,10),
(32,118,7,1,5),
(33,119,5,2,5),
(34,119,14,1,0),
(35,120,3,1,10),
(36,120,13,2,5);

INSERT INTO customer_reviews VALUES
(1,101,1,1,5,'2025-01-10'),
(2,101,1,4,4,'2025-01-10'),
(3,102,2,5,5,'2025-01-15'),
(4,102,2,6,4,'2025-01-15'),
(5,104,4,7,3,'2025-01-20'),
(6,104,4,12,4,'2025-01-20'),
(7,105,5,10,5,'2025-01-25'),
(8,106,6,14,4,'2025-02-08'),
(9,106,6,5,5,'2025-02-08'),
(10,108,8,13,3,'2025-02-18'),
(11,108,8,12,4,'2025-02-18'),
(12,109,9,15,5,'2025-02-22'),
(13,111,11,3,4,'2025-03-10'),
(14,111,11,4,5,'2025-03-10'),
(15,112,12,8,3,'2025-03-15'),
(16,113,13,5,4,'2025-03-20'),
(17,113,13,14,5,'2025-03-20'),
(18,115,15,1,5,'2025-03-28'),
(19,115,15,13,4,'2025-03-28'),
(20,116,1,2,4,'2025-04-10'),
(21,117,2,10,5,'2025-04-12'),
(22,118,4,6,3,'2025-04-18'),
(23,119,6,5,5,'2025-04-22'),
(24,120,8,3,4,'2025-04-28');

