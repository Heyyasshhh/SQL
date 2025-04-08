create database wcompany;
use wcompany;
create table areas
(
area_id int primary key,
area_name varchar(20),
city varchar(20)
);
desc areas;

create table workers
(
worker_id int primary key,
first_name char(20),
last_name char(20),
email varchar(20) unique,
hiredate date,
salary decimal(10,2),
manager_id int,
commission float,
section_id int,
foreign key(manager_id) references workers(worker_id)
);
desc workers;

create table sections
(
section_id int primary key,
section_name varchar(20),
manager_id int,
area_id int,
foreign key(manager_id) references workers(worker_id),
foreign key(area_id) references areas(area_id)
);
desc sections;

alter table workers add constraint foreign key(section_id) references sections(section_id);


use zudio;
select * from emp;

-- group by clause
select gender,count(eid) from emp group by gender;

select gender,sum(round(salary)) as 'Total Salary',count(eid) as 'Count' from emp group by gender;

select city, count(eid) from emp group by city;

select count(eid), email from emp where email like '%example%' group by email;
select * from emp;

select round(avg(salary)) from emp where dob between '2000-01-01' and '2005-1-31';
select dob, avg(round(salary)), count(eid) from emp where dob between '2000-01-01' and '2005-1-31' group by dob;

select city, count(eid), sum(salary) from emp group by city;
select city, count(eid), sum(salary) from emp group by city having sum(salary)>120000;

select city, count(eid), sum(salary) from emp group by city having sum(salary)>120000 and city in('mumbai','pune');
select city, count(eid), sum(salary) from emp where city in('mumbai','pune') group by city having sum(salary)>120000;

select now();
select sysdate();
select curdate();
select current_date();
select current_time();
select curtime();
select current_timestamp();

select day('2005-04-02');
select dayname('2005-04-02');
select dayofmonth('2005-04-02');
select dayofweek('2005-04-02');
select dayofyear('2005-04-02');
select monthname('2005-04-02');
select day(now());
select dayname(now());
select dayofmonth(now());
select dayofweek(now());
select dayofyear(now());
select monthname(now());

select * from emp where day(dob)=15;
