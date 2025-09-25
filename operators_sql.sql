show databases;  -- will show all database in mysql
use sakila;      -- use sakila as a database

-- show table to see all table
show Tables;

-- select stmnt  (DQL)    * access all  column
select * from actor;

describe actor;  -- will give table info (column,datatype,relationships and more)

select actor_id, first_name from actor;

select ACTOR_ID ,first_name from ACTor; -- select smtnt table it can be in any case format

select actor_id, first_name,
actor_id, last_name
from actor;

-- don't create new col in original data
select actor_id,first_name,actor_id*5 from actor;

select * from actor where actor_id=5;

select * from actor where first_name='NICK'; -- data should be case sensative

SELECT * FROM ACTOR WHERE LAST_NAME='DAVIS';

-- NOT EQUAL TO
SELECT * FROM ACTOR WHERE ACTOR_ID!=5;
SELECT * FROM ACTOR WHERE ACTOR_ID<>5;

select * from actor where first_name='NICK' AND ACTOR_ID=44;

select * from actor where first_name='NICK' OR ACTOR_ID=46;

select * from actor where first_name='NICK' OR ACTOR_ID!=46;

select * from actor where ACTOR_ID>2 AND ACTOR_ID<6;

select * from actor where ACTOR_ID BETWEEN 2 AND 6;

select * from actor where ACTOR_ID NOT BETWEEN 2 AND 6;

-- BOTH ARE SAME
SELECT * FROM ACTOR WHERE ACTOR_ID=2 OR ACTOR_ID=8 OR ACTOR_ID=19;
SELECT * FROM ACTOR WHERE ACTOR_ID IN (2,8,19);

SELECT * FROM ACTOR WHERE FIRST_NAME IN ('NICK','ED','DAVIS');

SELECT FIRST_NAME, ACTOR_ID,LAST_NAME FROM ACTOR WHERE LAST_NAME='GUINESS';
SELECT ACTOR_ID,FIRST_NAME FROM ACTOR WHERE ACTOR_ID BETWEEN 3 AND 18 OR FIRST_NAME!='ED';
SELECT LAST_NAME,ACTOR_ID,FIRST_NAME FROM ACTOR WHERE FIRST_NAME='NICK' OR FIRST_NAME='GRACE';
SELECT * FROM ACTOR WHERE ACTOR_ID BETWEEN 2 AND 6 OR ACTOR_ID>5;




