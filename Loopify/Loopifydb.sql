USE [master]
GO
/****** Object:  Database [Loopify]    Script Date: 10/10/2024 2:47:41 PM ******/
CREATE DATABASE [Loopify]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Loopify', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\Loopify.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Loopify_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\Loopify_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Loopify] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Loopify].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Loopify] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Loopify] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Loopify] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Loopify] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Loopify] SET ARITHABORT OFF 
GO
ALTER DATABASE [Loopify] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Loopify] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Loopify] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Loopify] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Loopify] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Loopify] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Loopify] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Loopify] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Loopify] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Loopify] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Loopify] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Loopify] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Loopify] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Loopify] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Loopify] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Loopify] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Loopify] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Loopify] SET RECOVERY FULL 
GO
ALTER DATABASE [Loopify] SET  MULTI_USER 
GO
ALTER DATABASE [Loopify] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Loopify] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Loopify] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Loopify] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Loopify] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Loopify] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Loopify', N'ON'
GO
ALTER DATABASE [Loopify] SET QUERY_STORE = ON
GO
ALTER DATABASE [Loopify] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Loopify]
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 10/10/2024 2:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albums](
	[AlbumId] [int] IDENTITY(1,1) NOT NULL,
	[AlbumName] [nvarchar](100) NOT NULL,
	[ArtistId] [int] NULL,
	[ReleaseDate] [date] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artists]    Script Date: 10/10/2024 2:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artists](
	[ArtistId] [int] IDENTITY(1,1) NOT NULL,
	[ArtistName] [nvarchar](100) NOT NULL,
	[Biography] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 10/10/2024 2:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreId] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 10/10/2024 2:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[UserId] [int] NOT NULL,
	[TrackId] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 10/10/2024 2:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[PaymentDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlists]    Script Date: 10/10/2024 2:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlists](
	[PlaylistId] [int] IDENTITY(1,1) NOT NULL,
	[PlaylistName] [nvarchar](100) NOT NULL,
	[UserId] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PlaylistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistTrack]    Script Date: 10/10/2024 2:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistTrack](
	[PlaylistId] [int] NOT NULL,
	[TrackId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlaylistId] ASC,
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PremiumFeatures]    Script Date: 10/10/2024 2:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PremiumFeatures](
	[FeatureId] [int] IDENTITY(1,1) NOT NULL,
	[FeatureName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FeatureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/10/2024 2:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tracks]    Script Date: 10/10/2024 2:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tracks](
	[TrackId] [int] IDENTITY(1,1) NOT NULL,
	[TrackName] [nvarchar](100) NOT NULL,
	[Duration] [int] NULL,
	[AlbumId] [int] NULL,
	[GenreId] [int] NULL,
	[ArtistId] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/10/2024 2:47:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[RoleId] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Albums] ON 

