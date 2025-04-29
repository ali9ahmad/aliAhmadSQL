Easy

1. Data is row info, which does not provide any insight without some data processing and combining it with other data. 
A database is collected/organized/structured/sorted information.
The Relations Database is organized information in tables. Relation Database provides a way to see the relationship between data points.
A table is a data structure that organizes information according to a certain type or use.

2. Key features of SQL Server are a. storing, b. processing, and c. securing the data. d. Scalability, e. relational foundation. f. portability.

3. For different authentication modes, I can say 1st is Windows authentication mode, and 2nd is SQL Server authentication mode, and 3rd is mixed authentication mode, which enables both.


Medium

4. Create Database SchoolDB


5. Create Table Students(
  StudentID INT PRIMARY KEY,
  Name VARCHAR(50),
  Age INT
) 

6. 
SQL Server is actual database system and used to store, retrieve, and manage the data. 
SSMS provides tools for database administration and development and management. 
SQL is a language itself and used to perform operations such as querying, updating, and managing the data within the database. 

SQL Server is tools to interact with SQL server and helps with transaction management, security and backup and recovery and data analysis.
SSMS helps with a graphical interface query editor debugging tools, and performance. 
SQL help with several different commands to operate.



Hard

7. 
DQL is Data Query Language. Example: Select.
DML is Data Manipulation Language. Example: Insert, Update, Delete, Call, Explain Call, Lock.
DDL is Data Definition Language. Example: Create, Drop, Alter, Truncate.
DCL is Data Control Language. Example: Grant, Revoke.
TCL is Transaction Control Language. Example: Commit, Savepoint, Rollback, Set Transaction, and Set Constraint.

8.  INSERT INTO Students (StudentID, Name, Age) VALUES
(1, 'Temur Malik', 32),
(2, 'Ali Ahmad', 31),
(3, 'Ahmad Mukhammad', 33)  

9. Backup SchoolDB
Open SSMS:

Start SQL Server Management Studio and connect to your server.
Find the Database:

In Object Explorer, expand Databases.
Right-click on SchoolDB.
Create Backup:

Select Tasks > Back Up....
Set Backup Options:

Make sure Database is SchoolDB.
Choose Full for backup type.
Click Add... to choose a location and name the file (e.g., C:\Backups\SchoolDB.bak).
Finish Backup:

Click OK to create the backup.
Wait for the confirmation message.
Restore SchoolDB
Open SSMS:

Launch SQL Server Management Studio and connect to your server.
Begin Restore:

Right-click on Databases in Object Explorer.
Select Restore Database....
Select Backup File:

Choose Device as the source.
Click the ... button to find your backup file (e.g., C:\Backups\SchoolDB.bak).
Set Restore Options:

Ensure Database is SchoolDB (or a new name if you want).
Check Overwrite the existing database (WITH REPLACE) if needed.
Complete Restore:

Click OK to start the restore.
Wait for the confirmation message.
