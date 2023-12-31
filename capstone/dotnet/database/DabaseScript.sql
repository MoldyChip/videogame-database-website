USE [master]
GO
/****** Object:  Database [final_capstone]    Script Date: 8/15/2023 10:50:55 AM ******/
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END

CREATE DATABASE [final_capstone]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'final_capstone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\final_capstone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'final_capstone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\final_capstone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [final_capstone] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [final_capstone].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [final_capstone] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [final_capstone] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [final_capstone] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [final_capstone] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [final_capstone] SET ARITHABORT OFF 
GO
ALTER DATABASE [final_capstone] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [final_capstone] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [final_capstone] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [final_capstone] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [final_capstone] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [final_capstone] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [final_capstone] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [final_capstone] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [final_capstone] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [final_capstone] SET  ENABLE_BROKER 
GO
ALTER DATABASE [final_capstone] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [final_capstone] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [final_capstone] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [final_capstone] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [final_capstone] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [final_capstone] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [final_capstone] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [final_capstone] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [final_capstone] SET  MULTI_USER 
GO
ALTER DATABASE [final_capstone] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [final_capstone] SET DB_CHAINING OFF 
GO
ALTER DATABASE [final_capstone] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [final_capstone] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [final_capstone] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [final_capstone] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [final_capstone] SET QUERY_STORE = OFF
GO
USE [final_capstone]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 8/15/2023 10:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[review_id] [int] NOT NULL,
	[commenter_id] [int] NOT NULL,
	[comment_content] [varchar](max) NOT NULL,
	[comment_datetime] [date] NOT NULL,
 CONSTRAINT [PK_comment] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company]    Script Date: 8/15/2023 10:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company](
	[company_id] [int] IDENTITY(1,1) NOT NULL,
	[company_name] [varchar](200) NOT NULL,
 CONSTRAINT [Pk_company] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[game]    Script Date: 8/15/2023 10:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game](
	[game_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[esrb_rating] [varchar](10) NOT NULL,
	[release_date] [date] NOT NULL,
	[image_url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_games] PRIMARY KEY CLUSTERED 
(
	[game_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[game_developer]    Script Date: 8/15/2023 10:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game_developer](
	[developer_id] [int] NOT NULL,
	[game_id] [int] NOT NULL,
 CONSTRAINT [PK_game_developer] PRIMARY KEY CLUSTERED 
(
	[game_id] ASC,
	[developer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[game_genre]    Script Date: 8/15/2023 10:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game_genre](
	[genre_id] [int] NOT NULL,
	[game_id] [int] NOT NULL,
 CONSTRAINT [PK_game_genre] PRIMARY KEY CLUSTERED 
(
	[game_id] ASC,
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[game_list]    Script Date: 8/15/2023 10:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game_list](
	[list_id] [int] NOT NULL,
	[game_id] [int] NOT NULL,
 CONSTRAINT [PK_game_list] PRIMARY KEY CLUSTERED 
(
	[list_id] ASC,
	[game_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[game_platform]    Script Date: 8/15/2023 10:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game_platform](
	[platform_id] [int] NOT NULL,
	[game_id] [int] NOT NULL,
 CONSTRAINT [PK_game_platform] PRIMARY KEY CLUSTERED 
(
	[game_id] ASC,
	[platform_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[game_publisher]    Script Date: 8/15/2023 10:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game_publisher](
	[publisher_id] [int] NOT NULL,
	[game_id] [int] NOT NULL,
 CONSTRAINT [PK_game_publisher] PRIMARY KEY CLUSTERED 
(
	[game_id] ASC,
	[publisher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genre]    Script Date: 8/15/2023 10:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genre](
	[genre_id] [int] IDENTITY(1,1) NOT NULL,
	[genre_name] [varchar](200) NOT NULL,
 CONSTRAINT [Pk_genre] PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[list]    Script Date: 8/15/2023 10:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[list](
	[list_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[list_title] [varchar](50) NOT NULL,
	
 CONSTRAINT [PK_list] PRIMARY KEY CLUSTERED 
(
	[list_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[list_type]    Script Date: 8/15/2023 10:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
GO
/****** Object:  Table [dbo].[platform]    Script Date: 8/15/2023 10:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[platform](
	[platform_id] [int] IDENTITY(1,1) NOT NULL,
	[platform_name] [varchar](200) NOT NULL,
 CONSTRAINT [pk_platform] PRIMARY KEY CLUSTERED 
(
	[platform_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rating]    Script Date: 8/15/2023 10:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rating](
	[game_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[rating_value] [int] NOT NULL,
	[rating_datetime] [date] NOT NULL,
 CONSTRAINT [PK_rating] PRIMARY KEY CLUSTERED 
(
	[game_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review]    Script Date: 8/15/2023 10:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[game_id] [int] NOT NULL,
	[reviewer_id] [int] NOT NULL,
	[review_content] [varchar](max) NOT NULL,
	[review_datetime] [date] NOT NULL,
 CONSTRAINT [PK_review] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 8/15/2023 10:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password_hash] [varchar](200) NOT NULL,
	[salt] [varchar](200) NOT NULL,
	[user_role] [varchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([comment_id], [review_id], [commenter_id], [comment_content], [comment_datetime]) VALUES (1, 1, 2, N'this review sucks go open your eyes', CAST(N'2023-08-09' AS Date))
INSERT [dbo].[comment] ([comment_id], [review_id], [commenter_id], [comment_content], [comment_datetime]) VALUES (2, 2, 1, N'this game is the best what are you talking about?', CAST(N'2023-08-12' AS Date))
INSERT [dbo].[comment] ([comment_id], [review_id], [commenter_id], [comment_content], [comment_datetime]) VALUES (3, 2, 1, N'Maybe if the sped up on the new game I would like it more', CAST(N'2023-08-12' AS Date))
INSERT [dbo].[comment] ([comment_id], [review_id], [commenter_id], [comment_content], [comment_datetime]) VALUES (4, 4, 1, N'I agree, it''s a joke at this point. Don''t get me started on the ratings. the super-star XFactor abilities have been the same forever with generic abilities not designed for the player. Myles Garret was a 99 overall player last year and got 16 sacks but went down 4 overall? This game isn''t serious dude', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[comment] ([comment_id], [review_id], [commenter_id], [comment_content], [comment_datetime]) VALUES (5, 4, 3, N'I live and breathe madden. if madden has 99 enemies i have 99 enemies. if madden has only one fan that''s me and if madden has no fans then im probably dead. don''t talk about madden like you understand it. The developers are working hard and using new latest edge technology to give us realistic gameplay with AI who are smart and know how to block. the blocking system was changed and also 99 new animations and Cornerbacks not giving up easy catches anymore. Open your eyes', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[comment] ([comment_id], [review_id], [commenter_id], [comment_content], [comment_datetime]) VALUES (6, 4, 2, N'Yes so by enhancing the blocking they''re rendering D-Lineman useless. and allowing corners to get beat on go routes. Year after Year this game decides to implement No logic.', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[comment] ([comment_id], [review_id], [commenter_id], [comment_content], [comment_datetime]) VALUES (7, 4, 4, N'Yea 100%, could''ve been way better', CAST(N'2023-08-15' AS Date))
SET IDENTITY_INSERT [dbo].[comment] OFF
GO
SET IDENTITY_INSERT [dbo].[company] ON 

INSERT [dbo].[company] ([company_id], [company_name]) VALUES (1, N'Nintendo')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (2, N'Rockstar Games')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (3, N'Arkane Studios')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (4, N'2K')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (5, N'Bungie')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (6, N'Activision')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (7, N'Arc System Works')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (8, N'Artoon')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (9, N'Bethesda')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (10, N'BioWare')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (11, N'Capcom')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (12, N'Epic Games')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (13, N'Ubisoft')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (14, N'Sega')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (15, N'Microsoft')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (16, N'Square Enix')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (17, N'Ark System Works')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (18, N'Valve')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (19, N'Psyonix')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (20, N'Mike Ault')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (21, N'Namco')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (22, N'Titus Interactive')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (23, N'Atari, Inc.')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (24, N'Ubisoft Montreal')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (25, N'Tiburon')
INSERT [dbo].[company] ([company_id], [company_name]) VALUES (26, N'Electronic Arts')
SET IDENTITY_INSERT [dbo].[company] OFF
GO
SET IDENTITY_INSERT [dbo].[game] ON 

INSERT [dbo].[game] ([game_id], [title], [description], [esrb_rating], [release_date], [image_url]) VALUES (1, N'Super Mario Bros', N'Super Mario Bros. is a platform game. In the game, Mario must race through the Mushroom Kingdom and save Princess Toadstool (later Princess Peach) from Bowser. Mario jumps, runs, and walks across each level. The worlds are full of enemies and platforms, and open holes.', N'E', CAST(N'1985-09-13' AS Date), N'https://img-grouvee-com.b-cdn.net/upload/cache/28/d1/28d1a59b8cc9631f5fe0141dc6c06542.jpg')
INSERT [dbo].[game] ([game_id], [title], [description], [esrb_rating], [release_date], [image_url]) VALUES (2, N'Grand Theft Auto V', N'Grand Theft Auto V is an action-adventure game played from either a third-person or first-person perspective. Players complete missions—linear scenarios with set objectives—to progress through the story. Outside of the missions, players may freely roam the open world.', N'M', CAST(N'2013-09-17' AS Date), N'https://img-grouvee-com.b-cdn.net/upload/cache/ed/42/ed42cf726c8299b8ee36e0b34754ad61.jpg')
INSERT [dbo].[game] ([game_id], [title], [description], [esrb_rating], [release_date], [image_url]) VALUES (3, N'Prey', N' In Prey, you awaken aboard Talos I, a space station orbiting the moon in the year 2032. You are the key subject of an experiment meant to alter humanity forever – but things have gone terribly wrong. The space station has been overrun by hostile aliens and you are now being hunted.', N'M', CAST(N'2017-05-15' AS Date), N'https://img-grouvee-com.b-cdn.net/upload/cache/cb/f6/cbf6710ef76b9a48bf3f8fe72658d6f5.jpg')
INSERT [dbo].[game] ([game_id], [title], [description], [esrb_rating], [release_date], [image_url]) VALUES (4, N'Portal', N'A first-person puzzle game developed by Valve and graduates of DigiPen, Portal forces a human test subject to run a gauntlet of grueling spatial experiments administered by a malfunctioning, psychotic artificial intelligence named GLaDOS.', N'E', CAST(N'2007-10-10' AS Date), N'https://img-grouvee-com.b-cdn.net/upload/cache/e6/4c/e64cf528e1e1716c819fceaff40eb1c6.png')
INSERT [dbo].[game] ([game_id], [title], [description], [esrb_rating], [release_date], [image_url]) VALUES (5, N'Rocket League', N'A unique blend of soccer and vehicular mayhem in an arcade-style format.', N'E', CAST(N'2015-07-07' AS Date), N'https://img-grouvee-com.b-cdn.net/upload/cache/72/02/72028d6282be01a156a5971e758a9df1.jpg')
INSERT [dbo].[game] ([game_id], [title], [description], [esrb_rating], [release_date], [image_url]) VALUES (6, N'Animal Crossing: New Horizons', N'A life simulation game where players build 
and customize their own island paradise.', N'E', CAST(N'2020-03-20' AS Date), N'https://img-grouvee-com.b-cdn.net/upload/cache/8c/8c/8c8c4003b0fc19daa318ecdb32b911e6.png')
INSERT [dbo].[game] ([game_id], [title], [description], [esrb_rating], [release_date], [image_url]) VALUES (7, N'Tetris', N'A classic puzzle game where players arrange falling blocks to complete lines and score points.', N'E', CAST(N'1984-06-06' AS Date), N'https://img-grouvee-com.b-cdn.net/upload/cache/0d/bf/0dbf9d8e753dc7f0249fdb1bad6cfe8b.jpg')
INSERT [dbo].[game] ([game_id], [title], [description], [esrb_rating], [release_date], [image_url]) VALUES (8, N'Ms. Pac-Man', N'An iconic arcade game where players control Ms. Pac-Man as she navigates mazes, eats pellets, and avoids ghosts.', N'E', CAST(N'1982-02-03' AS Date), N'https://img-grouvee-com.b-cdn.net/upload/cache/c4/e4/c4e4f60d0b8d288e182488de229c6c00.jpg')
INSERT [dbo].[game] ([game_id], [title], [description], [esrb_rating], [release_date], [image_url]) VALUES (9, N'Superman 64', N'An infamous game known for its poor controls and gameplay, featuring Superman navigating through rings and completing missions.', N'E', CAST(N'1999-05-30' AS Date), N'https://img-grouvee-com.b-cdn.net/upload/cache/82/c7/82c7f160789ded78f898bf9f9fe8f6c4.png')
INSERT [dbo].[game] ([game_id], [title], [description], [esrb_rating], [release_date], [image_url]) VALUES (10, N'Fortnite', N'A battle royale game where players fight to be the last one standing in a shrinking play area.', N'T', CAST(N'2017-07-25' AS Date), N'https://img-grouvee-com.b-cdn.net/upload/cache/28/ef/28ef624c95a84ed4a2bd03e60ad8709f.jpg')
INSERT [dbo].[game] ([game_id], [title], [description], [esrb_rating], [release_date], [image_url]) VALUES (11, N'E.T. the Extra-Terrestrial', N'An infamous video game adaptation of the movie, known for its poor gameplay and development.', N'E', CAST(N'1982-12-01' AS Date), N'https://img-grouvee-com.b-cdn.net/upload/cache/7f/1c/7f1c8dd0e64005b7cc838cc4a44a5da7.jpg')
INSERT [dbo].[game] ([game_id], [title], [description], [esrb_rating], [release_date], [image_url]) VALUES (12, N'Street Fighter II', N'A classic fighting game that introduced iconic characters and special moves, popularizing the fighting game genre.', N'T', CAST(N'1991-02-06' AS Date), N'https://img-grouvee-com.b-cdn.net/upload/cache/45/4b/454be9f392ebb060c53ce79845980962.jpg')
INSERT [dbo].[game] ([game_id], [title], [description], [esrb_rating], [release_date], [image_url]) VALUES (13, N'Rainbow Six Siege', N'A tactical shooter that focuses on teamwork and strategy in multiplayer scenarios.', N'M', CAST(N'2015-12-01' AS Date), N'https://img-grouvee-com.b-cdn.net/upload/cache/71/96/719615abc99060f184f03244f6f83d75.jpg')
INSERT [dbo].[game] ([game_id], [title], [description], [esrb_rating], [release_date], [image_url]) VALUES (14, N'Madden NFL 24', N'The latest installment in the Madden NFL series, featuring updated rosters, gameplay improvements, and new features.', N'E', CAST(N'2023-08-15' AS Date), N'https://img-grouvee-com.b-cdn.net/upload/cache/c8/89/c8895466bb7423fc10d58aeb9a7356ad.jpg')
SET IDENTITY_INSERT [dbo].[game] OFF
GO
INSERT [dbo].[game_developer] ([developer_id], [game_id]) VALUES (1, 1)
INSERT [dbo].[game_developer] ([developer_id], [game_id]) VALUES (2, 2)
INSERT [dbo].[game_developer] ([developer_id], [game_id]) VALUES (3, 3)
INSERT [dbo].[game_developer] ([developer_id], [game_id]) VALUES (18, 4)
INSERT [dbo].[game_developer] ([developer_id], [game_id]) VALUES (19, 5)
INSERT [dbo].[game_developer] ([developer_id], [game_id]) VALUES (1, 6)
INSERT [dbo].[game_developer] ([developer_id], [game_id]) VALUES (1, 7)
INSERT [dbo].[game_developer] ([developer_id], [game_id]) VALUES (21, 8)
INSERT [dbo].[game_developer] ([developer_id], [game_id]) VALUES (1, 9)
INSERT [dbo].[game_developer] ([developer_id], [game_id]) VALUES (12, 10)
INSERT [dbo].[game_developer] ([developer_id], [game_id]) VALUES (23, 11)
INSERT [dbo].[game_developer] ([developer_id], [game_id]) VALUES (11, 12)
INSERT [dbo].[game_developer] ([developer_id], [game_id]) VALUES (24, 13)
INSERT [dbo].[game_developer] ([developer_id], [game_id]) VALUES (25, 14)
GO
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (1, 1)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (2, 2)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (3, 2)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (4, 2)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (5, 2)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (6, 2)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (7, 2)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (3, 3)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (5, 3)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (1, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (4, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (6, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (12, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (13, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (14, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (15, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (16, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (17, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (18, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (19, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (20, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (21, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (22, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (23, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (24, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (25, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (26, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (27, 4)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (9, 5)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (28, 5)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (29, 5)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (30, 6)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (31, 6)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (32, 6)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (33, 7)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (33, 8)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (34, 9)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (4, 10)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (35, 10)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (36, 10)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (37, 10)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (5, 11)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (11, 12)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (4, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (12, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (13, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (25, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (33, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (38, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (39, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (40, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (41, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (42, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (43, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (44, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (45, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (46, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (47, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (48, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (49, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (50, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (51, 13)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (9, 14)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (33, 14)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (52, 14)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (53, 14)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (54, 14)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (55, 14)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (56, 14)
INSERT [dbo].[game_genre] ([genre_id], [game_id]) VALUES (57, 14)
GO
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (1, 1)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (3, 2)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (4, 2)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (5, 2)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (6, 2)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (7, 2)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (10, 2)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (3, 3)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (5, 3)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (7, 3)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (7, 4)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (3, 5)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (7, 5)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (11, 5)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (12, 5)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (12, 6)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (7, 7)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (13, 7)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (7, 8)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (13, 8)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (8, 9)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (3, 10)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (5, 10)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (6, 10)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (14, 10)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (15, 10)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (16, 10)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (17, 10)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (18, 10)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (19, 10)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (20, 11)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (21, 12)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (6, 13)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (7, 13)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (10, 13)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (3, 14)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (5, 14)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (6, 14)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (7, 14)
INSERT [dbo].[game_platform] ([platform_id], [game_id]) VALUES (10, 14)
GO
INSERT [dbo].[game_publisher] ([publisher_id], [game_id]) VALUES (1, 1)
INSERT [dbo].[game_publisher] ([publisher_id], [game_id]) VALUES (2, 2)
INSERT [dbo].[game_publisher] ([publisher_id], [game_id]) VALUES (9, 3)
INSERT [dbo].[game_publisher] ([publisher_id], [game_id]) VALUES (18, 4)
INSERT [dbo].[game_publisher] ([publisher_id], [game_id]) VALUES (20, 5)
INSERT [dbo].[game_publisher] ([publisher_id], [game_id]) VALUES (1, 6)
INSERT [dbo].[game_publisher] ([publisher_id], [game_id]) VALUES (1, 7)
INSERT [dbo].[game_publisher] ([publisher_id], [game_id]) VALUES (15, 7)
INSERT [dbo].[game_publisher] ([publisher_id], [game_id]) VALUES (21, 8)
INSERT [dbo].[game_publisher] ([publisher_id], [game_id]) VALUES (22, 9)
INSERT [dbo].[game_publisher] ([publisher_id], [game_id]) VALUES (12, 10)
INSERT [dbo].[game_publisher] ([publisher_id], [game_id]) VALUES (23, 11)
INSERT [dbo].[game_publisher] ([publisher_id], [game_id]) VALUES (11, 12)
INSERT [dbo].[game_publisher] ([publisher_id], [game_id]) VALUES (13, 13)
INSERT [dbo].[game_publisher] ([publisher_id], [game_id]) VALUES (26, 14)
GO
SET IDENTITY_INSERT [dbo].[genre] ON 

INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (1, N'Platformer')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (2, N'Third-Person Shooter')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (3, N'First-Person Shooter')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (4, N'Action')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (5, N'Adventure')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (6, N'Puzzle')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (7, N'Open-World')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (8, N'Horror')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (9, N'Sports')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (10, N'Role-Playing')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (11, N'Fighting')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (12, N'First-Person')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (13, N'3D')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (14, N'Singleplayer')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (15, N'Sci-fi')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (16, N'Comedy')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (17, N'Female Protagonist')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (18, N'Funny')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (19, N'Physics')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (20, N'Story')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (21, N'Rich')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (22, N'Classic')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (23, N'Science')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (24, N'Atmospheric')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (25, N'FPS')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (26, N'Dark Humor')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (27, N'Short Adventure')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (28, N'Driving')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (29, N'Soccer')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (30, N'Adventure game')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (31, N'Simulation Game')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (32, N'Social simulation game')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (33, N'Strategy')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (34, N'Action-adventure game')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (35, N'battle-royale')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (36, N'shooting')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (37, N'third-person')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (38, N'PvP')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (39, N'eSports')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (40, N'Multiplayer')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (41, N'Shooter')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (42, N'Tactical')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (43, N'Competitive')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (44, N'Online')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (45, N'Co-Op')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (46, N'Hero')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (47, N'Team-Based')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (48, N'Military War')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (49, N'Realistic')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (50, N'Destruction')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (51, N'Difficult')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (52, N'Simulation')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (53, N'Football (American)')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (54, N'PvP Co-op')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (55, N'Local Co-Op')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (56, N'Local Multiplayer')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (57, N'Multiplayer Singleplayer')
SET IDENTITY_INSERT [dbo].[genre] OFF
GO
SET IDENTITY_INSERT [dbo].[list_type] ON 

INSERT [dbo].[list_type] ([list_type_id], [list_type_name], [is_default]) VALUES (1, N'Want To Play', 1)
INSERT [dbo].[list_type] ([list_type_id], [list_type_name], [is_default]) VALUES (2, N'Currently Playing', 1)
INSERT [dbo].[list_type] ([list_type_id], [list_type_name], [is_default]) VALUES (3, N'Has Played', 1)
INSERT [dbo].[list_type] ([list_type_id], [list_type_name], [is_default]) VALUES (4, N'Custom', 0)
SET IDENTITY_INSERT [dbo].[list_type] OFF
GO
SET IDENTITY_INSERT [dbo].[platform] ON 

INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (1, N'NES')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (2, N'Xbox 360')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (3, N'Xbox one')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (4, N'PlayStation 3')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (5, N'PlayStation 4')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (6, N'PlayStation 5')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (7, N'PC')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (8, N'Nintendo 64')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (9, N'GameCube')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (10, N'Xbox X/S')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (11, N'Playstatopm 4')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (12, N'Nintendo')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (13, N'Mobile')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (14, N'macOS[c]')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (15, N'Windows')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (16, N'iOS[c]')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (17, N'Nintendo Switch')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (18, N'Android[c]')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (19, N'Xbox Series X/S')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (20, N'Atari 2600')
INSERT [dbo].[platform] ([platform_id], [platform_name]) VALUES (21, N'Arcade')
SET IDENTITY_INSERT [dbo].[platform] OFF
GO
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (1, 1, 4, CAST(N'2023-08-09' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (1, 2, 3, CAST(N'2023-08-09' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (2, 1, 3, CAST(N'2023-08-08' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (2, 2, 5, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (3, 2, 5, CAST(N'2023-08-08' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (4, 4, 5, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (5, 4, 4, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (6, 4, 4, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (7, 4, 4, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (8, 2, 5, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (8, 4, 4, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (9, 4, 4, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (10, 2, 1, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (10, 4, 4, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (11, 4, 3, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (12, 4, 3, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (13, 4, 4, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (14, 1, 5, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (14, 2, 1, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (14, 3, 5, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[rating] ([game_id], [user_id], [rating_value], [rating_datetime]) VALUES (14, 4, 1, CAST(N'2023-08-15' AS Date))
GO
SET IDENTITY_INSERT [dbo].[review] ON 

INSERT [dbo].[review] ([review_id], [game_id], [reviewer_id], [review_content], [review_datetime]) VALUES (1, 1, 1, N'Really Enjoyed this game', CAST(N'2023-08-09' AS Date))
INSERT [dbo].[review] ([review_id], [game_id], [reviewer_id], [review_content], [review_datetime]) VALUES (2, 1, 2, N'It Was Meh, could be better', CAST(N'2023-08-12' AS Date))
INSERT [dbo].[review] ([review_id], [game_id], [reviewer_id], [review_content], [review_datetime]) VALUES (3, 2, 2, N'Grew up on this really like it', CAST(N'2023-08-10' AS Date))
INSERT [dbo].[review] ([review_id], [game_id], [reviewer_id], [review_content], [review_datetime]) VALUES (4, 14, 2, N'Tried Madden 24, it was said to be "the make it or break it" for EA and I must say, its the same game. Madden 21,22,23,24 are practically all the same, they add a couple of new animations and sell us "new games". The madden franchise needs To start from scratch because at this point I''ll stop buying this illogical game.', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[review] ([review_id], [game_id], [reviewer_id], [review_content], [review_datetime]) VALUES (5, 10, 4, N'This game has been lame since 2019', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[review] ([review_id], [game_id], [reviewer_id], [review_content], [review_datetime]) VALUES (6, 13, 4, N'Kind of hard to get into but fun once you get the hang of it', CAST(N'2023-08-15' AS Date))
SET IDENTITY_INSERT [dbo].[review] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [username], [password_hash], [salt], [user_role], [is_deleted]) VALUES (1, N'user', N'Jg45HuwT7PZkfuKTz6IB90CtWY4=', N'LHxP4Xh7bN0=', N'user', 0)
INSERT [dbo].[users] ([user_id], [username], [password_hash], [salt], [user_role], [is_deleted]) VALUES (2, N'admin', N'YhyGVQ+Ch69n4JMBncM4lNF/i9s=', N'Ar/aB2thQTI=', N'admin', 0)
INSERT [dbo].[users] ([user_id], [username], [password_hash], [salt], [user_role], [is_deleted]) VALUES (3, N'zak', N'R52Qda8Fo6bVPwPI7VLTniQzUfY=', N'bb9nMvnZB0A=', N'user', 0)
INSERT [dbo].[users] ([user_id], [username], [password_hash], [salt], [user_role], [is_deleted]) VALUES (4, N'hussein', N'1h8qPpbdni2MHfA6EfTQgDvZ2SI=', N'i4fH6OEEgiM=', N'user', 0)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
/****** Object:  Index [UQ_UniqueCombination]    Script Date: 8/15/2023 10:50:55 AM ******/
ALTER TABLE [dbo].[review] ADD  CONSTRAINT [UQ_UniqueCombination] UNIQUE NONCLUSTERED 
(
	[game_id] ASC,
	[reviewer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_review] FOREIGN KEY([review_id])
REFERENCES [dbo].[review] ([review_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_review]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_users] FOREIGN KEY([commenter_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_users]
GO
ALTER TABLE [dbo].[game_developer]  WITH CHECK ADD  CONSTRAINT [FK_game_developer_company] FOREIGN KEY([developer_id])
REFERENCES [dbo].[company] ([company_id])
GO
ALTER TABLE [dbo].[game_developer] CHECK CONSTRAINT [FK_game_developer_company]
GO
ALTER TABLE [dbo].[game_developer]  WITH CHECK ADD  CONSTRAINT [FK_game_developer_game] FOREIGN KEY([game_id])
REFERENCES [dbo].[game] ([game_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[game_developer] CHECK CONSTRAINT [FK_game_developer_game]
GO
ALTER TABLE [dbo].[game_genre]  WITH CHECK ADD  CONSTRAINT [FK_game_genre_game] FOREIGN KEY([game_id])
REFERENCES [dbo].[game] ([game_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[game_genre] CHECK CONSTRAINT [FK_game_genre_game]
GO
ALTER TABLE [dbo].[game_genre]  WITH CHECK ADD  CONSTRAINT [FK_game_genre_genre] FOREIGN KEY([genre_id])
REFERENCES [dbo].[genre] ([genre_id])
GO
ALTER TABLE [dbo].[game_genre] CHECK CONSTRAINT [FK_game_genre_genre]
GO
ALTER TABLE [dbo].[game_list]  WITH CHECK ADD  CONSTRAINT [FK_game_list_game] FOREIGN KEY([game_id])
REFERENCES [dbo].[game] ([game_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[game_list] CHECK CONSTRAINT [FK_game_list_game]
GO
ALTER TABLE [dbo].[game_list]  WITH CHECK ADD  CONSTRAINT [FK_game_list_list] FOREIGN KEY([list_id])
REFERENCES [dbo].[list] ([list_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[game_list] CHECK CONSTRAINT [FK_game_list_list]
GO
ALTER TABLE [dbo].[game_platform]  WITH CHECK ADD  CONSTRAINT [FK_game_platform_game] FOREIGN KEY([game_id])
REFERENCES [dbo].[game] ([game_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[game_platform] CHECK CONSTRAINT [FK_game_platform_game]
GO
ALTER TABLE [dbo].[game_platform]  WITH CHECK ADD  CONSTRAINT [FK_game_platform_platform] FOREIGN KEY([platform_id])
REFERENCES [dbo].[platform] ([platform_id])
GO
ALTER TABLE [dbo].[game_platform] CHECK CONSTRAINT [FK_game_platform_platform]
GO
ALTER TABLE [dbo].[game_publisher]  WITH CHECK ADD  CONSTRAINT [FK_game_publisher_company] FOREIGN KEY([publisher_id])
REFERENCES [dbo].[company] ([company_id])
GO
ALTER TABLE [dbo].[game_publisher] CHECK CONSTRAINT [FK_game_publisher_company]
GO
ALTER TABLE [dbo].[game_publisher]  WITH CHECK ADD  CONSTRAINT [FK_game_publisher_game] FOREIGN KEY([game_id])
REFERENCES [dbo].[game] ([game_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[game_publisher] CHECK CONSTRAINT [FK_game_publisher_game]
GO
ALTER TABLE [dbo].[list]  WITH CHECK ADD  CONSTRAINT [FK_list_list_type] FOREIGN KEY([list_type_id])
REFERENCES [dbo].[list_type] ([list_type_id])
GO
ALTER TABLE [dbo].[list] CHECK CONSTRAINT [FK_list_list_type]
GO
ALTER TABLE [dbo].[list]  WITH CHECK ADD  CONSTRAINT [FK_list_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[list] CHECK CONSTRAINT [FK_list_users]
GO
ALTER TABLE [dbo].[rating]  WITH CHECK ADD  CONSTRAINT [FK_rating_game] FOREIGN KEY([game_id])
REFERENCES [dbo].[game] ([game_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[rating] CHECK CONSTRAINT [FK_rating_game]
GO
ALTER TABLE [dbo].[rating]  WITH CHECK ADD  CONSTRAINT [FK_rating_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[rating] CHECK CONSTRAINT [FK_rating_users]
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD  CONSTRAINT [FK_review_game] FOREIGN KEY([game_id])
REFERENCES [dbo].[game] ([game_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[review] CHECK CONSTRAINT [FK_review_game]
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD  CONSTRAINT [FK_review_users] FOREIGN KEY([reviewer_id])
REFERENCES [dbo].[users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[review] CHECK CONSTRAINT [FK_review_users]
GO
ALTER TABLE [dbo].[list_type]  WITH CHECK ADD  CONSTRAINT [CK_listtype_isdft] CHECK  (([is_default]=(0) OR [is_default]=(1)))
GO
ALTER TABLE [dbo].[list_type] CHECK CONSTRAINT [CK_listtype_isdft]
GO
ALTER TABLE [dbo].[rating]  WITH CHECK ADD CHECK  (([rating_value]>=(1) AND [rating_value]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [final_capstone] SET  READ_WRITE 
GO
