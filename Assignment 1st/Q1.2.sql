-- CREATE DATABASE `assign2`

CREATE DATABASE mca_assign2;

--
-- Table structure for table `advisor`
--

CREATE TABLE `advisor` (
  `sID` varchar(10) NOT NULL,
  `iID` varchar(10) NOT NULL
);

--
-- Indexes for table `advisor`
--

ALTER TABLE `advisor`
  ADD PRIMARY KEY (`sID`,`iID`),
  ADD KEY `iID` (`iID`);

--
-- Constraints for table `advisor`
--

ALTER TABLE `advisor`
  ADD CONSTRAINT `advisor_ibfk_1` FOREIGN KEY (`sID`) 
  REFERENCES `student` (`ID`),
  ADD CONSTRAINT `advisor_ibfk_2` FOREIGN KEY (`iID`) 
  REFERENCES `instructor` (`ID`);

--
-- Dumping data for table `advisor`
--

INSERT INTO `advisor` 
  (`sID`, `iID`) 
VALUES
  ('S101', 'PH101'),
  ('S123', 'P123'),
  ('S202', 'CH202'),
  ('S303', 'BI303'),
  ('S404', 'HI404'),
  ('S456', 'E456'),
  ('S505', 'EN505'),
  ('S606', 'MG606'),
  ('S707', 'SP707'),
  ('S789', 'M789');

--
-- Table structure for table `classroom`
--

CREATE TABLE `classroom` (
  `building` varchar(20) NOT NULL,
  `room_number` int(11) NOT NULL,
  `capacity` int(11) DEFAULT NULL
);

--
-- Indexes for table `classroom`
--

ALTER TABLE `classroom`
  ADD PRIMARY KEY (`building`,`room_number`);


--
-- Dumping data for table `classroom`
--

INSERT INTO `classroom` 
  (`building`, `room_number`, `capacity`) 
VALUES
  ('Admin Building', 102, 25),
  ('Arts Building', 211, 35),
  ('Cafeteria Building', 104, 100),
  ('Computer Center', 201, 50),
  ('Engineering Building', 303, 40),
  ('Hostel Building', 103, 50),
  ('Library Building', 110, 20),
  ('Main Building', 101, 50),
  ('Science Building', 202, 30),
  ('Sports Complex', 105, 100);

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` varchar(10) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL
);

--
-- Indexes for table `course`
--

ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `dept_name` (`dept_name`);

--
-- Constraints for table `course`
--

ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dept_name`) 
  REFERENCES `department` (`dept_name`);

--
-- Dumping data for table `course`
--

INSERT INTO `course` 
  (`course_id`, `title`, `dept_name`, `credits`) 
VALUES
  ('BIO101', 'Introduction to Biology', 'Biology', 3),
  ('CHEM101', 'General Chemistry', 'Chemistry', 4),
  ('CS101', 'Introduction to Programming', 'Computer Science', 3),
  ('EE202', 'Circuit Analysis', 'Electrical Engineering', 4),
  ('ENG101', 'English Composition', 'English', 3),
  ('HIST201', 'Modern World History', 'History', 3),
  ('MATH301', 'Calculus III', 'Mathematics', 3),
  ('MGT301', 'Principles of Management', 'Management', 3),
  ('PHYS201', 'Mechanics', 'Physics', 3),
  ('SPORT101', 'Physical Fitness', 'Sports', 2);

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_name` varchar(50) NOT NULL,
  `building` varchar(20) DEFAULT NULL,
  `budget` decimal(10,2) DEFAULT NULL
);

--
-- Indexes for table `department`
--

ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_name`),
  ADD KEY `building` (`building`);

--
-- Constraints for table `department`
--

ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`building`) 
  REFERENCES `classroom` (`building`);

--
-- Dumping data for table `department`
--

INSERT INTO `department` 
  (`dept_name`, `building`, `budget`) 
VALUES
  ('Biology', 'Science Building', 300000.00),
  ('Chemistry', 'Science Building', 350000.00),
  ('Computer Science', 'Main Building', 1000000.00),
  ('Electrical Engineering', 'Engineering Building', 800000.00),
  ('English', 'Arts Building', 150000.00),
  ('History', 'Arts Building', 200000.00),
  ('Management', 'Admin Building', 250000.00),
  ('Mathematics', 'Main Building', 500000.00),
  ('Physics', 'Science Building', 400000.00),
  ('Sports', 'Sports Complex', 100000.00);

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `ID` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL
);

--
-- Indexes for table `instructor`
--

ALTER TABLE `instructor`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `dept_name` (`dept_name`);

