--
-- Database: `mca_assign5`
--

CREATE DATABASE mca_assign5;

--
-- Table structure for table `accident`
--

CREATE TABLE `accident` (
  `report_number` int(11) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL
);

--
-- Indexes for table `accident`
--

ALTER TABLE `accident`
  ADD PRIMARY KEY (`report_number`);

--
-- Dumping data for table `accident`
--

INSERT INTO `accident` 
  (`report_number`, `year`, `location`) 
VALUES
  (101, 2010, 'Gujarat'),
  (102, 2010, 'Pune'),
  (103, 2012, 'Bangalore'),
  (104, 2014, 'Mumbai'),
  (105, 2017, 'Chennai'),
  (106, 2017, 'Delhi'),
  (107, 2017, 'Kolkata');


--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `license_plate` varchar(50) NOT NULL,
  `model` varchar(30) DEFAULT NULL,
  `year` year(4) DEFAULT NULL
);

--
-- Indexes for table `car`
--

ALTER TABLE `car`
  ADD PRIMARY KEY (`license_plate`);

--
-- Dumping data for table `car`
--

INSERT INTO `car` 
  (`license_plate`, `model`, `year`) 
VALUES
  ('DL07', 'Thar', 2018),
  ('GJ45', 'Verna', 2014),
  ('MH23', 'Omni', 2010),
  ('MH57', 'Creta', 2010),
  ('RJ27', 'Audi', 2016),
  ('WB35', 'Wagnar', 2017);


--
-- Table structure for table `owns`
--

CREATE TABLE `owns` (
  `driver_id` int(11) NOT NULL,
  `license_plate` varchar(50) NOT NULL
);

--
-- Indexes for table `owns`
--

ALTER TABLE `owns`
  ADD PRIMARY KEY (`driver_id`,`license_plate`),
  ADD KEY `license_plate` (`license_plate`);

--
-- Constraints for table `owns`
--
ALTER TABLE `owns`
  ADD CONSTRAINT `owns_ibfk_1` FOREIGN KEY (`driver_id`) 
  REFERENCES `person` (`driver_id`),
  ADD CONSTRAINT `owns_ibfk_2` FOREIGN KEY (`license_plate`) 
  REFERENCES `car` (`license_plate`) ON DELETE CASCADE;

--
-- Dumping data for table `owns`
--

INSERT INTO `owns` 
  (`driver_id`, `license_plate`) 
VALUES
  (12345, 'DL07'),
  (12345, 'MH23'),
  (12345, 'WB35'),
  (14521, 'RJ27'),
  (14745, 'MH57'),
  (16945, 'GJ45'),
  (16945, 'WB35');

--
-- Table structure for table `participated`
--

CREATE TABLE `participated` (
  `report_number` int(11) NOT NULL,
  `license_plate` varchar(50) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `damage_amount` int(11) DEFAULT NULL
);

--
-- Indexes for table `participated`
--

ALTER TABLE `participated`
  ADD PRIMARY KEY (`report_number`,`license_plate`),
  ADD KEY `license_plate` (`license_plate`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Constraints for table `participated`
--

ALTER TABLE `participated`
  ADD CONSTRAINT `participated_ibfk_1` FOREIGN KEY (`report_number`) 
  REFERENCES `accident` (`report_number`),
  ADD CONSTRAINT `participated_ibfk_2` FOREIGN KEY (`license_plate`) 
  REFERENCES `car` (`license_plate`) ON DELETE CASCADE,
  ADD CONSTRAINT `participated_ibfk_3` FOREIGN KEY (`driver_id`) 
  REFERENCES `person` (`driver_id`);

--
-- Dumping data for table `participated`
--

INSERT INTO `participated` 
  (`report_number`, `license_plate`, `driver_id`, `damage_amount`) 
VALUES
  (101, 'WB35', 16945, 20000),
  (102, 'DL07', 15345, 10000),
  (103, 'MH57', 14745, 62000),
  (104, 'DL07', 12345, 15000),
  (105, 'MH23', 12345, 16000),
  (106, 'GJ45', 16945, 25000),
  (107, 'GJ45', 14521, 45000);

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `driver_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL
);

--
-- Indexes for table `person`
--

ALTER TABLE `person`
  ADD PRIMARY KEY (`driver_id`);

--
-- Dumping data for table `person`
--

INSERT INTO `person` 
  (`driver_id`, `name`, `address`)
VALUES
  (12345, 'Rahul', 'Chetak Circle'),
  (14521, 'Manoj', 'M.G.Road'),
  (14745, 'Rohit', 'Fatehpura Circle'),
  (15345, 'Mohit', 'Shastri Circle'),
  (16945, 'Hardik', 'Mali Colony'),
  (18345, 'Sumit', 'Delhi Gate');

Q-5.1 'Find the total number of people who owned cars that were involved in accidents in 2017 ?'

SELECT COUNT(driver_id) AS 'Total Number of People'
  FROM ((`participated` 
    LEFT JOIN `owns` 
      USING (`driver_id`)) 
    LEFT JOIN `accident` 
      USING(`report_number`))
  WHERE `Year` = 2017;

Q-5.2 'Delete all year-2010 cars belonging to the person whose ID is 12345 ?'

DELETE car FROM car
  JOIN owns ON car.license_plate = owns.license_plate
WHERE `YEAR`= 2010 AND driver_id = 12345;