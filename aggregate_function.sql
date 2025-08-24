create database aggregate_function;

create table salesman(salesman_id int primary key,
name varchar(20) not null,
city varchar(20),
commision float);

insert into salesman(salesman_id,name,city,commision) values 
(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5003,'Lauson Hen','',0.12),
(5007,'Paul Adam','Rome',0.13);

select * from salesman;

create table customer(customer_id int primary key,
customer_name varchar(20) not null,
city varchar(20),
grade int,
salesman_id int,
foreign key (salesman_id) references salesman(salesman_id));

insert into customer(customer_id,customer_name,city,grade,salesman_id) values 
(3002,'Nick Rimando','New York',100,5001),
(3005,'Graham Zusi','California',200,5002),
(3001,'Brad Guzan','London',null,null),
(3004,'Fabian Johns','Paris',300,5006),
(3007,'Brad Davis','New York',200,5001),
(3009,'Geoff Camero','Berlin',100,null),
(3008,'Julian Green','London',300,5002),
(3003,'Jozy Altidor','Moncow',200,5007);

select * from customer;

set sql_safe_updates = 0;

CREATE TABLE orders (
    order_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    order_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO orders (order_no, purch_amt, order_date, customer_id, salesman_id)
VALUES 
(70001, 150.50, '2016-10-05', 3005, 5002),
(70009, 270.65, '2016-09-10', 3001, NULL),
(70002, 65.26, '2016-10-05', 3002, 5001),
(70004, 110.50, '2016-08-17', 3009, NULL),
(70007, 948.50, '2016-09-10', 3005, 5002),
(70005, 2400.60, '2016-07-27', 3007, 5001),
(70008, 5760.00, '2016-09-10', 3002, 5001),
(70010, 1983.43, '2016-10-10', 3004, 5006),
(70003, 2480.40, '2016-10-10', 3009, NULL),
(70012, 250.45, '2016-06-27', 3008, 5002),
(70011, 75.29, '2016-08-17', 3003, 5007);

select * from orders;

# 1) From the orders table, write a SQL query to calculate total purchase amount of all orders. Return total purchase amount.

select sum(purch_amt) from orders;

# 2) From the orders table, write a SQL query to calculate the average purchase amount of all orders. Return average purchase amount. 
select avg(purch_amt) from orders;

# 3) From the orders table, write a SQL query that counts the number of unique salespeople. Return number of salespeople.
select count(distinct salesman_id) from orders;

# 4) From the customer table, write a SQL query to count the number of customers. Return number of customers.  
select count(*) from customer;
select count(customer_name) from customer;

# 5) From the customer table, write a SQL query to determine the number of customers who received at least one grade for their activity. 
select count(customer_name) from customer
where grade is not null;

# 6) From the orders table, write a SQL query to find the maximum purchase amount.
select max(purch_amt) from orders;

# 7) From the orders table, write a SQL query to find the minimum purchase amount. 
select min(purch_amt) from orders;

# 8) From the customer table, write a SQL query to find the highest grade of the customers in each city. Return city, maximum grade.  
SELECT city, MAX(grade) AS max_grade
FROM customer
GROUP BY city
ORDER BY max_grade DESC;

# 9) From the orders table, write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount. 
select customer_id,Max(purch_amt) from orders
group by customer_id;

# 10) From the orders table, write a SQL query to find the highest purchase amount ordered by each customer on a particular date. Return, order date and highest purchase amount.
select customer_id,order_date,max(purch_amt) as max_amt from orders
group by customer_id,order_date
order by max_amt;

# 11) From the orders table, write a SQL query to determine the highest purchase amount made by each salesperson on '2012-08-17'. Return salesperson ID, purchase amount 
select salesman_id,max(purch_amt) from orders
where order_date = '2016-08-17'
group by salesman_id;

# 12) From the orders table, write a SQL query to find the highest order (purchase) amount by each customer on a particular order date.
#Filter the result by highest order (purchase) amount above 2000.00. Return customer id, order date and maximum purchase amount.
select customer_id,order_date,max(purch_amt) as max_amt from orders
group by customer_id,order_date
having max(purch_amt) > 2000.00;

# 13) From the orders table, write a SQL query to find the maximum order (purchase) amount in the range 2000 - 6000 (Begin and end values are included.) by combination of each customer and order date.
#Return customer id, order date and maximum purchase amount.
select customer_id,order_date,max(purch_amt) as max_amt from orders
group by customer_id,order_date
having max(purch_amt) between 2000 and 6000;

select customer_id,order_date,max(purch_amt) as max_amt from orders
group by customer_id,order_date
having max(purch_amt)>=2000 and max(purch_amt)<=6000;

# 14) From the following table, write a SQL query to find the maximum order (purchase) amount based on the combination of each customer and order date. Filter the rows for maximum order (purchase) amount is either 2000, 3000, 5760, 6000. 
#Return customer id, order date and maximum purchase amount.
select customer_id,order_date,max(purch_amt) as max_amt from orders
group by customer_id,order_date
having max(purch_amt) = 2000 or max(purch_amt) = 3000 or max(purch_amt) = 5760 or max(purch_amt) = 6000 ;

select customer_id,order_date,max(purch_amt) as max_amt from orders
group by customer_id,order_date
having max(purch_amt) in (2000,3000,5760,6000);

# 15) From the orders table, write a SQL query to determine the maximum order amount for each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included.).
#Return customer id and maximum purchase amount.
select customer_id,max(purch_amt) as max_amt from orders
where customer_id between 3002 and 3007
group by customer_id;

# 16) From the orders table, write a SQL query to find the maximum order (purchase) amount for each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Filter the rows for maximum order (purchase) amount is higher than 1000.
#Return customer id and maximum purchase amount.
select customer_id,max(purch_amt) as max_amt from orders
where customer_id between 3002 and 3007
group by customer_id
having max_amt > 1000;

# 17) From the orders table, write a SQL query to determine the maximum order (purchase) amount generated by each salesperson. Filter the rows for the salesperson ID is in the range 5003 and 5008 (Begin and end values are included.).
#Return salesperson id and maximum purchase amount.
select salesman_id,max(purch_amt) as max_amt from orders
where salesman_id between 5003 and 5008
group by salesman_id;

# 18) From the orders table, write a SQL query to count all the orders generated on '2012-08-17'. Return number of orders.
select count(*) from orders
where order_date =  '2016-08-17';

# 19) From the salesman table, write a SQL query to count the number of salespeople in a city. Return number of salespeople.
select count(salesman_id) from salesman;

# 20) From the orders table, write a SQL query to count the number of orders based on the combination of each order date and salesperson.
#Return order date, salesperson id.
select order_date,salesman_id, count(*) from orders
group by order_date,salesman_id;