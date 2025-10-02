use sakila;
select first_name, concat("A", first_name), char_length(first_name),
substr(first_name,2,1) from actor;

-- trim function
select  char_length( trim('    hey  ' ) ) ; -- trim remove spaces

select  char_length( rtrim('   hey  ' ) ) ; -- rtrim remove right spaces

select first_name, replace(first_name,'E','#') from actor; -- replace e by #

select first_name, lpad(first_name, 5, '@') from actor;

select first_name, rpad(first_name, 5, '@') from actor;

-- numeric functions 
-- round 
select round(11.5);

-- check next value of the number then it will roundoff
select round(11.6   ,   1);  -- only the decimal part

select round(11.68   ,   1); 
select round(11.62   ,   1); 

select round(11.63   ,   2); 
select round(11.625  ,   2); 

select round(11.697   ,   2); 

select round(7.627   ,   1);

select round(7.627   ,   -1);  -- only the integer round off
select round(2.627   ,   -1);

select round(12.627   ,   -1);  -- 2<5 ==> 0   6>5 ==> 10

select round(36.627   ,   -1);

select round(36.627   ,   -1);

select round(36.627   ,   -2);  -- 30<50 ==> 0
select round(76.627   ,   -2);  -- 70>50 ==> 100
select round(276.627   ,   -2);

select round(246.627   ,   -2);
select round(246.627   ,   -3);
select round(546.627   ,   -3);

select round(546.627   ,   -1);
select round(546.627   ,   -2);
select round(546.627   ,   -3);
select round(6546.627   ,   -3);

select truncate(6546.637  ,  2); -- value extract does not rroundoff

select round(6546.637  ,  2), truncate(6546.637  ,  2);

-- other functions
select mod(10,2), floor(6.99999), ceil(4.0002);

-- date functions [most important]
-- date pr kaam krna le liye

select current_date(), current_time(), current_timestamp(), now();
-- now and current_tiemstamp both are same

-- adddate
select now(), adddate(  now(), 2);
select now(), adddate(  now(), 40);

select now(), adddate(  now(), interval 2 month);

select now(), adddate(  now(), interval 2 year);

select now(), adddate(  now(), interval 2 hour);

select now(), adddate(  now(), interval -2 month);

select now(), adddate(  now(), interval -2 day);

select now(), addtime(  now(), '02:00:00');

-- year and month important
select now(), year( now() ), last_day( now() );
select now(), month( now() ), last_day( now() );

-- extract 
select now(), extract( month from now());
SELECT NOW(), EXTRACT(QUARTER FROM NOW());

select now(), date_format( now(), 'year is %y');

select now(), date_format( now(), 'year is %y , my month is %m'); -- m give number
select now(), date_format( now(), 'year is %y , my month is %M'); -- M gives name

-- adddate, now, curtime, extract, year, month, date_format (must learn)


use sakila;
select payment_date, year( payment_date), extract(month from payment_date),
date_format(payment_date, 'Hour of shopping is %H'  ),
datediff( payment_date, now()  ) from payment;
