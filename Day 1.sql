
DECLARE @Values table(id varchar(20))

insert into @Values(id)
values('1'),('2'),('3'),('a'),('b')
select * from @values
where ISNUMERIC(id) = 1

select min(sal) from tbl_emp
where sal in (select top 7 sal from tbl_emp order by sal desc)

DECLARE @Values table(id int)

insert into @Values(id)
values(1),(1),(0),(1)

select case when id = 1 then 0 else 1 end from @Values

;with cte_third_highest as
(
select deptno,sal,ROW_NUMBER() over(partition by deptno order by sal desc) as Third_highest from tbl_emp
)
select * from cte_third_highest
where Third_highest = 3
select dateadd(day,-15,GETDATE())


DECLARE @Values table(id int)

insert into @Values(id)
values(1),(12),(04),(15),(6),(7),(1),(12),(12),(12),(1)

;with cte_duplicates as
(
select *,ROW_NUMBER() over(partition by id order by id) rnk from @Values
)
delete cte_duplicates
where rnk>1

select id from @Values
group by id
having count(id)>1


declare @val1 varchar(20) = 'p'
declare @val2 int =1

while(@val2<=10)
begin
select concat(@val1,right('0000'+cast(@val2 as varchar(10)),5))
set @val2 = @val2 +1
end

select dateadd(day,-day(getdate()),getdate())

select -day(getdate())-1

select  eomonth(getdate())







