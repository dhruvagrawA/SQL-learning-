-- ddl and dml stmt
-- ddl : 
-- language : data defination , table

-- create
use regex1;

create table t4(id int); -- create stmt  -- ddl operation


-- drop
drop table t4;   -- data and table structure both are deleted ( we cant undo)

create table t5(id int);

desc t5;  -- ddl ( table structure is changed )
alter table t5 add column name varchar(20);
desc t5;

-- dql ( select, group by, joins, subquery)

alter table t5 drop column id;
select * from t5;
alter table t5 add column eid int primary key;  -- ddl

-- dml ( insert , update, delete, merge)
insert into t5 values ('damon',11), ('aman',12);
update t5 set name='tushar'; -- without condition ( all rows are update)

update t5 set name='regex' where eid=11; -- update on condition (use this method)
select * from t5;
-- delete
-- delete from t5;
delete from t5 where eid=12; -- this can be undone (we can undo it)

-- truncate (DDL) -- drop structure + recraete the structure
truncate t5;
select * from t5;

-- DDL ( create, drop, alter, truncate )
-- DML (insert, update, delete )

-- difference between drop, truncate , delete

-- drop : DDL stmt, cannot use where clause , cannot rollback, no use trigger , 
-- slow then truncate

-- truncate : DDL stmt, cannot use where clause, cannot rollback, no use trigger , fast

-- delete : DML stmt, can use where clause, can rollback, use trigger , slow

-- create a column email varchar() add a column name as roll no before email
-- add a pk to this roll no. and a uk in email column
-- insert two rows into both column , add a new column into table name as phone no. varcahr()
-- update any 1 phone no. having the characters 
-- try to change data type of phone no. from varcahhr to integer

create table student(
         email varchar(20)
);
select * from student;
alter table student add column roll_no int primary key first ;
alter table student add unique key ( email);
desc student;
insert into student values(1,'abc@gmail.com'),(2,'xyz@gmail.com');
alter table student add column phone_no varchar(20);
update student set phone_no = '1233abx' where roll_no=1;

update student set phone_no = null;
ALTER TABLE student
MODIFY COLUMN phone_no int;

-- windows functions
-- windows function vs group by functions
-- over() in windows functions





























