use zudio;

select * from emp;
select trim("             hello     world         ") as 'Answer';
select ltrim("             hello     world                                ") as Answer;
select rtrim("             hello     world                                ") as Answer;

-- returns the string from the given number of place
select substr("welcome",4);
select substring('welcome',5);
select substr('Vegetables',5,3); -- select substr ('string1', start point, count of literals)
select substr('Welcome',-1); -- negative value returns the substring from last 
select substr('vegetables',-6,6);
select insert('vegetables',4,7,'ies'); -- select insert ('str1',position to start insertion,size of removal from str1,'newstr to be inserted')

select * from products,customers;

use exampledb;
select * from customers;
select * from orders;

-- Inner Join
select c.cid,c.cname,o.oid,o.orderdate
from customers c inner join orders o
on c.cid=o.cid;
-- OR
select customers.cid,customers.cname,orders.oid,orders.orderdate 
from customers inner join orders 
on customers.cid=orders.cid;
-- OR
select c.cid,c.cname,o.oid,o.orderdate
from customers c join orders o
on c.cid=o.cid;
-- OR
select c.cid,c.cname,o.oid,o.orderdate
from customers c inner join orders o
where c.cid=o.cid;
-- OR
select c.cid,c.cname,o.oid,o.orderdate
from customers c inner join orders o
using(cid);

-- OR 

-- Natural Join
select c.cid,c.cname,o.oid,o.orderdate
from customers c natural join orders o;
-- OR
select customers.cid,customers.cname,orders.oid,orders.orderdate 
from customers natural join orders;

-- OR

-- Equi join
select c.cid,c.cname,o.oid,o.orderdate
from customers c,orders o
where c.cid=o.cid;
-- OR
select customers.cid,customers.cname,orders.oid,orders.orderdate 
from customers,orders 
where customers.cid=orders.cid;


-- Non-Equi join
select c.cid,c.cname,o.oid,o.orderdate
from customers c,orders o
where c.cid=o.cid and o.qty>3;
-- OR
select customers.cid,customers.cname,orders.oid,orders.orderdate 
from customers,orders 
where customers.cid=orders.cid and orders.qty>3;


-- Outer join 
-- left outer join
select c.cid,cname,oid,qty from customers c left join orders o on c.cid=o.cid; 
-- OR
select c.cid,cname,oid,qty from customers c left outer join orders o on c.cid=o.cid;

select * from orders;
select c.cid,cname,oid,qty from customers c right join orders o on c.cid=o.cid;  
-- OR
select c.cid,cname,oid,qty from customers c right outer join orders o on c.cid=o.cid;

-- Full Outer join
select * from customers c left outer join orders o on c.cid=o.cid union
select * from customers c right outer join orders o on c.cid=o.cid;