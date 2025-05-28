1.
select p.firstname, p.lastname, a.city, a.state
from person p
left join address a on  p.personid = a.personid

2.
select e.name Employee from employee e join employee e2 on e.managerid = e2.id
where e.salary>e2.salary

3.
SELECT p1.email
FROM person p1
JOIN person p2 ON p1.email= p2.email
WHERE p1.id<> p2.id
GROUP BY p1.email
HAVING COUNT(p1.email) > 1

4.
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
);

5.
SELECT ParentName FROM boys
UNION
SELECT ParentName FROM girls;

6.
SELECT 
    Custid,
    SUM(SalesAmount) AS TotalSales,
    MIN(Weight) AS LeastWeight
FROM 
    Sales.Orders
WHERE 
    Weight > 50
GROUP BY 
    Custid;

7.
	SELECT 
    isnull(c1.Item, '') AS [Item Cart 1],
   isnull( c2.Item, '') AS [Item Cart 2]
FROM 
    Cart1 c1
FULL OUTER JOIN 
    Cart2 c2 ON c1.Item = c2.Item
ORDER BY 
    CASE 
        WHEN c1.Item IS NOT NULL THEN 1
        WHEN c2.Item IS NOT NULL THEN 2
        ELSE 3
    END,
    COALESCE(c1.Item, c2.Item);

8.
SELECT 
    c.name AS Customers
FROM 
    Customers c
LEFT JOIN 
    Orders o ON c.id = o.customerId
WHERE 
    o.customerId IS NULL;

9.
SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COALESCE(COUNT(e.student_id), 0) AS attended_exams
FROM 
    Students s
CROSS JOIN 
    Subjects sub
LEFT JOIN 
    Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY 
    s.student_id, s.student_name, sub.subject_name
ORDER BY 
    s.student_id, sub.subject_name;

