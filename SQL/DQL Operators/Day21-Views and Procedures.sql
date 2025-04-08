use hr;
show tables;
select * from emp_details_view;

create view new_emp_view as select employee_id, first_name, salary from employees;
select * from new_emp_view;
insert into employees values(900,'Keerti','Pal','k@gmail.com',23432,now(),'MK_MAN',60000,null,null,null);
select * from employees;
select * from emp_details_view;
select * from new_emp_view;

create view new_emp_view1
as select employee_id, first_name, last_name, salary, salary*0.2 as '20% hike salary'
from employees;

select * from new_emp_view1;

insert into employees values(800,'Neha','Pal','n@gmail.com',23432,current_date(),'MK_MAN',60000,null,null,null);
select * from employees;
select * from new_emp_view;
select * from new_emp_view1;

delete from employees where employee_id=800;
select * from new_emp_view;
select * from new_emp_view1;

delete from new_emp_view1 where employee_id=900;
select * from new_emp_view;
select * from new_emp_view1;

