USE [master]
GO
/****** Object:  Database [AW2014_Staging]    Script Date: 11/15/2023 11:11:50 PM ******/
CREATE DATABASE [AW2014_Staging]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AW2014_Staging', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\AW2014_Staging.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AW2014_Staging_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\AW2014_Staging_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AW2014_Staging] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AW2014_Staging].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AW2014_Staging] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AW2014_Staging] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AW2014_Staging] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AW2014_Staging] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AW2014_Staging] SET ARITHABORT OFF 
GO
ALTER DATABASE [AW2014_Staging] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AW2014_Staging] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AW2014_Staging] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AW2014_Staging] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AW2014_Staging] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AW2014_Staging] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AW2014_Staging] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AW2014_Staging] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AW2014_Staging] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AW2014_Staging] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AW2014_Staging] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AW2014_Staging] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AW2014_Staging] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AW2014_Staging] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AW2014_Staging] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AW2014_Staging] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AW2014_Staging] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AW2014_Staging] SET RECOVERY FULL 
GO
ALTER DATABASE [AW2014_Staging] SET  MULTI_USER 
GO
ALTER DATABASE [AW2014_Staging] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AW2014_Staging] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AW2014_Staging] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AW2014_Staging] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AW2014_Staging] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AW2014_Staging] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AW2014_Staging', N'ON'
GO
ALTER DATABASE [AW2014_Staging] SET QUERY_STORE = OFF
GO
USE [AW2014_Staging]
GO
/****** Object:  Schema [erp]    Script Date: 11/15/2023 11:11:50 PM ******/
CREATE SCHEMA [erp]
GO
/****** Object:  Table [erp].[Product]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[Product](
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ProductNumber] [nvarchar](25) NULL,
	[MakeFlag] [bit] NULL,
	[FinishedGoodsFlag] [bit] NULL,
	[Color] [nvarchar](15) NULL,
	[SafetyStockLevel] [smallint] NULL,
	[ReorderPoint] [smallint] NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NULL,
	[Size] [nvarchar](5) NULL,
	[SizeUnitMeasureCode] [nvarchar](3) NULL,
	[WeightUnitMeasureCode] [nvarchar](3) NULL,
	[Weight] [numeric](8, 2) NULL,
	[DaysToManufacture] [int] NULL,
	[ProductLine] [nvarchar](2) NULL,
	[Class] [nvarchar](2) NULL,
	[Style] [nvarchar](2) NULL,
	[ProductSubcategoryID] [int] NULL,
	[ProductModelID] [int] NULL,
	[SellStartDate] [datetime] NULL,
	[SellEndDate] [datetime] NULL,
	[DiscontinuedDate] [datetime] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [erp].[ProductCategory]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[ProductCategory](
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [erp].[ProductSubCategory]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[ProductSubCategory](
	[ProductSubcategoryID] [int] NULL,
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[STG_vw_Product]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[STG_vw_Product]
AS

SELECT
	p.[ProductID],
	p.[Name],
	p.[ProductNumber],
	p.[StandardCost],
	p.[ListPrice],
	p.[Color],
	s.[Name] AS "SubCategoryName",
	c.[Name] AS "CategoryName"
FROM [erp].[Product] p

LEFT JOIN [erp].[ProductSubCategory] s
ON p.[ProductSubcategoryID] = s.[ProductSubcategoryID]

LEFT JOIN [erp].[ProductCategory] c
ON s.[ProductCategoryID] = c.[ProductCategoryID]
GO
/****** Object:  Table [erp].[Customer]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[Customer](
	[CustomerID] [int] NULL,
	[PersonID] [int] NULL,
	[StoreID] [int] NULL,
	[TerritoryID] [int] NULL,
	[AccountNumber] [varchar](10) NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [erp].[Store]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[Store](
	[BusinessEntityID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Demographics] [nvarchar](max) NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[STG_vw_erp_Reseller]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[STG_vw_erp_Reseller]
AS

SELECT 
	[StoreID],
	s.[Name],
	NULL [YearOpened]

FROM [erp].[Customer] c
LEFT JOIN [erp].[Store] s
ON c.[StoreID] = s.[BusinessEntityID]


WHERE c.[PersonID] IS NULL
GO
/****** Object:  Table [erp].[SalesHeader]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[SalesHeader](
	[SalesOrderID] [int] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[RevisionNumber] [tinyint] NULL,
	[OrderDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[OnlineOrderFlag] [bit] NULL,
	[SalesOrderNumber] [nvarchar](25) NULL,
	[PurchaseOrderNumber] [nvarchar](25) NULL,
	[AccountNumber] [nvarchar](15) NULL,
	[CustomerID] [int] NULL,
	[SalesPersonID] [int] NULL,
	[TerritoryID] [int] NULL,
	[BillToAddressID] [int] NULL,
	[ShipToAddressID] [int] NULL,
	[ShipMethodID] [int] NULL,
	[CreditCardID] [int] NULL,
	[CreditCardApprovalCode] [varchar](15) NULL,
	[CurrencyRateID] [int] NULL,
	[SubTotal] [money] NULL,
	[TaxAmt] [money] NULL,
	[Freight] [money] NULL,
	[TotalDue] [money] NULL,
	[Comment] [nvarchar](128) NULL,
	[SSIS_ID] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [erp].[SalesOrderDetail]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[SalesOrderDetail](
	[SalesOrderID] [int] NULL,
	[SalesOrderDetailID] [int] NULL,
	[CarrierTrackingNumber] [nvarchar](25) NULL,
	[OrderQty] [smallint] NULL,
	[ProductID] [int] NULL,
	[SpecialOfferID] [int] NULL,
	[UnitPrice] [money] NULL,
	[UnitPriceDiscount] [money] NULL,
	[LineTotal] [numeric](38, 6) NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Stg_vw_Erp_Fact_InternetSales]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Stg_vw_Erp_Fact_InternetSales]
as
select h.[SalesOrderID],
 row_number() over(partition by h.[SalesOrderID] order by h.modifieddate) as saleLineNumber,
p.ProductNumber,
cast(h.[OrderDate] as date) [OrderDate] ,
cast(h.[DueDate] as Date) [DueDate],
cast(h.[ShipDate] as date) [ShipDate],
[CustomerID],
[TerritoryID],
N'USD' Currency,  
null [RevisionNumber],
[OrderQty],
[UnitPrice],
[UnitPriceDiscount],
[LineTotal],
0 [TaxAmt]

 from [erp].[SalesHeader] h
left join [erp].[SalesOrderDetail]  o
on h.SalesOrderID = o.SalesOrderID

left join [erp].[Product] p 
on o.[ProductID] = p.ProductID
where OnlineOrderFlag =1 -- This is to filer Internet Sales
GO
/****** Object:  View [dbo].[STG_vw_Fact_Reseller_Sales]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[STG_vw_Fact_Reseller_Sales]
AS

SELECT 
	h.[SalesOrderID],
	ROW_NUMBER() OVER(PARTITION BY h.[SalesOrderID] ORDER BY h.[ModifiedDate]) as SaleLineNumber,
	p.[ProductNumber],
	CAST(h.[OrderDate] AS date) [OrderDate],
	CAST(h.[DueDate] AS date) [DueDate],
	CAST(h.[ShipDate] AS date) [ShipDate],
	CAST(c.[StoreID] AS nvarchar(15)) ResellerID,
	N'USD' Currency,
	NULL [RevisionNumber],
	h.[TerritoryID],
	[OrderQty],
	[UnitPrice],
	[UnitPriceDiscount],
	[LineTotal],
	0 [TaxAmt]
FROM [AW2014_Staging].[erp].[SalesHeader] h
LEFT JOIN [AW2014_Staging].[erp].[SalesOrderDetail] d
ON h.[SalesOrderID] = d.[SalesOrderID]

LEFT JOIN [AW2014_Staging].[erp].[Product] p
ON d.[ProductID] = p.[ProductID]

LEFT JOIN [AW2014_Staging].[erp].[Customer] c
ON h.[CustomerID] = c.[CustomerID]

WHERE h.[OnlineOrderFlag] = 0
GO
/****** Object:  Table [erp].[Person]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[Person](
	[BusinessEntityID] [int] NULL,
	[PersonType] [nchar](2) NULL,
	[NameStyle] [bit] NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Suffix] [nvarchar](10) NULL,
	[EmailPromotion] [int] NULL,
	[AdditionalContactInfo] [nvarchar](max) NULL,
	[Demographics] [nvarchar](max) NULL,
	[rowgiud] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [erp].[PersonAddress]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[PersonAddress](
	[BusinessEntityID] [int] NULL,
	[AddressID] [int] NULL,
	[AddressLine1] [nvarchar](60) NULL,
	[City] [nvarchar](30) NULL,
	[PostalCode] [nvarchar](15) NULL,
	[StateProvimceID] [int] NULL,
	[rowgiud] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [erp].[EmailAddress]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[EmailAddress](
	[BusinessEntityID] [int] NOT NULL,
	[EmailAddressID] [int] NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [erp].[Phone]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[Phone](
	[BusinessEntityID] [int] NOT NULL,
	[PhoneNumber] [nvarchar](25) NOT NULL,
	[ModifiedDate] [date] NULL,
	[Created_Dt] [date] NULL,
	[SSISTrackId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Stg_vw_Customer]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[Stg_vw_Customer]
AS

SELECT
	c.[CustomerID],
	c.[TerritoryID],
	pa.[City],
	p.[FirstName],
	p.[MiddleName],
	p.[LastName],
	p.[Title],
	p.[Suffix],
	e.[EmailAddress],
	pa.[AddressLine1],
	ph.[PhoneNumber]

FROM [erp].[Customer] c
INNER JOIN [erp].[Person] p
ON c.[PersonID] = p.[BusinessEntityID]

LEFT JOIN [erp].[PersonAddress] pa
ON p.[BusinessEntityID] = pa.[BusinessEntityID]

LEFT JOIN [erp].[EmailAddress] e
ON p.[BusinessEntityID] = e.[BusinessEntityID]

LEFT JOIN [erp].[Phone] ph
ON c.[PersonID] = ph.[BusinessEntityID]
GO
/****** Object:  Table [erp].[BusinessEntity]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[BusinessEntity](
	[BusinessEntityID] [int] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [erp].[Currency]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[Currency](
	[CurrencyCode] [nvarchar](3) NULL,
	[Name] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [erp].[Territory]    Script Date: 11/15/2023 11:11:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [erp].[Territory](
	[TerritoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[CountryregionCode] [nvarchar](3) NULL,
	[Group] [nvarchar](50) NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Created_Dt] [datetime] NULL,
	[SSISTrackId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [erp].[BusinessEntity] ADD  CONSTRAINT [DF_BusinessEntity_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [erp].[BusinessEntity] ADD  CONSTRAINT [DF_BusinessEntity_Created_Dt]  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [erp].[Currency] ADD  CONSTRAINT [DF_Currency_Modified]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [erp].[Currency] ADD  CONSTRAINT [DF_Currency_CreatedDt]  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [erp].[Customer] ADD  CONSTRAINT [DF_Customer_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [erp].[Customer] ADD  CONSTRAINT [DF_Customer_CreatedDT]  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [erp].[EmailAddress] ADD  CONSTRAINT [DF_EmailAddress_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [erp].[EmailAddress] ADD  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [erp].[Person] ADD  CONSTRAINT [DF_Person_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [erp].[Person] ADD  CONSTRAINT [DF_Person_CreatedDT]  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [erp].[PersonAddress] ADD  CONSTRAINT [DF_PersonAddress_Modified]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [erp].[Phone] ADD  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [erp].[Product] ADD  CONSTRAINT [DF_Product_Modified]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [erp].[Product] ADD  CONSTRAINT [DF_erp.Product_CreatedDT]  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [erp].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Modified]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [erp].[ProductCategory] ADD  CONSTRAINT [DF_erp.ProductCategory_CreatedDT]  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [erp].[ProductSubCategory] ADD  CONSTRAINT [DF_ProductSubCategory_Modified]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [erp].[ProductSubCategory] ADD  CONSTRAINT [DF_erp.ProductSubCategory_CreatedDT]  DEFAULT (getdate()) FOR [Created_Dt]
GO
ALTER TABLE [erp].[Store] ADD  CONSTRAINT [DF_Store_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [erp].[Territory] ADD  CONSTRAINT [DF_Territory_Modified]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
USE [master]
GO
ALTER DATABASE [AW2014_Staging] SET  READ_WRITE 
GO
