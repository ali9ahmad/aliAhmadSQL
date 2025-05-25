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

