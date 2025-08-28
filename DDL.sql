create database ddl;
-------------------------------------------------------------------------------------
# 1. Create a Table
#Write a SQL query to create a table with specific columns and constraints.

create table student1(student_id int primary key,
name varchar(20) not null,
city varchar(20),
course varchar(20)) ;
-------------------------------------------------------------------------------------
#2. Add a New Column
#Write a SQL query to add a new column to an existing table.

alter table student1 add department varchar(20);
alter table student1 add percentage int not null;

-------------------------------------------------------------------------------------
#3. Modify a Column's Data Type
#Write a SQL query to change the data type of an existing column in a table.

alter table student1 modify percentage float not null;
-------------------------------------------------------------------------------------
#4. Drop a Column
#Write a SQL query to remove a column from an existing table.

alter table student1
drop column course;

-------------------------------------------------------------------------------------
#5. Add a Unique Constraint
#Write a SQL query to add a unique constraint to a column in an existing table.

alter table student1 modify department varchar (20) unique;

-------------------------------------------------------------------------------------
#6. Add a Foreign Key
#Write a SQL query to create a foreign key relationship between two tables.

CREATE TABLE scholarship (
    phone_no INT,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES student1(student_id)
);

-------------------------------------------------------------------------------------
#7. Truncate a Table
#Write a SQL query to remove all rows from a table while retaining its structure.

truncate table scholarship;

-------------------------------------------------------------------------------------
#8. Drop a Table
#Write a SQL query to permanently delete a table and all its data.

drop table scholarship;

-------------------------------------------------------------------------------------
#9. Create an Index
#Write a SQL query to create an index on a column to improve query performance.

create index stud on student1(name);

-------------------------------------------------------------------------------------
#10. Drop an Index
#Write a SQL query to remove an index from a table.

drop index stud on student1;

-------------------------------------------------------------------------------------
#11. Rename a Table
#Write a SQL query to rename an existing table.

rename table student1 to student2;

-------------------------------------------------------------------------------------
#12. Add a Default Value
#Write a SQL query to assign a default value to a column in an existing table.

alter table student2 add age int default 20;

-------------------------------------------------------------------------------------
#13. Remove a Constraint
#Write a SQL query to remove a constraint from an existing table.

alter table student2 modify age int;

-------------------------------------------------------------------------------------
#14. Create a Schema
#Write a SQL query to create a new schema in the database.SQL database hosting

create schema student;
-------------------------------------------------------------------------------------