--Creation of EmpDetails Table
--Table Name - 'EmpDetails'
CREATE TABLE assign1.empdetails (
  EmpID INT(10) NULL DEFAULT NULL , 
  EmpName VARCHAR(50) NOT NULL , 
  ManagerID INT NULL DEFAULT NULL , 
  DOJ DATE NOT NULL , 
  City VARCHAR(50) NOT NULL 
) ENGINE = InnoDB;

--Adding Primary Key to EmpDetails
ALTER TABLE empdetails ADD PRIMARY KEY(EmpID);

--Creation of EmpSalary Table
--Table Name - 'EmpSalary'

CREATE TABLE assign1.empsalary (
  EmpID INT(10) NULL DEFAULT NULL , 
  Project VARCHAR(50) NOT NULL , 
  Salary INT(10) NOT NULL , 
  Variable INT(10) NOT NULL 
) ENGINE = InnoDB;

--Adding Primary Key to EmpSalary
ALTER TABLE empsalary ADD PRIMARY KEY(EmpID);

--Inserting Data into EmpDetails
INSERT INTO empdetails (EmpID,EmpName,ManagerID,DOJ,City) 
  VALUES (111, 'Amit sharma', 231, '2014-01-31', 'Banglor'), 
  (333, 'Rajesh Vyas', 654, '2020-11-27', 'Mumbai'), 
  (555, 'Kuldeep Tondon', 543, '2016-11-27', 'New Delhi'),
  (112,'Vikas Patel',321,'2014-12-13','Chittorgarh'),
  (113,'Deepak Sharma',231,'2015-08-12','Bhilwara'),
  (114,'Bhavesh Kumar',654,'2013-06-25','Udaipur'),
  (115,'Vijay Patel',543,'2016-07-15','Udaipur'),
  (116,'Kamlesh Kumar',654,'2018-09-16','Jaipur'),
  (117,'Priyansh Jat',543,'2019-04-21','Chittorgarh'),
  (118,'Jatin Joshi',321,'2012-06-26','Chittorgarh');

--Inserting Data into EmpSlary
INSERT INTO empsalary (EmpID,Project,Salary,Variable) 
  VALUES (111, 'P1', 8000, 500),
  (112, 'P1', 19000, 800),
  (113, 'P1', 16000, 900),
  (114, 'P2', 15000, 1200),
  (115, 'P4', 16000, 1500),
  (116, 'P3', 13200, 1250),
  (117, 'P3', 11200, 1150),
  (118, 'P5', 12500, 1540),
  (333, 'P2', 10000, 1000),
  (555, 'P1', 12000, 0);

--Adding Foreign Key using Constraints into EmpSalary
ALTER TABLE `empsalary` 
  ADD CONSTRAINT `con1` 
  FOREIGN KEY (`EmpID`) 
  REFERENCES `empdetails`(`EmpID`) 
  ON DELETE CASCADE ON UPDATE CASCADE;

Q-1.1 -- SQL Query to fetch records that are present in one table but not in another table ?

SELECT empdetails.* FROM empdetails
LEFT JOIN empsalary
USING (empid) WHERE empsalary.empid is null;


Q-1.2 -- SQL query to fetch all the employees who are not working on any project ?

SELECT empId,EmpName FROM empdetails
WHERE EmpId NOT IN (SELECT EmpId FROM empsalary);


Q-1.3 -- SQL query to fetch all the Employees from empdetails who joined in the Year 2020 ?

SELECT EmpName,DateOfJoining FROM empdetails
WHERE DateOfJoining BETWEEN '2020-01-01' AND '2020-12-31';

SELECT EmpName,DateOfJoining FROM empdetails
WHERE year(DateOfJoining) = 2020;

SELECT EmpName,DateOfJoining FROM empdetails
WHERE year(DateOfJoining) LIKE '2020%';


Q-1.4 -- Write an SQL query to fetch records from empdetails where city ends with character
‘i’ ?

SELECT * FROM empdetails
WHERE City LIKE '%i';


Q-1.5 -- Write an SQL query to fetch only odd rows from the table ?

-> If there is a s.no. column:-(For Employee Details Table)
SELECT * FROM empdetails
WHERE `S.no.` % 2 != 0;

-> If there is no s.no. column:-(For Employee Salary Table)
WITH NumberedRows AS (
 SELECT e.*,ROW_NUMBER() OVER (ORDER BY EmpId,project) AS RowNum
 FROM empsalary e
)
SELECT EmpId,Salary,Project,variable FROM NumberedRows
WHERE RowNum % 2 != 0;


Q-1.6 -- Sql Query to find 3rd highest salary from a table without using the TOP / LIMIT keyword ?

SELECT Salary
FROM empsalary Emp1
WHERE 2 = (
 SELECT COUNT( DISTINCT ( Emp2.Salary ) )
 FROM empsalary Emp2
 WHERE Emp2.Salary > Emp1.Salary
 );


Q-1.7 -- Write an SQL query to fetch all those employees who work on Project other than P1 ?

SELECT EmpName,Project FROM empdetails
INNER JOIN empsalary ON empsalary.EmpId = empdetails.EmpId
WHERE empsalary.Project != 'P1';


Q-1.8 -- Write an SQL query to fetch all the EmpIds which are present in either of the tables –
‘empdetails’ and ‘empsalary’ ?

SELECT EmpId FROM empsalary
UNION
SELECT EmpId FROM empdetails
ORDER BY EmpId ASC;


Q-1.9 -- Write an SQL query to display both the EmpId and ManagerId together ?

SELECT EmpId , ManagerId
FROM empdetails;

SELECT concat(EmpId,"---",ManagerId) AS "EmpId & ManagerId Together"
FROM empdetails;


Q-1.10 -- Write an SQL query to fetch project-wise count of employees sorted by project’s count in
descending order ?

SELECT PROJECT,COUNT(project) AS EMPLOYEES
FROM empsalary
GROUP BY Project
ORDER BY COUNT(empsalary.project) DESC;
