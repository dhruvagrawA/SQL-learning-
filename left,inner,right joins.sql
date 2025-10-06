use regex123;
select * from product;
select * from orders;

select product.pid, product.pname, product.price, orders.city from product
join orders
where product.pid = orders.productid;    -- inner join 

select product.pid, product.pname, product.price, orders.city from product
inner join orders
on product.pid = orders.productid;            -- inner join in a better way use this method only


select product.pid, product.pname, product.price, orders.productid, orders.city from product
left join orders
on product.pid = orders.productid;


select product.pid, product.pname, product.price, orders.productid, orders.city from orders
left join product
on product.pid = orders.productid;

select product.pid, product.pname, product.price, orders.productid, orders.city from product
right join orders
on product.pid = orders.productid;

use sakila;
select * from actor;
select * from film_actor;

desc actor;                 -- check if there any duplicate
select count(actor_id), count(distinct(actor_id)) from actor;  -- check for duplication


select actor.actor_id, actor.first_name, film_actor.actor_id, film_actor.film_id
from actor
join film_actor where actor.actor_id = film_actor.actor_id;

drop database regex123;
create database regex123;

use regex123;
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);


INSERT INTO Student (StudentID, StudentName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eva'),
(6, 'Frank'),
(7, 'Grace'),
(8, 'Helen'),
(9, 'Ian'),
(10, 'Jack');


INSERT INTO Enrollment (EnrollmentID, StudentID, CourseName) VALUES
(101, 1, 'Math'),
(102, 2, 'Physics'),
(103, 3, 'Chemistry'),
(104, 1, 'English'),
(105, 5, 'Biology'),
(106, 7, 'History'),
(107, 10, 'Math');


select * from enrollment;
select * from student;

select s.studentid, s.studentname, e.enrollmentid from student as s
join enrollment as e
where s.studentid = e.studentid;


select s.studentid, s.studentname, e.enrollmentid from student as s
left join enrollment as e
on s.studentid = e.studentid;

select s.studentid, s.studentname, e.coursename from student as s
join enrollment as e
where s.studentid = e.studentid;

select s.studentid, s.studentname, e.coursename from student as s
inner join enrollment as e
on s.studentid = e.studentid;

select s.studentid, s.studentname, e.enrollmentid from student as s
left join enrollment as e
on s.studentid = e.studentid and e.enrollmentid where e.enrollmentid is null;

select s.studentid, count(e.enrollmentid) from student as s
left join enrollment as e
on s.studentid = e.studentid and e.enrollmentid 
group by s.studentid;

select count(s.studentid), e.coursename from student as s
inner join enrollment as e
on s.studentid = e.studentid group by e.coursename;
















