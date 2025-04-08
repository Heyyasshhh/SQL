-- DQL (data query language)
-- select * from customers; 

-- Operators- It is a symbol which is used to perform some operations on one or more operands. 
-- 1) arithmetic - +

create database zudio;
use zudio;

create table customers
(
cid varchar(50) primary key,
firstname char(50),
lname char(50),
gender enum ('male','female','other'),
dateofbirth date,
email varchar(30),
mobile bigint,
adress varchar(500),
country varchar(20)
);

insert into customers values(1,'raj','yadav','male','2003-4-23','r@gmail.com',7654875673,'Mumbai','INDIA'), 
(3,'arun','gupta','male','2001-4-20','a@gmail.com',9875632783,'Indore','India');
select * from customers;

create table products
(
pid int,
pname varchar(30),
category varchar(30),
modelnum int,
price float,
qty int,
manfdate date
);

insert into products value(103,'zohoshoe','shoes',50001,400,15,'2023-1-15');

create table orders
(
oid int,
cid int,
pid int,
orderdatetime datetime,
qty int,
totalprice decimal(8,2)
);

create table emp
(
eid int primary key auto_increment,
ename char(20) not null,
gender enum('male','female','other') not null,
mobile bigint not null,
email varchar(20) unique,
city set('mumbai','delhi','pune','gujrat','banglore') not null,
dob date,
salary decimal(8,2) check (salary>0),
country char(20) default 'INDIA'
);

desc emp;
insert into emp(ename,gender,mobile,email,city,dob,salary)
values('keerti','female',454546,'k@gmail.com','mumbai,delhi','2001-07-9',500000.34);

INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('John Doe', 'male', 9876543210, 'j@example.com', 'mumbai', '1990-05-15', 55000.00);

-- Insert 2nd employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Jane Smith', 'female', 9876543211, 'ja@example.com', 'delhi', '1985-08-22', 60000.50);

-- Insert 3rd employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Alex Johnson', 'other', 9876543212, 'a@example.com', 'pune', '1992-11-03', 48000.75);

-- Insert 4th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Michael Brown', 'male', 9876543213, 'm@example.com', 'gujrat', '1988-02-17', 52000.00);

-- Insert 5th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Emily Davis', 'female', 9876543214, 'em@example.com', 'banglore', '1995-06-30', 75000.25);

-- Insert 6th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Sophie Wilson', 'female', 9876543215, 'so@example.com', 'mumbai', '1991-04-12', 67000.00);

-- Insert 7th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('David Lee', 'male', 9876543216, 'da@example.com', 'delhi', '1989-09-29', 54000.25);

-- Insert 8th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Laura Martinez', 'female', 9876543217, 'la@example.com', 'banglore', '1993-01-15', 72000.50);

-- Insert 9th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Chris Evans', 'male', 9876543218, 'ch@example.com', 'pune', '1986-12-05', 58000.75);

-- Insert 10th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Natalie Green', 'female', 9876543219, 'na@example.com', 'gujrat', '1994-07-20', 64000.00);

select * from emp;
truncate table emp;

#Wq to show salary of employee by adding 2000 in every employee salary.
select eid,ename,salary as'old salary',salary+2000 as 'new salary' from emp;
select * from emp;

#Wq to show salary with 20% hike and 50% deduction in every employee salary.
select eid,ename,salary as'old salary',salary+(salary*20/100) as 'Salary with 20% hike', salary-(salary*0.5) as 'Salary with 50% deduction' from emp;

#Wq to show salary with 50% hike in every employee salary.



