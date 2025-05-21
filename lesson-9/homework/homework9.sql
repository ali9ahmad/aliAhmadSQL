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

16.
select o.orderid, p.amount, o.totalamount
from orders o 
join payments p on p.orderid = o.orderid
where p.amount < o.totalamount

17.
select d.departmentName, e.name
from employees e
join departments d on d.departmentid = e.departmentid

18.
select p.productName, c.categoryname
from products p
join categories c on c.categoryid = p.categoryid
where c.categoryname in ('electronics','furniture')

19.
SELECT s.SaleID, s.ProductID, s.SaleAmount, c.Country
FROM Sales s
INNER JOIN Customers c ON s.CustomerID = c.CustomerID
WHERE c.Country = 'USA';

20.
SELECT o.OrderID, o.TotalAmount
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany' AND o.TotalAmount > 100;

21.
SELECT e1.Name AS Employee1, e2.Name AS Employee2
FROM Employees e1
JOIN Employees e2 ON e1.DepartmentID <> e2.DepartmentID
WHERE e1.EmployeeID < e2.EmployeeID;

22.
SELECT p.PaymentID, p.Amount, o.Quantity, pr.Price
FROM Payments p
INNER JOIN Orders o ON p.OrderID = o.OrderID
INNER JOIN Products pr ON o.ProductID = pr.ProductID
WHERE p.Amount <> (o.Quantity * pr.Price);

23.
SELECT s.StudentID, s.Name
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseID IS NULL;

24.
SELECT e1.Name AS Manager, e1.Salary AS ManagerSalary, e2.Name AS ManagedEmployee, e2.Salary AS ManagedSalary
FROM Employees e1
JOIN Employees e2 ON e1.EmployeeID = e2.ManagerID
WHERE e1.Salary <= e2.Salary;

25.
SELECT c.CustomerID, c.FirstName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;


