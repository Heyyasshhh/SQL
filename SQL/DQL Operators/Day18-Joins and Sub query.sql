use exampledb;
show tables;
select * from customers;
select * from orders;

-- Cross Join (cartesian product)
select * from customers cross join orders;
select * from customers, orders;

-- Self Join 
#WQ to find customers whose address is same.
select c1.cid,c1.cname,c2.address from customers c1, customers c2 where c1.address=c2.address and c1.cid!=c2.cid;

#WQ to find customers whose dob is same.
select c1.cid,c1.cname,c2.dob from customers c1, customers c2 where c1.dob=c2.dob and c1.cid!=c2.cid;

#WQ to find customers who has placed an order
select c.cid, c.cname, o.oid, o.orderdate from customers c, orders o where c.cid in(select o.cid from orders);
select c.cid, c.cname, o.oid, o.orderdate from customers c, orders o where c.cid=o.cid and c.cid in(select cid from orders);

#WQ to find customers who has not placed an order
select * from customers c where c.cid not in (select o.cid from orders o where c.cid=o.cid);
select * from customers c where not exists(select cid from orders o where c.cid=o.cid);

select c.cid, cname, oid, o.orderdate, qty from customers c, orders o where qty>2 and c.cid in (select o.cid from orders);

select c.cid, cname, oid, orderdate, qty 
from customers c, orders o 
where c.cid=o.cid and qty in (select o.cid from orders where o.cid!=c.cid);

select * from customers c, orders o where orderdate between '2023-05-1' and '2023-06-30' and c.cid in (select o.cid from orders);
select * from orders;



-- NEW TABLE
create table student5
(
sid int primary key,
name char(20)
);

insert into student5 values(1,'adi');
insert into student5 values(2,'ravi');
insert into student5 values(3,'suraj');
insert into student5 values(4,'pooja');
insert into student5 values(5,'shubham');
insert into student5 values(6,'vinay');

select * from student5;

create table marks5
(
sid int,
totalmarks int,
foreign key(sid) references student5(sid)
);

insert into marks5 values(1,95);
insert into marks5 values(2,84);
insert into marks5 values(3,74);
insert into marks5 values(4,81);
insert into marks5 values(5,null);

select * from student5;
select * from marks5;

-- find student name and marks whose marks are greater than whose sid is 2;
select s.sid,name,totalmarks 
from student5 s,marks5 m
where s.sid=m.sid and m.totalmarks>(select totalmarks from marks5 where sid=2);


-- find students name and id whose marks are present and lesser than average of all students.
select m.sid,name,totalmarks 
from student5 s,marks5 m
where s.sid=m.sid;

-- find students name and id whose marks are present and similar to average of all students.
select m.sid,s.name,totalmarks
from student5 s, marks5 m
where s.sid=m.sid;

-- find students whose marks are presents.

-- find students whose record is not present in marks.

-- find students whose marks are not assigned .

-- find student details whose marks is within the range of smallest marks and 90.



