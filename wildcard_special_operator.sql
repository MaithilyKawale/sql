create database wildcard;
use wildcard;

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
-----------------------------------------------------------------------------------------------------------------------------------------
# 1) From the salesman table, write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City. 
# Return salesman_id, name, city, commission.

select salesman_id, name, city , commision from salesman
where city = "Paris" or "Rome";

-----------------------------------------------------------------------------------------------------------------------------------------
# 2) From the salesman table, write a SQL query to find the details of the salespeople who come from either 'Paris' or 'Rome'. 
# Return salesman_id, name, city, commission. 

select salesman_id, name, city , commision from salesman
where city = "Paris" or "Rome";

-----------------------------------------------------------------------------------------------------------------------------------------
# 3) From the salesman table, write a SQL query to find the details of those salespeople who live in cities other than Paris and Rome. 
# Return salesman_id, name, city, commission.  

select salesman_id, name, city , commision from salesman
where city not in ("Paris","Rome");

-----------------------------------------------------------------------------------------------------------------------------------------
# 4) From the customer table, write a SQL query to retrieve the details of all customers whose ID belongs to any of the values 3007, 3008 or 3009.
# Return customer_id, cust_name, city, grade, and salesman_id.  

select  * from customer 
where customer_id = 3007 or 3008 or 3009;

-----------------------------------------------------------------------------------------------------------------------------------------
# 5) From the salesman table, write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 (begin and end values are included).
# Return salesman_id, name, city, and commission.  

select * from salesman
where commision between 0.12 and 0.14;

-----------------------------------------------------------------------------------------------------------------------------------------
# 6) From the order table, write a SQL query to select orders between 500 and 4000 (begin and end values are included). Exclude orders amount 948.50 and 1983.43.
# Return ord_no, purch_amt, ord_date, customer_id, and salesman_id. 

select * from orders
where purch_amt between 500 and 4000 
and not purch_amt in (948.50 , 1983.43);

-----------------------------------------------------------------------------------------------------------------------------------------
# 7) From the salesman table, write a SQL query to retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' (not inclusive). 
# Return salesman_id, name, city, commission. 

SELECT salesman_id, name, city, commision
FROM salesman
WHERE name >= 'B' AND name < 'L';

-----------------------------------------------------------------------------------------------------------------------------------------
# 8) From the salesman table, write a SQL query to find the details of all salespeople except those whose names begin with any letter between 'A' and 'M'. 
# Return salesman_id, name, city, commission.  

select * from salesman
where name not between 'A' and 'M';

-----------------------------------------------------------------------------------------------------------------------------------------
# 9) From the customer table, write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'. 
# Return customer_id, cust_name, city, grade, salesman_id.. 

select * from customer
where customer_name like 'B%';

-----------------------------------------------------------------------------------------------------------------------------------------
# 10) From the customer table, write a SQL query to find the details of the customers whose names end with the letter 'n'. 
# Return customer_id, cust_name, city, grade, salesman_id.

select * from customer
where customer_name like '%n';

-----------------------------------------------------------------------------------------------------------------------------------------
# 11) From the salesman table, write a SQL query to find the details of those salespeople whose names begin with ‘N’ 
# and the fourth character is 'l'. Rests may be any character. Return salesman_id, name, city, commission.

select * from salesman
where name like 'N_I%';
