-- PL/SQL Procedures

-- Creating a procedure
delimiter //
create procedure allemp1()
begin 
select * from employees;
end //

-- Calling a Procedure
call allemp1;

-- Deleting a Procedure
drop procedure allemp;
call allemp;

-- Write a procedure to show all employees with 30% hike in salary records
delimiter $
create procedure emp30salary()
begin 
select employee_id, first_name, salary, salary+(salary*0.3) as '30% hike' from employees; 
end $

call emp30salary;


-- Use of Procedure parameters (in, out, inout)
-- Write a procedure to show enetered employee details as per name

delimiter #
create procedure emp_details_given(in empname char(30))
begin
select * from employees where first_name=empname;
end #

call emp_details_given('pooja');
call emp_details_given('steven');

-- Write a procedure to show arithmetic operations by taking number from user.
delimiter $
create procedure calculator(in a int, in b int)
begin
select a+b as Addition;
end $

call calculator(21,20);


-- Out parameter
-- Write a procedure to show arithmetic operations by taking number from user.

delimiter $
create procedure calnew(in a int, in b int, out addition int)
begin 
set addition = a+b;
select addition;
end $

call calnew(10,12,@addition);