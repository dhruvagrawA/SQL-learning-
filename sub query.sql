-- sub query ==>
-- a query within a query is known as sub query
-- sub query is the first thing that is executed
-- makes your code more readable
-- if dynamic conditions sub query makes it easy
-- alternatives to joins
-- < , > , >= , <= , !=  (use when ---
-- scaler subquery [ when a subquery return only 1 row] )


use sakila;
select * from actor;
select first_name from actor where actor_id = 3;
select * from actor where first_name = 'ed';

select * from actor where first_name = (select first_name from actor where actor_id = 3);
select * from payment where amount = (select amount from payment where payment_id = 3);
select * from payment where amount = 5.99;

-- get payid amount and paydate where amount of rental id 1476 is same 
select payment_id, amount, rental_id, payment_date from payment where amount =
 (select amount from payment where rental_id = 1476);

-- get payid amount date where the monht = month of payid = 4
select payment_id, amount, month(payment_date),payment_date from payment where month(payment_date) = 
(select month(payment_date) from payment where payment_id = 4);

-- get payid amount where amount = the max amount of table
select payment_id, amount from payment where amount = (
select max(amount) from payment) ;









