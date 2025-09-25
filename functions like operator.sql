use sakila;
select * from actor;
select actor_id,actor_id+4 from actor;
select * from actor where actor_id>4 and first_name='JOE';
select * from actor where actor_id in (4,10);

-- like operator ( pattern le according data filter)
select * from actor where first_name='N';

-- % ( wildcard character ) : zero or more character
select * from actor where first_name like 'S%'; -- startign s
select * from actor where first_name like '%S'; -- ending s

select * from actor where first_name like 'S%T'; -- start with s ends with t
select * from actor where first_name like '%S%'; -- mid s end s start s give all

-- ( _ ) : exactly 1 character
select * from actor where first_name like 'E_'; -- after e only one char
select * from actor where first_name like 'A___'; -- after A only 3 char(3 underscore)
select * from actor where first_name like 'A___%'; -- after a 3 char and other char also
select * from actor where first_name like '_D%';

-- where last 2 word should be te
select * from actor where First_name like '%te';
-- where the letter nn should be present in middle
select * from actor where First_name like '_%NN%_';
-- fn and ln where the lastname col the first word is B and the second last word R
select first_name , Last_name from actor where last_name like 'B%R_';
-- get all info where the fn will have mini 4 char.
select * from actor where First_name like '____%';
-- get all col where teh actor id is from 2 to 90 and the fn the s presnt in middle 
-- and a be 2nd last char
select * from actor where (actor_id between 2 and 90) and first_name like '_%s%A_';

-- functions 
-- inbuilt functions-->
--   1) scaler func ( row func )
--        apply on each row n return output for each row
--   2) multi row func


-- total chaacter in each first_name
select first_name, char_length(first_name), lower(first_name) from actor;

select first_name,last_name, concat(first_name, last_name) from actor;

select first_name,last_name, concat(first_name, '-regex') from actor;

select first_name,last_name, concat(first_name,' ', last_name) from actor;

select first_name,last_name, concat('MR/MS',' ',first_name,' ', last_name) from actor;

select first_name,last_name, concat_ws(' ','MR',first_name, last_name) from actor;

select first_name,last_name, concat_ws('@','MR',first_name, last_name) from actor;

-- substr ( to extract some data)
select first_name , substr(first_name,2) from actor; 
select first_name , substr(first_name,3) from actor; 
select first_name , substr(first_name,1) from actor; 
select first_name , substr(first_name,4) from actor; 

select first_name , substr(first_name,3), substr(first_name,3,2) from actor;
											--  (col,position,total character) 
                                            
 select first_name , substr(first_name,-4,2) from actor;    
 
 

