Homework 5

Easy-Level Tasks

1.
select ProductName as Name
from Products

2.
Select * from Customers as Cliants

3.
select ProductName 
from Products
Union
select ProductName 
from Products_Discounted

4.
select ProductName 
from Products
intersect
select ProductName 
from Products_Discounted

5.
select distinct FirstName, country
from Customers

6.
select ProductName,Price,
	case 
		when price > 1000 then 'high'
		else 'low'
	end as ProductCategory
FROM products

7.
select ProductName, StockQuantity,
IIF(StockQuantity > 100, 'yes', 'no') as StockCheck
from Products_Discounted


Medium-Level Tasks

8.
SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted

9.
SELECT ProductName
FROM Products
EXCEPT
SELECT ProductName
FROM Products_Discounted

10.
SELECT 
    ProductName,
    Price,
    IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceCategory
FROM Products;

11.
SELECT *
FROM Employees
WHERE Age < 25 OR Salary > 60000;

12.
UPDATE Employees
SET Salary = Salary * 1.10
WHERE Department = 'HR' OR EmployeeID = 5;
--i am checking ai here)))if department is correct then i know how you work. if it is deparmentname then he is playing with me

Hard-Level Tasks

13.
SELECT 
    SaleID,
    CustomerID,
    SaleAmount,
    CASE 
        WHEN SaleAmount > 500 THEN 'Top Tier'
        WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
        ELSE 'Low Tier'
    END AS SaleCategory
FROM Sales;

14.
SELECT CustomerID
FROM Orders
EXCEPT
SELECT CustomerID
FROM Sales;

15.
SELECT 
    CustomerID,
    Quantity,
    CASE 
        WHEN Quantity = 1 THEN '3%'
        WHEN Quantity > 1 AND Quantity <= 3 THEN '5%'
        ELSE '7%'
    END AS DiscountPercentage
FROM Orders;
