-- 31. Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname.
SELECT ContactName
FROM Customers
WHERE ContactName NOT LIKE '_A%';

-- 32. Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock and maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively
SELECT CEILING(AVG(UnitPrice)) AS AveragePrice, SUM(UnitsInStock * UnitPrice) AS TotalStock, MAX(UnitsOnOrder) AS MaxOrder
FROM Products;

-- 33.Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, suppliers and categories table
SELECT P.SupplierID, S.CompanyName, C.CategoryName, P.ProductName, P.UnitPrice
FROM Products P
JOIN SupplierS S ON S.SupplierID = P.SupplierID
JOIN Categories C ON C.CategoryID= P.CategoryID;

-- 34. Create a report that shows the CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped by CustomerID. 
SELECT CustomerID, SUM(Freight) AS Sum_of_freight
FROM Orders
GROUP BY CustomerID
HAVING Sum_of_freight>200;

-- 35. Create a report that shows the OrderID, ContactName, UnitPrice, Quantity, Discount from the order details, orders and customers table with discount given on every purchase
SELECT O.OrderID, C.ContactName, R.UnitPrice, R.Quantity, R.Discount
FROM Orders O
JOIN `Order Details` R ON O.OrderID=R.OrderID
JOIN Customers C ON C.CustomerID=O.CustomerID
WHERE R.Discount > 0;
