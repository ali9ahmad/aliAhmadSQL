Easy-Level Tasks (10)

1. Bulk insert in SQL is transact-sql command and it allows to import a large volume of data from a data file into a sql server table quickly and efficiently helping for high-performance.

2. 
There are 4 file formats that can be imported are: CSV, TXT, XML and the last one is JSON.

3. 
create table Products(
	ProductID int primary key,
	ProductName varchar(50),
	Price decimal(10,2)
)

4.
insert into Products 
values 
(1, 'laptop', 99.8),
(2, 'phone', 199.8),
(3, 'tablet', 299.8)

5.
meaning: Null means missing, unkown or undefiend data. Not Null means cell should contain value, it cannot be empty.
Behaviour: Null allows column not store any value. Not Null enforces that every row on that column should have a value.
usage: Null is usefull when data is not available when entring the data. Not Null used when data is required for business rules or logic.

6.
alter table Products
add CONSTRAINT Unique_ProductNames Unique (ProductName)

7.
/*
Contraint Unique that we added by alter command to column ProductName ensures prevents data duplication.
*/

8.
create table Category(
	CategoryId int Primary key,
	CatergoryName varchar(50) Unique,
)

9.
IDENTITY column in SQL server is used to create auto-incrementing column, typically used for column keys. Its job is to automatically generate unique numeric values for each new row. So, there will not be need to manually insert values into that column.
It looks like this columnName int identity(seed, increment). Seed is starting value, and incerement is the value to add for each new row.

Medium-Level Tasks (10)

10.
--first we create Table

create table Products(
	ProductID int,
	ProductName varchar (50),
	Price decimal(10,2)
)

--Then we bulk insert the data

BULK insert Products
FROM 'C:\Users\user\products.txt'
with (
	fieldterminator = ',',
	rowterminator = '\n',
	firstrow = 1
)

11.
--First we add needed column to our Prducts table

ALTER TABLE Products
ADD CategoryId INT;

--Then we add constraint for feriegn key

alter table products
add Constraint FK_Products_Catergories
foreign Key (CategoryId)
references Category(CategoryId)

12.
Purpose: Primary key is uniquely indentifies each row in a table. Unique key ensues that all value in a column are unique.
Uniqueness: Enforces uniqueness and does not allow NULLs. Unique key also enforces uniqueness but allows one NULL.
Number per table: For primary key it should be only 1 primary key per table. For Unique key there can be multiple unique contraint in a table.
Usage: Primary key typically used for the main row identifier. Unique key used to ensure uniqueness on other important columns.

13.
alter table Products
add constraint CHECK_Price_Product
check (Price > 0)

14.
ALTER TABLE Products
ADD Stock INT NOT NULL;

15.
update products
set price = 0
where price is null

16.
Key purpose of ferign key constraint is enforce data integraty. So it ensures data in the child table corresponds to data in the parent table.
It prevents inserting value into child table that does not exist in the parent table.
Prevent orphaned recors by preventing the deletion of a record in the parent table if it is being referenced by a record in the child table. This avoids orphaned records wehre child rows exist without a matching parent row.
Establesh relationship between tables. It help to represent logical relationship between tables. such as  one-to-many or many-to-many. relationship.

Hard-Level Tasks (10)

17.
create table Customers(
	CustomerID int primary key,
	CustomerName varchar(50),
	age int not null,
	constraint CHECK_Age_Min Check (age>=18)
)


18.
create table orders(
	orderID int identity(100,10) primary key,
	orderData date not null,
	customerName varchar(100)
)

19.
create table OrderDetails(
	OrderId int not null,
	ProductId int not null,
	Quantity int not null,
	Price decimal(10,2)
	constraint PK_OrderDetails Primary Key (OrderId, ProductId)
)

20.
Both are used to handel null values by returning alternative values when a column or espression is null. Their keu differences are syntax and behavior and flexibilty.
Syntax of ISNULL looks like isnull(expression, replacement_value). Expressiona is returned if the first argument is not null. If it is null it returns replacement value.

Colaesce on the other hand can handle more than two values. Coalcase(exp1, exp2, ..., expN).
Key difference number of arguments. For isnull it is only 2 and for coalesce more than 2.
Return type for is null is based on the first argument. But for coalesce it is based on the highest precedence among all expressions.
Coalesce is more flexible and type safe compare to isnull.

21.
CREATE TABLE Employees (
    EmpID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    CONSTRAINT PK_Employees PRIMARY KEY (EmpID),
    CONSTRAINT UQ_Employees_Email UNIQUE (Email)
);

22.
ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Orders
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID)
ON DELETE CASCADE
ON UPDATE CASCADE;


 	
	

