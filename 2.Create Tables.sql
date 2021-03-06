/*   Create Tables and view
*/

USE [B2B_DB]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Supplier_Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_Supplier_Product] DROP CONSTRAINT IF EXISTS [FK__Tbl_Suppl__SuppC__34E8D562]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Supplier_Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_Supplier_Product] DROP CONSTRAINT IF EXISTS [FK__Tbl_Suppl__Produ__35DCF99B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Supplier_Price]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_Supplier_Price] DROP CONSTRAINT IF EXISTS [FK__Tbl_Suppl__SuppP__353DDB1D]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Subsidiary]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_Subsidiary] DROP CONSTRAINT IF EXISTS [FK__Tbl_Subsid__CUIT__38B96646]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Subsidiary]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_Subsidiary] DROP CONSTRAINT IF EXISTS [FK__Tbl_Subsid__CUIT__08362A7C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Order]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_Order] DROP CONSTRAINT IF EXISTS [FK__Tbl_Order__SuppP__4F9CCB9E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Order]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_Order] DROP CONSTRAINT IF EXISTS [FK__Tbl_Order__Cust___4EA8A765]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Cust_Sub]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_Cust_Sub] DROP CONSTRAINT IF EXISTS [FK__Tbl_Cust_S__SUIT__3D7E1B63]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Cust_Sub]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_Cust_Sub] DROP CONSTRAINT IF EXISTS [FK__Tbl_Cust___DOCNo__3C89F72A]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Company_Price]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_Company_Price] DROP CONSTRAINT IF EXISTS [FK__Tbl_Compa__SuppP__405A880E]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Company_Price]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_Company_Price] DROP CONSTRAINT IF EXISTS [FK__Tbl_Compa__CompC__3F6663D5]
GO
/****** Object:  Table [dbo].[Tbl_Customer]    Script Date: 9/27/2017 8:16:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Tbl_Customer]
GO
/****** Object:  View [dbo].[VW_Available_Product_List]    Script Date: 9/27/2017 8:16:20 PM ******/
DROP VIEW IF EXISTS [dbo].[VW_Available_Product_List]
GO
/****** Object:  Table [dbo].[Tbl_Supplier_Product]    Script Date: 9/27/2017 8:16:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Tbl_Supplier_Product]
GO
/****** Object:  Table [dbo].[Tbl_Product]    Script Date: 9/27/2017 8:16:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Tbl_Product]
GO
/****** Object:  View [dbo].[VW_OrderDetails]    Script Date: 9/27/2017 8:16:20 PM ******/
DROP VIEW IF EXISTS [dbo].[VW_OrderDetails]
GO
/****** Object:  Table [dbo].[Tbl_Order]    Script Date: 9/27/2017 8:16:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Tbl_Order]
GO
/****** Object:  Table [dbo].[Tbl_Company_Price]    Script Date: 9/27/2017 8:16:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Tbl_Company_Price]
GO
/****** Object:  Table [dbo].[Tbl_Supplier_Price]    Script Date: 9/27/2017 8:16:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Tbl_Supplier_Price]
GO
/****** Object:  View [dbo].[VW_Customer_Sub_COmpany]    Script Date: 9/27/2017 8:16:20 PM ******/
DROP VIEW IF EXISTS [dbo].[VW_Customer_Sub_COmpany]
GO
/****** Object:  Table [dbo].[Tbl_Cust_Sub]    Script Date: 9/27/2017 8:16:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Tbl_Cust_Sub]
GO
/****** Object:  Table [dbo].[Tbl_Subsidiary]    Script Date: 9/27/2017 8:16:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Tbl_Subsidiary]
GO
/****** Object:  Table [dbo].[Tbl_Company]    Script Date: 9/27/2017 8:16:20 PM ******/
DROP TABLE IF EXISTS [dbo].[Tbl_Company]
GO
/****** Object:  Table [dbo].[Tbl_Company]    Script Date: 9/27/2017 8:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Company]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tbl_Company](
	[CUIT] [varchar](36) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[DateOfCommencement] [datetime] NULL,
	[Website] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[IsSupplier] [bit] NOT NULL,
	[Landline] [nvarchar](20) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Fax] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Tbl_Subsidiary]    Script Date: 9/27/2017 8:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Subsidiary]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tbl_Subsidiary](
	[SUIT] [varchar](36) NOT NULL,
	[CUIT] [varchar](36) NOT NULL,
	[NickName] [nvarchar](200) NULL,
	[AddressLine1] [nvarchar](200) NULL,
	[AddressLine2] [nvarchar](200) NULL,
	[City] [nvarchar](50) NULL,
	[St] [nvarchar](20) NULL,
	[Zip] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[SUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Tbl_Cust_Sub]    Script Date: 9/27/2017 8:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Cust_Sub]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tbl_Cust_Sub](
	[Cust_Sub_Id] [int] IDENTITY(0,1) NOT FOR REPLICATION NOT NULL,
	[DOCNo] [varchar](36) NULL,
	[SUIT] [varchar](36) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cust_Sub_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[VW_Customer_Sub_COmpany]    Script Date: 9/27/2017 8:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_Customer_Sub_COmpany]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[VW_Customer_Sub_COmpany]
AS
SELECT Cust_Sub_Id,DOCNo,CS.SUIT,C.CUIT,C.CompanyName
 FROM Tbl_Cust_Sub CS
 JOIN Tbl_Subsidiary S ON CS.SUIT = S.SUIT
 JOIN Tbl_Company C ON C.CUIT = S.CUIT
' 
GO
/****** Object:  Table [dbo].[Tbl_Supplier_Price]    Script Date: 9/27/2017 8:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Supplier_Price]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tbl_Supplier_Price](
	[Id] [int] IDENTITY(0,1) NOT FOR REPLICATION NOT NULL,
	[SuppProdId] [int] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[CostPrice] [decimal](16, 8) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [unq_Supp_price] UNIQUE NONCLUSTERED 
(
	[SuppProdId] ASC,
	[StartDate] ASC,
	[EndDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Tbl_Company_Price]    Script Date: 9/27/2017 8:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Company_Price]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tbl_Company_Price](
	[CompCUIT] [varchar](36) NULL,
	[SuppProdId] [int] NULL,
	[Commission] [decimal](5, 2) NULL,
	[Company_Price_Id] [int] IDENTITY(0,1) NOT FOR REPLICATION NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Company_Price_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq_supp_price] UNIQUE NONCLUSTERED 
(
	[CompCUIT] ASC,
	[SuppProdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Tbl_Order]    Script Date: 9/27/2017 8:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Order]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tbl_Order](
	[OrderNo] [int] IDENTITY(0,1) NOT FOR REPLICATION NOT NULL,
	[Cust_Sub_Id] [int] NULL,
	[SuppProdId] [int] NULL,
	[Quantity] [int] NULL,
	[ORDERDate] [date] NULL,
	[DeliveryDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[VW_OrderDetails]    Script Date: 9/27/2017 8:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_OrderDetails]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[VW_OrderDetails]
AS
SELECT 
O.OrderNo,
S.CostPrice + (S.CostPrice*CP.Commission/100.00)  AS UnitPrice ,
(S.CostPrice + (S.CostPrice*CP.Commission/100.00))*O.Quantity AS SellPrice
FROM 
Tbl_Order O
LEFT JOIN Tbl_Supplier_Price AS S ON O.SuppProdId = S.SuppProdId 
AND O.ORDERDate >= S.StartDate AND O.ORDERDate <=S.EndDate AND S.SuppProdId = O.SuppProdId
LEFT JOIN Tbl_Cust_Sub CS ON CS.Cust_Sub_Id = O.Cust_Sub_Id
LEFT JOIN TBL_Subsidiary Sub ON Sub.SUIT = CS.SUIT 
LEFT JOIN Tbl_Company_Price CP ON CP.SuppProdId = S.SuppProdId AND CP.CompCUIT = Sub.CUIT

' 
GO
/****** Object:  Table [dbo].[Tbl_Product]    Script Date: 9/27/2017 8:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tbl_Product](
	[ProductCode] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Tbl_Supplier_Product]    Script Date: 9/27/2017 8:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Supplier_Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tbl_Supplier_Product](
	[SuppProdId] [int] IDENTITY(0,1) NOT FOR REPLICATION NOT NULL,
	[SuppCUIT] [varchar](36) NOT NULL,
	[ProductCode] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SuppProdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [unq_Supp_Prod] UNIQUE NONCLUSTERED 
(
	[SuppCUIT] ASC,
	[ProductCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[VW_Available_Product_List]    Script Date: 9/27/2017 8:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_Available_Product_List]'))
EXEC dbo.sp_executesql @statement = N'
 CREATE VIEW [dbo].[VW_Available_Product_List]
 AS 
 SELECT 
 CompCUIT,Comp.CompanyName ,CP.SuppProdId,
 SP.SuppCUIT,Supp.CompanyName AS Supplier,
 SP.ProductCode,Commission ,P.ProductName,
 Spr.CostPrice + (Spr.CostPrice*CP.Commission/100.00)  AS UnitPrice 
 FROM Tbl_Company_Price CP
 --JOIN Tbl_Subsidiary Sub ON Sub.CUIT = CP.CompCUIT
  JOIN Tbl_Supplier_Product SP ON SP.SuppProdId = CP.SuppProdId
  JOIN Tbl_Product P ON P.ProductCode = SP.ProductCode
  JOIN Tbl_Supplier_Price SPr ON SP.SuppProdId = Spr.SuppProdId
   AND GETDATE() >= startdate AND GETDATE()<=Enddate
 LEFT JOIN Tbl_Company Comp ON CP.CompCUIT =Comp.CUIT  AND Comp.IsSupplier = 0
 LEFT JOIN Tbl_Company Supp ON SP.SuppCUIT = Supp.CUIT AND Supp.IsSupplier = 1

 ' 
GO
/****** Object:  Table [dbo].[Tbl_Customer]    Script Date: 9/27/2017 8:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tbl_Customer](
	[DOCNo] [varchar](36) NOT NULL,
	[FName] [nvarchar](100) NOT NULL,
	[MName] [nvarchar](100) NOT NULL,
	[LName] [nvarchar](100) NOT NULL,
	[DOB] [date] NULL,
	[AddressLine1] [nvarchar](100) NULL,
	[AddressLine2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[St] [nvarchar](20) NULL,
	[Zip] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Landline] [nvarchar](20) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Fax] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[DOCNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tbl_Compa__CompC__3F6663D5]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tbl_Company_Price]'))
ALTER TABLE [dbo].[Tbl_Company_Price]  WITH CHECK ADD FOREIGN KEY([CompCUIT])
REFERENCES [dbo].[Tbl_Company] ([CUIT])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tbl_Compa__SuppP__405A880E]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tbl_Company_Price]'))
ALTER TABLE [dbo].[Tbl_Company_Price]  WITH CHECK ADD FOREIGN KEY([SuppProdId])
REFERENCES [dbo].[Tbl_Supplier_Product] ([SuppProdId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tbl_Cust___DOCNo__3C89F72A]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tbl_Cust_Sub]'))
ALTER TABLE [dbo].[Tbl_Cust_Sub]  WITH CHECK ADD FOREIGN KEY([DOCNo])
REFERENCES [dbo].[Tbl_Customer] ([DOCNo])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tbl_Cust_S__SUIT__3D7E1B63]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tbl_Cust_Sub]'))
ALTER TABLE [dbo].[Tbl_Cust_Sub]  WITH CHECK ADD FOREIGN KEY([SUIT])
REFERENCES [dbo].[Tbl_Subsidiary] ([SUIT])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tbl_Order__Cust___4EA8A765]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tbl_Order]'))
ALTER TABLE [dbo].[Tbl_Order]  WITH CHECK ADD FOREIGN KEY([Cust_Sub_Id])
REFERENCES [dbo].[Tbl_Cust_Sub] ([Cust_Sub_Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tbl_Order__SuppP__4F9CCB9E]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tbl_Order]'))
ALTER TABLE [dbo].[Tbl_Order]  WITH CHECK ADD FOREIGN KEY([SuppProdId])
REFERENCES [dbo].[Tbl_Supplier_Product] ([SuppProdId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tbl_Subsid__CUIT__08362A7C]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tbl_Subsidiary]'))
ALTER TABLE [dbo].[Tbl_Subsidiary]  WITH CHECK ADD FOREIGN KEY([CUIT])
REFERENCES [dbo].[Tbl_Company] ([CUIT])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tbl_Subsid__CUIT__38B96646]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tbl_Subsidiary]'))
ALTER TABLE [dbo].[Tbl_Subsidiary]  WITH CHECK ADD FOREIGN KEY([CUIT])
REFERENCES [dbo].[Tbl_Company] ([CUIT])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tbl_Suppl__SuppP__353DDB1D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tbl_Supplier_Price]'))
ALTER TABLE [dbo].[Tbl_Supplier_Price]  WITH CHECK ADD FOREIGN KEY([SuppProdId])
REFERENCES [dbo].[Tbl_Supplier_Product] ([SuppProdId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tbl_Suppl__Produ__35DCF99B]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tbl_Supplier_Product]'))
ALTER TABLE [dbo].[Tbl_Supplier_Product]  WITH CHECK ADD FOREIGN KEY([ProductCode])
REFERENCES [dbo].[Tbl_Product] ([ProductCode])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Tbl_Suppl__SuppC__34E8D562]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tbl_Supplier_Product]'))
ALTER TABLE [dbo].[Tbl_Supplier_Product]  WITH CHECK ADD FOREIGN KEY([SuppCUIT])
REFERENCES [dbo].[Tbl_Company] ([CUIT])
GO
