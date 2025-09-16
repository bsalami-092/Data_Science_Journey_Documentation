USE Northwind;

-- 1. Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName.
SELECT CategoryName, `Description`
FROM Categories
ORDER BY CategoryName;

-- 2. Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone.
SELECT ContactName, CompanyName, ContactTitle, Phone
FROM Customers
ORDER BY Phone;

-- 3. Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname respectively and HireDate from the employees table sorted from the newest to the oldest employee.
SELECT UPPER(FirstName) AS FirstName, UPPER(LastName) AS Lastname, HireDate
FROM Employees
ORDER BY HireDate DESC;

-- 4. Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted by Freight in descending order.
SELECT OrderID, OrderDate, ShippedDate, CustomerID, Freight
FROM Orders
ORDER BY Freight DESC
LIMIT 10;

-- 5. Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table.
SELECT LOWER(CustomerID) AS ID
FROM Customers;

-- 6. Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the Country in descending order then by CompanyName in ascending order.
SELECT CompanyName, Fax, Phone, Country, HomePage
FROM Suppliers
ORDER BY Country DESC, CompanyName ASC;

-- 7. Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only.
SELECT CompanyName, ContactName
FROM Customers
WHERE City= 'Buenos Aires';

-- 8. Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.
SELECT ProductName, UnitPrice, QuantityPerUnit
FROM Products
WHERE UnitsInStock= 0;

-- 9. Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain.
SELECT ContactName, Address, City
FROM Customers
WHERE Country NOT IN ('Germany', 'Mexico', 'Spain');

-- 10. Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996.
SELECT OrderDate, ShippedDate, CustomerID, Freight
FROM Orders
WHERE OrderDate= '1996-05-21';

-- 11. Create a report showing FirstName, LastName, Country from the employees not from United States.
SELECT FirstName, LastName, Country
FROM Employees
WHERE Country != 'USA';

-- 12. Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later than the required date.
SELECT EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate
FROM Orders
WHERE ShippedDate > RequiredDate;

-- 13. Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B.
SELECT City, CompanyName, ContactName
FROM Customers
WHERE LEFT(City,1) IN ('A','B');

-- 14. Create a report showing all the even numbers of OrderID from the orders table.
SELECT OrderID
FROM Orders
WHERE MOD(OrderID, 2)= 0;

-- 15. Create a report that shows all the orders where the freight cost more than $500.
SELECT *FROM Orders
WHERE Freight > 500;

-- 16. Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder.
SELECT ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel
FROM Products
WHERE ReorderLevel > 0;

-- 17. Create a report that shows the CompanyName, ContactName number of all customer that have no fax number.
SELECT CompanyName, ContactName, Fax
FROM Customers
WHERE Fax IS NULL;

-- 18. Create a report that shows the FirstName, LastName of all employees that do not report to anybody.
SELECT FirstName, LastName
FROM Employees
WHERE ReportsTo IS NULL;

-- 19. Create a report showing all the odd numbers of OrderID from the orders table.
SELECT OrderID
FROM Orders
WHERE OrderID%2 =1;

-- 20. Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName.
SELECT CompanyName, ContactName, Fax
FROM Customers
WHERE Fax IS NULL
ORDER BY ContactName;

-- 21. Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name sorted by ContactName.
SELECT City, CompanyName, ContactName
FROM Customers
WHERE INSTR(City, 'L')> 0
ORDER BY ContactName;

-- 22. Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s.
SELECT FirstName, LastName, BirthDate
FROM Employees
WHERE BirthDate BETWEEN '1950-01-01' AND '1959-12-31';

-- 23. Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table.
SELECT FirstName, LastName, YEAR(BirthDate) AS BirthYear
FROM Employees;

-- 24. Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by OrderID and sorted by NumberofOrders in descending order. HINT: you will need to use a Groupby statement.
SELECT OrderID, COUNT(OrderID) AS NumberofOrders
FROM `Order details`
GROUP BY OrderID
ORDER BY NumberofOrders DESC;

-- 25. Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids, Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID
SELECT S.SupplierID, P.ProductName, S.CompanyName
FROM Suppliers S
JOIN Products P ON S.SupplierID = P.SupplierID
WHERE S.CompanyName IN ('Exotic Liquids', 'Specialty Biscuits, Ltd', 'Escargots Nouveaux')
ORDER BY S.SupplierID;

-- 26. Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders with ShipPostalCode beginning with "98124".
SELECT ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
FROM Orders
WHERE ShipPostalCode LIKE '98124%';

-- 27. Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle.
SELECT ContactName, ContactTitle, CompanyName
FROM Customers
WHERE ContactTitle NOT LIKE  '%Sales%';

-- 28. Create a report that shows the LastName, FirstName, City of employees in cities other than "Seattle";
SELECT LastName, FirstName, City
FROM Employees
WHERE City != 'Seattle';

-- 29. Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other cities in Spain other than Madrid.
SELECT CompanyName, ContactTitle, City, Country
FROM Customers
WHERE Country IN ('Mexico', 'Spain')
AND City<> 'Madrid';

-- 30. Create a select statement that outputs the following:
SELECT CONCAT(FirstName,' ',LastName,' can be reached at',' x',Extension ) AS Contactinfo
FROM Employees;