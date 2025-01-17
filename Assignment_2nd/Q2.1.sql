-- Create Database 'mca_assign2.1'

CREATE Database `mca_assign2.1`

-- Select the database 'mca_assign2.1'

use `mca_assign2.1`

-- Create Table 'Students'

CREATE TABLE students (
    StudentID int(5) NOT NULL,
    Name varchar(50) NOT NULL,
    Age int(3) NOT NULL,
    Department varchar(50) NOT NULL,
    GPA decimal(6,2) DEFAULT NULL,
    PRIMARY KEY(StudentID),
    INDEX(Department)
);

-- Insert Data into 'students' table

INSERT INTO students (StudentID, Name, Age, Department, GPA) VALUES
(101, 'Alice Johnson', 20, 'ComputerSci', 3.8),
(102, 'Bob Smith', 22, 'Mathematics', 3.6),
(103, 'Charlie Brown', 21, 'Physics', 3.4),
(104, 'Diana Evans', 23, 'ComputerSci', 3.9),
(105, 'Eva Green', 24, 'Mathematics', 3.5),
(106, 'Frank White', 25, 'Physics', 3.3),
(107, 'Grace Lee', 21, 'ComputerSci', 3.7),
(108, 'Henry Adams', 20, 'Mathematics', 3.2),
(109, 'Isabel Turner', 22, 'Physics', 3.1),
(110, 'Jack Davis', 24, 'Mathematics', 3.9);

-- Create table 'Courses'

CREATE TABLE courses (
    CourseID int(5) NOT NULL,
    CourseName varchar(50) NOT NULL,
    Department varchar(50) NOT NULL,
    Credits int(2) NOT NULL,
    PRIMARY KEY(CourseID),
    INDEX(Department)
);

-- Insert Data into 'courses' table

INSERT INTO courses (CourseID, CourseName, Department, Credits) VALUES
(201, 'Database Systems', 'ComputerSci', 4),
(202, 'Operating Systems', 'ComputerSci', 3),
(203, 'Linear Algebra', 'Mathematics', 4),
(204, 'Probability Theory', 'Mathematics', 3),
(205, 'Quantum Mechanics', 'Physics', 4),
(206, 'Electromagnetism', 'Physics', 3),
(207, 'Artificial Intelligence', 'ComputerSci', 5),
(208, 'Topology', 'Mathematics', 3),
(209, 'Astrophysics', 'Physics', 4),
(210, 'Machine Learning', 'ComputerSci', 5);

-- Add Foreign Key to 'students' table

ALTER TABLE `students`
    ADD CONSTRAINT `fk_Department` 
        FOREIGN KEY (`Department`) 
        REFERENCES `courses`(`Department`) 
        ON DELETE CASCADE ON UPDATE CASCADE;

'q2.1 - Retrieve the names of all students in the "ComputerSci" Department?'

SELECT Name
FROM students
WHERE students.Department = 'ComputerSci';

'q2.2 - List all courses offered by "Mathematics Department?'

SELECT CourseName
FROM courses
WHERE courses.Department = 'Mathematics';

'q2.3 - Find the avg GPA of students in the "Physics" Department?'

SELECT ROUND(AVG(students.GPA), 2)
FROM students
WHERE students.Department = 'Physics';

'q2.4 - Display the names of students who are older than 21 years?'

SELECT *
FROM students s
WHERE s.Age < 21;

'q2.5 - Retrive the details of courses with more than 3 credits?'

SELECT *
FROM courses c
WHERE c.Credits > 3;

'q2.6 - Find the names and GPAs of students with a GPA greater than 3.5?'

SELECT s.Name,
       s.GPA
FROM students s
WHERE s.GPA > 3.5;

'q2.7 - List of all students and their corresponding department?'

SELECT s.StudentID,
    s.Name,
    s.Department
FROM students s;

'q2.8 - Display the CourseID and CourseName for courses offered by the "ComputerSci" Department?'

SELECT c.CourseID,
    c.CourseName
FROM courses c
WHERE c.Department = 'ComputerSci';

'q2.9 - Find the total numbers of students in the "Mathematics" Department?'

SELECT COUNT(s.StudentID) as 'Total Student'
FROM students s
WHERE s.Department = 'Mathematics';
