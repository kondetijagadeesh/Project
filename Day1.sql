use USERDB

select * into new_emp from tbl_emp

select value from string_split(select ename from tbl_emp,' ')

select value from tbl_emp 
cross apply string_split(ename,' ')

;with cte_name as
(
select * from tbl_emp
)select * from cte_name


;with cte_highest as
(
select *,ROW_NUMBER() over(order by sal desc) as highest  from tbl_emp
)select * from cte_highest
where highest = 1

CREATE TABLE Employees
(
  EmployeeID int NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  ManagerID int NULL
)

INSERT INTO Employees VALUES (1, 'Ken', 'Thompson', NULL)
INSERT INTO Employees VALUES (2, 'Terri', 'Ryan', 1)
INSERT INTO Employees VALUES (3, 'Robert', 'Durello', 1)
INSERT INTO Employees VALUES (4, 'Rob', 'Bailey', 2)
INSERT INTO Employees VALUES (5, 'Kent', 'Erickson', 2)
INSERT INTO Employees VALUES (6, 'Bill', 'Goldberg', 3)
INSERT INTO Employees VALUES (7, 'Ryan', 'Miller', 3)
INSERT INTO Employees VALUES (8, 'Dane', 'Mark', 5)
INSERT INTO Employees VALUES (9, 'Charles', 'Matthew', 6)
INSERT INTO Employees VALUES (10, 'Michael', 'Jhonson', 6) 


WITH
  cteReports (EmpID, FirstName, LastName, MgrID, EmpLevel)
  AS
  (
    SELECT EmployeeID, FirstName, LastName, ManagerID, 1
    FROM Employees
    WHERE ManagerID IS NULL
    UNION ALL
    SELECT e.EmployeeID, e.FirstName, e.LastName, e.ManagerID, 
      r.EmpLevel + 1
    FROM Employees e
      INNER JOIN cteReports r
        ON e.ManagerID = r.EmpID
  )
SELECT
  FirstName + ' ' + LastName AS FullName, 
  EmpLevel,
  (SELECT FirstName + ' ' + LastName FROM Employees 
    WHERE EmployeeID = cteReports.MgrID) AS Manager
FROM cteReports 
ORDER BY EmpLevel, MgrID 

;with cte_delete as
(
 select * , ROW_NUMBER() over(order by sal) as rnk from tbl_emp
)
delete cte_delete
where rnk= 9

;with cte_loop as
(
select 10 as number
union all
select number + 1 from cte_loop
where number < 20
)select* from cte_loop


;with cte_man as
(
select * from tbl_emp
where mgr is null
union all
select e.* from tbl_emp e
join cte_man c on c.empno = e.mgr
)select * from cte_man

DECLARE @WeekDays TABLE (Number INT, Day VARCHAR(40), Name VARCHAR(40))
INSERT INTO @WeekDays
VALUES

(1, 'Mon', 'Monday'),
(2, 'Tue', 'Tuesday'),
(3, 'Wed', 'Wednesday'),
(4, 'Thu', 'Thursday'),
(5, 'Fri', 'Friday'),
(6, 'Sat', 'Saturday'),
(7, 'Sun', 'Sunday')

delete @WeekDays
where Number =7 

select * from @WeekDays

select min(sal) from tbl_emp
where sal in (select top 2 sal from tbl_emp order by sal desc)

select max(sal) from TBL_EMP
where sal < (select max(sal) from tbl_emp)

