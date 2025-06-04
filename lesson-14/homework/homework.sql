--Easy Tasks

1.
SELECT
	LTRIM(RTRIM(SUBSTRING(Name, 1, CHARINDEX(',', Name)-1))) FIRSTNAME,
	LTRIM(RTRIM(SUBSTRING(NAME, CHARINDEX(',', Name)+1, LEN(NAME)))) LASTNAME
FROM 
	TestMultipleColumns

2.
SELECT
	*
FROM
	TestPercent	
WHERE STRS LIKE '%[%]%'

3.
SELECT
	*
FROM
	Splitter 
CROSS APPLY
	string_split(Vals, '.')

4.
SELECT 
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
        inputString, '0', 'X'), 
        '1', 'X'), 
        '2', 'X'), 
        '3', 'X'), 
        '4', 'X'), 
        '5', 'X'), 
        '6', 'X'), 
        '7', 'X'), 
        '8', 'X'), 
        '9', 'X') AS ResultString;

5.
SELECT *
FROM testDots
WHERE LEN(Vals) - LEN(REPLACE(Vals, '.', '')) > 2;

6.
SELECT 
    LEN(TEXTS) - LEN(REPLACE(TEXTS, ' ', '')) AS SpaceCount
FROM 
    CountSpaces;

7.
SELECT e1.ID, e1.Name, e1.Salary, e2.Name AS ManagerName, e2.ManagerID, E2.SALARY
FROM Employee e1
JOIN Employee e2 ON e1.ManagerID = e2.ID
WHERE e1.Salary > e2.Salary;

8.
SELECT 
    Employee_ID, 
    First_Name, 
    Last_Name, 
    Hire_Date,
    DATEDIFF(YEAR, Hire_Date, GETDATE()) AS YearsOfService
FROM 
    Employees
WHERE 
    DATEDIFF(YEAR, Hire_Date, GETDATE()) > 10
    AND DATEDIFF(YEAR, Hire_Date, GETDATE()) < 15;

--Medium Tasks

1.
DECLARE @inputString NVARCHAR(100) = 'rtcfvty34redt';
DECLARE @chars NVARCHAR(100) = '';
DECLARE @nums NVARCHAR(100) = '';

-- Loop through each character in the string
DECLARE @i INT = 1;
WHILE @i <= LEN(@inputString)
BEGIN
    DECLARE @currentChar CHAR(1) = SUBSTRING(@inputString, @i, 1);
    
    IF @currentChar LIKE '[0-9]' 
        SET @nums = @nums + @currentChar;  -- Append to nums if it's a digit
    ELSE 
        SET @chars = @chars + @currentChar; -- Append to chars if it's a letter
    
    SET @i = @i + 1;
END

SELECT @chars AS CharacterValues, @nums AS IntegerValues;

2.
SELECT w1.ID, w1.RECORDDATE, w1.Temperature
FROM weather w1
JOIN weather w2 ON w1.RECORDDATE= DATEADD(DAY, 1, w2.RECORDDATE)
WHERE w1.Temperature > w2.Temperature;

3.
SELECT 
    Player_ID, 
    MIN(EVENT_DATE) AS FirstLoginDate
FROM 
    Activity
GROUP BY 
    Player_ID;

4.
SELECT VALUE
FROM fruits
CROSS APPLY 
	string_split(FRUIT_LIST, ',')
ORDER BY VALUE
OFFSET 2 ROWS FETCH NEXT 1 ROW ONLY;

5.
CREATE TABLE CharacterTable (
    Character CHAR(1)
);

DECLARE @inputString NVARCHAR(MAX) = 'sdgfhsdgfhs@121313131';
DECLARE @i INT = 1;
DECLARE @char CHAR(1);

-- Loop through each character in the string
WHILE @i <= LEN(@inputString)
BEGIN
    SET @char = SUBSTRING(@inputString, @i, 1);
    INSERT INTO CharacterTable (Character) VALUES (@char);
    SET @i = @i + 1;
END

SELECT * FROM CharacterTable

6.
SELECT 
    p1.ID,
    CASE 
        WHEN p1.code = 0 THEN p2.code 
        ELSE p1.code 
    END AS code
FROM 
    p1
JOIN 
    p2 ON p1.id = p2.id;

7.
SELECT 
    Employee_ID, 
    HIRE_DATE,
    CASE 
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) < 1 THEN 'New Hire'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 1 AND 5 THEN 'Junior'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 6 AND 10 THEN 'Mid-Level'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 11 AND 20 THEN 'Senior'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) > 20 THEN 'Veteran'
        ELSE 'Unknown' -- Optional: for any unexpected cases
    END AS EmploymentStage
FROM 
    Employees;

8.
SELECT 
    Vals,
    CAST(SUBSTRING(Vals, 1, PATINDEX('%[^0-9]%', Vals + 'x') - 1) AS INT) AS StartingInteger
FROM 
    GetIntegers
WHERE 
    PATINDEX('%[0-9]%', Vals) = 1; -- Optional: Only include rows that start with an integer

--Difficult Tasks

1.
SELECT 
    *,
    STRING_AGG(VALS, ',') AS SwappedVals
FROM (
    SELECT 
        value,
        STUFF(value, 1, 2, SUBSTRING(value, 1, 1) + SUBSTRING(value, 2, 1)) AS SWAPPED_VALUE
    FROM (
        SELECT 
            value,
            ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
        FROM 
            STRING_SPLIT(VALS, ',')
    ) AS SplitValues
) AS SwappedValues
GROUP BY 
    VALS;

2.
SELECT 
    a.Player_ID,
    a.Device_ID
FROM 
    Activity a
JOIN (
    SELECT 
        Player_ID,
        MIN(EVENT_DATE) AS FirstLoginDate
    FROM 
        Activity
    GROUP BY 
        Player_ID
) AS FirstLogins ON a.Player_ID = FirstLogins.Player_ID AND a.EVENT_DATE = FirstLogins.FirstLoginDate;


3.
WITH WeeklySales AS (
    SELECT 
        DATEPART(YEAR, SalesDate) AS SalesYear,
        DATEPART(WEEK, SalesDate) AS SalesWeek,
        Area,
        SUM(Amount) AS TotalSales
    FROM 
        sales
    GROUP BY 
        DATEPART(YEAR, SalesDate),
        DATEPART(WEEK, SalesDate),
        Area
),
TotalWeeklySales AS (
    SELECT 
        SalesYear,
        SalesWeek,
        SUM(TotalSales) AS TotalSalesForWeek
    FROM 
        WeeklySales
    GROUP BY 
        SalesYear,
        SalesWeek
)
SELECT 
    ws.SalesYear,
    ws.SalesWeek,
    ws.Area,
    ws.TotalSales,
    tws.TotalSalesForWeek,
    CAST(ws.TotalSales AS FLOAT) / tws.TotalSalesForWeek * 100 AS PercentageOfTotalSales
FROM 
    WeeklySales ws
JOIN 
    TotalWeeklySales tws ON ws.SalesYear = tws.SalesYear AND ws.SalesWeek = tws.SalesWeek
ORDER BY 
    ws.SalesYear, 
    ws.SalesWeek, 
    ws.Area;
