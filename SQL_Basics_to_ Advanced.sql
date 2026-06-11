-- ============================================================
-- MYSQL COMPLETE PRACTICE SCRIPT (BEGINNER TO ADVANCED)
-- Database: CollegeDB
-- Covers: DDL, DML, DQL, Joins, Views, Indexes, Procedures
-- ============================================================

-- ============================================================
-- 1. CREATE DATABASE
-- ============================================================

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- ============================================================
-- 2. CREATE STUDENT TABLE
-- ============================================================

CREATE TABLE Students (
Student_ID INT PRIMARY KEY,
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
Age INT,
City VARCHAR(50)
);

-- ============================================================
-- 3. INSERT DATA
-- ============================================================

INSERT INTO Students
VALUES
(1,'Bhavesh','Patil',22,'Jalgaon'),
(2,'Rahul','Sharma',21,'Mumbai'),
(3,'Raj','Patil',23,'Pune'),
(4,'Sneha','Patil',20,'Nashik'),
(5,'Amit','Jadhav',24,'Aurangabad');

-- ============================================================
-- 4. BASIC SELECT
-- ============================================================

SELECT * FROM Students;

SELECT First_Name, City
FROM Students;

-- ============================================================
-- 5. WHERE CLAUSE
-- ============================================================

SELECT *
FROM Students
WHERE Age > 21;

SELECT *
FROM Students
WHERE City='Mumbai';

SELECT *
FROM Students
WHERE Age > 20 AND City='Pune';

SELECT *
FROM Students
WHERE City='Mumbai' OR City='Pune';

-- ============================================================
-- 6. LIKE OPERATOR
-- ============================================================

SELECT *
FROM Students
WHERE First_Name LIKE 'R%';

SELECT *
FROM Students
WHERE First_Name LIKE '%a';

-- ============================================================
-- 7. IN OPERATOR
-- ============================================================

SELECT *
FROM Students
WHERE City IN ('Mumbai','Pune');

-- ============================================================
-- 8. BETWEEN
-- ============================================================

SELECT *
FROM Students
WHERE Age BETWEEN 21 AND 23;

-- ============================================================
-- 9. DISTINCT
-- ============================================================

SELECT DISTINCT City
FROM Students;

-- ============================================================
-- 10. ORDER BY
-- ============================================================

SELECT *
FROM Students
ORDER BY Age ASC;

SELECT *
FROM Students
ORDER BY Age DESC;

-- ============================================================
-- 11. UPDATE
-- ============================================================

UPDATE Students
SET City='Hyderabad'
WHERE Student_ID=1;

-- ============================================================
-- 12. DELETE
-- ============================================================

DELETE FROM Students
WHERE Student_ID=5;

-- ============================================================
-- 13. AGGREGATE FUNCTIONS
-- ============================================================

SELECT COUNT(*) FROM Students;

SELECT MAX(Age) FROM Students;

SELECT MIN(Age) FROM Students;

SELECT AVG(Age) FROM Students;

SELECT SUM(Age) FROM Students;

-- ============================================================
-- 14. GROUP BY
-- ============================================================

SELECT City,
COUNT(*) AS Total_Students
FROM Students
GROUP BY City;

-- ============================================================
-- 15. HAVING
-- ============================================================

SELECT City,
COUNT(*) AS Total_Students
FROM Students
GROUP BY City
HAVING COUNT(*) > 1;

-- ============================================================
-- 16. ALTER TABLE
-- ============================================================

ALTER TABLE Students
ADD Email VARCHAR(100);

ALTER TABLE Students
MODIFY Email VARCHAR(150);

ALTER TABLE Students
DROP COLUMN Email;

-- ============================================================
-- 17. CREATE DEPARTMENT TABLE
-- ============================================================

CREATE TABLE Department (
Dept_ID INT PRIMARY KEY,
Dept_Name VARCHAR(50)
);

INSERT INTO Department
VALUES
(101,'HR'),
(102,'IT'),
(103,'Finance'),
(104,'Marketing');

-- ============================================================
-- 18. CREATE EMPLOYEE TABLE
-- ============================================================

CREATE TABLE Employee (
Emp_ID INT PRIMARY KEY,
Emp_Name VARCHAR(50),
Salary DECIMAL(10,2),
Dept_ID INT,
FOREIGN KEY (Dept_ID)
REFERENCES Department(Dept_ID)
);

INSERT INTO Employee
VALUES
(1,'Raj',50000,101),
(2,'Amit',60000,102),
(3,'Priya',55000,103),
(4,'Neha',45000,101),
(5,'Rohan',70000,102);

-- ============================================================
-- 19. INNER JOIN
-- ============================================================

SELECT E.Emp_Name,
D.Dept_Name,
E.Salary
FROM Employee E
INNER JOIN Department D
ON E.Dept_ID = D.Dept_ID;

-- ============================================================
-- 20. LEFT JOIN
-- ============================================================

SELECT E.Emp_Name,
D.Dept_Name
FROM Employee E
LEFT JOIN Department D
ON E.Dept_ID = D.Dept_ID;

-- ============================================================
-- 21. RIGHT JOIN
-- ============================================================

SELECT E.Emp_Name,
D.Dept_Name
FROM Employee E
RIGHT JOIN Department D
ON E.Dept_ID = D.Dept_ID;

-- ============================================================
-- 22. SUBQUERY
-- ============================================================

SELECT *
FROM Employee
WHERE Salary >
(
SELECT AVG(Salary)
FROM Employee
);

-- ============================================================
-- 23. CASE STATEMENT
-- ============================================================

SELECT Emp_Name,
Salary,
CASE
WHEN Salary >= 65000 THEN 'High'
WHEN Salary >= 50000 THEN 'Medium'
ELSE 'Low'
END AS Salary_Level
FROM Employee;

-- ============================================================
-- 24. VIEW
-- ============================================================

CREATE VIEW Employee_View AS
SELECT Emp_Name,
Salary
FROM Employee;

SELECT *
FROM Employee_View;

-- ============================================================
-- 25. INDEX
-- ============================================================

CREATE INDEX idx_emp_name
ON Employee(Emp_Name);

SHOW INDEX FROM Employee;

-- ============================================================
-- 26. TRANSACTION
-- ============================================================

START TRANSACTION;

UPDATE Employee
SET Salary = Salary + 5000
WHERE Emp_ID = 1;

ROLLBACK;

START TRANSACTION;

UPDATE Employee
SET Salary = Salary + 5000
WHERE Emp_ID = 1;

COMMIT;

-- ============================================================
-- 27. STORED PROCEDURE
-- ============================================================

DELIMITER //

CREATE PROCEDURE GetEmployees()
BEGIN
SELECT * FROM Employee;
END //

DELIMITER ;

CALL GetEmployees();

-- ============================================================
-- 28. TRIGGER
-- ============================================================

CREATE TABLE Employee_Log (
Log_ID INT AUTO_INCREMENT PRIMARY KEY,
Emp_ID INT,
Log_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER trg_employee_insert
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN
INSERT INTO Employee_Log(Emp_ID)
VALUES(NEW.Emp_ID);
END //

DELIMITER ;

-- ============================================================
-- 29. WINDOW FUNCTION
-- ============================================================

SELECT Emp_Name,
Salary,
RANK() OVER (ORDER BY Salary DESC) AS Rank_No
FROM Employee;

-- ============================================================
-- 30. TRUNCATE TABLE
-- ============================================================

TRUNCATE TABLE Students;

-- ============================================================
-- END OF COMPLETE SQL PRACTICE SCRIPT
-- ============================================================