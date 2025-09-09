create database bool;
use bool;

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
------------------------------------------------------------------------------------------------------------------------------
# 1) From the customer table, write a SQL query to locate the details of customers with grade values above 100.
# Return customer_id, cust_name, city, grade, and salesman_id. 

select customer_id,customer_name,city,grade,salesman_id from customer
where grade > 100;
------------------------------------------------------------------------------------------------------------------------------
# 2) From the customer table, write a SQL query to find all the customers in ‘New York’ city who have a grade value above 100.
# Return customer_id, cust_name, city, grade, and salesman_id.

select * from customer
where city = 'New York' and grade > 100;

------------------------------------------------------------------------------------------------------------------------------
# 3) From the customer table, write a SQL query to find customers who are from the city of New York or have a grade of over 100.
# Return customer_id, cust_name, city, grade, and salesman_id.  

select * from customer
where city = 'New York' or grade > 100;

------------------------------------------------------------------------------------------------------------------------------
# 4) From the customer table, write a SQL query to find customers who are either from the city 'New York' or who do not have a grade greater than 100.
# Return customer_id, cust_name, city, grade, and salesman_id.

select * from customer
where city = 'New York' or not grade > 100;
  
------------------------------------------------------------------------------------------------------------------------------
# 5) From the customer table, write a SQL query to identify customers who are not from the city of 'New York' and do not have a grade value greater than 100.
# Return customer_id, cust_name, city, grade, and salesman_id.

select * from customer
where city != 'New York' and not grade > 100;

------------------------------------------------------------------------------------------------------------------------------
# 6) From the orders table, write a SQL query to find details of all orders excluding those with ord_date equal to '2016-09-10' and salesman_id
# higher than 5005 or purch_amt greater than 1000.Return ord_no, purch_amt, ord_date, customer_id and salesman_id.  

select * from orders
where not (order_date = '2016-09-10' and salesman_id > 5005 or purch_amt >1000);

------------------------------------------------------------------------------------------------------------------------------
# 7) From the salesman table, write a SQL query to find the details of those salespeople whose commissions range from 0.10 to0.12.
# Return salesman_id, name, city, and commission. 

select * from salesman
where commision between 0.10 and 0.12;

------------------------------------------------------------------------------------------------------------------------------
# 8) From the orders table, write a SQL query to find details of all orders with a purchase amount less than 200 or exclude orders
# with an order date greater than or equal to '2016-02-10' and a customer ID less than 3009. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.

select * from orders
where not (purch_amt < 200 or order_date = '2016-02-10' and customer_id > 3009);

------------------------------------------------------------------------------------------------------------------------------
# 9) From the orders table, write a SQL query to find all orders that meet the following conditions.
# Exclude combinations of order date equal to '2016-08-17' or customer ID greater than 3005 and purchase amount less than 1000.

select * from orders
where not (order_date = '2016-08-17' or customer_id > 3005 and purch_amt < 1000);

------------------------------------------------------------------------------------------------------------------------------
# 10) Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%)
# for those orders that exceed 50% of the target value of 6000.  

select orders.order_no, orders.purch_amt, (100 * purch_amt) / 6000 AS "Achieved %", (100 * (6000 - purch_amt) / 6000) AS "Unachieved %" from orders
where (100 * purch_amt) / 6000 > 50;
