create database tim_pizza_assignment;

CREATE TABLE `tim_pizza_assignment`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`));
  
  
  CREATE TABLE `tim_pizza_assignment`.`pizza` (
  `pizza_id` INT NOT NULL AUTO_INCREMENT,
  `pizza_name` VARCHAR(45) NULL,
  `cost` DECIMAL(15,2) NULL,
  PRIMARY KEY (`pizza_id`));




CREATE TABLE `tim_pizza_assignment`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NULL,
  `order_date` DATETIME NULL,
  PRIMARY KEY (`order_id`),
  foreign key (customer_id) references customer(customer_id));

  alter table orders
add column transaction_id int;

  
  insert into pizza (pizza_name, cost) 
  values
  ('Pepperoni & Cheese', 7.99),
  ('Vegetarian', 9.99),
  ('Meat Lovers', 14.99),
  ('Hawaiian', 12.99);



insert into customer (customer_name, phone_number)
values
('Trevor Page', '226-555-4982'),
('John Doe', '555-555-9498');


insert into orders (customer_id, order_date, pizza_id, quantity, transaction_id)
values
(1, '2023-09-10 09:47:00', 1, 1, 1),
(1, '2023-09-10 09:47:00', 3, 1, 1);

insert into orders (customer_id, order_date, pizza_id, quantity, transaction_id)
values
(2, '2023-09-10 13:20:00', 2, 1, 2),
(2, '2023-09-10 13:20:00', 3, 2, 2);

insert into orders (customer_id, order_date, pizza_id, quantity, transaction_id)
values
(1, '2023-09-10 09:47:00', 3, 1, 3),
(1, '2023-09-10 09:47:00', 4, 1, 3);

insert into orders (customer_id, order_date, pizza_id, quantity, transaction_id)
values
(2, '2023-10-10 10:37:00', 2, 3, 4),
(2, '2023-10-10 10:37:00', 4, 1, 4);




select c.customer_name, SUM(o.quantity*p.cost)
from orders o 
left join customer c
on o.customer_id = c.customer_id
left join pizza p
on o.pizza_id = p.pizza_id
group by 1;

select c.customer_name, order_date, SUM(o.quantity*p.cost)
from orders o 
left join customer c
on o.customer_id = c.customer_id
left join pizza p
on o.pizza_id = p.pizza_id
group by 1, 2;


