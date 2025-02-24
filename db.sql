CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(150) NOT NULL,
    hod_id INT NOT NULL,
    hod_name VARCHAR(150) NOT NULL
);

CREATE TABLE Students (
    std_id INT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    dob DATE NOT NULL,
    dep_id INT NOT NULL,
    email VARCHAR(150),
    FOREIGN KEY (dep_id) REFERENCES Departments(dep_id)
);

CREATE TABLE Courses (
    cors_id INT PRIMARY KEY,
    cors_name VARCHAR(255) NOT NULL,
    dep_id INT NOT NULL,
    credits INT NOT NULL,
    FOREIGN KEY (dep_id) REFERENCES Departments(dep_id)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    std_id INT NOT NULL,
    cors_id INT NOT NULL,
    grade VARCHAR(5) NOT NULL,
    FOREIGN KEY (std_id) REFERENCES Students(std_id),
    FOREIGN KEY (cors_id) REFERENCES Courses(cors_id)
);


INSERT INTO Departments (dep_id, dep_name, hod_id, hod_name) VALUES
(1, 'Computer Science', 1, 'Dr. John Smith'),
(2, 'Electrical Engineering', 2, 'Dr. Alice Johnson'),
(3, 'Mechanical Engineering', 3, 'Dr. Robert Williams'),
(4, 'Civil Engineering', 4, 'Dr. Emily Davis'),
(5, 'Biotechnology', 5, 'Dr. Mark Wilson'),
(6, 'Mathematics', 6, 'Dr. Sarah Thompson');

INSERT INTO Students (std_id, name, dob, dep_id, email) VALUES
(101, 'Michael Brown', '2000-05-15', 1, 'michael.brown@student.edu'),
(102, 'Emma Wilson', '1999-08-22', 2, 'emma.wilson@student.edu'),
(103, 'Liam Johnson', '2001-03-10', 3, 'liam.johnson@student.edu'),
(104, 'Olivia Martinez', '2000-11-30', 4, 'olivia.martinez@student.edu'),
(105, 'William Anderson', '1998-07-05', 5, 'william.anderson@student.edu'),
(106, 'Sophia Thomas', '1999-02-18', 6, 'sophia.thomas@student.edu');

INSERT INTO Courses (cors_id, cors_name, dep_id, credits) VALUES
(201, 'Data Structures', 1, 4),
(202, 'Circuit Analysis', 2, 3),
(203, 'Thermodynamics', 3, 4),
(204, 'Structural Engineering', 4, 3),
(205, 'Genetic Engineering', 5, 4),
(206, 'Linear Algebra', 6, 3);

INSERT INTO Enrollments (enrollment_id, std_id, cors_id, grade) VALUES
(301, 101, 201, 'A'),
(302, 102, 202, 'B+'),
(303, 103, 203, 'A-'),
(304, 104, 204, 'B'),
(305, 105, 205, 'A'),
(306, 106, 206, 'A-');


[24/02, 12:49 pm] Jignesh Ameta: SELECT s.name AS student_name, d.department_name, c.course_name
FROM Students s
JOIN Departments d ON s.department_id = d.department_id
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;
[24/02, 12:49 pm] Jignesh Ameta: SELECT s.name AS student_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE s.student_id IN (
    SELECT student_id FROM Enrollments
    GROUP BY student_id
    HAVING COUNT(DISTINCT course_id) >= 2
);
[24/02, 12:49 pm] Jignesh Ameta: SELECT s.name AS student_name, d.department_name, COUNT(e.course_id) AS total_courses
FROM Students s
LEFT JOIN Departments d ON s.department_id = d.department_id
LEFT JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.name, d.department_name;
[24/02, 12:50 pm] Jignesh Ameta: SELECT s.name AS student_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;
[24/02, 12:50 pm] Jignesh Ameta: SELECT d.department_name, AVG(course_count) AS avg_courses_per_student
FROM (
    SELECT s.department_id, s.student_id, COUNT(e.course_id) AS course_count
    FROM Students s
    LEFT JOIN Enrollments e ON s.student_id = e.student_id
    GROUP BY s.department_id, s.student_id
) AS student_courses
JOIN Departments d ON student_courses.department_id = d.department_id
GROUP BY d.department_name;
[24/02, 12:50 pm] Jignesh Ameta: SELECT s.name AS student_name, COUNT(e.course_id) AS total_courses
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id
HAVING COUNT(e.course_id) = (
    SELECT MAX(course_count)
    FROM (SELECT student_id, COUNT(course_id) AS course_count FROM Enrollments GROUP BY student_id) AS course_counts
);
[24/02, 12:50 pm] Jignesh Ameta: SELECT s.name AS student_name, hod.name AS hod_name
FROM Students s
JOIN Departments d ON s.department_id = d.department_id
JOIN Students hod ON d.hod_id = hod.student_id;
[24/02, 12:50 pm] Jignesh Ameta: SELECT s.name AS student_name, c.course_name, d1.department_name AS student_department, d2.department_name AS course_department
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Departments d1 ON s.department_id = d1.department_id
JOIN Departments d2 ON c.department_id = d2.department_id
WHERE s.department_id <> c.department_id;
[24/02, 12:50 pm] Jignesh Ameta: SELECT c.course_name, COUNT(e.student_id) AS enrolled_students
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY c.course_id, c.course_name
HAVING COUNT(e.student_id) = (
    SELECT MAX(student_count)
    FROM (SELECT course_id, COUNT(student_id) AS student_count FROM Enrollments GROUP BY course_id) AS course_counts
);
[24/02, 12:50 pm] Jignesh Ameta: SELECT DISTINCT s.name AS student_name, c.course_name, e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE e.grade = (
    SELECT MAX(grade)
    FROM Enrollments e2
    WHERE e2.course_id = e.course_id
);


extra queris
get departmet id of those courses whose credits is less then or equal to 2

SELECT DISTINCT d.dep_id, d.dep_name,c.cors_id,c.credits
FROM Courses c
JOIN Departments d ON c.dep_id = d.dep_id
WHERE c.credits <= 2;

SELECT DISTINCT dep_id
FROM Courses
WHERE credits <= 2;

students with hod names that earn 'A' credits in those courses have birth in febraury month

SELECT s.name AS student_name, d.hod_name, e.grade, s.dob
FROM Students s
JOIN Enrollments e ON s.std_id = e.std_id
JOIN Courses c ON e.cors_id = c.cors_id
JOIN Departments d ON s.dep_id = d.dep_id
WHERE e.grade = 'A' AND MONTH(s.dob) = 2;
