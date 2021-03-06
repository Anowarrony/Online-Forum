USE [master]
GO
/****** Object:  Database [ForumDatabase]    Script Date: 03.07.2015 7:45:11 ******/
CREATE DATABASE [ForumDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ForumDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ForumDatabase.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ForumDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ForumDatabase_log.ldf' , SIZE = 1792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ForumDatabase] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ForumDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ForumDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ForumDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ForumDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ForumDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ForumDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [ForumDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ForumDatabase] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ForumDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ForumDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ForumDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ForumDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ForumDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ForumDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ForumDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ForumDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ForumDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ForumDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ForumDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ForumDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ForumDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ForumDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ForumDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ForumDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ForumDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ForumDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [ForumDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ForumDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ForumDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ForumDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ForumDatabase]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 03.07.2015 7:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](800) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role] [varchar](50) NOT NULL,
	[LastActive] [datetime] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 03.07.2015 7:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Answers](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[Answer] [varchar](1000) NOT NULL,
	[UserId] [int] NOT NULL,
	[AnsweredTimeDate] [datetime] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[Comments] [int] NULL,
	[Rating] [float] NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03.07.2015 7:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 03.07.2015 7:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[CommentMsg] [varchar](700) NOT NULL,
	[PostedDateTime] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[AnswerId] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ForumUser]    Script Date: 03.07.2015 7:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ForumUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[UserName] [varchar](30) NOT NULL,
	[Country] [varchar](60) NOT NULL,
	[Email] [varchar](70) NOT NULL,
	[Image] [image] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[LastLogin] [datetime] NULL,
 CONSTRAINT [PK_ForumUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostInformation]    Script Date: 03.07.2015 7:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostInformation](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TotalQuesPost] [int] NULL,
	[TotalAnsPost] [int] NULL,
	[TotalCommentPost] [int] NULL,
	[TotalValidPost] [int] NULL,
 CONSTRAINT [PK_PostInformation] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Questions]    Script Date: 03.07.2015 7:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](1000) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[PostedDate] [datetime] NOT NULL,
	[answers] [int] NOT NULL,
	[views] [int] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 03.07.2015 7:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[RateScore] [int] NOT NULL,
	[RaterId] [int] NOT NULL,
	[AnswerId] [int] NOT NULL,
	[RatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Temp]    Script Date: 03.07.2015 7:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TempId] [int] NULL,
 CONSTRAINT [PK_Temp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TemporaryTable]    Script Date: 03.07.2015 7:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TemporaryTable](
	[Id] [int] NOT NULL,
	[TempId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TempRatingTable]    Script Date: 03.07.2015 7:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempRatingTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PreviousTotRating] [float] NOT NULL,
	[PresentRating] [int] NOT NULL,
	[PrevTotRater] [int] NOT NULL,
 CONSTRAINT [PK_TempRatingTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TemQuesIdModel]    Script Date: 03.07.2015 7:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TemQuesIdModel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TempQuesId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserPostedQuestion]    Script Date: 03.07.2015 7:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserPostedQuestion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](1000) NULL,
	[UserId] [int] NULL,
	[AnsUserId] [varchar](10) NULL,
	[Answer] [varchar](800) NULL,
	[ReplyUser] [varchar](50) NULL,
	[PostedDate] [datetime] NULL,
	[Image] [image] NULL,
	[QuesPostDate] [datetime] NULL,
	[Category] [varchar](50) NULL,
	[QuestionId] [int] NULL,
	[TotalReplies] [int] NULL,
	[TotalAnswer] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Word]    Script Date: 03.07.2015 7:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Word](
	[Id] [int] NOT NULL,
	[SensitiveWord] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Word] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Answers] ADD  CONSTRAINT [Dfc_Answers_ForRating]  DEFAULT ((0)) FOR [Rating]
GO
USE [master]
GO
ALTER DATABASE [ForumDatabase] SET  READ_WRITE 
GO
