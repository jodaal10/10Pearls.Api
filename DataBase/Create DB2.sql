USE [master]
GO
/****** Object:  Database [10PearlBDClient]    Script Date: 11/10/2019 12:13:24 p. m. ******/
CREATE DATABASE [10PearlBDClient]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'10PearlBDClient', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\10PearlBDClient.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'10PearlBDClient_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\10PearlBDClient_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [10PearlBDClient] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [10PearlBDClient].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [10PearlBDClient] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [10PearlBDClient] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [10PearlBDClient] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [10PearlBDClient] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [10PearlBDClient] SET ARITHABORT OFF 
GO
ALTER DATABASE [10PearlBDClient] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [10PearlBDClient] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [10PearlBDClient] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [10PearlBDClient] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [10PearlBDClient] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [10PearlBDClient] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [10PearlBDClient] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [10PearlBDClient] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [10PearlBDClient] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [10PearlBDClient] SET  DISABLE_BROKER 
GO
ALTER DATABASE [10PearlBDClient] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [10PearlBDClient] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [10PearlBDClient] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [10PearlBDClient] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [10PearlBDClient] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [10PearlBDClient] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [10PearlBDClient] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [10PearlBDClient] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [10PearlBDClient] SET  MULTI_USER 
GO
ALTER DATABASE [10PearlBDClient] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [10PearlBDClient] SET DB_CHAINING OFF 
GO
ALTER DATABASE [10PearlBDClient] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [10PearlBDClient] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [10PearlBDClient] SET DELAYED_DURABILITY = DISABLED 
GO
USE [10PearlBDClient]
GO
/****** Object:  Table [dbo].[City]    Script Date: 11/10/2019 12:13:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[IdCity] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Comment] [varchar](300) NULL,
	[IdState] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Client]    Script Date: 11/10/2019 12:13:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[IdClient] [int] IDENTITY(1,1) NOT NULL,
	[Nit] [varchar](200) NOT NULL,
	[FullName] [varchar](200) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[IdCity] [int] NOT NULL,
	[CreditLimit] [int] NOT NULL,
	[AvailableCredit] [int] NOT NULL,
	[VisitsPercentage] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 11/10/2019 12:13:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[IdCountry] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Comment] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCountry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SaleRepresentative]    Script Date: 11/10/2019 12:13:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SaleRepresentative](
	[IdSRepresentative] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Phone] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSRepresentative] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State]    Script Date: 11/10/2019 12:13:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[IdState] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Comment] [varchar](300) NULL,
	[IdCountry] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Visit]    Script Date: 11/10/2019 12:13:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Visit](
	[IdVisit] [int] IDENTITY(1,1) NOT NULL,
	[IdClient] [int] NOT NULL,
	[VisitDate] [datetime] NOT NULL,
	[IdSRepresentative] [int] NOT NULL,
	[Net] [int] NULL,
	[VisitTotal] [int] NULL,
	[Description] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVisit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

GO
INSERT [dbo].[City] ([IdCity], [Name], [Comment], [IdState]) VALUES (1, N'Phoenix', N'', 1)
GO
INSERT [dbo].[City] ([IdCity], [Name], [Comment], [IdState]) VALUES (2, N'Sacramento', N'', 2)
GO
INSERT [dbo].[City] ([IdCity], [Name], [Comment], [IdState]) VALUES (3, N'Los Angeles', N'', 2)
GO
INSERT [dbo].[City] ([IdCity], [Name], [Comment], [IdState]) VALUES (4, N'Toronto', N'', 3)
GO
INSERT [dbo].[City] ([IdCity], [Name], [Comment], [IdState]) VALUES (5, N'Montreal', N'', 4)
GO
INSERT [dbo].[City] ([IdCity], [Name], [Comment], [IdState]) VALUES (6, N'Medellin', N'', 5)
GO
INSERT [dbo].[City] ([IdCity], [Name], [Comment], [IdState]) VALUES (7, N'Bucaramanga', N'', 6)
GO
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

GO
INSERT [dbo].[Client] ([IdClient], [Nit], [FullName], [Address], [Phone], [IdCity], [CreditLimit], [AvailableCredit], [VisitsPercentage]) VALUES (1, N'MTA0MDczOTQ2NQ==', N'Jonathan Dávila ', N'Carrera 64 # 25b', N'3005721468', 6, 10, 8, 20)
GO
INSERT [dbo].[Client] ([IdClient], [Nit], [FullName], [Address], [Phone], [IdCity], [CreditLimit], [AvailableCredit], [VisitsPercentage]) VALUES (2, N'MTE1MjQ0NDc4Nw==', N'Cristina Escudero Toro', N'Carrera36 # a', N'30522147474', 3, 12, 8, 10)
GO
INSERT [dbo].[Client] ([IdClient], [Nit], [FullName], [Address], [Phone], [IdCity], [CreditLimit], [AvailableCredit], [VisitsPercentage]) VALUES (3, N'NDM0Njc2OTc=', N'Mery AlzateCardona', N'Carrera', N'34567098', 4, 5, 2, 30)
GO
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

GO
INSERT [dbo].[Country] ([IdCountry], [Name], [Comment]) VALUES (1, N'United States', N'North America')
GO
INSERT [dbo].[Country] ([IdCountry], [Name], [Comment]) VALUES (2, N'Canada', N'North America')
GO
INSERT [dbo].[Country] ([IdCountry], [Name], [Comment]) VALUES (3, N'Colombia', N'South America')
GO
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[SaleRepresentative] ON 

GO
INSERT [dbo].[SaleRepresentative] ([IdSRepresentative], [Name], [Phone]) VALUES (1, N'Nelson Giraldo', N'3117893458')
GO
INSERT [dbo].[SaleRepresentative] ([IdSRepresentative], [Name], [Phone]) VALUES (2, N'Jorbin Solivsky', N'3077893456')
GO
SET IDENTITY_INSERT [dbo].[SaleRepresentative] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

GO
INSERT [dbo].[State] ([IdState], [Name], [Comment], [IdCountry]) VALUES (1, N'Arizona', N'', 1)
GO
INSERT [dbo].[State] ([IdState], [Name], [Comment], [IdCountry]) VALUES (2, N'California', N'', 1)
GO
INSERT [dbo].[State] ([IdState], [Name], [Comment], [IdCountry]) VALUES (3, N'Ontario', N'', 2)
GO
INSERT [dbo].[State] ([IdState], [Name], [Comment], [IdCountry]) VALUES (4, N'Quebec', N'', 2)
GO
INSERT [dbo].[State] ([IdState], [Name], [Comment], [IdCountry]) VALUES (5, N'Antioquia', N'', 3)
GO
INSERT [dbo].[State] ([IdState], [Name], [Comment], [IdCountry]) VALUES (6, N'Santander', N'', 3)
GO
SET IDENTITY_INSERT [dbo].[State] OFF
GO
SET IDENTITY_INSERT [dbo].[Visit] ON 

GO
INSERT [dbo].[Visit] ([IdVisit], [IdClient], [VisitDate], [IdSRepresentative], [Net], [VisitTotal], [Description]) VALUES (1, 3, CAST(N'2019-10-10 00:00:00.000' AS DateTime), 1, 3, 90, N'Sell number one')
GO
INSERT [dbo].[Visit] ([IdVisit], [IdClient], [VisitDate], [IdSRepresentative], [Net], [VisitTotal], [Description]) VALUES (2, 3, CAST(N'2019-10-11 00:00:00.000' AS DateTime), 2, 4, 120, N'Sell number one')
GO
INSERT [dbo].[Visit] ([IdVisit], [IdClient], [VisitDate], [IdSRepresentative], [Net], [VisitTotal], [Description]) VALUES (3, 2, CAST(N'2019-10-01 00:00:00.000' AS DateTime), 1, 3, 30, N'Sell number one')
GO
INSERT [dbo].[Visit] ([IdVisit], [IdClient], [VisitDate], [IdSRepresentative], [Net], [VisitTotal], [Description]) VALUES (4, 2, CAST(N'2019-10-02 00:00:00.000' AS DateTime), 2, 3, 30, N'Sell number two')
GO
INSERT [dbo].[Visit] ([IdVisit], [IdClient], [VisitDate], [IdSRepresentative], [Net], [VisitTotal], [Description]) VALUES (8, 3, CAST(N'2019-10-02 00:00:00.000' AS DateTime), 2, 3, 90, N'Sell number zero')
GO
INSERT [dbo].[Visit] ([IdVisit], [IdClient], [VisitDate], [IdSRepresentative], [Net], [VisitTotal], [Description]) VALUES (10, 1, CAST(N'2019-10-10 00:00:00.000' AS DateTime), 1, 2, 40, N'Sell number one')
GO
INSERT [dbo].[Visit] ([IdVisit], [IdClient], [VisitDate], [IdSRepresentative], [Net], [VisitTotal], [Description]) VALUES (11, 1, CAST(N'2019-10-08 00:00:00.000' AS DateTime), 2, 1, 20, N'Sell number two')
GO
INSERT [dbo].[Visit] ([IdVisit], [IdClient], [VisitDate], [IdSRepresentative], [Net], [VisitTotal], [Description]) VALUES (12, 2, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 5, 50, N'Sell number one')
GO
INSERT [dbo].[Visit] ([IdVisit], [IdClient], [VisitDate], [IdSRepresentative], [Net], [VisitTotal], [Description]) VALUES (13, 2, CAST(N'2019-10-10 00:00:00.000' AS DateTime), 2, 12, 120, N'Sell number zero')
GO
SET IDENTITY_INSERT [dbo].[Visit] OFF
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD FOREIGN KEY([IdState])
REFERENCES [dbo].[State] ([IdState])
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD FOREIGN KEY([IdCity])
REFERENCES [dbo].[City] ([IdCity])
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD FOREIGN KEY([IdCountry])
REFERENCES [dbo].[Country] ([IdCountry])
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD FOREIGN KEY([IdClient])
REFERENCES [dbo].[Client] ([IdClient])
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD FOREIGN KEY([IdSRepresentative])
REFERENCES [dbo].[SaleRepresentative] ([IdSRepresentative])
GO
USE [master]
GO
ALTER DATABASE [10PearlBDClient] SET  READ_WRITE 
GO
