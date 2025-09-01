create database MTP;
use MTP;

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
---------------------------------------------------------------------------------------------------------------------------------
# 1) From the salesman,customer tables, write a SQL query to find the salespeople and customers who live in the same city.
# Return customer name, salesperson name and salesperson city.

select customer.customer_name, salesman.name, salesman.city from salesman,customer
where customer.city = salesman.city;

---------------------------------------------------------------------------------------------------------------------------------
# 2) From the salesman,customer tables, write a SQL query to locate all the customers and the salesperson who works for them.
# Return customer name, and salesperson name.  

select customer.customer_name, salesman.name from customer,salesman
where customer.salesman_id = salesman.salesman_id; 

---------------------------------------------------------------------------------------------------------------------------------
# 3) From the salesman,customer,orders write a SQL query to find those salespeople who generated orders for their customers but are not located in the same city.
# Return ord_no, cust_name, customer_id (orders table), salesman_id (orders table).  

select orders.order_no, customer.customer_name, orders.customer_id, orders.salesman_id from salesman,customer,orders
where customer.city != salesman.city
and orders.salesman_id= salesman.salesman_id
and orders.customer_id = customer.customer_id;

---------------------------------------------------------------------------------------------------------------------------------
# 4) From the customer,orders tables, write a SQL query to locate the orders made by customers. Return order number, customer name. 

select orders.order_no , customer.customer_name from orders,customer
where orders.customer_id = customer.customer_id;

---------------------------------------------------------------------------------------------------------------------------------
# 5) From the customer,orders tables, write a SQL query to find those customers where each customer has a grade and is served by a salesperson who belongs to a city.
# Return cust_name as "Customer", grade as "Grade".

SELECT customer.customer_name AS "Customer" , customer.grade AS "Grade"
FROM customer
JOIN orders
     ON orders.customer_id = customer.customer_id
JOIN salesman 
     ON orders.salesman_id = salesman.salesman_id
WHERE customer.grade IS NOT NULL
AND salesman.city IS NOT NULL;

---------------------------------------------------------------------------------------------------------------------------------
# 6) From the salesman,customer table, write a SQL query to find those customers who are served by a salesperson and the salesperson earns commission in the range of 12% to 14% (Begin and end values are included.).
# Return cust_name AS "Customer", city AS "City".

select customer.customer_name as customer, customer.city as city, salesman.name, salesman.commision from customer,salesman
where customer.salesman_id = salesman.salesman_id
and salesman.commision between 0.12 and 0.14;

---------------------------------------------------------------------------------------------------------------------------------
# 7) From the salesman,customer,orders tables, write a SQL query to find all orders executed by the salesperson and ordered by the customer whose grade is greater than or equal to 200.
# Compute purch_amt*commission as “Commission”. Return customer name, commission as “Commission%” and Commission.

select order_no, customer_name, commision AS "Commission%", purch_amt * commision AS "Commission" from orders,salesman,customer
where orders.salesman_id= salesman.salesman_id
and orders.customer_id = customer.customer_id
and customer.grade >= 200; 

---------------------------------------------------------------------------------------------------------------------------------
# 8) From the customer, orders table, write a SQL query to find those customers who placed orders on October 5, 2016.
# Return customer_id, cust_name, city, grade, salesman_id, ord_no, purch_amt, ord_date, customer_id and salesman_id.

select customer.customer_id, customer.customer_name, customer.city, customer.grade, customer.salesman_id, orders.order_no, orders.purch_amt, orders.order_date, 
orders.customer_id,orders.salesman_id from customer,orders
where customer.customer_id = orders.customer_id
and orders.order_date =  '2016-10-05';
