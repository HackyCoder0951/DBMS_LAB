--
-- Database: `mca_assign3`
--

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_number` int(25) NOT NULL,
  `branch_name` varchar(200) DEFAULT NULL,
  `balance` float(10,2) DEFAULT NULL
);

--
-- Table structure for table `borrower`
--

CREATE TABLE `borrower` (
  `ID` int(10) NOT NULL,
  `loan_number` int(25) DEFAULT NULL
);

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_name` varchar(150) DEFAULT NULL,
  `branch_city` varchar(150) DEFAULT NULL,
  `assets` varchar(150) DEFAULT NULL
);
--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(10) NOT NULL,
  `customer_name` varchar(150) DEFAULT NULL,
  `cusotmer_street` varchar(150) DEFAULT NULL,
  `cusotmer_city` varchar(150) DEFAULT NULL
);

--
-- Table structure for table `depositor`
--

CREATE TABLE `depositor` (
  `ID` int(10) NOT NULL,
  `account_number` int(25) DEFAULT NULL
);

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan_number` int(25) NOT NULL,
  `branch_name` varchar(150) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL
);
COMMIT;
