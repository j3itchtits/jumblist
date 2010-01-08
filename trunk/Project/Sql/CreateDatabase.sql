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
/****** Object:  Table [dbo].[PostCategories]    Script Date: 01/06/2010 11:54:08 ******/
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
/****** Object:  Table [dbo].[FeedCategories]    Script Date: 01/06/2010 11:54:08 ******/
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
INSERT [dbo].[FeedCategories] ([FeedCategoryId], [FeedCategoryName]) VALUES (1, N'Yahoo Freecycle Group')
INSERT [dbo].[FeedCategories] ([FeedCategoryId], [FeedCategoryName]) VALUES (2, N'Yahoo Freegle Group')
SET IDENTITY_INSERT [dbo].[FeedCategories] OFF
/****** Object:  UserDefinedFunction [dbo].[DistanceBetween]    Script Date: 01/06/2010 11:54:13 ******/
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
/****** Object:  Table [dbo].[LocationCategories]    Script Date: 01/06/2010 11:54:13 ******/
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
/****** Object:  Table [dbo].[Tags]    Script Date: 01/06/2010 11:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tags] ON
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (1, N'Clothes railer')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (2, N'Roofing felt')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (3, N'Sofa')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (7, N'Dress')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (8, N'Skirt')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (9, N'Clothes')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (10, N'Sandals')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (11, N'Game')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (12, N'Coat hanger')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (13, N'Fridge')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (14, N'Sweatshirt')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (15, N'Lamp shade')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (16, N'Lampshade')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (17, N'Fridge freezer')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (18, N'Fridge-freezer')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (19, N'House')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (20, N'Garden')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (21, N'Clothes rails')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (22, N'Clothes raill')
INSERT [dbo].[Tags] ([TagId], [TagName]) VALUES (23, N'Roofing feltt')
SET IDENTITY_INSERT [dbo].[Tags] OFF
/****** Object:  Table [dbo].[Roles]    Script Date: 01/06/2010 11:54:13 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 01/06/2010 11:54:13 ******/
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
INSERT [dbo].[Users] ([UserId], [UserName], [UserEmail], [UserPassword], [UserPostcode], [UserSearchRadiusMiles], [UserLink], [UserIsActive], [UserDateCreated], [RoleId]) VALUES (15, N'sclode', N'sclode@hodes.co.uk', N'1B4E9835735B0FB2EF62623D0E392EC40E0C339F', N'TN31 6HG', 0, N'', 1, CAST(0x00009CF40132B97C AS DateTime), 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserEmail], [UserPassword], [UserPostcode], [UserSearchRadiusMiles], [UserLink], [UserIsActive], [UserDateCreated], [RoleId]) VALUES (16, N'kris', N'kristinaclode@idnet.com', N'9653AF05F246108D5724E5DA6F5ED0E89FC69C02', N'', 0, N'', 1, CAST(0x00009CF50131E7B8 AS DateTime), 3)
INSERT [dbo].[Users] ([UserId], [UserName], [UserEmail], [UserPassword], [UserPostcode], [UserSearchRadiusMiles], [UserLink], [UserIsActive], [UserDateCreated], [RoleId]) VALUES (19, N'test', N'test@adsfasdf.com', N'92BD6CDCB445730938C6255202E262C42737325E', NULL, 0, NULL, 1, CAST(0x00009CF5013CCB14 AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserEmail], [UserPassword], [UserPostcode], [UserSearchRadiusMiles], [UserLink], [UserIsActive], [UserDateCreated], [RoleId]) VALUES (21, N''' ; DROP DATABASE Temp  --', N'sclode2@hodes.co.uk', N'1B4E9835735B0FB2EF62623D0E392EC40E0C339F', N'TN31 6HG', 0, NULL, 1, CAST(0x00009CF600C259EE AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Feeds]    Script Date: 01/06/2010 11:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feeds](
	[FeedId] [int] IDENTITY(1,1) NOT NULL,
	[FeedTitle] [nvarchar](250) NOT NULL,
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
INSERT [dbo].[Feeds] ([FeedId], [FeedTitle], [FeedUrl], [FeedUsername], [FeedPassword], [FeedCheckIntervalTicks], [FeedLastUpdateHttpStatus], [FeedLastUpdateDateTime], [FeedCategoryId]) VALUES (1, N'Hastings Freecycle Group', N'http://groups.yahoo.com/group/hastings-freecycle/messages/?xm=1&o=1&l=1&m=e', N'noostu', N'edinburgh', 10000, N'200', CAST(0x00009BCC00000000 AS DateTime), 1)
INSERT [dbo].[Feeds] ([FeedId], [FeedTitle], [FeedUrl], [FeedUsername], [FeedPassword], [FeedCheckIntervalTicks], [FeedLastUpdateHttpStatus], [FeedLastUpdateDateTime], [FeedCategoryId]) VALUES (2, N'Ryes Freecycle Group', N'http://groups.yahoo.com/group/rye-freecycle/messages/?xm=1&o=1&l=1&m=e', N'noostu', N'edinburgh', 10000, N'200', CAST(0x00009BC900000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Feeds] OFF
/****** Object:  Table [dbo].[Locations]    Script Date: 01/06/2010 11:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationParentId] [int] NULL,
	[LocationName] [nvarchar](250) NOT NULL,
	[LocationCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Locations] ON
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (1, 2, N'East Sussex', 2)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (2, 0, N'UK', 1)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (3, 1, N'Brede', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (4, 1, N'Hastings', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (5, NULL, N'TN34', 4)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (6, NULL, N'TN38', 4)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (9, 4, N'Warrior Square', 5)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (10, 4, N'Hollington ', 5)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (11, 1, N'Sedlescombe', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (12, NULL, N'TN37', 4)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (13, 1, N'St Leonards on sea', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (14, 1, N'Rye', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (15, NULL, N'TN31', 4)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (16, 1, N'Northiam', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (17, 1, N'Beckley', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (18, 1, N'Udimore', 3)
INSERT [dbo].[Locations] ([LocationId], [LocationParentId], [LocationName], [LocationCategoryId]) VALUES (19, 1, N'Cripps Corner', 3)
SET IDENTITY_INSERT [dbo].[Locations] OFF
/****** Object:  Table [dbo].[Posts]    Script Date: 01/06/2010 11:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[PostParentId] [int] NOT NULL,
	[PostUrl] [nvarchar](250) NOT NULL,
	[PostTitle] [nvarchar](250) NOT NULL,
	[PostBody] [nvarchar](max) NOT NULL,
	[PostDateTime] [datetime] NOT NULL,
	[PostCategoryId] [int] NOT NULL,
	[PostLatitude] [float] NULL,
	[PostLongitude] [float] NULL,
	[PostDisplay] [bit] NULL,
	[UserId] [int] NOT NULL,
	[FeedId] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Posts] ON
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (2, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/36909?l=1', N'Wanted please; 6ft clothes rail', N'Hi I need a 6t clothes rail and can collect at any time many thanks paula', CAST(0x00009CAE00C3D4D0 AS DateTime), 2, 50.12, 0.23, 1, 2, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (3, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/36908?l=1', N'Wanted- roofing felt for shed TN38', N'Wanted: roofing felt for shed, please.
Having Freecycled our end of roll a couple of years ago, we now need some to
repair a leaking allotment shed.

Thanks,
Sarah', CAST(0x00009CAE00BFFC70 AS DateTime), 2, 50.1111, 0.1221, 1, 2, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (4, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/36907?l=1', N'OFFERED: 2 seater sofa TN38', N'This sofa is cream with removeable covers... It does need a wash as it has been
in daughters bedroom so the arms are filthy, but I do not have time to wash it
as it needs to go asap.

It will fit in an estate car.....

Collection from opposite Tescos Hollington

Mel', CAST(0x00009CAE00BBDDC0 AS DateTime), 1, 52.1111, 0.2133, 1, 6, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (6, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/36906?l=1', N'OFFERED - few items here, might be worth a read! TN38 hollington area', N'	

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
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (11, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/36905?l=1', N'OFFERED Built-In Fridge Sedlescombe', N'Ariston, probably 9 yrs old (came with the house so might be newer, but not
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
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (13, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/36885?l=1', N'wanted undercounter fidge with freezer compartment', N'anythings a possibility x', CAST(0x00009CAD0112EED0 AS DateTime), 2, 50.12213, 0.123123, 1, 2, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (14, 15, N'http://groups.yahoo.com/group/hastings-freecycle/message/36881?l=1', N'Taken - Grove School sweatshirts, lampshades still available.', N'Thank you for your interest, these have now gone.', CAST(0x00009CAD00A4CB80 AS DateTime), 3, 49.989, 0.123111, 1, 9, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (15, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/36857?l=1', N'Offered - Grove School polo and sweatshirts.', N'2 sweatshirts, one from wards size medium, one made by uneek, size XS. 3 polo shirts, one from wards size 36, 2 fruit of the loom 152cm. Must be picked up today. TN37  area.', CAST(0x00009CAD009DEDB0 AS DateTime), 1, 49.989, 0.123111, 1, 9, 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
/****** Object:  Table [dbo].[PostTags]    Script Date: 01/06/2010 11:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTags](
	[Id] [int] NOT NULL,
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_PostTags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PostTags] ON
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1, 2, 1)
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
SET IDENTITY_INSERT [dbo].[PostTags] OFF
/****** Object:  Table [dbo].[PostLocations]    Script Date: 01/06/2010 11:54:13 ******/
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
SET IDENTITY_INSERT [dbo].[PostLocations] OFF
/****** Object:  UserDefinedFunction [dbo].[NearestMessages]    Script Date: 01/06/2010 11:54:13 ******/
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
/****** Object:  Default [DF_Locations_LocationParentId]    Script Date: 01/06/2010 11:54:13 ******/
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_LocationParentId]  DEFAULT ((0)) FOR [LocationParentId]
GO
/****** Object:  Default [DF_Messages_MessageParentId]    Script Date: 01/06/2010 11:54:13 ******/
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Messages_MessageParentId]  DEFAULT ((0)) FOR [PostParentId]
GO
/****** Object:  ForeignKey [FK_Users_Roles]    Script Date: 01/06/2010 11:54:13 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  ForeignKey [FK_Feeds_FeedCategories]    Script Date: 01/06/2010 11:54:13 ******/
ALTER TABLE [dbo].[Feeds]  WITH CHECK ADD  CONSTRAINT [FK_Feeds_FeedCategories] FOREIGN KEY([FeedCategoryId])
REFERENCES [dbo].[FeedCategories] ([FeedCategoryId])
GO
ALTER TABLE [dbo].[Feeds] CHECK CONSTRAINT [FK_Feeds_FeedCategories]
GO
/****** Object:  ForeignKey [FK_Locations_LocationCategories]    Script Date: 01/06/2010 11:54:13 ******/
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_LocationCategories] FOREIGN KEY([LocationCategoryId])
REFERENCES [dbo].[LocationCategories] ([LocationCategoryId])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_LocationCategories]
GO
/****** Object:  ForeignKey [FK_Posts_Feeds]    Script Date: 01/06/2010 11:54:13 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Feeds] FOREIGN KEY([FeedId])
REFERENCES [dbo].[Feeds] ([FeedId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Feeds]
GO
/****** Object:  ForeignKey [FK_Posts_PostCategories]    Script Date: 01/06/2010 11:54:13 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_PostCategories] FOREIGN KEY([PostCategoryId])
REFERENCES [dbo].[PostCategories] ([PostCategoryId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_PostCategories]
GO
/****** Object:  ForeignKey [FK_Posts_Users]    Script Date: 01/06/2010 11:54:13 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
/****** Object:  ForeignKey [FK_PostTags_Posts]    Script Date: 01/06/2010 11:54:13 ******/
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Posts]
GO
/****** Object:  ForeignKey [FK_PostTags_Tags]    Script Date: 01/06/2010 11:54:13 ******/
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Tags]
GO
/****** Object:  ForeignKey [FK_PostLocations_Locations]    Script Date: 01/06/2010 11:54:13 ******/
ALTER TABLE [dbo].[PostLocations]  WITH CHECK ADD  CONSTRAINT [FK_PostLocations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostLocations] CHECK CONSTRAINT [FK_PostLocations_Locations]
GO
/****** Object:  ForeignKey [FK_PostLocations_Posts]    Script Date: 01/06/2010 11:54:13 ******/
ALTER TABLE [dbo].[PostLocations]  WITH CHECK ADD  CONSTRAINT [FK_PostLocations_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostLocations] CHECK CONSTRAINT [FK_PostLocations_Posts]
GO
