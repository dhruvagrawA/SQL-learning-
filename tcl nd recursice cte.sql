-- TCL -> (transaction control language)
-- transaction - logical statement
-- control / manage

create database testing12;
use testing12;
create table xyz(id int, name varchar(20));
insert into xyz values(11,'aman'),(12,'user');
select * from xyz;

-- transaction -
-- transaction start
-- ddl, dml
-- transaction end
-- 1) autocommit => disable / write ( start transaction )
-- 2) 
-- 3) end ( commit; rollback; ddl statement  dcl statement
-- commit will save the transaction permanentaly in my database
-- commit is a tcl statement
-- rollback discard the changes in database
-- ddl and dcl end and save the transaction

start transaction;
insert into xyz values(99,'tushar');
select * from xyz;
commit;         -- save the changes permanently

start transaction;
delete from xyz;
select * from xyz;
rollback;       -- revert the transaction

start transaction;
delete from xyz;
insert into xyz values(10001,'assddddd');
select * from xyz;
rollback;

start transaction;
insert into xyz values(192844,'assdy33d');
select * from xyz;

create table tusharr123(id int);-- it will save the upper stmnt permanently( end of transaction)

start transaction;
update xyz set name='tushar';
savepoint tushar_savepoint; -- savepoint to rollback to a specific point
insert into xyz values(12345,'raghav');
select * from xyz;
rollback to tushar_savepoint; -- rollback to a specific point i.e. to savepoint



-- manager chain ->
/*
 with recursive cte as (
select emp.employeeid, emp.employeename , emp.employeename as managerchain
from employees as emp
where emp.managerid is null
union
select emp.employeeid, emp.employeename ,
concat( mgr.managerchain , ' -> ', emp.employeename) as managerchain
from employees as emp
join cte as mgr on emp.managerid=mgr.employeeid )

select * from cte;
*/


-- manager chain for employees table ->
select * from regex123.employees;
use regex123;
 with recursive cte as (
select emp.employee_id, emp.name , emp.name as managerchain
from employees as emp
where emp.manager_id is null
union
select emp.employee_id, emp.name ,
concat( mgr.managerchain , ' -> ', emp.name) as managerchain
from employees as emp
join cte as mgr on emp.manager_id=mgr.employee_id )

select * from cte;

-- grand revoke and roles

CREATE TABLE Employees2 (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- Give user 'rahul' permission to view and add employees
GRANT SELECT, INSERT ON Employees TO 'rahul';

-- Later, remove the INSERT permission
REVOKE INSERT ON Employees FROM 'rahul';














