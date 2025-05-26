1.
select o.orderid, c.firstname + c.lastname as customerFullName, year(o.orderdate) as Orderyear
from orders o 
join customers c on c.customerid = o.customerid
where year(o.orderdate) > 2022
order by Orderyear

2.
select e.name, d.departmentname
from employees e
join departments d on d.departmentid = e.departmentid
where d.departmentname IN('sales','marketing')
order by d.departmentname

3.
select d.departmentname, max(e.salary) MaxSalary
from departments d
join employees e on d.departmentid = e.departmentid
group by d.departmentname
order by MaxSalary

4.
select c.firstName + c.lastname as CustomerName, o.orderid, o.orderdate
from orders o
join customers c on c.customerid = o.customerid
where c.country = 'usa' and year(o.orderdate) = 2023

5.
select c.firstName + ' ' + c.lastname as CustomerName, sum(quantity) as totalOrders
from orders o
join customers c on c.customerid = o.customerid
group by c.firstName, c.lastname
order by totalOrders desc

6.
select p.productname, s.suppliername
from suppliers s
join products p on s.supplierid = p.supplierid
where s.suppliername in ('Gadget Supplies', 'Clothing Mart')
order by s.suppliername

7.
select c.firstName + ' ' + c.lastname as CustomerName, max(o.orderdate) as MostRecentOrderDate
from customers c
join orders o on c.CustomerID = o.CustomerID
group by c.firstName, c.lastname 
order by c.firstName

8.
select c.firstName + ' ' + c.lastname as CustomerName, o.totalamount
from orders o 
join customers c on c.CustomerID = o.CustomerID
where o.totalamount > 500
order by o.totalamount desc

9.
select p.productname, year(s.saledate) SaleYear, s.SaleAmount
from products p
join sales s on p.productid = s.productid
where  year(s.saledate) = 2022 or s.SaleAmount > 400
order by s.saledate

10.
select p.productname, sum(s.SaleAmount) as totalamount
from sales s
join products p on p.productid = s.productid
group by p.productname
order by totalamount

11.
select e.name, d.departmentname, e.salary
from employees e
join departments d on e.departmentid = d.departmentid
where d.departmentname = 'hr' or e.salary > 60000
order by e.salary

12.
select p.productname, year(s.saledate) SaleYear, p.stockquantity
from sales s
join products p on p.productid = s.productid
where year(s.saledate) = 2023 and p.stockquantity > 100

13.
select e.name, d.departmentname, year(e.hiredate) HiredYear
from employees e
join departments d on d.departmentid = e.departmentid
where d.departmentname = 'sales' or year(e.hiredate) > 2020

14.
select c.firstName + ' ' + c.lastname as CustomerName, o.orderid, c.address, o.orderdate
from customers c
join orders o on c.customerid = o.customerid
where c.country = 'USA' and c.address like '[0-9][0-9][0-9][0-9]%'

15.
select p.productname, c.categoryname, s.saleamount
from sales s
join products p on p.productid = s.productid
join categories c on p.Category = c.CategoryID
where c.categoryname = 'Electronics' OR s.saleamount = 350

16.
select c.categoryname, count(p.productname) NumberOfProducts
from products p
join categories c on c.categoryid  = p.category
group by c.categoryname
order by count(p.productname) desc

17.
select c.firstName + ' ' + c.lastname as CustomerName, c.city, o.orderid, o.totalamount
from orders o 
join customers c on c.customerid = o.customerid 
where  c.city = 'Los Angeles' AND o.totalamount > 300

18.
SELECT e.Name, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('HR', 'Finance')
   OR (LEN(e.Name) - LEN(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(e.Name, 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', ''))) >= 4

19.
SELECT e.Name, d.DepartmentName, e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Sales', 'Marketing') AND e.Salary > 60000;
