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

Q1 Solution - 
SELECT ed.* FROM employeedetails ed LEFT JOIN employeesalary es ON ed.EmpId=es.EmpId WHERE es.EmpId IS NULL;

//****QUESTION 2****//
SELECT EmpId, FullName FROM employeedetails WHERE EmpId NOT IN (SELECT EmpId FROM employeesalary);

//****QUESTION 3****// 
	//WAY I
SELECT FullName, DateOfJoining FROM employeedetails WHERE DateOfJoining BETWEEN '2020-01-01' AND '2020-12-31';
	
	//WAY II
SELECT FullName, DateOfJoining FROM employeedetails WHERE YEAR(DateOfJoining) = 2020;

	//WAY III
SELECT FullName, DateOfJoining FROM employeedetails WHERE YEAR(DateOfJoining) LIKE '2020%';

//****QUESTION 4****//

SELECT *FROM employeedetails WHERE City LIKE '%i';

//****QUESTION 5****//

WITH RowNumbers AS(SELECT *, ROW_NUMBER() OVER (ORDER BY EmpId, Project) AS RowNum FROM employeesalary)SELECT *FROM RowNumbers WHERE RowNum%2=1;


//****QUESTION 6****//

	//WAY I - BY USING ROW_NUMBER() -> DEFINES UNIQUE SEQUENTIAL RANK TO EACH SALARY, ORDERED IN DESC (HGHTEST GET RANK1, SECOND HIGHTEST GET RANK 2)

WITH ThirdHSalary AS (SELECT salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS trank FROM employeesalary) SELECT salary FROM ThirdHSalary WHERE trank=3;

	//WAY II - BY USING DENSE_RANK() -> ASSIGN SAME RANK TO DUPLICATE SALARY VALUES. [2 EMP WITH HIGHEST SALARY BOTH WILL GET RANK1, AND SO ON]

WITH ThirdHSalary AS (SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS trank FROM employeesalary) SELECT salary FROM ThirdHSalary WHERE trank=3;


//****QUESTION 7****//
SELECT FullName, Project FROM employeedetails INNER JOIN employeesalary ON employeesalary.EmpId=employeedetails.EmpId WHERE employeesalary.Project!='P1';


//****QUESTION 8****//

SELECT EmpId FROM employeedetails UNION SELECT EmpId FROM employeesalary ORDER BY EmpId ASC;

//****QUESTION 9****//
	//WAY I
SELECT EmpId, ManagerId FROM employeedetails;
	//WAY II
SELECT concat(EmpId, "___",ManagerId) AS "EmpId & ManagerId Together" FROM employeedetails;


//****QUESTION 10****//
SELECT Project, COUNT(Project) as No_Emp_in_each_Project  FROM employeesalary GROUP BY Project ORDER BY COUNT(employeesalary.Project) DESC;
