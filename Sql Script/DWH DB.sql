USE [master]
GO
/****** Object:  Database [AW2014_DWH]    Script Date: 11/15/2023 11:14:12 PM ******/
CREATE DATABASE [AW2014_DWH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AW2014_DWH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\AW2014_DWH.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AW2014_DWH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\AW2014_DWH_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AW2014_DWH] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AW2014_DWH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AW2014_DWH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AW2014_DWH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AW2014_DWH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AW2014_DWH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AW2014_DWH] SET ARITHABORT OFF 
GO
ALTER DATABASE [AW2014_DWH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AW2014_DWH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AW2014_DWH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AW2014_DWH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AW2014_DWH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AW2014_DWH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AW2014_DWH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AW2014_DWH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AW2014_DWH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AW2014_DWH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AW2014_DWH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AW2014_DWH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AW2014_DWH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AW2014_DWH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AW2014_DWH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AW2014_DWH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AW2014_DWH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AW2014_DWH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AW2014_DWH] SET  MULTI_USER 
GO
ALTER DATABASE [AW2014_DWH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AW2014_DWH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AW2014_DWH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AW2014_DWH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AW2014_DWH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AW2014_DWH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AW2014_DWH', N'ON'
GO
ALTER DATABASE [AW2014_DWH] SET QUERY_STORE = OFF
GO
USE [AW2014_DWH]
GO
/****** Object:  Schema [Sales]    Script Date: 11/15/2023 11:14:12 PM ******/
CREATE SCHEMA [Sales]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 11/15/2023 11:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[FullDateAlternateKey] [date] NOT NULL,
	[DayNumberOfWeek] [tinyint] NOT NULL,
	[EnglishDayNameOfWeek] [nvarchar](10) NOT NULL,
	[DayNumberOfMonth] [tinyint] NOT NULL,
	[DayNumberOfYear] [smallint] NOT NULL,
	[WeekNumberOfYear] [tinyint] NOT NULL,
	[EnglishMonthName] [nvarchar](10) NOT NULL,
	[MonthNumberOfYear] [tinyint] NOT NULL,
	[CalendarQuarter] [tinyint] NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarSemester] [tinyint] NOT NULL,
	[FiscalQuarter] [tinyint] NOT NULL,
	[FiscalYear] [smallint] NOT NULL,
	[FiscalSemester] [tinyint] NOT NULL,
 CONSTRAINT [PK_DimDate_DateKey] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[DimCurrency]    Script Date: 11/15/2023 11:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[DimCurrency](
	[CurrencyKey] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyAlternateKey] [nchar](3) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DimCurrency_CurrencyKey] PRIMARY KEY CLUSTERED 
