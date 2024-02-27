create TABLE [emp_details] (
    [EEID] varchar(255),
    [Full Name] varchar(255),
    [Job Title] varchar(255),
    [Department] varchar(255),
    [Business Unit] varchar(255),
    [Gender] varchar(255),
    [Ethnicity] varchar(255),
    [Age] int,
    [Hire Date] date,
    [Annual Salary] money,
    [Bonus %] int,
	[Exit date] varchar(50)
  
)

select * from [emp_details] (nolock)

