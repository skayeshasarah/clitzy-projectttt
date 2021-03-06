USE [master]
GO
/****** Object:  Database [vishnuworld]    Script Date: 3/30/2020 6:08:32 PM ******/
CREATE DATABASE [vishnuworld]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vishnuworld', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.VISHNU920\MSSQL\DATA\vishnuworld.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'vishnuworld_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.VISHNU920\MSSQL\DATA\vishnuworld_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [vishnuworld] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vishnuworld].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vishnuworld] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vishnuworld] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vishnuworld] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vishnuworld] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vishnuworld] SET ARITHABORT OFF 
GO
ALTER DATABASE [vishnuworld] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [vishnuworld] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vishnuworld] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vishnuworld] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vishnuworld] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vishnuworld] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vishnuworld] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vishnuworld] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vishnuworld] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vishnuworld] SET  ENABLE_BROKER 
GO
ALTER DATABASE [vishnuworld] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vishnuworld] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vishnuworld] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vishnuworld] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vishnuworld] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vishnuworld] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vishnuworld] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vishnuworld] SET RECOVERY FULL 
GO
ALTER DATABASE [vishnuworld] SET  MULTI_USER 
GO
ALTER DATABASE [vishnuworld] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vishnuworld] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vishnuworld] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vishnuworld] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [vishnuworld] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'vishnuworld', N'ON'
GO
ALTER DATABASE [vishnuworld] SET QUERY_STORE = OFF
GO
USE [vishnuworld]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/30/2020 6:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](250) NULL,
	[Password] [varchar](250) NULL,
	[FullName] [varchar](250) NULL,
	[Address] [varchar](250) NULL,
	[Email] [varchar](250) NULL,
	[Phone] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/30/2020 6:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Status] [bit] NOT NULL,
	[ParentId] [int] NULL,
	[VendorId] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberShip]    Script Date: 3/30/2020 6:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberShip](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Description] [ntext] NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Month] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_MemberShip] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberShipVendor]    Script Date: 3/30/2020 6:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberShipVendor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemerShipId] [int] NOT NULL,
	[VendorId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_MemberShipVendor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 3/30/2020 6:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](250) NULL,
	[Body] [ntext] NULL,
	[DateCreation] [date] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[VendorId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/30/2020 6:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[DateCreation] [date] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[VendorId] [int] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[PaymentId] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetail]    Script Date: 3/30/2020 6:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrdersDetail] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 3/30/2020 6:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Page]    Script Date: 3/30/2020 6:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Plug] [varchar](250) NULL,
	[Title] [varchar](250) NULL,
	[Detail] [ntext] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 3/30/2020 6:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photo]    Script Date: 3/30/2020 6:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Status] [bit] NOT NULL,
	[Main] [bit] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/30/2020 6:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [ntext] NULL,
	[Status] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[VendorId] [int] NOT NULL,
	[Views] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 3/30/2020 6:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[VendorId] [int] NOT NULL,
	[Detail] [ntext] NULL,
	[DatePost] [date] NOT NULL,
 CONSTRAINT [PK_RatingReview] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 3/30/2020 6:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [varchar](250) NULL,
	[Value] [ntext] NULL,
	[Group] [varchar](250) NULL,
	[TypeOfControl] [varchar](50) NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 3/30/2020 6:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](250) NULL,
	[Password] [varchar](250) NULL,
	[Name] [varchar](250) NULL,
	[Address] [varchar](250) NULL,
	[Email] [varchar](250) NULL,
	[Phone] [varchar](50) NULL,
	[Logo] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Username], [Password], [FullName], [Address], [Email], [Phone], [Status], [IsAdmin]) VALUES (1, N'admin', N'$2a$10$xwTGPfJgX3/VOEyngaL4me5LaCqLr8esBTV1GMkWovuKc50R64e4a', N'Administrator', N'Address 1', N'admin@gmail.com', N'123456999', 1, 1)
