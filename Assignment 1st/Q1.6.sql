--
-- Database: `mca_assign6`
--

CREATE DATABASE mca_assign6;

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_name` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL
);

--
-- Indexes for table `company`
--

ALTER TABLE `company`
  ADD PRIMARY KEY (`company_name`,`city`);

--
-- Dumping data for table `company`
--

INSERT INTO `company` 
  (`company_name`, `city`) 
VALUES
  ('Big Bank Company', 'Kolkata'),
  ('First Bank Company', 'Delhi'),
  ('First Bank Company', 'Udaipur'),
  ('Medium Bank Company', 'Bihar'),
  ('Medium Bank Company', 'Delhi'),
  ('Small Bank Company', 'Bihar'),
  ('Small Bank Company', 'Delhi');

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `person_name` varchar(30) NOT NULL,
  `street` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL
);

--
-- Indexes for table `employee`
--

ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` 
  (`emp_id`, `person_name`, `street`, `city`) 
VALUES
  (101, 'Mohit', 'st.no.1', 'Udaipur'),
  (102, 'Rohit', 'st.no.2', 'Udaipur'),
  (103, 'Sumit', 'st.no.3', 'Kolkata'),
  (104, 'Rahul', 'st.no.4', 'Kolkata'),
  (105, 'Hardik', 'st.no.5', 'Delhi'),
  (106, 'Ajay', 'st.no.6', 'Bihar');

--
-- Table structure for table `manages`
--

CREATE TABLE `manages` (
  `emp_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL
);

--
-- Indexes for table `manages`
--

ALTER TABLE `manages`
  ADD PRIMARY KEY (`emp_id`,`manager_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Constraints for table `manages`
--

ALTER TABLE `manages`
  ADD CONSTRAINT `manages_ibfk_1` FOREIGN KEY (`emp_id`) 
  REFERENCES `employee` (`emp_id`),
  ADD CONSTRAINT `manages_ibfk_2` FOREIGN KEY (`manager_id`) 
  REFERENCES `employee` (`emp_id`);

--
-- Dumping data for table `manages`
--

INSERT INTO `manages` 
  (`emp_id`, `manager_id`) 
VALUES
  (101, 106),
  (102, 106),
  (103, 106),
  (104, 106),
  (105, 106);

--
-- Table structure for table `works`
--

CREATE TABLE `works` (
  `emp_id` int(11) NOT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  `salary` int(11) NOT NULL
);

--
-- Indexes for table `works`
--

ALTER TABLE `works`
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `company_name` (`company_name`);

--
-- Constraints for table `works`
--

ALTER TABLE `works`
  ADD CONSTRAINT `works_ibfk_1` FOREIGN KEY (`emp_id`) 
  REFERENCES `employee` (`emp_id`),
  ADD CONSTRAINT `works_ibfk_2` FOREIGN KEY (`company_name`) 
  REFERENCES `company` (`company_name`);

--
-- Dumping data for table `works`
--

INSERT INTO `works` 
  (`emp_id`, `company_name`, `salary`) 
VALUES
  (101, 'First Bank Company', 12000),
  (102, 'First Bank Company', 9000),
  (103, 'Big Bank Company', 10000),
  (104, 'Big Bank Company', 10500),
  (105, 'Small Bank Company', 10000),
  (106, 'Medium Bank Company', 20000);

Q-6.1 'Find the ID, name, and city of residence of each employee who works for “First Bank Corporation” ?'

Q-6.2 'Find the ID, name, and city of residence of each employee who works for “First Bank Corporation” and earns more than $10000 ?'

Q-6.3 'Find the ID of each employee who does not work for “First Bank Corporation” ?'

Q-6.4 'Find the ID of each employee who earns more than every employee of “Small Bank Corporation” ?'

Q-6.5 'Assume that companies may be located in several cities. Find the name of each company that is located in every city in which “Small Bank Corporation” is located ?'

Q-6.6 'Find the name of the company that has the most employees (or companies, in the case where there is a tie for the most) ?'

Q-6.7 ' Find the name of each company whose employees earn a higher salary, on average, than the average salary at “First Bank Corporation” ?'