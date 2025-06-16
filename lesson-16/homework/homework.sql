--Easy Tasks

1.
WITH Numbers AS (
    SELECT 1 AS Number
    UNION ALL
    SELECT Number + 1
    FROM Numbers
    WHERE Number < 1000
)
SELECT Number
FROM Numbers
OPTION (MAXRECURSION 1000);

2.
SELECT 
    e.EmployeeID,
    e.FIRSTNAME,
    COALESCE(S.totalSales, 0) AS TotalSales
FROM 
    Employees e
JOIN 
    (SELECT 
         EmployeeID, 
         SUM(SaleSAmount) AS totalSales
     FROM 
         Sales
     GROUP BY 
         EmployeeID) AS S ON e.EmployeeID = S.EmployeeID;

3.
WITH AVERAGESALARY AS(
	SELECT
		AVG(SALARY) AS AVGSALARY
	FROM
		EMPLOYEES
)

SELECT 
	AVGSALARY
FROM AVERAGESALARY

4.
SELECT 
	P.PRODUCTID,
	P.PRODUCTNAME,
	S.MAXSALES
FROM
	PRODUCTS P
JOIN
	(
	SELECT
		PRODUCTID,
		MAX(SALESAMOUNT) AS MAXSALES
	FROM
		SALES
	GROUP BY
		PRODUCTID) AS S ON P.PRODUCTID = S.PRODUCTID

5.
WITH Numbers AS (
    SELECT 1 AS Number
    UNION ALL
    SELECT Number * 2
    FROM Numbers
    WHERE Number * 2 < 1000000
)
SELECT Number
FROM Numbers;

6.
WITH SALESCOUNT AS(
	SELECT
		EMPLOYEEID,
		COUNT(*) AS SALECOUNT
	FROM
		SALES
	GROUP BY
		EMPLOYEEID
	HAVING	
		COUNT(*) > 5
)

SELECT
	E.FIRSTNAME
FROM 
	EMPLOYEES E
JOIN
	SALESCOUNT S ON E.EMPLOYEEID = S.EMPLOYEEID

7.
WITH PRODUCTSALES AS (
	SELECT
		P.PRODUCTID,
		P.PRODUCTNAME,
		SUM(S.SALESAMOUNT) AS TOTALSALES
	FROM 
		PRODUCTS P 
	JOIN 
		SALES S  ON P.PRODUCTID = S.PRODUCTID
	GROUP BY
		P.PRODUCTID, P.PRODUCTNAME
)

SELECT
	PRODUCTID,
	PRODUCTNAME,
	TOTALSALES
FROM
	PRODUCTSALES
WHERE
	TOTALSALES > 500

8.
WITH AVERAGE_SALARY AS (
	SELECT
		 AVG(SALARY) AS AVG_SALARY
	FROM
		EMPLOYEES
)


SELECT
	 E.EMPLOYEEID,
	 E.FIRSTNAME,
	 E.SALARY
FROM 
	EMPLOYEES E
JOIN
	AVERAGE_SALARY A ON E.SALARY > A.AVG_SALARY



--Medium Tasks

1.
SELECT 
	E.EMPLOYEEID,
	E.FIRSTNAME,
	ORDERCOUNT
FROM 
	EMPLOYEES E
JOIN
	(SELECT
		EMPLOYEEID,
		COUNT(*) AS ORDERCOUNT
	FROM 
		SALES
	GROUP BY EMPLOYEEID
	ORDER BY ORDERCOUNT DESC
	OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY) AS ORDERSUMMERY
ON
	E.EMPLOYEEID = ORDERSUMMERY.EMPLOYEEID

2.

SELECT
	PC.CATEGORYID,
	COALESCE(S.TOTALSALES, 0) AS TOTALSALES
FROM
	PRODUCTS PC
LEFT JOIN
	(SELECT
		P.CATEGORYID,
		SUM(S.SALESAMOUNT) AS TOTALSALES
	FROM 
		SALES S
	JOIN 
		PRODUCTS P ON S.PRODUCTID = P.PRODUCTID
	GROUP BY
		P.CATEGORYID) AS S ON PC.CATEGORYID = S.CATEGORYID


3.
WITH FactorialCTE AS (
    SELECT 
        Number,
        CAST(1 AS BIGINT) AS Factorial
    FROM 
        Numbers1
    WHERE 
        Number = 0  
    UNION ALL
    SELECT 
        n.Number,
        CAST(f.Factorial * n.Number AS BIGINT) AS Factorial
    FROM 
        Numbers1 n
    JOIN 
        FactorialCTE f ON n.Number > 0 AND n.Number = f.Number + 1
)
SELECT 
    Number,
    Factorial
FROM 
    FactorialCTE
ORDER BY 
    Number;

4.
WITH SplitStringCTE AS (
    SELECT 
        ID,
        SUBSTRING(String, 1, 1) AS Character,
        1 AS Position
    FROM 
        example
    WHERE 
        LEN(String) > 0  
    UNION ALL
    SELECT 
        s.ID,
        SUBSTRING(s.String, Position + 1, 1),
        Position + 1
    FROM 
        SplitStringCTE s
    JOIN 
        example i ON s.ID = i.ID
    WHERE 
        Position < LEN(i.String)
)
SELECT 
    ID,
    Character