INSERT [dbo].[Albums] ([AlbumId], [AlbumName], [ArtistId], [ReleaseDate], [CreatedAt], [UpdatedAt]) VALUES (1, N'Album 1', 1, CAST(N'2022-01-01' AS Date), CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Albums] ([AlbumId], [AlbumName], [ArtistId], [ReleaseDate], [CreatedAt], [UpdatedAt]) VALUES (2, N'Album 2', 2, CAST(N'2022-02-01' AS Date), CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Albums] ([AlbumId], [AlbumName], [ArtistId], [ReleaseDate], [CreatedAt], [UpdatedAt]) VALUES (3, N'Album 3', 3, CAST(N'2022-03-01' AS Date), CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Albums] ([AlbumId], [AlbumName], [ArtistId], [ReleaseDate], [CreatedAt], [UpdatedAt]) VALUES (4, N'Album 4', 4, CAST(N'2022-04-01' AS Date), CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Albums] ([AlbumId], [AlbumName], [ArtistId], [ReleaseDate], [CreatedAt], [UpdatedAt]) VALUES (5, N'Album 5', 5, CAST(N'2022-05-01' AS Date), CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Albums] ([AlbumId], [AlbumName], [ArtistId], [ReleaseDate], [CreatedAt], [UpdatedAt]) VALUES (6, N'Album 6', 6, CAST(N'2022-06-01' AS Date), CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Albums] ([AlbumId], [AlbumName], [ArtistId], [ReleaseDate], [CreatedAt], [UpdatedAt]) VALUES (7, N'Album 7', 7, CAST(N'2022-07-01' AS Date), CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Albums] ([AlbumId], [AlbumName], [ArtistId], [ReleaseDate], [CreatedAt], [UpdatedAt]) VALUES (8, N'Album 8', 8, CAST(N'2022-08-01' AS Date), CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Albums] ([AlbumId], [AlbumName], [ArtistId], [ReleaseDate], [CreatedAt], [UpdatedAt]) VALUES (9, N'Album 9', 9, CAST(N'2022-09-01' AS Date), CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Albums] ([AlbumId], [AlbumName], [ArtistId], [ReleaseDate], [CreatedAt], [UpdatedAt]) VALUES (10, N'Album 10', 10, CAST(N'2022-10-01' AS Date), CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
SET IDENTITY_INSERT [dbo].[Albums] OFF
GO
SET IDENTITY_INSERT [dbo].[Artists] ON 

INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Biography], [CreatedAt], [UpdatedAt]) VALUES (1, N'Artist 1', N'Biography of Artist 1', CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Biography], [CreatedAt], [UpdatedAt]) VALUES (2, N'Artist 2', N'Biography of Artist 2', CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Biography], [CreatedAt], [UpdatedAt]) VALUES (3, N'Artist 3', N'Biography of Artist 3', CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Biography], [CreatedAt], [UpdatedAt]) VALUES (4, N'Artist 4', N'Biography of Artist 4', CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Biography], [CreatedAt], [UpdatedAt]) VALUES (5, N'Artist 5', N'Biography of Artist 5', CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Biography], [CreatedAt], [UpdatedAt]) VALUES (6, N'Artist 6', N'Biography of Artist 6', CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Biography], [CreatedAt], [UpdatedAt]) VALUES (7, N'Artist 7', N'Biography of Artist 7', CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Biography], [CreatedAt], [UpdatedAt]) VALUES (8, N'Artist 8', N'Biography of Artist 8', CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Biography], [CreatedAt], [UpdatedAt]) VALUES (9, N'Artist 9', N'Biography of Artist 9', CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [Biography], [CreatedAt], [UpdatedAt]) VALUES (10, N'Artist 10', N'Biography of Artist 10', CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
SET IDENTITY_INSERT [dbo].[Artists] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (1, N'Pop')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (2, N'Rock')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (3, N'Hip Hop')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (4, N'Jazz')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (5, N'Classical')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (6, N'Electronic')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (7, N'Country')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (8, N'Reggae')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (9, N'R&B')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (10, N'Blues')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
INSERT [dbo].[Likes] ([UserId], [TrackId], [CreatedAt]) VALUES (2, 3, CAST(N'2024-10-10T14:39:59.423' AS DateTime))
INSERT [dbo].[Likes] ([UserId], [TrackId], [CreatedAt]) VALUES (2, 4, CAST(N'2024-10-10T14:39:59.423' AS DateTime))
INSERT [dbo].[Likes] ([UserId], [TrackId], [CreatedAt]) VALUES (3, 5, CAST(N'2024-10-10T14:39:59.423' AS DateTime))
INSERT [dbo].[Likes] ([UserId], [TrackId], [CreatedAt]) VALUES (3, 6, CAST(N'2024-10-10T14:39:59.423' AS DateTime))
INSERT [dbo].[Likes] ([UserId], [TrackId], [CreatedAt]) VALUES (4, 7, CAST(N'2024-10-10T14:39:59.423' AS DateTime))
INSERT [dbo].[Likes] ([UserId], [TrackId], [CreatedAt]) VALUES (5, 8, CAST(N'2024-10-10T14:39:59.423' AS DateTime))
INSERT [dbo].[Likes] ([UserId], [TrackId], [CreatedAt]) VALUES (6, 9, CAST(N'2024-10-10T14:39:59.423' AS DateTime))
INSERT [dbo].[Likes] ([UserId], [TrackId], [CreatedAt]) VALUES (7, 10, CAST(N'2024-10-10T14:39:59.423' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([PaymentId], [UserId], [Amount], [PaymentDate]) VALUES (4, 2, CAST(14.99 AS Decimal(18, 2)), CAST(N'2024-10-10T14:41:24.953' AS DateTime))
INSERT [dbo].[Payments] ([PaymentId], [UserId], [Amount], [PaymentDate]) VALUES (5, 3, CAST(19.99 AS Decimal(18, 2)), CAST(N'2024-10-10T14:41:24.953' AS DateTime))
INSERT [dbo].[Payments] ([PaymentId], [UserId], [Amount], [PaymentDate]) VALUES (6, 4, CAST(24.99 AS Decimal(18, 2)), CAST(N'2024-10-10T14:41:24.953' AS DateTime))
INSERT [dbo].[Payments] ([PaymentId], [UserId], [Amount], [PaymentDate]) VALUES (7, 5, CAST(29.99 AS Decimal(18, 2)), CAST(N'2024-10-10T14:41:24.953' AS DateTime))
INSERT [dbo].[Payments] ([PaymentId], [UserId], [Amount], [PaymentDate]) VALUES (8, 6, CAST(34.99 AS Decimal(18, 2)), CAST(N'2024-10-10T14:41:24.953' AS DateTime))
INSERT [dbo].[Payments] ([PaymentId], [UserId], [Amount], [PaymentDate]) VALUES (9, 7, CAST(39.99 AS Decimal(18, 2)), CAST(N'2024-10-10T14:41:24.953' AS DateTime))
INSERT [dbo].[Payments] ([PaymentId], [UserId], [Amount], [PaymentDate]) VALUES (10, 8, CAST(44.99 AS Decimal(18, 2)), CAST(N'2024-10-10T14:41:24.953' AS DateTime))
INSERT [dbo].[Payments] ([PaymentId], [UserId], [Amount], [PaymentDate]) VALUES (11, 9, CAST(49.99 AS Decimal(18, 2)), CAST(N'2024-10-10T14:41:24.953' AS DateTime))
INSERT [dbo].[Payments] ([PaymentId], [UserId], [Amount], [PaymentDate]) VALUES (12, 10, CAST(54.99 AS Decimal(18, 2)), CAST(N'2024-10-10T14:41:24.953' AS DateTime))
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Playlists] ON 

INSERT [dbo].[Playlists] ([PlaylistId], [PlaylistName], [UserId], [CreatedAt], [UpdatedAt]) VALUES (2, N'Playlist 2', 2, CAST(N'2024-10-10T14:42:09.423' AS DateTime), CAST(N'2024-10-10T14:42:09.423' AS DateTime))
INSERT [dbo].[Playlists] ([PlaylistId], [PlaylistName], [UserId], [CreatedAt], [UpdatedAt]) VALUES (3, N'Playlist 3', 3, CAST(N'2024-10-10T14:42:09.423' AS DateTime), CAST(N'2024-10-10T14:42:09.423' AS DateTime))
INSERT [dbo].[Playlists] ([PlaylistId], [PlaylistName], [UserId], [CreatedAt], [UpdatedAt]) VALUES (4, N'Playlist 4', 4, CAST(N'2024-10-10T14:42:09.423' AS DateTime), CAST(N'2024-10-10T14:42:09.423' AS DateTime))
INSERT [dbo].[Playlists] ([PlaylistId], [PlaylistName], [UserId], [CreatedAt], [UpdatedAt]) VALUES (5, N'Playlist 5', 5, CAST(N'2024-10-10T14:42:09.423' AS DateTime), CAST(N'2024-10-10T14:42:09.423' AS DateTime))
INSERT [dbo].[Playlists] ([PlaylistId], [PlaylistName], [UserId], [CreatedAt], [UpdatedAt]) VALUES (6, N'Playlist 6', 6, CAST(N'2024-10-10T14:42:09.423' AS DateTime), CAST(N'2024-10-10T14:42:09.423' AS DateTime))
INSERT [dbo].[Playlists] ([PlaylistId], [PlaylistName], [UserId], [CreatedAt], [UpdatedAt]) VALUES (7, N'Playlist 7', 7, CAST(N'2024-10-10T14:42:09.423' AS DateTime), CAST(N'2024-10-10T14:42:09.423' AS DateTime))
INSERT [dbo].[Playlists] ([PlaylistId], [PlaylistName], [UserId], [CreatedAt], [UpdatedAt]) VALUES (8, N'Playlist 8', 8, CAST(N'2024-10-10T14:42:09.423' AS DateTime), CAST(N'2024-10-10T14:42:09.423' AS DateTime))
INSERT [dbo].[Playlists] ([PlaylistId], [PlaylistName], [UserId], [CreatedAt], [UpdatedAt]) VALUES (9, N'Playlist 9', 9, CAST(N'2024-10-10T14:42:09.423' AS DateTime), CAST(N'2024-10-10T14:42:09.423' AS DateTime))
INSERT [dbo].[Playlists] ([PlaylistId], [PlaylistName], [UserId], [CreatedAt], [UpdatedAt]) VALUES (10, N'Playlist 10', 10, CAST(N'2024-10-10T14:42:09.423' AS DateTime), CAST(N'2024-10-10T14:42:09.423' AS DateTime))
SET IDENTITY_INSERT [dbo].[Playlists] OFF
GO
INSERT [dbo].[PlaylistTrack] ([PlaylistId], [TrackId]) VALUES (2, 1)
INSERT [dbo].[PlaylistTrack] ([PlaylistId], [TrackId]) VALUES (2, 3)
INSERT [dbo].[PlaylistTrack] ([PlaylistId], [TrackId]) VALUES (3, 1)
INSERT [dbo].[PlaylistTrack] ([PlaylistId], [TrackId]) VALUES (3, 4)
INSERT [dbo].[PlaylistTrack] ([PlaylistId], [TrackId]) VALUES (4, 2)
INSERT [dbo].[PlaylistTrack] ([PlaylistId], [TrackId]) VALUES (5, 5)
INSERT [dbo].[PlaylistTrack] ([PlaylistId], [TrackId]) VALUES (5, 6)
INSERT [dbo].[PlaylistTrack] ([PlaylistId], [TrackId]) VALUES (6, 3)
GO
SET IDENTITY_INSERT [dbo].[PremiumFeatures] ON 

INSERT [dbo].[PremiumFeatures] ([FeatureId], [FeatureName], [Description], [UserId]) VALUES (3, N'Feature 2', N'Description of Feature 2', 2)
INSERT [dbo].[PremiumFeatures] ([FeatureId], [FeatureName], [Description], [UserId]) VALUES (4, N'Feature 3', N'Description of Feature 3', 3)
INSERT [dbo].[PremiumFeatures] ([FeatureId], [FeatureName], [Description], [UserId]) VALUES (5, N'Feature 4', N'Description of Feature 4', 4)
INSERT [dbo].[PremiumFeatures] ([FeatureId], [FeatureName], [Description], [UserId]) VALUES (6, N'Feature 5', N'Description of Feature 5', 5)
INSERT [dbo].[PremiumFeatures] ([FeatureId], [FeatureName], [Description], [UserId]) VALUES (7, N'Feature 6', N'Description of Feature 6', 6)
INSERT [dbo].[PremiumFeatures] ([FeatureId], [FeatureName], [Description], [UserId]) VALUES (8, N'Feature 7', N'Description of Feature 7', 7)
INSERT [dbo].[PremiumFeatures] ([FeatureId], [FeatureName], [Description], [UserId]) VALUES (9, N'Feature 8', N'Description of Feature 8', 8)
INSERT [dbo].[PremiumFeatures] ([FeatureId], [FeatureName], [Description], [UserId]) VALUES (10, N'Feature 9', N'Description of Feature 9', 9)
INSERT [dbo].[PremiumFeatures] ([FeatureId], [FeatureName], [Description], [UserId]) VALUES (11, N'Feature 10', N'Description of Feature 10', 10)
SET IDENTITY_INSERT [dbo].[PremiumFeatures] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'User')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (3, N'Listener')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Tracks] ON 

