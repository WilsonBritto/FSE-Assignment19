USE [Assignment19]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 26-12-2018 20:52:45 ******/
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
/****** Object:  StoredProcedure [dbo].[spCreateCustomer]    Script Date: 26-12-2018 20:52:45 ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertRec]    Script Date: 26-12-2018 20:52:45 ******/
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
