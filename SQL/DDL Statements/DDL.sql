-- single and multi-line comment sectction 
# single and multi-line comment section

-- SQl features
-- 1) used to manage database (ecommerce, collegedb) inside DBMS(mysql, oracle, mssql)
-- 2) non case sesitive langauge
-- 3) Follows some rules (sntax)

-- Types of SQL
-- 1) DDL(Data Definition language)- create, alter, drop, rename, truncate (table, columns, database) 
-- 2) DML (Data Manipulatin Language)- insert, update, delete (rows)
-- 3) DQL (Data Query Language)- select
-- 4) DCL (Data Control Language)- grant, revoke
-- 5) TCL (Transaction Control Language)-commit, rollback, savepoint

-- DDL Commands --
#create (used to create table and database)
#syntax: create database db-name; 
#e.g:
create database myntra;
-- create database m1,m2;  #error
show databases;
select database();
use myntra;
select database();

create schema myntra1;
show databases;
use myntra1;
select database();


#drop (used to delete databases or schemas)
#syntax: drop database db_name or drop schema schema_name
#e.g:
drop database myntra1;
show databases;

drop schema myntra;
show databases;

select database();

create database br420;
use br420;
select database();
show tables;

#creating a table 
-- create table tb_name(
-- colname1 datatype constraint(optional),
-- colname2 datatype constraint(optional),
-- colname3 datatype constraint(optional),
-- colname4 datatype constraint(optional)
-- )

-- SQL Datatypes
-- Numbers (int, bigint, float, decimal(8,2))
-- String (char(size), varchar(size))
-- Date(date(yyyy-mm-dd),datetime(yyyy-mm-dd h-m-s) 
-- Boolean (bool(true,false))
-- Complex (blob(images))

-- Table/Entity: Customers
-- Attributes: cid(int), fname char(10), lname char(10), gender char(10), dob(date), email varchar(10), mobile int, city char(10), pincode int


create table customers(
cid int,
fname char(10),
lname char(10),
gender char(10),
dob date,
email varchar(30),
mobile int,
city char(10),
pincode int
);

show tables;
describe customers;

select * from customers;

-- login (username varchar(20), Password varchar(20))
create table login(
username varchar(20),
password varchar(20)
);
show tables;
desc login;
select * from login;

-- insert (DML)
insert into login values();
select * from login;
insert into login values("pooja", "@123");
select * from login;
