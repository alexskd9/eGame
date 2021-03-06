USE [master]
GO
/****** Object:  Database [Gaming]    Script Date: 25/08/20 18:04:00 ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 25/08/20 18:04:00 ******/
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
/****** Object:  Table [dbo].[AccountInfo]    Script Date: 25/08/20 18:04:00 ******/
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
/****** Object:  Table [dbo].[SpecialGame]    Script Date: 25/08/20 18:04:00 ******/
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
/****** Object:  Table [dbo].[Token]    Script Date: 25/08/20 18:04:00 ******/
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
/****** Object:  Table [dbo].[Transfers]    Script Date: 25/08/20 18:04:00 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Transfer__9549009034ED6079] UNIQUE NONCLUSTERED 
(
	[TransferId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[AuthorizeAccount]    Script Date: 25/08/20 18:04:00 ******/
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
/****** Object:  StoredProcedure [dbo].[CancelBet]    Script Date: 25/08/20 18:04:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CancelBet]
	@TransferId UNIQUEIDENTIFIER OUTPUT,
    @ReferenceId VARCHAR(50),
    @AcctId INT,
    @Currency VARCHAR(3),
    @Amount DECIMAL(20, 9),
    @Type INT
AS
BEGIN
    BEGIN TRY
        DECLARE @retVal INT;
		DECLARE @guid UNIQUEIDENTIFIER = NEWID();
        SET @TransferId = @guid;
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
/****** Object:  StoredProcedure [dbo].[CancelledBet]    Script Date: 25/08/20 18:04:00 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBalance]    Script Date: 25/08/20 18:04:00 ******/
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
/****** Object:  StoredProcedure [dbo].[Transaction]    Script Date: 25/08/20 18:04:00 ******/
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
