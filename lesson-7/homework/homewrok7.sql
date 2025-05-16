1.
select min(price) as MinPrice
from Products

2.
select max(salary) as MaxSalary
from Employees

3.
select count(*) As TotalCustomer
from Customers

4.
select count(distinct category) as UniqueCatergoryCount
from Products

5.
select sum(saleAmount) as totalSalesfor7
from sales
where productID = 7

6.
select avg(age) as AverageAge
from employees

7.
select departmentName, count(*) as CountEmployeesByDep
from employees
group by departmentName


8.
select
	category, 
	min(price) as MinPrice,
	max(price) as MaxPrice
from products
group by category

9.
select customerId, sum(saleAmount) as SalesAmount
from Sales
group by customeriD
order by SalesAmount desc

10.
select departmentName, count(*) as NumberOfEmployees
from employees
group by departmentName
having count(*) > 5

11.
SELECT p.category,
       SUM(s.saleamount) AS totalSales,
       AVG(s.saleamount) AS averageSales
FROM sales AS s
JOIN Products AS p ON p.productid = s.productid
GROUP BY p.category;

12.
select departmentName, count(*) from employees as NumberOfHrStaff
where departmentName = 'hr'
group by departmentname

13.
select departmentName, 
	max(salary) as MaxSalary,
	min(salary) as MinSalary
from employees
group by departmentname

14.
select departmentName,
	AVG(Salary) as avrsalary 
from employees
group by departmentname

15.
select departmentName,
	AVG(Salary) as avrsalary,
	count(*) as NumberofEmployee
from employees
group by departmentname
order by avrsalary asc

16.
select category,
avg(price) as averagePrice 
from products
group by category
having avg(price) > 400

17.
select year(saledate) as saleYear, 
sum(saleamount) as totalSales
from sales
group by year(saledate)

18.
SELECT 
    c.firstname + ' ' + c.lastname AS Fullname,
    COUNT(o.quantity) AS TotalOrders
FROM orders AS o
JOIN customers AS c ON c.customerid = o.customerid
GROUP BY c.firstname, c.lastname
ORDER BY TotalOrders DESC;

19.
select departmentname, 
avg(salary) as averageSalary
from employees
group by departmentName
having avg(salary) > 60000

20.
select 
category,
avg(price) as averagePrice
from products
group by category
having avg(price) > 150

21.
select 
	c.firstname + ' ' + lastname as fullname,
	sum(s.saleamount) as totalSales
from sales as s
join customers as c on c.customerid = s.customerid
group by c.firstname, c.lastname
having sum(s.saleamount) > 1500
order by totalsales desc

22.
select departmentname,
	sum(salary) as totalsalary,
	avg(salary) as averagesalary
from employees
group by departmentname
having avg(salary) > 65000
order by averagesalary desc

23.
SELECT 
    c.firstname + ' ' + c.lastname AS Fullname,
    SUM(CASE WHEN p.Cost > 50 THEN s.SaleAmount ELSE 0 END) AS TotalSales,
    MIN(s.SaleAmount) AS LeastPurchase
FROM Products p
JOIN Sales s ON s.ProductID = p.ProductID
JOIN Customers c ON c.CustomerID = s.CustomerID
GROUP BY c.firstname, c.lastname
ORDER BY TotalSales DESC;

24.
SELECT
    YEAR(o.OrderDate) AS SaleYear,
    MONTH(o.OrderDate) AS SaleMonth,
    SUM(s.SaleAmount) AS TotalSales,
    COUNT(DISTINCT o.ProductID) AS UniqueProductsSold
FROM Sales AS s
JOIN Orders AS o ON o.ProductID = s.ProductID
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
HAVING COUNT(DISTINCT o.ProductID) >= 2;

25.
select 
	year(orderdate),
	min(quantity) as minoderquantity,
	max(quantity) as maxorderquantity
from orders
group by year(orderdate)
order by maxorderquantity desc
