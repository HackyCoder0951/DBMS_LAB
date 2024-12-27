--
-- Database: `mca_assign3`
--

CREATE DATABASE mca_assign3;

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_number` int(25) NOT NULL,
  `branch_name` varchar(200) DEFAULT NULL,
  `balance` float(10,2) NOT NULL
);

--
-- Indexes for table `account`
--

ALTER TABLE `account`
  ADD PRIMARY KEY (`account_number`);

--
-- Dumping data for table `account`
--

INSERT INTO `account` 
  (`account_number`, `branch_name`, `balance`) 
VALUES
  (1234, 'SBI Rajasthan', 100000.00),
  (2164, 'SBI Haryana', 300000.19),
  (4272, 'SBI Harrison', 400000.31),
  (4321, 'SBI Punjab', 200000.50),
  (6254, 'SBI Maharastra', 500000.19),
  (7264, 'SBI Rajasthan', 600000.31),
  (7265, 'SBI Rajasthan', 80000.50);

--
-- Table structure for table `borrower`
--

CREATE TABLE `borrower` (
  `customer_id` int(10) NOT NULL,
  `loan_number` int(25) NOT NULL
);

--
-- Indexes for table `borrower`
--

ALTER TABLE `borrower`
  ADD PRIMARY KEY (`customer_id`,`loan_number`);

--
-- Dumping data for table `borrower`
--

INSERT INTO `borrower` 
  (`customer_id`, `loan_number`) 
VALUES
  (12345, 202402),
  (34259, 202404),
  (42629, 202403),
  (54321, 202401);

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_name` varchar(150) NOT NULL,
  `branch_city` varchar(150) DEFAULT NULL,
  `assets` varchar(150) NOT NULL
);

--
-- Indexes for table `branch`
--

ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_name`);

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` 
  (`branch_name`, `branch_city`, `assets`)
 VALUES
  ('SBI Gujarat', 'Surat', '4000000'),
  ('SBI Harrison', 'Harrison', '5000000'),
  ('SBI Haryana', 'Delhi', '3000000'),
  ('SBI Maharastra', 'Mumbai', '5000000'),
  ('SBI Punjab', 'Chandigarh', '2000000'),
  ('SBI Rajasthan', 'Udaipur', '1000000');

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(150) DEFAULT NULL,
  `customer_street` varchar(150) DEFAULT NULL,
  `customer_city` varchar(150) DEFAULT NULL
);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` 
  (`customer_id`, `customer_name`, `customer_street`, `customer_city`) 
VALUES
  (12345, 'Rahul', 'st.no.2', 'Udaipur'),
  (34259, 'Rohit', 'st.no.4', 'Mumbai'),
  (36537, 'Harish', 'st.no.6', 'Harrison'),
  (42629, 'Rohan', 'st.no.5', 'Chandigarh'),
  (54321, 'Mohan', 'st.no.2', 'Udaipur'),
  (67452, 'Sohan', 'st.no.3', 'Delhi');

--
-- Table structure for table `depositor`
--

CREATE TABLE `depositor` (
  `customer_id` int(10) NOT NULL,
  `account_number` int(25) NOT NULL
);

--
-- Indexes for table `depositor`
--

ALTER TABLE `depositor`
  ADD PRIMARY KEY (`customer_id`,`account_number`);

--
-- Dumping data for table `depositor`
--

INSERT INTO `depositor` 
  (`customer_id`, `account_number`) 
VALUES
  (12345, 1234),
  (34259, 6254),
  (34259, 7265),
  (36537, 4272),
  (42629, 4321),
  (54321, 7264),
  (67452, 2164);

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan_number` int(25) NOT NULL,
  `branch_name` varchar(150) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL
);

--
-- Indexes for table `loan`
--

ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_number`);

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` 
  (`loan_number`, `branch_name`, `amount`) 
VALUES
  (202401, 'SBI Rajasthan', 10005.00),
  (202402, 'SBI Rajasthan', 20520.50),
  (202403, 'SBI Punjab', 30525.25),
  (202404, 'SBI Maharastra', 50352.60);

--
-- Constraints for table `account`
--

ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`branch_name`) 
  REFERENCES `branch` (`branch_name`);

--
-- Constraints for table `borrower`
--

ALTER TABLE `borrower`
  ADD CONSTRAINT `borrower_ibfk_1` FOREIGN KEY (`loan_number`) 
  REFERENCES `loan` (`loan_number`),
  ADD CONSTRAINT `borrower_ibfk_2` FOREIGN KEY (`customer_id`) 
  REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `depositor`
--

ALTER TABLE `depositor`
  ADD CONSTRAINT `depositor_ibfk_1` FOREIGN KEY (`account_number`) 
  REFERENCES `account` (`account_number`),
  ADD CONSTRAINT `depositor_ibfk_2` FOREIGN KEY (`customer_id`) 
  REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `loan`
--

ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`branch_name`) 
  REFERENCES `branch` (`branch_name`);

Q-3.1 'Find the ID of each customer of the bank who has an account but not a loan ?'

SELECT depositor.customer_id FROM depositor
  LEFT JOIN borrower 
    ON depositor.Customer_id = borrower.Customer_id
  WHERE borrower.Customer_id IS NULL;

SELECT customer_id 
  FROM depositor
  WHERE customer_id NOT IN ( SELECT Customer_id FROM borrower );

Q-3.2 'Find the ID of each customer who lives on the same street and in the same city as customer 12345 ?'

SELECT customer_id
  FROM customer
  WHERE customer_street = (
    SELECT customer_street FROM customer 
      WHERE customer_id = '12345')
  AND customer_city = (
    SELECT customer_city FROM customer 
      WHERE customer_id = '12345')
  AND customer_id != '12345';

Q-3.3 'Find the name of each branch that has at least one customer who has an account in the bank and who lives in “Harrison” ?'

SELECT account.branch_name 
FROM (
  (depositor LEFT JOIN customer 
    ON depositor.Customer_id = customer.Customer_id)
  LEFT JOIN account 
    ON depositor.account_number = account.account_number)
WHERE customer_city = 'Harrison';*/