USE [master]
GO
/****** Object:  Database [PetStore]    Script Date: 23/10/2015 3:34:00 PM ******/
CREATE DATABASE [PetStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PetStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PetStore.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PetStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PetStore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PetStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PetStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PetStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PetStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PetStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PetStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PetStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [PetStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PetStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PetStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PetStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PetStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PetStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PetStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PetStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PetStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PetStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PetStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PetStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PetStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PetStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PetStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PetStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PetStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PetStore] SET RECOVERY FULL 
GO
ALTER DATABASE [PetStore] SET  MULTI_USER 
GO
ALTER DATABASE [PetStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PetStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PetStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PetStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PetStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PetStore', N'ON'
GO
USE [PetStore]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 23/10/2015 3:34:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Colors]    Script Date: 23/10/2015 3:34:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 23/10/2015 3:34:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pets]    Script Date: 23/10/2015 3:34:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[Price] [money] NOT NULL,
	[Breed] [nvarchar](30) NULL,
	[ColorId] [int] NOT NULL,
	[SpeciesId] [int] NOT NULL,
 CONSTRAINT [PK_Pets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 23/10/2015 3:34:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Price] [money] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductsSpecies]    Script Date: 23/10/2015 3:34:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsSpecies](
	[ProductId] [int] NOT NULL,
	[SpeciesId] [int] NOT NULL,
 CONSTRAINT [PK_ProductsSpecies] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[SpeciesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Species]    Script Date: 23/10/2015 3:34:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Species](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Species] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Cereal for Dogs')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Cereal for Cats')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name]) VALUES (1, N'black')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (4, N'mixed')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (3, N'red')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (2, N'white')
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name]) VALUES (2, N'Bulgaria')
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Pets] ON 

INSERT [dbo].[Pets] ([Id], [BirthDate], [Price], [Breed], [ColorId], [SpeciesId]) VALUES (3, CAST(N'2015-05-20 00:00:00.000' AS DateTime), 500.0000, N'Angorska', 1, 1)
INSERT [dbo].[Pets] ([Id], [BirthDate], [Price], [Breed], [ColorId], [SpeciesId]) VALUES (5, CAST(N'2015-06-21 00:00:00.000' AS DateTime), 800.0000, N'Karakachanska', 3, 2)
INSERT [dbo].[Pets] ([Id], [BirthDate], [Price], [Breed], [ColorId], [SpeciesId]) VALUES (7, CAST(N'2001-06-01 00:00:00.000' AS DateTime), 200.0000, N'Breed 1', 2, 1)
INSERT [dbo].[Pets] ([Id], [BirthDate], [Price], [Breed], [ColorId], [SpeciesId]) VALUES (8, CAST(N'2013-06-01 00:00:00.000' AS DateTime), 400.0000, N'Breed 2', 1, 2)
INSERT [dbo].[Pets] ([Id], [BirthDate], [Price], [Breed], [ColorId], [SpeciesId]) VALUES (10, CAST(N'2015-06-01 00:00:00.000' AS DateTime), 200.0000, N'Breed 1', 2, 1)
INSERT [dbo].[Pets] ([Id], [BirthDate], [Price], [Breed], [ColorId], [SpeciesId]) VALUES (11, CAST(N'2014-06-01 00:00:00.000' AS DateTime), 900.0000, N'Breed 3', 1, 2)
SET IDENTITY_INSERT [dbo].[Pets] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (1, N'Cereal for dogs  1', 20.0000, 2)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (3, N'Cereal for cats 2', 19.9900, 3)
INSERT [dbo].[Products] ([Id], [Name], [Price], [CategoryId]) VALUES (4, N'New Cereal for cats', 50.0000, 3)
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[ProductsSpecies] ([ProductId], [SpeciesId]) VALUES (1, 1)
INSERT [dbo].[ProductsSpecies] ([ProductId], [SpeciesId]) VALUES (1, 3)
INSERT [dbo].[ProductsSpecies] ([ProductId], [SpeciesId]) VALUES (1, 4)
INSERT [dbo].[ProductsSpecies] ([ProductId], [SpeciesId]) VALUES (2, 3)
SET IDENTITY_INSERT [dbo].[Species] ON 

INSERT [dbo].[Species] ([Id], [Name], [CountryId]) VALUES (1, N'Cat', 2)
INSERT [dbo].[Species] ([Id], [Name], [CountryId]) VALUES (2, N'Dog', 2)
SET IDENTITY_INSERT [dbo].[Species] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Colors]    Script Date: 23/10/2015 3:34:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Colors] ON [dbo].[Colors]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Countries]    Script Date: 23/10/2015 3:34:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Countries] ON [dbo].[Countries]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pets_Birthday]    Script Date: 23/10/2015 3:34:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pets_Birthday] ON [dbo].[Pets]
(
	[BirthDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pets_Price]    Script Date: 23/10/2015 3:34:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pets_Price] ON [dbo].[Pets]
(
	[Price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Species]    Script Date: 23/10/2015 3:34:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Species] ON [dbo].[Species]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pets]  WITH CHECK ADD  CONSTRAINT [FK_Pets_Colors] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([Id])
GO
ALTER TABLE [dbo].[Pets] CHECK CONSTRAINT [FK_Pets_Colors]
GO
ALTER TABLE [dbo].[Pets]  WITH CHECK ADD  CONSTRAINT [FK_Pets_Species] FOREIGN KEY([SpeciesId])
REFERENCES [dbo].[Species] ([Id])
GO
ALTER TABLE [dbo].[Pets] CHECK CONSTRAINT [FK_Pets_Species]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
ALTER TABLE [dbo].[ProductsSpecies]  WITH CHECK ADD  CONSTRAINT [FK_ProductsSpecies_Products] FOREIGN KEY([SpeciesId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductsSpecies] CHECK CONSTRAINT [FK_ProductsSpecies_Products]
GO
ALTER TABLE [dbo].[ProductsSpecies]  WITH CHECK ADD  CONSTRAINT [FK_ProductsSpecies_Species] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Species] ([Id])
GO
ALTER TABLE [dbo].[ProductsSpecies] CHECK CONSTRAINT [FK_ProductsSpecies_Species]
GO
ALTER TABLE [dbo].[Species]  WITH CHECK ADD  CONSTRAINT [FK_Species_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Species] CHECK CONSTRAINT [FK_Species_Countries]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [CK_Category] CHECK  ((datalength([Name])>=(5)))
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [CK_Category]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [CK_Countries] CHECK  ((datalength([Name])>=(5)))
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [CK_Countries]
GO
ALTER TABLE [dbo].[Pets]  WITH CHECK ADD  CONSTRAINT [CK_Pets] CHECK  ((datalength([Breed])>=(5)))
GO
ALTER TABLE [dbo].[Pets] CHECK CONSTRAINT [CK_Pets]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CK_Products] CHECK  ((datalength([Name])>=(5)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Products]
GO
ALTER TABLE [dbo].[Species]  WITH CHECK ADD  CONSTRAINT [CK_Species] CHECK  ((datalength([Name])>=(5)))
GO
ALTER TABLE [dbo].[Species] CHECK CONSTRAINT [CK_Species]
GO
USE [master]
GO
ALTER DATABASE [PetStore] SET  READ_WRITE 
GO
