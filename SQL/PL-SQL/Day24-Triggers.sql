use hr;
create table table1 (id int, name char(20));
create table table2 (id int, name char(20));

-- write a trigger for insert same values into table2 when insert happens on table1
delimiter $
create trigger trInsertTable1
after 
insert on table1
for each row
begin
insert into table2(id, name) value(new.id, new.name);
end $

insert into table1 values(101,"komal");
select * from table1;
select * from table2;

insert into table1 values(102,"pooja");
insert into table1 values(103,"raj");
insert into table1 values(104,"Roshan");
insert into table1 values(105,"Rahul");

select * from table1;
select * from table2;

-- Write a trigger for table1 whenever any of the record deleted then it gets added into table3 
-- which has id,name,tableaction,logdatetime and username
create table table3(id int, name char(20),tableaction varchar(20),logdatetime datetime, username varchar(30));
select * from table3;
select user(); 

delimiter $
create trigger trDeleteTable1
before  
delete on table1
for each row 
begin
insert into table3 values(old.id,old.name,'Delete',now(),user());
end$

delete from table1 where id=101;
select * from table1;
select * from table3;
select * from table2;

-- update trigger on Table1
create table table4(username varchar(20), description varchar(20), tableaction varchar(20), logdatetime datetime);

delimiter $
create trigger trUpdateTable1
after
update on table1
for each row
begin
insert into table4 values(user(),concat('update table1 record for ',old.id,' old name: ',old.name,'new name: ',new.name),'Update',now());
end$

update table1 set name='keerti' where id=102;
alter table table4 modify description varchar(200);

select * from table1; 
select * from table4;


-- trigger for employees when insert and delete happens and show count into empcount
create table empcount(ecount int not null);
select * from empcount;
insert into empcount value(0);

delimiter $
create trigger trInsertemp
after 
insert on employees
for each row 
begin
update empcount set ecount=(select count(employee_id) from employees);
end $

insert into employees values (900,'keerti','kk','k@gmail.com',334,now(),'AD_VP',50000,null,101,60);
select * from empcount;

delimiter $
create trigger trDeleteEmp
after 
delete on employees
for each row 
begin
update empcount set ecount=(select count(employee_id) from employees);
end $

delete from employees where employee_id=900;

-- DCL 
create user 'Ash'@'localhost' identified by 'q@123456'
select user from mysql.user;
select user();

show grants for 'root'@'localhost';
show grants for 'Ash'@'localhost';