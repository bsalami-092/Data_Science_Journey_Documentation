-- 1) Display all customer names and emailaddresses from the customer table.
SELECT CONCAT_WS(' ', First_name, Last_name) AS Customer_Name, Email
FROM Customer;

-- 2) Show the film titles and their rental rates from the film table.
SELECT Title, Rental_rate
FROM Film;

-- 3) Display the rental IDs, rental dates, and return dates from the rental table.
SELECT Rental_ID, Rental_Date, Return_Date
FROM Rental;

-- 4) Show the inventory IDs and the corresponding film IDs from the inventory table.
SELECT Inventory_ID, Film_ID
FROM Inventory;

-- 5) Display the staff IDs, first names, and last names from the staff table.
SELECT Staff_ID, First_Name, Last_Name
FROM Staff;

-- 6) Show the payment IDs, amount, and payment dates from the payment table.
SELECT Payment_ID, Amount, Payment_Date
FROM Payment;

-- 7) Display the rental IDs, customer IDs, and staff IDs from the rental table.
SELECT Rental_ID, Customer_ID, Staff_ID
FROM Rental;

-- 8) Show the film IDs and titles of all films in the film table.
SELECT Film_ID, Title
FROM Film;

-- 9) Display the store IDs and addresses from the store table.
SELECT Store_ID, Address_ID
FROM Store;

-- 10) Show the customer IDs, first names, and last names of all customers in the customer table.
SELECT Customer_ID, First_Name, Last_Name
FROM Customer;

-- 11) Show the staff IDs and email addresses from the staff table.
SELECT Staff_ID, Email
FROM Staff;

-- 12) Display the payment IDs, customer IDs, and staff IDs from the payment table.
SELECT Payment_ID, Customer_ID, Staff_ID
FROM Payment;

-- 13) Show the rental IDs, inventory IDs, and customer IDs from the rental table.
SELECT Rental_ID, Inventory_ID, Customer_ID
FROM Rental;

-- 14) Display the film IDs, titles, and rental rates of all films in the film table.
SELECT Film_ID, Title, Rental_Rate
FROM Film;

-- 15) Show the customer IDs, first names, last names, and email addresses from the customer table.
SELECT Customer_ID, First_Name, Last_Name, Email
FROM Customer;

-- 16) Display the rental IDs, rental dates, and inventory IDs from the rental table.
SELECT Rental_ID, Rental_Date, Inventory_ID
FROM Rental;

-- 17) Show the staff IDs, first names, last names, and email addresses from the staff table.
SELECT Staff_ID, First_Name, Last_Name, Email
FROM Staff;

-- 18) Display the payment IDs, amounts, and customer IDs from the payment table.
SELECT Payment_ID, Amount, Customer_ID
FROM Payment;

-- 19) Show the inventory IDs, film IDs, and store IDs from the inventory table.
SELECT Inventory_ID, Film_ID, Store_ID
FROM Inventory;

 -- 20) Display the customer IDs, first names, last names, and email addresses of all customers who live in district California	
 --     from the customer table.
 SELECT C.Customer_ID, C.First_Name, C.Last_Name, C.Email
 FROM Customer C
 JOIN Address A ON C.Address_ID = A.Address_ID
 WHERE A.District = 'California';
 
-- 21) Show the rental IDs, rental dates, and return dates of all rentals made in May 2005 from the rental table.
/*SELECT Rental_ID, Rental_Date, Return_Date
FROM Rental
WHERE Rental_Date BETWEEN '2005-05-01'
AND '2005-06-01';
Would've have written it this way but thanks to ChatGPT for making me know the difference (Datatype). That is, This includes some data on 
June 1 (like midnight on June 1), which is not part of May.
Because the Rental_Date column stores time (as in DATETIME), you could accidentally include rentals from June 1 at exactly midnight, which 
may not be what you want.*/
SELECT Rental_ID, Rental_Date, Return_Date
FROM Rental
WHERE Rental_Date >= '2005-05-01'
AND Rental_Date < '2005-06-01';

