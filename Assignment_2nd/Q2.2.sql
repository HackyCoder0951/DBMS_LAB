-- Create Database 'mca_assign2.2'

CREATE Database `mca_assign2.2`;

-- Select the database 'mca_assign2.2'

use `mca_assign2.2`;

-- Create Table 'Employees'

CREATE TABLE employees (
    EmployeeID INT(5) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Age INT(3) NOT NULL,
    Department VARCHAR(100) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(EmployeeID),
    INDEX(Department)
);

-- Insert Data into 'Employees' table

INSERT INTO employees 
    (EmployeeID, Name, Age, Department, Salary) 
VALUES
(101, 'Alice Johnson', 29, 'IT', 75000.00),
(102, 'Bob Smith', 34, 'HR', 60000.00),
(103, 'Charlie Brown', 28, 'Finance', 72000.00),
(104, 'Diana Evans', 30, 'IT', 80000.00),
(105, 'Eve Green', 40, 'Marketing', 55000.00),
(106, 'Frank White', 45, 'Finance', 90000.00),
(107, 'Grace Lee', 32, 'HR', 63000.00),
(108, 'Henry Adams', 26, 'IT', 68000.00),
(109, 'Isabel Turner', 38, 'Marketing', 58000.00),
(110, 'Jack Davis', 50, 'Finance', 95000.00);


-- Create Table 'Projects'
CREATE TABLE projects (
    ProjectID INT(5) NOT NULL,
    ProjectName VARCHAR(100) NOT NULL,
    Department VARCHAR(200) NOT NULL,
    Budget int(15) NOT NULL,
    PRIMARY KEY(ProjectID),
    INDEX(Department)
);

-- Insert Data into 'Projects' table

INSERT INTO projects 
    (ProjectID, ProjectName, Department, Budget) 
VALUES
(201, 'Cloud Migration', 'IT', 2500000),
(202, 'Employee Onboarding', 'HR', 5000000),
(203, 'Budget Planning', 'Finance', 800000),
(204, 'Marketing Campaign', 'Marketing', 450000),
(205, 'Cybersecurity Upgrade', 'IT', 2500000),
(206, 'Payroll Automation', 'Finance', 650000),
(207, 'Training and Development', 'HR', 3000000),
(208, 'Social Media Strategy', 'Marketing', 400000),
(209, 'Data Analytics', 'Finance', 950000),
(210, 'AI Research', 'IT', 2000000);

-- Adding Foreign & Index Key to 'Employees' Table

ALTER TABLE `employees`
    ADD CONSTRAINT `fk_Department` 
        FOREIGN KEY (`Department`) 
        REFERENCES `projects`(`Department`) 
        ON DELETE CASCADE ON UPDATE CASCADE;

'q2.1 - List the names of all employees in the "IT" department?'

SELECT e.Name AS 'Emp Name'
FROM employees e
WHERE e.Department = 'IT';

'q2.2 - Display all projects with a budget greater than $2000,000?'

SELECT *
FROM projects p
WHERE p.Budget > 2000000;

'q2.3 - Retrieve the details of employees who are 40 years or older?'

SELECT *
FROM employees e
WHERE e.Age >= 40;

'q2.4 - Find the average salary of employees in the "Finance" Department?'

SELECT ROUND(AVG(e.Salary), 2) AS 'AVG Emp Salary'
FROM employees e
WHERE e.Department = 'Finance';

'q2.5 - Display the names of employees earning more than $50,000?'

SELECT *
FROM employees e
WHERE e.Salary > 50000;

'q2.6 - List all emloyees and their corresponding department?'

SELECT e.EmployeeID,
    e.Name,
    e.Department
FROM employees e;

'q2.7 - Retrieve the ProjectID and ProjectName for projects under the "HR" department?'

SELECT p.ProjectID,
    p.ProjectName
FROM projects p
WHERE p.Department = 'HR';

'q2.8 - Find the total numbers of employees in the "IT" department?'

SELECT COUNT(e.EmployeeID) AS 'Total Employees'
FROM employees e
WHERE e.Department = 'IT';

'q2.9 - Display the names of employees working in department that have projects with a budget over $150,000?'

SELECT DISTINCT e.Name,
    e.Department
FROM employees e
    JOIN projects p 
        ON p.Department = e.Department
WHERE p.Budget > 1500000