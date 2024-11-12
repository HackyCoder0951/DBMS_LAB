create DATABASE jignesh;  // to create a new db

use jignesh;  // to select db for operations

create table test614 (
	id int not null,
    f_name varchar(100) not null,
   	m_name varchar(100) not null,
    l_name varchar(100) not null,
    place varchar(100) not null,
    m_no int not null,
    education varchar(100) not null
); // to create a table named test614

insert into test614 (id,f_name,m_name,l_name,place,m_no,education) values (01,'kishan','lal','sharma','udaipur',1231231234,'graduate'), // insert values in table
(02,'shiv','kumar','sharma','bassi',2123432242,'12th pass'),
(03,'vishnu','kumar','jat','bhilwara',4534543242,'10th pass'),
(04,'prakash','','jat','jaipur',5683463466,'10th pass'),
(05,'satish','kumar','sharma','rajsamand',3546454745,'12th pass'),
(06,'gopal','krishna','sharma','kapasan',2153453454,'graduate');

alter table test614 RENAME to std_details;  // to rename selected table test614 to std_details

ALTER TABLE std_details ADD std_id int NOT null;

ALTER TABLE std_details CHANGE id sr_no INT(11) NOT NULL;

ALTER TABLE std_details DROP sr_no;

ALTER TABLE std_details ADD sr_no int NOT null AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE `std_details` CHANGE `std_id` `std_id` VARCHAR(11) NOT NULL;

UPDATE `std_details` SET `std_id` = 'MCA06' WHERE `std_details`.`sr_no` = 6;

ALTER TABLE std_details ADD UNIQUE (std_id)


CREATE TABLE MCA_Result (
    sr_no int NOT null AUTO_INCREMENT PRIMARY KEY,
    std_id int,
    department varchar(200) NOT null,
    programs varchar(200) NOT null,
    sem varchar(100) NOT null,
    total_credits int NOT null,
    received_credits int NOT null,
    result varchar(100) NOT null,
    FOREIGN KEY (std_id) REFERENCES std_details(std_id)
);
