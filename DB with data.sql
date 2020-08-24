USE [master]
GO
/****** Object:  Database [Gaming]    Script Date: 24/08/20 18:57:08 ******/
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
USE [Gaming]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 24/08/20 18:57:08 ******/
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
/****** Object:  Table [dbo].[AccountInfo]    Script Date: 24/08/20 18:57:08 ******/
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
/****** Object:  Table [dbo].[SpecialGame]    Script Date: 24/08/20 18:57:08 ******/
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
/****** Object:  Table [dbo].[Token]    Script Date: 24/08/20 18:57:08 ******/
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
/****** Object:  Table [dbo].[Transfers]    Script Date: 24/08/20 18:57:08 ******/
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
	[ReferenceId] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Transfers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AcctId], [UserName]) VALUES (1, N'alex')
INSERT [dbo].[Account] ([AcctId], [UserName]) VALUES (2, N'alexskd')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountInfo] ON 

INSERT [dbo].[AccountInfo] ([Id], [AcctId], [Currency], [Balance], [SiteId]) VALUES (1, 1, N'USD', 99930.0000, N'AB1')
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

INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (90, N'5DB4D978-202E-4A99-B568-0D10C4EB0C24', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'D117703A-9593-450E-883C-0278F980263E')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (91, N'71D0A789-5782-404A-B344-11EE52EC1F79', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'7685C2DC-E4D9-4465-A267-A9319AA15346')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (92, N'A6B0E8B8-BEE8-4F50-9C5B-81414CD53EDC', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'0ADC7A5E-A3C4-4333-BA44-CC6A03E658C1')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (93, N'8F4579D6-AB67-4133-A779-DCA93011218E', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'8980612C-DD8C-4BB5-8656-F22C4FBEDA20')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (94, N'E7CB9716-2C4E-4487-8C2C-412AB1A0DF20', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'8B2FCFCD-E6FF-4144-A2CD-43324018C249')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (95, N'0257296D-C803-4844-B2CA-DADF5DB002C9', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'BA4618C8-6C91-46D5-8A8C-E3A156D7D28B')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (96, N'780F99F9-187C-4DD7-B2DF-A73BAB72C251', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'8A3C709C-9C1C-486B-8D82-4D28599D752C')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (97, N'7AF33F4F-4169-4605-8B2F-BFD01CD25D25', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'B914F299-2C7E-46BA-8384-EAD7A831CBC1')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (98, N'E4260373-67BD-4F88-BC4E-EA3044E8A284', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'A4BB6A8E-9309-4A97-929D-E1729615F201')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (99, N'32589233-5134-4C68-9544-7AA410BAB945', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'CCB9B6A8-0EDA-443E-B3CE-A2BB2A6BC533')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (100, N'7F7FE37D-9C61-4AD7-B69E-9CBC9F279AAC', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'F51835E3-D75A-4F38-A39F-A3A83C91924E')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (101, N'56182E7F-B338-4811-9044-EE7609138E2C', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'9DF9F02E-B977-4BC6-8E7A-5FEDA26224D4')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (102, N'FA411AB6-E760-4C25-AA7B-5C062CE1F046', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'808AB5DF-6E01-4832-914C-8371C8BBC54B')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (103, N'6A822F3C-487D-4F5E-A400-70B04B847EA1', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'D9D72D40-61FF-42AE-A3E7-FEBE8281340E')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (104, N'9F1F0197-3BE7-42DE-91EA-42C174F3A3F6', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'7752E3DE-1D73-44A9-8905-BB7E6F4E35B7')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (105, N'C3D159C1-7294-401F-84A7-FD06F542A577', 1, N'USD', CAST(100.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'579DBE1B-AFC9-4D85-94BF-79E4E5A294BB')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (106, N'C90F1230-88BC-4633-A23A-3D9B19196201', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'49B1B9FD-2F62-4A59-9037-0D4D43E9BA4E')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (107, N'E72A2E1A-1CE2-4813-8486-AC88AE82B081', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'950A6DC3-0220-40ED-9C1C-ACCFE443973D')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (108, N'0BF0C829-661E-4780-9973-8B8973082C48', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'7179C524-9419-46AD-BC0D-E4D50CA1CB64')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (109, N'279CC720-0309-4286-AEAC-14B04AC129D4', 1, N'usd', CAST(100.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'0FB8BBFC-290F-40A7-8AED-BA7013CF8229')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (110, N'F2D7F7D9-2242-445F-A767-11199D9E280F', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'627DD48A-86DD-41E8-B345-1D6373A795EB')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (111, N'175814AC-72DA-43D2-913C-9A9B09104E74', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'24557006-4430-4A79-9F1A-B105F55F2B28')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (112, N'CACE7AF5-8057-45EC-B481-08BCEF8E9021', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'A78A8A49-BD12-455C-B52E-7C4AB948F8A7')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (113, N'EFAC8643-F6BF-4273-8011-A76357E7F0D2', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'9142CC73-2F2D-4B65-9134-5DD23E8B01A5')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (114, N'D13B9592-1470-4644-BB18-80E87A02078F', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'363F41A6-FF04-49F6-9903-AC23D74FF22D')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (115, N'FB8DD926-5260-47AB-BA9A-876C1E616417', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'260AE40A-3834-4025-8A45-DCB4D219C201')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (116, N'CDC7DA2D-A3A4-4819-BD9D-C1D657B5033F', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'F389EC79-387E-4BBF-83D3-DBB590C078B5')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (117, N'640B0A45-A887-4F60-9B9C-8E5C3181A6D6', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'4D306D87-E98E-457A-B1AD-DF49011B7275')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (118, N'6D43FD35-9DD0-437C-9174-7606DD82D4E3', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'1E50414E-4CC4-4971-B681-087BE0A72B7F')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (119, N'73B89DBF-BE4D-4AD3-8329-2C4C19B9EAC0', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'84402C72-4354-4D13-AED4-2DD8C045A16D')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (120, N'A87F95F8-D214-4BA2-BEA0-47EAAFE327F7', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'01AE5DA7-2C6E-4370-8BEA-BF81F7DC34F8')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (121, N'1F5B1035-780C-452A-84B3-2BB4266B1F75', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'FD4454E8-0B26-490B-A0A7-308474854CF8')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (122, N'0E0CB4BE-CE39-42E0-AEB3-ABB9DAD83ECF', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'0A043CB4-5F51-491B-9164-FCC272C986A2')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (123, N'E4F2DF95-32C5-4F23-B6F7-F7F5C23C7487', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'4380B449-67DF-42EE-B5DC-3F370DB39B85')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (124, N'06C12240-9131-4DF3-BD92-7F9DABA7119A', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'5DC3EF4F-7EED-4A67-9761-5B4D12427D7E')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (125, N'DF80A2E5-DBD2-426A-9827-78B80B17F04E', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'6156B1A9-8DAA-4A97-8296-815A3C6B5372')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (126, N'67898452-720E-42A1-ACB3-CC89564C2803', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'3D2C5C72-263C-4ACE-91A3-02EAB898CAD3')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (127, N'BA2B3DAC-F01C-4D33-8676-217E0754AEFE', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'3BD6DC31-38EF-4B36-8A97-2DF2CE73EC55')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (128, N'A7668161-CEC6-4A15-B4BD-2A0542B16C84', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'DBBF0A7B-E9BA-434A-91BA-867159BC96D1')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (129, N'52FB8354-7D8A-491F-A2F9-D216E334BB6F', 1, N'usd', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'9B3E0454-C186-476E-9950-71F9E0134E59')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (130, N'CBF03EA5-3921-4A4C-801C-C788873B7F98', 1, N'usd', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'1BEBD2BD-E64E-41DB-94B4-CC43BE62D895')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (131, N'939F4A3A-2C82-423D-9CCB-3998AF16BA19', 1, N'usd', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'5B48D862-59A3-4178-AB4E-315FF35BABDD')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (132, N'9ABA3986-40AA-4BC2-B882-D578905A8E8A', 1, N'usd', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'AA2FA441-0FF3-4F1C-8168-9292B8AFEEAB')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (133, N'5CA85B05-ECFF-4962-BB3B-A10E84BE77BF', 1, N'usd', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'255F963D-7F52-4625-9474-4D678095A8A6')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (134, N'3675A516-F5E3-48CE-A553-C315EBF9A0EC', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'F21CA82E-151B-47B4-96A7-6D274252AF8D')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (135, N'82B5787D-6AD5-435C-8B49-2A75EEC89266', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'EF519B55-A995-4568-A27D-294B60FEC1D2')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (136, N'0003173B-5F67-42EC-8F6A-D575BEADBD44', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'4FC74D8C-451D-4886-B49D-7F286AE53597')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (137, N'ED3C53A1-C96C-4ECA-9436-6C9A46C7638E', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'CB3BFB4F-A5FD-4FC3-83D6-352E75DE640F')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (138, N'4772E309-1201-4E81-885C-8B626B79EE34', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'0E448268-4142-4618-886C-BEA6D4272538')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (139, N'A0EC4DFC-4604-4B8D-937D-16A43A06ED83', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'DB399D4E-52A1-4B8E-BAAA-563E40FF605C')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (140, N'6CB154F0-BE23-463A-9099-BC8231BA13AB', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'282A137E-F89E-421F-8231-B5D69518CDD4')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (141, N'060A70FE-95A9-423C-8E39-0A2ECE88B66A', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'411DD915-A3F0-49A2-B722-FD54163893D8')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (142, N'F8DD2476-BC35-4ACC-A1E5-403BE1EB0837', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'5411FD82-F0CE-405B-A60B-2C690C3D7C6F')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (143, N'C66DBBE8-0D72-4AF1-9467-5AFEF9A4D6CE', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'CBFCCC40-2038-45A7-8041-5AC4CC6B097B')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (144, N'73C0233C-0BDC-4998-A085-79AB78E6B8E4', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'0329D61D-F515-4A08-874E-4157B3513F90')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (145, N'B0D4D057-6476-4805-A54A-15A6AA69A319', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'22BBA55B-73BB-4D01-929B-27AA8D1264A1')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (146, N'A8056A05-6157-4149-AE5C-A0614DAEDEF8', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'9E2276B8-27E4-4964-BAC3-8918DDBB5285')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (147, N'E49D731D-A0BF-4481-BA99-FB5FCE75FD30', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'C0C60FCC-CC1C-45DC-9A75-AEE346334A0C')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (148, N'C720CA96-3552-4504-B562-4E9BE21224E9', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e60')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (149, N'417503CE-E00B-4A17-83A5-8FFE8F183E06', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468e6a')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (150, N'33A3D39E-E5FB-467A-9FBC-58DB0C762E76', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468ea')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (151, N'995BE4C4-9EA4-4FD8-A39E-84D4EE981BBE', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c14811b24653468ea')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (152, N'99109AAC-4159-455A-BBB5-40228C1C0A98', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 4, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c1481b24653468ea')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (153, N'80C868CC-DA8F-44D5-8B9D-B0770C94E597', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c1481b24653468ea')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (154, N'F22DF2B7-C5E0-4DE4-8944-FF550C6A7026', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 2, N'Web', N'dfdf111', N'wdudihfff', 1, N'dmhei3e3iebdek')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (155, N'D754244C-B418-4EC4-9214-E02B0F81F17F', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'dfdf111', N'wdudihfff', 1, N'dmhei3e3iebdek')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (156, N'868CC-D1118F-44D5-859D-B077094E597', 1, N'USD', CAST(0.000000000 AS Decimal(20, 9)), 2, N'Web', N'SD-02', N'igdivuw2w2', 1, N'232eidbibio')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (157, N'868CC-D118F-44D5-859D-B077094E597', 1, N'USD', CAST(0.000000000 AS Decimal(20, 9)), 2, N'Web', N'SD-02', N'igdivuw2w2', 1, N'232eidbibio')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (158, N'4D911928-5BBA-4ABE-A122-24E3D19CA73F', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c1481b241653468ea')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (159, N'EEF93421-91E9-4FFD-A27B-B48E7E4A2DA2', 1, N'USD', CAST(10.000000000 AS Decimal(20, 9)), 1, N'Web', N'S-DG02', N'234950357', 1, N'dfffdca06c1hjh481b241653468ea')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (163, N'9FE53078-BBC8-4AF5-AFA2-CE4B5D04C593', 1, N'USD', CAST(0.000000000 AS Decimal(20, 9)), 2, N'Web', N'SD-02', N'igdivuw2w2', 1, N'dsdfdfftrt4r')
INSERT [dbo].[Transfers] ([id], [TransferId], [AcctId], [Currency], [Amount], [Type], [Channel], [GameCode], [TicketId], [SpecialGameId], [ReferenceId]) VALUES (166, N'E790DDF6-31F4-4C60-BAD7-E6C17D0A2F24', 1, N'USD', CAST(0.000000000 AS Decimal(20, 9)), 2, N'Web', N'SD-02', N'igdivuw2w2', 1, N'ndfdbfudfvj')
SET IDENTITY_INSERT [dbo].[Transfers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Transfer__9549009034ED6079]    Script Date: 24/08/20 18:57:08 ******/
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
/****** Object:  StoredProcedure [dbo].[AuthorizeAccount]    Script Date: 24/08/20 18:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AuthorizeAccount]
    @AcctId INT,
    @token VARCHAR(128)
AS
BEGIN
SELECT a.AcctId AS AccountID,
       a.UserName,
       ai.AcctId,
       ai.Balance,
       ai.Currency,
       ai.SiteId,
       t.Token
FROM dbo.Account AS a
    JOIN dbo.AccountInfo AS ai
        ON a.AcctId = ai.AcctId
    JOIN dbo.Token AS t
        ON a.AcctId = t.AcctId
WHERE ai.AcctId = @AcctId
      AND t.Token = @token
      AND t.IsActive = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[CancelBet]    Script Date: 24/08/20 18:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CancelBet]
    @ReferenceId VARCHAR(50),
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
               FROM dbo.Transfers
               WHERE ReferenceId = @ReferenceId
                     AND AcctId = @AcctId
                     AND Currency = @Currency
                     AND Amount = @Amount
           ) <> 2
           )
        BEGIN
            UPDATE dbo.Transfers
            SET Type = @Type
            WHERE ReferenceId = @ReferenceId
                  AND AcctId = @AcctId
                  AND Currency = @Currency
                  AND Amount = @Amount;
            UPDATE dbo.AccountInfo
            SET Balance = Balance + @Amount
            WHERE AcctId = @AcctId;
            SET @retVal = 0;
        END;
        ELSE
		BEGIN
            SET @retVal = 10105;
		END
        COMMIT TRANSACTION;
        RETURN @retVal;
    END TRY
    BEGIN CATCH
		SET @retVal = -1;
        ROLLBACK TRANSACTION;
		RETURN @retVal;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[CancelledBet]    Script Date: 24/08/20 18:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CancelledBet]
	@TransferId UNIQUEIDENTIFIER OUTPUT,
    @ReferenceId VARCHAR(128),
    @AcctId INT,
    @Amount DECIMAL(20, 9),
    @Currency VARCHAR(3),
    @Type INT
AS
BEGIN
    DECLARE @RetVal INT;
    BEGIN TRY
        BEGIN TRANSACTION;
        DECLARE @guid UNIQUEIDENTIFIER = NEWID();
        SET @TransferId = @guid;

        INSERT INTO dbo.Transfers
        (
            TransferId,
            AcctId,
            Currency,
            Amount,
            Type,
            Channel,
            GameCode,
            TicketId,
            SpecialGameId,
            ReferenceId
        )
        VALUES
        (@TransferId, @AcctId, @Currency, 0, 2, 'Web', 'SD-02', 'igdivuw2w2', 1, @ReferenceId);
        SET @RetVal = 110;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @RetVal = -1;
    END CATCH;
    RETURN @RetVal;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetBalance]    Script Date: 24/08/20 18:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBalance]
    @AcctId INT,
    @Currency VARCHAR(3)
AS
BEGIN
SELECT a.AcctId,
       a.UserName,
       ai.Balance,
       ai.Currency
FROM dbo.Account AS a
    JOIN dbo.AccountInfo AS ai
        ON a.AcctId = ai.AcctId
WHERE a.AcctId = @AcctId
      AND ai.Currency = @Currency;
END
GO
/****** Object:  StoredProcedure [dbo].[Transaction]    Script Date: 24/08/20 18:57:08 ******/
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
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        DECLARE @guid UNIQUEIDENTIFIER = NEWID();
        SET @TransferId = @guid;

        IF (EXISTS (SELECT 1 FROM dbo.Transfers WHERE ReferenceId = @ReferenceId))
        BEGIN
            ROLLBACK;
            RETURN 110;
        END;
            INSERT INTO dbo.Transfers
            (
                TransferId,
                AcctId,
                Currency,
                Amount,
                Type,
                Channel,
                GameCode,
                TicketId,
                SpecialGameId,
                ReferenceId
            )
            VALUES
            (@TransferId, @AcctId, @Currency, @Amount, @Type, @Channel, @GameCode, @TicketId, @SpecialGameId,
             @ReferenceId);
            IF @Type = 1
                UPDATE dbo.AccountInfo
                SET Balance = Balance - @Amount
                WHERE AcctId = @AcctId;
            ELSE IF @Type = 4
                UPDATE dbo.AccountInfo
                SET Balance = Balance + @Amount
                WHERE AcctId = @AcctId;
        COMMIT TRANSACTION;
        RETURN 0;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        RETURN -1;
    END CATCH;
END;
GO
USE [master]
GO
ALTER DATABASE [Gaming] SET  READ_WRITE 
GO
