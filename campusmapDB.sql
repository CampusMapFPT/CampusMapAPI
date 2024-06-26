USE [master]
GO
/****** Object:  Database [CampusMapDB]    Script Date: 4/4/2023 8:58:02 AM ******/
CREATE DATABASE [CampusMapDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CampusMapDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CampusMapDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CampusMapDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CampusMapDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CampusMapDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CampusMapDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CampusMapDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CampusMapDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CampusMapDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CampusMapDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CampusMapDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CampusMapDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CampusMapDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CampusMapDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CampusMapDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CampusMapDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CampusMapDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CampusMapDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CampusMapDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CampusMapDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CampusMapDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CampusMapDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CampusMapDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CampusMapDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CampusMapDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CampusMapDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CampusMapDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CampusMapDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CampusMapDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CampusMapDB] SET  MULTI_USER 
GO
ALTER DATABASE [CampusMapDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CampusMapDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CampusMapDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CampusMapDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CampusMapDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CampusMapDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CampusMapDB', N'ON'
GO
ALTER DATABASE [CampusMapDB] SET QUERY_STORE = OFF
GO
USE [CampusMapDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/4/2023 8:58:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 4/4/2023 8:58:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 4/4/2023 8:58:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime2](7) NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Unit] [nvarchar](max) NULL,
	[Time] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[Header] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 4/4/2023 8:58:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[Ratings] [int] NOT NULL,
	[CreateDate] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationRoutes]    Script Date: 4/4/2023 8:58:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationRoutes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstLocationId] [int] NOT NULL,
	[SecondLocationId] [int] NOT NULL,
	[CustomDistance] [int] NULL,
 CONSTRAINT [PK_LocationRoutes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 4/4/2023 8:58:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[XCoordinate] [int] NOT NULL,
	[YCoordinate] [int] NOT NULL,
	[Floor] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[XRenderValue] [int] NULL,
	[YRenderValue] [int] NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 4/4/2023 8:58:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](max) NULL,
	[ActiveTime] [nvarchar](max) NULL,
	[LocationId] [int] NOT NULL,
	[SecondName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230316055718_InitDatabase', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230316072344_AddRoomcode', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230316075632_SetRoomCodeNullable', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230316160146_AddLocationName', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230317122220_AddLocationRoute', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230323134018_FixSchema', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230325090908_fixLocationRoute', N'7.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230402130131_updateEventModel', N'7.0.4')
GO
SET IDENTITY_INSERT [dbo].[LocationRoutes] ON 

INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (1, 3, 22, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (2, 19, 22, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (3, 9, 11, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (4, 11, 12, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (5, 2, 24, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (6, 5, 27, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (7, 7, 29, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (8, 8, 30, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (9, 10, 33, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (10, 13, 35, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (11, 15, 37, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (12, 17, 39, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (13, 19, 41, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (14, 25, 41, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (15, 31, 32, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (16, 32, 34, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (17, 24, 44, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (18, 27, 46, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (19, 29, 48, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (20, 30, 50, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (21, 33, 54, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (22, 35, 56, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (23, 37, 58, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (24, 39, 60, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (25, 41, 62, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (26, 70, 71, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (27, 71, 72, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (28, 48, 66, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (29, 50, 69, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (30, 80, 82, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (31, 82, 83, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (32, 64, 77, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (33, 69, 79, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (34, 73, 84, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (35, 88, 97, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (36, 93, 94, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (37, 86, 97, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (38, 77, 90, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (39, 79, 92, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (40, 60, 95, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (41, 98, 108, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (42, 103, 106, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (43, 89, 99, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (44, 92, 102, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (45, 109, 116, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (46, 99, 110, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (47, 105, 114, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (48, 110, 118, NULL)
INSERT [dbo].[LocationRoutes] ([Id], [FirstLocationId], [SecondLocationId], [CustomDistance]) VALUES (49, 118, 120, NULL)
SET IDENTITY_INSERT [dbo].[LocationRoutes] OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (1, 0, 0, 0, NULL, 6, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (2, 1, 0, 0, N'Cầu thang', 16, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (3, 2, 0, 0, N'Phòng 004', 20, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (4, 3, 0, 0, NULL, 31, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (5, 4, 0, 0, N'Cầu thang', 46, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (6, 5, 0, 0, NULL, 59, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (7, 6, 0, 0, N'Cầu thang thiên đường', 72, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (8, 7, 0, 0, N'Cầu thang', 74, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (9, 8, 0, 0, N'Sảnh trống đồng', 87, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (10, 9, 0, 0, N'Cầu thang', 98, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (11, 8, 2, 0, NULL, 87, 62)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (12, 8, 4, 0, N'Khu vực ăn uống', 87, 33)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (13, 8, 5, 0, N'Cầu thang', 87, 22)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (14, 7, 4, 0, NULL, 62, 16)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (15, 6, 4, 0, N'Cầu thang', 58, 16)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (16, 5, 4, 0, NULL, 51, 18)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (17, 4, 4, 0, N'Cầu thang', 41, 20)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (18, 3, 4, 0, NULL, 32, 23)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (19, 2, 4, 0, N'Cầu thang', 16, 27)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (20, 1, 4, 0, NULL, 9, 28)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (21, 0, 4, 0, NULL, 2, 30)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (22, 2, 2, 0, NULL, 20, 59)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (23, 0, 0, 1, NULL, 4, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (24, 1, 0, 1, N'Cầu thang', 16, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (25, 2, 0, 1, N'Phòng 104', 20, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (26, 3, 0, 1, NULL, 31, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (27, 4, 0, 1, N'Cầu thang', 46, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (28, 5, 0, 1, NULL, 59, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (29, 7, 0, 1, N'Cầu thang', 72, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (30, 6, 0, 1, N'Cầu thang thiên đường', 74, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (31, 8, 0, 1, N'Thang máy', 87, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (32, 8, 2, 1, NULL, 87, 54)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (33, 9, 2, 1, N'Cầu thang', 98, 54)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (34, 8, 4, 1, N'Phòng 118', 87, 33)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (35, 8, 5, 1, N'Cầu thang', 87, 22)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (36, 7, 4, 1, NULL, 62, 16)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (37, 6, 4, 1, N'Cầu thang', 58, 16)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (38, 5, 4, 1, NULL, 51, 18)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (39, 4, 4, 1, N'Cầu thang', 41, 20)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (40, 3, 4, 1, NULL, 32, 23)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (41, 2, 4, 1, N'Cầu thang', 16, 27)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (42, 1, 4, 1, NULL, 9, 28)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (43, 0, 0, 2, NULL, 12, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (44, 1, 0, 2, N'Cầu thang', 16, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (45, 2, 0, 2, NULL, 30, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (46, 3, 0, 2, N'Cầu thang', 46, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (47, 4, 0, 2, NULL, 59, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (48, 5, 0, 2, N'Cầu thang', 74, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (49, 6, 0, 2, NULL, 74, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (50, 7, 0, 2, N'Cầu thang', 80, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (51, 8, 0, 2, N'Thang máy', 87, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (52, 9, 0, 2, NULL, 95, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (53, 8, 2, 2, NULL, 87, 54)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (54, 8, 4, 2, N'Phòng 221', 87, 33)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (55, 9, 4, 2, N'Cầu thang', 95, 33)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (56, 8, 5, 2, N'Cầu thang', 87, 22)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (57, 7, 4, 2, NULL, 62, 16)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (58, 6, 4, 2, N'Cầu thang', 58, 16)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (59, 5, 4, 2, NULL, 51, 18)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (60, 4, 4, 2, N'Cầu thang', 41, 20)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (61, 3, 4, 2, NULL, 32, 23)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (62, 2, 4, 2, N'Cầu thang', 16, 27)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (63, 0, 4, 2, NULL, 2, 30)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (64, 2, 0, 3, N'Cầu thang thiên đường', 44, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (65, 3, 0, 3, N'LUK', 35, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (66, 4, 0, 3, N'Cầu thang thiên đường', 59, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (67, 5, 0, 3, NULL, 67, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (68, 6, 0, 3, NULL, 74, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (69, 7, 0, 3, N'Cầu thang', 74, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (70, 8, 0, 3, N'Thang máy', 87, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (71, 8, 2, 3, NULL, 87, 65)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (72, 8, 4, 3, NULL, 87, 51)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (73, 8, 5, 3, N'Cầu thang', 91, 34)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (74, 0, 0, 4, N'Phòng 406', 9, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (75, 1, 0, 4, N'Cầu thang', 16, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (76, 2, 0, 4, NULL, 30, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (77, 3, 0, 4, N'Cầu thang thiên đường', 38, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (78, 6, 0, 4, NULL, 67, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (79, 7, 0, 4, N'Cầu thang', 74, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (80, 8, 0, 4, N'Thang máy', 87, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (81, 9, 0, 4, N'Hall C', 95, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (82, 8, 2, 4, NULL, 87, 65)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (83, 8, 4, 4, NULL, 87, 51)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (84, 8, 5, 4, N'Cầu thang', 87, 34)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (85, 0, 3, 4, NULL, 7, 35)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (86, 0, 2, 4, N'Cầu thang', 7, 52)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (87, 0, 1, 4, NULL, 7, 65)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (88, 0, 0, 5, N'Sân võ', 7, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (89, 1, 0, 5, N'Cầu thang', 16, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (90, 2, 0, 5, N'Cầu thang', 35, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (91, 6, 0, 5, NULL, 70, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (92, 7, 0, 5, N'Cầu thang', 74, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (93, 8, 0, 5, N'Thang máy', 85, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (94, 8, 2, 5, N'Phòng 509', 85, 62)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (95, 4, 4, 5, N'Cầu thang', 67, 16)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (96, 4, 3, 5, N'Hall A', 59, 16)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (97, 0, 2, 5, N'Cầu thang', 7, 54)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (98, 0, 0, 6, N'Phòng 601', 8, 88)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (99, 1, 0, 6, N'Cầu thang', 16, 82)
GO
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (100, 2, 0, 6, NULL, 28, 88)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (101, 6, 0, 6, NULL, 60, 88)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (102, 7, 0, 6, N'Cầu thang', 74, 82)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (103, 8, 0, 6, N'Thang máy', 83, 86)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (104, 9, 0, 6, NULL, 89, 86)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (105, 10, 0, 6, N'Cầu thang', 96, 86)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (106, 8, 2, 6, NULL, 89, 59)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (107, 2, 0, 6, NULL, 28, 88)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (108, 0, 0, 7, N'Phòng 701', 6, 79)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (109, 1, 0, 7, N'Cầu thang', 16, 82)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (110, 7, 0, 7, NULL, 84, 84)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (111, 8, 0, 7, N'Thang máy', 83, 86)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (112, 9, 0, 7, NULL, 99, 80)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (113, 10, 0, 7, N'Cầu thang', 96, 86)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (114, 8, 2, 7, NULL, 89, 61)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (115, 0, 2, 7, NULL, 9, 63)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (116, 0, 0, 8, NULL, 7, 80)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (117, 1, 0, 8, N'Cầu thang', 16, 82)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (118, 2, 0, 8, NULL, 25, 8)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (119, 0, 0, 9, N'Cầu thang', 16, 82)
INSERT [dbo].[Locations] ([Id], [XCoordinate], [YCoordinate], [Floor], [Name], [XRenderValue], [YRenderValue]) VALUES (120, 1, 0, 9, NULL, 24, 86)
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (1, N'Cổng sau', N'Gate', NULL, 1, N'Cổng sau')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (2, N'Passio', N'Passio', NULL, 1, N'Passio')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (3, N'Phòng 004', N'Room', NULL, 3, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (4, N'Phòng 005', N'Room', NULL, 4, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (5, N'Phòng 006', N'Room', NULL, 4, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (6, N'Phòng 007', N'Room', NULL, 4, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (7, N'Phòng 008', N'Room', NULL, 4, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (8, N'Phòng 010', N'Room', NULL, 6, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (9, N'Phòng 011', N'Room', NULL, 6, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (10, N'Phòng 012', N'Room', NULL, 6, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (11, N'Phòng 013', N'Room', NULL, 6, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (12, N'Phòng 014', N'Room', NULL, 6, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (13, N'Phòng 015', N'Room', NULL, 6, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (14, N'Phòng 016', N'Room', NULL, 6, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (15, N'Phòng 017', N'Room', NULL, 6, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (16, N'Sảnh trống đồng', N'Special', NULL, 9, N'Sảnh trống đồng')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (17, N'Cổng chính', N'Gate', NULL, 9, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (18, N'Phòng 020', N'Room', NULL, 11, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (19, N'Phòng 021', N'Room', NULL, 11, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (20, N'Phòng 022', N'Room', NULL, 11, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (21, N'Phòng 023', N'Room', NULL, 11, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (22, N'Phòng 024', N'Room', NULL, 11, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (23, N'Phòng 025', N'Room', NULL, 11, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (24, N'Khu vực ăn uống', N'Special', NULL, 12, N'Khu vực ăn uống')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (25, N'7Eleven', N'7Eleven', NULL, 14, N'7Eleven')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (26, N'Cổng sau', N'Gate', NULL, 14, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (27, N'Phòng 027', N'Room', NULL, 16, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (28, N'Phòng 028', N'Room', NULL, 16, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (29, N'Phòng 029', N'Room', NULL, 16, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (30, N'Phòng 030', N'Room', NULL, 16, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (31, N'Phòng 033', N'Room', NULL, 18, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (32, N'Phòng 034', N'Room', NULL, 18, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (33, N'Phòng 035', N'Room', NULL, 18, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (34, N'Phòng 036', N'Room', NULL, 18, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (35, N'Phòng 037', N'Room', NULL, 18, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (36, N'Cổng sau', N'Gate', NULL, 19, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (37, N'Phòng 039', N'Room', NULL, 20, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (38, N'Phòng 040', N'Room', NULL, 20, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (39, N'Phòng 042', N'Room', NULL, 20, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (40, N'Phòng 043', N'Room', NULL, 20, N'Phòng y tế')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (41, N'Phòng 041', N'Room', NULL, 21, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (42, N'Thư viện', N'Special', NULL, 22, N'Thư viện')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (43, N'Phòng 045', N'Room', NULL, 22, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (44, N'Phòng LB01', N'Room', NULL, 22, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (45, N'Phòng LB02', N'Room', NULL, 22, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (46, N'Phòng 101', N'Room', NULL, 23, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (47, N'Phòng 102', N'Room', NULL, 23, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (48, N'Phòng 103', N'Room', NULL, 23, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (49, N'Phòng 104', N'Room', NULL, 25, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (50, N'Phòng 105', N'Room', NULL, 26, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (51, N'Phòng 106', N'Room', NULL, 26, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (52, N'Phòng 107', N'Room', NULL, 26, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (53, N'Phòng 108', N'Room', NULL, 26, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (54, N'Phòng 109', N'Room', NULL, 26, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (55, N'Phòng 110', N'Room', NULL, 28, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (56, N'Phòng 111', N'Room', NULL, 28, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (57, N'Phòng 112', N'Room', NULL, 28, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (58, N'Phòng 113', N'Room', NULL, 28, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (59, N'Phòng 115', N'Room', NULL, 32, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (60, N'Phòng 117', N'Room', NULL, 32, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (61, N'Phòng 119', N'Room', NULL, 32, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (62, N'Sảnh gương', N'Special', NULL, 32, N'Sảnh gương')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (63, N'Phòng 120', N'Room', NULL, 32, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (64, N'Phòng 121', N'Room', NULL, 32, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (65, N'Sảnh gương', N'Special', NULL, 33, N'Sảnh gương')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (66, N'Phòng 116', N'Room', NULL, 34, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (67, N'Phòng 118', N'Room', NULL, 34, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (68, N'Phòng 201', N'Special', NULL, 43, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (69, N'Phòng 202', N'Special', N'7:00 - 11:30 | 13:30 - 16:45 (T2 - T6)),(7:00 - 11:30 (T7)', 43, N'Phòng Công tác Sinh viên')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (70, N'Phòng 203', N'Room', NULL, 45, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (71, N'Phòng 204', N'Room', NULL, 45, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (72, N'Phòng 205', N'Room', NULL, 45, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (73, N'Phòng 206', N'Room', NULL, 45, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (74, N'Phòng 207', N'Room', NULL, 45, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (75, N'Phòng 209', N'Room', NULL, 47, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (76, N'Phòng 211', N'Room', NULL, 49, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (77, N'Phòng 212', N'Room', NULL, 49, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (78, N'Phòng 213', N'Room', NULL, 49, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (79, N'Phòng 214', N'Room', NULL, 52, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (80, N'Phòng 215', N'Room', NULL, 52, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (81, N'Phòng 216', N'Room', NULL, 52, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (82, N'Phòng 219', N'Room', NULL, 53, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (83, N'Phòng 220', N'Room', NULL, 53, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (84, N'Phòng 221', N'Room', NULL, 55, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (85, N'Phòng 222', N'Room', NULL, 53, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (86, N'Phòng 223', N'Room', NULL, 55, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (87, N'Phòng 224', N'Room', NULL, 55, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (88, N'Phòng 225', N'Room', NULL, 59, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (89, N'Phòng 226', N'Room', NULL, 59, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (90, N'Phòng 227', N'Room', NULL, 59, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (91, N'Phòng 230', N'Room', NULL, 61, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (92, N'Phòng 231', N'Room', NULL, 61, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (93, N'Phòng 232', N'Room', NULL, 61, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (94, N'Phòng 233', N'Room', NULL, 61, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (95, N'Phòng 234', N'Room', NULL, 61, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (96, N'Laha Cafe', N'Special', NULL, 63, N'Laha Cafe')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (97, N'LUK', N'Special', NULL, 64, N'LUK')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (98, N'Phòng 301', N'Room', NULL, 67, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (99, N'Phòng 302', N'Room', NULL, 67, NULL)
GO
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (100, N'Phòng 303', N'Room', NULL, 67, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (101, N'Phòng 304', N'Room', NULL, 67, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (102, N'Phòng 305', N'Room', NULL, 68, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (103, N'Phòng 306', N'Room', NULL, 68, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (104, N'Phòng 307', N'Room', NULL, 68, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (105, N'Phòng 308', N'Special', NULL, 68, N'Hội trường C')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (106, N'Phòng 311', N'Room', NULL, 71, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (107, N'Phòng 312', N'Room', NULL, 71, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (108, N'Phòng 313', N'Room', NULL, 71, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (109, N'Phòng 314', N'Room', NULL, 72, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (110, N'Phòng 315', N'Room', NULL, 72, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (111, N'Phòng 401', N'Special', NULL, 86, N'Hội trường B')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (112, N'Phòng 404', N'Room', NULL, 87, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (113, N'Phòng 406', N'Room', NULL, 74, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (114, N'Phòng 407', N'Room', NULL, 74, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (115, N'Phòng 408', N'Room', NULL, 76, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (116, N'Phòng 409', N'Room', NULL, 76, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (117, N'Phòng 410', N'Room', NULL, 76, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (118, N'Phòng 412', N'Room', NULL, 78, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (119, N'Phòng 413', N'Room', NULL, 78, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (120, N'Phòng 414', N'Room', NULL, 78, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (121, N'Phòng 415', N'Room', NULL, 78, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (122, N'Phòng 416', N'Room', NULL, 81, N'Hội trường C')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (123, N'Phòng 419', N'Room', NULL, 82, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (124, N'Phòng 420', N'Room', NULL, 82, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (125, N'Phòng 421', N'Room', NULL, 83, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (126, N'Phòng 422', N'Room', NULL, 83, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (127, N'Vovinam', N'Special', NULL, 88, N'Khu vực học Vovinam')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (128, N'Phòng 501', N'Special', NULL, 88, N'Hội trường B')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (129, N'Phòng 502', N'Room', NULL, 91, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (130, N'Phòng 503', N'Room', NULL, 91, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (131, N'Phòng 504', N'Room', NULL, 91, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (132, N'Phòng 505', N'Room', NULL, 91, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (133, N'Phòng 506', N'Room', NULL, 91, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (134, N'Phòng 509', N'Room', NULL, 94, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (135, N'Hội trường A', N'Special', NULL, 96, N'Hội trường A')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (136, N'Phòng 601', N'Room', NULL, 98, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (137, N'Phòng 602', N'Room', NULL, 98, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (138, N'Phòng 603', N'Room', NULL, 100, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (139, N'Phòng 604', N'Room', NULL, 100, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (140, N'Phòng 605', N'Room', NULL, 100, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (141, N'Phòng 606', N'Room', NULL, 100, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (142, N'Phòng 607', N'Room', NULL, 101, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (143, N'Phòng 608', N'Room', NULL, 101, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (144, N'Phòng 609', N'Special', NULL, 104, N'Orange bar bistro')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (145, N'Phòng 610', N'Special', NULL, 104, N'Hotel room')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (146, N'Phòng 612', N'Room', NULL, 106, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (147, N'Phòng 613', N'Special', NULL, 106, N'Studio room')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (148, N'Phòng 616', N'Room', NULL, 108, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (149, N'Phòng 617', N'Room', NULL, 108, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (150, N'Phòng 618', N'Room', NULL, 107, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (151, N'Phòng 619', N'Room', NULL, 107, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (152, N'Phòng 701', N'Special', NULL, 109, N'Public relation')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (153, N'Phòng 702', N'Special', NULL, 109, N'Acad, Staff')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (154, N'Phòng 703', N'Special', NULL, 109, N'Research')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (155, N'Phòng 704', N'Special', NULL, 109, N'Acad, Head')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (156, N'Phòng 705', N'Special', NULL, 118, N'Phòng tuyển sinh')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (157, N'Phòng 708', N'Special', NULL, 113, N'Teabreak')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (158, N'Phòng 710', N'Room', NULL, 115, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (159, N'Phòng 711', N'Special', NULL, 111, N'Meeting room')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (160, N'Phòng 712', N'Special', NULL, 111, N'Director room')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (161, N'Phòng 801', N'Special', NULL, 118, N'Staff')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (162, N'Phòng 802', N'Special', NULL, 118, N'Ling tech lap & AI robot lap')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (163, N'Phòng 803', N'Special', NULL, 117, N'Acad, Staff')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (164, N'Phòng 804', N'Room', NULL, 119, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (165, N'Phòng 805', N'Room', NULL, 119, NULL)
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (166, N'Phòng 903', N'Special', NULL, 120, N'Staff')
INSERT [dbo].[Room] ([Id], [Name], [Type], [ActiveTime], [LocationId], [SecondName]) VALUES (167, N'Phòng 904', N'Special', NULL, 121, N'Meeting room')
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
/****** Object:  Index [IX_LocationRoutes_FirstLocationId]    Script Date: 4/4/2023 8:58:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_LocationRoutes_FirstLocationId] ON [dbo].[LocationRoutes]
(
	[FirstLocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LocationRoutes_SecondLocationId]    Script Date: 4/4/2023 8:58:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_LocationRoutes_SecondLocationId] ON [dbo].[LocationRoutes]
(
	[SecondLocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Room_LocationId]    Script Date: 4/4/2023 8:58:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_Room_LocationId] ON [dbo].[Room]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LocationRoutes]  WITH CHECK ADD  CONSTRAINT [FK_LocationRoutes_Locations_FirstLocationId] FOREIGN KEY([FirstLocationId])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [dbo].[LocationRoutes] CHECK CONSTRAINT [FK_LocationRoutes_Locations_FirstLocationId]
GO
ALTER TABLE [dbo].[LocationRoutes]  WITH CHECK ADD  CONSTRAINT [FK_LocationRoutes_Locations_SecondLocationId] FOREIGN KEY([SecondLocationId])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [dbo].[LocationRoutes] CHECK CONSTRAINT [FK_LocationRoutes_Locations_SecondLocationId]
GO
USE [master]
GO
ALTER DATABASE [CampusMapDB] SET  READ_WRITE 
GO
