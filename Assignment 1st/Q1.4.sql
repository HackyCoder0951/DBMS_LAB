--
-- Database: `mca_assign4`
--

CREATE DATABASE mca_assign4;

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_Id` int(11) NOT NULL,
  `Product_Name` varchar(100) DEFAULT NULL,
  `Product_category` varchar(50) DEFAULT NULL
);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_Id`);

--
-- Dumping data for table `product`
--

INSERT INTO `product` 
  (`Product_Id`, `Product_Name`, `Product_category`) 
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
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD KEY `Product_Id` (`Product_Id`);

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` 
  (`Product_Id`, `Customer`, `Sales_Amount`) 
VALUES
  (12, 'Joe', 1000),
  (13, 'Tom', 2000),
  (14, 'Joe', 1500),
  (12, 'Bill', 1000);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`Product_Id`) 
  REFERENCES `product` (`Product_Id`);


Q-4.1 'Write a SQL statement that returns the distinct list of product categories from the Product table ?'

SELECT DISTINCT product_category
  FROM product;

Q-4.2 'Write a SQL statement that returns the total record count from the Sales table ?'

SELECT Count(product_id) AS 'Total Records'
  FROM sales;

Q-4.3 'Write a SQL statement that returns the Sum of Sales Amount grouped by Product Category having sales greater than 1500 ?'

SELECT product_category,SUM(Sales_amount)
  FROM product 
    LEFT JOIN sales 
      USING (Product_id)
    GROUP BY Product_category
  Having SUM(sales_amount) > 1500;

Q-4.4 'Write a SQL Statement that returns a list of products that do not appear the Sales table ?'

SELECT product.product_id 
  FROM product
    LEFT JOIN Sales 
      USING (product_id)
  WHERE sales.product_id IS NULL;