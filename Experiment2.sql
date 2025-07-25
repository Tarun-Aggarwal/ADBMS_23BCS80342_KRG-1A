--                           EXPERIMENT 2

CREATE DATABASE EmployeeInfo

USE EmployeeInfo;


--    Question 1

CREATE TABLE Employee (
	EmpID INT PRIMARY KEY,
    Ename VARCHAR(20),
	Department VARCHAR(20),
    ManagerID INT
);

INSERT INTO Employee VALUES 
(1, "Alice", "HR", NULL), 
(2, "Bob", "Finance", 1), 
(3, "Casey", "IT", 1), 
(4, "David", "Finance", 2), 
(5, "Eve", "IT", 3),
(6, "Frank", "HR", 1);

SELECT * FROM Employee;

SELECT 
	b.Ename AS "EmployeeName", 
    b.Department AS "EmployeeDept", 
    a.Ename AS "ManagerName",
    a.Department AS "ManagerDept"
FROM Employee a
RIGHT JOIN Employee b
ON a.EmpID = b.ManagerID;



--    Question 2

CREATE TABLE Year_tbl (
	ID INT,
	YEAR year,
    NPV INT,
    PRIMARY KEY (ID, YEAR)
);

CREATE TABLE Queries_tbl (
	ID INT,
    YEAR year,
    PRIMARY KEY (ID, YEAR)
);

INSERT INTO Year_tbl VALUES 
(1, 2018, 100), 
(7, 2020, 30), 
(13, 2019, 40), 
(1, 2019, 113), 
(2, 2008, 121), 
(3, 2009, 12), 
(11, 2020, 99), 
(7, 2019, 0);

INSERT INTO Queries_tbl VALUES 
(1, 2019), 
(2, 2008), 
(3, 2009), 
(7, 2018), 
(7, 2019), 
(7, 2020), 
(13, 2019);

SELECT 
	Q.ID, 
    Q.YEAR, 
    IFNULL(Y.NPV, 0) AS NPV
FROM Year_tbl AS Y
RIGHT JOIN Queries_tbl AS Q
ON Y.ID = Q.ID 
  AND Y.YEAR = Q.YEAR;





--    LEETCODE Homework (Q. Combine Two tables)

SELECT firstName, lastName, city, state
FROM Person AS p
LEFT JOIN Address AS a
ON p.personId = a.personId;
