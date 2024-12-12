-- Q-2.1 Find the total grade points earned by the student with ID '12345', across all courses taken by the student ?
SELECT ID,tot_cred FROM `student` WHERE ID = 'S101';

-- Q-2.2 Find the grade point average (GPA) for the above student, that is, the total grade points divided by the total credits for the associated courses ?

SELECT std.ID,
       std.Name,
       CASE
           WHEN SUM(crs.credits) = 0 THEN 0
           ELSE SUM(gp.points * crs.credits) / SUM(crs.credits)
       END AS GP
FROM student std
LEFT JOIN takes tk ON std.ID = tk.ID
LEFT JOIN grade_points gp ON tk.grade = gp.grade
LEFT JOIN course crs ON tk.course_id = crs.course_id
GROUP BY std.ID, std.Name
HAVING std.ID = 'S101';


-- Q-2.3 -- Find the ID and the grade-point average of each student ?

SELECT ID, AVG(points) AS GPA
  FROM `takes` 
    JOIN grade_points AS GP ON takes.grade = GP.grade
  WHERE ID='S101'

