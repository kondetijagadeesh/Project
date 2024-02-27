select* from dbo.[merge]

select @@SERVERNAME

CREATE TABLE [Union_All] (
    [EEID] varchar(50),
    [Full Name] varchar(50),
    [Job Title] varchar(50),
    [Department] varchar(50),
    [Business Unit] varchar(50),
    [Gender] varchar(50),
    [Ethnicity] varchar(50),
    [Age] varchar(50),
    [Hire Date] varchar(50),
    [Annual Salary] varchar(50),
    [Country] varchar(50),
    [City] varchar(50),
    [bonus%] varchar(50),
    [Exit date] varchar(50)
)

select * from [Union_All](nolock)



CREATE TABLE [LookUP] (
    [TransDate] varchar(50),
    [Account] varchar(50),
    [Customer] varchar(50),
    [Department] varchar(50),
    [Amount] varchar(50)
)

select * from [LookUP](nolock)
where Customer = 'claire gute'


delete dbo.[LookUP](nolock)