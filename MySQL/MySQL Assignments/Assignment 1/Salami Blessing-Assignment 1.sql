-- PART1: DATABASE AND TABLE CREATION

CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE Employees(
EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
DateOfBirth DATE,
HireDate DATE,
Salary DECIMAL(10,2)
);

CREATE TABLE Departments(
DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
DepartmentName VARCHAR(50)
);

CREATE TABLE Projects(
ProjectID INT PRIMARY KEY AUTO_INCREMENT,
ProjectName VARCHAR(50),
StartDate DATE,
EndDate DATE
);

-- PART2: POPULATING THE TABLES

INSERT INTO Departments(DepartmentName) VALUES
('HR'),('IT'),('Finance');

INSERT INTO Employees(FirstName,LastName,DateOfBirth,HireDate,Salary) VALUES
('Blessing', 'Salami', '1995-04-03', '2020-11-16', 200000),
('Michael', 'John', '2000-01-23', '2025-03-05', 150000),
('Abbey', 'Ojomu', '1998-10-17', '2019-12-04', 500000),
('Nathaniel', 'Bassey', '1992-06-06', '2017-09-25', 347500),
('Dunsin', 'Oyekan', '1993-03-05', '2017-05-26', 435000);

INSERT INTO Projects(ProjectName,StartDate,EndDate) VALUES
('DataSphere', '2021-01-20', '2021-04-20'),
('InsightHub', '2021-05-03', '2021-08-26'),
('Predictify', '2021-09-06', '2021-12-15');

-- PART3: ALTERING TABLES

ALTER TABLE Employees
ADD COLUMN Email VARCHAR(100);

ALTER TABLE Departments
MODIFY DepartmentName CHAR(100);

ALTER TABLE  Projects
DROP EndDate;

-- IMPORTANT:
-- 1) FOREIGN KEY RELATIONSHIP

ALTER TABLE Employees
ADD COLUMN DepartmentName VARCHAR(50);

UPDATE Employees
SET DepartmentName = 'HR'
WHERE EmployeeID = 1;

UPDATE Employees
SET DepartmentName = 'Finance'
WHERE EmployeeID = 2;

UPDATE Employees
SET DepartmentName = 'IT'
WHERE EmployeeID = 3;

UPDATE Employees
SET DepartmentName = 'HR'
WHERE EmployeeID = 4;

UPDATE Employees
SET DepartmentName = 'Finance'
WHERE EmployeeID = 5;


ALTER TABLE Employees
ADD COLUMN DepartmentID INT,
ADD CONSTRAINT FOREIGN KEY (DepartmentID)
REFERENCES Departments(DepartmentID);

ALTER TABLE Projects
ADD COLUMN ManagerID INT UNIQUE;

ALTER TABLE Employees
ADD COLUMN ManagerID INT,
ADD CONSTRAINT FOREIGN KEY (ManagerID)
REFERENCES Projects(ManagerID);

-- 2) DATA VALIDATION

ALTER TABLE Employees
ADD CONSTRAINT 
CHECK (Salary >= 20000);

ALTER TABLE Employees
ADD CONSTRAINT UNIQUE (Email);
