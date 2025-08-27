CREATE TABLE `pizza_assignment`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NULL,
  `order_date` DATETIME NULL,
  PRIMARY KEY (`order_id`),
  foreign key (customer_id) references customer(customer_id));
  
  
  drop table order_pizza;
  
  alter table orders
  add column quantity int not null;
  
  insert into pizza (pizza_name, cost) 
  values
  ('Pepperoni & Cheese', 7.99),
  ('Vegetarian', 9.99),
  ('Meat Lovers', 14.99),
  ('Hawaiian', 12.99);

select * from orders;

insert into customer (customer_name, phone_number)
values
('Trevor Page', '226-555-4982'),
('John Doe', '555-555-9498');

select * from customer;

insert into orders (customer_id, order_date, pizza_id, pizza_2_id, quantity, quantity_2)
values
(1, '2023-09-10 09:47:00', 1,3,1, 1);

insert into orders (customer_id, order_date, pizza_id, pizza_2_id, quantity, quantity_2)
values
(2, '2023-09-10 13:20:00', 2,3,1, 2);

insert into orders (customer_id, order_date, pizza_id, pizza_2_id, quantity, quantity_2)
values
(1, '2023-09-10 09:47:00', 3,4,1, 1);

insert into orders (customer_id, order_date, pizza_id, pizza_2_id, quantity, quantity_2)
values
(2, '2023-10-10 10:37:00', 2,4,3, 1);


select * from orders;

alter table orders
add column quantity_2 int not null;

select c.customer_name, SUM((o.quantity*p.cost)+(o.quantity_2*p2.cost))
from orders o 
left join customer c
on o.customer_id = c.customer_id
left join pizza p
on o.pizza_id = p.pizza_id
left join pizza p2
on o.pizza_2_id = p2.pizza_id
group by 1;

select c.customer_name, order_date, SUM((o.quantity*p.cost)+(o.quantity_2*p2.cost))
from orders o 
left join customer c
on o.customer_id = c.customer_id
left join pizza p
on o.pizza_id = p.pizza_id
left join pizza p2
on o.pizza_2_id = p2.pizza_id
group by 1, 2;