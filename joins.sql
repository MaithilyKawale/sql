create database sample;
use sample;

create table table1(id int primary key,
value varchar(20));

create table table2(id int primary key,
value varchar(20));

insert into table1(id,value) values (1,'Fox'),
(2,'Cop'),
(3,'Taxi'),
(6,'Washington'),
(7,'Dell'),
(5,'Arizona'),
(4,'Lincoln'),
(10,'Lucent');

select * from table1;

insert into table2(id,value) values (1,'Trot'),
(2,'Car'),
(3,'Cab'),
(6,'Monument'),
(7,'Pc'),
(8,'Microsoft'),
(9,'Apple'),
(11,'Scotch');

select * from table2;

select * from table1
inner join table2
on table1.id=table2.id;

select * from table1
left outer join table2
on table1.id=table2.id;

select * from table1
right outer join table2
on table1.id=table2.id;

select * from table1
cross join table2;

select * from table1
left join table2
on table1.id=table2.id
where table2.id is null;

select * from table1
right join table2
on table1.id=table2.id
where table1.id is null;

