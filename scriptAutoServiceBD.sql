USE [master]
GO
/****** Object:  Database [AutoService]    Script Date: 14.12.2020 11:44:04 ******/
CREATE DATABASE [AutoService]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AutoService', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AutoService.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AutoService_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AutoService_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AutoService] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AutoService].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AutoService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AutoService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AutoService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AutoService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AutoService] SET ARITHABORT OFF 
GO
ALTER DATABASE [AutoService] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AutoService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AutoService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AutoService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AutoService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AutoService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AutoService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AutoService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AutoService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AutoService] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AutoService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AutoService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AutoService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AutoService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AutoService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AutoService] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AutoService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AutoService] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AutoService] SET  MULTI_USER 
GO
ALTER DATABASE [AutoService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AutoService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AutoService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AutoService] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AutoService] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AutoService] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AutoService] SET QUERY_STORE = OFF
GO
USE [AutoService]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 14.12.2020 11:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 14.12.2020 11:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 14.12.2020 11:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 14.12.2020 11:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 14.12.2020 11:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 14.12.2020 11:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 14.12.2020 11:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 14.12.2020 11:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 14.12.2020 11:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 14.12.2020 11:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 14.12.2020 11:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 14.12.2020 11:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 14.12.2020 11:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (1, N'Иветта', N'Мишина', N'Андреевна', CAST(N'2002-10-05' AS Date), CAST(N'2016-01-24T00:00:00.000' AS DateTime), N'aukjan@yahoo.com', N'7(3926)244-81-96 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (2, N'Божена', N'Суворова', N'Анатольевна', CAST(N'1981-03-09' AS Date), CAST(N'2016-01-28T00:00:00.000' AS DateTime), N'attwood@aol.com', N'7(347)895-86-57 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (3, N'Диана', N'Белозёрова', N'Антоновна', CAST(N'1989-02-27' AS Date), CAST(N'2017-01-30T00:00:00.000' AS DateTime), N'dialworld@aol.com', N'7(9900)174-59-87 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (4, N'Эдита', N'Дементьева', N'Онисимовна', CAST(N'1975-09-17' AS Date), CAST(N'2018-11-24T00:00:00.000' AS DateTime), N'frosal@hotmail.com', N'7(198)922-28-76 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (5, N'Евгений', N'Блинов', N'Мэлсович', CAST(N'1994-01-05' AS Date), CAST(N'2017-05-07T00:00:00.000' AS DateTime), N'moxfulder@outlook.com', N'7(0852)321-82-64 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (6, N'Наум', N'Морозов', N'Валерьянович', CAST(N'1985-07-04' AS Date), CAST(N'2016-05-02T00:00:00.000' AS DateTime), N'salesgeek@mac.com', N'7(636)050-96-13 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (7, N'Харита', N'Попова', N'Якуновна', CAST(N'1997-12-16' AS Date), CAST(N'2016-07-05T00:00:00.000' AS DateTime), N'firstpr@verizon.net', N'7(335)386-81-06 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (8, N'Наум', N'Крюков', N'Ильяович', CAST(N'1993-11-17' AS Date), CAST(N'2017-02-01T00:00:00.000' AS DateTime), N'floxy@hotmail.com', N'7(81)657-88-92 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (9, N'Авигея', N'Крюкова', N'Святославовна', CAST(N'2000-08-10' AS Date), CAST(N'2018-01-03T00:00:00.000' AS DateTime), N'simone@gmail.com', N'7(499)318-88-53 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (10, N'Сабрина', N'Беляева', N'Федосеевна', CAST(N'1972-07-26' AS Date), CAST(N'2017-06-14T00:00:00.000' AS DateTime), N'agapow@gmail.com', N'7(6580)534-32-58 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (11, N'Святослав', N'Медведев', N'Юлианович', CAST(N'1972-10-04' AS Date), CAST(N'2018-10-13T00:00:00.000' AS DateTime), N'hllam@comcast.net', N'7(3520)435-21-20 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (12, N'Пантелеймон', N'Блохин', N'Феликсович', CAST(N'1978-03-06' AS Date), CAST(N'2018-02-14T00:00:00.000' AS DateTime), N'balchen@comcast.net', N'7(9524)556-48-98 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (13, N'Никки', N'Горбачёва', N'Еремеевна', CAST(N'1987-04-21' AS Date), CAST(N'2018-08-16T00:00:00.000' AS DateTime), N'chinthaka@att.net', N'7(94)789-69-20 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (14, N'Прасковья', N'Архипова', N'Валерьевна', CAST(N'1979-01-09' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N'cgcra@live.com', N'7(86)540-10-21 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (15, N'Патрисия', N'Андреева', N'Валерьевна', CAST(N'1993-11-18' AS Date), CAST(N'2016-07-17T00:00:00.000' AS DateTime), N'jigsaw@aol.com', N'7(9648)953-81-26 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (16, N'Марта', N'Горшкова', N'Иосифовна', CAST(N'2001-02-13' AS Date), CAST(N'2016-08-04T00:00:00.000' AS DateTime), N'gbacon@mac.com', N'7(544)650-59-03', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (17, N'Влада', N'Орлова', N'Мартыновна', CAST(N'1990-06-26' AS Date), CAST(N'2016-03-21T00:00:00.000' AS DateTime), N'rnelson@yahoo.ca', N'7(2506)433-38-35 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (18, N'Глеб', N'Ершов', N'Федорович', CAST(N'1970-06-14' AS Date), CAST(N'2016-09-14T00:00:00.000' AS DateTime), N'sjava@aol.com', N'7(2608)298-40-82 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (19, N'Тала', N'Быкова', N'Георгьевна', CAST(N'2000-02-22' AS Date), CAST(N'2016-08-13T00:00:00.000' AS DateTime), N'ganter@optonline.net', N'7(13)915-53-53 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (20, N'Адриан', N'Новиков', N'Аркадьевич', CAST(N'1974-01-15' AS Date), CAST(N'2018-11-23T00:00:00.000' AS DateTime), N'multiplx@verizon.net', N'7(70)572-33-62 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (21, N'Аристарх', N'Филатов', N'Дмитриевич', CAST(N'1989-05-29' AS Date), CAST(N'2017-01-11T00:00:00.000' AS DateTime), N'hampton@att.net', N'7(696)235-29-24 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (22, N'Тамара', N'Анисимова', N'Витальевна', CAST(N'1988-06-16' AS Date), CAST(N'2016-02-25T00:00:00.000' AS DateTime), N'schwaang@mac.com', N'7(66)128-04-10 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (23, N'Аверкий', N'Кудряшов', N'Константинович', CAST(N'1991-07-26' AS Date), CAST(N'2018-03-08T00:00:00.000' AS DateTime), N'nanop@msn.com', N'7(88)732-96-30 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (24, N'Орест', N'Колобов', N'Юлианович', CAST(N'2001-07-14' AS Date), CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'parkes@verizon.net', N'7(1680)508-58-26 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (25, N'Дэнна', N'Кузьмина', N'Витальевна', CAST(N'1993-08-24' AS Date), CAST(N'2016-03-27T00:00:00.000' AS DateTime), N'nichoj@mac.com', N'7(9940)977-45-73 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (26, N'Станислав', N'Александров', N'Эдуардович', CAST(N'1981-07-04' AS Date), CAST(N'2018-11-08T00:00:00.000' AS DateTime), N'bigmauler@aol.com', N'7(18)164-05-12 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (27, N'Станислав', N'Андреев', N'Максович', CAST(N'1975-10-10' AS Date), CAST(N'2017-12-26T00:00:00.000' AS DateTime), N'budinger@mac.com', N'7(02)993-91-28 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (28, N'Вольдемар', N'Дроздов', N'Артемович', CAST(N'1976-02-07' AS Date), CAST(N'2017-07-18T00:00:00.000' AS DateTime), N'smpeters@me.com', N'7(307)456-99-05 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (29, N'Станислав', N'Абрамов', N'Филатович', CAST(N'1989-05-18' AS Date), CAST(N'2016-12-08T00:00:00.000' AS DateTime), N'solomon@att.net', N'7(6545)478-87-79 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (30, N'Роза', N'Гусева', N'Дмитриевна', CAST(N'1999-02-13' AS Date), CAST(N'2017-12-12T00:00:00.000' AS DateTime), N'martyloo@live.com', N'7(23)064-51-84 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (31, N'Алексей', N'Лазарев', N'Богданович', CAST(N'1977-03-10' AS Date), CAST(N'2017-01-02T00:00:00.000' AS DateTime), N'claesjac@me.com', N'7(0055)737-37-48 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (32, N'Вадим', N'Большаков', N'Данилович', CAST(N'1970-05-15' AS Date), CAST(N'2018-08-04T00:00:00.000' AS DateTime), N'uncle@gmail.com', N'7(386)641-13-37 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (33, N'Витольд', N'Ефремов', N'Авксентьевич', CAST(N'1975-12-02' AS Date), CAST(N'2018-04-09T00:00:00.000' AS DateTime), N'kwilliams@yahoo.ca', N'7(93)922-14-03 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (34, N'Захар', N'Игнатов', N'Павлович', CAST(N'1998-10-07' AS Date), CAST(N'2017-11-10T00:00:00.000' AS DateTime), N'dieman@icloud.com', N'7(578)574-73-36 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (35, N'Артур', N'Калашников', N'Юрьевич', CAST(N'1972-12-13' AS Date), CAST(N'2017-08-20T00:00:00.000' AS DateTime), N'oevans@aol.com', N'7(147)947-47-21 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (36, N'Лаура', N'Овчинникова', N'Еремеевна', CAST(N'1992-04-03' AS Date), CAST(N'2018-11-24T00:00:00.000' AS DateTime), N'carcus@yahoo.ca', N'7(85)829-33-79 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (37, N'Иосиф', N'Голубев', N'Тимофеевич', CAST(N'1982-05-06' AS Date), CAST(N'2018-08-18T00:00:00.000' AS DateTime), N'smcnabb@att.net', N'7(78)972-73-11 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (38, N'Эрик', N'Галкин', N'Онисимович', CAST(N'1975-01-18' AS Date), CAST(N'2016-07-19T00:00:00.000' AS DateTime), N'snunez@verizon.net', N'7(759)873-77-39 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (39, N'Варлам', N'Некрасов', N'Михайлович', CAST(N'2000-11-12' AS Date), CAST(N'2017-12-03T00:00:00.000' AS DateTime), N'dogdude@verizon.net', N'7(019)258-06-35 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (40, N'Осип', N'Федотов', N'Анатольевич', CAST(N'1971-04-13' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N'breegster@hotmail.com', N'7(590)702-33-06 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (41, N'Мартын', N'Смирнов', N'Арсеньевич', CAST(N'1996-06-25' AS Date), CAST(N'2017-02-07T00:00:00.000' AS DateTime), N'haddawy@live.com', N'7(6251)589-02-43 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (42, N'Касьян', N'Копылов', N'Робертович', CAST(N'1983-08-04' AS Date), CAST(N'2018-03-18T00:00:00.000' AS DateTime), N'crobles@sbcglobal.net', N'7(5774)679-82-06 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (43, N'Элина', N'Дмитриева', N'Даниловна', CAST(N'1988-12-10' AS Date), CAST(N'2017-02-11T00:00:00.000' AS DateTime), N'vmalik@live.com', N'7(787)140-48-84 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (44, N'Инара', N'Бирюкова', N'Улебовна', CAST(N'1978-07-21' AS Date), CAST(N'2017-10-01T00:00:00.000' AS DateTime), N'smpeters@hotmail.com', N'7(098)346-50-58 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (45, N'Оскар', N'Васильев', N'Богданович', CAST(N'1971-01-30' AS Date), CAST(N'2017-05-28T00:00:00.000' AS DateTime), N'miturria@verizon.net', N'7(585)801-94-29 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (46, N'Устин', N'Киселёв', N'Яковлевич', CAST(N'1985-01-08' AS Date), CAST(N'2018-06-21T00:00:00.000' AS DateTime), N'dalamb@verizon.net', N'7(83)334-52-76 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (47, N'Леонтий', N'Кузьмин', N'Валерьянович', CAST(N'2000-05-05' AS Date), CAST(N'2017-10-12T00:00:00.000' AS DateTime), N'msloan@hotmail.com', N'7(1340)148-90-68 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (48, N'Магда', N'Ефимова', N'Платоновна', CAST(N'1995-08-16' AS Date), CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'rbarreira@me.com', N'7(9261)386-15-92 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (49, N'Изабелла', N'Воронова', N'Вячеславовна', CAST(N'1999-09-24' AS Date), CAST(N'2017-12-21T00:00:00.000' AS DateTime), N'kildjean@sbcglobal.net', N'7(17)433-44-98 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (50, N'Людвиг', N'Волков', N'Витальевич', CAST(N'1977-12-27' AS Date), CAST(N'2016-04-27T00:00:00.000' AS DateTime), N'jrkorson@msn.com', N'7(8459)592-05-58 ', N'м', NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (1, 47, 49, CAST(N'2019-04-15T13:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (2, 29, 92, CAST(N'2019-11-27T13:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (3, 38, 32, CAST(N'2019-07-29T10:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (4, 42, 15, CAST(N'2019-09-05T14:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (5, 41, 80, CAST(N'2019-02-04T19:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (6, 46, 49, CAST(N'2019-06-24T14:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (7, 50, 45, CAST(N'2019-12-05T18:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (8, 30, 25, CAST(N'2019-03-19T09:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (9, 28, 50, CAST(N'2019-10-09T18:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (10, 8, 83, CAST(N'2019-05-19T16:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (11, 11, 7, CAST(N'2019-08-02T18:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (12, 48, 90, CAST(N'2019-12-06T09:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (13, 48, 35, CAST(N'2019-08-08T19:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (14, 24, 8, CAST(N'2019-04-14T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (15, 30, 75, CAST(N'2019-09-09T17:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (16, 20, 28, CAST(N'2019-10-16T18:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (17, 5, 50, CAST(N'2019-12-07T17:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (18, 24, 13, CAST(N'2019-09-05T19:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (19, 13, 80, CAST(N'2019-11-26T10:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (20, 18, 27, CAST(N'2019-07-30T10:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (21, 11, 96, CAST(N'2019-07-07T09:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (22, 29, 75, CAST(N'2019-12-15T14:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (23, 27, 71, CAST(N'2019-12-16T19:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (24, 46, 52, CAST(N'2019-06-28T10:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (25, 16, 92, CAST(N'2019-12-30T14:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (26, 11, 8, CAST(N'2019-02-26T17:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (27, 23, 28, CAST(N'2019-11-15T15:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (28, 16, 81, CAST(N'2019-09-13T10:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (29, 15, 81, CAST(N'2019-03-06T12:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (30, 27, 74, CAST(N'2019-04-11T16:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (31, 14, 71, CAST(N'2019-07-12T19:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (32, 16, 88, CAST(N'2019-07-09T18:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (33, 39, 15, CAST(N'2019-11-23T14:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (34, 14, 27, CAST(N'2019-08-15T18:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (35, 23, 23, CAST(N'2019-11-27T09:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (36, 42, 7, CAST(N'2019-12-23T15:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (37, 7, 45, CAST(N'2019-09-17T11:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (38, 12, 84, CAST(N'2019-07-02T15:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (39, 1, 74, CAST(N'2019-08-12T11:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (40, 22, 65, CAST(N'2019-04-15T11:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (41, 36, 100, CAST(N'2019-06-10T16:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (42, 22, 39, CAST(N'2019-02-21T08:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (43, 34, 88, CAST(N'2019-10-14T12:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (44, 34, 87, CAST(N'2019-12-15T19:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (45, 25, 57, CAST(N'2019-08-24T11:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (46, 21, 13, CAST(N'2019-06-15T09:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (47, 35, 52, CAST(N'2019-04-22T11:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (48, 22, 39, CAST(N'2019-02-24T13:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (49, 14, 95, CAST(N'2019-02-15T17:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (50, 16, 27, CAST(N'2019-07-09T16:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (51, 32, 96, CAST(N'2019-08-24T17:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (52, 22, 97, CAST(N'2019-08-25T08:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (53, 13, 81, CAST(N'2019-06-21T14:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (54, 13, 13, CAST(N'2019-12-28T17:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (55, 38, 49, CAST(N'2019-01-29T16:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (56, 13, 90, CAST(N'2019-11-30T18:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (57, 20, 98, CAST(N'2019-10-17T19:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (58, 23, 4, CAST(N'2019-03-16T10:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (59, 35, 98, CAST(N'2019-11-14T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (60, 17, 33, CAST(N'2019-12-18T10:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (61, 18, 92, CAST(N'2019-06-14T18:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (62, 27, 74, CAST(N'2019-07-05T13:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (63, 20, 75, CAST(N'2019-10-14T19:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (64, 28, 27, CAST(N'2019-08-21T17:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (65, 7, 75, CAST(N'2019-05-28T11:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (66, 14, 72, CAST(N'2019-09-19T16:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (67, 48, 73, CAST(N'2019-06-22T13:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (68, 24, 26, CAST(N'2019-08-08T17:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (69, 8, 52, CAST(N'2019-08-12T08:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (70, 8, 49, CAST(N'2019-03-04T11:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (71, 11, 13, CAST(N'2019-03-22T15:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (72, 21, 94, CAST(N'2019-06-05T10:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (73, 17, 75, CAST(N'2019-04-21T12:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (74, 32, 4, CAST(N'2019-07-28T12:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (75, 32, 32, CAST(N'2019-10-10T13:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (76, 29, 100, CAST(N'2019-04-05T10:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (77, 2, 87, CAST(N'2019-07-30T12:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (78, 31, 52, CAST(N'2019-12-30T08:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (79, 50, 75, CAST(N'2019-06-29T17:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (80, 38, 8, CAST(N'2019-08-19T17:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (81, 6, 26, CAST(N'2019-11-05T12:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (82, 20, 97, CAST(N'2019-01-19T11:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (83, 6, 9, CAST(N'2019-04-14T14:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (84, 39, 21, CAST(N'2019-05-27T08:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (85, 18, 75, CAST(N'2019-06-16T12:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (86, 44, 21, CAST(N'2019-08-12T15:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (87, 31, 72, CAST(N'2019-04-06T11:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (88, 23, 84, CAST(N'2019-05-23T11:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (89, 1, 76, CAST(N'2019-09-20T08:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (90, 5, 84, CAST(N'2019-02-24T13:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (91, 47, 21, CAST(N'2019-05-01T10:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (92, 27, 94, CAST(N'2019-05-27T14:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (93, 22, 4, CAST(N'2019-02-16T09:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (94, 44, 65, CAST(N'2019-03-23T16:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (95, 34, 32, CAST(N'2019-12-24T09:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (96, 35, 16, CAST(N'2019-05-09T10:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (97, 10, 65, CAST(N'2019-10-05T18:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (98, 25, 15, CAST(N'2019-04-26T10:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (99, 17, 15, CAST(N'2019-08-05T10:10:00.000' AS DateTime), N'')
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (100, 24, 95, CAST(N'2019-12-19T15:00:00.000' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'ж', N'Женский')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'м', N'Мужской')
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (1, N'Замена жидкости в кондиционере', 3040.0000, 28800, N'', 25, N' Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (2, N'Ремонт и замена коллектора', 2770.0000, 9000, N'', 15, N' Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (3, N'Замена актуатора сцепления', 4100.0000, 19800, N'', 15, N' Услуги автосервиса\Сцепление.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (4, N'Замена жидкости ГУР', 2380.0000, 32400, N'', 20, N' Услуги автосервиса\ГУР.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (5, N'Заправка кондиционеров', 4860.0000, 7200, N'', 5, N' Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (6, N'Замена масла в вариаторе', 4720.0000, 7200, N'', 5, N' Услуги автосервиса\Вариатор.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (7, N'Ремонт двигателя', 2470.0000, 14400, N'', 25, N' Услуги автосервиса\Двигатель.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (8, N'Замена заднего сальника АКПП', 1510.0000, 23400, N'', 25, N' Услуги автосервиса\АКПП.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (9, N'Покраска', 2370.0000, 7200, N'', 15, N' Услуги автосервиса\Дополнительные услуги.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (10, N'Мойка колес', 3490.0000, 34200, N'', 0, N' Услуги автосервиса\Шиномонтаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (11, N'Замена прокладки впускного-выпуского коллектора', 2980.0000, 10800, N'', 0, N' Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (12, N'Диагностика работы двигателя', 2760.0000, 9000, N'', 10, N' Услуги автосервиса\Двигатель.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (13, N'Установка сигнализации', 1760.0000, 14400, N'', 0, N' Услуги автосервиса\Электрика.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (14, N'Замена компрессора кондиционера', 2720.0000, 16200, N'', 10, N' Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (15, N'Замена ремня привода ГУР', 3350.0000, 36000, N'', 0, N' Услуги автосервиса\ГУР.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (16, N'Замена тормозных колодок', 4260.0000, 28800, N'', 5, N' Услуги автосервиса\Техническое обслуживание.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (17, N'Замена масла', 1430.0000, 30600, N'', 25, N' Услуги автосервиса\Техническое обслуживание.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (18, N'Замена цепи ГРМ', 4570.0000, 21600, N'', 20, N' Услуги автосервиса\Двигатель.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (19, N'Замена бензонасоса', 1780.0000, 14400, N'', 10, N' Услуги автосервиса\Топливная система.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (20, N'Ремонт приводного вала', 4520.0000, 12600, N'', 5, N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (21, N'Замена подшипника компрессора кондиционера', 1110.0000, 19800, N'', 20, N' Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (22, N'Снятие и установка колес', 3130.0000, 23400, N'', 0, N' Услуги автосервиса\Шиномонтаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (23, N'Замена лямбда зонда', 770.0000, 16200, N'', 5, N' Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (24, N'Замена привода в сборе', 3890.0000, 28800, N'', 15, N' Услуги автосервиса\transmission.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (25, N'Замена трубки кондиционера', 2810.0000, 10800, N'', 15, N' Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (26, N'Замена ремня кондиционера', 4650.0000, 28800, N'', 0, N' Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (27, N'Замена охлаждающей жидкости', 1590.0000, 12600, N'', 0, N' Услуги автосервиса\Техническое обслуживание.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (28, N'Замена троса сцепления', 4460.0000, 28800, N'', 5, N' Услуги автосервиса\Сцепление.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (29, N'Замена масла в МКПП', 4490.0000, 32400, N'', 20, N' Услуги автосервиса\КПП.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (30, N'Замена рулевой рейки', 4840.0000, 34200, N'', 25, N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (31, N'Ремонт дисков', 3860.0000, 16200, N'', 10, N' Услуги автосервиса\Шиномонтаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (32, N'Замена масла заднего редуктора (моста)', 840.0000, 25200, N'', 25, N' Услуги автосервиса\transmission.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (33, N'Замена подшипника задней ступицы', 1860.0000, 16200, N'', 25, N' Услуги автосервиса\transmission.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (34, N'Восстановление рулевых реек', 1020.0000, 7200, N'', 20, N' Услуги автосервиса\Подвеска.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (35, N'Замена рулевой тяги', 570.0000, 10800, N'', 0, N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (36, N'Ремонт и замена гидроблока АКПП', 2040.0000, 16200, N'', 0, N' Услуги автосервиса\АКПП.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (37, N'Замена масла раздаточной коробки', 2070.0000, 30600, N'', 0, N' Услуги автосервиса\transmission.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (38, N'Диагностика кондиционера', 2590.0000, 36000, N'', 10, N' Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (39, N'Ремонт и замена катализатора', 500.0000, 16200, N'', 25, N' Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (40, N'Замена гофры глушителя', 760.0000, 16200, N'', 25, N' Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (41, N'Замена ремня ГРМ', 4630.0000, 9000, N'', 25, N' Услуги автосервиса\Двигатель.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (42, N'Ремонт редуктора', 870.0000, 28800, N'', 15, N' Услуги автосервиса\КПП.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (43, N'Замена электромагнитного клапана без снятия ТНВД', 4610.0000, 27000, N'', 10, N' Услуги автосервиса\diz.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (44, N'Вулканизация шин', 540.0000, 19800, N'', 20, N' Услуги автосервиса\Шиномонтаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (45, N'Ремонт стартера', 2680.0000, 28800, N'', 0, N' Услуги автосервиса\Электрика.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (46, N'Ремонт коробки передач', 1850.0000, 27000, N'', 25, N' Услуги автосервиса\КПП.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (47, N'Жидкостная промывка топливной системы', 3620.0000, 21600, N'', 15, N' Услуги автосервиса\Топливная система.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (48, N'Ремонт генератора', 1700.0000, 12600, N'', 20, N' Услуги автосервиса\Электрика.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (49, N'Замена масла АКПП', 2430.0000, 27000, N'', 25, N' Услуги автосервиса\АКПП.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (50, N'Диагностика трансмиссии', 2790.0000, 7200, N'', 20, N' Услуги автосервиса\transmission.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (51, N'Монтаж и снятие шин с диска', 3990.0000, 36000, N'', 15, N' Услуги автосервиса\Шиномонтаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (52, N'Замена подшипника передней ступицы', 4020.0000, 19800, N'', 15, N' Услуги автосервиса\transmission.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (53, N'Замена главного цилиндра сцепления', 4910.0000, 9000, N'', 5, N' Услуги автосервиса\Сцепление.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (54, N'Установка автомагнитолы', 3210.0000, 16200, N'', 0, N' Услуги автосервиса\Электрика.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (55, N'Диагностика рулевых тяг', 1680.0000, 10800, N'', 5, N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (56, N'Замена радиатора кондиционера', 1770.0000, 32400, N'', 0, N' Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (57, N'Замена тормозной жидкости', 2200.0000, 21600, N'', 10, N' Услуги автосервиса\Техническое обслуживание.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (58, N'Ремонт рулевого управления', 3440.0000, 7200, N'', 20, N' Услуги автосервиса\Подвеска.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (59, N'Замена заднего редуктора', 2240.0000, 19800, N'', 25, N' Услуги автосервиса\transmission.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (60, N'Дефектация CVT', 1830.0000, 10800, N'', 5, N' Услуги автосервиса\Вариатор.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (61, N'Замена карданного вала', 4450.0000, 7200, N'', 0, N' Услуги автосервиса\transmission.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (62, N'Замена сцепления', 4320.0000, 19800, N'', 0, N' Услуги автосервиса\КПП.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (63, N'Установка системы автозапуска', 3620.0000, 32400, N'', 0, N' Услуги автосервиса\Электрика.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (64, N'Замена опоры АКПП', 2540.0000, 18000, N'', 10, N' Услуги автосервиса\АКПП.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (65, N'Ремонт бензонасоса', 500.0000, 12600, N'', 15, N' Услуги автосервиса\Топливная система.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (66, N'Замена масла переднего редуктора (моста)', 3950.0000, 32400, N'', 5, N' Услуги автосервиса\transmission.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (67, N'Ремонт подвесного подшипника', 4440.0000, 25200, N'', 25, N' Услуги автосервиса\transmission.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (68, N'Тестирование форсунок (стенд)', 1600.0000, 21600, N'', 0, N' Услуги автосервиса\Топливная система.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (69, N'Диагностика сцепления', 4210.0000, 21600, N'', 20, N' Услуги автосервиса\Сцепление.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (70, N'Замена ступицы в сборе', 4250.0000, 9000, N'', 20, N' Услуги автосервиса\transmission.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (71, N'Антибактериальная обработка кондиционера', 4580.0000, 27000, N'', 20, N' Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (72, N'Ремонт глушителя', 2100.0000, 9000, N'', 25, N' Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (73, N'Диагностика рулевого редуктора', 2930.0000, 10800, N'', 10, N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (74, N'Диагностика подвески', 1460.0000, 19800, N'', 0, N' Услуги автосервиса\Подвеска.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (75, N'Замена свечей', 2240.0000, 7200, N'', 10, N' Услуги автосервиса\Техническое обслуживание.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (76, N'Диагностика инжектора', 3390.0000, 19800, N'', 5, N' Услуги автосервиса\Топливная система.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (77, N'Комплексная диагностика автомобиля', 1120.0000, 36000, N'', 0, N' Услуги автосервиса\Техническое обслуживание.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (78, N'Ремонт раздаточной коробки', 3610.0000, 36000, N'', 5, N' Услуги автосервиса\КПП.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (79, N'Удаление катализатора', 1930.0000, 30600, N'', 10, N' Услуги автосервиса\Дополнительные услуги.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (80, N'Снятие/установка форсунок', 1470.0000, 18000, N'', 25, N' Услуги автосервиса\diz.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (81, N'Развал-схождение', 3890.0000, 10800, N'', 0, N' Услуги автосервиса\Подвеска.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (82, N'Замена выжимного подшипника', 2250.0000, 36000, N'', 5, N' Услуги автосервиса\Сцепление.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (83, N'Чистка форсунок ультразвуком', 3920.0000, 14400, N'', 5, N' Услуги автосервиса\Топливная система.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (84, N'Ремонт компрессора кондиционера', 4760.0000, 9000, N'', 25, N' Услуги автосервиса\Кондиционер.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (85, N'Замена цилиндра сцепления', 810.0000, 28800, N'', 25, N' Услуги автосервиса\Сцепление.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (86, N'Ремонт подвески (ходовой)', 680.0000, 10800, N'', 5, N' Услуги автосервиса\Подвеска.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (87, N'Замена фильтров', 530.0000, 12600, N'', 15, N' Услуги автосервиса\Техническое обслуживание.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (88, N'Кузовной ремонт', 2750.0000, 9000, N'', 5, N' Услуги автосервиса\Дополнительные услуги.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (89, N'Замена прокладки приемной трубки', 4680.0000, 34200, N'', 20, N' Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (90, N'Диагностика выхлопной системы автомобиля', 2550.0000, 10800, N'', 25, N' Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (91, N'Балансировка колес', 4690.0000, 23400, N'', 25, N' Услуги автосервиса\Шиномонтаж.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (92, N'Ремонт автоэлектрики', 4230.0000, 27000, N'', 10, N' Услуги автосервиса\Электрика.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (93, N'ТО с сохранением гарантии', 4300.0000, 16200, N'', 20, N' Услуги автосервиса\Техническое обслуживание.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (94, N'Ремонт карданного вала', 780.0000, 12600, N'', 5, N' Услуги автосервиса\transmission.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (95, N'Ремонт сцепления', 3290.0000, 36000, N'', 25, N' Услуги автосервиса\КПП.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (96, N'Замена кулисы АКПП', 3250.0000, 21600, N'', 10, N' Услуги автосервиса\АКПП.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (97, N'Ремонт кронштейна глушителя', 1410.0000, 34200, N'', 0, N' Услуги автосервиса\Выхлопная система.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (98, N'Замена сальника привода', 3820.0000, 34200, N'', 15, N' Услуги автосервиса\transmission.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (99, N'Замена пыльника шруса', 4730.0000, 18000, N'', 0, N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg')
GO
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (100, N'Замена маховика', 2400.0000, 36000, N'', 25, N' Услуги автосервиса\Сцепление.jpg')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [AutoService] SET  READ_WRITE 
GO
