Q1 - 'SQL Query to fetch records that are present in one table but not in another table ?'

SELECT empdetails.* FROM empdetails
  LEFT JOIN empsalary
    USING (empid) WHERE empsalary.empid is null;

SELECT * FROM empdetails
WHERE EmpId NOT IN (SELECT EmpId FROM empsalary);


Q2 'SQL query to fetch all the employees who are not working on any project ?'

SELECT * FROM empsalary WHERE Project IS NULL;

SELECT * FROM empdetails INNER JOIN empsalary ON empsalary.EmpId = empdetails.EmpId WHERE empsalary.Project IS NULL;


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
