show databases;
use br420;
select database();
select * from login;

create table employees(
EmployeeID int,
Name varchar(255),
Role varchar(50),
HireDate date,
Salary decimal(10,2)
);
desc employees;

create table orderitems(
OrderItemId int,
OrderId int,
MenuItemId int,
Quantity int,
Price decimal(10,2)
);
desc orderitems;

create table reservations(
ReservationID int,
CustomerId int,
ReservationDate date,
NumberOfGuests int,
TableNumber int
);
desc reservations;

create table actors(
ActorId int,
Name varchar(255),
BirthYear int
);
desc actors;

create table orders(
OrderId int,
CustomerId int,
OrderDate datetime,
TotalAmount decimal(10,2)
);
desc orders;

create table menuitems(
MenuItemId int,
Name varchar(255),
description text,
Price decimal(10,2),
Category varchar(50)
);
desc menuitems;

show tables;

select * from customers;

insert into customers(cid,fname,city,pincode,lname,gender,dob,email,mobile)
values(101,'Pooja','mumbai',4001,'shah','femle','2000-09-11','p@gmail.com',1215487984);

select * from customers;

insert into customers
values(102,'Komal','More','female','2001-08-12',null,null,null,null);

select * from customers;

insert into customers(cid,fname,city) value (103,'raj','pune');
select * from customers;

insert into customers (cid,fname) values (104,'Geeta');

insert into customers values (105,'joe','goldberg',null,null,null,null,null,null);

create table customer1 as select * from customers;
create table customer2 as select * from customer1;
select * from customer1;
select * from customer2;

drop table customer2;
desc customer2;


-- DDL - create, alter, drop, alter, rename, truncate;
-- alter used to modify,change,rename,add,drop (works only on table and column)

-- alter add(used to add one or more columns/fields at a time)
-- syntax: alter table tb_name add col_name datatype first/after;
-- WQ to add aadhar in customers table.
desc customers;
alter table customers add aadhar bigint;
select * from customers;

-- WQ to add aadhar in customers table.
alter table customers add (address1 varchar(100), address2 varchar(100));
desc customers;

-- WQ to add PAN at first position in customers table.
alter table customers add pannumber varchar(10) first;

-- WQ to add age after DOB column in customers table.
alter table customers add age int after dob;
desc customers;

-- alter drop remove coumn with values (one at a time)
-- alter table tb_name drop col_name 
-- WQ to drop age from customers table
alter table customers drop age;
describe customers;

-- -- WQ to drop address1 and address2 from customers table
alter table customers drop address1;
alter table customers drop address2;
alter table customers drop aadhar;
alter table customers drop pannumber;

-- alter modify (used to change data type)
-- syntax alter table tb_name modify col_name new_data_type

-- WQ to change data type of mobile to set BIGINT in customes table.
describe customers;
alter table customers modify mobile bigint;
select * from customers;
