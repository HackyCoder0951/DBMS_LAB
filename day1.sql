CREATE DATABASE vitc;

USE vitc;

CREATE	TABLE empdetails (
	sr_no int(12) NOT null AUTO_INCREMENT,
    emp_id int(11) NOT null PRIMARY KEY,
    emp_name varchar(150) NOT null,
    emp_des varchar(150) NOT null,
  	emp_mobile int(15) NOT null,
    emp_dept varchar(100) NOT null,
    emp_location varchar(100) NOT null
);

INSERT INTO empdetails (emp_id,emp_name,emp_des,emp_mobile,emp_dept,emp_location) VALUES 
(2021,'kishan lal','Sr. Dev',1231231234,'Devlopment','udaipur'),
(2022,'shiv kumar','Jr. Dev',2123432242,'Devlopment','bassi'),
(2023,'vishnu kumar','DevOps Er.',4534543242,'Devlopment','bhilwara'),
(2024,'prakash jat','Cloud Er.',5683463466,'Devlopment','jaipur'),
(2025,'satish kumar','Accountant',3546454745,'Finance','rajsamand'),
(2026,'gopal krishna','Sys Admin',2153453454,'Administration','kapasan');

CREATE TABLE empsalary (
	sr_no int(12) NOT null AUTO_INCREMENT,
    emp_id int(11) NOT null PRIMARY KEY,
    emp_dept varchar(150) NOT null,
    emp_sal varchar(150) NOT null,
    emp_payscale varchar(4) NOT null,
    FOREIGN KEY(emp_id) REFERENCES empdetails(emp_id)
);

INSERT INTO empsalary (emp_id,emp_dept,emp_sal,emp_payscale) VALUES 
(2021,'Devlopment','75000','6th'),
(2022,'Devlopment','4000','4th'),
(2023,'Devlopment','85000','6th'),
(2024,'Devlopment','64500','6th'),
(2025,'Finance','46500','5th'),
(2026,'Administration','72500','7th');