-- 22) Display the staff IDs, first names, last names, and email addresses of all staff members who work in store 1 from the staff table.
SELECT Staff_ID, First_Name, Last_Name, Email
FROM Staff 
WHERE Staff_ID = 1 ;

-- 23) Show the payment IDs, amounts, and customer IDs of all payments made on May 14th, 2005 from the payment table.
SELECT Payment_ID, Amount, Customer_ID
FROM Payment
WHERE Payment_Date = '2005-05-14';

-- 24) Display the rental IDs, customer IDs, and staff IDs of all rentals made by customer ID 1 from the rental table.
SELECT Rental_ID, Customer_ID, Staff_ID
FROM Rental
WHERE Customer_ID = 1;

-- 25) Show the film IDs, titles, and rental rates of all films with a rental rate greater than or equal to 4 from the film table.
SELECT Film_ID, Title, Rental_Rate
FROM Film
WHERE Rental_rate >= 4;

-- 26) Display the customer IDs, first names, last names, and email addresses of all customers whose first name starts 
--    with 'A'  from the customer table.
SELECT Customer_ID, First_Name, Last_Name, Email
FROM Customer 
WHERE Left(First_Name, 1) IN ('A');

-- 27) Show the rental IDs, rental dates, and inventory IDs of all rentals made in store 2 from the rental table.
SELECT R.Rental_ID, R.Rental_Date, R.Inventory_ID
FROM Rental R
JOIN Staff S ON R.Staff_ID = S.Staff_ID
WHERE S.Store_ID = 1;

-- 28) Display the staff IDs, first names, lastnames, and email addresses of all staff members who have a last name 
--     starting with 'S' from the staff table.
 SELECT Staff_ID, First_Name, Last_Name, Email
 FROM staff
 WHERE LEFT (Last_Name, 1) = 'S';
 
-- 29) Show the payment IDs, amounts, and customer IDs of all payments made by customer ID 2 from the payment table.
SELECT Payment_ID, Amount, Customer_ID
FROM Payment
WHERE Customer_ID = 2;

-- 30) Display the rental IDs, customer IDs, and staff IDs of all rentals made on May 14th, 2005 from the rental table.
SELECT Rental_ID, Customer_ID, Staff_ID
FROM Rental
WHERE Rental_Date = '2005-05-14';

-- 31) Show the film IDs, titles, and rental rates of all films with a rental rate less than or equal to 3 from the film table
SELECT Film_ID, Title, Rental_Rate
FROM Film 
WHERE Rental_Rate <= 3;

-- 32) Show the rental IDs, rental dates, and return dates of all rentals where the return date is null from the rental table.
SELECT Rental_ID, Rental_Date, Return_Date
FROM Rental
WHERE Return_Date IS NULL;

-- 33) Display the staff IDs, first names, last names, and email addresses of all staff members who work in store 2 from the staff table.
 SELECT Staff_ID, First_Name, Last_Name, Email
 FROM Staff 
 WHERE Store_ID = 2;
 
-- 34) Show the payment IDs, amounts, and customer IDs of all payments made in June 2005 from the payment table.
SELECT Payment_ID, Amount, Customer_ID
FROM Payment
WHERE Payment_Date >= '2005-06-01'
AND Payment_Date < '2005-07-01';

-- 35) Display the rental IDs, customer IDs, and staff IDs of all rentals where the return date is null and the rental date
--     is before May 30th, 2005 from the rental table.
SELECT Rental_ID, Customer_ID, Staff_ID
FROM Rental
WHERE Return_Date IS NULL
AND Rental_Date < '2005-05-30';

-- 36) Show the film IDs, titles, and rental rates of all films in the drama category from the film table.
SELECT F.Film_ID, F.Title, F.Rental_Rate
FROM Film F
JOIN Film_Category FC ON F.Film_ID = FC.Film_ID
JOIN Category C ON FC.Category_ID = C.Category_ID
WHERE C.`Name` = 'Drama';

