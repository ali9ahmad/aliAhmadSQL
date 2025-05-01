Basic-Level Tasks (10)

1. 
create Table employees(
	EmpID int,
	Name varchar(50),
	Salary Decimal(10,2)
)

2. 
--single-row insert
insert into employees values (1, 'Birinchi Ishchi', 50000.90 ) 

--multiple-row insert
insert into employees Values
(2, 'ikkinchi ishchi', 40000.90),
(3, 'uchinchi ishchi', 30000.90),
(4, 'tortinnchi ishchi', 60000.90)

3.
update employees
set salary = 7000
where EmpID = 1

4.
delete from employees
where EmpId = 2

5.
Delete - by using where it deletes specific row from the table. And it allows tallback. Selective row removal.
Truncate in the other hand removes all the rows, not like delete removing only one specific row by condition. That is why it does not use WHERE just for to affects the entire table. Removes all rows.
Drop deletes tada like it was never existed like deleting the information inside the table along with tabel structure. removes the entire table.

6.
alter table employees
alter column name varchar(100)

7.
alter table employees
add Department varchar(50)

8.
alter table employees
alter column salary float

9.
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

10.
truncate table employees

Intermediate-Level Tasks (6)

11.
insert into Departments values
(1, 'first dep'),
(2, 'second dep'),
(3, 'third dep'),
(4, 'fourth dep'),
(5, 'fifth dep')

12.
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

13.
truncate table employees

14.
alter table employees
drop column department

15.
EXEC sp_rename 'employees', 'StaffMembers';

16.
drop table Departments

Advanced-Level Tasks (9)

17.
CREATE TABLE Products(
	ProductID INT Primary Key,
	ProductName VARCHAR(100),
	Category VARCHAR(50),
	Price DECIMAL(10, 2),
	Cost DECIMAL(10, 2),
)

18.
ALTER TABLE Products
ADD CONSTRAINT chk_Price CHECK (Price > 0);

19.
alter table products
add StockQuantity INT default 50

20.
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

21.
insert into Products values
(1, 'first product', 'first catergory', 999.99, 300.20, 50),
(2, 'second product', 'second catergory', 888.99, 200.50, 50),
(3, 'third product', 'third catergory', 777.99, 150.21, 50),
(4, 'Fourth product', 'Fourth catergory', 666.99, 120.23, 50),
(5, 'Fifth product', 'Fifth catergory', 555.99, 100.05, 50)

22.
SELECT *
INTO Products_Backup
FROM Products;

23.
EXEC sp_rename 'Products', 'Inventory';

24.
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT

25.
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5);
