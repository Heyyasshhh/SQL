use hr;
select * from jobs;
-- Write a query to get the details of employees who are managers.
select * 
from employees;
select * from employees where employee_id in (select manager_id from employees);

-- Write a query to get the details of employees who manage a department.
select * from employees where employee_id in (select manager_id from employees);

-- Write a query to display the department id and the total salary for those departments which contains at least one employee
select department_id, sum(salary) from employees where department_id is not null group by department_id having count(employee_id)>0;

select e.department_id, count(e.employee_id) from employees e group by e.department_id;

-- Write a query to display the name (first and last ) and department for all employees for any existence of 
-- those employees whose salary is more than 3700. 
select first_name, last_name, department_name
from employees e join departments d 
where e.department_id=d.department_id and salary>3700; 

-- Write a query to display all the information of those employees who 
-- did not have any job in the past.
select * from employees where employee_id not in(select employee_id from job_history);
select * from employees e where not exists(select employee_id from job_history j where e.employee_id=j.employee_id);


-- Write a query to display employee name(firstname,lastname),employee_id and job title for all employees whose location is Toronto
select * from locations;
select first_name, last_name, employee_id, job_title 
from employees e, jobs j, departments d, locations l
where e.job_id=j.job_id 
and e.department_id=d.department_id
and d.location_id=l.location_id
and l.city="Toronto";


-- Sub Query with create, update, insert and delete

-- WQ to create a new table as emp from employees.
create table emp as select * from employees;
select * from emp;

-- TCL
start transaction;
delete from emp;
select * from emp;
rollback;
commit;
delete from emp;

-- WQ to insert into emp where employees whose salary is greater than 10000 of employee table.
insert into emp select * from employees where salary>10000;
select * from emp;

-- WQ to update job id as 'Managers' for emp who are having job_id as MAN or MGR compare from employees table
update emp set job_id='Managers' where job_id in(select job_id from employees where job_id like'%MAN%' or job_id like '%MGR%');
select * from emp;
delete from emp;

-- WQ to delete into employee table who are having salary between 11k to 14k but compare from employees table
delete from emp where salary in(select salary from employees where salary between 11000 and 14000);