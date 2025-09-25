DROP DATABASE IF EXISTS tim_pizza_assignment;

CREATE DATABASE tim_pizza_assignment;

USE tim_pizza_assignment;


CREATE TABLE customer (
    customer_id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(45) NOT NULL,
    phone_number VARCHAR(45) NOT NULL,
    PRIMARY KEY (customer_id)
);


CREATE TABLE pizza (
    pizza_id INT NOT NULL AUTO_INCREMENT,
    pizza_name VARCHAR(45) NOT NULL,
    cost DECIMAL(15,2) NOT NULL,
    PRIMARY KEY (pizza_id)
);


CREATE TABLE orders (
    order_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);


CREATE TABLE order_pizzas (
    order_id INT NOT NULL,
    pizza_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, pizza_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (pizza_id) REFERENCES pizza(pizza_id)
);


INSERT INTO pizza (pizza_name, cost) 
VALUES
    ('Pepperoni & Cheese', 7.99),
    ('Vegetarian', 9.99),
    ('Meat Lovers', 14.99),
    ('Hawaiian', 12.99);


INSERT INTO customer (customer_name, phone_number)
VALUES
    ('Trevor Page', '226-555-4982'),
    ('John Doe', '555-555-9498');


INSERT INTO orders (customer_id, order_date)
VALUES (1, '2023-09-10 09:47:00');

INSERT INTO order_pizzas (order_id, pizza_id, quantity)
VALUES
    (1, 1, 1), 
    (1, 3, 1); 

INSERT INTO orders (customer_id, order_date)
VALUES (2, '2023-09-10 13:20:00');

INSERT INTO order_pizzas (order_id, pizza_id, quantity)
VALUES
    (2, 2, 1), 
    (2, 3, 2); 


INSERT INTO orders (customer_id, order_date)
VALUES (1, '2023-09-10 09:47:00');

INSERT INTO order_pizzas (order_id, pizza_id, quantity)
VALUES
    (3, 3, 1), 
    (3, 4, 1); 


INSERT INTO orders (customer_id, order_date)
VALUES (2, '2023-10-10 10:37:00');

INSERT INTO order_pizzas (order_id, pizza_id, quantity)
VALUES
    (4, 2, 3), 
    (4, 4, 1); 


SELECT 
    c.customer_name, 
    SUM(op.quantity * p.cost) AS total_spent
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_pizzas op ON o.order_id = op.order_id
JOIN pizza p ON op.pizza_id = p.pizza_id
GROUP BY c.customer_name;


SELECT 
    c.customer_name, 
    o.order_date, 
    SUM(op.quantity * p.cost) AS total_spent
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_pizzas op ON o.order_id = op.order_id
JOIN pizza p ON op.pizza_id = p.pizza_id
GROUP BY c.customer_name, o.order_date;