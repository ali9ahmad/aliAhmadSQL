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
having count(e2.name) >=5

3.
  
