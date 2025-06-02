--Easy Tasks
1.
select 
	concat(employee_id, '-', first_name, ' ', last_name) as Output
from 
	employees

2.
UPDATE employees
SET phone_number = REPLACE(phone_number, '124', '999')
WHERE phone_number LIKE '%124%';

3.
SELECT 
    first_name AS First_Name,
    LEN(first_name) AS Name_Length
FROM 
    employees
WHERE 
    first_name LIKE 'A%' OR 
    first_name LIKE 'J%' OR 
    first_name LIKE 'M%'
ORDER BY 
    first_name;

4.
SELECT 
    manager_id,
    SUM(salary) AS total_salary
FROM 
    employees
GROUP BY 
    manager_id;

5.
SELECT 
    year1,
    (CASE 
        WHEN Max1 >= Max2 AND Max1 >= Max3 THEN Max1
        WHEN Max2 >= Max1 AND Max2 >= Max3 THEN Max2
        ELSE Max3
    END) AS highest_value
FROM 
    TestMax;

6.
SELECT 
    *
FROM 
    cinema
WHERE 
    id % 2 <> 0 AND 
    description <> 'boring';

7.
SELECT *
FROM SingleOrder
ORDER BY 
    CASE 
        WHEN Id = 0 THEN 1 
        ELSE 0 
    END, 
    Id;

8.
SELECT ID, 
    COALESCE(SSN, PASSPORTID, ITIN) AS first_non_null_value
FROM 
    person;

--Medium Tasks
1.
SELECT 
    LEFT(FullName, CHARINDEX(' ', FullName + ' ') - 1) AS FirstName,
    SUBSTRING(FullName, 
              CHARINDEX(' ', FullName + ' ') + 1, 
              CHARINDEX(' ', FullName + ' ', CHARINDEX(' ', FullName + ' ') + 1) - CHARINDEX(' ', FullName + ' ') - 1) AS MiddleName,
    RIGHT(FullName, LEN(FullName) - LEN(REPLACE(FullName, ' ', '')) - CHARINDEX(' ', REVERSE(FullName))) AS LastName
FROM 
    Students;

2.
SELECT *
FROM Orders
WHERE CustomerID IN (
    SELECT DISTINCT CustomerID
    FROM Orders
    WHERE DeliveryState = 'California'
)
AND DeliveryState = 'Texas';

3.
SELECT CONCAT(SEQUENCENUMBER,STRING) AS ConcatenatedValues
FROM 
    DMLTable

4.
SELECT *
FROM Employees
WHERE 
    (First_Name + ' ' + Last_Name) LIKE '%a%' OR 
    (First_Name + ' ' + Last_Name) LIKE '%A%'
GROUP BY 
    First_Name, Last_Name
HAVING 
    LEN(First_Name + ' ' + Last_Name) - LEN(REPLACE(LOWER(First_Name + ' ' + Last_Name), 'a', '')) >= 3;

5.
SELECT 
    Department_ID,
    COUNT(*) AS TotalEmployees,
    COUNT(CASE WHEN DATEDIFF(YEAR, Hire_Date, GETDATE()) > 3 THEN 1 END) AS EmployeesMoreThan3Years,
    CAST(COUNT(CASE WHEN DATEDIFF(YEAR, Hire_Date, GETDATE()) > 3 THEN 1 END) AS FLOAT) / COUNT(*) * 100 AS PercentageMoreThan3Years
FROM 
    Employees
GROUP BY 
    Department_ID;

6.
SELECT 
	SpacemanID,
    JobDescription,
    MAX(MISSIONCOUNT) AS MostExperiencedID,
    MIN(MISSIONCOUNT) AS LeastExperiencedID
FROM 
    PERSONAL
GROUP BY 
    SPACEMANID;

--Difficult Tasks

1.
DECLARE @inputString VARCHAR(50) = 'tf56sd#%OqH';

SELECT 
    @inputString AS OriginalString,
    (SELECT STRING_AGG(SUBSTRING(@inputString, Number, 1), '') 
     FROM (VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12)) AS Numbers(Number)
     WHERE SUBSTRING(@inputString, Number, 1) COLLATE Latin1_General_BIN LIKE '[a-z]') AS LowercaseLetters,
    (SELECT STRING_AGG(SUBSTRING(@inputString, Number, 1), '') 
     FROM (VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12)) AS Numbers(Number)
     WHERE SUBSTRING(@inputString, Number, 1) COLLATE Latin1_General_BIN LIKE '[A-Z]') AS UppercaseLetters,
    (SELECT STRING_AGG(SUBSTRING(@inputString, Number, 1), '') 
     FROM (VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12)) AS Numbers(Number)
     WHERE SUBSTRING(@inputString, Number, 1) COLLATE Latin1_General_BIN LIKE '[0-9]') AS Numbers,
    (SELECT STRING_AGG(SUBSTRING(@inputString, Number, 1), '') 
     FROM (VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12)) AS Numbers(Number)
     WHERE SUBSTRING(@inputString, Number, 1) COLLATE Latin1_General_BIN NOT LIKE '[a-zA-Z0-9]') AS OtherCharacters;

2.
SELECT 
    StudentID,
    GRADE,
    SUM(GRADE) OVER (ORDER BY StudentID) AS CumulativeSum
FROM 
    Students;

3.
DECLARE @TotalSum FLOAT = 0;
DECLARE @Equation VARCHAR(255);
DECLARE @SQL VARCHAR(255);

DECLARE EquationCursor CURSOR FOR
SELECT Equation FROM Equations;

OPEN EquationCursor;
FETCH NEXT FROM EquationCursor INTO @Equation;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SQL = 'SELECT @Result = ' + @Equation;

    DECLARE @Result FLOAT;
    EXEC sp_executesql @SQL, N'@Result FLOAT OUTPUT', @Result OUTPUT;

    SET @TotalSum = @TotalSum + @Result;

    FETCH NEXT FROM EquationCursor INTO @Equation;
END

CLOSE EquationCursor;
DEALLOCATE EquationCursor;

SELECT @TotalSum AS TotalSum;

4.
SELECT 
    Birthday,
    COUNT(*) AS StudentCount,
    STRING_AGG(StudentName, ', ') AS Students
FROM 
    Student
GROUP BY 
    Birthday
HAVING 
    COUNT(*) > 1;

5.
SELECT 
    CASE 
        WHEN PlayerA < PlayerB THEN PlayerA 
        ELSE PlayerB 
    END AS Player1,
    CASE 
        WHEN PlayerA < PlayerB THEN PlayerB 
        ELSE PlayerA 
    END AS Player2,
    SUM(Score) AS TotalScore
FROM 
    PlayerScores
GROUP BY 
    CASE 
        WHEN PlayerA < PlayerB THEN PlayerA 
        ELSE PlayerB 
    END,
    CASE 
        WHEN PlayerA < PlayerB THEN PlayerB 
        ELSE PlayerA 
    END;
