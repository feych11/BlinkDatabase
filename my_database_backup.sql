USE [master]
GO
/****** Object:  Database [BlinkMovie4]    Script Date: 6/14/2024 2:40:19 AM ******/
CREATE DATABASE [BlinkMovie4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlinkMovie4_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BlinkMovie4.mdf' , SIZE = 11264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BlinkMovie4_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BlinkMovie4.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BlinkMovie4] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlinkMovie4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlinkMovie4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlinkMovie4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlinkMovie4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlinkMovie4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlinkMovie4] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlinkMovie4] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BlinkMovie4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlinkMovie4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlinkMovie4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlinkMovie4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlinkMovie4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlinkMovie4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlinkMovie4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlinkMovie4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlinkMovie4] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BlinkMovie4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlinkMovie4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlinkMovie4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlinkMovie4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlinkMovie4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlinkMovie4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlinkMovie4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlinkMovie4] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BlinkMovie4] SET  MULTI_USER 
GO
ALTER DATABASE [BlinkMovie4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlinkMovie4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlinkMovie4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlinkMovie4] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BlinkMovie4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BlinkMovie4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BlinkMovie4] SET QUERY_STORE = ON
GO
ALTER DATABASE [BlinkMovie4] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BlinkMovie4]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_ID] [int] NOT NULL,
	[UserName] [varchar](max) NULL,
	[Email] [varchar](max) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Admin_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BalanceRequests]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BalanceRequests](
	[Balance_ID] [int] NOT NULL,
	[Reader_ID] [int] NULL,
	[Balance] [int] NULL,
	[RequestDate] [varchar](max) NULL,
	[Status] [varchar](max) NULL,
	[adminNotifications] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Balance_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clips]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clips](
	[Clips_ID] [int] IDENTITY(1,1) NOT NULL,
	[Writer_ID] [int] NULL,
	[Movie_ID] [int] NULL,
	[Sent_ID] [int] NULL,
	[Title] [varchar](max) NULL,
	[Url] [varchar](max) NULL,
	[UploadDate] [date] NULL,
	[Start_time] [varchar](50) NULL,
	[End_time] [varchar](50) NULL,
	[isCompoundClip] [bit] NULL,
	[Description] [varchar](max) NULL,
	[Likes] [int] NULL,
 CONSTRAINT [PK__Clips__C1F8DC5960A75C0F] PRIMARY KEY CLUSTERED 
(
	[Clips_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DramasClips]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DramasClips](
	[DramasClip_ID] [int] IDENTITY(1,1) NOT NULL,
	[Writer_ID] [int] NULL,
	[Sent_ID] [int] NULL,
	[Movie_ID] [int] NULL,
	[Title] [varchar](max) NULL,
	[Url] [varchar](max) NULL,
	[Episode] [int] NULL,
	[Start_time] [varchar](max) NULL,
	[End_time] [varchar](max) NULL,
	[isCompoundClip] [bit] NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK__DramasCl__BECD2115B55A103B] PRIMARY KEY CLUSTERED 
(
	[DramasClip_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editor]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editor](
	[Editor_ID] [int] NOT NULL,
	[Email] [varchar](max) NULL,
	[UserName] [varchar](max) NULL,
	[Password] [varchar](max) NULL,
	[Interest] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Editor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Favorites_ID] [int] NOT NULL,
	[Movie_ID] [int] NULL,
	[Writer_ID] [int] NULL,
	[Reader_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Favorites_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FreeMovie]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreeMovie](
	[FreeMovie_ID] [int] NOT NULL,
	[Reader_ID] [int] NULL,
	[Movie_ID] [int] NULL,
	[Writer_ID] [int] NULL,
	[Episode] [int] NULL,
	[issueDate] [varchar](max) NULL,
 CONSTRAINT [PK_FreeMovie] PRIMARY KEY CLUSTERED 
(
	[FreeMovie_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[Genre_ID] [int] NOT NULL,
	[Genre_Name] [varchar](max) NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[Genre_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GetMovie]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GetMovie](
	[GetMovie_ID] [int] NOT NULL,
	[Movie_ID] [int] NULL,
	[Writer_ID] [int] NULL,
	[Summary_ID] [int] NULL,
	[Clips_ID] [int] NULL,
	[Editor_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GetMovie_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[History_ID] [int] NOT NULL,
	[Movie_ID] [int] NULL,
	[Writer_ID] [int] NULL,
	[Reader_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[History_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interests]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interests](
	[Interest_ID] [int] NOT NULL,
	[Interests] [varchar](max) NULL,
 CONSTRAINT [PK_Interests] PRIMARY KEY CLUSTERED 
(
	[Interest_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[Movie_ID] [int] NOT NULL,
	[Name] [varchar](max) NULL,
	[Image] [varchar](max) NULL,
	[CoverImage] [varchar](max) NULL,
	[Category] [varchar](max) NULL,
	[Type] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[Director] [varchar](max) NULL,
	[Rating] [float] NULL,
	[TotalNoOfRatings] [int] NULL,
	[anySummaryOrClip] [bit] NULL,
	[TotalRatings] [int] NULL,
	[TotalRatingSum] [float] NULL,
	[AverageRating] [float] NULL,
 CONSTRAINT [PK__Movie__C797348A117F9D94] PRIMARY KEY CLUSTERED 
(
	[Movie_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reader]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reader](
	[Reader_ID] [int] NOT NULL,
	[Email] [varchar](max) NULL,
	[UserName] [varchar](max) NULL,
	[Password] [varchar](max) NULL,
	[Image] [varchar](max) NULL,
	[Subscription] [varchar](max) NULL,
	[Balance] [int] NULL,
	[Interest] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Reader_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReaderRate]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReaderRate](
	[ReaderRate_ID] [int] NOT NULL,
	[Reader_ID] [int] NULL,
	[Writer_ID] [int] NULL,
	[Movie_ID] [int] NULL,
	[Writer_Rating] [float] NULL,
	[Movie_Rating] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReaderRate_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SentProject]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SentProject](
	[SentProject_ID] [int] NOT NULL,
	[Movie_ID] [int] NULL,
	[Editor_ID] [int] NULL,
	[Writer_ID] [int] NULL,
	[SentProposal_ID] [int] NULL,
	[Send_at] [varchar](max) NULL,
	[Status] [varchar](max) NULL,
	[EditorComment] [varchar](max) NULL,
	[Writer_Notification] [bit] NULL,
	[Editor_Notification] [bit] NULL,
 CONSTRAINT [PK_SentProject] PRIMARY KEY CLUSTERED 
(
	[SentProject_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SentProposals]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SentProposals](
	[SentProposal_ID] [int] NOT NULL,
	[Movie_ID] [int] NULL,
	[Editor_ID] [int] NULL,
	[Writer_ID] [int] NULL,
	[Movie_Name] [varchar](max) NULL,
	[Cover_Image] [varchar](max) NULL,
	[Image] [varchar](max) NULL,
	[Genre] [varchar](max) NULL,
	[Type] [varchar](max) NULL,
	[Episode] [int] NULL,
	[Director] [varchar](max) NULL,
	[Balance] [int] NULL,
	[Status] [varchar](max) NULL,
	[Sent_at] [varchar](max) NULL,
	[DueDate] [varchar](max) NULL,
	[Writer_Notification] [bit] NULL,
	[Editor_Notification] [bit] NULL,
 CONSTRAINT [PK_SentProposals] PRIMARY KEY CLUSTERED 
(
	[SentProposal_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Summary]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Summary](
	[Summary_ID] [int] NOT NULL,
	[Sent_ID] [int] NULL,
	[Movie_ID] [int] NULL,
	[Writer_ID] [int] NULL,
	[UploadDate] [date] NULL,
	[Summary] [varchar](max) NULL,
	[Episode] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Summary_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_ID] [int] NOT NULL,
	[Editor_ID] [int] NULL,
	[Writer_ID] [int] NULL,
	[Reader_ID] [int] NULL,
	[Email] [varchar](max) NULL,
	[Password] [varchar](max) NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK__Users__BD21E37F0AD2A005] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Writer]    Script Date: 6/14/2024 2:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Writer](
	[Writer_ID] [int] NOT NULL,
	[Email] [varchar](max) NULL,
	[UserName] [varchar](max) NULL,
	[Password] [varchar](max) NULL,
	[Image] [varchar](max) NULL,
	[Interest] [varchar](max) NULL,
	[Balance] [int] NULL,
	[Rating] [float] NULL,
	[TotalRatings] [int] NULL,
	[TotalRatingSum] [float] NULL,
	[AverageRating] [float] NULL,
 CONSTRAINT [PK__Writer__DB37651903317E3D] PRIMARY KEY CLUSTERED 
(
	[Writer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[BalanceRequests]  WITH CHECK ADD FOREIGN KEY([Reader_ID])
REFERENCES [dbo].[Reader] ([Reader_ID])
GO
ALTER TABLE [dbo].[Clips]  WITH CHECK ADD  CONSTRAINT [FK__Clips__MID__6383C8BA] FOREIGN KEY([Movie_ID])
REFERENCES [dbo].[Movie] ([Movie_ID])
GO
ALTER TABLE [dbo].[Clips] CHECK CONSTRAINT [FK__Clips__MID__6383C8BA]
GO
ALTER TABLE [dbo].[Clips]  WITH CHECK ADD  CONSTRAINT [FK__Clips__WID__628FA481] FOREIGN KEY([Writer_ID])
REFERENCES [dbo].[Writer] ([Writer_ID])
GO
ALTER TABLE [dbo].[Clips] CHECK CONSTRAINT [FK__Clips__WID__628FA481]
GO
ALTER TABLE [dbo].[DramasClips]  WITH CHECK ADD  CONSTRAINT [FK__DramasCli__Movie__6D0D32F4] FOREIGN KEY([Movie_ID])
REFERENCES [dbo].[Movie] ([Movie_ID])
GO
ALTER TABLE [dbo].[DramasClips] CHECK CONSTRAINT [FK__DramasCli__Movie__6D0D32F4]
GO
ALTER TABLE [dbo].[DramasClips]  WITH CHECK ADD  CONSTRAINT [FK__DramasCli__Sent___6C190EBB] FOREIGN KEY([Sent_ID])
REFERENCES [dbo].[SentProject] ([SentProject_ID])
GO
ALTER TABLE [dbo].[DramasClips] CHECK CONSTRAINT [FK__DramasCli__Sent___6C190EBB]
GO
ALTER TABLE [dbo].[DramasClips]  WITH CHECK ADD  CONSTRAINT [FK__DramasCli__Write__6B24EA82] FOREIGN KEY([Writer_ID])
REFERENCES [dbo].[Writer] ([Writer_ID])
GO
ALTER TABLE [dbo].[DramasClips] CHECK CONSTRAINT [FK__DramasCli__Write__6B24EA82]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK__Favorites__MID__7B5B524B] FOREIGN KEY([Movie_ID])
REFERENCES [dbo].[Movie] ([Movie_ID])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK__Favorites__MID__7B5B524B]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([Reader_ID])
REFERENCES [dbo].[Reader] ([Reader_ID])
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK__Favorites__Write__6E01572D] FOREIGN KEY([Writer_ID])
REFERENCES [dbo].[Writer] ([Writer_ID])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK__Favorites__Write__6E01572D]
GO
ALTER TABLE [dbo].[GetMovie]  WITH CHECK ADD  CONSTRAINT [FK__GetMovie__CID__6C190EBB] FOREIGN KEY([Clips_ID])
REFERENCES [dbo].[Clips] ([Clips_ID])
GO
ALTER TABLE [dbo].[GetMovie] CHECK CONSTRAINT [FK__GetMovie__CID__6C190EBB]
GO
ALTER TABLE [dbo].[GetMovie]  WITH CHECK ADD  CONSTRAINT [FK__GetMovie__MID__693CA210] FOREIGN KEY([Movie_ID])
REFERENCES [dbo].[Movie] ([Movie_ID])
GO
ALTER TABLE [dbo].[GetMovie] CHECK CONSTRAINT [FK__GetMovie__MID__693CA210]
GO
ALTER TABLE [dbo].[GetMovie]  WITH CHECK ADD FOREIGN KEY([Summary_ID])
REFERENCES [dbo].[Summary] ([Summary_ID])
GO
ALTER TABLE [dbo].[GetMovie]  WITH CHECK ADD  CONSTRAINT [FK__GetMovie__WID__6A30C649] FOREIGN KEY([Writer_ID])
REFERENCES [dbo].[Writer] ([Writer_ID])
GO
ALTER TABLE [dbo].[GetMovie] CHECK CONSTRAINT [FK__GetMovie__WID__6A30C649]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK__History__MID__02084FDA] FOREIGN KEY([Movie_ID])
REFERENCES [dbo].[Movie] ([Movie_ID])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK__History__MID__02084FDA]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD FOREIGN KEY([Reader_ID])
REFERENCES [dbo].[Reader] ([Reader_ID])
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK__History__Writer___74AE54BC] FOREIGN KEY([Writer_ID])
REFERENCES [dbo].[Writer] ([Writer_ID])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK__History__Writer___74AE54BC]
GO
ALTER TABLE [dbo].[ReaderRate]  WITH CHECK ADD FOREIGN KEY([Reader_ID])
REFERENCES [dbo].[Reader] ([Reader_ID])
GO
ALTER TABLE [dbo].[ReaderRate]  WITH CHECK ADD  CONSTRAINT [FK__ReaderRate__MID__2C3393D0] FOREIGN KEY([Movie_ID])
REFERENCES [dbo].[Movie] ([Movie_ID])
GO
ALTER TABLE [dbo].[ReaderRate] CHECK CONSTRAINT [FK__ReaderRate__MID__2C3393D0]
GO
ALTER TABLE [dbo].[ReaderRate]  WITH CHECK ADD  CONSTRAINT [FK__ReaderRate__WID__2B3F6F97] FOREIGN KEY([Writer_ID])
REFERENCES [dbo].[Writer] ([Writer_ID])
GO
ALTER TABLE [dbo].[ReaderRate] CHECK CONSTRAINT [FK__ReaderRate__WID__2B3F6F97]
GO
ALTER TABLE [dbo].[SentProject]  WITH CHECK ADD  CONSTRAINT [FK__SentProject__EID__36B12243] FOREIGN KEY([Editor_ID])
REFERENCES [dbo].[Editor] ([Editor_ID])
GO
ALTER TABLE [dbo].[SentProject] CHECK CONSTRAINT [FK__SentProject__EID__36B12243]
GO
ALTER TABLE [dbo].[SentProject]  WITH CHECK ADD  CONSTRAINT [FK__SentProject__WID__37A5467C] FOREIGN KEY([Writer_ID])
REFERENCES [dbo].[Writer] ([Writer_ID])
GO
ALTER TABLE [dbo].[SentProject] CHECK CONSTRAINT [FK__SentProject__WID__37A5467C]
GO
ALTER TABLE [dbo].[SentProposals]  WITH CHECK ADD  CONSTRAINT [FK__SentProposa__EID__24927208] FOREIGN KEY([Editor_ID])
REFERENCES [dbo].[Editor] ([Editor_ID])
GO
ALTER TABLE [dbo].[SentProposals] CHECK CONSTRAINT [FK__SentProposa__EID__24927208]
GO
ALTER TABLE [dbo].[SentProposals]  WITH CHECK ADD  CONSTRAINT [FK__SentProposa__WID__25869641] FOREIGN KEY([Writer_ID])
REFERENCES [dbo].[Writer] ([Writer_ID])
GO
ALTER TABLE [dbo].[SentProposals] CHECK CONSTRAINT [FK__SentProposa__WID__25869641]
GO
ALTER TABLE [dbo].[Summary]  WITH CHECK ADD  CONSTRAINT [FK__Summary__MID__3F466844] FOREIGN KEY([Movie_ID])
REFERENCES [dbo].[Movie] ([Movie_ID])
GO
ALTER TABLE [dbo].[Summary] CHECK CONSTRAINT [FK__Summary__MID__3F466844]
GO
ALTER TABLE [dbo].[Summary]  WITH CHECK ADD  CONSTRAINT [FK__Summary__WID__403A8C7D] FOREIGN KEY([Writer_ID])
REFERENCES [dbo].[Writer] ([Writer_ID])
GO
ALTER TABLE [dbo].[Summary] CHECK CONSTRAINT [FK__Summary__WID__403A8C7D]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK__Users__EID__0CBAE877] FOREIGN KEY([Editor_ID])
REFERENCES [dbo].[Editor] ([Editor_ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK__Users__EID__0CBAE877]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK__Users__RID__0EA330E9] FOREIGN KEY([Reader_ID])
REFERENCES [dbo].[Reader] ([Reader_ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK__Users__RID__0EA330E9]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK__Users__WID__0DAF0CB0] FOREIGN KEY([Writer_ID])
REFERENCES [dbo].[Writer] ([Writer_ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK__Users__WID__0DAF0CB0]
GO
USE [master]
GO
ALTER DATABASE [BlinkMovie4] SET  READ_WRITE 
GO
