use sakila;
select * from payment;
select count(customer_id), amount from payment group by amount;

select customer_id, sum(amount) from payment group by customer_id;

select customer_id, amount, count(amount) from payment group by customer_id, amount;

-- how much amount we have spent in each year
select amount,year(payment_date) from payment group by amount, year(payment_date);

select staff_id,year(payment_date),sum(amount) from payment group by staff_id, year(payment_date);

-- order by (sort karna data ko asceding descending)
select * from payment order by rental_id;

select * from payment order by customer_id desc;

select * from payment order by customer_id desc , amount desc;

select * from payment order by customer_id desc , amount desc;

-- conditional functions 
select customer_id, amount, if(amount>3, 'high', 'low') from payment;
				   		-- (condition, true , false)

select customer_id, amount, if(amount=2.99, 'high', 
if(amount=5.99,'Avg','low')) from payment;

select customer_id, amount, 
      case
         when amount=2.99  then  'high'  -- when condition ky krna h
         when amount=5.99  then  'avg'   -- when condition ky krna h
         else  'low'
       end                               -- end of case 
from payment;

-- select two col cutid and stauts if cusid is > 1 print hello if cust> 4
-- print user otherwiese print regex

select customer_id , 
      case
          when customer_id>4 then 'user'
          when customer_id>1 then 'hello'
          else 'regex'
          end as status
from payment;  


-- what are relationships in sql
-- what is primary key super key cndidate key
-- what are joins in sql



      



         
         











