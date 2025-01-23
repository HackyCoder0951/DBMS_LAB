-- Create Database 'mca_assign2.3'

CREATE DATABASE `mca_assign2.4`;

-- Select Database 'mca_assign2.4'

USE `mca_assign2.4`;

-- Create Table 'Products'
CREATE TABLE Products (
    ProductID INT(10) NOT NULL,
    ProductName VARCHAR(255) NOT NULL,
    Category VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT(10) NOT NULL,
    PRIMARY KEY(ProductID)
);

INSERT INTO Products 
    (ProductID, ProductName, Category, Price, StockQuantity) 
VALUES
    (1, 'Laptop', 'Electronics', 999.99, 50),
    (2, 'Smartphone', 'Electronics', 699.99, 100),
    (3, 'Headphones', 'Accessories', 49.99, 200),
    (4, 'Backpack', 'Accessories', 39.99, 150),
    (5, 'Monitor', 'Electronics', 199.99, 75);

-- Create Table 'Customers'
CREATE TABLE Customers (
    CustomerID INT(10) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    RegistrationDate DATE NOT NULL,
    PRIMARY KEY(CustomerID)
);

INSERT INTO Customers 
    (CustomerID, Name, Email, RegistrationDate) 
VALUES
    (1, 'John Doe', 'john.doe@example.com', '2022-01-15'),
    (2, 'Jane Smith', 'jane.smith@example.com', '2023-03-10'),
    (3, 'Alice Brown', 'alice.brown@example.com', '2023-07-20'),
    (4, 'Bob Johnson', 'bob.johnson@example.com', '2023-11-05'),
    (5, 'Emma Davis', 'emma.davis@example.com', '2024-01-12');

-- Create Table 'Orders'
CREATE TABLE Orders (
    OrderID INT(10) NOT NULL,
    CustomerID INT(10) NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(OrderID)
);

INSERT INTO Orders 
    (OrderID, CustomerID, OrderDate, TotalAmount) 
VALUES
    (1, 1, '2024-06-15', 1499.97),
    (2, 2, '2024-07-01', 739.98),
    (3, 3, '2024-09-20', 49.99),
    (4, 4, '2024-10-15', 399.98),
    (5, 5, '2024-11-20', 1249.96);

-- Create Table 'OrderDetails'
CREATE TABLE OrderDetails (
    OrderDetailID INT(10) NOT NULL,
    OrderID INT(10) NOT NULL,
    ProductID INT(10) NOT NULL,
    Quantity INT(10) NOT NULL,
    PRIMARY KEY(OrderDetailID)
);

INSERT INTO OrderDetails 
    (OrderDetailID, OrderID, ProductID, Quantity) 
VALUES
    (1, 1, 1, 1), -- Laptop
    (2, 1, 2, 1), -- Smartphone
    (3, 2, 2, 1), -- Smartphone
    (4, 2, 4, 2), -- Backpack
    (5, 3, 3, 1), -- Headphones
    (6, 4, 5, 2), -- Monitor
    (7, 5, 1, 1), -- Laptop
    (8, 5, 2, 1); -- Smartphone

-- Adding Foreign Key to 'BorrowRecords'

ALTER TABLE Orders
    ADD CONSTRAINT `fk_CustID` 
        FOREIGN KEY (CustomerID) 
        REFERENCES Customers (CustomerID) 
        ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE OrderDetails
    ADD CONSTRAINT `fk_OrdID` 
        FOREIGN KEY (OrderID) 
        REFERENCES Orders (OrderID) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `fk_ProdID`
        FOREIGN KEY (ProductID)
        REFERENCES Products (ProductID)
        ON DELETE CASCADE ON UPDATE CASCADE;

'q4.1 - Write an SQL query to list all products purchased by customers who registered in the last six months. ?'

SELECT
    ord.ProductID,
    c.CustomerID
FROM
    orderdetails ord
JOIN products p ON
    p.ProductID = ORD.ProductID
JOIN orders o ON
    o.OrderID = ORD.OrderID
JOIN customers c ON
    c.CustomerID = o.CustomerID
WHERE
    o.OrderDate > DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

'q4.2 - Write an SQL query to find the total amount spent by each customer. ?'

SELECT 
    c.CustomerID, 
    c.Name, 
    SUM(o.TotalAmount) AS TotalSpent
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.CustomerID, 
    c.Name
ORDER BY 
    TotalSpent DESC;

'q4.3 - Write an SQL query yo list products that have never been ordered. ?'

-- Query 1 

SELECT
    p.ProductID
FROM
    products p
LEFT JOIN orderdetails ORD ON
    p.ProductID = ORD.ProductID
WHERE
    ORD.ProductID IS NULL

-- Query 2 

SELECT
    p.ProductID
FROM
    products p
WHERE
    p.ProductID IN(
    SELECT
        p.ProductID
    FROM
        products
    LEFT JOIN orderdetails ORD ON
        p.ProductID = ORD.ProductID
    WHERE
        ORD.ProductID IS NULL
);

'q4.4 - Write an SQL query to display the top 5 product with the hightest sales (by quantity). ?'

SELECT
    p.ProductID,
    p.ProductName,
    SUM(ord.Quantity) AS TotalQuantitySold
FROM
    Products p
JOIN OrderDetails ord ON
    p.ProductID = ord.ProductID
GROUP BY
    p.ProductID,
    p.ProductName
ORDER BY
    TotalQuantitySold DESC
LIMIT 5;

'q4.5 - Write an SQL query to list customers who have place orders totaling more than $1,000. ?'

SELECT DISTINCT
    (c.CustomerID),
    c.Name,
    o.TotalAmount
FROM
    customers c
JOIN orders o ON
    o.CustomerID = c.CustomerID
JOIN orderdetails ORD ON
    ORD.OrderID = o.OrderID
WHERE
    o.TotalAmount > 1000