-- 37) Display the customer IDs, first names, last names, and email addresses of all customers whose email address contains 'gmail.com'
--     from the customer table.
SELECT Customer_ID, First_Name, Last_Name, Email
FROM Customer
WHERE Email LIKE '%gmail.com';

-- 38) Show the rental IDs, rental dates, and inventory IDs of all rentals made by customer ID 2 in store 2 from the rental table.
SELECT R.Rental_ID, R.Rental_Date, R.Inventory_ID
FROM Rental R
JOIN Staff S ON R.Staff_ID = S.Staff_ID
WHERE R.Customer_ID = 2
AND S.Store_ID =2;

-- 39) Display the staff IDs, first names, last names, and email addresses of all staff members who work in store 1 or 2 from the staff table.
SELECT Staff_ID, First_Name, Last_Name, Email
FROM Staff
WHERE Store_ID = 1
OR Store_ID = 2;

-- 40) Show the payment IDs, amounts, and customer IDs of all payments made by customer ID 1 or 2 from the payment table.
SELECT Payment_ID, Amount, Customer_ID
FROM Payment
WHERE Customer_ID = 1
OR Customer_ID = 2;

-- 41) Display the rental IDs, customer IDs, and staff IDs of all rentals where the rental date
--     is between May 1st, 2005 and May 31st, 2005 from the rental table.
 SELECT Rental_ID, Customer_ID, Staff_ID
 FROM Rental
 WHERE Rental_Date BETWEEN '2005-05-01'
 AND '2005-05-31';
 
-- 42) Show the film IDs, titles, and rental rates of all films in the comedy or drama category from the film table.
SELECT F.Film_ID, F.Title, F.Rental_Rate
FROM Film F
JOIN Film_Category FC ON F.Film_ID = FC.Film_ID
JOIN Category C ON FC.Category_ID = C.Category_ID
WHERE C.`Name` = 'Comedy'
OR C.`Name` = 'Drama';

-- 43) Display the customer IDs, first names, last names, and email addresses of all customers who live 
--    in city 'London' or 'Sydney' from the customer table.
SELECT C.Customer_ID, C.First_Name, C.Last_Name, Email
FROM Customer C
JOIN Address A ON C.Address_ID = A.Address_ID
JOIN City CT ON  A.City_ID = CT.City_ID
WHERE CT.City IN ('London','Sydney');

-- 44)Show the rental IDs, rental dates, and inventory IDs of all rentals made by customer ID 1 or 2 in store 1 from the rental table.
SELECT R.Rental_ID, R.Rental_Date, R.Inventory_ID
FROM Rental R
JOIN Staff S ON R.Staff_ID = S.Staff_ID
WHERE R.Customer_ID = 1
OR R.Customer_ID = 2
AND S.Store_ID = 1;

-- 45)	Display the staff IDs, first names, last names, and email addresses of all staff members who work in store 1 and have
--     a last name starting with 'B' from the staff table.
SELECT Staff_ID, First_Name, Last_Name, Email
FROM Staff
WHERE Store_ID = 1
AND LEFT(Last_Name, 1) = 'B';

-- 46)	Show the payment IDs, amounts, and customer IDs of all payments made between May 1st, 2005 and May 31st, 2005 from the payment table.
SELECT Payment_ID, Amount, Customer_ID
FROM Payment
WHERE Payment_Date BETWEEN '2025-05-01'
AND '2005-05-31';

-- 47) Display the rental IDs, customer IDs, and staff IDs of all rentals made in store 1 or 2 where the return date
--     is null from the rental table.
SELECT Rental_ID, Customer_ID, Staff_ID
FROM Rental
WHERE Return_Date IS NULL;

-- 48) Show the film IDs, titles, and rental rates of all films in the horror, drama, or action category from the film table.
SELECT F.Film_ID, F.Rental_Rate
FROM Film F
JOIN Film_Category FC ON F.Film_ID = FC.Film_ID
JOIN Category C ON FC.Category_ID = C.Category_ID
WHERE C.`Name` IN ('Horror', 'Drama', 'Action');

