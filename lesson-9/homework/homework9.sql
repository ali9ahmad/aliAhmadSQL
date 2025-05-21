1.
select p.productname, s.suppliername
from products p 
cross join suppliers s

2.
select d.departmentname, e.name
from departments d
cross join employees e

3.
select s.supplierName, p.productname
from products p
inner join suppliers s on s.supplierid = p.productid

4.
select o.orderid, c.firstname
from customers c
join orders o on c.customerid = o.customerid

5.
select s.name, c.CourseName
from courses c
cross join students s

6.
select p.productName, o.orderid
from orders o 
join products p on p.productid = o.productid

7.
select e.name, d.departmentname
from departments d
join employees e on e.departmentid = d.departmentid

8.
select e.courseid, s.name
from students s
join enrollments e on e.studentid = s.studentid

9.
select o.orderid, p.paymentid
from payments p
inner join orders o on o.orderid = p.orderid

10.
select o.orderid, p.price
from orders o 
join products p on p.productid = o.productid
where p.price > 100

11.
select e.name, d.departmentname
from employees e
join departments d on d.departmentid <> e.departmentid

12.
select	o.orderid, p.productname, o.quantity orderquanityty, p.stockquantity
from products p
join orders o on  p.productid = o.productid
where o.quantity > p.stockquantity

13.
select c.firstname, s.productid, s.saleamount
from customers c
join sales s on c.CustomerID = s.CustomerID
where s.saleamount >= 500

14.
select s.name, c.coursename
from students s
join enrollments e on e.studentid = s.studentid
join courses c on c.courseid  = e.courseid 

15.
select s.supplierName, p.productname
from suppliers s
join products p on s.supplierid = p.supplierid
where suppliername like '%tech%'




