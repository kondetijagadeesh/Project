alter function sf_emp(@ename varchar(20))
returns decimal(10,2)
as
 begin
   
   return(
   select sal from tbl_emp
   where ename = @ename
   )
   end

   select dbo.sf_emp('Miller')

   create function inf_emp(@ename varchar(20))
   returns table
   as
   
     return(
	  select * from tbl_emp 
	  where ename = @ename
	  )

select * from dbo.inf_emp('Miller')

select * from tbl_emp


create function usf_mul_emp(@ename varchar(20))
returns @mul_emp table(ename varchar(20),sal decimal(10,2))
as
begin
  insert into @mul_emp(ename,sal)
  select ename ,sal from tbl_emp
  where ename = @ename
  return
end

select * from usf_mul_emp('miller')


create table IDENt_tbl(id int identity(1,1),name varchar(20))

set identity_insert IDENt_tbl on

insert into IDENt_tbl(name)
values('jagadeesh')

set identity_insert IDENt_tbl off

select * from IDENt_tbl

dbcc checkident('IDENt_tbl',reseed,5)

dbcc checkident('IDENt_tbl')

select * from tbl_emp e
where e.sal <(select e1.sal from tbl_emp e1 where e.MGR = e1.EMPNO)
and e.sal > any(select e2.sal from TBL_EMP e2 where e2.EMPNO IN(select e.mgr from TBL_EMP E)


SELECT * FROM TBL_EMP E
WHERE E.SAL < (SELECT E1.SAL FROM TBL_EMP E1 WHERE E.MGR = E1.EMPNO) 
AND E.SAL >ANY (SELECT E2.SAL FROM TBL_EMP E2 WHERE E2.EMPNO IN(select e.mgr from TBL_EMP E))

select deptno,string_agg(ename,',') from tbl_emp
group by deptno

select ename,deptno,sum(sal) over (partition by deptno order by deptno) from tbl_emp


alter procedure usp_emp(@empno int,@ename varchar(20),@sal decimal(10,2),@comm decimal(10,2))
as
begin
  
  if not exists (select 1 from tbl_emp where ename =@ename)
  begin
   insert into tbl_emp(empno,ename,sal,comm)
   values(@empno,@ename,@sal,@comm)
  end
  else
  begin
  update tbl_emp
  set sal = 2000
  where ename= @ename
  end
  end

  exec usp_emp @empno= 10,@ename ='jagadeesh' , @sal =2000 ,@comm = 100

  select * from tbl_emp


  alter procedure usp_dyn(@ename varchar(20)=null,@sal decimal(10,2) = null)
  as
  begin
  declare @sql varchar(1000) =''
  set @sql = 'select * from tbl_emp where 1=1'

  if @ename is not null
  begin
  set @sql= @sql + ' and ename='+''''+@ename+''''
  end
  
  if @sal is not null
  begin
  set @sql= @sql + 'and sal='+''''+cast(@sal as varchar(200))+''''
  end
  exec(@sql)
  end

  exec usp_dyn @ename ='jagadeesh'

  create table tbl_a(id int)
    create table tbl_b(id int)

	insert into tbl_a(id)
	values(1),(1),(0),(1),(null)

	insert into tbl_b(id)
	values(1),(0),(3),(4),(1),(null)

	select * from tbl_a a
	join tbl_b b on a.id =b.id

		select * from tbl_a a
	left join tbl_b b on a.id =b.id

	select * from TBL_EMP e
	where deptno in (select deptno from TBL_EMP e1 where e1.job = 'salesman')

	select distinct deptno,(select count(1) from tbl_emp e where e.DEPTNO = e1.DEPTNO ) from tbl_emp e1
	where e1.DEPTNO in (10,20)

	select * from INFORMATION_SCHEMA.tables

	select * from INFORMATION_SCHEMA.COLUMNS
	where TABLE_NAME ='tbl_emp'
	where 









