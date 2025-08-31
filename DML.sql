create database DML;
create table salesman(salesman_id int primary key,
name varchar(20) not null,
city varchar(20),
commision float);

--------------------------------------------------------------------------------------------
# 1. Insert a Single Record
# Write a SQL query to insert a single record into a table.

insert into salesman(salesman_id,name,city,commision) values 
(5001,'James Hoog','New York',0.15);

--------------------------------------------------------------------------------------------
# 2. Insert Multiple Records
# Write a SQL query to insert multiple records into a table in a single operation.

insert into salesman(salesman_id,name,city,commision) values 
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5003,'Lauson Hen','',0.12),
(5007,'Paul Adam','Rome',0.13);

--------------------------------------------------------------------------------------------
# 3. Update a Single Record
# Write a SQL query to update a single record in a table based on a specific condition.

update salesman set commision = 0.11
where salesman_id = 5007;

--------------------------------------------------------------------------------------------
# 4. Update Multiple Records
# Write a SQL query to update multiple records in a table based on a specific condition.

update salesman set commision = 0.13
where salesman_id = 5006 and 5003;

--------------------------------------------------------------------------------------------
# 5. Delete a Single Records
# Write a SQL query to delete a single record from a table based on a specific condition.

delete from salesman
where salesman_id = 5007 ;

--------------------------------------------------------------------------------------------
# 6. Delete Multiple Records
# Write a SQL query to delete multiple records from a table based on a specific condition.

delete from salesman
where salesman_id = 5007 and 5003; 

--------------------------------------------------------------------------------------------
# 7. Insert with Default Values
# Write a SQL query to insert a record into a table with default values for unspecified columns.

alter table salesman add age int default 25;
update salesman set age = 20 where salesman_id = 5007;

--------------------------------------------------------------------------------------------
