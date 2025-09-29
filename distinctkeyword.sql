use sakila;
select amount, round(amount) from payment;

select sum(amount), sum(round(amount)) from payment;

select sum(amount), count(amount) from payment;

select count(amount) from payment where amount>5;

select count(payment_id ) from payment where payment_id<555;

select * from address;
select count(address_id) from address;
select count(address_id), count(address2) from address;
-- count skip null values means does not count null values

select count(address_id), count(address2), count(*) from address;
-- count(* ) counts null values also

select * from payment;

select max(amount), min(amount), sum(amount), count(amount), avg(amount) from payment;

select distinct amount from payment;
select distinct amount, payment_id from payment;
select distinct amount, customer_id from payment;

select count(distinct amount), count(amount) from payment;

-- get pyid amount for year 2005
select payment_id, amount from payment where year( payment_date)=2005;

-- get unique customers who have done the payment in the month of june
select payment_date, month( payment_date) from payment;
select  count(distinct customer_id) from payment where month(payment_date)=6;

-- get max amount avg amount and diff and max and avg amount where the amount of paymebnt > 2 dollar for year 2006
select max(amount), avg(amount), max(amount)-avg(amount) 
from payment where amount>2 and  year( payment_date)=2006;

-- group by 
select * from payment where customer_id=2;
select count(payment_id) from payment where customer_id=2;
select count(payment_id) from payment where customer_id=4;
select count(payment_id) from payment where customer_id=7;

-- group by stmnt ( grouping similar values)
--  when we do a group by on a column we inly select and use that column only
select customer_id from payment group by customer_id;
select customer_id from payment group by customer_id;

-- distinct to find unique values from the table
-- we cannot use any aggregate function with distinct 
-- this is time taking task(expensive)

select distinct customer_id, count(payment_id) from payment;-- gives error

-- collect similar data and we can use aggregate function with group by

select distinct customer_id, count(payment_id) from payment group by customer_id;









