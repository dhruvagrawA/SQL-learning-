create database tushardb;
use tushardb;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50),
    EnrollmentYear INT
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50),
    Credits INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);



-- Students Table
INSERT INTO Students VALUES
(1, 'Aditi Sharma', 'Computer Science', 2022),
(2, 'Rohan Patel', 'Mechanical', 2023),
(3, 'Sara Khan', 'Computer Science', 2022),
(4, 'Michael Brown', 'Civil', 2023),
(5, 'Neha Gupta', 'Mechanical', 2024),
(6, 'David Miller', 'Civil', 2022),
(7, 'Priya Verma', 'Computer Science', 2023);

-- Courses Table
INSERT INTO Courses VALUES
(101, 'Data Structures', 'Computer Science', 4),
(102, 'Thermodynamics', 'Mechanical', 3),
(103, 'Fluid Mechanics', 'Civil', 4),
(104, 'DBMS', 'Computer Science', 3),
(105, 'Machine Design', 'Mechanical', 4),
(106, 'Structural Analysis', 'Civil', 3),
(107, 'Operating Systems', 'Computer Science', 4);

-- Enrollments Table
INSERT INTO Enrollments VALUES
(1, 1, 101, '2025-01-10'),
(2, 1, 104, '2025-01-12'),
(3, 2, 102, '2025-01-11'),
(4, 2, 105, '2025-01-15'),
(5, 3, 101, '2025-01-13'),
(6, 3, 107, '2025-01-17'),
(7, 4, 103, '2025-01-16'),
(8, 5, 102, '2025-01-18'),
(9, 6, 103, '2025-01-19'),
(10, 7, 104, '2025-01-20'),
(11, 7, 107, '2025-01-21');

-- ans 1.)
select count(Studentid) as totalstudents, department from students group by department
 order by department;

-- ans 2.)
select count(coursename) as totalcourses, department from courses group by department
order by department;

-- ans 4.)
select s.studentname, coursename from students s join enrollments e
on s.studentid = e.studentid 
inner join courses c on e.courseid = c.courseid ;

-- ans 5.)
select coursename, studentname from courses c join
enrollments e on c.courseid = e.courseid
inner join students s on s.studentid = e.studentid order by coursename;

-- ans 6.)
select coursename, studentname from courses c left join
enrollments e on c.courseid = e.courseid
left join students s on s.studentid = e.studentid;

-- ans 7.)
select coursename, studentname from courses c left join
enrollments e on c.courseid = e.courseid
left join students s on s.studentid = e.studentid;

-- ans 8.)
select coursename, count(s.studentname) as totalstudent from courses c left join
enrollments e on c.courseid = e.courseid
 left join students s on s.studentid = e.studentid group by coursename 
 order by totalstudent desc;

-- ans 3.)
select coursename, count(e.enrollmentid) as totalcoursename from courses c left join
enrollments e on c.courseid = e.courseid group by coursename;

-- ans 9.)
select s.studentname, sum(c.credits) as totalcredits from students s join enrollments e
on s.studentid = e.studentid 
inner join courses c on e.courseid = c.courseid group by studentname ; 

-- ans 10.)
select c.department, coursename, count(s.studentname) from courses c
 inner join enrollments e on c.courseid = e.courseid
 inner join students s on s.studentid = e.studentid 
 group by c.department, coursename order by department;
 























