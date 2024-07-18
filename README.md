# SQL-Pizza-Outlet-sales-Analysis

## Project Overview
In this project, we delve into a dataset of pizza sales to uncover valuable insights. The analysis spans from fundamental data exploration to sophisticated performance metrics, enabling us to comprehend sales patterns, customer preferences, and more.

### Identifying Challenges
After discovering these datasets on Kaggle, I analyzed them from the perspective of a busy pizza outlet owner. My goal was to extract valuable insights regarding pizza orders and customer behavior. To achieve this, I formulated several key questions about my pizza outlet.

### Strategy for Solutions
To derive meaningful insights from the extensive pizza order dataset, I employed SQL for data extraction and analysis. By executing a series of SQL queries, I identified key metrics and trends. This structured approach provided actionable insights to enhance the menu, streamline inventory management, and boost customer satisfaction. Leveraging these data-driven insights, I aimed to make informed decisions to drive business growth and improve the overall customer experience, positioning my pizza outlet as the best in town.

### About data

The database consists of the following tables:

## Table: order_date

| Column        | Description                     | Data Type |
|---------------|---------------------------------|-----------|
| order_id      | Unique identifier for the order | INT       |
| date_ordered  | Date when the order was placed  | DATE      |
| time_ordered  | Time when the order was placed  | TIME      |

## Table: order_details

| Column   | Description                          | Data Type  |
|----------|--------------------------------------|------------|
| si_no    | Serial number of the order detail entry | INT     |
| order_id | Unique identifier for the order      | INT        |
| pizza_id | Unique identifier for the pizza      | VARCHAR(50)|
| quantity | Quantity of the pizza ordered        | INT        |

## Table: pizza_varients

| Column       | Description             | Data Type     |
|--------------|-------------------------|---------------|
| pizza_type   | Type of the pizza       | VARCHAR(50)   |
| pizza_name   | Name of the pizza       | VARCHAR(150)  |
| category     | Category of the pizza   | VARCHAR(50)   |
| ingredients  | Ingredients used in the pizza | TEXT    |

## Table: pizza_ordered

| Column      | Description                | Data Type       |
|-------------|----------------------------|---------------  |
| pizza_id    | Unique identifier for the pizza | VARCHAR(50)|
| pizza_type  | Type of the pizza          | VARCHAR(50)     |
| size        | Size of the pizza          | VARCHAR(3)      |
| price       | Price of the pizza         | FLOAT           |

## SQL Queries for Pizza Sales Analysis

- **How many pizza types are there in total?**
- **Retrieve the total number of orders placed.**
- **Identify the most common pizza size ordered.**
- **What is the average number of pizzas ordered per order?**
- **Determine the distribution of orders per month.**
- **Determine the distribution of orders by hour of the day.**
- **Calculate the total revenue generated from pizza sales.**
- **Calculate the total revenue rounded to 2 decimal places.**
- **Determine the top 3 most ordered pizza types based on revenue.**
- **Calculate the percentage contribution of each pizza category to total revenue.**
- **Identify the highest-priced pizza.**
- **List the top 5 most ordered pizza types along with their quantities.**
- **Find the total quantity of each pizza category ordered.**
- **Identify the busiest day for orders.**
- **Analyze the total revenue generated.**

