alter procedure usp_emp1(@empno int=null,@sal decimal(10,2)=null,@ename varchar(20)=null)
as
begin 
  declare @sql varchar(1000) = ''
  set @sql ='select * from tbl_emp where 1 =1'

  if (@ename is not null)
    begin
	   set @sql = @sql+' and ename ='+''''+@ename+''''
	end
exec(@sqL)
print(@sql)

end

exec usp_emp1 @ename = 'miller' 

drop procedure usp_emp1