use zudio;
select * from emp;
select monthname(now());

select * from emp where monthname(dob)='April';
select * from emp where month(dob)=4;

select eid,ename,dob, year(now())-year(dob) as 'Age' from emp;

create view empage as select eid,ename,dob, year(now())-year(dob) as 'Age' from emp;
select * from empage;

select eid, ename, dob from emp where year(now())-year(dob)=24;
select eid,ename,dob, year(now())-year(dob) as 'Age' from emp where year(now())-year(dob)=24;

select week(now()); -- 7
select weekofyear(now()); -- 8


select date_add('2020-03-21',interval 10 day);
select adddate(now(),10);
select date_add(now(), interval 10 day);

select date_add('2020-03-21',interval 10 month);
select date_add(now(), interval 10 month);

select date_add('2020-03-21',interval 10 year);
select date_add(now(), interval 10 year);


select date_sub('2020-03-21',interval 10 day);
select date_sub(now(), interval 10 day);

select date_sub('2020-03-21',interval 10 month);
select date_sub(now(), interval 10 month);

select date_sub('2020-03-21',interval 10 year);
select date_sub(now(), interval 10 year);

select * from emp where month(dob)=month(now())-1;

select * from emp where week(dob)=week(now())+4;
select * from emp where weekofyear(dob)=weekofyear(now())+4;

select * from emp where month(dob)=week(now())+1;

select eid,ename,dob,datediff(now(),dob) as 'Age(Days)' from emp;

select date_format('2020-03-21', '%d %m %y');
select date_format('2020-03-21', '%d-%m-%y');
select date_format('2020-03-21', '%d/%m/%y');
select date_format('2020-03-21', '%D %M %Y');
select eid,ename,date_format(dob,'%D %M %Y') as 'Date Of Birth' from emp;
select eid, ename, date_format(dob, '%d-%m-%y') as 'Date Of Birth' from emp;
select eid, ename, date_format(dob, '%d-%m-%Y') as 'Date Of Birth' from emp;

select date_format(now(), '%d-%m-%Y %h:%i:%s');

select length("Hello World");
select char_length(1546876);

select eid, ename, salary, length(round(salary)) as "Digits of salary" from emp;

select eid, ename, email from emp where length(email)<10;
select * from emp;
 
select concat('Hello', ' World');
select concat(eid,') ',ename) from emp;

select reverse('Hello World');

select eid, ename, city,
case 
when city like '%mumbai%' then replace(lower(city),'mumbai','MUM')
when city like '%pune%' then replace(lower(city),'pune','PN')
when city like '%delhi%' then replace(lower(city),'delhi','DH')
when city like '%gujrat%' then replace(lower(city),'gujrat','GJ')
when city like '%banglore%' then replace(lower(city),'banglore','BA')
else city
end as 'CITY CODE'
from emp;

create view citycode as 
select eid, ename, city,
case 
when city like '%mumbai%' then replace(lower(city),'mumbai','MUM')
when city like '%pune%' then replace(lower(city),'pune','PN')
when city like '%delhi%' then replace(lower(city),'delhi','DH')
when city like '%gujrat%' then replace(lower(city),'gujrat','GJ')
when city like '%banglore%' then replace(lower(city),'banglore','BA')
else city
end as 'CITY CODE'
from emp;

select * from citycode;

select left('Hello World',6);
select right('Hello World',6);

select lpad('Hello',10,'%');
select lpad('World',10,'Hello ');
select lpad('World',11,'Hello ');
select lpad('World',3,'Hello ');

select rpad('Hello',10,'%');