--
-- Constraints for table `instructor`
--

ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`dept_name`) 
  REFERENCES `department` (`dept_name`);

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` 
  (`ID`, `name`, `dept_name`, `salary`) 
VALUES
  ('BI303', 'Prof. Biology', 'Biology', 45000.00),
  ('CH202', 'Prof. Chemistry', 'Chemistry', 50000.00),
  ('E456', 'Prof. Engineer', 'Electrical Engineering', 75000.00),
  ('EN505', 'Prof. English', 'English', 35000.00),
  ('HI404', 'Prof. History', 'History', 40000.00),
  ('M789', 'Prof. Math', 'Mathematics', 60000.00),
  ('MG606', 'Prof. Management', 'Management', 50000.00),
  ('P123', 'Prof. Patel', 'Computer Science', 80000.00),
  ('PH101', 'Prof. Physics', 'Physics', 55000.00),
  ('SP707', 'Coach Sports', 'Sports', 30000.00);

--
-- Table structure for table `prereq`
--

CREATE TABLE `prereq` (
  `course_id` varchar(10) NOT NULL,
  `prereq_id` varchar(10) NOT NULL
);

--
-- Indexes for table `prereq`
--

ALTER TABLE `prereq`
  ADD PRIMARY KEY (`course_id`,`prereq_id`),
  ADD KEY `prereq_id` (`prereq_id`);

--
-- Constraints for table `prereq`
--

ALTER TABLE `prereq`
  ADD CONSTRAINT `prereq_ibfk_1` FOREIGN KEY (`course_id`) 
  REFERENCES `course` (`course_id`);

--
-- Dumping data for table `prereq`
--

INSERT INTO `prereq` 
  (`course_id`, `prereq_id`) 
VALUES
  ('BIO101', 'BIO100'),
  ('CHEM101', 'CHEM100'),
  ('CS101', 'CS201'),
  ('EE202', 'CS101'),
  ('ENG101', 'ENG100'),
  ('HIST201', 'HIST101'),
  ('MATH301', 'MATH201'),
  ('MGT301', 'MGT201'),
  ('PHYS201', 'PHYS101'),
  ('SPORT101', 'SPORT100');

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `course_id` varchar(10) NOT NULL,
  `sec_id` int(11) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `year` int(11) NOT NULL,
  `building` varchar(20) DEFAULT NULL,
  `room_number` int(11) DEFAULT NULL,
  `time_slot_id` int(11) DEFAULT NULL
);

--
-- Indexes for table `section`
--

ALTER TABLE `section`
  ADD PRIMARY KEY (`course_id`,`sec_id`,`semester`,`year`),
  ADD KEY `section_ibfk_2` (`building`,`room_number`),
  ADD KEY `section_ibfk_3` (`time_slot_id`);

--
-- Constraints for table `section`
--

ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`course_id`) 
  REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `section_ibfk_2` FOREIGN KEY (`building`,`room_number`) 
  REFERENCES `classroom` (`building`, `room_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `section_ibfk_3` FOREIGN KEY (`time_slot_id`) 
  REFERENCES `time_slot` (`time_slot_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Dumping data for table `section`
--

INSERT INTO `section` 
  (`course_id`, `sec_id`, `semester`, `year`, `building`, `room_number`, `time_slot_id`) 
VALUES
  ('BIO101', 1, 'Spring', 2024, 'Science Building', 202, 6),
  ('CHEM101', 1, 'Fall', 2023, 'Science Building', 202, 5),
  ('CS101', 1, 'Fall', 2023, 'Main Building', 101, 1),
  ('EE202', 2, 'Spring', 2024, 'Engineering Building', 303, 2),
  ('ENG101', 1, 'Spring', 2024, 'Arts Building', 211, 8),
  ('HIST201', 1, 'Fall', 2023, 'Arts Building', 211, 7),
  ('MATH301', 1, 'Fall', 2023, 'Main Building', 101, 3),
  ('MGT301', 1, 'Fall', 2023, 'Admin Building', 102, 9),
  ('PHYS201', 1, 'Spring', 2024, 'Science Building', 202, 4),
  ('SPORT101', 1, 'Spring', 2024, 'Sports Complex', 105, 10);

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `ID` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  `tot_cred` int(11) DEFAULT NULL
);

--
-- Indexes for table `student`
--

ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `dept_name` (`dept_name`);

--
-- Constraints for table `student`
--

ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`dept_name`) 
  REFERENCES `department` (`dept_name`);

--
-- Dumping data for table `student`
--

INSERT INTO `student` 
  (`ID`, `name`, `dept_name`, `tot_cred`) 
VALUES
  ('S101', 'David', 'Physics', 25),
  ('S123', 'Alice', 'Computer Science', 60),
  ('S202', 'Emily', 'Chemistry', 35),
  ('S303', 'Frank', 'Biology', 20),
  ('S404', 'Grace', 'History', 30),
  ('S456', 'Bob', 'Electrical Engineering', 45),
  ('S505', 'Henry', 'English', 25),
  ('S606', 'Ivy', 'Management', 35),
  ('S707', 'Jack', 'Sports', 20),
  ('S789', 'Charlie', 'Mathematics', 30);

--
-- Table structure for table `takes`
--

CREATE TABLE `takes` (
  `ID` varchar(10) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `sec_id` int(11) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `year` int(11) NOT NULL,
  `grade` varchar(2) DEFAULT NULL
);

--
-- Indexes for table `takes`
--

ALTER TABLE `takes`
  ADD PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  ADD KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`);

