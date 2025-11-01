use regex123;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    city VARCHAR(50),
    enrollment_date DATE
);
INSERT INTO Students (student_id, student_name, city, enrollment_date)
VALUES
(1, 'Amit', 'Delhi', '2023-01-15'),
(2, 'Sneha', 'Mumbai', '2023-02-10'),
(3, 'Raj', 'Delhi', '2023-03-05'),
(4, 'Priya', 'Bangalore', '2023-01-25'),
(5, 'Vikram', 'Mumbai', '2023-04-12'),
(6, 'Anjali', 'Delhi', '2023-02-28'),
(7, 'Karan', 'Chennai', '2023-03-20');


CREATE TABLE Enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    course_fee INT,
    grade CHAR(1),
    enroll_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
INSERT INTO Enrollments (enroll_id, student_id, course_name, course_fee, grade, enroll_date)
VALUES
(101, 1, 'SQL Basics', 5000, 'A', '2023-01-20'),
(102, 1, 'Python', 6000, 'B', '2023-02-05'),
(103, 2, 'SQL Basics', 5000, 'B', '2023-02-12'),
(104, 2, 'Data Science', 10000, 'A', '2023-03-01'),
(105, 3, 'SQL Basics', 5000, 'C', '2023-03-07'),
(106, 4, 'Python', 6000, 'A', '2023-01-28'),
(107, 5, 'SQL Basics', 5000, 'B', '2023-04-15'),
(108, 6, 'Data Science', 10000, 'A', '2023-03-05'),
(109, 6, 'SQL Basics', 5000, 'A', '2023-03-12'),
(110, 7, 'Python', 6000, 'B', '2023-03-25');

select * from Students;
select * from enrollments;
-- 1)
SELECT 
    course_name,
    COUNT(DISTINCT student_id) AS total_students
FROM 
    Enrollments
GROUP BY 
    course_name;
    
-- 2)
SELECT DISTINCT 
    s.student_name
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
WHERE 
    e.grade = 'A';

-- 3)
SELECT 
    s.student_name,
    e.course_name,
    COUNT(e.course_name) OVER (PARTITION BY s.student_id) AS total_courses
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
ORDER BY 
    s.student_name;

-- 4)
SELECT 
    s.student_name
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
WHERE 
    e.course_fee = (SELECT MAX(course_fee) FROM Enrollments);
    
-- 5)
SELECT 
    s.student_name
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
GROUP BY 
    s.student_name
HAVING 
    MIN(e.course_fee) >= 6000;

-- 6)
SELECT 
    s.student_name,
    e.course_name
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
WHERE 
    e.course_fee = (SELECT MIN(course_fee) FROM Enrollments);
    
-- 7)
SELECT 
    s.student_name,
    e.course_name,
    e.course_fee,
    SUM(e.course_fee) OVER (
        PARTITION BY s.student_id
        ORDER BY e.enroll_id
    ) AS running_total
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
ORDER BY 
    s.student_name, e.enroll_id;
    













