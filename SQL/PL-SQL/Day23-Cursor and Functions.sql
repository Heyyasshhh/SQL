use hr;

-- WQ
delimiter $
create procedure showempcur(inout ans varchar (100))
begin
declare i int default 1;
declare output varchar(100) default '';
declare empcursor cursor for
select first_name from employees where salary>10000;
open empcursor;
while i<=5 do 
fetch empcursor into output;
set ans=concat(ans,output,' ');
set i=i+1;
end while;
close empcursor;
end $

set @ans='';
call showempcur(@ans);
select @ans;



-- ASSIGNMENT QUERY
delimiter $
create procedure empdata()
begin
declare fname varchar(50);
declare lname varchar(50);
declare em varchar(50);
declare sal float;
declare done int default false;
declare cur1 cursor for select first_name from employees;
declare cur2 cursor for select last_name from employees;
declare cur3 cursor for select email from employees;
declare cur4 cursor for select salary from employees;
declare continue handler for not found set done=true;

open cur1;
open cur2;
open cur3;
open cur4;

go:loop
if done then leave go;
end if;
fetch cur1 into fname;
fetch cur2 into lname;
fetch cur3 into em;
fetch cur4 into sal;
select fname, lname, em, sal;
end loop;
close cur1;
close cur2;
close cur3;
close cur4;
end $

call empdata;


-- ASSIGNMENT QUERY #2
delimiter $
create procedure emp_position()
begin
declare fname varchar(50);
declare lname varchar(50);
declare sal float;
declare position varchar(50);
declare done int default false;
declare cur1 cursor for select first_name, last_name, salary from employees;
declare continue handler for not found set done=true;

open cur1;

readloop:loop
fetch cur1 into fname, lname, sal;
if done then leave readloop;
end if;
if sal>10000 then
set position="MANAGER";
elseif sal between 10000 and 20000 then
set position="ASSOCIATE";
elseif sal between 0 and 10000 then
set position="EXECUTIVE";
else 
set position="N/A";
end if;
select fname as "First Name", lname as "Last Name", sal as "Salary", position as 'Position';
end loop;
close cur1;
end $

call emp_position();


-- Functions 
delimiter $
create function calculatediscount(totalamt float, discamt float)
returns float
deterministic
begin
declare discount float;
set discount=totalamt*(discamt/100);
return discount;
end $

select calculatediscount(200,10);




delimiter $
create function salarygrade(sal float)
returns varchar(10)
deterministic
begin
declare grades varchar(10);
if sal>20000 then 
set grades='A';
elseif sal between 10000 and 20000 then
set grades='B';
elseif sal between 0 and 10000 then
set grades='C';
else 
set grades='N/A';
end if;
return grades; 
end $

select first_name, salary, salarygrade(salary) as 'GRADES' from employees;