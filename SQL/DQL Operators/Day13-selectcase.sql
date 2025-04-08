use zudio;
select * from emp;

#employee having highest salary
select * from emp order by salary desc limit 1;

#employee having lowest salary
select * from emp order by salary limit 1;

-- limit offset used to skip rows
#employee having second highest salary 
select * from emp order by salary desc limit 1,1;

#to show second last record of emp
select * from emp order by eid desc limit 1,1;

#to show the sixth record
select * from emp limit 5,1;

#WQ to show remark based on salary ranges as salary<20000 'grade-III', and 
-- when salary <50000 and salary >=20000 then grade-II and 
-- when salary<=80000 and salary>=50000 then 'garde-I' and 
-- those salary are not matched then show 'NA' for each emp and 
-- showw only eid,ename,salary and remark.

select eid,ename,salary,
case
when salary<20000 then 'Grade-III'
when salary<50000 and salary>=20000 then 'Grade-II'
when salary<=80000 and salary>=50000 then 'Grade-I'
else 'NA'
end as 'Salary Remark'
from emp;

create view salaryremark
as
select eid,ename,salary,
case
when salary<20000 then 'Grade-III'
when salary<50000 and salary>=20000 then 'Grade-II'
when salary<=80000 and salary>=50000 then 'Grade-I'
else 'NA'
end as 'Salary Remark'
from emp;

select * from salaryremark;

-- types of functions
-- Built in functions(system defined) (math, string, date)
-- Math 1) scalar 2) Aggregate

-- 1) scalar funtions (sqrt, power, pow, round, floor, ceil, abs, mod)
select sqrt(144);
select pow(10,3);
select round(934.58);#935
select floor(934.58);#934
select ceil(934.003);#934
select abs(-52); -- removes the negative sign 
select mod(5,2);

select eid, ename, round(salary) from emp;  

select eid, ename, salary from emp where round(salary)=500000;


-- 2) Aggregate Fuction (Group Function)
-- min(), max(), count(), sum(), avg()

select count(*) from emp;
select count(ename) from emp;
select count(eid) from emp where salary>60000;
select count(distinct(city)) as 'count' from emp; 

select min(salary) from emp;
select * from emp where salary=(select min(salary) from emp);
select max(salary) from emp;
select * from emp where salary=(select max(salary) from emp);
select avg(salary) from emp;
select sum(salary) from emp;
