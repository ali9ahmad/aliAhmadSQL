--Level 1: Basic Subqueries

1.
SELECT 
    id,
    name,
    salary
FROM 
    employees
WHERE 
    salary = (SELECT MIN(salary) FROM employees);

2.
SELECT 
    id,
    product_name,
    price
FROM 
    products
WHERE 
    price > (SELECT AVG(price) FROM products);


--Level 2: Nested Subqueries with Conditions
3.
select e.id, e.name, e.department_id
from employees e
where e.department_id = (select d.id from departments d where d.department_name = 'sales')

4.
select c.customer_id, c.name
from customers c
where c.customer_id in (select o.customer_id from orders o)

--Level 3: Aggregation and Grouping in Subqueries
5.
SELECT 
    p.category_id,
    p.price AS highestPrice
FROM 
    products p
WHERE 
    p.price = (SELECT MAX(p2.price) 
                FROM products p2 
                WHERE p2.category_id = p.category_id);

6.
SELECT 
    e.id,
    e.name,
    e.salary
FROM 
    employees e
WHERE 
    e.department_id = (SELECT TOP 1 d.id
                       FROM departments d
                       JOIN employees e2 ON d.id = e2.department_id
                       GROUP BY d.id
                       ORDER BY AVG(e2.salary) DESC);

--Level 4: Correlated Subqueries

7.
SELECT 
    e.id,
    e.name,
    e.salary
FROM 
    employees e
WHERE 
    e.salary > (
        SELECT 
            AVG(e2.salary)
        FROM 
            employees e2
        WHERE 
            e2.department_id = e.department_id
    );

8.
SELECT 
    s.student_id,
    s.name,
    g.course_id,
    g.grade
FROM 
    students s
JOIN 
    grades g ON s.student_id = g.student_id
WHERE 
    g.grade = (
        SELECT 
            MAX(g2.grade)
        FROM 
            grades g2
        WHERE 
            g2.course_id = g.course_id
    );

--Level 5: Subqueries with Ranking and Complex Conditions

9.
SELECT 
    p.id,
    p.product_name,
    p.price,
    p.category_id
FROM 
    products p
WHERE 
    p.price = (
        SELECT 
            DISTINCT p2.price
        FROM 
            products p2
        WHERE 
            p2.category_id = p.category_id
        ORDER BY 
            p2.price DESC
        OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY
    );


10.
SELECT 
    e.id,
    e.name,
    e.salary,
    e.department_id
FROM 
    employees e
WHERE 
    e.salary > (SELECT AVG(salary) FROM employees) 
    AND e.salary < (SELECT MAX(e2.salary) 
                     FROM employees e2 
                     WHERE e2.department_id = e.department_id);
