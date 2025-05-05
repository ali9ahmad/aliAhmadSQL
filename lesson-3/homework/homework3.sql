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
IDENTITY column in SQL server is used to create auto-incrementing column, typically used for column keys. Its job is to automatically generate unique numeric values for each new row. So, there won't be need to manually insert values into that column.
It looks like this columnName int identity(seed, increment). Seed is starting value, and incerement is the value to add for each new row.

10.
