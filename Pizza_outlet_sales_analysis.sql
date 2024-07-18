Create database if not exists pizza;

use pizza;

create table order_date(
Order_id int primary key, 
date_ordered date not null,
time_ordered time not null
);

create table order_details(
SI_no int primary key,
Order_id int,
pizza_id varchar(50) not null,
quantity int not null,
foreign key (Order_id) references order_date (order_id)
);

create table pizza_varients(
pizza_type varchar(50) primary key,
pizza_name varchar(150) not null,
category varchar(50) not null,
ingredients text(10000) not null
);


create table pizza_ordered(
pizza_id varchar(50) primary key,
pizza_type varchar(50),
size varchar(3) not null,
price float not null,
foreign key (pizza_type) references pizza_varients(pizza_type)
);

show global variables like 'local_infile';
SET GLOBAL local_infile = 1;


LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL_Server 8.0/Uploads/Order_dateNtime.csv'
INTO TABLE order_date
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from order_date;

LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL_Server 8.0/Uploads/Order_details.csv'
INTO TABLE order_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL_Server 8.0/Uploads/Pizza_varient.csv"
INTO TABLE pizza_varients
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL_Server 8.0/Uploads/Pizzas_ordered.csv"
INTO TABLE pizza_ordered
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- How many pizza types are there in total?
select count(pizza_type) as Total_pizza_types from pizza_varients;

-- Retrieve the total number of orders placed.
select count(order_id) as Total_number_of_orders from order_date;

-- Identify the most common pizza size ordered.
select size as most_ordered_pizza_size, count(size) as Total from pizza_ordered
group by size
order by size limit 1;

-- What is the average number of pizzas ordered per order?
select order_id, sum(quantity) as total_orders
from order_details
group by order_id
order by total_orders
desc limit 1;

-- Determine the distribution of orders per month.
select monthname(date_ordered) as month, count(order_id) as total
from order_date
group by month;

-- Determine the distribution of orders by hour of the day.
select hour(time_ordered) as hour, count(order_id) as total
from order_date
group by hour
order by hour;

-- Calculate the total revenue generated from pizza sales.
select sum(order_details.quantity*pizza_ordered.price) as Total_revenue from order_details
join
pizza_ordered on order_details.pizza_id=pizza_ordered.pizza_id;

-- Calculate the total revenue rounded to 2 decimal places.
select round(sum(order_details.quantity*pizza_ordered.price),2) as Total_revenue from order_details
join
pizza_ordered on order_details.pizza_id=pizza_ordered.pizza_id;

-- Determine the top 3 most ordered pizza types based on revenue.
select order_details.pizza_id, round(sum(pizza_ordered.price*order_details.quantity),2) as total_revenue
from order_details
join
pizza_ordered on order_details.pizza_id=pizza_ordered.pizza_id
group by pizza_id
order by total_revenue desc limit 3;

-- Calculate the percentage contribution of each pizza category to total revenue.
select pizza_varients.category, round(sum(order_details.quantity*pizza_ordered.price)/
(select sum(pizza_ordered.price*order_details.quantity)
from order_details
join
pizza_ordered on order_details.pizza_id=pizza_ordered.pizza_id)
*100,2) as Percentage from pizza_varients
join pizza_ordered on pizza_varients.pizza_type=pizza_ordered.pizza_type
join order_details on pizza_ordered.pizza_id=order_details.pizza_id
group by category
order by percentage desc;

-- Identify the highest-priced pizza.
select pizza_varients.pizza_name as pizza, pizza_ordered.price as price
from pizza_varients
join
pizza_ordered on pizza_varients.pizza_type=pizza_ordered.pizza_type
order by price desc limit 1;

-- List the top 5 most ordered pizza types along with their quantities.
select pizza_ordered.pizza_type as piza_type, sum(order_details.quantity) as total
from pizza_ordered
join
order_details on pizza_ordered.pizza_id=order_details.pizza_id
group by pizza_type
order by total desc limit 5;

-- Find the total quantity of each pizza category ordered.
select pizza_varients.category as Pizza_category, sum(order_details.quantity) as total_quantity from pizza_varients
inner join pizza_ordered  on pizza_varients.pizza_type=pizza_ordered.pizza_type
join order_details on pizza_ordered.pizza_id=order_details.pizza_id
group by Pizza_category
order by total_quantity desc;

-- Identify the busiest day for orders.
select dayname(order_date.date_ordered) as Busiest_day, sum(order_details.quantity) as Total_orders
from order_date
join order_details on order_date.order_id=order_details.order_id
group by Busiest_day
order by Total_orders desc limit 1;

-- Analyze the total revenue generated.
select round(sum(pizza_ordered.price*order_details.quantity),2) as Total_Revenue
from pizza_ordered
join order_details on pizza_ordered.pizza_id=order_details.pizza_id;
