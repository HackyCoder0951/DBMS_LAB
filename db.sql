[24/02, 12:49 pm] Jignesh Ameta: CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL,
    hod_id INT
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dob DATE,
    department_id INT,
    email VARCHAR(255),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    department_id INT,
    credits INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
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