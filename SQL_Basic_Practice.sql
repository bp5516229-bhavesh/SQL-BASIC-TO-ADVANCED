-- ============================================================
--  collagedb  |  MySQL Workbench Practice Script
--  Covers: DDL, DML, DQL, Aggregates, Joins, Views, Indexes
-- ============================================================


-- ─────────────────────────────────────────────
--  1. DATABASE SETUP
-- ─────────────────────────────────────────────

CREATE DATABASE IF NOT EXISTS collagedb;
USE collagedb;


-- ─────────────────────────────────────────────
--  2. STUDENTS TABLE
-- ─────────────────────────────────────────────

CREATE TABLE students (
    Student_id  INT          PRIMARY KEY,
    First_Name  VARCHAR(50),
    Last_Name   VARCHAR(50),
    Age         INT,
    City        VARCHAR(50)
);

-- Insert rows
INSERT INTO students (Student_id, First_Name, Last_Name, Age, City)
VALUES
    (1, 'Bhavesh',  'Patil ',   22, 'Hyderabad'),
    (2, 'Rahul',   'Sharma',  21, 'Mumbai'),     -- fixed: 'Shrama' → 'Sharma', 'Mumabi' → 'Mumbai'
    (3, 'Bhasker', 'Mahajan', 20, 'Newyork'),
    (4, 'Raj', 'Patil',   23, 'Pune');       


-- ─────────────────────────────────────────────
--  3. SELECT QUERIES
-- ─────────────────────────────────────────────

SELECT * FROM students;

SELECT First_Name, City
FROM   students;

-- WHERE with comparison
SELECT * FROM students WHERE Age > 20;

-- WHERE with AND / OR
SELECT * FROM students WHERE Age > 20 AND City = 'Mumbai';
SELECT * FROM students WHERE City = 'Delhi' OR City = 'Pune';

-- Pattern matching
SELECT * FROM students WHERE First_Name LIKE 'B%';

-- IN list
SELECT * FROM students WHERE City IN ('Mumbai', 'Delhi');

-- Range filter (inclusive)
SELECT * FROM students WHERE Age BETWEEN 20 AND 22;

-- Remove duplicates
SELECT DISTINCT City FROM students;

-- Sorting
SELECT * FROM students ORDER BY Age ASC;
SELECT * FROM students ORDER BY Age DESC;


-- ─────────────────────────────────────────────
--  4. UPDATE & DELETE
-- ─────────────────────────────────────────────

UPDATE students SET City = 'Bangalore' WHERE Student_id = 1;
UPDATE students SET City = 'Mumbai'    WHERE Student_id = 2;

SELECT * FROM students;  -- verify changes

DELETE FROM students WHERE Student_id = 4;

SELECT * FROM students;  -- verify deletion


-- ─────────────────────────────────────────────
--  5. AGGREGATE FUNCTIONS
-- ─────────────────────────────────────────────

SELECT COUNT(*) AS total_students FROM students;
SELECT MAX(Age)                   FROM students;
SELECT MIN(Age)                   FROM students;
SELECT AVG(Age)                   FROM students;
SELECT SUM(Age)                   FROM students;

-- Group by city
SELECT City, COUNT(*) AS student_count
FROM   students
GROUP  BY City;

-- HAVING filters groups (not rows)
SELECT City, COUNT(*) AS student_count
FROM   students
GROUP  BY City
HAVING COUNT(*) > 1;


-- ─────────────────────────────────────────────
--  6. ALTER TABLE
-- ─────────────────────────────────────────────

ALTER TABLE students ADD    Email VARCHAR(100);
ALTER TABLE students MODIFY Email VARCHAR(150);
ALTER TABLE students DROP   COLUMN Email;


-- ─────────────────────────────────────────────
--  7. TRUNCATE  (removes all rows, keeps structure)
-- ─────────────────────────────────────────────

-- NOTE: moved SELECT before TRUNCATE — they must be separate statements
SELECT * FROM students;

TRUNCATE TABLE students;


-- ─────────────────────────────────────────────
--  8. DEPARTMENT TABLE
-- ─────────────────────────────────────────────

CREATE TABLE Department (
    Dept_ID   INT         PRIMARY KEY,
    Dept_Name VARCHAR(50)
);

INSERT INTO Department (Dept_ID, Dept_Name)
VALUES
    (101, 'HR'),
    (102, 'IT'),
    (103, 'Finance'),
    (104, 'Marketing'),
    (106, 'Sales');

SELECT * FROM Department;  -- fixed: missing semicolon after original SELECT


-- ─────────────────────────────────────────────
--  9. EMPLOYEE TABLE  (with FOREIGN KEY)
-- ─────────────────────────────────────────────

CREATE TABLE Employee (
    Emp_ID   INT            PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Salary   DECIMAL(10, 2),
    Dept_ID  INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

INSERT INTO Employee (Emp_ID, Emp_Name, Salary, Dept_ID)
VALUES
    (1, 'Raj',   50000.00, 101),
    (2, 'Amit',  60000.00, 102),
    (3, 'Priya', 55000.00, 103),
    (4, 'Neha',  45000.00, 101),
    (5, 'Rohan', 70000.00, 102),
    (6, 'Sneha', 65000.00, 104);

-- NOTE: Dept_ID 105 does not exist in Department → FK violation → intentionally removed
-- INSERT INTO Employee VALUES (7, 'Karan', 40000, 105);  ← this would error


-- ─────────────────────────────────────────────
--  10. JOINS
-- ─────────────────────────────────────────────

-- INNER JOIN: only matched rows
SELECT E.Emp_Name, D.Dept_Name, E.Salary
FROM   Employee   E
INNER JOIN Department D ON E.Dept_ID = D.Dept_ID;

-- LEFT JOIN: all employees, NULLs for unmatched departments
SELECT E.Emp_Name, D.Dept_Name
FROM   Employee   E
LEFT  JOIN Department D ON E.Dept_ID = D.Dept_ID;

-- RIGHT JOIN: all departments, NULLs for departments with no employees
SELECT E.Emp_Name, D.Dept_Name
FROM   Employee   E
RIGHT JOIN Department D ON E.Dept_ID = D.Dept_ID;


-- ─────────────────────────────────────────────
--  11. SUBQUERY
-- ─────────────────────────────────────────────

-- Employees earning above average salary
SELECT *
FROM   Employee
WHERE  Salary > (SELECT AVG(Salary) FROM Employee);


-- ─────────────────────────────────────────────
--  12. VIEWS
-- ─────────────────────────────────────────────

CREATE VIEW Employee_View AS
SELECT Emp_Name, Salary
FROM   Employee;

-- Replace view to add Emp_ID column
CREATE OR REPLACE VIEW Employee_View AS
SELECT Emp_ID, Emp_Name, Salary
FROM   Employee;

SELECT * FROM Employee_View;


-- ─────────────────────────────────────────────
--  13. INDEXES
-- ─────────────────────────────────────────────

CREATE INDEX idx_name ON Employee(Emp_Name);

SHOW INDEX FROM Employee;

DROP INDEX idx_name ON Employee;


-- ============================================================
--  END OF SCRIPT
-- ============================================================