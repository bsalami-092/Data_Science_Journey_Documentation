/* wRITE A QUERY THAT RETURNS THE CUSTOMERID, contactname, territoryid, productname,unitprice*/
SELECT C.CustomerID, C.ContactName, ET.territoryID, P.ProductName, OD.UnitPrice
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN `Order Details` OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
JOIN Employeeterritories ET ON O.EmployeeID = ET.EmployeeID ;

-- SUBQUERIES
/*Write a query that returns all the salaries greater than or equal to the average salary*/
SELECT AVG(Salary)
FROM Employees;

SELECT FirstName, Salary
FROM Employees
WHERE Salary >= 2262.5477701822915;

-- OR
SELECT FirstName, Salary
FROM Employees
WHERE Salary >=(SELECT AVG(Salary)
FROM Employees);

/*Write a query that returns results where the salary is greater than Michael's own(FirstName)*/
SELECT FirstName, Salary
FROM Employees
WHERE  Salary > (SELECT FirstName
FROM Employees
WHERE FirstName = 'Michael');

/*Write a query that returns products with the highest reorderlevel*/
SELECT ProductName, ReorderLevel
FROM Products
WHERE ReorderLevel =(SELECT MAX(ReorderLevel)
FROM Products);

-- CASE WHEN
/*Write a query that groups the level of quantity ordered by the customer, if quqntity is more than 30 "Good Customer", equal to 30 'Average Customer' and the remaining should be "Yet to be our customers".*/
SELECT OrderID, ProductID, Quantity,
CASE
    WHEN Quantity > 30 THEN "Good Customer"
	WHEN Quantity = 30 THEN "Average Customer"
    WHEN Quantity < 30 THEN "Yet to be our Customer"
END AS QuantityCheck
FROM `Order Details`;

/* 'Classify Products by Price Range"
Using the Northwind database, write a SQL query to list each product's name, category, and a new column called PriceRange
that categorizes each product as follows:
'Low' if the unit price is less than 20
'Medium' if the unit price is between 20 and 50(inclusive)
'High' if the unit price is above 50 */
SELECT P.ProductName, C.CategoryName, P.UnitPrice,
CASE
   WHEN UnitPrice < 20 THEN 'Low'
   WHEN UnitPrice BETWEEN 20 AND 50 THEN 'Medium'
   ELSE 'High'
END AS PriceRange
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID;

-- TEXT FUNCTION
SELECT UPPER(FirstName)
FROM Employees;

SELECT LOWER(LastName)
FROM Employes;

SELECT LENGTH(FirstName)
FROM Employees;

-- SUBSTRING
SELECT SUBSTRING('Oluwabukola', 6); 

SELECT SUBSTRING( FirstName, 1, 3)
FROM Employees;

-- VIEWS AND CTE
/* Create a view that returns the orderid, unitprice, quantity and the total price the customer is paying, and then
 another column that carries 20% of the total amount*/
CREATE VIEW ProductInfo AS
SELECT OrderID, UnitPrice, Quantity, (UnitPrice * Quantity) AS TotalPrice, (UnitPrice * Quantity*0.20) AS Discount
FROM `Order Details`;

SELECT *FROM ProductInfo;

-- Using the ProductInfo View, write a query than returns the actual amount the customer is paying given 20% discount
SELECT OrderID, TotalPrice - Discount AS ActualAmount
FROM ProductInfo;

SELECT OrderID, (UnitPrice * Quantity* 0.80) AS ActualAmount
FROM ProductInfo;

/* Create  a view named Customerdetails which stores the customerid, categoryid,orderid and total amount paid for the goods
bought and the amount paid if given 5% discount*/

CREATE VIEW Customerdetails AS
SELECT O.CustomerID, P.CategoryID, O.OrderID,
 (OD.UnitPrice * OD.Quantity) AS TotalAmount, (OD.UnitPrice * OD.Quantity * 0.05) AS DiscountedAmount, (OD.UnitPrice * OD.Quantity * 0.95) AS ActualAmountPaid
 FROM `Order Details` OD
 JOIN Products P ON OD.ProductID = P.ProductID
 JOIN Orders O ON O.OrderID = OD.OrderID;

SELECT *FROM Customerdetails;

-- CTE : Common Table Expression
/* Create  a CTE named Customerdetails which stores the customerid, categoryid,orderid and total amount paid for the goods
bought and the actual amount paid if given 5% discount*/

WITH Customerdetails AS (
SELECT O.CustomerID AS ID, P.CategoryID AS CATID, O.OrderID AS OrderID, (OD.UnitPrice * OD.Quantity) AS TotalPrice, (OD.UnitPrice * OD.Quantity * 0.05) AS Discount
FROM Orders O
JOIN `Order Details` OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID)
SELECT ID, OrderID, TotalPrice, Discount, TotalPrice - Discount AS ActualAmount
FROM Customerdetails;
-- We use the alias as in ID,CATID and so on because we used join

-- USE AS CTE
/*Using the Northwind database, write a SQL query to list each product's name, category, and a new column called PriceRange
that categorizes each product as follows:
'Low' if the unit price is less than 20
'Medium' if the unit price is between 20 and 50(inclusive)
'High' if the unit price is above 50 */