INSERT [dbo].[Tracks] ([TrackId], [TrackName], [Duration], [AlbumId], [GenreId], [ArtistId], [CreatedAt], [UpdatedAt]) VALUES (1, N'Track 1', 180, 1, 1, 1, CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Tracks] ([TrackId], [TrackName], [Duration], [AlbumId], [GenreId], [ArtistId], [CreatedAt], [UpdatedAt]) VALUES (2, N'Track 2', 200, 2, 2, 2, CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Tracks] ([TrackId], [TrackName], [Duration], [AlbumId], [GenreId], [ArtistId], [CreatedAt], [UpdatedAt]) VALUES (3, N'Track 3', 240, 3, 3, 3, CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Tracks] ([TrackId], [TrackName], [Duration], [AlbumId], [GenreId], [ArtistId], [CreatedAt], [UpdatedAt]) VALUES (4, N'Track 4', 210, 4, 4, 4, CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Tracks] ([TrackId], [TrackName], [Duration], [AlbumId], [GenreId], [ArtistId], [CreatedAt], [UpdatedAt]) VALUES (5, N'Track 5', 250, 5, 5, 5, CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Tracks] ([TrackId], [TrackName], [Duration], [AlbumId], [GenreId], [ArtistId], [CreatedAt], [UpdatedAt]) VALUES (6, N'Track 6', 220, 6, 6, 6, CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Tracks] ([TrackId], [TrackName], [Duration], [AlbumId], [GenreId], [ArtistId], [CreatedAt], [UpdatedAt]) VALUES (7, N'Track 7', 260, 7, 7, 7, CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Tracks] ([TrackId], [TrackName], [Duration], [AlbumId], [GenreId], [ArtistId], [CreatedAt], [UpdatedAt]) VALUES (8, N'Track 8', 230, 8, 8, 8, CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Tracks] ([TrackId], [TrackName], [Duration], [AlbumId], [GenreId], [ArtistId], [CreatedAt], [UpdatedAt]) VALUES (9, N'Track 9', 190, 9, 9, 9, CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
INSERT [dbo].[Tracks] ([TrackId], [TrackName], [Duration], [AlbumId], [GenreId], [ArtistId], [CreatedAt], [UpdatedAt]) VALUES (10, N'Track 10', 180, 10, 10, 10, CAST(N'2024-10-10T14:37:16.880' AS DateTime), CAST(N'2024-10-10T14:37:16.880' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tracks] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
INSERT [dbo].[Users] ([UserId], [Username], [Email], [Password], [RoleId], [CreatedAt], [UpdatedAt]) VALUES (1, N'User 1', N'user1@gmail.com', N'password1', 1, CAST(N'2024-10-10T14:38:47.000' AS DateTime), CAST(N'2024-10-10T14:38:47.000' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Email], [Password], [RoleId], [CreatedAt], [UpdatedAt]) VALUES (2, N'User 2', N'user2@gmail.com', N'password1', 1, CAST(N'2024-10-10T14:38:47.000' AS DateTime), CAST(N'2024-10-10T14:38:47.000' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Email], [Password], [RoleId], [CreatedAt], [UpdatedAt]) VALUES (3, N'User 3', N'user3@gmail.com', N'password2', 2, CAST(N'2024-10-10T14:38:47.000' AS DateTime), CAST(N'2024-10-10T14:38:47.000' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Email], [Password], [RoleId], [CreatedAt], [UpdatedAt]) VALUES (4, N'User 4', N'user4@gmail.com', N'password3', 1, CAST(N'2024-10-10T14:38:47.000' AS DateTime), CAST(N'2024-10-10T14:38:47.000' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Email], [Password], [RoleId], [CreatedAt], [UpdatedAt]) VALUES (5, N'User 5', N'user5@gmail.com', N'password4', 2, CAST(N'2024-10-10T14:38:47.000' AS DateTime), CAST(N'2024-10-10T14:38:47.000' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Email], [Password], [RoleId], [CreatedAt], [UpdatedAt]) VALUES (6, N'User 6', N'user6@gmail.com', N'password5', 1, CAST(N'2024-10-10T14:38:47.000' AS DateTime), CAST(N'2024-10-10T14:38:47.000' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Email], [Password], [RoleId], [CreatedAt], [UpdatedAt]) VALUES (7, N'User 7', N'user7@gmail.com', N'password6', 2, CAST(N'2024-10-10T14:38:47.000' AS DateTime), CAST(N'2024-10-10T14:38:47.000' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Email], [Password], [RoleId], [CreatedAt], [UpdatedAt]) VALUES (8, N'User 8', N'user8@gmail.com', N'password7', 1, CAST(N'2024-10-10T14:38:47.000' AS DateTime), CAST(N'2024-10-10T14:38:47.000' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Email], [Password], [RoleId], [CreatedAt], [UpdatedAt]) VALUES (9, N'User 9', N'user9@gmail.com', N'password8', 2, CAST(N'2024-10-10T14:38:47.000' AS DateTime), CAST(N'2024-10-10T14:38:47.000' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Email], [Password], [RoleId], [CreatedAt], [UpdatedAt]) VALUES (10, N'User 10', N'user10@gmail.com', N'password9', 1, CAST(N'2024-10-10T14:38:47.000' AS DateTime), CAST(N'2024-10-10T14:38:47.000' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Email], [Password], [RoleId], [CreatedAt], [UpdatedAt]) VALUES (11, N'User 11', N'user11@gmail.com', N'password10', 2, CAST(N'2024-10-10T14:38:47.000' AS DateTime), CAST(N'2024-10-10T14:38:47.000' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Email], [Password], [RoleId], [CreatedAt], [UpdatedAt]) VALUES (12, N'User 12', N'user12@gmail.com', N'password1', 1, CAST(N'2024-10-10T14:40:14.933' AS DateTime), CAST(N'2024-10-10T14:40:14.933' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Albums] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Albums] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Artists] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Artists] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Likes] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[Playlists] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Playlists] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Tracks] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Tracks] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Albums]  WITH CHECK ADD FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artists] ([ArtistId])
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD FOREIGN KEY([TrackId])
REFERENCES [dbo].[Tracks] ([TrackId])
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Playlists]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[PlaylistTrack]  WITH CHECK ADD FOREIGN KEY([PlaylistId])
REFERENCES [dbo].[Playlists] ([PlaylistId])
GO
ALTER TABLE [dbo].[PlaylistTrack]  WITH CHECK ADD FOREIGN KEY([TrackId])
REFERENCES [dbo].[Tracks] ([TrackId])
GO
ALTER TABLE [dbo].[PremiumFeatures]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Tracks]  WITH CHECK ADD FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Albums] ([AlbumId])
GO
ALTER TABLE [dbo].[Tracks]  WITH CHECK ADD FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artists] ([ArtistId])
GO
ALTER TABLE [dbo].[Tracks]  WITH CHECK ADD FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([GenreId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
USE [master]
GO
ALTER DATABASE [Loopify] SET  READ_WRITE 
GO
