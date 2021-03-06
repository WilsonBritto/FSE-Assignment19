USE [master]
GO
/****** Object:  Database [Assignment19]    Script Date: 15-12-2018 17:15:01 ******/
CREATE DATABASE [Assignment19]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment19', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Assignment19.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Assignment19_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Assignment19_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Assignment19] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment19].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment19] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment19] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment19] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment19] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment19] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment19] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment19] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment19] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment19] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment19] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment19] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment19] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment19] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment19] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment19] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment19] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment19] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment19] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment19] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment19] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment19] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment19] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment19] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment19] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment19] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment19] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment19] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment19] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assignment19', N'ON'
GO
USE [Assignment19]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 15-12-2018 17:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Custid] [int] IDENTITY(1,1) NOT NULL,
	[Custname] [varchar](50) NOT NULL,
	[CustAddress] [varchar](200) NULL,
	[DOB] [date] NULL,
	[salary] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spCreateCustomer]    Script Date: 15-12-2018 17:15:02 ******/
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
DOB date,
salary varchar(50)
);
end
GO
USE [master]
GO
ALTER DATABASE [Assignment19] SET  READ_WRITE 
GO
