1. 
with cte1 as (select distinct distributor from #regionsales),
cte2 as (select distinct region from #regionsales)

select cte2.region, cte1.distributor, ISNULL(sales, 0) sales from cte1 
  cross join cte2 
  left join #regionsales r1 
  on cte1.distributor = r1.distributor 
  and cte2.region = r1.region
order by sales desc

2.
select e1.name 
  from employee e1 
  join employee e2 
  on e1.id = e2.managerid
group by e1.name 
having count(*) >=5

3.
SELECT 
	PRODUCT_NAME,
    SUM(UNIT) AS UNIT
FROM 
    ORDERS O
JOIN
	PRODUCTS P ON O.PRODUCT_ID = P.PRODUCT_ID
WHERE 
    YEAR(ORDER_DATE) = 2020 AND MONTH(ORDER_DATE) = 2
GROUP BY 
    PRODUCT_NAME
HAVING 
    SUM(UNIT) >= 100
ORDER BY 
	SUM(UNIT) DESC

4.
WITH CTE AS (
SELECT VENDOR,  SUM([COUNT]) COUNT
FROM 
	ORDERS
GROUP BY
	VENDOR
)

SELECT  O.CUSTOMERID, C.VENDOR
FROM CTE  C
LEFT JOIN ORDERS O ON C.VENDOR = O.VENDOR