--
-- Constraints for table `takes`
--

ALTER TABLE `takes`
  ADD CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`ID`) 
  REFERENCES `student` (`ID`),
  ADD CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`course_id`,`sec_id`,`semester`,`year`) 
  REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`);

--
-- Dumping data for table `takes`
--

INSERT INTO `takes` 
  (`ID`, `course_id`, `sec_id`, `semester`, `year`, `grade`) 
VALUES
  ('S101', 'PHYS201', 1, 'Spring', 2024, 'B'),
  ('S123', 'CS101', 1, 'Fall', 2023, 'A'),
  ('S202', 'CHEM101', 1, 'Fall', 2023, 'C+'),
  ('S303', 'BIO101', 1, 'Spring', 2024, 'A'),
  ('S404', 'HIST201', 1, 'Fall', 2023, 'B-'),
  ('S456', 'EE202', 2, 'Spring', 2024, 'B+'),
  ('S505', 'ENG101', 1, 'Spring', 2024, 'A'),
  ('S606', 'MGT301', 1, 'Fall', 2023, 'B+'),
  ('S707', 'SPORT101', 1, 'Spring', 2024, 'B+'),
  ('S789', 'MATH301', 1, 'Fall', 2023, 'A-');

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `ID` varchar(10) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `sec_id` int(11) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `year` int(11) NOT NULL
);

--
-- Indexes for table `teaches`
--

ALTER TABLE `teaches`
  ADD PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  ADD KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`);

--
-- Constraints for table `teaches`
--

ALTER TABLE `teaches`
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`ID`) 
  REFERENCES `instructor` (`ID`),
  ADD CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`course_id`,`sec_id`,`semester`,`year`) 
  REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`);

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` 
  (`ID`, `course_id`, `sec_id`, `semester`, `year`) 
VALUES
  ('BI303', 'BIO101', 1, 'Spring', 2024),
  ('CH202', 'CHEM101', 1, 'Fall', 2023),
  ('E456', 'EE202', 2, 'Spring', 2024),
  ('EN505', 'ENG101', 1, 'Spring', 2024),
  ('HI404', 'HIST201', 1, 'Fall', 2023),
  ('M789', 'MATH301', 1, 'Fall', 2023),
  ('MG606', 'MGT301', 1, 'Fall', 2023),
  ('P123', 'CS101', 1, 'Fall', 2023),
  ('PH101', 'PHYS201', 1, 'Spring', 2024),
  ('SP707', 'SPORT101', 1, 'Spring', 2024);

--
-- Table structure for table `time_slot`
--

CREATE TABLE `time_slot` (
  `time_slot_id` int(11) NOT NULL,
  `day` varchar(10) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
);

--
-- Indexes for table `time_slot`
--

ALTER TABLE `time_slot`
  ADD PRIMARY KEY (`time_slot_id`);

--
-- Dumping data for table `time_slot`
--

INSERT INTO `time_slot` 
  (`time_slot_id`, `day`, `start_time`, `end_time`) 
VALUES
  (1, 'Monday', '09:00:00', '10:00:00'),
  (2, 'Wednesday', '11:00:00', '12:00:00'),
  (3, 'Friday', '13:00:00', '14:00:00'),
  (4, 'Tuesday', '09:00:00', '10:00:00'),
  (5, 'Thursday', '11:00:00', '12:00:00'),
  (6, 'Friday', '15:00:00', '16:00:00'),
  (7, 'Monday', '11:00:00', '12:00:00'),
  (8, 'Wednesday', '13:00:00', '14:00:00'),
  (9, 'Friday', '09:00:00', '10:00:00'),
  (10, 'Tuesday', '11:00:00', '12:00:00');

--
-- Table structure for table `grade_points`
--

CREATE TABLE `grade_points` (
 `grade` varchar(50) NOT NULL,
 `points` decimal(4,2) NOT NULL
);

--
-- Dumping data for table `grade_points`
--

