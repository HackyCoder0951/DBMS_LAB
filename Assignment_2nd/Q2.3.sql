-- Create Database 'mca_assign2.3'

CREATE DATABASE `mca_assign2.3`;

-- Select Database 'mca_assign2.3'

USE `mca_assign2.3`;

-- Create Table 'Books'

CREATE TABLE books (
    BookID INT(15) NOT NULL,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Publisher VARCHAR(100) NOT NULL,
    YearPublished YEAR NOT NULL,
    Category VARCHAR(50) NOT NULL,
    PRIMARY KEY(BookID)
);

INSERT INTO books 
    (BookID, Title, Author, Publisher, YearPublished, Category) 
VALUES
    (101, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 1925, 'Fiction'),
    (102, 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', 1960, 'Fiction'),
    (103, '1984', 'George Orwell', 'Secker & Warburg', 1949, 'Dystopian'),
    (104, 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 1951, 'Fiction'),
    (105, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'Harper', 2014, 'Non-Fiction'),
    (106, 'Thinking, Fast and Slow', 'Daniel Kahneman', 'Farrar, Straus and Giroux', 2011, 'Psychology'),
    (107, 'The Alchemist', 'Paulo Coelho', 'HarperOne', 1988, 'Fiction'),
    (108, 'The Lean Startup', 'Eric Ries', 'Crown Business', 2011, 'Business'),
    (109, 'A Brief History of Time', 'Stephen Hawking', 'Bantam Books', 1988, 'Science'),
    (110, 'Becoming', 'Michelle Obama', 'Crown', 2018, 'Biography');


-- Create Table 'Members'

CREATE TABLE members (
    MemberID INT(15) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    JoinDate DATE NOT NULL,
    PRIMARY KEY(MemberID)
);

INSERT INTO members 
    (MemberID, Name, Email, JoinDate) 
VALUES
    (201, 'Alice Johnson', 'alice.johnson@example.com', '2023-01-15'),
    (202, 'Bob Smith', 'bob.smith@example.com', '2022-10-25'),
    (203, 'Charlie Brown', 'charlie.brown@example.com', '2023-03-10'),
    (204, 'Diana Evans', 'diana.evans@example.com', '2022-06-18'),
    (205, 'Eve Green', 'eve.green@example.com', '2021-11-30'),
    (206, 'Frank White', 'frank.white@example.com', '2023-05-20'),
    (207, 'Grace Lee', 'grace.lee@example.com', '2022-12-12'),
    (208, 'Henry Adams', 'henry.adams@example.com', '2023-07-08'),
    (209, 'Isabel Turner', 'isabel.turner@example.com', '2023-02-05'),
    (210, 'Jack Davis', 'jack.davis@example.com', '2021-08-15');


-- Create Table 'BorrowRecords'

CREATE TABLE borrowrecords (
    RecordID INT(15) NOT NULL,
    MemberID INT(15) NOT NULL,
    BookID INT(15) NOT NULL,
    BorrowDate DATE NOT NULL,
    PRIMARY KEY(RecordID)
);

INSERT INTO borrowrecords 
    (RecordID, MemberID, BookID, BorrowDate) 
VALUES
    (301, 201, 101, '2023-12-01'),
    (302, 202, 105, '2023-11-25'),
    (303, 203, 102, '2023-11-28'),
    (304, 204, 110, '2023-12-05'),
    (305, 205, 108, '2023-11-20'),
    (306, 206, 109, '2023-11-22'),
    (307, 207, 107, '2023-12-03'),
    (308, 208, 104, '2023-12-07'),
    (309, 209, 106, '2023-11-30'),
    (310, 210, 103, '2023-12-04');


-- Adding Foreign Key to 'BorrowRecords'

ALTER TABLE borrowrecords
    ADD CONSTRAINT `fk_MemID` 
        FOREIGN KEY (MemberID) 
        REFERENCES members (MemberID) 
        ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE borrowrecords
    ADD CONSTRAINT `fk_BookID` 
        FOREIGN KEY (BookID) 
        REFERENCES books (BookID) 
        ON DELETE CASCADE ON UPDATE CASCADE;

