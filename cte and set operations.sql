use window_test;

select * from employee_sales;

select max(sale_amount) from employee_sales
 where sale_amount< (select max(sale_amount) from employee_sales);

select *,
dense_rank() over(order by sale_amount desc) as totalrank
  from employee_sales;

select * from (select *,
dense_rank() over(order by sale_amount desc) as totalrank
  from employee_sales) as abc where totalrank=6;
  
-- CTE --> ( common table expression)
-- expression ( name on temporaray basic)

  with abc as (
  select * from employee_sales where emp_id>3 and sale_amount>200)
  
  select * from abc;
  
with abc as 
(select *,
dense_rank() over(order by sale_amount desc) as totalrank
  from employee_sales)
  
  select * from abc where totalrank=2;
  
  use sakila;
  select * from actor;
  select * from film_actor;
  
with film_cte as
(select * from film_actor where actor_id=1)

select * from actor join film_cte on actor.actor_id=film_cte.actor_id;

-- cte is a temporray result of your query
-- cte can be use as a table and it can be reuse agian n again
  
-- set operations -- rule--> have same no. of columns  
select * from actor where actor_id<3
 union          -- does not give duplicate value  -- union combine two query outputs
select * from actor where actor_id between 4 and 6; 
  
 select * from actor where actor_id<3
 union all        -- give duplicate values
select * from actor where actor_id between 4 and 6; 
   
  select actor_id, first_name, last_update from actor where actor_id<3
 union all        
select first_name, last_name, actor_id from actor where actor_id between 4 and 6;  
-- ( sequence of columns does not same but it gives the result)  
  
-- create a sereis of number from 1 to 10;
with recursive cte as (
select 1 as num       -- base case
  union
select num+1 from cte
  where num<10)       -- end case  
select * from cte;  
  
 use regex1;
 select * from employees;
 -- correlated
select e_out.empid, e_out.empname, e_out.salary, e_out.deptid
from employees as e_out
where e_out.salary >
(select avg(salary) from employees as e_in where e_in.deptid = e_out.deptid); 
 
 -- cte
 with xyz as (
 select deptid, avg(salary) as avgsalary from employees group by deptid)
 
 select * from employees
 join xyz where employees.deptid=xyz.deptid
 and employees.salary> xyz.avgsalary;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  
  