INSERT INTO `grade_points`
  (`grade`, `points`)
VALUES 
  ('A+','4'),
  ('A-','3.7'),
  ('B+','3.3'),
  ('B-','3'),
  ('C+','2.75');

Q-2.1 'Find the total grade points earned by the student with ID 'S101', across all courses taken by the student ?'

SELECT ID,tot_cred AS Total_GP 
  FROM `student` 
  WHERE ID = 'S101';

Q-2.2 'Find the grade point average (GPA) for the above student, that is, the total grade points divided by the total credits for the associated courses ?'

SELECT std.ID,
       std.name,
       CASE
           WHEN SUM(crs.credits) = 0 THEN 0
           ELSE SUM(gp.points * crs.credits) / SUM(crs.credits)
       END AS GP
FROM student std
  LEFT JOIN takes tk ON std.ID = tk.ID
  LEFT JOIN grade_points gp ON tk.grade = gp.grade
  LEFT JOIN course crs ON tk.course_id = crs.course_id
GROUP BY std.ID, std.name
HAVING std.ID = 'S101';

Q-2.3 'Find the ID and the grade-point average of each student ?'

SELECT ID, AVG(points) AS 'Average GPA'
  FROM `takes` 
    JOIN grade_points AS GP ON takes.grade = GP.grade
  GROUP BY ID;

Q-2.4 'Increase the salary of instructor in the Comp. Sci. department where salary is less then 5000 rs by 10% ?'

UPDATE `instructor` 
  SET `salary`= (salary + (salary * 0.1))
  WHERE dept_name = 'Computer Science' AND salary < 5000;

Q-2.5 'Delete all courses that have never been offered (i.e., do not occur in the section relation) ?'

DELETE FROM course
WHERE course.course_id IN (
  SELECT course.course_id FROM course 
  LEFT JOIN section ON course.course_id = section.course_id 
  WHERE section.course_id IS NULL
);

Q-2.6 'Insert every student whose total credit attribute is greater than 100 as an instructor in the same department, with a salary of $10,000 ?'

INSERT INTO `instructor`(`ID`, `name`, `dept_name`, `salary`)
  SELECT `ID`, `name`, `dept_name`,'10000'
  FROM `student`
  WHERE tot_cred > 100;

Q-2.7 'Find the titles of courses in the Comp. Sci. department that have 3 credits ?'

SELECT title,credits 
  FROM course
  WHERE dept_name = 'Computer Science' AND credits = 3;

Q-2.8 'Find the IDs of all students who were taught by an instructor named Einstein; make sure there are no duplicates in the result ?'

SELECT student.ID AS Std_ID, 
       student.Name AS Student_Name, 
       instructor.Name AS Instructor_Name 
  FROM student 
    LEFT JOIN instructor 
    ON student.dept_name = instructor.dept_name
    WHERE instructor.name = 'Prof. Biology';

Q-2.9 'Find the highest salary of any instructor ?'

SELECT Format(MAX(salary),'N3') AS "Highest Salary" FROM instructor;

Q-2.10 'Find all instructors earning the highest salary (there may be more than one with the same salary) ?'

SELECT name,salary 
  FROM instructor 
  WHERE salary = (
    SELECT MAX(salary) 
    FROM instructor
  );

Q-2.11 'Find the enrollment of each section that was offered in Fall 2023 ?'

SELECT sec_id,`year`, COUNT(ID) AS enrollment
  FROM takes
  WHERE semester = 'Fall' AND year = 2023
  GROUP BY sec_id;

Q-2.12 'Find the maximum enrollment, across all sections, in Fall 2023 ?'

SELECT MAX(enrollment_count) AS max_enrollment
FROM (
  SELECT COUNT(s_id) AS enrollment_count
  FROM takes
  WHERE semester = 'Fall' AND year = 2023
  GROUP BY sec_id
) AS section_enrollments;

Q-2.13 'Find the sections that had the maximum enrollment in Fall 2023 ?'

SELECT course_id, sec_id, semester, year, COUNT(ID) AS enrollment
FROM takes
WHERE semester = 'Fall' AND year = 2023
GROUP BY course_id, sec_id, semester, year
HAVING COUNT(ID) = (SELECT MAX(enrollment_count)
  FROM (SELECT course_id, sec_id, semester, year, COUNT(ID) AS enrollment_count
    FROM takes
    WHERE semester = 'Fall' AND year = 2023
    GROUP BY course_id, sec_id, semester, year) AS max_enrollment);

Q-2.14 'Increase the salary of each instructor in the Comp. Sci. department by 10% ?'

UPDATE `instructor` 
  SET `salary`= Salary * 1.1
    WHERE dept_name = 'Computer Science';
