-- 1). Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of who they report to as manager from the employees table sorted by Employee 
SELECT E.EmployeeID, CONCAT(E.LastName, ' ', E.FirstName) AS Employee, CONCAT(M.LastName, ' ', M.FirstName) AS Manager
FROM Employees E
LEFT JOIN Employees M ON E.ReportsTo = M.EmployeeID
ORDER BY Employee;

-- 2). Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice and MaximumPrice respectively.
SELECT AVG(UnitPrice) AS AveragePrice, MIN(UnitPrice) AS MinimumPrice, MAX(UnitPrice) AS MaximumPrice
FROM Products;

-- 3). Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City,Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table. 
CREATE VIEW CustomerInfo AS SELECT
C.CustomerID, C.CompanyName, C.ContactName, C.ContactTitle, C.Address, C.City, C.Country, C.Phone,
 O.OrderDate, O.RequiredDate, O.ShippedDate
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID;

-- 4). Change the name of the view you created from customerinfo to customer details
DROP VIEW CustomerInfo;

CREATE VIEW CustomerDetails AS SELECT
C.CustomerID, C.CompanyName, C.ContactName, C.ContactTitle, C.Address, C.City, C.Country, C.Phone,
 O.OrderDate, O.RequiredDate, O.ShippedDate
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID;

-- 5). Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and categories tables.
CREATE VIEW ProductDetails AS SELECT
P.ProductID, S.CompanyName, P.ProductName, C.CategoryName, C.`Description`, P.QuantityPerUnit, 
P.UnitPrice, P.UnitsInStock, P.UnitsOnOrder, P.ReorderLevel, P.Discontinued
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
JOIN Suppliers S ON P.SupplierID = S.SupplierID;

-- 6). Drop the customer details view.
DROP VIEW CustomerDetails;

-- 7). Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo
SELECT LEFT(CategoryName,5) AS ShortInfo
FROM Categories;

-- 8). . Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table 
CREATE TABLE Shippers_duplicate LIKE Shippers;

INSERT INTO Shippers_duplicate 
SELECT *FROM Shippers;

-- 9) Create a select statement that outputs the following from the shippers_duplicate Table:
ALTER TABLE Shippers_duplicate
ADD Column Email VARCHAR(50) UNIQUE;

UPDATE Shippers_duplicate
SET Email = 'speedyexpress@gmail.com'
WHERE ShipperID = 1;

UPDATE Shippers_duplicate
SET Email = 'unitedpackage@gmail.com'
WHERE ShipperID = 2;

UPDATE Shippers_duplicate
SET Email = 'federalshipping@gmail.com'
WHERE ShipperID = 3;

SELECT *FROM Shippers_duplicate;

-- 10). Create a report that shows the CompanyName and ProductName from all product in the Seafood category
SELECT S.CompanyName, P.ProductName
FROM Products P
JOIN Suppliers S ON P.SupplierID = S.SupplierID
JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE C.CategoryName = 'Seafood';

-- 11). Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5.
SELECT C.CategoryID, S.CompanyName, P.ProductName
FROM Products P
JOIN Suppliers S ON P.SupplierID = S.SupplierID
JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE C.CategoryID = 5;

-- 12). Delete the shippers_duplicate table.
DROP TABLE Shippers_duplicate;

-- 13). Create a select statement that ouputs the following from the employees table.
SELECT LastName, FirstName, Title, TIMESTAMPDIFF(YEAR, BirthDate, '2025-05-09') AS Age
FROM Employees;

-- 14). Create a report that the CompanyName and total number of orders by customer renamed as number of orders since Decemeber 31, 1994. Show number of Orders greater than 10.
SELECT C.CompanyName, COUNT(O.OrderID) AS Number_of_orders
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE  O.OrderDate > '1994-12-31'
GROUP BY C.CompanyName
HAVING COUNT(O.OrderID) > 10 ;

-- 15). Create a select statement that ouputs the following from the product table
SELECT CONCAT(ProductName, ' weighs/is', QuantityPerUnit, ' and cost $',ROUND(UnitPrice)) AS ProductInfo
FROM Products;
