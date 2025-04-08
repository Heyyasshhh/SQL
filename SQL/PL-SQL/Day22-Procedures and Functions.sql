use hr;
call allemp1;

-- write a procedure to show emp salary whose id is entered by user.
delimiter $
create procedure showsalary (in eid int, out sal decimal(10,2))
begin 
select salary from employees where employee_id=eid;
end $

call showsalary(100,@salary);

-- InOut paramerte
-- Count of employees by using inout parameter
delimiter $
create procedure countemp(inout count1 int)
begin 
select count(employee_id) from employees; 
end $

call countemp(@c);

-- show count employees as per given gender

delimiter $
create procedure countsalary(inout c_salary varchar(20))
begin
select count(employee_id) from employees where salary=c_salary;
end $

set @c=25000;
call countsalary(@s)

-- If-else block / Conditional block
-- Write a procedure to check if person is eligible to vote or not

delimiter $
create procedure checkage(in age int)
begin 
if age>=18 then
select 'Eligible to Vote';
else 
select 'Not eligible to Vote';
end if;
end $

call checkage(12);
call checkage(100);

-- Greater number from a,b,c
delimiter $
create procedure greaternum(in a int, in b int, in c int)
begin 
if a>b and a>c then
select 'a is the greater number';
else 
if b>a and b>c then
select 'b is the greater number';
else 
select 'c is the greater number';
end if;
end if;
end $

call greaternum(12,2,3);
call greaternum(2,12,3);
call greaternum(1,56,97);

delimiter $
create procedure greaternumber(in a int, in b int, in c int)
begin 
if a>b and a>c then
select 'a is the greater number';
elseif b>c then
select 'b is the greater number';
else 
select 'c is the greater number';
end if;
end $

call greaternumber(12,2,3);
call greaternumber(2,12,3);
call greaternumber(1,56,97);

-- Write procedure to show employees max salary when it is greater than 30k and 
-- show min salary when it is less than 10k
delimiter $
create procedure minmaxsalary(in sal float)
begin
if sal>30000 then
select * from employees where salary=(select max(salary) from employees);
elseif sal<20000 then
select * from employees where salary=(select min(salary) from employees);
else 
select 'N/A';
end if;
end $

call minmaxsalary(15000);
call minmaxsalary(150000);
call minmaxsalary(-21354);


delimiter $
create procedure get_employee()
begin 
select first_name, last_name, email, d.department_name 
from employees e, departments d
where e.department_id=d.department_id;
end $

call get_employee();


delimiter $
create procedure GetLimitedEmployee(in n int)
begin
select first_name, last_name, salary, hire_date
from employees limit n;
end $

call GetLimitedEmployee(107);
call GetLimitedEmployee(110);
call GetLimitedEmployee(10);

-- Looping Statements
-- 1) While loop
-- Print 1 to 5 numbers

delimiter $
create procedure whiledemo()
begin
declare i int default 1;
declare output varchar(20) default '';
while i<=5 do
set output=concat(output,i,'');
set i=i+1;
end while;
select output;
end $

call whiledemo();

-- 2) repeat or until loop 
delimiter $
create procedure repeatloop()
begin
declare i int;
declare output varchar(20);
set i=1;
set output='';

repeat 
set output=concat(output,i,' ');
set i=i+1;
until i>5 
end repeat;
select output;

end $

call repeatloop();

-- 3) label loop 
delimiter $
create procedure labelloop()
begin 
declare i int default 1;
declare output varchar(20) default '';
go:loop
if i>5 then leave go;
end if;
set output=concat(output,i,' ');
set i=i+1;
iterate go;
end loop;
select output;
end $

call labelloop();


-- WQ
delimiter $
create procedure emp5count()
begin
declare i int default 1;
declare output varchar(20) default '';
select first_name from employees where salary>10000;
while i<=5 do
set output=concat(output,first_name,' ');
set i=i+1;
end while;
select output;
end $

call emp5count();