-- view - it is a virtual table , it stores query in it
-- it is used to provide consistence of data
-- it makes the query simpler

use sakila;
select first_name, film_id from actor join film_actor where actor.actor_id=film_actor.film_id;

-- complex query
create view v_actor as
select first_name, film_id from actor join film_actor where actor.actor_id=film_actor.film_id;

select * from v_actor;
-- view for specific column ( security)
create view v_first as 
select first_name from actor;

select * from v_first;

-- ctas ( create table as select)
create table yash110 as
select * from actor where actor_id between 2 and 5;

select * from yash110;

create view v_yash  -- updatable
as select actor_id, first_name from yash110;

select * from v_yash;
update v_yash set first_name='xyz';

select * from yash110;

-- non updatable view -
-- aggregate functions , distinct, griup by, having, join, subquery, dml, union, etc.

-- what is the differnce materialzied and non-materalized view? (interview question)

-- indexes ->
-- it is a constraint / data structure which is used to indentify data in a row
-- it is a data structure which is used to find data faster in the database

-- types of index -
-- clustered- it determines the physical order of data in a table ( primary key)
-- non-clustered - khudse jo banaya jaye usse non-clusters khte h
-- 'explain' keyword defines how query is working

-- create index idx_student on students(student_id); -- index created (non-clustrered)

-- explain select * from students where student_id=2; -- use of index
-- explain select * from students where name='bob';  -- no index use 

-- index is created on a specific column stu_id so only on stsu_id column index is created
-- not for any othrr column thats why name column doest not have ibdex as we only created
-- index on stu_id column

-- composite index - 2 columns = primary key
-- create index idx_student on students(student_id,name);
-- explain select * from students where student_id=2;  -- use index
-- explain select * from students where student_id = 3 and name='alice'; -- use index
-- explain select * from students where name='bob'; no index use in composite index
-- coz order matters and name is on 2 and id is on 1

