INSERT [dbo].[Account] ([Id], [Username], [Password], [FullName], [Address], [Email], [Phone], [Status], [IsAdmin]) VALUES (3, N'customer1', N'$2a$10$xwTGPfJgX3/VOEyngaL4me5LaCqLr8esBTV1GMkWovuKc50R64e4a', N'Customer 1111', N'Address 2', N'customer1@gmail.com', N'123456', 1, 0)
INSERT [dbo].[Account] ([Id], [Username], [Password], [FullName], [Address], [Email], [Phone], [Status], [IsAdmin]) VALUES (4, N'customer2', N'$2a$10$xwTGPfJgX3/VOEyngaL4me5LaCqLr8esBTV1GMkWovuKc50R64e4a', N'Customer 2', N'Address 3', N'customer2@gmail.com', N'123456', 1, 0)
INSERT [dbo].[Account] ([Id], [Username], [Password], [FullName], [Address], [Email], [Phone], [Status], [IsAdmin]) VALUES (5, N'customer3', N'$2a$10$S3.LKgOmCH40sEJj54i8b.JYrt54LcMINCBCCIn1lNhY1zqBHWcUq', N'AAA', N'bbb', N'a@aaaa.com', N'123', 1, 0)
INSERT [dbo].[Account] ([Id], [Username], [Password], [FullName], [Address], [Email], [Phone], [Status], [IsAdmin]) VALUES (7, N'customer10', N'$2a$10$xwTGPfJgX3/VOEyngaL4me5LaCqLr8esBTV1GMkWovuKc50R64e4a', N'Customer 1011', N'Address 10', N'customer11110@gmail.com', N'1231111', 1, 0)
INSERT [dbo].[Account] ([Id], [Username], [Password], [FullName], [Address], [Email], [Phone], [Status], [IsAdmin]) VALUES (8, N'customerA', N'$2a$10$/q1Zer.CUssbXPCMZVQ6cOdG0fyg0dp1UrqwjVenKjMi78i/LXp2u', N'Customer A', N'address 3', N'customerA@gmail.com', N'123', 1, 0)
INSERT [dbo].[Account] ([Id], [Username], [Password], [FullName], [Address], [Email], [Phone], [Status], [IsAdmin]) VALUES (9, N'customer920', N'$2a$10$zX7i5KpEEe345nkh3H83LuM18IFOF85ab1qk1j6upV.OBl7yVTGH6', N'customer920920', N'america', N'customer@gmail.com', N'298980983', 1, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId], [VendorId]) VALUES (39, N'Men', 1, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId], [VendorId]) VALUES (40, N'Shirts', 1, 39, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId], [VendorId]) VALUES (42, N'Women', 1, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId], [VendorId]) VALUES (44, N'Ghagras', 1, 42, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId], [VendorId]) VALUES (45, N'Punjabi', 1, 42, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId], [VendorId]) VALUES (46, N'Kids', 1, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId], [VendorId]) VALUES (47, N'Spectacles', 1, 46, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId], [VendorId]) VALUES (49, N'Shorts', 1, 46, 15)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId], [VendorId]) VALUES (52, N'Banians', 1, 46, 16)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId], [VendorId]) VALUES (54, N'Trousers', 1, 42, 18)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId], [VendorId]) VALUES (56, N'Hats', 1, 39, 18)
INSERT [dbo].[Category] ([Id], [Name], [Status], [ParentId], [VendorId]) VALUES (57, N'Sneakers', 1, 46, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[MemberShip] ON 

INSERT [dbo].[MemberShip] ([Id], [Name], [Description], [Price], [Month], [Status]) VALUES (5, N'Trial Package', N'<ul class="list-group">
<li class="list-group-item"><strong>10</strong> User</li>
<li class="list-group-item"><strong>500</strong> Projects</li>
<li class="list-group-item"><strong>Unlimited</strong> Email Accounts</li>
<li class="list-group-item"><strong>1000GB</strong> Disk Space</li>
<li class="list-group-item"><strong>10000GB</strong> Monthly Bandwidth</li>
</ul>', CAST(150.00 AS Decimal(18, 2)), 2, 1)
INSERT [dbo].[MemberShip] ([Id], [Name], [Description], [Price], [Month], [Status]) VALUES (6, N'Package 1', N'<ul class="list-group">
<li class="list-group-item"><strong>10</strong> User</li>
<li class="list-group-item"><strong>500</strong> Projects</li>
<li class="list-group-item"><strong>Unlimited</strong> Email Accounts</li>
<li class="list-group-item"><strong>1000GB</strong> Disk Space</li>
<li class="list-group-item"><strong>10000GB</strong> Monthly Bandwidth</li>
</ul>', CAST(200.00 AS Decimal(18, 2)), 3, 1)
INSERT [dbo].[MemberShip] ([Id], [Name], [Description], [Price], [Month], [Status]) VALUES (14, N'Package 2', N'<ul class="list-group">
<li class="list-group-item"><strong>10</strong> User</li>
<li class="list-group-item"><strong>500</strong> Projects</li>
<li class="list-group-item"><strong>Unlimited</strong> Email Accounts</li>
<li class="list-group-item"><strong>1000GB</strong> Disk Space</li>
<li class="list-group-item"><strong>10000GB</strong> Monthly Bandwidth</li>
</ul>', CAST(200.00 AS Decimal(18, 2)), 5, 1)
INSERT [dbo].[MemberShip] ([Id], [Name], [Description], [Price], [Month], [Status]) VALUES (19, N'Package 3', N'<ul class="list-group">
<li class="list-group-item"><strong>10</strong> User</li>
<li class="list-group-item"><strong>500</strong> Projects</li>
<li class="list-group-item"><strong>Unlimited</strong> Email Accounts</li>
<li class="list-group-item"><strong>1000GB</strong> Disk Space</li>
<li class="list-group-item"><strong>10000GB</strong> Monthly Bandwidth</li>
</ul>', CAST(2.00 AS Decimal(18, 2)), 3, 1)
SET IDENTITY_INSERT [dbo].[MemberShip] OFF
SET IDENTITY_INSERT [dbo].[MemberShipVendor] ON 

INSERT [dbo].[MemberShipVendor] ([Id], [MemerShipId], [VendorId], [StartDate], [EndDate], [Price]) VALUES (14, 5, 15, CAST(N'2017-09-12' AS Date), CAST(N'2017-11-12' AS Date), CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[MemberShipVendor] ([Id], [MemerShipId], [VendorId], [StartDate], [EndDate], [Price]) VALUES (15, 5, 16, CAST(N'2017-09-12' AS Date), CAST(N'2017-11-12' AS Date), CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[MemberShipVendor] ([Id], [MemerShipId], [VendorId], [StartDate], [EndDate], [Price]) VALUES (16, 6, 15, CAST(N'2017-09-12' AS Date), CAST(N'2017-12-12' AS Date), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[MemberShipVendor] ([Id], [MemerShipId], [VendorId], [StartDate], [EndDate], [Price]) VALUES (17, 5, 17, CAST(N'2017-09-12' AS Date), CAST(N'2017-11-12' AS Date), CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[MemberShipVendor] ([Id], [MemerShipId], [VendorId], [StartDate], [EndDate], [Price]) VALUES (18, 5, 18, CAST(N'2020-03-26' AS Date), CAST(N'2020-05-26' AS Date), CAST(150.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[MemberShipVendor] OFF
SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([Id], [Title], [Body], [DateCreation], [CustomerId], [VendorId], [Status]) VALUES (1002, N'Hello Vendor 2', N'How are you?', CAST(N'2017-09-12' AS Date), 8, 16, 0)
INSERT [dbo].[Message] ([Id], [Title], [Body], [DateCreation], [CustomerId], [VendorId], [Status]) VALUES (1003, N'Hi Vendor 1', N'Nice to meet you', CAST(N'2017-09-12' AS Date), 8, 15, 0)
INSERT [dbo].[Message] ([Id], [Title], [Body], [DateCreation], [CustomerId], [VendorId], [Status]) VALUES (1004, N'HI', N'Hello', CAST(N'2020-03-26' AS Date), 3, 18, 0)
SET IDENTITY_INSERT [dbo].[Message] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Name], [DateCreation], [CustomerId], [VendorId], [OrderStatusId], [PaymentId]) VALUES (1008, N'New Order for Vendor Vendor 2', CAST(N'2017-09-12' AS Date), 8, 16, 4, 2)
INSERT [dbo].[Orders] ([Id], [Name], [DateCreation], [CustomerId], [VendorId], [OrderStatusId], [PaymentId]) VALUES (1009, N'New Order for Vendor Vendor 1', CAST(N'2017-09-12' AS Date), 8, 15, 4, 1)
INSERT [dbo].[Orders] ([Id], [Name], [DateCreation], [CustomerId], [VendorId], [OrderStatusId], [PaymentId]) VALUES (1010, N'New Order for Vendor Vendor 2', CAST(N'2017-09-12' AS Date), 8, 16, 1, NULL)
INSERT [dbo].[Orders] ([Id], [Name], [DateCreation], [CustomerId], [VendorId], [OrderStatusId], [PaymentId]) VALUES (1011, N'New Order for Vendor vishnu', CAST(N'2020-03-27' AS Date), 3, 18, 1, NULL)
INSERT [dbo].[Orders] ([Id], [Name], [DateCreation], [CustomerId], [VendorId], [OrderStatusId], [PaymentId]) VALUES (1012, N'New Order for Stylist vishnu', CAST(N'2020-03-29' AS Date), 3, 18, 1, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[OrdersDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (1008, 36, CAST(14.00 AS Decimal(18, 2)), 7)
INSERT [dbo].[OrdersDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (1008, 37, CAST(23.00 AS Decimal(18, 2)), 6)
INSERT [dbo].[OrdersDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (1009, 35, CAST(12.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[OrdersDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (1010, 36, CAST(14.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[OrdersDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (1011, 42, CAST(800.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[OrdersDetail] ([OrderId], [ProductId], [Price], [Quantity]) VALUES (1012, 44, CAST(400.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([Id], [Name], [Status]) VALUES (1, N'New', 1)
INSERT [dbo].[OrderStatus] ([Id], [Name], [Status]) VALUES (4, N'Complete', 1)
INSERT [dbo].[OrderStatus] ([Id], [Name], [Status]) VALUES (6, N'Canceled', 1)
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
SET IDENTITY_INSERT [dbo].[Page] ON 

INSERT [dbo].[Page] ([Id], [Plug], [Title], [Detail], [Status]) VALUES (1, N'about-us', N'About Us', N'<h5>Team Clitzy''s work please donot copy</h5>
<p></p>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin. Sed at nunc ac neque semper fermentum. Proin diam sem, semper fermentum eleifend nec, viverra ac est. Sed ultricies, lectus et vehicula imperdiet, felis tortor vehicula turpis, non fermentum enim est et sapien. Nam justo mi, dignissim a euismod ut, pretium sed leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In viverra porta est, consequat elementum metus tristique a. Mauris tempus tellus a metus dapibus faucibus egestas lectus consectetur. Integer libero dolor, luctus non congue vitae, tempus ut neque. Nunc eleifend lorem quis diam pharetra sagittis. Aliquam ut dolor dui. Fusce dictum facilisis ipsum eu porttitor. In ultricies rhoncus tortor vitae tincidunt.</p>
<h5>Lorem ipsum dolor sit amet</h5>
<p></p>
<p>Nullam a vulputate leo. Nulla tristique metus eros. Curabitur ultrices commodo mauris, sit amet faucibus lectus fermentum in. Nulla eleifend, augue hendrerit tempus faucibus, diam lacus aliquet urna, eget facilisis turpis risus quis arcu. Cras placerat suscipit sem, ac consequat dui iaculis eu. Cras elit enim, adipiscing lobortis rutrum ac, vehicula nec massa. Praesent pharetra ligula ac erat venenatis feugiat. Quisque id nulla mi. Mauris at orci nec nisi eleifend auctor. Mauris placerat consectetur tincidunt. Nam eu tellus vitae dolor vestibulum commodo. Etiam tristique, urna ac convallis laoreet, enim enim aliquet neque, id cursus risus nulla sed ligula. Nunc quam libero, accumsan vitae consequat at, sollicitudin eget mi. Phasellus in molestie diam. Aliquam enim purus, tempor id sodales non, volutpat eu diam. Donec eu nisl lacinia leo semper lobortis sed sit amet elit.</p>
<h5>Lorem ipsum dolor sit amet</h5>
<p></p>
<p>Aliquam interdum, ipsum a posuere dictum, tellus risus blandit dolor, at tristique sapien urna vel purus. Pellentesque in dictum urna. Sed feugiat libero sit amet arcu malesuada eu convallis dui convallis. Donec facilisis massa a ipsum aliquam lobortis. Praesent ac lectus sed leo aliquam egestas. Sed ante neque, volutpat ac tempor et, bibendum at ligula. Nunc porta vestibulum sodales.</p>
<h5>Lorem ipsum dolor sit amet</h5>
<p></p>
<p>Nullam a vulputate leo. Nulla tristique metus eros. Curabitur ultrices commodo mauris, sit amet faucibus lectus fermentum in. Nulla eleifend, augue hendrerit tempus faucibus, diam lacus aliquet urna, eget facilisis turpis risus quis arcu. Cras placerat suscipit sem, ac consequat dui iaculis eu. Cras elit enim, adipiscing lobortis rutrum ac, vehicula nec massa. Praesent pharetra ligula ac erat venenatis feugiat. Quisque id nulla mi. Mauris at orci nec nisi eleifend auctor. Mauris placerat consectetur tincidunt. Nam eu tellus vitae dolor vestibulum commodo. Etiam tristique, urna ac convallis laoreet, enim enim aliquet neque, id cursus risus nulla sed ligula. Nunc quam libero, accumsan vitae consequat at, sollicitudin eget mi. Phasellus in molestie diam. Aliquam enim purus, tempor id sodales non, volutpat eu diam. Donec eu nisl lacinia leo semper lobortis sed sit amet elit.</p>
<h5>Lorem ipsum dolor sit amet</h5>
<p></p>
<p>Aliquam interdum, ipsum a posuere dictum, tellus risus blandit dolor, at tristique sapien urna vel purus. Pellentesque in dictum urna. Sed feugiat libero sit amet arcu malesuada eu convallis dui convallis. Donec facilisis massa a ipsum aliquam lobortis. Praesent ac lectus sed leo aliquam egestas. Sed ante neque, volutpat ac tempor et, bibendum at ligula. Nunc porta vestibulum sodales.</p>
<h5>Lorem ipsum dolor sit amet</h5>
<p></p>
<p>Nullam a vulputate leo. Nulla tristique metus eros. Curabitur ultrices commodo mauris, sit amet faucibus lectus fermentum in. Nulla eleifend, augue hendrerit tempus faucibus, diam lacus aliquet urna, eget facilisis turpis risus quis arcu. Cras placerat suscipit sem, ac consequat dui iaculis eu. Cras elit enim, adipiscing lobortis rutrum ac, vehicula nec massa. Praesent pharetra ligula ac erat venenatis feugiat. Quisque id nulla mi. Mauris at orci nec nisi eleifend auctor. Mauris placerat consectetur tincidunt. Nam eu tellus vitae dolor vestibulum commodo. Etiam tristique, urna ac convallis laoreet, enim enim aliquet neque, id cursus risus nulla sed ligula. Nunc quam libero, accumsan vitae consequat at, sollicitudin eget mi. Phasellus in molestie diam. Aliquam enim purus, tempor id sodales non, volutpat eu diam. Donec eu nisl lacinia leo semper lobortis sed sit amet elit.</p>
<h5>Lorem ipsum dolor sit amet</h5>
<p></p>
<p>Aliquam interdum, ipsum a posuere dictum, tellus risus blandit dolor, at tristique sapien urna vel purus. Pellentesque in dictum urna. Sed feugiat libero sit amet arcu malesuada eu convallis dui convallis. Donec facilisis massa a ipsum aliquam lobortis. Praesent ac lectus sed leo aliquam egestas. Sed ante neque, volutpat ac tempor et, bibendum at ligula. Nunc porta vestibulum sodales.</p>', 0)
INSERT [dbo].[Page] ([Id], [Plug], [Title], [Detail], [Status]) VALUES (3, N'legal-notice', N'LEGAL NOTICE', N'<h5></h5>
<p>Have a nice day</p>
<p>(Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin. Sed at nunc ac neque semper fermentum. Proin diam sem, semper fermentum eleifend nec, viverra ac est. Sed ultricies, lectus et vehicula imperdiet, felis tortor vehicula turpis, non fermentum enim est et sapien. Nam justo mi, dignissim a euismod ut, pretium sed leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In viverra porta est, consequat elementum metus tristique a. Mauris tempus tellus a metus dapibus faucibus egestas lectus consectetur. Integer libero dolor, luctus non congue vitae, tempus ut neque. Nunc eleifend lorem quis diam pharetra sagittis. Aliquam ut dolor dui. Fusce dictum facilisis ipsum eu porttitor. In ultricies rhoncus tortor vitae tincidunt.) Vintage Windows Quote</p>
<h5>Lorem ipsum dolor sit amet</h5>
<p></p>
<p>Nullam a vulputate leo. Nulla tristique metus eros. Curabitur ultrices commodo mauris, sit amet faucibus lectus fermentum in. Nulla eleifend, augue hendrerit tempus faucibus, diam lacus aliquet urna, eget facilisis turpis risus quis arcu. Cras placerat suscipit sem, ac consequat dui iaculis eu. Cras elit enim, adipiscing lobortis rutrum ac, vehicula nec massa. Praesent pharetra ligula ac erat venenatis feugiat. Quisque id nulla mi. Mauris at orci nec nisi eleifend auctor. Mauris placerat consectetur tincidunt. Nam eu tellus vitae dolor vestibulum commodo. Etiam tristique, urna ac convallis laoreet, enim enim aliquet neque, id cursus risus nulla sed ligula. Nunc quam libero, accumsan vitae consequat at, sollicitudin eget mi. Phasellus in molestie diam. Aliquam enim purus, tempor id sodales non, volutpat eu diam. Donec eu nisl lacinia leo semper lobortis sed sit amet elit.</p>
<h5>Lorem ipsum dolor sit amet</h5>
<p></p>
<p>Aliquam interdum, ipsum a posuere dictum, tellus risus blandit dolor, at tristique sapien urna vel purus. Pellentesque in dictum urna. Sed feugiat libero sit amet arcu malesuada eu convallis dui convallis. Donec facilisis massa a ipsum aliquam lobortis. Praesent ac lectus sed leo aliquam egestas. Sed ante neque, volutpat ac tempor et, bibendum at ligula. Nunc porta vestibulum sodales.</p>
<h5>Lorem ipsum dolor sit amet</h5>
<p></p>
<p>Nullam a vulputate leo. Nulla tristique metus eros. Curabitur ultrices commodo mauris, sit amet faucibus lectus fermentum in. Nulla eleifend, augue hendrerit tempus faucibus, diam lacus aliquet urna, eget facilisis turpis risus quis arcu. Cras placerat suscipit sem, ac consequat dui iaculis eu. Cras elit enim, adipiscing lobortis rutrum ac, vehicula nec massa. Praesent pharetra ligula ac erat venenatis feugiat. Quisque id nulla mi. Mauris at orci nec nisi eleifend auctor. Mauris placerat consectetur tincidunt. Nam eu tellus vitae dolor vestibulum commodo. Etiam tristique, urna ac convallis laoreet, enim enim aliquet neque, id cursus risus nulla sed ligula. Nunc quam libero, accumsan vitae consequat at, sollicitudin eget mi. Phasellus in molestie diam. Aliquam enim purus, tempor id sodales non, volutpat eu diam. Donec eu nisl lacinia leo semper lobortis sed sit amet elit.</p>
<h5>Lorem ipsum dolor sit amet</h5>
<p></p>
<p>Aliquam interdum, ipsum a posuere dictum, tellus risus blandit dolor, at tristique sapien urna vel purus. Pellentesque in dictum urna. Sed feugiat libero sit amet arcu malesuada eu convallis dui convallis. Donec facilisis massa a ipsum aliquam lobortis. Praesent ac lectus sed leo aliquam egestas. Sed ante neque, volutpat ac tempor et, bibendum at ligula. Nunc porta vestibulum sodales.</p>
<h5>Lorem ipsum dolor sit amet</h5>
<p></p>
<p>Nullam a vulputate leo. Nulla tristique metus eros. Curabitur ultrices commodo mauris, sit amet faucibus lectus fermentum in. Nulla eleifend, augue hendrerit tempus faucibus, diam lacus aliquet urna, eget facilisis turpis risus quis arcu. Cras placerat suscipit sem, ac consequat dui iaculis eu. Cras elit enim, adipiscing lobortis rutrum ac, vehicula nec massa. Praesent pharetra ligula ac erat venenatis feugiat. Quisque id nulla mi. Mauris at orci nec nisi eleifend auctor. Mauris placerat consectetur tincidunt. Nam eu tellus vitae dolor vestibulum commodo. Etiam tristique, urna ac convallis laoreet, enim enim aliquet neque, id cursus risus nulla sed ligula. Nunc quam libero, accumsan vitae consequat at, sollicitudin eget mi. Phasellus in molestie diam. Aliquam enim purus, tempor id sodales non, volutpat eu diam. Donec eu nisl lacinia leo semper lobortis sed sit amet elit.</p>
<h5>Lorem ipsum dolor sit amet</h5>
<p></p>
<p>Aliquam interdum, ipsum a posuere dictum, tellus risus blandit dolor, at tristique sapien urna vel purus. Pellentesque in dictum urna. Sed feugiat libero sit amet arcu malesuada eu convallis dui convallis. Donec facilisis massa a ipsum aliquam lobortis. Praesent ac lectus sed leo aliquam egestas. Sed ante neque, volutpat ac tempor et, bibendum at ligula. Nunc porta vestibulum sodales.</p>', 1)
INSERT [dbo].[Page] ([Id], [Plug], [Title], [Detail], [Status]) VALUES (4, N'tac', N'TERMS AND CONDITIONS', N'	<h5>Lorem ipsum dolor sit amet</h5><br>
	<p>
	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin. Sed at nunc ac neque semper fermentum. Proin diam sem, semper fermentum eleifend nec, viverra ac est. Sed ultricies, lectus et vehicula imperdiet, felis tortor vehicula turpis, non fermentum enim est et sapien. Nam justo mi, dignissim a euismod ut, pretium sed leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In viverra porta est, consequat elementum metus tristique a. Mauris tempus tellus a metus dapibus faucibus egestas lectus consectetur. Integer libero dolor, luctus non congue vitae, tempus ut neque. Nunc eleifend lorem quis diam pharetra sagittis. Aliquam ut dolor dui. Fusce dictum facilisis ipsum eu porttitor. In ultricies rhoncus tortor vitae tincidunt.
</p>
<h5>Lorem ipsum dolor sit amet</h5><br>
<p>
Nullam a vulputate leo. Nulla tristique metus eros. Curabitur ultrices commodo mauris, sit amet faucibus lectus fermentum in. Nulla eleifend, augue hendrerit tempus faucibus, diam lacus aliquet urna, eget facilisis turpis risus quis arcu. Cras placerat suscipit sem, ac consequat dui iaculis eu. Cras elit enim, adipiscing lobortis rutrum ac, vehicula nec massa. Praesent pharetra ligula ac erat venenatis feugiat. Quisque id nulla mi. Mauris at orci nec nisi eleifend auctor. Mauris placerat consectetur tincidunt. Nam eu tellus vitae dolor vestibulum commodo. Etiam tristique, urna ac convallis laoreet, enim enim aliquet neque, id cursus risus nulla sed ligula. Nunc quam libero, accumsan vitae consequat at, sollicitudin eget mi. Phasellus in molestie diam. Aliquam enim purus, tempor id sodales non, volutpat eu diam. Donec eu nisl lacinia leo semper lobortis sed sit amet elit.
</p>
<h5>Lorem ipsum dolor sit amet</h5><br>
<p>
Aliquam interdum, ipsum a posuere dictum, tellus risus blandit dolor, at tristique sapien urna vel purus. Pellentesque in dictum urna. Sed feugiat libero sit amet arcu malesuada eu convallis dui convallis. Donec facilisis massa a ipsum aliquam lobortis. Praesent ac lectus sed leo aliquam egestas. Sed ante neque, volutpat ac tempor et, bibendum at ligula. Nunc porta vestibulum sodales.
	</p>
	<h5>Lorem ipsum dolor sit amet</h5><br>
<p>
Nullam a vulputate leo. Nulla tristique metus eros. Curabitur ultrices commodo mauris, sit amet faucibus lectus fermentum in. Nulla eleifend, augue hendrerit tempus faucibus, diam lacus aliquet urna, eget facilisis turpis risus quis arcu. Cras placerat suscipit sem, ac consequat dui iaculis eu. Cras elit enim, adipiscing lobortis rutrum ac, vehicula nec massa. Praesent pharetra ligula ac erat venenatis feugiat. Quisque id nulla mi. Mauris at orci nec nisi eleifend auctor. Mauris placerat consectetur tincidunt. Nam eu tellus vitae dolor vestibulum commodo. Etiam tristique, urna ac convallis laoreet, enim enim aliquet neque, id cursus risus nulla sed ligula. Nunc quam libero, accumsan vitae consequat at, sollicitudin eget mi. Phasellus in molestie diam. Aliquam enim purus, tempor id sodales non, volutpat eu diam. Donec eu nisl lacinia leo semper lobortis sed sit amet elit.
</p>
<h5>Lorem ipsum dolor sit amet</h5><br>
<p>
Aliquam interdum, ipsum a posuere dictum, tellus risus blandit dolor, at tristique sapien urna vel purus. Pellentesque in dictum urna. Sed feugiat libero sit amet arcu malesuada eu convallis dui convallis. Donec facilisis massa a ipsum aliquam lobortis. Praesent ac lectus sed leo aliquam egestas. Sed ante neque, volutpat ac tempor et, bibendum at ligula. Nunc porta vestibulum sodales.
	</p>
	<h5>Lorem ipsum dolor sit amet</h5><br>
<p>
Nullam a vulputate leo. Nulla tristique metus eros. Curabitur ultrices commodo mauris, sit amet faucibus lectus fermentum in. Nulla eleifend, augue hendrerit tempus faucibus, diam lacus aliquet urna, eget facilisis turpis risus quis arcu. Cras placerat suscipit sem, ac consequat dui iaculis eu. Cras elit enim, adipiscing lobortis rutrum ac, vehicula nec massa. Praesent pharetra ligula ac erat venenatis feugiat. Quisque id nulla mi. Mauris at orci nec nisi eleifend auctor. Mauris placerat consectetur tincidunt. Nam eu tellus vitae dolor vestibulum commodo. Etiam tristique, urna ac convallis laoreet, enim enim aliquet neque, id cursus risus nulla sed ligula. Nunc quam libero, accumsan vitae consequat at, sollicitudin eget mi. Phasellus in molestie diam. Aliquam enim purus, tempor id sodales non, volutpat eu diam. Donec eu nisl lacinia leo semper lobortis sed sit amet elit.
</p>
<h5>Lorem ipsum dolor sit amet</h5><br>
<p>
Aliquam interdum, ipsum a posuere dictum, tellus risus blandit dolor, at tristique sapien urna vel purus. Pellentesque in dictum urna. Sed feugiat libero sit amet arcu malesuada eu convallis dui convallis. Donec facilisis massa a ipsum aliquam lobortis. Praesent ac lectus sed leo aliquam egestas. Sed ante neque, volutpat ac tempor et, bibendum at ligula. Nunc porta vestibulum sodales.
	</p>
', 1)
INSERT [dbo].[Page] ([Id], [Plug], [Title], [Detail], [Status]) VALUES (5, N'faq', N'FAQ', N'<div class="accordion" id="accordion2">
	<div class="accordion-group">
	  <div class="accordion-heading">
		<h4><a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
		  Collapsible Group Item #1
		</a></h4>
	  </div>
	  <div id="collapseOne" class="accordion-body collapse" style="height: 0px;">
		<div class="accordion-inner">
			Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven''t heard of them accusamus labore sustainable VHS.
			<br><br>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin. Sed at nunc ac neque semper fermentum. Proin diam sem, semper fermentum eleifend nec, viverra ac est. Sed ultricies, lectus et vehicula imperdiet, felis tortor vehicula turpis, non fermentum enim est et sapien. Nam justo mi, dignissim a euismod ut, pretium sed leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In viverra porta est, consequat elementum metus tristique a. Mauris tempus tellus a metus dapibus faucibus egestas lectus consectetur. Integer libero dolor, luctus non congue vitae, tempus ut neque. Nunc eleifend lorem quis diam pharetra sagittis. Aliquam ut dolor dui. Fusce dictum facilisis ipsum eu porttitor. In ultricies rhoncus tortor vitae tincidunt.
			<br><br>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam elementum varius dapibus. Sed hendrerit porta felis at sollicitudin. Sed at nunc ac neque semper fermentum. Proin diam sem, semper fermentum eleifend nec, viverra ac est. Sed ultricies, lectus et vehicula imperdiet, felis tortor vehicula turpis, non fermentum enim est et sapien. Nam justo mi, dignissim a euismod ut, pretium sed leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In viverra porta est, consequat elementum metus tristique a. Mauris tempus tellus a metus dapibus faucibus egestas lectus consectetur. Integer libero dolor, luctus non congue vitae, tempus ut neque. Nunc eleifend lorem quis diam pharetra sagittis. Aliquam ut dolor dui. Fusce dictum facilisis ipsum eu porttitor. In ultricies rhoncus tortor vitae tincidunt.

		</div>
	  </div>
	</div>
	<div class="accordion-group">
	  <div class="accordion-heading">
		<h4><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
		  Collapsible Group Item #2
		</a></h4>
	  </div>
	  <div id="collapseTwo" class="accordion-body collapse">
		<div class="accordion-inner">
		  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven''t heard of them accusamus labore sustainable VHS.
		</div>
	  </div>
	</div>
	<div class="accordion-group">
	  <div class="accordion-heading">
		<h4><a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
		  Collapsible Group Item #3
		</a></h4>
	  </div>
	  <div id="collapseThree" class="accordion-body collapse">
		<div class="accordion-inner">
		  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven''t heard of them accusamus labore sustainable VHS.
		</div>
	  </div>
	</div>
	
	<div class="accordion-group">
	  <div class="accordion-heading">
		<h4><a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour">
		  Collapsible Group Item #4
		</a></h4>
	  </div>
	  <div id="collapseFour" class="accordion-body collapse">
		<div class="accordion-inner">
		  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven''t heard of them accusamus labore sustainable VHS.
		</div>
	  </div>
	</div>
	
	<div class="accordion-group">
	  <div class="accordion-heading">
		<h4><a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseFive">
		  Collapsible Group Item #5
		</a></h4>
	  </div>
	  <div id="collapseFive" class="accordion-body collapse">
		<div class="accordion-inner">
		  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven''t heard of them accusamus labore sustainable VHS.
		</div>
	  </div>
	</div>
	
	<div class="accordion-group">
	  <div class="accordion-heading">
		<h4><a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseSix">
		  Collapsible Group Item #6
		</a></h4>
	  </div>
	  <div id="collapseSix" class="accordion-body collapse">
		<div class="accordion-inner">
		  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven''t heard of them accusamus labore sustainable VHS.
		</div>
	  </div>
	</div>
  </div>', 1)
SET IDENTITY_INSERT [dbo].[Page] OFF
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([Id], [Name], [Status]) VALUES (1, N'Paypal', 1)
INSERT [dbo].[Payment] ([Id], [Name], [Status]) VALUES (2, N'Cash', 1)
SET IDENTITY_INSERT [dbo].[Payment] OFF
SET IDENTITY_INSERT [dbo].[Photo] ON 

INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (14, N'201709120039154981.jpg', 1, 1, 34)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (15, N'201709120039312542.jpg', 0, 0, 34)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (16, N'201709120040144126.jpg', 1, 1, 35)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (17, N'201709120040326488.jpg', 1, 0, 35)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (18, N'2017091200404741312.jpg', 1, 0, 35)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (19, N'201709120043447817.jpg', 1, 1, 36)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (20, N'201709120044017616.jpg', 1, 0, 36)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (21, N'2017091200441225911.jpg', 0, 0, 36)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (22, N'20170912004546054b1.jpg', 1, 1, 37)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (23, N'20170912004553849b2.jpg', 1, 0, 37)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (24, N'20170912004608794b3.jpg', 1, 0, 37)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (25, N'20170912004618212b4.jpg', 1, 0, 37)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (26, N'201709120927116752.jpg', 1, 1, 38)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (27, N'201709120927206924.jpg', 1, 0, 38)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (28, N'20170912092755197kindle.png', 1, 1, 39)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (29, N'201709120928180519.jpg', 1, 0, 39)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (30, N'201709120932091181.jpg', 1, 1, 40)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (31, N'201709120932191963.jpg', 1, 0, 40)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (32, N'201709120932467386.jpg', 1, 1, 41)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (33, N'201709120932582827.jpg', 1, 0, 41)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (34, N'20200326233220582Tshirt.jpg', 1, 1, 42)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (35, N'20200326234120632Trousers.jpg', 1, 1, 43)
INSERT [dbo].[Photo] ([Id], [Name], [Status], [Main], [ProductId]) VALUES (36, N'20200326234226675Hats1.jpg', 1, 1, 44)
SET IDENTITY_INSERT [dbo].[Photo] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Price], [Quantity], [Description], [Status], [CategoryId], [VendorId], [Views]) VALUES (34, N'Product 1', CAST(20.00 AS Decimal(18, 2)), 200, N'<p>Description Product 1</p>', 1, 40, 15, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Quantity], [Description], [Status], [CategoryId], [VendorId], [Views]) VALUES (35, N'Product 2', CAST(12.00 AS Decimal(18, 2)), 500, N'<p>Description Product 2</p>', 1, 49, 15, 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Quantity], [Description], [Status], [CategoryId], [VendorId], [Views]) VALUES (36, N'Product 3', CAST(14.00 AS Decimal(18, 2)), 6, N'<p>Description Product 3</p>', 1, 52, 16, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Quantity], [Description], [Status], [CategoryId], [VendorId], [Views]) VALUES (37, N'Product 4', CAST(23.00 AS Decimal(18, 2)), 5, N'<p>Description product 4</p>', 1, 44, 16, 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Quantity], [Description], [Status], [CategoryId], [VendorId], [Views]) VALUES (38, N'Product 5', CAST(21.00 AS Decimal(18, 2)), 6, N'<p>Description Product 5</p>', 1, 47, 17, 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Quantity], [Description], [Status], [CategoryId], [VendorId], [Views]) VALUES (39, N'Product 6', CAST(24.00 AS Decimal(18, 2)), 200, N'<p>Description Product 6</p>', 1, 45, 17, 2)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Quantity], [Description], [Status], [CategoryId], [VendorId], [Views]) VALUES (40, N'Product 7', CAST(24.00 AS Decimal(18, 2)), 200, N'<p>Description Product 7</p>', 1, 45, 17, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Quantity], [Description], [Status], [CategoryId], [VendorId], [Views]) VALUES (41, N'Product 8', CAST(20.00 AS Decimal(18, 2)), 7, N'<p>Description Product 8</p>', 1, 45, 17, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Quantity], [Description], [Status], [CategoryId], [VendorId], [Views]) VALUES (42, N'Tshirt', CAST(800.00 AS Decimal(18, 2)), 6, N'<p>Good Cotton Tshirt</p>', 1, 40, 18, 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Quantity], [Description], [Status], [CategoryId], [VendorId], [Views]) VALUES (43, N'Vanheusan', CAST(950.00 AS Decimal(18, 2)), 123, N'<p>Best Design Ever</p>', 1, 54, 18, 0)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Quantity], [Description], [Status], [CategoryId], [VendorId], [Views]) VALUES (44, N'Ninja Hat', CAST(400.00 AS Decimal(18, 2)), 80, N'<p>Feel like ninja</p>', 1, 56, 18, 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([Id], [CustomerId], [VendorId], [Detail], [DatePost]) VALUES (1005, 8, 16, N'Good vendor', CAST(N'2017-09-12' AS Date))
INSERT [dbo].[Review] ([Id], [CustomerId], [VendorId], [Detail], [DatePost]) VALUES (1006, 3, 18, N'Experienced Stylist', CAST(N'2020-03-27' AS Date))
SET IDENTITY_INSERT [dbo].[Review] OFF
SET IDENTITY_INSERT [dbo].[Setting] ON 

INSERT [dbo].[Setting] ([Id], [Key], [Value], [Group], [TypeOfControl]) VALUES (1, N'facebook', N'http://facebook.com/', N'social network', N'textbox')
INSERT [dbo].[Setting] ([Id], [Key], [Value], [Group], [TypeOfControl]) VALUES (2, N'youtube', N'http://youtube.com/', N'social network', N'textbox')
INSERT [dbo].[Setting] ([Id], [Key], [Value], [Group], [TypeOfControl]) VALUES (3, N'twitter', N'http://twitter.com/', N'social network', N'textbox')
INSERT [dbo].[Setting] ([Id], [Key], [Value], [Group], [TypeOfControl]) VALUES (4, N'Website Name', N'Clitzy', N'general', N'textbox')
INSERT [dbo].[Setting] ([Id], [Key], [Value], [Group], [TypeOfControl]) VALUES (5, N'Shop Info', N'20200328122328934address.PNG', N'general', N'textarea')
INSERT [dbo].[Setting] ([Id], [Key], [Value], [Group], [TypeOfControl]) VALUES (6, N'Latest Products', N'6', N'general', N'textbox')
INSERT [dbo].[Setting] ([Id], [Key], [Value], [Group], [TypeOfControl]) VALUES (7, N'Mosted Viewed', N'6', N'general', N'textbox')
INSERT [dbo].[Setting] ([Id], [Key], [Value], [Group], [TypeOfControl]) VALUES (8, N'Best Sellers', N'6', N'general', N'textbox')
INSERT [dbo].[Setting] ([Id], [Key], [Value], [Group], [TypeOfControl]) VALUES (9, N'Page Size', N'9', N'general', N'textbox')
INSERT [dbo].[Setting] ([Id], [Key], [Value], [Group], [TypeOfControl]) VALUES (10, N'Logo', N'20200326000256655m_C-Letter-Free-PNG-Image (1).png', N'general', N'file')
INSERT [dbo].[Setting] ([Id], [Key], [Value], [Group], [TypeOfControl]) VALUES (11, N'PayPalSubmitUrl', N'https://www.sandbox.paypal.com/cgi-bin/webscr', N'paypal', N'textbox')
INSERT [dbo].[Setting] ([Id], [Key], [Value], [Group], [TypeOfControl]) VALUES (12, N'PayPalUsername', N'OctopusShoppingCartPaypal-facilitator@gmail.com', N'paypal', N'textbox')
INSERT [dbo].[Setting] ([Id], [Key], [Value], [Group], [TypeOfControl]) VALUES (13, N'ReturnUrl', N'http://localhost:58544/vendors/success', N'paypal', N'textbox')
INSERT [dbo].[Setting] ([Id], [Key], [Value], [Group], [TypeOfControl]) VALUES (14, N'PDTToken', N'vjfkK0m5OTxuXXrSzuEv7uncWgGQQB94xogYNq6A1kaSF4ZyGQ95Wpn-pbm', N'paypal', N'textbox')
SET IDENTITY_INSERT [dbo].[Setting] OFF
SET IDENTITY_INSERT [dbo].[Vendor] ON 

INSERT [dbo].[Vendor] ([Id], [Username], [Password], [Name], [Address], [Email], [Phone], [Logo], [Status]) VALUES (15, N'vendor1', N'$2a$10$xwTGPfJgX3/VOEyngaL4me5LaCqLr8esBTV1GMkWovuKc50R64e4a', N'Vendor 1', N'address 1', N'vendor1@gmail.com', N'123', N'20170912002658219logo-80x80.png', 1)
INSERT [dbo].[Vendor] ([Id], [Username], [Password], [Name], [Address], [Email], [Phone], [Logo], [Status]) VALUES (16, N'vendor2', N'$2a$10$84OKDM6GxQYX4Ox8ku3g.Od3G93nLuhQ6fnyj90Rixlm6v0PiFFdS', N'Vendor 2', N'address 2', N'vendor2@gmail.com', N'12345678', N'20170912004153639logo-80x80.png', 1)
INSERT [dbo].[Vendor] ([Id], [Username], [Password], [Name], [Address], [Email], [Phone], [Logo], [Status]) VALUES (17, N'vendor3', N'$2a$10$Zfc5yHXqSotGRxtKtYD8XecuWcM28DSPkiwYCl0sUxy1XyPOJV8VW', N'Vendor 3', N'Address 3', N'vendor3@gmail.com', N'123', N'20170912092605896logo-80x80.png', 1)
INSERT [dbo].[Vendor] ([Id], [Username], [Password], [Name], [Address], [Email], [Phone], [Logo], [Status]) VALUES (18, N'vishnu', N'$2a$10$FNzyJSBBEJZizBt59q4F6e1zksT27V8vvWJvbbuJBGTGGZgf6R0UK', N'vishnu', N'chandrika apartments, brundavan gar', N'vishnuvardhan.reddy98@gmail.com', N'08897693543', N'prabhas.jpg', 1)
SET IDENTITY_INSERT [dbo].[Vendor] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Table_1]    Script Date: 3/30/2020 6:08:34 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [IX_Table_1] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Page]    Script Date: 3/30/2020 6:08:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Page] ON [dbo].[Page]
(
	[Plug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Vendor]    Script Date: 3/30/2020 6:08:34 PM ******/
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [IX_Vendor] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Category] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Category]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Vendor]
GO
ALTER TABLE [dbo].[MemberShipVendor]  WITH CHECK ADD  CONSTRAINT [FK_MemberShipVendor_MemberShip] FOREIGN KEY([MemerShipId])
REFERENCES [dbo].[MemberShip] ([Id])
GO
ALTER TABLE [dbo].[MemberShipVendor] CHECK CONSTRAINT [FK_MemberShipVendor_MemberShip]
GO
ALTER TABLE [dbo].[MemberShipVendor]  WITH CHECK ADD  CONSTRAINT [FK_MemberShipVendor_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[MemberShipVendor] CHECK CONSTRAINT [FK_MemberShipVendor_Vendor]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Account] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Account]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Vendor]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Account] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Account]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatus] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatus] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatus]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Payment] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Payment]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Vendor]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetail_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [FK_OrdersDetail_Orders]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [FK_OrdersDetail_Product]
GO
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK_Photo_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK_Photo_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Vendor]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Account] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Account]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Vendor]
GO
USE [master]
GO
ALTER DATABASE [vishnuworld] SET  READ_WRITE 
GO
