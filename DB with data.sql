USE [master]
GO
/****** Object:  Database [Gaming]    Script Date: 21/08/20 15:11:01 ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 21/08/20 15:11:01 ******/
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
/****** Object:  Table [dbo].[AccountInfo]    Script Date: 21/08/20 15:11:01 ******/
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
/****** Object:  Table [dbo].[SpecialGame]    Script Date: 21/08/20 15:11:01 ******/
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
/****** Object:  Table [dbo].[Token]    Script Date: 21/08/20 15:11:01 ******/
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
/****** Object:  Table [dbo].[Transfers]    Script Date: 21/08/20 15:11:01 ******/
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
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AcctId], [UserName]) VALUES (1, N'alex')
INSERT [dbo].[Account] ([AcctId], [UserName]) VALUES (2, N'alexskd')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountInfo] ON 

INSERT [dbo].[AccountInfo] ([Id], [AcctId], [Currency], [Balance], [SiteId]) VALUES (1, 1, N'USD', 100050.0000, N'AB1')
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
SET IDENTITY_INSERT [dbo].[Transfers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Transfer__9549009034ED6079]    Script Date: 21/08/20 15:11:01 ******/
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
/****** Object:  StoredProcedure [dbo].[AuthorizeAccount]    Script Date: 21/08/20 15:11:01 ******/
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
/****** Object:  StoredProcedure [dbo].[CancelBet]    Script Date: 21/08/20 15:11:01 ******/
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
               FROM dbo.Transfers
               WHERE TransferId = @TransferId
                     AND AcctId = @AcctId
                     AND Currency = @Currency
                     AND Amount = @Amount
           ) <> 2
           )
        BEGIN
            UPDATE dbo.Transfers
            SET Type = @Type
            WHERE TransferId = @TransferId
                  AND AcctId = @AcctId
                  AND Currency = @Currency
                  AND Amount = @Amount;
            UPDATE dbo.AccountInfo
            SET Balance = Balance + @Amount
            WHERE AcctId = @AcctId;
            SET @retVal = 0;
        END;
        ELSE
            SET @retVal = 10105;
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
/****** Object:  StoredProcedure [dbo].[GetBalance]    Script Date: 21/08/20 15:11:01 ******/
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
/****** Object:  StoredProcedure [dbo].[Transaction]    Script Date: 21/08/20 15:11:01 ******/
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

    INSERT INTO dbo.Transfers(TransferId, AcctId, Currency, Amount, Type, Channel, GameCode, TicketId, SpecialGameId, ReferenceId)
    VALUES
    (@TransferId, @AcctId, @Currency, @Amount, @Type, @Channel, @GameCode, @TicketId, @SpecialGameId, @ReferenceId);
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
END
GO
USE [master]
GO
ALTER DATABASE [Gaming] SET  READ_WRITE 
GO
