USE [Assignment19]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 03-01-2019 21:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Custid] [int] IDENTITY(1,1) NOT NULL,
	[Custname] [varchar](50) NOT NULL,
	[CustAddress] [varchar](200) NULL,
	[DOB] [varchar](15) NULL,
	[salary] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sample_CustomerTable]    Script Date: 03-01-2019 21:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sample_CustomerTable](
	[CustId] [varchar](max) NULL,
	[CustName] [varchar](max) NULL,
	[CustAddr] [varchar](max) NULL,
	[Dob] [varchar](max) NULL,
	[Salary] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Custid], [Custname], [CustAddress], [DOB], [salary]) VALUES (7, N'Olenna', N'KK Nagar', N'2017-10-11', N'25500')
INSERT [dbo].[Customers] ([Custid], [Custname], [CustAddress], [DOB], [salary]) VALUES (8, N'Jamie', N'Bangalore', N'1988-01-13', N'24500')
INSERT [dbo].[Customers] ([Custid], [Custname], [CustAddress], [DOB], [salary]) VALUES (3, N'Loras', N'Chennai', N'2018-12-12', N'12000')
INSERT [dbo].[Customers] ([Custid], [Custname], [CustAddress], [DOB], [salary]) VALUES (6, N'Tyrell', N'Velachery', N'2018-12-11', N'20000')
INSERT [dbo].[Customers] ([Custid], [Custname], [CustAddress], [DOB], [salary]) VALUES (9, N'Cersei', N'Perumbakkam', N'2018-12-11', N'25000')
SET IDENTITY_INSERT [dbo].[Customers] OFF
INSERT [dbo].[Sample_CustomerTable] ([CustId], [CustName], [CustAddr], [Dob], [Salary]) VALUES (N'1', N'Stannis', N'KK Nagar', N'2017-10-11', N'25500')
INSERT [dbo].[Sample_CustomerTable] ([CustId], [CustName], [CustAddr], [Dob], [Salary]) VALUES (N'2', N'Robert', N'Bangalore', N'1988-01-13', N'24500')
INSERT [dbo].[Sample_CustomerTable] ([CustId], [CustName], [CustAddr], [Dob], [Salary]) VALUES (N'3', N'Jofery', N'Chennai', N'2018-12-12', N'12000')
INSERT [dbo].[Sample_CustomerTable] ([CustId], [CustName], [CustAddr], [Dob], [Salary]) VALUES (N'4', N'Tommen', N'Velachery', N'2018-12-11', N'20000')
/****** Object:  StoredProcedure [dbo].[spCreateCustomer]    Script Date: 03-01-2019 21:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spCreateCustomer]
as
begin
if not exists(select * from sys.tables where name='Customers')
create table Customers(
Custid int not null identity,
Custname varchar(50) not null,
CustAddress varchar(200),
DOB varchar(15),
salary varchar(50)
);
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCustomer]    Script Date: 03-01-2019 21:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spDeleteCustomer]
@CustId integer
as
begin
delete Customers where Custid=@CustId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetAllCustomers]    Script Date: 03-01-2019 21:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spGetAllCustomers]
@CustId integer
as
begin
select Custid 'CustId',Custname 'CustName', CustAddress 'CustAddr', DOB 'Dob', salary 'Salary' from dbo.Customers
where custid= case when @CustId=0 then custid else @CustId end

end
GO
/****** Object:  StoredProcedure [dbo].[spGetAllCustomersByDob]    Script Date: 03-01-2019 21:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetAllCustomersByDob]
@InpDate varchar(15)
as
begin
select Custid 'CustId',Custname 'CustName', CustAddress 'CustAddr', DOB 'Dob', salary 'Salary' from dbo.Customers
where CONVERT(date,DOB,120) > CONVERT(date, @InpDate, 120)

end
GO
/****** Object:  StoredProcedure [dbo].[spInsertRec]    Script Date: 03-01-2019 21:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertRec]
@CusName varchar(50),
@CusAdd varchar(200),
@Dob varchar(15),
@sal varchar(50)
as
begin
INSERT INTO [dbo].[Customers]
           ([Custname]
           ,[CustAddress]
           ,[DOB]
           ,[salary])
     VALUES
           (@CusName,@CusAdd,@Dob,@sal);

end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateCustomer]    Script Date: 03-01-2019 21:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spUpdateCustomer]
@CustId integer,
@CusName varchar(50),
@CusAdd varchar(200),
@Dob varchar(15),
@sal varchar(50)
as
begin
update Customers set Custname=@CusName,CustAddress=@CusAdd,DOB=@Dob,salary=@sal
where Custid=@CustId
end
GO
