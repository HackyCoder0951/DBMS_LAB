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
    (1, 1, '2023-11-15', 1499.97),
    (2, 2, '2023-12-01', 739.98),
    (3, 3, '2023-12-20', 49.99),
    (4, 4, '2024-01-15', 399.98),
    (5, 5, '2024-01-20', 1249.96);

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

'q4.1 - Write an SQL query to list all producst purchased by customers who registered in the last six months. ?'

'q4.2 - Write an SQL query to find the total amount spent by each customer. ?'

'q4.3 - Write an SQL query yo list products that have never been ordered. ?'

'q4.4 - Write an SQL query to display the top 5 product with the hightest sales (by quantity). ?'

'q4.5 - Write an SQL query to list customers who have plaes orders totaling more than $1,000. ?'