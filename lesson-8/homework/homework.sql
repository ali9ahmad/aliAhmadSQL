1.
select category, sum(stockquantity) as AvailableProducts
from products
group by category

2.
select avg(price) as AvgPriceElectronics
from products
where category = 'electronics'

3.
select *
from customers
where city like 'L%'

4.
select * from products
where productname like '%er'

5.
select * from customers
where country like '%a'

6.
select  max(price) as HighestPrice
from products 

7.
select *,
	case
		when stockquantity < 30 then 'low stock'
		else 'sufficient'
	end as StockCondition
from products
order by StockCondition

8.
select country,
	count(*) as NumberOfCustomers
from customers
group by country
order by country desc

9.
select 
	max(quantity) as MaxOrders,
	min(quantity) as MinOrders
from orders

10.
select 
	Distinct o.customerid
from Orders o
left join invoices i on o.customerid = i.customerid
where o.orderdate >= '2023-01-01' and o.orderdate  < '2023-02-01'
	and o.customerid is null

11.
SELECT ProductName
FROM Products

UNION ALL

SELECT ProductName
FROM Products_Discounted;


12.
SELECT ProductName
FROM Products

UNION

SELECT ProductName
FROM Products_Discounted;

13
select year(orderdate) AS OrderYear, 
	avg(quantity) AS AverageOrderAmount
from orders
group by year(orderdate)

14.
select productname,
	case 
		when price < 100 then 'low'
		when price between 100 and 500 then 'mid'
		else 'high'
	end  as priceGroup
from products

15.
INSERT INTO Population_each_year (district_name, [2012], [2013])
SELECT district_name, [2012], [2013]
FROM (
    SELECT district_name, year, population
    FROM city_population
) AS sourceTable
PIVOT (
    SUM(population)
    FOR year IN ([2012], [2013])
) AS pivotTable;

16.
select productid,
	sum(saleamount) totalSales
from sales
group by productid

17.
sELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';

18.
INSERT INTO Population_Each_City (Year, Bektemir, Chilonzor, Yakkasaroy)
SELECT Year, Bektemir, Chilonzor, Yakkasaroy
FROM (
    SELECT Year, City, Population
    FROM City_Population
) AS SourceTable
PIVOT (
    SUM(Population)
    FOR City IN (Bektemir, Chilonzor, Yakkasaroy)
) AS PivotTable;

19.
SELECT top 3 CustomerID,  SUM(totalamount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC

20.
SELECT Year, City, Population
FROM Population_Each_Year
UNPIVOT (
    Population FOR City IN (Bektemir, Chilonzor, Yakkasaroy)
) AS UnpivotedTable;

21.
SELECT p.ProductName, COUNT(s.SaleID) AS TimesSold
FROM Products p
INNER JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName
ORDER BY TimesSold DESC;

22.
SELECT Year, City, Population
FROM Population_Each_Year
UNPIVOT (
    Population FOR City IN (Bektemir, Chilonzor, Yakkasaroy)
) AS UnpivotedTable;

