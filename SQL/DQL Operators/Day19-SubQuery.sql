-- find student name and marks whose marks are greater than whose sid is 2;
select s.sid,name,totalmarks 
from student5 s,marks5 m
where s.sid=m.sid and m.totalmarks>(select totalmarks from marks5 where sid=2);


-- find students name and id whose marks are present and lesser than average of all students.
select m.sid,name,totalmarks 
from student5 s,marks5 m
where s.sid=m.sid and m.totalmarks<(select avg(totalmarks) from marks5);

select * from student5;

-- find students name and id whose marks are present and similar to average of all students.
select m.sid,name,totalmarks 
from student5 s,marks5 m
where s.sid=m.sid and m.totalmarks=(select round(avg(totalmarks)) from marks5);

-- find students whose marks are presents.
select m.sid,name,totalmarks 
from student5 s,marks5 m
where s.sid=m.sid and totalmarks is not null;

-- find students whose record is not present in marks.
select sid,name 
from student5 
where sid not in (select sid from marks5);

select sid,name 
from student5 
where not exists (select sid from marks5 where student5.sid=marks5.sid);

-- find students whose marks are not assigned .
select m.sid,name,totalmarks 
from student5 s,marks5 m
where s.sid=m.sid and totalmarks is null;

-- find students whose marks are not assigned and whose entry not present in marks.
select sid,name 
from student5 
where sid not in (select sid from marks5 where totalmarks is not null);


select sid,name
from student5 
where not exists (select sid from marks5 where student5.sid=marks5.sid and totalmarks is not null);

-- find student details whose marks is within the range of smallest marks and 90.
select min(totalmarks) from marks5;

select s.sid,name,totalmarks
from student5 s, marks5 m
where s.sid=m.sid and m.totalmarks between (select min(totalmarks) from marks5) and 90;


-- hr database
use hr;
show tables;
select * from regions; -- 4 rows 2 cols
select * from countries; -- 25 rows 3 cols
select * from locations; -- 23 rows 6 cols
select * from departments; -- 27 rows 7 cols
select * from jobs; -- 19 rows 4 cols
select * from employees; -- 107 rows 11 cols
select * from job_history; -- 10 rows 5 cols

use hr;

-- Write a query to display the name (first and last ) for those employees who gets more 
-- salary than the employee whose ID is 163.
select salary from employees where employee_id=163;

select employee_id,first_name, last_name,salary 
from employees 
where salary>(select salary from employees where employee_id=163); 

-- Write a query to display all the information of employess whose salary is within the 
-- range of smallest salary and 2500.
select min(salary) from employees;

select * 
from employees
where salary between (select min(salary) from employees) and 2500;

-- Write a query to display the name (first and last ),salary,department id,job id 
-- for those employees who works in the same designation as the employee works whose id is 169.
select first_name, last_name,salary,department_id,job_id from employees where employee_id=169;
select first_name, last_name,salary,department_id,job_id 
from employees
where job_id=(select job_id from employees where employee_id=169);


-- Write a query to display the name (first and last ),salary,department id,job id for 
-- those employees who earn such amount of salary which is the smallest salary of any of the departments.
select first_name, last_name,salary,department_id,job_id 
from employees
where salary=(select min(salary) from employees);

select department_id,count(employee_id),min(salary) from employees group by department_id having department_id=50;


-- Write a query to get the details of employees who are managers.
select * 
from employees;
select * from employees where employee_id in (select manager_id from employees);

-- Write a query to get the details of employees who manage a department.

-- Write a query to display the department id and the total salary for those departments which contains at least one employee

-- Write a query to display the name (first and last ) and department for all employees for any existence of 
-- those employees whose salary is more than 3700. 

-- Write a query to display all the information of those employees who 
-- did not have any job in the past.

-- Write a query to display employee name(firstname,lastname),employee_id and job title for all employees whose location is Toronto

