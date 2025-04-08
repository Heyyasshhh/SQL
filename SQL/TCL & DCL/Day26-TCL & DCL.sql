use hr;

-- DCL
select user from mysql.user;
show grants for 'Ash'@'localhost';
grant all privileges on *.* to 'Ash'@'localhost';
revoke update, delete, alter, drop on *.* from 'Ash'@'localhost';

-- TCL(commit, rollback, savepoint)
start transaction;
savepoint beforedelete;
delete from table1 where id=102;
rollback;
savepoint beforeupdate;
select * from table1;
update table1 set name="Roshan singh" where id=104;
delete from table1 where id=105;
rollback to beforeupdate;


start transaction;
savepoint beforedelete;
delete from table1 where id=103;
select * from table1;
savepoint beforeupdate;
update table1 set name='Abdul' where id=104;

select * from table1;
rollback to beforedelete;
select * from table1;