create database project;
use project;

-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15)
);
INSERT INTO customers VALUES
    (1, 'asad ali', 'asa@example.com', '123-456-60'),
    (2, 'sami', 'sami@example.com', '987-654-61'),
	(3, 'sahil', 'sahi@example.com', '987-654-62'),
	(4, 'ahmed', 'ahm@example.com', '987-654-63'),
    (6, 'ali', 'ali@example.com', '987-654-64'),
	(7, 'sadam', 'sad@example.com', '987-654-65'),
	(8, 'sattar', 'satt@example.com', '987-654-66'),
	(9, 'gaffar', 'gaf@example.com', '987-654-67'),
	(10, 'shakeel', 'sha@example.com', '987-654-68'),
	(11, 'rafeek', 'raf@example.com', '987-654-69'),
    (12, 'amir', 'am@example.com', '987-654-70'),
    (13, 'kashif', 'ka@example.com', '987-654-71'),
    (14, 'rehan', 'ra@example.com', '987-654-72'),
    (15, 'nwaz', 'naw@example.com', '987-654-73'),
    (16, 'akhtar', 'akh@example.com', '987-654-74');
    
    CREATE TABLE menu_items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    price DECIMAL(8, 2)
);
INSERT INTO menu_items VALUES
    (17, 'sandwich', 5.00),
    (18, 'cake', 3.50),
    (19,"cappuccino", 200),
    (20,"latte",150),
    (21, 'burger', 6.50),
    (22, 'biryani', 9.00),
    (23, 'pizza', 12.00),
    (24, 'salad', 4.50),
    (25, 'pasta', 8.50),
    (26, 'grilled chicken', 10.00),
    (27, 'sushi', 15.50),
    (28, 'quesadilla', 7.50),
    (29, 'steak', 14.00),
    (30, 'fish and chips', 11.00),
    (31, 'shrimp scampi', 13.50),
    (32, 'vegetable curry', 9.50),
    (33, 'chicken wings', 8.00),
    (35, 'tacos', 7.00),
    (36, 'panini', 6.00),
    (37, 'samosa', 3.50),
    (38, 'ramen', 10.50),
    (39, 'spring rolls', 4.00),
    (40, 'gyro', 8.50);

-- Orders table
CREATE TABLE orders (
    customer_id INT,
    item_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);

-- Sample orders
INSERT INTO orders  VALUES
    (1, 17 ), 
    (2, 23), 
    (3, 30), 
    (4, 21), 
    (6, 26), 
    (7, 39), 
    (8, 32), 
    (9, 18), 
    (10, 27), 
    (11, 22), 
    (12, 25), 
    (13, 37), 
    (14, 40), 
    (15, 19), 
    (16, 35); 
    
    
    
    CREATE TABLE order_items (
    order_item_id int,
    item_name varchar (78)
);

INSERT INTO order_items VALUES
    (17,'sandwich'),
    (23, 'pizza'),
    (30, 'fish and chips'),
	(21, 'burger' ),
	(26, 'grilled chicken'),
	(39, 'spring rolls'),
    (32, 'vegetable curry'),
    (18, ' cake'),
    (27, ' sushi'),
    (22,  'biryani');
    
    
    select * from customers;
    
	select * from menu_items;
      
	select * from orders;
	select * from order_items;
          
    select * from customers where customer_name = 'sami';
drop database project;

SELECT customers.customer_name, menu_items.item_name
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN menu_items ON orders.item_id = menu_items.item_id;

SELECT customers.customer_name, menu_items.item_name, menu_items.price
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN menu_items ON orders.item_id = menu_items.item_id;


SELECT * FROM customers WHERE customer_name = 'asad ali';
        

SELECT * FROM customers WHERE customer_name = 'sami';



SELECT * FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);


SELECT COUNT(*) AS total_customers
FROM customers;



SELECT * FROM menu_items
WHERE price < 8.00;

SELECT * FROM menu_items
WHERE price > 3.00;



SELECT * FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);

SELECT SUM( mi.price) AS total_sales
FROM order_items oi
JOIN menu_items mi ON oi.item_name = mi.item_name;

SELECT AVG(price) AS average_price FROM menu_items;


SELECT SUM(mi.price) AS total_sales
FROM order_items oi
JOIN menu_items mi ON oi.item_name = mi.item_name;


SELECT AVG(menu_items.price) AS average_price
FROM orders
JOIN menu_items ON orders.item_id = menu_items.item_id;

SELECT customers.customer_name
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.customer_id IS NULL;

SELECT order_items.item_name, COUNT(*) AS order_count
FROM orders
JOIN order_items ON orders.item_id = order_items.order_item_id
GROUP BY order_items.item_name
ORDER BY order_count DESC
LIMIT 5;



select count(*) as total_customers from customers;
select * from menu_items where price < 500;
select avg(price) as average_price from menu_items;



select * from customers where customer_name = 'sami';