
# SQL Basic to Advanced Practice 🚀

A complete MySQL practice repository designed for students and beginners who want to learn SQL from scratch and progress to advanced concepts.

This project contains structured SQL scripts covering database creation, table management, data manipulation, joins, views, indexes, and more.

---

## 📚 Topics Covered

### 1. Database Operations
- CREATE DATABASE
- USE DATABASE
- SHOW DATABASES

### 2. Table Operations (DDL)
- CREATE TABLE
- ALTER TABLE
- DROP TABLE
- TRUNCATE TABLE

### 3. Data Manipulation (DML)
- INSERT
- UPDATE
- DELETE

### 4. Data Query Language (DQL)
- SELECT
- WHERE
- ORDER BY
- DISTINCT
- BETWEEN
- IN
- LIKE

### 5. Aggregate Functions
- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

### 6. Grouping Data
- GROUP BY
- HAVING

### 7. Relationships
- Primary Key
- Foreign Key

### 8. SQL Joins
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL JOIN (Concept)

### 9. Database Objects
- Views
- Indexes

### 10. Advanced Concepts
- Transactions
- Stored Procedures
- Constraints
- Query Optimization Basics

---

## 📂 Repository Structure

```text
SQL-Basic-to-Advanced/
│
├── SQL_Basic_Practice.sql
│   ├── Student Table
│   ├── Department Table
│   ├── Employee Table
│   ├── Aggregate Functions
│   ├── Joins
│   ├── Views
│   └── Indexes
│
├── SQL_Basic_to_ADVANCED.sql
│   ├── Beginner SQL Queries
│   ├── Intermediate Concepts
│   ├── Advanced Queries
│   ├── Constraints
│   ├── Joins
│   ├── Views
│   └── Procedures
│
└── README.md
```

---

## 🛠 Requirements

- MySQL Server 8.0+
- MySQL Workbench (Recommended)

Download:

- MySQL Server
- MySQL Workbench

---

## ▶️ How to Run

### Step 1: Open MySQL Workbench

Connect to your MySQL Server.

### Step 2: Import Script

Open:

```sql
SQL_Basic_Practice.sql
```

or

```sql
SQL_Basic_to_ADVANCED.sql
```

### Step 3: Execute

Click the ⚡ Execute button or use:

```text
Ctrl + Shift + Enter
```

to run the entire script.

---

## 📝 Sample Query

```sql
SELECT E.Emp_Name,
       D.Dept_Name,
       E.Salary
FROM Employee E
INNER JOIN Department D
ON E.Dept_ID = D.Dept_ID;
```

---

## 🎯 Learning Outcome

After completing these scripts, you will understand:

- Database Creation
- Table Design
- CRUD Operations
- Filtering Data
- Sorting Data
- Aggregate Functions
- Grouping
- Relationships
- SQL Joins
- Views
- Indexes
- Transactions
- Stored Procedures

---

## 👨‍💻 Author

**Bhavesh Patil**

Data Science Student  
Passionate about Data Analytics, SQL, Python, Machine Learning, and Data Science.

GitHub: Add your GitHub profile link here.

---

## ⭐ Support

If this repository helped you learn SQL, consider giving it a ⭐ on GitHub.

Happy Learning! 🚀
