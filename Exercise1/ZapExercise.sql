USE [master]
GO
/****** Object:  Database [ZapExercise]    Script Date: 9/25/2024 12:43:47 AM ******/
CREATE DATABASE [ZapExercise]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Zapper', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Zapper.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Zapper_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Zapper_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ZapExercise] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ZapExercise].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ZapExercise] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ZapExercise] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ZapExercise] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ZapExercise] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ZapExercise] SET ARITHABORT OFF 
GO
ALTER DATABASE [ZapExercise] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ZapExercise] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ZapExercise] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ZapExercise] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ZapExercise] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ZapExercise] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ZapExercise] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ZapExercise] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ZapExercise] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ZapExercise] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ZapExercise] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ZapExercise] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ZapExercise] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ZapExercise] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ZapExercise] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ZapExercise] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ZapExercise] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ZapExercise] SET RECOVERY FULL 
GO
ALTER DATABASE [ZapExercise] SET  MULTI_USER 
GO
ALTER DATABASE [ZapExercise] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ZapExercise] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ZapExercise] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ZapExercise] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ZapExercise] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ZapExercise] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ZapExercise', N'ON'
GO
ALTER DATABASE [ZapExercise] SET QUERY_STORE = ON
GO
ALTER DATABASE [ZapExercise] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ZapExercise]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 9/25/2024 12:43:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Merchants]    Script Date: 9/25/2024 12:43:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Merchants](
	[MerchantID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Address] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Merchants] PRIMARY KEY CLUSTERED 
(
	[MerchantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 9/25/2024 12:43:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[PaymentMethodID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [nvarchar](50) NOT NULL,
	[ProviderName] [nvarchar](50) NULL,
	[AccountNumber] [nvarchar](50) NULL,
	[ExpirationDate] [date] NULL,
	[BillingAddress] [nvarchar](255) NULL,
	[IsDefault] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 9/25/2024 12:43:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[MerchantID] [int] NOT NULL,
	[PaymentMethodID] [int] NOT NULL,
	[TransactionAmount] [decimal](10, 2) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[TransactionStatus] [nvarchar](50) NOT NULL,
	[TransactionDescription] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[IsRefunded] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Merchants] ADD  CONSTRAINT [DF_Merchants_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PaymentMethods] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[PaymentMethods] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PaymentMethods] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (getdate()) FOR [TransactionDate]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT ((0)) FOR [IsRefunded]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Customers]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Merchants] FOREIGN KEY([MerchantID])
REFERENCES [dbo].[Merchants] ([MerchantID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Merchants]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_PaymentMethods] FOREIGN KEY([PaymentMethodID])
REFERENCES [dbo].[PaymentMethods] ([PaymentMethodID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_PaymentMethods]
GO
USE [master]
GO
ALTER DATABASE [ZapExercise] SET  READ_WRITE 
GO
