

USE [master]
GO
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'B2B_DB')

/****** Object:  Database [B2B_DB]    Script Date: 9/26/2017 10:23:22 AM ******/
DROP DATABASE [B2B_DB]
GO

/****** Object:  Database [B2B_DB]    Script Date: 9/26/2017 10:23:22 AM ******/
CREATE DATABASE [B2B_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'B2B_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\B2B_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'B2B_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\B2B_DB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [B2B_DB] SET COMPATIBILITY_LEVEL = 130
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [B2B_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [B2B_DB] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [B2B_DB] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [B2B_DB] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [B2B_DB] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [B2B_DB] SET ARITHABORT OFF 
GO

ALTER DATABASE [B2B_DB] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [B2B_DB] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [B2B_DB] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [B2B_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [B2B_DB] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [B2B_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [B2B_DB] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [B2B_DB] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [B2B_DB] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [B2B_DB] SET  DISABLE_BROKER 
GO

ALTER DATABASE [B2B_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [B2B_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [B2B_DB] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [B2B_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [B2B_DB] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [B2B_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [B2B_DB] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [B2B_DB] SET RECOVERY FULL 
GO

ALTER DATABASE [B2B_DB] SET  MULTI_USER 
GO

ALTER DATABASE [B2B_DB] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [B2B_DB] SET DB_CHAINING OFF 
GO

ALTER DATABASE [B2B_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [B2B_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [B2B_DB] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [B2B_DB] SET QUERY_STORE = OFF
GO

USE [B2B_DB]
GO

ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO

ALTER DATABASE [B2B_DB] SET  READ_WRITE 
GO

