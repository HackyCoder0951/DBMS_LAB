-- create database `mca_assign1`

CREATE DATABASE mca_assign1;

-- Table Name - 'EmpDetails'
CREATE TABLE mca_assign1.empdetails (
  `EmpID` int(10) NOT NULL,
  `EmpName` varchar(50) NOT NULL,
  `ManagerID` int(11) DEFAULT NULL,
  `DOJ` date NOT NULL,
  `City` varchar(50) NOT NULL
);

-- Adding Primary Key to EmpDetails
ALTER TABLE mca_assign1.empdetails 
  ADD PRIMARY KEY(EmpID);

-- Inserting Data into EmpDetails
INSERT INTO mca_assign1.empdetails 
    (EmpID,EmpName,ManagerID,DOJ,City) 
  VALUES 
    (111,'Amit sharma',231,'2014-01-31','Bangalore'), 
    (333,'Rajesh Vyas',654,'2020-11-27','Mumbai'), 
    (555,'Kuldeep Tondon',543,'2016-11-27','New Delhi'),
    (112,'Vikas Patel',321,'2014-12-13','Chittorgarh'),
    (113,'Deepak Sharma',231,'2015-08-12','Bhilwara'),
    (115,'Vijay Patel',543,'2016-07-15','Udaipur'),
    (116,'Kamlesh Kumar',654,'2018-09-16','Jaipur');

-- Table Name - 'EmpSalary'

CREATE TABLE mca_assign1.empsalary (
  `EmpID` int(10) NOT NULL,
  `Project` varchar(50) DEFAULT NULL,
  `Salary` int(10) NOT NULL,
  `Variable` int(10) NOT NULL
);

-- Adding Primary Key to EmpSalary
ALTER TABLE mca_assign1.empsalary 
  ADD PRIMARY KEY(EmpID);

-- Adding Foreign Key using Constraints into EmpSalary
ALTER TABLE mca_assign1.empsalary 
  ADD CONSTRAINT `con1` FOREIGN KEY (`EmpID`) 
  REFERENCES mca_assign1.empdetails(`EmpID`) 
  ON DELETE CASCADE ON UPDATE CASCADE;

-- Inserting Data into EmpSalary
INSERT INTO mca_assign1.empsalary 
    (EmpID,Project,Salary,Variable) 
  VALUES 
    (111, 'P1', 8000, 500),
    (333, 'P2', 10000, 1000),
    (555, 'P1', 12000, 0),
    (112, 'P3', 16000, 950),
    (113, 'P4', 15500, 1250);


Q1 - 'SQL Query to fetch records that are present in one table but not in another table ?'

SELECT empdetails.* FROM empdetails
  LEFT JOIN empsalary
    USING (EmpID) WHERE empsalary.empid IS NULL;

SELECT * FROM empdetails
WHERE EmpID NOT IN (SELECT EmpId FROM empsalary);


Q2 'SQL query to fetch all the employees who are not working on any project ?'

SELECT * FROM empsalary WHERE Project IS NULL;


Q3 'SQL query to fetch all the Employees from empdetails who joined in the Year 2020 '

SELECT * FROM empdetails WHERE DOJ BETWEEN '2020-01-01' AND '2020-12-31';

SELECT * FROM empdetails WHERE year(DOJ) = 2020;

SELECT * FROM empdetails WHERE year(DOJ) LIKE '2020%';


Q4 'Write an SQL query to fetch records from empdetails where city ends with character ‘i’ ?'

SELECT * FROM empdetails WHERE City LIKE '%i';


Q5 'Write an SQL query to fetch only odd rows from the table ?'
  
SELECT * FROM empdetails WHERE EmpId % 2 != 0;

SELECT * FROM empdetails WHERE MOD(EmpID,2)!=0;

Q6 'Sql Query to find 3rd highest salary from a table without using the TOP / LIMIT keyword ?'

SELECT Salary FROM empsalary Emp1 WHERE 2 = ( SELECT COUNT ( DISTINCT ( Emp2.Salary ) ) FROM empsalary Emp2 WHERE Emp2.Salary > Emp1.Salary );

Q7 'Write an SQL query to fetch all those employees who work on Project other than P1 ?'

SELECT EmpName,Project FROM empdetails INNER JOIN empsalary ON empsalary.EmpId = empdetails.EmpId WHERE empsalary.Project != 'P1';

SELECT * FROM empsalary WHERE NOT project = 'P1';

Q8 'Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘empdetails’ and ‘empsalary’ ?'

SELECT * FROM empsalary UNION SELECT EmpId FROM empdetails ORDER BY EmpId ASC;

Q9 'Write an SQL query to display both the EmpId and ManagerId together ?'

SELECT EmpId , ManagerId FROM empdetails; 

SELECT concat(EmpId," --> ",ManagerId) AS "EmpId & ManagerId Together" FROM empdetails;

Q10 'Write an SQL query to fetch project-wise count of employees sorted by 
    a). project’s count in descending order ?'

SELECT PROJECT,COUNT(project) AS EMPLOYEES FROM empsalary GROUP BY Project ORDER BY COUNT(empsalary.project) DESC;
