/*    Create SP
*/

USE [B2B_DB]
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertCompany]    Script Date: 9/27/2017 8:18:03 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_InsertCompany]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTotalQuantityPerCompany]    Script Date: 9/27/2017 8:18:03 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_GetTotalQuantityPerCompany]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTotalOrdersPerCustomer]    Script Date: 9/27/2017 8:18:03 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_GetTotalOrdersPerCustomer]
GO
/****** Object:  StoredProcedure [dbo].[USP_AddSubsidiary]    Script Date: 9/27/2017 8:18:03 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_AddSubsidiary]
GO
/****** Object:  StoredProcedure [dbo].[USP_AddSubsidiary]    Script Date: 9/27/2017 8:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_AddSubsidiary]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_AddSubsidiary] AS' 
END
GO


ALTER PROCEDURE [dbo].[USP_AddSubsidiary] ( 
@p_CUIT varchar(36),
@p_SUIT varchar(36),
@p_NickName NVARCHAR(200),
@p_AddressLine1 NVARCHAR(200) = NULL,
@p_AddressLine2 NVARCHAR(200) =NULL,
@p_City NVARCHAR(50) = NULL,
@p_St NVARCHAR(20) = NULL,
@p_Zip NVARCHAR(20) =NULL
)
AS
BEGIN

BEGIN TRY

DECLARE @p_IsSupplier BIT
SET @p_IsSupplier = NULL
SELECT @p_IsSupplier = IsSupplier FROM Tbl_Company WHERE  CUIT =@p_CUIT

IF (@p_IsSupplier = 1)
BEGIN

RAISERROR('Company is a supplier. Subdiary cannot be added for Supplier', -- Message text.
               16, -- Severity.
               1 -- State.
               );
 ROLLBACK;
			   
END

ELSE IF (@p_IsSupplier IS NULL)
BEGIN
RAISERROR('Company Does not exist . Please add the company first', -- Message text.
               16, -- Severity.
               1 -- State.
               );
 ROLLBACK;
 END

ELSE
BEGIN 
INSERT INTO TBL_Subsidiary
(SUIT,
CUIT,
NickName,
AddressLine1,
AddressLine2,
City,
St,
Zip)
VALUES
(
@p_SUIT,
@p_CUIT,
@p_NickName,
@p_AddressLine1,
@p_AddressLine2,
@p_City,
@p_St,
@p_Zip
)
END
END TRY
BEGIN CATCH
Print Error_Message()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTotalOrdersPerCustomer]    Script Date: 9/27/2017 8:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GetTotalOrdersPerCustomer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_GetTotalOrdersPerCustomer] AS' 
END
GO


ALTER PROCEDURE [dbo].[USP_GetTotalOrdersPerCustomer](@p_DocNo VARCHAR(36))
AS 

BEGIN
BEGIN TRY
DECLARE @p_Flag Bit
SET @p_Flag = 0
SELECT @p_Flag = 1 FROM Tbl_Customer Cust WHERE Cust.DOCNo =@p_DocNo
--Check if the CUIT is for Supplier
IF (@p_Flag =0)
RAISERROR('Customer does not exist.', -- Message text.
               16, -- Severity.
               1 -- State.
               );
--Check if the CUIT is for Company
ELSE IF (@p_Flag = 1)

SELECT Cust.DOCNo,Cust.FName + Cust.MName + Cust.LName  As [Name] ,
C.CUIT,C.CompanyName,Count(o.OrderNo) [No Of Orders],SUM(VW.SellPrice) AS [Total Cost]
FROM Tbl_Customer Cust
JOIN Tbl_Cust_Sub CS ON Cust.DOCNo = CS.DOCNo
JOIN Tbl_Subsidiary Sub ON Sub.SUIT = CS.SUIT
JOIN Tbl_Company C ON C.CUIT = Sub.CUIT AND C.IsSupplier = 0
JOIN Tbl_Order O ON o.Cust_Sub_Id = CS.Cust_Sub_Id
JOIN VW_OrderDetails VW ON VW.OrderNo = O.OrderNo
WHERE Cust.DOCNo =@p_DOCNo
GROUP BY Cust.DOCNo,Cust.FName + Cust.MName + Cust.LName  ,
C.CUIT,C.CompanyName
END TRY
BEGIN CATCH
Print Error_Message()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTotalQuantityPerCompany]    Script Date: 9/27/2017 8:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GetTotalQuantityPerCompany]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_GetTotalQuantityPerCompany] AS' 
END
GO


ALTER PROCEDURE [dbo].[USP_GetTotalQuantityPerCompany](@p_CUIT VARCHAR(36))
AS 

BEGIN
BEGIN TRY
DECLARE @p_isSupplier Bit

SELECT @p_isSupplier = isSupplier FROM Tbl_Company WHERE CUIT = @p_CUIT
--Check if the CUIT is for Supplier
IF (@p_isSupplier = 1)
RAISERROR('Company is a supplier.', -- Message text.
               16, -- Severity.
               1 -- State.
               );
--Check if the CUIT exists
ELSE IF (@p_isSupplier IS NULL)
RAISERROR('Company does not exist.', -- Message text.
               16, -- Severity.
               1 -- State.
               );
--Check if the CUIT is for Company
ELSE IF (@p_isSupplier = 0)
SELECT Sub.CUIT,
C.CompanyName,
CS.SUIT,
Sub.NickName,
DATEPART(YYYY,OrderDate) AS Year,
DATEName(MONTH,OrderDate)AS Month,
SUM(Quantity) AS Quantity
FROM Tbl_Order o
JOIN Tbl_Cust_Sub CS ON o.Cust_Sub_Id = CS.Cust_Sub_Id 
JOIN Tbl_Subsidiary Sub ON Sub.SUIT = CS.SUIT
JOIN Tbl_Company C ON C.CUIT = Sub.CUIT AND C.IsSupplier =  0
WHERE C.CUIT = @p_CUIT
GROUP BY Sub.CUIT,C.CompanyName,CS.SUIT,Sub.NickName,DATEPART(YYYY,OrderDate),DATEName(MONTH,OrderDate)
END TRY
BEGIN CATCH
Print Error_Message()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertCompany]    Script Date: 9/27/2017 8:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_InsertCompany]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_InsertCompany] AS' 
END
GO


ALTER PROCEDURE [dbo].[USP_InsertCompany] 
(
 @p_CUIT VARCHAR(36),
 @p_CompanyName NVARCHAR(50),
 @p_DateOfCommencement DATETIME,
 @p_Website nVarchar(100) =NULL,
 @p_email nVarchar(100) =NULL ,
 @p_IsSupplier Bit,
 @p_Landline NVARCHAR(20) =NULL,
 @p_Mobile NVARCHAR(20) =NULL,
 @p_Fax NVARCHAR(20) =NULL,
 
 @p_SUIT VARCHAR(36) = NULL,
 @p_NickName NVARCHAR(200) =NULL,
 @p_AddressLine1 NVARCHAR(200) = NULL,
 @p_AddressLine2 NVARCHAR(200) =NULL,
 @p_City NVARCHAR(50) = NULL,
 @p_St NVARCHAR(20) = NULL,
 @p_Zip NVARCHAR(20) =NULL
 )

AS

BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
				INSERT INTO Tbl_Company
				(
				CUIT ,
				CompanyName,
				DateOfCommencement,
				Website,
				email,
				IsSupplier,
				Landline ,
				Mobile ,
				Fax
				)
				VALUES
				(@p_cuit,
				@p_companyname,
				@p_dateofcommencement,
				@p_website,
				@p_email,
				@p_issupplier,
				@p_Landline ,
				@p_Mobile ,
				@p_Fax )

			    IF (@p_IsSupplier = 0)
					BEGIN
						DECLARE	@return_value int

						EXEC	@return_value = [dbo].[USP_AddSubsidiary]
								@p_CUIT = @p_CUIT,
								@p_SUIT = @p_SUIT,
								@p_NickName = @p_NickName,
								@p_AddressLine1 = @p_AddressLine1,
								@p_AddressLine2 =@p_AddressLine2,
								@p_City = @p_City,
								@p_St = @p_St,
								@p_Zip = @p_Zip
					   IF @return_value <> 0
							BEGIN
							RAISERROR('Error',16,1)
							ROLLBACK
							END
							ELSE IF @return_value = 0
							COMMIT
							END
					ELSE  IF (@p_IsSupplier = 1 AND @p_SUIT IS NOT NULL  )
					BEGIN
					RAISERROR('Company is a supplier. Subsidiary cannot be added for Supplier', -- Message text.
							   16, -- Severity.
							   1 -- State.
							   );
					 ROLLBACK;
					 END
					 ELSE  
					COMMIT
END TRY
BEGIN CATCH
PRINT 'Unsuccessful'
ROLLBACK
PRINT Error_message()
END CATCH
END
GO
