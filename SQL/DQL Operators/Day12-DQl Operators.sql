use zudio;
show tables;
select * from emp;

# WQ to find employees who's salaryis greater than 20000
select eid, ename, salary from emp where salary>70000;

#WQ to show employees who are from 'mumbai' city only.
select * from emp where city='mumbai';
select * from emp;
#OR
select * from emp where city in ('mumbai','delhi');

#WQ to show employee who are from 'mumbai' and any other city.
select * from emp where city like '%mumbai%';

#WQ to show employees who are not from gujrat.
select * from emp where city!='GUJRAT';

#WQ to show employees whose dateofbirth is lesser than 1st jan 1990.
select * from emp where dob<'1990-01-01'; 

#WQ to show employees except those are from 'mumbai' city only.
select * from emp where city!='mumbai';
select * from emp where not(city='mumbai');

#WQ to find emp whose salary is greater than 70000 and lesser than 75000.
select * from emp where salary>70000 and salary<75000;

#WQ to find emp whose date of birth is above 1st jan 1993 and less tha 31st dec 1995. 
select * from emp where dob>'1993-1-1' and dob<'1995-12-31';

#WQ to find employees who are from delhi or from gujrat.
select * from emp where city='delhi' or city='gujrat';

#WQ to find employees whose salary is greater than 80000 and who are from mumbai or form pune. 
select * from emp where salary>80000 and (city='mumbai' or city='pune');
select * from emp where salary>80000 and city in ('mumbai','pune');

#WQ to find employees whose salary is less than or equal to 60000 not for male employees.
select * from emp where salary <= 60000 and not(gender='male');
select * from emp where salary <= 60000 and gender!='male';



#WQ to show employees whose salary is from 50000 to 60000.
select * from emp where salary between 50000 and 60000;
-- OR
select * from emp where salary >= 50000 and salary <= 60000;
select * from emp;

#WQ to show employees whose birthdate is from 1st jan 1995 to 31st dec 1995.
select * from emp where dob between '1995-1-1' and '1995-12-31';

#WQ to show employees who are only from mumbai, pune, delhi
select * from emp where city in('mumbai','pune','delhi');

#WQ to show employees whose salary is not 55000, 80000, 48000. 
select * from emp where salary not in(55000,80000,48000);
select * from emp where (salary!=55000) and (salary!=80000) and (salary!=48000);

#WQ to find employees whose name starts with j;
select * from emp where ename like 'j%';

#WQ to find employees whose name ends with 'n';
select * from emp where ename like '%n';

#WQ to find employees whose name ends with 'son';
select * from emp where ename like '%son';

#WQ to find employees who are using gmail account;
select * from emp where email like '%gmail.com';

#WQ to find employees whose name starts and ends with 'n';
select * from emp where ename like 'n%n';

#WQ to find employees whose name having 2nd character as 'o';
select * from emp where ename like '_o%';

#WQ to find employees whose name having 2nd last character as 'o';
select * from emp where ename like '%o_';

#WQ to find employees whose name having 2nd character as 'e' and 5th character as 't';
select * from emp where ename like '_e__t%';

#WQ to find employees whose mobile number starts with 98.
select * from emp where mobile like '98%';

insert into emp(ename,gender,mobile,email,city,dob,salary,country) 
values('','female',897894,null,'delhi',null,50000,'UK');
select * from emp;

insert into emp values(15, 'kishor','male',767678,'ki@yahoo.com','mumbai','1998-03-21',50000,'UK');
select * from emp;

insert into emp values(18, 'siddhu','male',87797,'','pune','1999-04-25',30000,'USA');

#WQ to emp whose email id is not present.
select * from emp where email is null or email='';


#WQ to find emp whose name is not given.
select * from emp where ename is null or ename='';
-- OR
select * from emp where ename is null or ename like '';