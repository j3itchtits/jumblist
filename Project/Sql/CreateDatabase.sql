USE [master]
GO

-- If the database already exists, drop it    
IF EXISTS(SELECT * FROM sysdatabases WHERE name='JumblistDatabase')    
DROP DATABASE JumblistDatabase    
GO 

/****** Object:  Database [JumblistDatabase]    Script Date: 02/10/2009 13:47:06 ******/
CREATE DATABASE [JumblistDatabase]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JumblistDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JumblistDatabase] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [JumblistDatabase] SET ANSI_NULLS OFF
GO
ALTER DATABASE [JumblistDatabase] SET ANSI_PADDING OFF
GO
ALTER DATABASE [JumblistDatabase] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [JumblistDatabase] SET ARITHABORT OFF
GO
ALTER DATABASE [JumblistDatabase] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [JumblistDatabase] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [JumblistDatabase] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [JumblistDatabase] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [JumblistDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [JumblistDatabase] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [JumblistDatabase] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [JumblistDatabase] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [JumblistDatabase] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [JumblistDatabase] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [JumblistDatabase] SET  ENABLE_BROKER
GO
ALTER DATABASE [JumblistDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [JumblistDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [JumblistDatabase] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [JumblistDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [JumblistDatabase] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [JumblistDatabase] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [JumblistDatabase] SET  READ_WRITE
GO
ALTER DATABASE [JumblistDatabase] SET RECOVERY FULL
GO
ALTER DATABASE [JumblistDatabase] SET  MULTI_USER
GO
ALTER DATABASE [JumblistDatabase] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [JumblistDatabase] SET DB_CHAINING OFF
GO

USE [JumblistDatabase]
GO
/****** Object:  Table [dbo].[PostCategories]    Script Date: 02/10/2010 19:45:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostCategories](
	[PostCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[PostCategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PostTypes] PRIMARY KEY CLUSTERED 
(
	[PostCategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PostCategories] ON
INSERT [dbo].[PostCategories] ([PostCategoryId], [PostCategoryName]) VALUES (1, N'Offered')
INSERT [dbo].[PostCategories] ([PostCategoryId], [PostCategoryName]) VALUES (2, N'Wanted')
INSERT [dbo].[PostCategories] ([PostCategoryId], [PostCategoryName]) VALUES (3, N'Taken')
SET IDENTITY_INSERT [dbo].[PostCategories] OFF
/****** Object:  Table [dbo].[FeedCategories]    Script Date: 02/10/2010 19:45:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedCategories](
	[FeedCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[FeedCategoryName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_FeedCategories] PRIMARY KEY CLUSTERED 
(
	[FeedCategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FeedCategories] ON
INSERT [dbo].[FeedCategories] ([FeedCategoryId], [FeedCategoryName]) VALUES (1, N'Freecycle Yahoo Group')
INSERT [dbo].[FeedCategories] ([FeedCategoryId], [FeedCategoryName]) VALUES (2, N'Freegle Yahoo Group')
SET IDENTITY_INSERT [dbo].[FeedCategories] OFF
/****** Object:  UserDefinedFunction [dbo].[DistanceBetween]    Script Date: 02/10/2010 19:45:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[DistanceBetween] (@Lat1 as real,
                @Long1 as real, @Lat2 as real, @Long2 as real)
RETURNS real
AS
BEGIN

DECLARE @dLat1InRad as float(53);
SET @dLat1InRad = @Lat1 * (PI()/180.0);
DECLARE @dLong1InRad as float(53);
SET @dLong1InRad = @Long1 * (PI()/180.0);
DECLARE @dLat2InRad as float(53);
SET @dLat2InRad = @Lat2 * (PI()/180.0);
DECLARE @dLong2InRad as float(53);
SET @dLong2InRad = @Long2 * (PI()/180.0);

DECLARE @dLongitude as float(53);
SET @dLongitude = @dLong2InRad - @dLong1InRad;
DECLARE @dLatitude as float(53);
SET @dLatitude = @dLat2InRad - @dLat1InRad;
/* Intermediate result a. */
DECLARE @a as float(53);
SET @a = SQUARE (SIN (@dLatitude / 2.0)) + COS (@dLat1InRad)
                 * COS (@dLat2InRad)
                 * SQUARE(SIN (@dLongitude / 2.0));
/* Intermediate result c (great circle distance in Radians). */
DECLARE @c as real;
SET @c = 2.0 * ATN2 (SQRT (@a), SQRT (1.0 - @a));
DECLARE @kEarthRadius as real;
/* SET kEarthRadius = 3956.0 miles */
SET @kEarthRadius = 6376.5;        /* kms */

DECLARE @dDistance as real;
SET @dDistance = @kEarthRadius * @c;
return (@dDistance);
END
GO
/****** Object:  Table [dbo].[LocationCategories]    Script Date: 02/10/2010 19:45:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationCategories](
	[LocationCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[LocationCategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LocationCategories] PRIMARY KEY CLUSTERED 
(
	[LocationCategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LocationCategories] ON
INSERT [dbo].[LocationCategories] ([LocationCategoryId], [LocationCategoryName]) VALUES (1, N'Country')
INSERT [dbo].[LocationCategories] ([LocationCategoryId], [LocationCategoryName]) VALUES (2, N'County')
INSERT [dbo].[LocationCategories] ([LocationCategoryId], [LocationCategoryName]) VALUES (3, N'Town')
INSERT [dbo].[LocationCategories] ([LocationCategoryId], [LocationCategoryName]) VALUES (4, N'Postcode')
INSERT [dbo].[LocationCategories] ([LocationCategoryId], [LocationCategoryName]) VALUES (5, N'Address')
SET IDENTITY_INSERT [dbo].[LocationCategories] OFF
/****** Object:  Table [dbo].[Tags]    Script Date: 02/10/2010 19:45:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](250) NOT NULL,
	[TagFriendlyUrl] [nvarchar](250) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tags] ON
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (2, N'Roofing felt', N'roofing-felt')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (3, N'Sofa', N'sofa')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (7, N'Dress', N'dress')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (8, N'Skirt', N'skirt')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (9, N'Clothes', N'clothes')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (10, N'Sandals', N'sandals')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (11, N'Game boy', N'game-boy')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (12, N'Coat hanger', N'coat-hanger')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (13, N'Fridge', N'fridge')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (14, N'Sweatshirt', N'sweatshirt')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (15, N'Lamp shade', N'lamp-shade')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (16, N'Lampshade', N'lampshade')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (17, N'Fridge freezer', N'fridge-freezer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (18, N'Fridge-freezer', N'fridge-freezer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (19, N'House', N'house')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (20, N'Garden', N'garden')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (23, N'Clothes rail', N'clothes')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (25, N'Speakers', N'speakers')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (26, N'Furniture', N'furniture')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (27, N'Armchair', N'armchair')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (28, N'French doors', N'french doors')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (29, N'Desktop', N'desktop')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (30, N'PC', N'pc')
SET IDENTITY_INSERT [dbo].[Tags] OFF
/****** Object:  Table [dbo].[Roles]    Script Date: 02/10/2010 19:45:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleLevel] [int] NOT NULL,
	[RoleName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT [dbo].[Roles] ([RoleId], [RoleLevel], [RoleName]) VALUES (1, 3, N'Author')
INSERT [dbo].[Roles] ([RoleId], [RoleLevel], [RoleName]) VALUES (2, 1, N'Administrator')
INSERT [dbo].[Roles] ([RoleId], [RoleLevel], [RoleName]) VALUES (3, 2, N'Editor')
INSERT [dbo].[Roles] ([RoleId], [RoleLevel], [RoleName]) VALUES (4, 4, N'External User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 02/10/2010 19:45:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserEmail] [nvarchar](250) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[UserPostcode] [nvarchar](10) NULL,
	[UserSearchRadiusMiles] [int] NOT NULL,
	[UserLink] [nvarchar](250) NULL,
	[UserIsActive] [bit] NOT NULL,
	[UserDateCreated] [datetime] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([UserId], [UserName], [UserEmail], [UserPassword], [UserPostcode], [UserSearchRadiusMiles], [UserLink], [UserIsActive], [UserDateCreated], [RoleId]) VALUES (1, N'wish4lifeoriley1', N'user@yahoo.com', N'F42343E88594581338AA', NULL, 0, N'http://profiles.yahoo.com/wish4lifeoriley', 1, CAST(0x00009CD200000000 AS DateTime), 4)
INSERT [dbo].[Users] ([UserId], [UserName], [UserEmail], [UserPassword], [UserPostcode], [UserSearchRadiusMiles], [UserLink], [UserIsActive], [UserDateCreated], [RoleId]) VALUES (2, N'shewhodigs1 ', N'user@yahoo.com', N'F42343E88594581338AA', NULL, 0, N'http://profiles.yahoo.com/shewhodigs1', 1, CAST(0x00009CD200000000 AS DateTime), 4)
INSERT [dbo].[Users] ([UserId], [UserName], [UserEmail], [UserPassword], [UserPostcode], [UserSearchRadiusMiles], [UserLink], [UserIsActive], [UserDateCreated], [RoleId]) VALUES (6, N'mel8258 ', N'user@yahoo.com', N'F42343E88594581338AA', NULL, 0, N'http://profiles.yahoo.com/mel8258 ', 1, CAST(0x00009CD200000000 AS DateTime), 4)
INSERT [dbo].[Users] ([UserId], [UserName], [UserEmail], [UserPassword], [UserPostcode], [UserSearchRadiusMiles], [UserLink], [UserIsActive], [UserDateCreated], [RoleId]) VALUES (7, N'bluemerle38', N'user@yahoo.com', N'F42343E88594581338AA', NULL, 0, N'http://profiles.yahoo.com/bluemerle38', 1, CAST(0x00009CD200000000 AS DateTime), 4)
INSERT [dbo].[Users] ([UserId], [UserName], [UserEmail], [UserPassword], [UserPostcode], [UserSearchRadiusMiles], [UserLink], [UserIsActive], [UserDateCreated], [RoleId]) VALUES (8, N'Nigel Ford', N'user@yahoo.com', N'F42343E88594581338AA', NULL, 0, N'http://profiles.yahoo.com/nigel9131 ', 1, CAST(0x00009CD200000000 AS DateTime), 4)
INSERT [dbo].[Users] ([UserId], [UserName], [UserEmail], [UserPassword], [UserPostcode], [UserSearchRadiusMiles], [UserLink], [UserIsActive], [UserDateCreated], [RoleId]) VALUES (9, N'b.fosberry', N'user@yahoo.com', N'F42343E88594581338AA', N'', 0, N'http://profiles.yahoo.com/b.fosberry', 1, CAST(0x00009CD200000000 AS DateTime), 4)
INSERT [dbo].[Users] ([UserId], [UserName], [UserEmail], [UserPassword], [UserPostcode], [UserSearchRadiusMiles], [UserLink], [UserIsActive], [UserDateCreated], [RoleId]) VALUES (10, N'sclode', N'sclode@hodes.co.uk', N'1B4E9835735B0FB2EF62623D0E392EC40E0C339F', N'', 0, N'', 1, CAST(0x00009CF500B87838 AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Feeds]    Script Date: 02/10/2010 19:45:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feeds](
	[FeedId] [int] IDENTITY(1,1) NOT NULL,
	[FeedName] [nvarchar](250) NOT NULL,
	[FeedFriendlyUrl] [nvarchar](250) NOT NULL,
	[FeedUrl] [nvarchar](250) NOT NULL,
	[FeedUsername] [nvarchar](250) NULL,
	[FeedPassword] [nvarchar](250) NULL,
	[FeedCheckIntervalTicks] [int] NOT NULL,
	[FeedLastUpdateHttpStatus] [nvarchar](50) NULL,
	[FeedLastUpdateDateTime] [datetime] NULL,
	[FeedCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Feeds] PRIMARY KEY CLUSTERED 
(
	[FeedId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Feeds] ON
INSERT [dbo].[Feeds] ([FeedId], [FeedName], [FeedFriendlyUrl], [FeedUrl], [FeedUsername], [FeedPassword], [FeedCheckIntervalTicks], [FeedLastUpdateHttpStatus], [FeedLastUpdateDateTime], [FeedCategoryId]) VALUES (1, N'Hastings Freecycle', N'hastings-freecycle', N'http://groups.yahoo.com/group/hastings-freecycle/messages/?xm=1&o=1&l=1&m=e', N'noostu', N'edinburgh', 10000, N'200', CAST(0x00009BCC00000000 AS DateTime), 1)
INSERT [dbo].[Feeds] ([FeedId], [FeedName], [FeedFriendlyUrl], [FeedUrl], [FeedUsername], [FeedPassword], [FeedCheckIntervalTicks], [FeedLastUpdateHttpStatus], [FeedLastUpdateDateTime], [FeedCategoryId]) VALUES (2, N'Rye Freecycle', N'rye-freecycle', N'http://groups.yahoo.com/group/rye-freecycle/messages/?xm=1&o=1&l=1&m=e', N'noostu', N'edinburgh', 10000, N'200', CAST(0x00009BC900000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Feeds] OFF
/****** Object:  Table [dbo].[Locations]    Script Date: 02/10/2010 19:45:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationParentId] [int] NULL,
	[LocationName] [nvarchar](250) NOT NULL,
	[LocationFriendlyUrl] [nvarchar](250) NULL,
	[LocationCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Locations] ON
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (1, 2, N'East Sussex', N'east-sussex', 2)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (2, 0, N'UK', N'uk', 1)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (3, 1, N'Brede', N'brede', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (4, 1, N'Hastings', N'hastings', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (5, NULL, N'TN34', N'tn34', 4)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (6, NULL, N'TN38', N'tn38', 4)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (9, 4, N'Warrior Square', N'warrior-square', 5)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (10, 4, N'Hollington ', N'hollington', 5)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (11, 1, N'Sedlescombe', N'sedlescombe', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (12, NULL, N'TN37', N'tn37', 4)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (13, 1, N'St Leonards on sea', N'st-leonards-on-sea', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (14, 1, N'Rye', N'rye', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (15, NULL, N'TN31', N'tn31', 4)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (16, 1, N'Northiam', N'northiam', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (17, 1, N'Beckley', N'beckley', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (18, 1, N'Udimore', N'udimore', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (19, 1, N'Cripps Corner', N'cripps-corner', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (20, 2, N'Kent', N'kent', 2)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (21, NULL, N'St Leonards', N'st-leonards', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationFriendlyUrl], [LocationCategoryId]) VALUES (22, NULL, N'The Green', N'the-green', 3)
SET IDENTITY_INSERT [dbo].[Locations] OFF
/****** Object:  Table [dbo].[Posts]    Script Date: 02/10/2010 19:45:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[PostParentId] [int] NOT NULL,
	[PostGuid] [nvarchar](250) NOT NULL,
	[PostUrl] [nvarchar](250) NOT NULL,
	[PostTitle] [nvarchar](250) NOT NULL,
	[PostBody] [nvarchar](max) NOT NULL,
	[PostDateTime] [datetime] NOT NULL,
	[PostCategoryId] [int] NOT NULL,
	[PostLatitude] [float] NULL,
	[PostLongitude] [float] NULL,
	[PostDisplay] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
	[FeedId] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Posts] ON
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (2, 0, N'36909', N'http://groups.yahoo.com/group/hastings-freecycle/message/36909?l=1', N'Wanted please; 6ft clothes rail', N'Hi I need a 6t clothes rail and can collect at any time many thanks paula', CAST(0x00009CAE00C3D4D0 AS DateTime), 2, 50.12, 0.23, 1, 2, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (3, 0, N'36908', N'http://groups.yahoo.com/group/hastings-freecycle/message/36908?l=1', N'Wanted- roofing felt for shed TN38', N'Wanted: roofing felt for shed, please.
Having Freecycled our end of roll a couple of years ago, we now need some to
repair a leaking allotment shed.

Thanks,
Sarah', CAST(0x00009CAE00BFFC70 AS DateTime), 2, 50.1111, 0.1221, 1, 2, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (4, 0, N'36907', N'http://groups.yahoo.com/group/hastings-freecycle/message/36907?l=1', N'OFFERED: 2 seater sofa TN38', N'This sofa is cream with removeable covers... It does need a wash as it has been
in daughters bedroom so the arms are filthy, but I do not have time to wash it
as it needs to go asap.

It will fit in an estate car.....

Collection from opposite Tescos Hollington

Mel', CAST(0x00009CAE00BBDDC0 AS DateTime), 1, 52.1111, 0.2133, 1, 6, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (6, 0, N'36906', N'http://groups.yahoo.com/group/hastings-freecycle/message/36906?l=1', N'OFFERED - few items here, might be worth a read! TN38 hollington area', N'	

Hi freecyclers

1. ladies size 20 red dress, brand new with tags! Below knee length, long
sleeves. crossover front with a silver buckle type decoration.

2. ladies size 18 two piece skirt suit. Below knee length skirt with a part
elasticated waist. Long line jacket with buttons most of the way down, similar
style to a chinese jacket. Peach colour

3. black sack of girls clothes. mainly 3/4 years but there are some 4/5 years.
also sandals and crocs in the bag as well.

4. weakest link battery operated game, fully working just not used anymore

5. carrier bag of childrens coat hangers, assorted styles and sizes

Please email me your phone number so i can contact you. I will not be replying
to emails to arrange collection as I have had so many non responses in the past.

Thank you for reading', CAST(0x00009CAE00B4FFF0 AS DateTime), 1, 51.1111, 0.433, 1, 7, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (11, 0, N'36905', N'http://groups.yahoo.com/group/hastings-freecycle/message/36905?l=1', N'OFFERED Built-In Fridge Sedlescombe', N'Ariston, probably 9 yrs old (came with the house so might be newer, but not
older).

Works fine - we just needed a larger one. With large freezer/icebox
compartment and all internal shelves, trays etc etc Fits a unit 560mm deep,
560mm wide, 1780 high.

Could perhaps be freestanding but youd need to fit a door handle (its
designed to be concealed so theres a device for attaching the fridge door
to the inside of a cupboard door.



Might be able to provide transport to your front door.

Were in Sedlescombe.





Regards

Nigel', CAST(0x00009CAE00B054A0 AS DateTime), 1, 50, 0.2332, 1, 8, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (13, 0, N'36885', N'http://groups.yahoo.com/group/hastings-freecycle/message/36885?l=1', N'wanted undercounter fidge with freezer compartment', N'anythings a possibility x', CAST(0x00009CAD0112EED0 AS DateTime), 2, 50.12213, 0.123123, 1, 2, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (14, 15, N'36881', N'http://groups.yahoo.com/group/hastings-freecycle/message/36881?l=1', N'Taken - Grove School sweatshirts, lampshades still available.', N'Thank you for your interest, these have now gone.', CAST(0x00009CAD00A4CB80 AS DateTime), 3, 49.989, 0.123111, 1, 9, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (15, 0, N'36857', N'http://groups.yahoo.com/group/hastings-freecycle/message/36857?l=1', N'Offered - Grove School polo and sweatshirts.', N'2 sweatshirts, one from wards size medium, one made by uneek, size XS. 3 polo shirts, one from wards size 36, 2 fruit of the loom 152cm. Must be picked up today. TN37  area.', CAST(0x00009CAD009DEDB0 AS DateTime), 1, 49.989, 0.123111, 1, 9, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (24, 0, N'http://tests', N'http://tests', N'Another sofa in brede', N'another test', CAST(0x00009D17008E8C30 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (25, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40263?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40263?l=1', N'WANTED AND OFFERED: TN34: Wanted - piece of carpet approx. size', N'9ft x 9ft or similar.  Required for newly set up garage &quot;gym&quot; (in the loosest
sense of the word)so not too fussed on colour.

Also OFFERED: White (plasticised) expandable clothes airer. Used but still
serviceable!

Drop me a line and I''ll get back to you via e mail. We
based (upper part) St Helens Down just off The Ridge.', CAST(0x00009D1801217D60 AS DateTime), 1, 0, 0, 1, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (26, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40262?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40262?l=1', N're:Taken', N'Cot mattress taken and collected.  Sorry to those who missed out.

[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (27, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40261?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40261?l=1', N'WANTED: Small working fridge for Pier Trust', N'Hi everyone,

Hastings Pier &amp; White Rock Trust are seeking a small, working fridge for their
shop so the volunteers can have a cup of tea to keep them going!

We can collect.

Thanks in advance.

Angela', CAST(0x00009D1801217D60 AS DateTime), 2, 0, 0, 1, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (28, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40260?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40260?l=1', N'WANTED--PLEASE HELP', N'please can anyone help.....i am moving in to my first flat in 2 weeks and my
money funds have pretty much dryed up theres a few things i still need so if
anyone could help with the following i would be soooo greatful!!!!
tv stand holds 32&quot; tv
sofa
washing machine
small dining table and chairs
moving boxes!!
small coffee table
thanks in advance becci




[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (29, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40259?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40259?l=1', N'Taken- rug and wall lights', N'Thank you to everone who expressed an interest.






From:[mailto:] On Behalf Of Judie Struys
Sent: 07 February 2010 13:39
To:Subject: [hastings-freecycle] Fw: offered- rug and wall lights




Rug: - Mid cherry
red and all wool. Self-coloured embossed pattern. Very slightly attacked by
kittens round the edges but not so you''d really notice
Wall lights - Each has two arms. They are green painted metal with opaque (sort
of rough) tulip shaped glass shades that point upwards.

[Non-text portions of this message have been removed]

No virus
found in this incoming message.
Checked by AVG - www.avg.com
Version: 8.5.435 / Virus Database: 271.1.1/2673 - Release Date: 02/07/10
07:22:00




[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (30, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40258?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40258?l=1', N'Wanted Items TN38', N'My Daughter and Son in-law are just about to move into a new flat. They are
looking for book-shelves (they are both avid readers and have masses of books),
an armchair and a fridge-freezer (not enough room for seperates).
Would love to hear from anyone that can help with any of these.
Kind regards, Debra



_________________________________________________________________
Do you have a story that started on Hotmail? Tell us now[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (31, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40257?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40257?l=1', N'Wanted sponge or foam for pets bed.', N'Hi all, has anyone got a piece of sponge or foam about 6 foot long by 2 foot
wide please. Can collect.thanks Charlie.', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (32, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40256?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40256?l=1', N'Taken Printer Inks', N'Epson compat. inks gone. Just like that.', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (33, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40255?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40255?l=1', N'OFFERED - Various', N'Yet more stuff......

2 desktop printer stands - printer sits on top and beneath there is a sliding
paper storage tray and smaller storage compartment.  Unless you have a very good
reason for wanting both I will split them between two freecyclers.

Stacking filing trays - 2 plastic trays with metal supports.  Holds A4 papers. 
Red &amp; black

Chambers Everyday Dictionary.  Hardback edition

The Oxford Popular Dictionary and Thesaurus. Hardback edition

Philips PC Camera plus 2 software discs

Web Designer''s Guide to Front Page For Windows &amp; Mac.  Complete with Front Page
software disk.  Big, heavy paperback, so can also be used as a doorstop.

BT Voyager 100 USB ADSL Modem.  Boxed with USB lead and phone lead adapter
thingy.

Motorola Talkabout mobile phone with charger.  No Sim card or manual.  VERY
basic phone.

Which? Electronic Organiser with manual.

Personal Digital Assistant with instructions.  Came free with something a while
back.  Never been used.

Collection from St Leonards, near Tesco

Sandra

[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (34, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40254?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40254?l=1', N'Offered Parrot Cage', N'Hi,
To start with I live in Sedlescombe and the items you will have to arrange pick
up.

I have a Parrot Cage which will be suitable for a parrot or anything of a
similar type of size  and a metal chair which has a vinyl seat and back rest to
it.
If interested please call Paul on 01424 871610

[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (35, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40253?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40253?l=1', N'OFFERED VARIOUS TN35 WESTFIELD', N'One old toshiba Laptop. Don''t get excited. really doesnt work on account that my
son has ripped it to shreds in a bid to &quot;find out how it works&quot; it has no hard
drive either. The screen is ok and the battery is there.  anything else is a
bonus.  it may be ok for spares?

Electrolux hoover bags for an upright hoover.

Wall tiles  ( approx 50) in shades of blue, lilac.

Bop it childs toy    Still offered!!!  electronic sound thing.

Bathroom corner cabinet in white, with mirror.  needs a good clean but would be
ok after that.  too good to tip


I will wait a while before deciding who to give to,', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (36, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40252?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40252?l=1', N'Offered TN37 TV Cabinett .', N'Hi , I have a Mahogony TV cabinett , the type where the TV goes inside . Also
has a Mock draw for DVD ,Video. Must go by Thursday or its off to the tip.
Harrow Lane. Land line only please.', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (37, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40251?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40251?l=1', N'OFFERED Printer Ink', N'&gt; Epson compatible inks for Epson stylus photo
&gt; R200/R300/R300M/R320/RX500/RX600/RX620
&gt; Magenta, light magenta, cyan, black (Inkrite)
  Epson stylus Color
&gt; 740/850/860/1160/1520: black (Jet-tec)', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (38, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40250?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40250?l=1', N'wanted', N'hi all freecyclers does any body have a old dart dart board and darts they no
longer need plz email and let me know thanks
carl', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (39, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40249?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40249?l=1', N'Wanted - Alvin the Chipmunk - McDonalds Toy', N'Hi All,

My little boy loves all things Alvin right now and keeps asking if we can have
an Alvin toy, i.e. the red one that McDonalds has been giving away.  He''s got
the other two boys and doesn''t want the girly ones, &quot;euggh!&quot; in his words.

Just wondered if anyone had one lying around looking for a place to go.

Many thanks,

Adam.', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (40, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40248?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40248?l=1', N'wanted playstation 1 controllers', N'just wondering if anyone had any ps 1 controlollers and games they dnt want also
im in need of a ide pc harddrive it would be wiped of all information and xp
installed on it for my pc thanks can collect anytime', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (41, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40247?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40247?l=1', N'WANTED. DIGI BOX.', N'HI ALL, HAS NAYONE GOT A FREEVIEW DIGI BOX I CAN HAVE PLEASE, CAN COLLECT. MANY
THANKS MARTIN.', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (42, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40246?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40246?l=1', N'Wanted: red cotton material', N'Dear all

am after an old red sheet or similar.  Doesn''t matter if it is ripped as I am
making some bunting (and already have blue and white sheets).

Thanks
Ali', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (43, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40245?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40245?l=1', N'OFFERED - Various!', N'Ongoing household cull has revealed the following:

Original Sony Walkman personal cassette player in case with earphones.  Plus
assorted pre-recorded cassette tapes.  To go as one lot!

Olympus Trip S.  A bit old and battered.  Pre-digital, needs proper film!

Kodak DC210 digital camera.  Elderly but in perfect condition.  Comes with case,
mains adapter, manuals and software.  Not cutting edge, but digital
nevertheless.

''The Event Manager''s Bible'' - complete guide to planning and organising a
voluntary or public event.  Comes with separate event planning kit booklet.  I''d
like these to go to a local voluntary or community group rather than an
individual, so if you want to request them, let me know how they''ll be used
please.

Reader''s Digest ''Teach Yourself Computers and the Internet Visually''.  Useful
tome for anyone who has absolutely no experience of computers whatsoever!

Reader''s Digest ''How To Do Just About Anything On A Computer''  As above, step by
step illustrated instructions for how to do loads of stuff.  Both of these books
would be perfect for anyone just starting out with a computer, eg aspiring
silver surfers etc.

Collect from St. Leonards near Tesco.  I''ll wait till tomorrow before allocating
items to give those on digest a chance!

Sandra



[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (44, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40244?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40244?l=1', N'OFFERED: KENWOOD TABLE TOP MINI DISHWASHER', N'Hi,
I�have a silver Kenwood table top dishwasher to offer for spares or repair. It
seems to be leaking from the bottom corners of the door, unfortunately the
warranty has run out!
So if you are clever with these things,�you�are welcome to�have it.
You will have to collect�from near St leonards sea front as I do not drive.
Emails with a contact number please and I will get back to you to arrange
viewing/collection.
NO TIME WASTERS PLEASE!

THANKS FOR READING,

Kim�





[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (45, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40243?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40243?l=1', N'Offered Again: A4 4-Ring Binders, ALSO Electric hairdryer Hollington, St Leonards', N'Hello Chaps and Chapesses

I cleaned up some more A4 4-Ring Binders and have passed on 9 so far; there
remain another 8 on offer if anyone else wants.

Also offered a Pifco Princess Hairdryer with stand, hose and hood..� It probably
dates from the 1970s but still works and has been kept in its original box.

Bryan




[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (46, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40242?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40242?l=1', N'OFFERED: Items for girl''s bedroom', N'There are a few items which have come from my daughter''s old bedroom - she is
now a little older and had grown out of the stuff - there is absolutely nothing
wrong with them - would suit a girl''s bedroom who is under 10 maybe

SIX HOOK COAT/BAG HANGER - PRETTY COLOURFUL BEACH HOUSE DESIGN

CEILING LAMPSHADE - HANGING BLUE AND WHITE FLOWERS IN CHANDELIER STYLE

A BEAUTIFUL LILAC MOSQUITO STYLE NET WITH PRETTY PINK FABRIC FLOWERS SEWN ON -
HANGS FROM A CIRCULAR TUBE SUSPENDED FROM CEILING AND DRAPES ALL ACROSS THE SIZE
OF THE BED.

LARGE PINK PLASTIC FLORAL WALL LIGHT.

A FEW OTHER LITTLE DECORATIONS FOR HANGING OR PUTTING ON SHELVES

Thanks for your time', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (47, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40241?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40241?l=1', N'Taken: Old doll''s House - magazines still avaiable', N'The doll''s house went very quickly to a very deserving family - so sorry to
disappoint so many people.

The fishing and animal and bird magazines are still available





[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (48, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40240?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40240?l=1', N'Offered: Small packaging materials', N'I have on offer a variety of padded envelopes, some cardboard packaging off
books, a couple of small boxes and a few single DVD boxes all used when I have
been sent books or discs.

May be handy for a charity shop or an ebayer.

Collect Sedlescombe or may be able to deliver if to a local charity.

Mags', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (49, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40239?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40239?l=1', N'TAKEN: Casio CTK-601 Keyboard', N'Sorry to all of you who tried, but the keyboard now has a new home.

Catrina', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (50, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40238?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40238?l=1', N'RECEIVED: Books', N'Thanks to Ann for the books!

Caz




[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (51, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40237?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40237?l=1', N'RECEIVED: Cake turntable', N'Thanks to Bev for the cake turntable, it''s perfect!

Caz




[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (52, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40236?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40236?l=1', N'RE: offered again again', N'Ok I have tried to give this away twice now and people keep saying they want it
but not getting back to me.  PLEASE only respond if genuinely interested.

I have a cot matttess in very good condition.  My daughter used it for 18 months
but it has never been soiled and i would hate to just throw it away but I may
have to if no one wants it.

Please leave me your number and I will call you to arrange collection.

Tthanks for reading.

tina
Clive Vale


[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (53, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40235?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40235?l=1', N'Offered- from nr Morrisons, old quilt', N'I''ve just upgraded the continental quilt so the old one''s on offer. Although
it''s not very old and it''s clean, the cover has torn so the stuffing has fallen
out and it''s not a high quality quilt (hence the replacement). It would be
useful for a dog''s bed or the stuffing may be useful for craft projects.
Heather

[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (54, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40234?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40234?l=1', N'Wanted - Carpet a small bit', N'Hi I am in need of a bit of carpet no smaller than a foot wide, and about 2.5
meters long or 2 smaller bits that I can join together etc.
Colour not a problem.
Can collect any time to suit.

Many thanks
Charley', CAST(0x00009D180121A5C6 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (55, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40297?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40297?l=1', N'Wanted: Wooden trunk', N'I am looking for a wooden trunk for clothes storage if anyone has a
spare or one they no longer need.



[Non-text portions of this message have been removed]', CAST(0x00009D180156B24C AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (56, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40296?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40296?l=1', N'WANTED: TN34 SPEAKERS FOR COMPUTER', N'Does anyone have a spare pair of speakers to plug into a computer? My new
monitor doesn''t have sound. I don''t have transport so Hastings/St Leonards area
is best for me. Thanks!', CAST(0x00009D1801567FB0 AS DateTime), 2, 0, 0, 1, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (57, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40295?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40295?l=1', N'Re -offered Sofa Bed and armchair', N'Perhaps I should explain these are a matching pair in yellow and are what I
would call ''proper'' furniture. i.e. not small, they have a good wooden frame
and are upholstered. The sofa bed has a pull out metal framed bed it''s not
just a futon. The kids have made the yellow mucky, which is why we are
getting new things but I think they will steam clean well. Could do with it
gone at the weekend.



Keith



[Non-text portions of this message have been removed]', CAST(0x00009D1801567FB0 AS DateTime), 1, 0, 0, 1, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (58, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40294?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40294?l=1', N'TAKEN - assorted', N'Collected today, Kodak digital camera, one printer stand, Event Manager''s Bible.

Taken subject to collection - Walkman and tapes, dictionaries, webcam and
camera.

Still on offer :-

1 desktop printer stand - printer sits on top and beneath there is a sliding
paper storage tray and smaller storage compartment.

Web Designer''s Guide to Front Page For Windows &amp; Mac. Complete with Front Page
software disk. Big, heavy paperback, so can also be used as a doorstop.

BT Voyager 100 USB ADSL Modem. Boxed with USB lead, microfilter and phone lead
adapter thingy.

Motorola Talkabout mobile phone with charger. No Sim card or manual. VERY basic
phone.

Which? Electronic Organiser with manual.

Personal Digital Assistant with instructions. Came free with something a while
back. Never been used.

Reader''s Digest ''Teach Yourself Computers and the Internet Visually''. Useful
hardback reference book for anyone who has absolutely no experience of computers
whatsoever!

Reader''s Digest ''How To Do Just About Anything On A Computer'' As above, step by
step illustrated instructions for how to do loads of stuff. Both of these books
would be perfect for anyone just starting out with a computer, eg aspiring
silver surfers etc.

Collection from St. Leonards near Tesco

Sandra





[Non-text portions of this message have been removed]', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (59, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40293?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40293?l=1', N'Offered - internal glazed French doors', N'A set of two (one pair) of stained (medium brown), glazed, wooden internal
French doors each door measures 26 and a half inches wide and 77 inches high. 
They are good quality and in excellant condition and have 15 panes of glass in
each door.  Each pane of glass is bevelled and stippled in the middle. They
could be painted to match decor!

Collect from just off The Green in St Leonards', CAST(0x00009D1801567FB0 AS DateTime), 1, 0, 0, 1, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (60, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40292?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40292?l=1', N'Wanted: PC Power supply', N'Hi all
has anyone got a desktop pc power supply or an old desktop pc i can rob some
parts, a 300w + power supply even if its still in the tower case,
please email.
thanks for reading
Steve', CAST(0x00009D1801567FB0 AS DateTime), 2, 0, 0, 1, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (61, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40291?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40291?l=1', N'wanted - turf or grass seed, any quantity or type', N'The allotment has taken a real beating over the last few months and there
doesn''t appear to be much grass left on the pathways! So, if anyone has any turf
or grass seed surplus to requirements, I will gladly come and pick it up.
Thanks, Anton.', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (62, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40290?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40290?l=1', N'Wanted: ''Lexx'' DVDs or videos', N'Hi all,

I''m looking for any old ''Lexx'' (sci-fi programme on tv about 10 years ago)
videos or dvds you might not want anymore, on behalf of my husband...

01424/ 850816

Cheers, Katherine', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (63, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40289?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40289?l=1', N'WANTED PLEASE: LARGE DOG BED', N'Hi, I still need one large dog bed please, preferably plastic so I can scrub,
its for a fully grown lab.
Many thanks
Pauline', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (64, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40288?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40288?l=1', N'WANTED: electric fire and Blinds TN34 Blacklands', N'Has anyone got a electric bar fire and window blinds about 4'' to 5''
Thanks Chris





[Non-text portions of this message have been removed]', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (65, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40287?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40287?l=1', N'WANTED: Table top oven/grill', N'Does anyone have a table top oven/grill they no longer use? I''m looking for
something like a Baby Belling.', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (66, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40286?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40286?l=1', N'wanted ; mircalite fastfold pushchair / buggy', N'hi
does anyone have one of these as i have the carry cot but nothing for it to go
on
many thanks
wendy', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (67, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40285?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40285?l=1', N'WANTED: Garden furniture/broom AND freezer', N'Would love if someone had some old garden furniture that is being thrown out for
new!

And looking for a tough outdoor broom to make good off all the fallen soggy
leaves.


Also, we''ve outgrown our tiny freezer and was wondering if anyone had a working
one, possibly with at least 5 drawers, on offer.


Thank you very much. I can collect whenever most convenient.', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (68, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40284?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40284?l=1', N'WANTED; kids or any bedroom warbdrows and sets', N'i have 3 kids and no wardows and chests of draws would give a good home thanks
for time kathy', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (69, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40283?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40283?l=1', N'WANTED: Various', N'I have just moved into a small flat in St leonards and would like the following
if in working order:

Small fridge sized freezer
tumble dryer
washing machine
armchair
tv cabinet
also other bits and peices if available
Can collect from local area

Thanks

Ian', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (70, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40282?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40282?l=1', N'wanted please: wicker basket/hamper (hailsham)', N'hi, please if anyone as one they no longer need id be so grateful. thanks emma', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (71, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40281?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40281?l=1', N'wanted: small working tumble dryer', N'Can collect asap

Thanks', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (72, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40280?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40280?l=1', N'Wanted: PS2 controller and/or memory card', N'hi there,

i WANT TO PLAY 2-PLAYER ON MY PS2 and need another controller and memory card -
can anyone help

x dave cleasby, hastings area...will collect

01424443008

_________________________________________________________________
Send us your Hotmail stories and be featured in our newsletter[Non-text portions of this message have been removed]', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (73, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40279?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40279?l=1', N'OFFERED: Commode and cutlery.', N'Little used commode in excellent clean condition requiring new owner.

Also have some Ikea cutlery -Stainless steell , black handles - 6 place setting
almost complete.

Emailwith phone number', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (74, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40278?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40278?l=1', N'OFFERED TN389HP BIN LINER OF LADIES CLOTHES SIZES 10-12', N'HELLO ALL I HAVE A BIN LINER OF LADIES CLOTHES SIZES 10 TO 12 JEANS,TOPS
TROUSERS, SKIRTS THANKS FOR LOOKING', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (75, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40277?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40277?l=1', N'offered (seaford)', N'hi freecyclers i have an empty pc case and small dvd player and few more bits to
find if anyone is interested? Not sure if the dvd player works as been sitting
in the loft.. As soon as i have sorted the rest out will let you all know..
Cheers steve...', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (76, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40276?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40276?l=1', N'OFFERED; HANSOL 900 P CONSOl. Approx. 18&quot;', N'I have the above which is in good working order, a bit big but good for anyone
just starting out with a computer.
Please call landline for more information. Tel; 01424 423325

Best Regards
Chris', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (77, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40275?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40275?l=1', N'OFFERED king size bed and mattress', N'Offered King size divan bed and mattress in very good condition.  Near
Bexhill High in Bexhill. Please email with landline number.


[Non-text portions of this message have been removed]', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (78, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40274?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40274?l=1', N'OFFERED. ADULT MOUNTAIN BKE.', N'HI ALL, I HAVE A GT AGGRESSOR MOUNTAIN BIKE, THE GEARS ARE BROKEN, JUST NEEDS A
NEW REAR DRALIER AND CHAIN I THINK, BUT APART FROM THAT IT''S A GREAT BIKE, VERY
LIGHT TO CARRY, IT HAS SEEN ME PROUD FOR YEARS, IT DOESNT RUST, FRONT SUSPENSION
AND 24 GEARS, SO IT''S U[P FOR GRABS. MARTIN.', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (79, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40273?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40273?l=1', N'offered', N'Hi have five mens shirts to offer they are new but need ironing
and are size 17 1/2 collar 3 white  1 pink 1blue
  Thanks for looking

Rosalind 230', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (80, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40272?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40272?l=1', N'offer - a few items - TN38', N'plastic wallets/polypockets (whatever they''re called!)
small blue file - A4
�
some kind of device/toy that makes a sound (needs battery) - its from the 70''s
little cube with colours on it and instructions for magic tricks
yellow plastic table mat - for painting with children maybe or eating
�
Shaping Hastings document about sustainability plans etc
�
cassettes with recordings in french - business french, french films
cassettes taped from radio 4: discussions on bullying and discussions on over
work
�
a few bits of crockery (blue, white and gold) - maybe for gardens or mosiacs?
�
A cd found on the road The Beatles ''love''. its scratched and doesn''t work
entirely
�
Lots of little food plastic bags/packets that are clean - if you can find a use
for them great as my cupboards are becoming a bit crammed full of them now!
�
There is probably more stuff but that is it for now.
�
Thanks, JO
�
�




[Non-text portions of this message have been removed]', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (81, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40271?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40271?l=1', N'Offered- Yamaha Organ - TN35 area', N'Yamaha Electone FC10F Electronic Organ on offer.�
�
Piece of furniture rather than just a keyboard, more details or pictures
available upon request or feel free to view.

Regards

Bob

[Non-text portions of this message have been removed]', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (82, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40270?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40270?l=1', N'OFFERED: Epson Scanner, St Helens, TN34', N'Hi everyone,

I have an Epson Perfection 2480 Flatbed Photo Scanner (in spite of name it is a
general purpose scanner)that wants a new home.  It is in good condition and was
working well when last used a couple of months ago. It is a bit slow and
cumbersome though. Comes complete with Driver and cables. My new printer scans
as well so it''s surplus to requirements.

Nick', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (83, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40269?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40269?l=1', N'Offered: Various', N'Hi, we have on offer the following:

-broken-down washing machine for spares

-broken-down tumble dryer for spares

-broken-down hoover (upright) for spares

-slightly damaged, but still usable green, round, plastic garden table (+ 4
chairs to match, but all slightly damaged, can be sat on putting 2 chairs
together...)

If anyone is interested, please email, or call 01424/ 850816.

Must be collected, as we don''t drive. Hollington area of St. Leonards.

Cheers, Katherine', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (84, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40268?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40268?l=1', N'OFFERED: Various please read, Pebsham', N'* Sofa, three seater, all removable cushions, with matching armchair and pouffe.
The chair has a few small yellow paint stains on, but they are all otherwise in
fairly good condition. The design is floral, background is a greyish blue colour
with the floral pattern a pale pinky colour. These would need to go ON Saturday
(13th Feb), not before because we won''t have anything to sit on, and not after
as we have nowhere to store them, so please don''t reply to this if you can''t
guarantee pick up on that day. You will also need extra hands and a van.

* Baby pink gilet, with furry hood, age 5-6, fairly good condition, came from
Primark (I think)

* Girls coat (pink and cream colours),with removable fleece innards and
removable hood, rather grubby, but may do for messy play, age 2-3, came from
Woolworths

* Boys coat (blue and grey colours),with removable fleece innards and removable
hood, again rather grubby, age 2-3, came from Marks and Spencers

* Girls pink duffle style coat with hood, age 4-5, well worn and abit grubby,
came from Woolworths

* Girls lilac colour light jacket with hood, age 1.5-2, came from Mackays

* Girls mauve coat with pink flowers, colour faded but lovely coat with hood
(furry trim), age 18-24mths, came from Debenhams

Thanks for reading,
Regards,
Hayley.', CAST(0x00009D180156B256 AS DateTime), 1, 0, 0, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
/****** Object:  Table [dbo].[PostTags]    Script Date: 02/10/2010 19:45:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_PostTags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PostTags] ON
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (2, 3, 2)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (3, 4, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (4, 6, 7)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (5, 6, 8)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (6, 6, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (7, 6, 10)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (8, 6, 11)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (9, 6, 12)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (10, 11, 13)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (11, 13, 13)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (12, 14, 14)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (13, 14, 15)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (14, 15, 14)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (15, 2, 8)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (17, 2, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (18, 2, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (19, 2, 23)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (20, 13, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (21, 14, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (22, 2, 2)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (23, 24, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (24, 25, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (25, 27, 13)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (26, 28, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (27, 30, 13)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (28, 30, 18)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (29, 43, 19)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (30, 46, 16)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (31, 46, 19)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (32, 47, 19)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (33, 55, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (34, 57, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (35, 67, 20)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (36, 69, 13)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (37, 74, 8)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (38, 74, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (39, 80, 20)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (40, 83, 20)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (41, 84, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (42, 56, 25)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (43, 57, 26)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (44, 57, 27)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (45, 59, 28)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (46, 60, 29)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (47, 60, 30)
SET IDENTITY_INSERT [dbo].[PostTags] OFF
/****** Object:  Table [dbo].[PostLocations]    Script Date: 02/10/2010 19:45:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostLocations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
 CONSTRAINT [PK_PostLocations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PostLocations] ON
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (1, 3, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (2, 4, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (3, 4, 10)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (4, 6, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (5, 6, 10)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (6, 11, 11)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (7, 15, 12)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (10, 2, 17)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (12, 2, 19)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (27, 2, 3)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (28, 3, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (29, 13, 3)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (30, 15, 3)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (32, 11, 3)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (33, 2, 11)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (36, 24, 3)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (37, 25, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (38, 27, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (39, 28, 14)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (40, 29, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (41, 30, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (42, 34, 11)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (43, 36, 12)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (44, 45, 14)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (45, 48, 11)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (46, 56, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (47, 56, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (48, 64, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (49, 69, 14)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (50, 71, 14)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (51, 72, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (52, 74, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (53, 80, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (54, 80, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (55, 82, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (56, 83, 10)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (57, 83, 14)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (58, 59, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (59, 59, 22)
SET IDENTITY_INSERT [dbo].[PostLocations] OFF
/****** Object:  UserDefinedFunction [dbo].[NearestMessages]    Script Date: 02/10/2010 19:45:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[NearestMessages]
	(
	@lat real,
	@long real,
	@distance int
	)
RETURNS  TABLE
AS
	RETURN
	SELECT     Posts.PostId
	FROM         Posts 
	WHERE dbo.DistanceBetween(@lat, @long, PostLatitude, PostLongitude) < @distance
GO
/****** Object:  Default [DF_Locations_LocationParentId]    Script Date: 02/10/2010 19:45:09 ******/
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_LocationParentId]  DEFAULT ((0)) FOR [LocationParentId]
GO
/****** Object:  Default [DF_Messages_MessageParentId]    Script Date: 02/10/2010 19:45:09 ******/
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Messages_MessageParentId]  DEFAULT ((0)) FOR [PostParentId]
GO
/****** Object:  ForeignKey [FK_Users_Roles]    Script Date: 02/10/2010 19:45:09 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  ForeignKey [FK_Feeds_FeedCategories]    Script Date: 02/10/2010 19:45:09 ******/
ALTER TABLE [dbo].[Feeds]  WITH CHECK ADD  CONSTRAINT [FK_Feeds_FeedCategories] FOREIGN KEY([FeedCategoryId])
REFERENCES [dbo].[FeedCategories] ([FeedCategoryId])
GO
ALTER TABLE [dbo].[Feeds] CHECK CONSTRAINT [FK_Feeds_FeedCategories]
GO
/****** Object:  ForeignKey [FK_Locations_LocationCategories]    Script Date: 02/10/2010 19:45:09 ******/
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_LocationCategories] FOREIGN KEY([LocationCategoryId])
REFERENCES [dbo].[LocationCategories] ([LocationCategoryId])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_LocationCategories]
GO
/****** Object:  ForeignKey [FK_Posts_Feeds]    Script Date: 02/10/2010 19:45:09 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Feeds] FOREIGN KEY([FeedId])
REFERENCES [dbo].[Feeds] ([FeedId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Feeds]
GO
/****** Object:  ForeignKey [FK_Posts_PostCategories]    Script Date: 02/10/2010 19:45:09 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_PostCategories] FOREIGN KEY([PostCategoryId])
REFERENCES [dbo].[PostCategories] ([PostCategoryId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_PostCategories]
GO
/****** Object:  ForeignKey [FK_Posts_Users]    Script Date: 02/10/2010 19:45:09 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
/****** Object:  ForeignKey [FK_PostTags_Posts]    Script Date: 02/10/2010 19:45:09 ******/
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Posts]
GO
/****** Object:  ForeignKey [FK_PostTags_Tags]    Script Date: 02/10/2010 19:45:09 ******/
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Tags]
GO
/****** Object:  ForeignKey [FK_PostLocations_Locations]    Script Date: 02/10/2010 19:45:09 ******/
ALTER TABLE [dbo].[PostLocations]  WITH CHECK ADD  CONSTRAINT [FK_PostLocations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostLocations] CHECK CONSTRAINT [FK_PostLocations_Locations]
GO
/****** Object:  ForeignKey [FK_PostLocations_Posts]    Script Date: 02/10/2010 19:45:09 ******/
ALTER TABLE [dbo].[PostLocations]  WITH CHECK ADD  CONSTRAINT [FK_PostLocations_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostLocations] CHECK CONSTRAINT [FK_PostLocations_Posts]
GO
