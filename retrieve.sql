create database retreive;
use retreive;

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
-----------------------------------------------------------------------------------------
# 1. Display All Salespeople
# Write a SQL statement that displays all the information about all salespeople.

select * from salesman;

-----------------------------------------------------------------------------------------
# 2. Display a Custom String
# Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution". 

 select "This is SQL Exercise, Practice and Solution";
 
-----------------------------------------------------------------------------------------
# 3. Display Three Numbers
# Write a SQL query to display three numbers in three columns. 

select 5,6,7;

-----------------------------------------------------------------------------------------
# 4. Sum of Two Numbers
# Write a SQL query to display the sum of two numbers 10 and 15 from the RDBMS server. 

select 10 + 15;

-----------------------------------------------------------------------------------------
# 5. Arithmetic Expression Result
# Write an SQL query to display the result of an arithmetic expression.

select (10 + 15);
 
-----------------------------------------------------------------------------------------
# 6. Specific Columns of Salespeople
# Write a SQL statement to display specific columns such as names and commissions for all salespeople. 

select name,commision from salesman;
 
-----------------------------------------------------------------------------------------
#7. Custom Column Order in Orders
# Write a query to display the columns in a specific order, such as order date, salesman ID, order number, and purchase amount for all orders.  

select order_date, salesman_iD, order_no,purch_amt from orders;

-----------------------------------------------------------------------------------------
# 8. Unique Salespeople IDs
# From the salesman table, write a SQL query to identify the unique salespeople ID. Return salesman_id. 

select distinct(salesman_id) from salesman;

-----------------------------------------------------------------------------------------
# 9. Salespeople in Paris
# From the salesman table, write a SQL query to locate salespeople who live in the city of 'Paris'. Return salesperson's name, city. 

select name,city from salesman 
where city = 'Paris';

-----------------------------------------------------------------------------------------
# 10. Customers with Grade 200
# From the customer table, write a SQL query to find customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id. 

select customer_id, customer_name, city, grade, salesman_id from customer
where grade = 200;

-----------------------------------------------------------------------------------------
# 11. Orders by Salesperson 5001
# From the orders table, write a SQL query to find orders that are delivered by a salesperson with ID. 5001. Return ord_no, ord_date, purch_amt.

select order_no, order_date, purch_amt from orders
where salesman_id = 5001;

-----------------------------------------------------------------------------------------
  