USE [master]
GO
/****** Object:  Database [Gaming]    Script Date: 20/08/20 18:43:46 ******/
CREATE DATABASE [Gaming]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gaming', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Gaming.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Gaming_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Gaming_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gaming].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gaming] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gaming] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gaming] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gaming] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gaming] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gaming] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gaming] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gaming] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gaming] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gaming] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gaming] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gaming] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gaming] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gaming] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gaming] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Gaming] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gaming] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gaming] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gaming] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gaming] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gaming] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gaming] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gaming] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Gaming] SET  MULTI_USER 
GO
ALTER DATABASE [Gaming] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gaming] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gaming] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gaming] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Gaming] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER AUTHORIZATION ON DATABASE::[Gaming] TO [DESKTOP-B4N0S56\BS-Dev]
GO
USE [Gaming]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 20/08/20 18:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AcctId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AcctId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Account] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[AccountInfo]    Script Date: 20/08/20 18:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AcctId] [int] NOT NULL,
	[Currency] [varchar](10) NOT NULL,
	[Balance] [money] NOT NULL,
	[SiteId] [varchar](10) NULL,
 CONSTRAINT [PK_AccountInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[AccountInfo] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[SpecialGame]    Script Date: 20/08/20 18:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialGame](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](30) NULL,
	[Count] [int] NULL,
	[Sequence] [int] NULL,
 CONSTRAINT [PK_SpecialGame] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[SpecialGame] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Token]    Script Date: 20/08/20 18:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AcctId] [int] NOT NULL,
	[Token] [varchar](128) NOT NULL,
	[SerialNo] [varchar](128) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Token] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Token] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Transfers]    Script Date: 20/08/20 18:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transfers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TransferId] [varchar](50) NOT NULL,
	[AcctId] [int] NOT NULL,
	[Currency] [varchar](3) NOT NULL,
	[Amount] [decimal](20, 9) NOT NULL,
	[Type] [int] NOT NULL,
	[Channel] [varchar](10) NOT NULL,
	[GameCode] [varchar](10) NOT NULL,
	[TicketId] [varchar](20) NULL,
	[SpecialGameId] [int] NULL,
	[ReferenceId] [varchar](50) NULL,
 CONSTRAINT [PK_Transfers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Transfers] TO  SCHEMA OWNER 
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AcctId], [UserName]) VALUES (1, N'alex')
INSERT [dbo].[Account] ([AcctId], [UserName]) VALUES (2, N'alexskd')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountInfo] ON 

