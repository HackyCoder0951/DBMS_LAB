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