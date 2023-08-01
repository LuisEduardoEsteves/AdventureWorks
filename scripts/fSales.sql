USE [AdventureWorksDW2022]
GO

/****** Object:  View [dbo].[fSales]    Script Date: 30/07/2023 18:26:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[fSales] as
SELECT 
  fis.[ProductKey], 
  fis.[OrderDateKey], 
  fis.[DueDateKey], 
  fis.[ShipDateKey], 
  fis.[CustomerKey], 
  dg.[EnglishCountryRegionName] AS StoreCountry, -- Country of the store where the product was bought
  fis.[SalesOrderNumber], 
  fis.[SalesAmount] 
FROM
  FactInternetSales fis
JOIN DimCustomer dc ON fis.CustomerKey = dc.CustomerKey
JOIN DimGeography dg ON fis.[SalesTerritoryKey] = dg.[SalesTerritoryKey]
WHERE 
  fis.OrderDateKey BETWEEN '20200101' AND '20221212';


GO