INSERT [dbo].[AccountInfo] ([Id], [AcctId], [Currency], [Balance], [SiteId]) VALUES (1, 1, N'USD', 99920.0000, N'AB1')
INSERT [dbo].[AccountInfo] ([Id], [AcctId], [Currency], [Balance], [SiteId]) VALUES (2, 2, N'EUR', 400.0000, N'CA2')
SET IDENTITY_INSERT [dbo].[AccountInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[SpecialGame] ON 

INSERT [dbo].[SpecialGame] ([id], [Type], [Count], [Sequence]) VALUES (1, N'Free', 10, 1)
SET IDENTITY_INSERT [dbo].[SpecialGame] OFF
GO
SET IDENTITY_INSERT [dbo].[Token] ON 

INSERT [dbo].[Token] ([Id], [AcctId], [Token], [SerialNo], [IsActive]) VALUES (2, 1, N'4f4167e6-3905-4da3-8fc7-979b7333b4fa', N'91df2f4f-6098-46ac-b124-03fce42dbadf', 1)
INSERT [dbo].[Token] ([Id], [AcctId], [Token], [SerialNo], [IsActive]) VALUES (3, 2, N'ce3842cc-04b6-4953-9772-dd0cb9f3b0fb', N'6db83db7-7883-4d40-a0b7-4e27590508d0', 1)
SET IDENTITY_INSERT [dbo].[Token] OFF
GO
SET IDENTITY_INSERT [dbo].[Transfers] ON 

INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (4, N'bf272c36-7e0d-45b3-a77f-98e2bf9a8fba', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (5, N'3aebbead-f01a-4743-8ead-25857e54a769', 1, N'USD', CAST(50.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (6, N'd5b23053-880d-4d75-b043-4cdb15e5ca11', 2, N'EUR', CAST(50.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (7, N'3f6a3cb0-2ca7-4196-8bd6-0fdb2b47456d', 2, N'EUR', CAST(50.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (8, N'0a346c2a-c733-4320-8903-d2039a39c060', 1, N'USD', CAST(50.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (9, N'e9d521a7-50ee-44bd-bf58-2e30662b11ee', 1, N'USD', CAST(50.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (10, N'952ba8b4-5692-43c1-be4f-7acf3ea94f56', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (11, N'78c51e75-70ae-45ec-9840-070d1b7f5c34', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (12, N'f3b8c260-a767-4fd0-a743-a3fded1171e3', 1, N'USD', CAST(50.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (13, N'e16f7386-e070-49c9-a0ab-0d653bcdad11', 1, N'USD', CAST(50.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (14, N'24d97e76-9fa3-4029-ad45-98e9baf6cd4d', 1, N'USD', CAST(50.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (15, N'957161c1-f6ee-4e90-829e-5070fce1f45d', 1, N'USD', CAST(500.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (16, N'c85dcb0f-6aab-4bcf-959a-96221f0b6ccf', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (17, N'323a8262-faa8-428a-81b4-5bb27817674e', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (18, N'e3651000-9c69-468f-a983-f5aa85b75ff9', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (19, N'f75fd45f-1825-432d-b8be-0f0de797ed37', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (20, N'f83b2c20-a43c-4b58-805a-c1d303aaa440', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (21, N'c3d5ef0a-c506-4fb3-97c9-f1ffb8021dc6', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (22, N'711130fd-0718-4e54-8c53-9df534a38a2e', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (23, N'3c59005d-77ec-4318-b69b-0c6fc141b2ab', 1, N'USD', CAST(150.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (24, N'bfb7413a-6a74-4102-9f86-a28c93235e1f', 1, N'usd', CAST(150.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (25, N'cbd6ed11-f087-4795-a36a-e412cd838c0e', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (26, N'fe53d777-aa83-4022-b8a7-bca579816589', 1, N'USD', CAST(1100.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (27, N'25f0b130-5f95-4356-b527-06532246e652', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (28, N'a2650659-161a-461d-b176-f862360961e3', 1, N'USD', CAST(200.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (29, N'2df203dc-122c-4335-b971-960c29bf7b37', 1, N'USD', CAST(200.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (30, N'19a1c9d8-3bd3-4550-94d2-d8d0135be8a7', 1, N'USD', CAST(200.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (31, N'c27c6719-f265-4e1e-b16f-8e250c1a8a7e', 1, N'USD', CAST(200.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (32, N'dbfc5344-403f-43e9-b0ab-d4e228401a0d', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (33, N'119f0065-86dc-4646-9423-bddef19c36a6', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (34, N'170824de-dd50-4acd-aced-cc1829bc7182', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (35, N'92ee4372-afbd-454d-86f5-bad9822f9240', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (39, N'cec0e09f-96a5-44e4-9814-33c160fb1b8d', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (40, N'ca99cf48-da2a-4b33-bb75-ece553a42119', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (41, N'2e24e639-e50c-4249-a984-69653e0e2394', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (43, N'bc94ded8-d411-4abb-be56-be92d07ce8a2', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (44, N'eabebc55-ee26-4eb8-bc15-5badee430bcb', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (45, N'75d24ad5-1754-465d-883b-868e6a16a4a5', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (46, N'668f1ade-acd4-4054-811d-97b3be2812e3', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (47, N'5601bca7-f534-44e8-9f1b-e82ec376e4b3', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (48, N'dd0f2771-6ac7-4e67-8ee5-fbe18153984e', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (49, N'd3c0dee5-86f5-4676-b5d4-59f3fa8138a0', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (50, N'bcbe4008-4880-42f5-85dc-64304afd44f1', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (51, N'15d736cc-a258-486b-8afe-d706e51088b4', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (52, N'80aefba2-2610-4ade-b0ff-7e5227ea2e73', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (53, N'664fd4ab-a062-4bd8-b244-56d0b5be629d', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (54, N'0bd7a740-748d-41bc-a9cb-a1de14887cbe', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (55, N'30d8225a-8d59-4f19-9285-e73237d586c6', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (56, N'558d4b46-f581-43b3-9093-e1cc3b034ce4', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (57, N'5c86af1e-6d51-44fd-a9a7-781e0ee14201', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (58, N'c3167f24-4467-405f-acdb-5f6da72654b6', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (59, N'cc838112-39e6-48a4-a819-93a254319d6a', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (60, N'6779d11d-5650-4f5a-92e8-f9e7ceb2609c', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (61, N'fa779fe3-a447-4af3-8166-fa607135ed73', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (62, N'c7aaa930-5989-4eee-974b-b8dfe0e3a248', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (63, N'c1ce9862-b4a2-4744-b17f-03c614723a59', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (64, N'a2778ca3-8046-4dbb-85db-90b86c87bc62', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (65, N'b63339ca-d90f-4073-91ae-e813281ba9c0', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (66, N'196c953b-b453-44ef-b73c-896750b20871', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (67, N'86b8dfe1-c88e-4f0b-aac2-01548d107278', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (68, N'ce32026f-e1dc-47bd-ba4d-7f4dbdf7175c', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (69, N'1da42655-68f2-475d-b542-afb0330a7c5d', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (70, N'4b20fbcc-f3f5-443f-a837-8b21d1309fc5', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (72, N'1a8c3d13-7776-424a-8a74-2dff46545649', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (73, N'86cf94ca-ba76-4119-9e5e-305e09c22b9f', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (74, N'385b1c7f-e2f1-4bf8-9aa1-12a3b1178cfe', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (78, N'6C8D4F4D-BB46-4393-8BB6-488BD8FA147C', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (79, N'20FA7A06-D4CC-43C4-856B-3F2A87DC99CE', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (80, N'e4cce5bd-f466-45d4-b45c-9eb1aa07d147', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (81, N'7BF5309F-678E-4800-AD3A-D20EF2076208', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (82, N'16A3EDC3-6CDE-44FC-B061-A595049C77B3', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (83, N'A50CDD73-CDF7-418B-A57C-2481B0A7EAF4', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (84, N'5190C5FA-91ED-4FC7-9434-203381067CD6', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N's-gd2', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (85, N'6691850F-2849-41B2-A55D-A95A0016D8D0', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (86, N'021E8CF8-8A89-480F-A16D-7DA00235A516', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (87, N'EF692E09-AAD6-4110-9BD4-23A6CA1BEB95', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (88, N'1ADAB96C-E054-4C51-AFF6-6CEFBCABDCB0', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (89, N'3BE29F85-CA91-449F-9007-AB1C7CEE7DFB', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (90, N'5DB4D978-202E-4A99-B568-0D10C4EB0C24', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'D117703A-9593-450E-883C-0278F980263E')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (91, N'71D0A789-5782-404A-B344-11EE52EC1F79', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'7685C2DC-E4D9-4465-A267-A9319AA15346')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (92, N'A6B0E8B8-BEE8-4F50-9C5B-81414CD53EDC', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'0ADC7A5E-A3C4-4333-BA44-CC6A03E658C1')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (93, N'8F4579D6-AB67-4133-A779-DCA93011218E', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'8980612C-DD8C-4BB5-8656-F22C4FBEDA20')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (94, N'E7CB9716-2C4E-4487-8C2C-412AB1A0DF20', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'8B2FCFCD-E6FF-4144-A2CD-43324018C249')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (95, N'0257296D-C803-4844-B2CA-DADF5DB002C9', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'BA4618C8-6C91-46D5-8A8C-E3A156D7D28B')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (96, N'780F99F9-187C-4DD7-B2DF-A73BAB72C251', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'8A3C709C-9C1C-486B-8D82-4D28599D752C')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (97, N'7AF33F4F-4169-4605-8B2F-BFD01CD25D25', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'B914F299-2C7E-46BA-8384-EAD7A831CBC1')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (98, N'E4260373-67BD-4F88-BC4E-EA3044E8A284', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'A4BB6A8E-9309-4A97-929D-E1729615F201')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (99, N'32589233-5134-4C68-9544-7AA410BAB945', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'CCB9B6A8-0EDA-443E-B3CE-A2BB2A6BC533')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (100, N'7F7FE37D-9C61-4AD7-B69E-9CBC9F279AAC', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'F51835E3-D75A-4F38-A39F-A3A83C91924E')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (101, N'56182E7F-B338-4811-9044-EE7609138E2C', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'9DF9F02E-B977-4BC6-8E7A-5FEDA26224D4')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (102, N'FA411AB6-E760-4C25-AA7B-5C062CE1F046', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'808AB5DF-6E01-4832-914C-8371C8BBC54B')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (103, N'6A822F3C-487D-4F5E-A400-70B04B847EA1', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'D9D72D40-61FF-42AE-A3E7-FEBE8281340E')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (104, N'9F1F0197-3BE7-42DE-91EA-42C174F3A3F6', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'7752E3DE-1D73-44A9-8905-BB7E6F4E35B7')
SET IDENTITY_INSERT [dbo].[Transfers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Transfer__9549009034ED6079]    Script Date: 20/08/20 18:43:46 ******/
ALTER TABLE [dbo].[Transfers] ADD  CONSTRAINT [UQ__Transfer__9549009034ED6079] UNIQUE NONCLUSTERED 
(
	[TransferId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountInfo]  WITH CHECK ADD  CONSTRAINT [FK_AccountInfo_Account] FOREIGN KEY([AcctId])
REFERENCES [dbo].[Account] ([AcctId])
GO
ALTER TABLE [dbo].[AccountInfo] CHECK CONSTRAINT [FK_AccountInfo_Account]
GO
ALTER TABLE [dbo].[Token]  WITH CHECK ADD  CONSTRAINT [FK_Token_Account] FOREIGN KEY([AcctId])
REFERENCES [dbo].[Account] ([AcctId])
GO
ALTER TABLE [dbo].[Token] CHECK CONSTRAINT [FK_Token_Account]
GO
ALTER TABLE [dbo].[Transfers]  WITH CHECK ADD  CONSTRAINT [FK_Transfer_Account] FOREIGN KEY([AcctId])
REFERENCES [dbo].[Account] ([AcctId])
GO
ALTER TABLE [dbo].[Transfers] CHECK CONSTRAINT [FK_Transfer_Account]
GO
ALTER TABLE [dbo].[Transfers]  WITH CHECK ADD  CONSTRAINT [FK_Transfer_SpecialGame] FOREIGN KEY([SpecialGameId])
REFERENCES [dbo].[SpecialGame] ([id])
GO
ALTER TABLE [dbo].[Transfers] CHECK CONSTRAINT [FK_Transfer_SpecialGame]
GO
/****** Object:  StoredProcedure [dbo].[AuthorizeAccount]    Script Date: 20/08/20 18:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AuthorizeAccount]
    @AcctId INT,
    @token VARCHAR(128)
AS
SELECT a.AcctId AS AccountID,
       a.UserName,
       ai.AcctId,
       ai.Balance,
       ai.Currency,
       ai.SiteId,
       t.Token
FROM Account AS a
    JOIN AccountInfo AS ai
        ON a.AcctId = ai.AcctId
    JOIN Token AS t
        ON a.AcctId = t.AcctId
WHERE ai.AcctId = @AcctId
      AND t.Token = @token
      AND t.IsActive = 1;
GO
ALTER AUTHORIZATION ON [dbo].[AuthorizeAccount] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[CancelBet]    Script Date: 20/08/20 18:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CancelBet]
    @TransferId VARCHAR(50),
    @AcctId INT,
    @Currency VARCHAR(3),
    @Amount DECIMAL(20, 9),
    @Type INT
AS
BEGIN
    BEGIN TRY
        DECLARE @retVal INT;
        BEGIN TRANSACTION;
        IF (
           (
               SELECT Type
               FROM Transfers
               WHERE TransferId = @TransferId
                     AND AcctId = @AcctId
                     AND Currency = @Currency
                     AND Amount = @Amount
           ) <> 2
           )
        BEGIN
            UPDATE Transfers
            SET Type = @Type
            WHERE TransferId = @TransferId
                  AND AcctId = @AcctId
                  AND Currency = @Currency
                  AND Amount = @Amount;
            UPDATE AccountInfo
            SET Balance = Balance + @Amount
            WHERE AcctId = @AcctId;
            SET @retVal = 0;
        END;
        ELSE
            SET @retVal = 109;
        COMMIT TRANSACTION;
        RETURN @retVal;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
    END CATCH;
END;
GO
ALTER AUTHORIZATION ON [dbo].[CancelBet] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[GetBalance]    Script Date: 20/08/20 18:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBalance]
    @AcctId INT,
    @Currency VARCHAR(3)
AS
SELECT a.AcctId,
       a.UserName,
       ai.Balance,
       ai.Currency
FROM Account AS a
    JOIN AccountInfo AS ai
        ON a.AcctId = ai.AcctId
WHERE a.AcctId = @AcctId
      AND ai.Currency = @Currency;
GO
ALTER AUTHORIZATION ON [dbo].[GetBalance] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[GetLastTransactionId]    Script Date: 20/08/20 18:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastTransactionId] @AcctId INT
AS
SELECT TransferId
FROM Transfers
WHERE id =
(
    SELECT MAX(id) FROM Transfers
)
      AND AcctId = 1;
GO
ALTER AUTHORIZATION ON [dbo].[GetLastTransactionId] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[Transaction]    Script Date: 20/08/20 18:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Transaction]
    @TransferId UNIQUEIDENTIFIER OUTPUT,
    @AcctId INT,
    @Currency VARCHAR(3),
    @Amount DECIMAL(20, 9),
    @Type INT,
    @Channel VARCHAR(10),
    @GameCode VARCHAR(10),
    @TicketId VARCHAR(20),
    @SpecialGameId INT,
    @ReferenceId VARCHAR(128)
AS
BEGIN TRY
    BEGIN TRANSACTION;
    DECLARE @guid UNIQUEIDENTIFIER = NEWID();
    SET @TransferId = @guid;

    IF (EXISTS (SELECT 1 FROM Transfers WHERE ReferenceId = @ReferenceId))
    BEGIN
        ROLLBACK;
        RETURN -2;
    END;

    INSERT INTO Transfers
    VALUES
    (@TransferId, @AcctId, @Currency, @Amount, @Type, @Channel, @GameCode, @TicketId, @SpecialGameId, @ReferenceId);
    IF @Type = 1
        UPDATE AccountInfo
        SET Balance = Balance - @Amount
        WHERE AcctId = @AcctId;
    ELSE IF @Type = 4
        UPDATE AccountInfo
        SET Balance = Balance + @Amount
        WHERE AcctId = @AcctId;
    COMMIT TRANSACTION;
    RETURN 0;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    RETURN -1;
END CATCH;
GO
ALTER AUTHORIZATION ON [dbo].[Transaction] TO  SCHEMA OWNER 
GO
USE [master]
GO
ALTER DATABASE [Gaming] SET  READ_WRITE 
GO
