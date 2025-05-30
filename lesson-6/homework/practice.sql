--Lesson-6: Practice

--Puzzle 1: Finding Distinct Values
select distinct case when col1>col2 then col1 else col2 end as [Distinct Col1],
	case when col1<col2 then  col1 else col2 end as [Distinct Col2]
from InputTbl

--Puzzle 2: Removing Rows with All Zeroes
Select * from TestMultipleZero
where a<>0 or b<>0 or c<>0 or d<>0


--Puzzle 3: Find those with odd ids
select * from section1
where id % 2 <> 0

--Puzzle 4: Person with the smallest id (use the table in puzzle 3)
select top 1 * from section1
order by id

--Puzzle 5: Person with the highest id (use the table in puzzle 3)
select top 1 * from section1
order by id desc

--Puzzle 6: People whose name starts with b (use the table in puzzle 3)
select * from section1
where name like 'b%'

--Puzle 7: Write a query to return only the rows where the code contains the literal underscore _ (not as a wildcard).
select * from ProductCodes
where code like '%^_%' escape '^'