(
	[CurrencyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[DimCustomer]    Script Date: 11/15/2023 11:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[DimCustomer](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[CustoomerAlternateKey] [int] NOT NULL,
	[GeographyKey] [int] NULL,
	[City] [nvarchar](30) NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](20) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](8) NULL,
	[Suffix] [nvarchar](10) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[AddressLine1] [nvarchar](60) NULL,
	[AddressLine2] [nvarchar](60) NULL,
	[PhoneNumber] [nvarchar](25) NULL,
 CONSTRAINT [PK_DimCustomer_CustomerKey] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[DimProduct]    Script Date: 11/15/2023 11:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[DimProduct](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductAlternateKey] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProductNumber] [nvarchar](25) NOT NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NULL,
	[Color] [nvarchar](15) NULL,
	[SubCategoryName] [nvarchar](50) NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimProduct_ProductKey] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[DimReseller]    Script Date: 11/15/2023 11:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[DimReseller](
	[ResellerKey] [int] IDENTITY(1,1) NOT NULL,
	[ResellerAlternateKey] [nvarchar](15) NULL,
	[ResellerName] [nvarchar](50) NOT NULL,
	[YearOpened] [int] NULL,
 CONSTRAINT [PK_DimReseller_ResellerKey] PRIMARY KEY CLUSTERED 
(
	[ResellerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[DimTerritory]    Script Date: 11/15/2023 11:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[DimTerritory](
	[TerritoryKey] [int] IDENTITY(1,1) NOT NULL,
	[TerritoryAlternateKey] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[RegionCode] [nvarchar](3) NOT NULL,
	[Group] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimTerritory_TerritoryKey] PRIMARY KEY CLUSTERED 
(
	[TerritoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[FactInternetSales]    Script Date: 11/15/2023 11:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[FactInternetSales](
	[ProductKey] [int] NOT NULL,
	[OrderDateKey] [int] NOT NULL,
	[DueDateKey] [int] NOT NULL,
	[ShipDateKey] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[SalesTerritoryKey] [int] NOT NULL,
	[SalesOrderNumber] [nvarchar](20) NOT NULL,
	[SalesOrderLineNumber] [tinyint] NOT NULL,
	[OrderQuantity] [smallint] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[DiscountAmount] [float] NOT NULL,
	[SalesAmount] [money] NOT NULL,
	[TaxAmt] [money] NOT NULL,
	[OrderDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
 CONSTRAINT [PK_FactInternetSales_SalesOrderNumber_SalesOrderLineNumber] PRIMARY KEY CLUSTERED 
(
	[SalesOrderNumber] ASC,
	[SalesOrderLineNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[FactResellerSales]    Script Date: 11/15/2023 11:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[FactResellerSales](
	[ProductKey] [int] NOT NULL,
	[OrderDateKey] [int] NOT NULL,
	[DueDateKey] [int] NOT NULL,
	[ShipDateKey] [int] NOT NULL,
	[ResellerKey] [int] NOT NULL,
	[CurrencyKey] [int] NOT NULL,
	[SalesTerritoryKey] [int] NOT NULL,
	[SalesOrderNumber] [nvarchar](20) NOT NULL,
	[SalesOrderLineNumber] [tinyint] NOT NULL,
	[OrderQuantity] [smallint] NULL,
	[UnitPrice] [money] NOT NULL,
	[DiscountAmount] [float] NOT NULL,
	[SalesAmount] [money] NULL,
	[OrderDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
 CONSTRAINT [PK_FactResellerSales_SalesOrderNumber_SalesOrderLineNumber] PRIMARY KEY CLUSTERED 
(
	[SalesOrderNumber] ASC,
	[SalesOrderLineNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[FactInternetSales]  WITH CHECK ADD  CONSTRAINT [FK_FactInternetSales_DimCurrency] FOREIGN KEY([CurrencyKey])
REFERENCES [Sales].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [Sales].[FactInternetSales] CHECK CONSTRAINT [FK_FactInternetSales_DimCurrency]
GO
ALTER TABLE [Sales].[FactInternetSales]  WITH CHECK ADD  CONSTRAINT [FK_FactInternetSales_DimCustomer] FOREIGN KEY([CustomerKey])
REFERENCES [Sales].[DimCustomer] ([CustomerKey])
GO
ALTER TABLE [Sales].[FactInternetSales] CHECK CONSTRAINT [FK_FactInternetSales_DimCustomer]
GO
ALTER TABLE [Sales].[FactInternetSales]  WITH CHECK ADD  CONSTRAINT [FK_FactInternetSales_DimDate] FOREIGN KEY([OrderDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [Sales].[FactInternetSales] CHECK CONSTRAINT [FK_FactInternetSales_DimDate]
GO
ALTER TABLE [Sales].[FactInternetSales]  WITH CHECK ADD  CONSTRAINT [FK_FactInternetSales_DimDate1] FOREIGN KEY([DueDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [Sales].[FactInternetSales] CHECK CONSTRAINT [FK_FactInternetSales_DimDate1]
GO
ALTER TABLE [Sales].[FactInternetSales]  WITH CHECK ADD  CONSTRAINT [FK_FactInternetSales_DimDate2] FOREIGN KEY([ShipDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [Sales].[FactInternetSales] CHECK CONSTRAINT [FK_FactInternetSales_DimDate2]
GO
ALTER TABLE [Sales].[FactInternetSales]  WITH CHECK ADD  CONSTRAINT [FK_FactInternetSales_DimProduct] FOREIGN KEY([ProductKey])
REFERENCES [Sales].[DimProduct] ([ProductKey])
GO
ALTER TABLE [Sales].[FactInternetSales] CHECK CONSTRAINT [FK_FactInternetSales_DimProduct]
GO
ALTER TABLE [Sales].[FactInternetSales]  WITH CHECK ADD  CONSTRAINT [FK_FactInternetSales_DimSalesTerritory] FOREIGN KEY([SalesTerritoryKey])
REFERENCES [Sales].[DimTerritory] ([TerritoryKey])
GO
ALTER TABLE [Sales].[FactInternetSales] CHECK CONSTRAINT [FK_FactInternetSales_DimSalesTerritory]
GO
ALTER TABLE [Sales].[FactResellerSales]  WITH CHECK ADD  CONSTRAINT [FK_FactResellerSales_DimDate] FOREIGN KEY([OrderDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [Sales].[FactResellerSales] CHECK CONSTRAINT [FK_FactResellerSales_DimDate]
GO
ALTER TABLE [Sales].[FactResellerSales]  WITH CHECK ADD  CONSTRAINT [FK_FactResellerSales_DimDate1] FOREIGN KEY([DueDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [Sales].[FactResellerSales] CHECK CONSTRAINT [FK_FactResellerSales_DimDate1]
GO
ALTER TABLE [Sales].[FactResellerSales]  WITH CHECK ADD  CONSTRAINT [FK_FactResellerSales_DimDate2] FOREIGN KEY([ShipDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [Sales].[FactResellerSales] CHECK CONSTRAINT [FK_FactResellerSales_DimDate2]
GO
ALTER TABLE [Sales].[FactResellerSales]  WITH CHECK ADD  CONSTRAINT [FK_FactResellerSales_DimProduct] FOREIGN KEY([ProductKey])
REFERENCES [Sales].[DimProduct] ([ProductKey])
GO
ALTER TABLE [Sales].[FactResellerSales] CHECK CONSTRAINT [FK_FactResellerSales_DimProduct]
GO
ALTER TABLE [Sales].[FactResellerSales]  WITH CHECK ADD  CONSTRAINT [FK_FactResellerSales_DimSalesTerritory] FOREIGN KEY([SalesTerritoryKey])
REFERENCES [Sales].[DimTerritory] ([TerritoryKey])
GO
ALTER TABLE [Sales].[FactResellerSales] CHECK CONSTRAINT [FK_FactResellerSales_DimSalesTerritory]
GO
ALTER TABLE [Sales].[FactResellerSales]  WITH CHECK ADD  CONSTRAINT [FK_reseller] FOREIGN KEY([ResellerKey])
REFERENCES [Sales].[DimReseller] ([ResellerKey])
GO
ALTER TABLE [Sales].[FactResellerSales] CHECK CONSTRAINT [FK_reseller]
GO
/****** Object:  StoredProcedure [dbo].[Refresh_Customer]    Script Date: 11/15/2023 11:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Refresh_Customer]
 as
 begin

 set nocount on

 MERGE INTO [Sales].[DimCustomer] cus
 USING [AW2014_Staging].[dbo].[Stg_vw_Customer] stg
 ON cus.[CustoomerAlternateKey] = stg.[CustomerID]

 WHEN MATCHED AND(cus.[EmailAddress]<>stg.[EmailAddress] OR cus.[AddressLine1]<>stg.[AddressLine1] OR cus.[AddressLine2]<>stg.[City])
 THEN

 -- SCD Type one: Overwrite
	UPDATE SET 
	   cus.[EmailAddress] = stg.[EmailAddress],
	   cus.[AddressLine1] = stg.[AddressLine1],
	   cus.[AddressLine2] = stg.[City]

 WHEN NOT MATCHED BY TARGET THEN
 INSERT(
        [CustoomerAlternateKey],
		[GeographyKey],
		[City],
		[FirstName],
		[MiddleName],
		[LastName],
		[Title],
		[Suffix],
		[EmailAddress],
		[AddressLine1],
		[AddressLine2],
		[PhoneNumber]
		)
  VALUES(
		 stg.[CustomerID],
		 stg.[TerritoryID],
		 stg.[City],
		 stg.[FirstName],
		 stg.[MiddleName],
		 stg.[LastName],
		 stg.[Title],
		 stg.[Suffix],
		 stg.[EmailAddress],
		 stg.[AddressLine1],
		 stg.[City],
		 stg.[PhoneNumber]
		 )
;

set nocount off
end

GO
/****** Object:  StoredProcedure [dbo].[Refresh_DimCurrency]    Script Date: 11/15/2023 11:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Refresh_DimCurrency]
as
begin

set nocount on
INSERT INTO [Sales].[DimCurrency]
([CurrencyAlternateKey],[Name])


SELECT [CurrencyCode]
      ,stg.[Name]    
  FROM [AW2014_Staging].[erp].[Currency] stg (nolock)
    left join [AW2014_DWH].[Sales].[DimCurrency] Dim  (nolock)
  on stg.CurrencyCode = Dim.CurrencyAlternateKey
    where Dim.CurrencyAlternateKey is null

	-- SCD Type one: Overwrite
UPDATE Dim

SET [Name] = stg.[Name]
FROM [Sales].[DimCurrency] Dim (nolock)
 INNER JOIN [AW2014_Staging].[erp].[Currency] stg (nolock)
 ON stg.[CurrencyCode] = Dim.[CurrencyAlternateKey]

 set nocount off

 end

GO
/****** Object:  StoredProcedure [dbo].[Refresh_DimDate]    Script Date: 11/15/2023 11:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[Refresh_DimDate]
as
Begin

declare @startdate date = '2005-01-01',
    @enddate date = '2015-12-31'

IF @startdate IS NULL
    BEGIN
        Select Top 1 @startdate = FulldateAlternateKey
        From DimDate 
        Order By DateKey ASC 
    END

Declare @datelist table (FullDate date)

while @startdate <= @enddate

Begin 
    Insert into @datelist (FullDate)
    Select @startdate

    Set @startdate = dateadd(dd,1,@startdate)

end 

 Insert into dbo.DimDate 
    (DateKey, 
        FullDateAlternateKey, 
        DayNumberOfWeek, 
        EnglishDayNameOfWeek, 
      
        DayNumberOfMonth, 
        DayNumberOfYear, 
        WeekNumberOfYear, 
        EnglishMonthName, 
     
        MonthNumberOfYear, 
        CalendarQuarter, 
        CalendarYear, 
        CalendarSemester, 
        FiscalQuarter, 
        FiscalYear, 
        FiscalSemester)


select convert(int,convert(varchar,dl.FullDate,112)) as DateKey,
    dl.FullDate,
    datepart(dw,dl.FullDate) as DayNumberOfWeek,
    datename(weekday,dl.FullDate) as EnglishDayNameOfWeek,
    
    
    datepart(d,dl.FullDate) as DayNumberOfMonth,
    datepart(dy,dl.FullDate) as DayNumberOfYear,
    datepart(wk, dl.FUllDate) as WeekNumberOfYear,
    datename(MONTH,dl.FullDate) as EnglishMonthName,
   
   
    Month(dl.FullDate) as MonthNumberOfYear,
    datepart(qq, dl.FullDate) as CalendarQuarter,
    year(dl.FullDate) as CalendarYear,
    case datepart(qq, dl.FullDate)
        when 1 then 1
        when 2 then 1
        when 3 then 2
        when 4 then 2
    end as CalendarSemester,
    case datepart(qq, dl.FullDate)
        when 1 then 3
        when 2 then 4
        when 3 then 1
        when 4 then 2
    end as FiscalQuarter,
    case datepart(qq, dl.FullDate)
        when 1 then year(dl.FullDate)
        when 2 then year(dl.FullDate)
        when 3 then year(dl.FullDate) + 1
        when 4 then year(dl.FullDate) + 1
    end as FiscalYear,
    case datepart(qq, dl.FullDate)
        when 1 then 2
        when 2 then 2
        when 3 then 1
        when 4 then 1
    end as FiscalSemester

from @datelist dl left join 
    DimDate dd 
        on dl.FullDate = dd.FullDateAlternateKey
Where dd.FullDateAlternateKey is null 


End
GO
/****** Object:  StoredProcedure [dbo].[Refresh_DimProduct]    Script Date: 11/15/2023 11:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Refresh_DimProduct]
AS
BEGIN

set nocount on

INSERT INTO [AW2014_DWH].[Sales].[DimProduct]
	([ProductAlternateKey]
      ,[Name]
      ,[ProductNumber]
      ,[StandardCost]
      ,[ListPrice]
      ,[Color]
      ,[SubCategoryName]
      ,[CategoryName]
	  )

SELECT
	   stg.[ProductID]
      ,stg.[Name]
      ,stg.[ProductNumber]
      ,stg.[StandardCost]
      ,stg.[ListPrice]
      ,stg.[Color]
      ,stg.[SubCategoryName]
      ,stg.[CategoryName]
FROM [AW2014_Staging].[dbo].[STG_vw_Product] stg (nolock)
LEFT JOIN [AW2014_DWH].[Sales].[DimProduct] Dim (nolock)
ON stg.ProductID = Dim.[ProductAlternateKey]

WHERE Dim.[ProductAlternateKey] IS NULL

UPDATE Dim
SET Dim.[StandardCost] = stg.[StandardCost]


FROM [AW2014_DWH].[Sales].[DimProduct] Dim (nolock)
INNER JOIN [AW2014_Staging].[dbo].[STG_vw_Product] stg
ON Dim.ProductAlternateKey = stg.[ProductID]

set nocount off
end
GO
/****** Object:  StoredProcedure [dbo].[Refresh_Reseller]    Script Date: 11/15/2023 11:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Refresh_Reseller]
as
begin

set nocount on

INSERT INTO [AW2014_DWH].[Sales].[DimReseller]
(
 [ResellerAlternateKey],
 [ResellerName],
 [YearOpened]
 )

 SELECT
	stg.[StoreID],
	stg.[Name],
	stg.[YearOpened]
 FROM [AW2014_Staging].[dbo].[STG_vw_erp_Reseller] stg  (nolock)
 LEFT JOIN [AW2014_DWH].[Sales].[DimReseller] Dim  (nolock)
 ON stg.[StoreID] = Dim.[ResellerAlternateKey]

 WHERE Dim.[ResellerAlternateKey] IS NULL


 UPDATE Dim

 SET Dim.[ResellerName] = stg.[Name]
 FROM [AW2014_DWH].[Sales].[DimReseller] Dim  (nolock)
 INNER JOIN [AW2014_Staging].[dbo].[STG_vw_erp_Reseller] stg  (nolock)
  ON stg.[StoreID] = Dim.[ResellerAlternateKey]

  set nocount off

  end
GO
/****** Object:  StoredProcedure [dbo].[Refresh_Territory]    Script Date: 11/15/2023 11:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Refresh_Territory]
as
begin

set nocount on

INSERT INTO [AW2014_DWH].[Sales].[DimTerritory]
	(
	   [TerritoryAlternateKey]
      ,[Name]
      ,[RegionCode]
      ,[Group]
	  )

SELECT
	   stg.[TerritoryID]
      ,stg.[Name]
      ,stg.[CountryregionCode]
      ,stg.[Group]

FROM [AW2014_Staging].[erp].[Territory] stg (nolock)
LEFT JOIN [AW2014_DWH].[Sales].[DimTerritory] Dim (nolock)
ON stg.[TerritoryID] = Dim.[TerritoryAlternateKey]

WHERE Dim.[TerritoryAlternateKey] IS NULL


UPDATE Dim

SET Dim.[Name] = stg.[Name],
	Dim.[RegionCode] = stg.[CountryregionCode],
	Dim.[Group] = stg.[Group]

FROM [AW2014_DWH].[Sales].[DimTerritory] Dim (nolock)
INNER JOIN [AW2014_Staging].[erp].[Territory] stg (nolock)
ON stg.[TerritoryID] = Dim.[TerritoryAlternateKey]

set nocount off

end
GO
USE [master]
GO
ALTER DATABASE [AW2014_DWH] SET  READ_WRITE 
GO
