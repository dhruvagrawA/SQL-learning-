-- normalisation in sql  
-- it is the technique to organize the data to remove data redundancy and improve data integrity
-- we try to convert large tables into smaller table
-- we have multiple normal forms--
-- 1. 1NF--> each coulmn contains atomic(indivisible) values.
--           there are not multiples values or groups in a column.....eg,
-- (not in 1NF)-		stuid                name                    courses        
--                    1                      raj                   math,science
--                    2                      anita                 english, maths
--           problem-- courses has multiple values
--           
-- after 1NF-
--          stuid                 name                 courses
--          1                     raj                     math
--          1                     raj                 science
--          2                   anita                 english
--          2                   anita                   math

-- 2. 2NF--> table must be in 1NF.
--           we should remove partial dependency(non-key attributes must depend
--                               on the whole primary key, not just part of it).
--         
-- eg,        courseid  coursename  price
--         1         maths        90
--         1         scinece       100
--         89        history      6000
--         
--         
-- 	courseid  +  coursename  =  primary key( combination of 2 column)
--     price ==>  non-key attribute
--     
--     price depend on couse id
--     ** here price is partially dependent on primary key attributes
-- example--->
-- primary key is (stuid, course) (composite  key).
-- but stuname depends only on stuid ,not on fully key

-- stuid                course               stuname
-- 1                    math                 raj
-- 1                    science               raj
-- 2                    english               anita
-- 2                    math                   anita
--  
-- after 2NF(spliiting into two tables):

-- studemts table:  (stuname is non-attribute key) ( stuid is primary key)
-- stuid                              stuname
-- 1                                        raj
-- 2                                     anita

-- stucourse table:         ( there is noone is non-attribute key)
-- stuid                              course        ( stuid + course = primary key)
-- 1                                    math
-- 1                                    science
-- 2                                    english

-- foreign key can be multiple in a table
-- foriegn key is used to estanlish a relation between one or more tables
     -- eg, in above table stuid in stucourse table is a foriegn key 
-- foriegnkey create a realtionship with a table with a primary key or 
-- a unique key of another table     

create database  regex123;
use regex123;
create table product(pid  int,  pname  varchar(20), price int);
insert into product values(100,'iphone',4000), (101,'mi tv', 3000),
(102,'fridge',5000), (103,'cover',500);


create table orders( orderid int, city varchar(20), productid int);
insert into orders values(994,'jaipur', 100),(995,'goa',102), (996,'J&K', 100), (997,'japan',102),
(998,'bhutan', 110);

select * from product;   -- pid is primary key
select * from orders;    -- orderid is primary key, 
-- productid id foriegn key that refer to primry key  of product table

select prd.pid, prd.pname from product as prd;

select ord.productid, ord.city from orders as ord;


select prd.pid, prd.pname, ord.productid, ord.city 
from product as prd
join
orders as ord
where prd.pid = ord.productid;


select prd.pid, prd.pname, prd.price, orders.city from product as prd
join orders where prd.pid = orders.productid;


select prd.pid, prd.pname, prd.price, orders.city from product as prd
join orders where prd.pid = orders.productid and pname= 'iphone';

-- type of joins--->
-- 1. inner join-- type of join where we combine two or more tables based on same columns
-- values 





















     















        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
          