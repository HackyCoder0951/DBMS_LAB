--
-- Database: `mca_assign4`
--

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_Id` int(11) NOT NULL,
  `Product_Name` varchar(100) DEFAULT NULL,
  `Product_category` varchar(50) DEFAULT NULL
);

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_Id`, `Product_Name`, `Product_category`) 
VALUES
(12, 'Bike ABC', 'Road Bike'),
(13, 'Bike DEF', 'Mountain Bike'),
(14, 'Bike GHI', 'Road Bike'),
(15, 'Bike JKL', 'Touring Bike');

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `Product_Id` int(11) NOT NULL,
  `Customer` varchar(100) DEFAULT NULL,
  `Sales_Amount` int(11) DEFAULT NULL
);

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`Product_Id`, `Customer`, `Sales_Amount`) 
VALUES
(12, 'Joe', 1000),
(13, 'Tom', 2000),
(14, 'Joe', 1500),
(12, 'Bill', 1000);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_Id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD KEY `Product_Id` (`Product_Id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`Product_Id`) 
  REFERENCES `product` (`Product_Id`);