WITH Pricing AS (
SELECT P.ProductName AS ProductName, C.CategoryName AS CategoryName, P.UnitPrice AS UnitPrice,
CASE
   WHEN UnitPrice < 20 THEN 'Low'
   WHEN UnitPrice BETWEEN 20 AND 50 THEN 'Medium'
   ELSE 'High'
END AS PriceRange
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID)
SELECT ProductName, CategoryName, UnitPrice, PriceRange
FROM Pricing;

/* Using a CTE, write a query that returns customerid, orderid, unitprice, quantity, and total amount paid by thE customer and then
 using the cte, write a query using case when to group them, if total amount is more than 150 then 'Better Person', lower than 150
 but not lesser than 100 'You dey try', lesser than 100, 'You no try at all'*/
 
 WITH PriceInfo AS(
 SELECT O.Customerid AS CustomerID, O.Orderid AS OrderID, OD.UnitPrice AS Price, 
 OD.Quantity AS Quantity, (OD.UnitPrice * OD.Quantity) AS TotalAmount
 FROM Orders O
 JOIN `Order Details` OD ON O.OrderID = OD.OrderID)
 SELECT CustomerID, OrderID, TotalAmount,
 CASE
     WHEN TotalAmount > 150 THEN 'Better Person'
     WHEN TotalAmount < 100 THEN 'You no try at all'
     ELSE 'You dey try'
END AS CustomerDescription
FROM PriceInfo;


-- WINDOWS FUNCTION : adds more details and meaning to a result.
-- Find the total sales made by company
SELECT SUM(UnitPrice * Quantity) AS TotalSales
FROM `Order Details`;
 
 -- Find the total sales for each product
SELECT P.ProductName, SUM(OD.UnitPrice * OD.Quantity) AS TotalSales
FROM `Order Details` OD
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY ProductName;

-- OR
SELECT ProductID, SUM(UnitPrice * Quantity) AS TotalSales
FROM `Order Details`
GROUP BY 1;

 -- Find the total sales of the company and additionally provide details such as orderid
SELECT OrderID, SUM(UnitPrice * Quantity) OVER() AS TotalSales
FROM `Order Details`;

-- OVER() helps to bting out more details

-- Find the total sales for each product and additionally provide details such as orderid, show total amount by each productid
SELECT OrderID, ProductID, SUM( UnitPrice * Quantity) OVER(PARTITION BY ProductID) AS TotalAmount
FROM `Order Details`;

/*Find the total sales across all orders and find the total sales of each product*/
SELECT OrderID, ProductID, SUM( UnitPrice * Quantity) OVER(PARTITION BY ProductID) AS TotalAmount, SUM(UnitPrice * Quantity) OVER() AS TotalSales
FROM `Order Details`;

/*Rank each order based on the amount from the highest to the lowest and additionally provide details such as orderid and orderdate*/
SELECT O.OrderID, O.OrderDate, SUM( OD.UnitPrice * OD.Quantity) AS TotalAmount,
RANK() OVER(ORDER BY SUM( OD.UnitPrice * OD.Quantity) DESC) AS RankSales
FROM Orders O
JOIN `Order Details` OD ON O.OrderID = OD.OrderID
GROUP BY OrderID;

/*Find the total number of orders and additionally provide details such as orderid and orderdate*/
SELECT OrderID, OrderDate, COUNT(OrderID) OVER() AS Number_of_Orders
FROM Orders;

-- Write a query that ranks customers based on their total purchase
SELECT O.CustomerID, SUM(  OD.UnitPrice * OD.Quantity) AS TotalPurchase,
 RANK() OVER(ORDER BY SUM(  OD.UnitPrice * OD.Quantity) DESC) AS PurchaseRank
FROM Orders O
JOIN `Order Details` OD ON O.OrderID = OD.OrderID
GROUP BY 1;

/*STORED PROCEDURE- storing of statement for future use that follow certain procedure 
*) Reusability is one of the main uses of havng a stored procedure*/

-- Create a stored procedure to get all customers
DELIMITER //
CREATE PROCEDURE PrintCustomerList()
BEGIN
     SELECT *FROM Customers;
END //

DELIMITER ;

-- USE
CALL PrintCustomerList();

/*Create a stored procedure that takes a customerid as input and retrieves all details about that customer from the customers table*/
DELIMITER //
CREATE PROCEDURE CustomerInfo( IN ID VARCHAR(10))
BEGIN 
     SELECT *FROM Customers
     WHERE CustomerID = ID;
END //

DELIMITER ;

-- USE
CALL CustomerInfo('AROUT');
CALL CustomerInfo('QUICK');

/* Create a stored procedure that calculates the total number of orders placed by a specific customer and returns it via
 an output parameter*/
DELIMITER //
CREATE PROCEDURE OrderInfo(IN Customer_ID VARCHAR(10), OUT Order_Count INT)
BEGIN
     SELECT COUNT(*) INTO Order_Count
     FROM Orders
     WHERE CustomerID = Customer_ID;
END //

DELIMITER ;

-- USE
CALL OrderInfo('QUICK', @Order_Count);
SELECT @order_Count;

SELECT Customerid, Orderdate FROM Orders WHERE Orderdate BETWEEN '1997-10-01' AND '1997-10-31';
     