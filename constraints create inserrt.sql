-- constraints =>
-- they are ruless and regulations which do not allow invalid data entry in the table

-- 1.) not null

create database regexdb;
use regexdb;

create table test(id int);
insert into test values(10),(11),(10),(null);
select count(*), count(id) from test;

create table test2(id int not null);          -- not null
insert into test2 values(10),(11),(10),(null);  -- gives error due to null 

create table test3(id int unique);             -- unique
insert into test3 values(10),(11),(10);  -- gives error due to duplicate value

create table test4(id int , gender varchar(20));    -- gives null in gender column
insert into test4(id) values (10);
select * from test4;

create table test5(id int , gender varchar(20) default 'male' );  -- default
insert into test5(id) values (10);       -- give male in gender column due to default constarint
select * from test5; 

create table test6(id int check (id>5), gender varchar(20) );     -- check
insert into test6(id) values (10);
insert into test6(id) values (3);  -- gives error due to condition (id>5) & here value is 3
select * from test6;

create table test7(id int check (id>5), gender varchar(20)
check ( gender in ('male','female') ) );     -- check
insert into test7(id,gender) values (10,'male');
insert into test7(id) values (3,'transgender');  -- gives error due to transgender

-- giving name to constraint
-- this helps to find error easily

create table test8(id int check (id>5), gender varchar(20),
constraint db_test8_gender_chk check ( gender in ('male','female') ) );

-- constraint db_test8_gender_chk ( syntax of giving constarint name )

insert into test8(id,gender) values (10,'male');
insert into test8(id) values (3,'transgender'); -- error by constraint name(db_test8_gender_chk)

create table test9(id int primary key , gender varchar(20));   -- primary key
insert into test9(id) values (11),(12);    -- primary key(unique, not null values)
insert into test9(id) values (11),(13);  -- error due to duplicate value
insert into test9(id) values (14),(50),(null);  -- error due to null
select * from test9;

create table product(pid int primary key, pname varchar(20));
insert into product values('101','iphone');
insert into product values('102','ipad');
select * from product;

-- without foreign key (every data will be inserted independent from product table)
create table orders( order_id int , price int , pid int);
insert into orders values (1981, 200, 101), (1982,250,102), (1983,275,101), (1984,500,108);
select * from orders;

-- with foreign key
create table orders2( order_id int , price int , pid int, 
foreign key (pid) references product(pid));
insert into orders2 values (1981, 200, 101), (1982,250,102), (1983,275,101);
insert into orders2 values (1984,500,108); -- gives error as it fails foreign key constraint
-- coz 108 is not available in product table
select * from orders2;

-- u have to create two table - employees (empid pk, empname, empemail unique,
-- deptid refer to dept table) 
-- department (deptid unique, deptname check(dept bio and physics)) 
-- in dept table also try to insert null value in deptid

create table employees2 ( empid int primary key, empname varchar(20), 
empemail varchar(20) unique, deptid int, foreign key (deptid) references department(deptid) );
insert into employees2 values(101, 'john', 'xyz@email.com', 1);
insert into employees2 values(102, 'cia', 'abc@email.com', 2), (103, 'damon', 'pnm@email.com', 1),
(104, 'stefan', 'jkl@email.com', 3);
select * from employees2;


create table department ( deptid int unique, deptname varchar(20) check 
( deptname in ('physics','biology') ) );
insert into department values (1,'physics'),(2,'biology'),(null,'biology'),
(3,'physics'),(null,'physics');
select * from department;













