FROM 
    SplitStringCTE
WHERE 
    Character <> ''
ORDER BY 
    ID, Position;

5.
WITH MonthlySales AS (
    SELECT 
        YEAR(SaleDate) AS SaleYear,
        MONTH(SaleDate) AS SaleMonth,
        SUM(SaleSAmount) AS TotalSales
    FROM 
        Sales
    GROUP BY 
        YEAR(SaleDate), MONTH(SaleDate)
),
SalesDifference AS (
    SELECT 
        CURRENT_TIMESTAMP.SaleYear,
        CURRENT_TIMESTAMP.SaleMonth,
        CURRENT_TIMESTAMP.TotalSales AS CurrentMonthSales,
        COALESCE(Previous.TotalSales, 0) AS PreviousMonthSales,
        Current.TotalSales - COALESCE(Previous.TotalSales, 0) AS SalesDifference
    FROM 
        MonthlySales Current
    LEFT JOIN 
        MonthlySales Previous ON CURRENT_TIMESTAMP.SaleYear = Previous.SaleYear 
                              AND CURRENT_TIMESTAMP.SaleMonth = Previous.SaleMonth + 1
)
SELECT 
    SaleYear,
    SaleMonth,
    CurrentMonthSales,
    PreviousMonthSales,
    SalesDifference
FROM 
    SalesDifference
ORDER BY 
    SaleYear, SaleMonth;ID,
    Character
FROM 
    SplitStringCTE
WHERE 
    Character <> ''
ORDER BY 
    ID, Position;

6.
SELECT 
    e.EmployeeID,
    e.FIRSTNAME,
    q.Quarter,
    q.TotalSales
FROM 
    Employees e
JOIN 
    (SELECT 
         EmployeeID,
         DATEPART(QUARTER, SaleDate) AS Quarter,
         SUM(SaleSAmount) AS TotalSales
     FROM 
         Sales
     GROUP BY 
         EmployeeID, DATEPART(QUARTER, SaleDate)
     HAVING 
         SUM(SaleSAmount) > 45000) AS q ON e.EmployeeID = q.EmployeeID
ORDER BY 
    e.EmployeeID, q.Quarter;

--Difficult Tasks

1.
WITH FibonacciCTE AS (
    SELECT 
        0 AS FibonacciNumber,
        0 AS Position
    UNION ALL
    SELECT 
        1 AS FibonacciNumber,
        1 AS Position
    UNION ALL
    SELECT 
        f.FibonacciNumber + fPrev.FibonacciNumber,
        f.Position + 1
    FROM 
        FibonacciCTE f
    JOIN 
        FibonacciCTE fPrev ON f.Position = fPrev.Position + 1
    WHERE 
        f.Position < 20 
)
SELECT 
    Position,
    FibonacciNumber
FROM 
    FibonacciCTE
ORDER BY 
    Position;

2.
SELECT 
    VALS
FROM 
    FindSameCharacters
WHERE 
    LEN(VALS) > 1 AND 
    VALS = REPLICATE(LEFT(VALS, 1), LEN(VALS));

3.
DECLARE @n INT = 5; 


WITH NumberSequence AS (
    SELECT 
        1 AS Number,
        CAST(1 AS NVARCHAR(MAX)) AS Sequence
    UNION ALL
    SELECT 
        ns.Number + 1,
        CAST(ns.Sequence + CAST(ns.Number + 1 AS NVARCHAR(MAX)) AS NVARCHAR(MAX))
    FROM 
        NumberSequence ns
    WHERE 
        ns.Number < @n
)
SELECT 
    Sequence
FROM 
    NumberSequence
ORDER BY 
    Number;

4.
SELECT 
    e.EmployeeID,
    e.FIRSTNAME,
    ds.TotalSales
FROM 
    Employees e
JOIN 
    (SELECT 
         EmployeeID,
         SUM(SaleSAmount) AS TotalSales
     FROM 
         Sales
     WHERE 
         SaleDate >= DATEADD(MONTH, -6, GETDATE()) 
     GROUP BY 
         EmployeeID) AS ds ON e.EmployeeID = ds.EmployeeID
ORDER BY 
    ds.TotalSales DESC;

5.

WITH ProcessedNames AS (
    SELECT 
        PAWAN_SLUG_NAME,
        
        STRING_AGG(DISTINCT value, ', ') AS CleanedName
    FROM (
        SELECT 
            PAWAN_SLUG_NAME,
            TRIM(value) AS value
        FROM 
            RemoveDuplicateIntsFromNames
        CROSS APPLY STRING_SPLIT(PAWAN_SLUG_NAME, '') 
    ) AS SplitValues
    WHERE 
        LEN(value) > 1  
    GROUP BY 
        Name
)
SELECT 
    Name,
    CleanedName
FROM 
    ProcessedNames;


  



























