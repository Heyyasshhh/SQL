use br420;
show tables;
desc customers;

-- types of SQL (DDL, DML, DQl, DCL, TCL)


alter table customers modify cid varchar(20);
describe customers;
select * from customers;

insert into customers value('b11','branch',null,null,null,null,null,null,null);

alter table customers change dob dateofbirth date;
alter table customers change fname firstname char(20);

alter table customers rename newcustomers;
desc newcustomers;

rename table newcustomers to custpmers;
rename table custpmers to customers;

select * from customer1;
truncate customer1;