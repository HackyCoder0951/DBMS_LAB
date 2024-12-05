CREATE TABLE classroom (
    building VARCHAR(20),
    room_number INT,
    capacity INT,
    PRIMARY KEY (building, room_number)
);

CREATE TABLE department (
    dept_name VARCHAR(50) PRIMARY KEY,
    building VARCHAR(20),
    budget DECIMAL(10,2),
    FOREIGN KEY (building) REFERENCES classroom(building)
);

CREATE TABLE course (
    course_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(50),
    dept_name VARCHAR(50),
    credits INT,
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

CREATE TABLE instructor (
    ID VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    dept_name VARCHAR(50),
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

CREATE TABLE section (
    course_id VARCHAR(10),
    sec_id INT,
    semester VARCHAR(20),
    year INT,
    building VARCHAR(20),
    room_number INT,
    time_slot_id INT,
    PRIMARY KEY (course_id, sec_id, semester, year),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (building, room_number) REFERENCES classroom(building, room_number)
);

CREATE TABLE teaches (
    ID VARCHAR(10),
    course_id VARCHAR(10),
    sec_id INT,
    semester VARCHAR(20),
    year INT,
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (ID) REFERENCES instructor(ID),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year)
);

CREATE TABLE student (
    ID VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    dept_name VARCHAR(50),
    tot_cred INT,
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

CREATE TABLE takes (
    ID VARCHAR(10),
    course_id VARCHAR(10),
    sec_id INT,
    semester VARCHAR(20),
    year INT,
    grade VARCHAR(2),
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (ID) REFERENCES student(ID),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year)
);

CREATE TABLE advisor (
    sID VARCHAR(10),
    iID VARCHAR(10),
    PRIMARY KEY (sID, iID),
    FOREIGN KEY (sID) REFERENCES student(ID),
    FOREIGN KEY (iID) REFERENCES instructor(ID)
);

CREATE TABLE time_slot (
    time_slot_id INT PRIMARY KEY,
    day VARCHAR(10),
    start_time TIME,
    end_time TIME
);

CREATE TABLE prereq (
    course_id VARCHAR(10),
    prereq_id VARCHAR(10),
    PRIMARY KEY (course_id, prereq_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE grade_points (
    grade VARCHAR(2) PRIMARY KEY,
    points DECIMAL(3,1)
);

ALTER TABLE `section` ADD CONSTRAINT `section_ibfk_3` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slot`(`time_slot_id`) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO advisor (sID, iID)
VALUES ('S123', 'P123'),
       ('S456', 'E456'),
       ('S789', 'M789'),
       ('S101', 'PH101'),
       ('S202', 'CH202'),
       ('S303', 'BI303'),
       ('S404', 'HI404'),
       ('S505', 'EN505'),
       ('S606', 'MG606'),
       ('S707', 'SP707');

INSERT INTO classroom (building, room_number, capacity)
VALUES ('Main Building', 101, 50),
       ('Science Building', 202, 30),
       ('Engineering Building', 303, 40),
       ('Library Building', 110, 20),
       ('Arts Building', 211, 35),
       ('Sports Complex', 105, 100),
       ('Admin Building', 102, 25),
       ('Hostel Building', 103, 50),
       ('Cafeteria Building', 104, 100),
       ('Computer Center', 201, 50);

INSERT INTO department (dept_name, building, budget)
VALUES ('Computer Science', 'Main Building', 1000000),
       ('Electrical Engineering', 'Engineering Building', 800000),
       ('Mathematics', 'Main Building', 500000),
       ('Physics', 'Science Building', 400000),
       ('Chemistry', 'Science Building', 350000),
       ('Biology', 'Science Building', 300000),
       ('History', 'Arts Building', 200000),
       ('English', 'Arts Building', 150000),
       ('Management', 'Admin Building', 250000),
       ('Sports', 'Sports Complex', 100000);


INSERT INTO course (course_id, title, dept_name, credits)
VALUES ('CS101', 'Introduction to Programming', 'Computer Science', 3),
       ('EE202', 'Circuit Analysis', 'Electrical Engineering', 4),
       ('MATH301', 'Calculus III', 'Mathematics', 3),
       ('PHYS201', 'Mechanics', 'Physics', 3),
       ('CHEM101', 'General Chemistry', 'Chemistry', 4),
       ('BIO101', 'Introduction to Biology', 'Biology', 3),
       ('HIST201', 'Modern World History', 'History', 3),
       ('ENG101', 'English Composition', 'English', 3),
       ('MGT301', 'Principles of Management', 'Management', 3),
       ('SPORT101', 'Physical Fitness', 'Sports', 2);

INSERT INTO instructor (ID, name, dept_name, salary)
VALUES ('P123', 'Prof. Patel', 'Computer Science', 80000),
       ('E456', 'Prof. Engineer', 'Electrical Engineering', 75000),
       ('M789', 'Prof. Math', 'Mathematics', 60000),
       ('PH101', 'Prof. Physics', 'Physics', 55000),
       ('CH202', 'Prof. Chemistry', 'Chemistry', 50000),
       ('BI303', 'Prof. Biology', 'Biology', 45000),
       ('HI404', 'Prof. History', 'History', 40000),
       ('EN505', 'Prof. English', 'English', 35000),
       ('MG606', 'Prof. Management', 'Management', 50000),
       ('SP707', 'Coach Sports', 'Sports', 30000);

INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id)
VALUES ('CS101', 1, 'Fall', 2023, 'Main Building', 101, 1),
       ('EE202', 2, 'Spring', 2024, 'Engineering Building', 303, 2),
       ('MATH301', 1, 'Fall', 2023, 'Main Building', 202, 3),
       ('PHYS201', 1, 'Spring', 2024, 'Science Building', 202, 4),
       ('CHEM101', 1, 'Fall', 2023, 'Science Building', 202, 5),
       ('BIO101', 1, 'Spring', 2024, 'Science Building', 202, 6),
       ('HIST201', 1, 'Fall', 2023, 'Arts Building', 211, 7),
       ('ENG101', 1, 'Spring', 2024, 'Arts Building', 211, 8),
       ('MGT301', 1, 'Fall', 2023, 'Admin Building', 102, 9),
       ('SPORT101', 1, 'Spring', 2024, 'Sports Complex', 105, 10);

INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) 
VALUES  ('CS101', 1, 'Fall', 2023, 'Main Building', 101, 1), 
        ('EE202', 2, 'Spring', 2024, 'Engineering Building', 303, 2), 
        ('MATH301', 1, 'Fall', 2023, ' ', NULL, NULL), 
        ('PHYS201', 1, 'Spring', 2024, 'Science Building', 202, 4), 
        ('CHEM101', 1, 'Fall', 2023, ' ', NULL, NULL), 
        ('BIO101', 1, 'Spring', 2024, ' ', NULL, NULL), 
        ('HIST201', 1, 'Fall', 2023, 'Arts Building', 211, 7),
        ('ENG101', 1, 'Spring', 2024, ' ', NULL, NULL), 
        ('MGT301', 1, 'Fall', 2023, 'Admin Building', 102, 9), 
        ('SPORT101', 1, 'Spring', 2024, 'Sports Complex', 105, 10);

INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id)
VALUES ('BIO101', 1, 'Spring', 2024, ' ', NULL, NULL);

INSERT INTO teaches (ID, course_id, sec_id, semester, year)
VALUES ('P123', 'CS101', 1, 'Fall', 2023),
       ('E456', 'EE202', 2, 'Spring', 2024),
       ('M789', 'MATH301', 1, 'Fall', 2023),
       ('PH101', 'PHYS201', 1, 'Spring', 2024),
       ('CH202', 'CHEM101', 1, 'Fall', 2023),
       ('BI303', 'BIO101', 1, 'Spring', 2024),
       ('HI404', 'HIST201', 1, 'Fall', 2023),
       ('EN505', 'ENG101', 1, 'Spring', 2024),
       ('MG606', 'MGT301', 1, 'Fall', 2023),
       ('SP707', 'SPORT101', 1, 'Spring', 2024);

INSERT INTO student (ID, name, dept_name, tot_cred)
VALUES ('S123', 'Alice', 'Computer Science', 60),
       ('S456', 'Bob', 'Electrical Engineering', 45),
       ('S789', 'Charlie', 'Mathematics', 30),
       ('S101', 'David', 'Physics', 25),
       ('S202', 'Emily', 'Chemistry', 35),
       ('S303', 'Frank', 'Biology', 20),
       ('S404', 'Grace', 'History', 30),
       ('S505', 'Henry', 'English', 25),
       ('S606', 'Ivy', 'Management', 35),
       ('S707', 'Jack', 'Sports', 20);

INSERT INTO takes (ID, course_id, sec_id, semester, year, grade)
VALUES ('S123', 'CS101', 1, 'Fall', 2023, 'A'),
       ('S456', 'EE202', 2, 'Spring', 2024, 'B+'),
       ('S789', 'MATH301', 1, 'Fall', 2023, 'A-'),
       ('S101', 'PHYS201', 1, 'Spring', 2024, 'B'),
       ('S202', 'CHEM101', 1, 'Fall', 2023, 'C+'),
       ('S303', 'BIO101', 1, 'Spring', 2024, 'A'),
       ('S404', 'HIST201', 1, 'Fall', 2023, 'B-'),
       ('S505', 'ENG101', 1, 'Spring', 2024, 'A'),
       ('S606', 'MGT301', 1, 'Fall', 2023, 'B+'),
       ('S707', 'SPORT101', 1, 'Spring',2024,'B+');

INSERT INTO time_slot (time_slot_id, day, start_time, end_time)
VALUES (1, 'Monday', '09:00:00', '10:00:00'),
       (2, 'Wednesday', '11:00:00', '12:00:00'),
       (3, 'Friday', '13:00:00', '14:00:00'),
       (4, 'Tuesday', '09:00:00', '10:00:00'),
       (5, 'Thursday', '11:00:00', '12:00:00'),
       (6, 'Friday', '15:00:00', '16:00:00'),
       (7, 'Monday', '11:00:00', '12:00:00'),
       (8, 'Wednesday', '13:00:00', '14:00:00'),
       (9, 'Friday', '09:00:00', '10:00:00'),
       (10, 'Tuesday', '11:00:00', '12:00:00');

INSERT INTO prereq (course_id, prereq_id)
VALUES ('EE202', 'CS101'),
       ('MATH301', 'MATH201'),
       ('PHYS201', 'PHYS101'),
       ('CHEM101', 'CHEM100'),
       ('BIO101', 'BIO100'),
       ('HIST201', 'HIST101'),
       ('ENG101', 'ENG100'),
       ('MGT301', 'MGT201'),
       ('SPORT101', 'SPORT100'),
       ('CS101', 'CS201');

ALTER TABLE `section` DROP FOREIGN KEY `section_ibfk_1`; ALTER TABLE `section` ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course`(`course_id`) ON DELETE CASCADE ON UPDATE CASCADE; ALTER TABLE `section` DROP FOREIGN KEY `section_ibfk_2`; ALTER TABLE `section` ADD CONSTRAINT `section_ibfk_2` FOREIGN KEY (`building`, `room_number`) REFERENCES `classroom`(`building`, `room_number`) ON DELETE CASCADE ON UPDATE CASCADE;
