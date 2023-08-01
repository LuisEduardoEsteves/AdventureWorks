USE [AdventureWorksDW2022]
GO

/****** Object:  View [dbo].[dCustomer]    Script Date: 30/07/2023 18:59:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[dCustomer] as 
SELECT 
  c.customerkey AS CustomerKey, 
  c.firstname AS [First Name], 
  c.lastname AS [Last Name], 
  c.firstname + ' ' + lastname AS [Full Name], 
  CASE c.gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender, 
  c.datefirstpurchase AS DateFirstPurchase, 
  g.city AS [Customer City], -- Joined in Customer City from Geography Table
  g.EnglishCountryRegionName as [Customer Country]
FROM 
  DimCustomer as c 
  LEFT JOIN dbo.dimgeography AS g ON g.geographykey = c.geographykey
GO


