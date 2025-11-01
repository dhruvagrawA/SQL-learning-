-- dcl 
-- data control languagae
-- grant , revoke

create user 'ram' identified by 'ram';
-- create user 'ram%localhost / ram%ipaddress' identified by 'password'
select * from mysql.user;

show grants for 'ram';  -- will show privileges(permisiion)

-- grant statement
grant all privileges on tushardb.* to 'ram';

-- revoke 
revoke all privileges on tushardb.* from 'ram';

grant select on tushardb.* to 'ram';

-- role
create role 'tushardb';
grant 'tushardb' to 'ram';
grant all privileges on tushardb.tushardb to 'ram';

-- dql ( group by, joins - left , inner , self)
-- subquery , single, multi-row ( in , any , all )
-- correlated ( cte )

-- windows ( over() , partition by , order by  , partition by dept order by)
-- rank() order by , dense rank , row_number

-- primary key vs foreign key 
-- constraints
-- functions , substr, instr, concat, trim
-- number round, pow(power), floor, ceil
-- date , adddate, datediff, extract, month, year, date_format, now()

-- 175 181 180































