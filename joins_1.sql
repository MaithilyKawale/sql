create database joins;

use joins;

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

# 1) From the salesman,customer tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.

select * from salesman inner join customer
on salesman.city = customer.city;

SELECT salesman.name, salesman.city,customer.city, customer.customer_name
FROM salesman
INNER JOIN customer
ON salesman.city = customer.city;

select salesman.name, salesman.city,customer.city, customer.customer_name from salesman,customer
where salesman.city = customer.city;

# 2) From the customer,orders tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.

select orders.order_no, orders.purch_amt, customer.city, customer.customer_name from customer inner join orders
on orders.customer_id = customer.customer_id
where orders.purch_amt between 500 and 2000;

select orders.order_no, orders.purch_amt, customer.city, customer.customer_name from customer, orders
where orders.customer_id = customer.customer_id
and orders.purch_amt between 500 and 2000;

# 3) From the customer,salesman tables write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.
 
 select customer.customer_name, customer.city, salesman.salesman_id, salesman.commision from customer inner join salesman
 on customer.salesman_id = salesman.salesman_id;
 
  select customer.customer_name, customer.city, salesman.salesman_id, salesman.commision from customer,salesman
 where customer.salesman_id = salesman.salesman_id;

# 4) From the customer,salesman tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.  

select customer.customer_name, customer.city, salesman.salesman_id, salesman.commision from customer inner join salesman
on customer.salesman_id = salesman.salesman_id
where commision > 0.12;

select customer.customer_name, customer.city, salesman.salesman_id, salesman.commision from customer, salesman
where customer.salesman_id = salesman.salesman_id
and commision > 0.12;

# 5) From the customer,salesman tables write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a
# commission of more than 12% from the company.
# Return Customer Name, customer city, Salesman, salesman city, commission. 

select customer.customer_name, customer.city,salesman.city, salesman.name, salesman.commision from customer inner join salesman
on customer.salesman_id = salesman.salesman_id
where commision > 0.12 and customer.city != salesman.city;
 
select customer.customer_name, customer.city, salesman.name, salesman.commision from customer, salesman
where customer.salesman_id = salesman.salesman_id and commision > 0.12 and customer.city != salesman.city ;

# 6) From the orders,customer,salesman tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission. 

select orders.order_no, orders.order_date, orders.purch_amt, customer.customer_name, customer.grade, salesman.name, salesman.commision
from orders inner join customer
on customer.customer_id = orders.customer_id
inner join salesman
on customer.salesman_id = salesman.salesman_id;

select orders.order_no, orders.order_date, orders.purch_amt, customer.customer_name, customer.grade, salesman.name, salesman.commision
from orders,customer,salesman
where customer.customer_id = orders.customer_id
and customer.salesman_id = salesman.salesman_id;

# 7) Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 

select * from salesman natural join customer natural join orders; 

# 8) From the customer,salesman tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.  

select customer.customer_name, customer.city, customer.grade, salesman.name, salesman.city from customer inner join salesman
on customer.salesman_id = salesman.salesman_id
order by customer_id;

select customer.customer_name, customer.city, customer.grade, salesman.name, salesman.city from customer, salesman
where customer.salesman_id = salesman.salesman_id
order by customer_id;

# 9) From the customer,salesman tables write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade,
# Salesman, salesmancity. The result should be ordered by ascending customer_id. 

select  customer.customer_name, customer.city,customer.grade,salesman.name, salesman.city from customer inner join salesman
on customer.salesman_id = salesman.salesman_id
where customer.grade < 300
order by customer.customer_id;

select  customer.customer_name, customer.city,customer.grade,salesman.name, salesman.city from customer left outer join salesman
on customer.salesman_id = salesman.salesman_id
where customer.grade < 300
order by customer.customer_id;

# 10) Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the
# order date to determine whether any of the existing customers have placed an order or not.

select customer.customer_name, customer.city, orders.order_no, orders.order_date,orders.purch_amt from customer inner join orders
on customer.customer_id = orders.customer_id
order by orders.order_date;

select customer.customer_name, customer.city, orders.order_no, orders.order_date,orders.purch_amt from customer left outer join orders
on customer.customer_id = orders.customer_id
order by orders.order_date;

