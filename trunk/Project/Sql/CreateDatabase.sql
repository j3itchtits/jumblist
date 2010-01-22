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
/****** Object:  Table [dbo].[PostCategories]    Script Date: 01/22/2010 14:26:30 ******/
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
/****** Object:  Table [dbo].[FeedCategories]    Script Date: 01/22/2010 14:26:30 ******/
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
/****** Object:  UserDefinedFunction [dbo].[DistanceBetween]    Script Date: 01/22/2010 14:26:32 ******/
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
/****** Object:  Table [dbo].[LocationCategories]    Script Date: 01/22/2010 14:26:32 ******/
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
/****** Object:  Table [dbo].[Tags]    Script Date: 01/22/2010 14:26:32 ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 01/22/2010 14:26:32 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 01/22/2010 14:26:32 ******/
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
/****** Object:  Table [dbo].[Feeds]    Script Date: 01/22/2010 14:26:32 ******/
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
INSERT [dbo].[Feeds] ([FeedId], [FeedTitle], [FeedUrl], [FeedUsername], [FeedPassword], [FeedCheckIntervalTicks], [FeedLastUpdateHttpStatus], [FeedLastUpdateDateTime], [FeedCategoryId]) VALUES (1, N'Hasting Freecycle Group', N'http://groups.yahoo.com/group/hastings-freecycle/messages/?xm=1&o=1&l=1&m=e', N'noostu', N'edinburgh', 10000, N'200', CAST(0x00009BCC00000000 AS DateTime), 1)
INSERT [dbo].[Feeds] ([FeedId], [FeedTitle], [FeedUrl], [FeedUsername], [FeedPassword], [FeedCheckIntervalTicks], [FeedLastUpdateHttpStatus], [FeedLastUpdateDateTime], [FeedCategoryId]) VALUES (2, N'Ryes Freecycle Group', N'http://groups.yahoo.com/group/rye-freecycle/messages/?xm=1&o=1&l=1&m=e', N'noostu', N'edinburgh', 10000, N'200', CAST(0x00009BC900000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Feeds] OFF
/****** Object:  Table [dbo].[Locations]    Script Date: 01/22/2010 14:26:32 ******/
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
/****** Object:  Table [dbo].[Posts]    Script Date: 01/22/2010 14:26:32 ******/
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
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (54, 0, N'http://news.bbc.co.uk/1/hi/uk_politics/8473790.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/uk_politics/8473790.stm', N'Brown to face Iraq Inquiry early', N'Gordon Brown will give evidence to the Iraq Inquiry before the general election, it is confirmed.', CAST(0x00009D0600B322FC AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (55, 0, N'http://news.bbc.co.uk/1/hi/world/asia-pacific/8474011.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/world/asia-pacific/8474011.stm', N'China rebuffs US internet demands', N'China rejects Hillary Clinton''s criticism of its internet controls, saying it could harm relations between the two countries.', CAST(0x00009D0600AE108C AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (56, 0, N'http://news.bbc.co.uk/1/hi/uk/8473869.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/uk/8473869.stm', N'Migrant Poles return claim denied', N'A leading expert on migration says claims that half of all Polish immigrants to Britain have returned home are "not true". ', CAST(0x00009D06007ED2CC AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (57, 0, N'http://news.bbc.co.uk/1/hi/business/8474046.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/business/8474046.stm', N'Bank stocks drop on Obama plans', N'European banking shares drop following President Barack Obama''s  plans to curb the activities of big US banks.', CAST(0x00009D0600991128 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (58, 0, N'http://news.bbc.co.uk/1/hi/business/8474080.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/business/8474080.stm', N'UK car production slumped in 2009', N'UK car production fell by 31% in 2009 following the collapse in the global car market, industry figures show. ', CAST(0x00009D0600A84878 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (59, 0, N'http://news.bbc.co.uk/1/hi/england/coventry_warwickshire/8473748.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/england/coventry_warwickshire/8473748.stm', N'Murdered woman ''failed'' by police', N'A woman stabbed to death by her ex-partner might still be alive if police had responded to her call appropriately, a watchdog says.
', CAST(0x00009D060000C288 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (60, 0, N'http://news.bbc.co.uk/1/hi/world/americas/8473906.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/world/americas/8473906.stm', N'Haiti port opening raises hopes', N'Efforts to rebuild Haiti''s main port are being stepped up in an effort to ensure emergency supplies reach millions still needing aid.', CAST(0x00009D0600749D84 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (61, 0, N'http://news.bbc.co.uk/1/hi/business/8474122.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/business/8474122.stm', N'UK retail sales see slow increase', N'UK retail sales volumes increased by just 0.3% between November and December according to official figures. ', CAST(0x00009D0600B1C498 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (62, 0, N'http://news.bbc.co.uk/1/hi/uk_politics/8473888.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/uk_politics/8473888.stm', N'Labour accused of ''moral failure''', N'Labour is accused of "moral failure" and presiding over a social recession, by Conservative leader David Cameron.', CAST(0x00009D0600A6DC04 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (63, 0, N'http://news.bbc.co.uk/1/hi/northern_ireland/8473802.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/northern_ireland/8473802.stm', N'Giant''s Causeway gets £3m grant', N'The new Giant''s Causeway visitors'' centre is to go ahead after years of delays and wrangling. ', CAST(0x00009D060070D460 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (64, 0, N'http://news.bbc.co.uk/1/hi/england/london/8473965.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/england/london/8473965.stm', N'Elusive eels? Concern after Thames numbers drop by 98%', N'Scientists raise concerns over the River Thames'' eco-system after its eel populations crash by 98%.', CAST(0x00009D06008C96A0 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (65, 0, N'http://news.bbc.co.uk/sport1/hi/tennis/8472852.stm', N'http://news.bbc.co.uk/go/rss/-/sport1/hi/tennis/8472852.stm', N'Live - Kohlschreiber v Nadal', N'World number two Rafael Nadal takes on Philipp Kohlschreiber in round three of the Australian Open following Andy Murray''s win over Florent Serra and Kim Clijsters'' exit at the hands of Nadia Petrova.', CAST(0x00009D050189E580 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (66, 0, N'http://news.bbc.co.uk/sport1/hi/tennis/8473909.stm', N'http://news.bbc.co.uk/go/rss/-/sport1/hi/tennis/8473909.stm', N'Murray comes through Serra test', N'Britain''s Andy Murray defeats Florent Serra 7-5 6-1 6-4 to ease into round four of the Australian Open.', CAST(0x00009D06006E26D4 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (67, 0, N'http://news.bbc.co.uk/sport1/hi/football/league_cup/8472196.stm', N'http://news.bbc.co.uk/go/rss/-/sport1/hi/football/league_cup/8472196.stm', N'Tevez hits out at ''moron'' Neville', N'Carlos Tevez brands Gary Neville a "boot-licker" and a "moron" as the Man City striker explains his Carling Cup semi-final celebration.', CAST(0x00009D0501863174 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (68, 0, N'http://newsforums.bbc.co.uk/nol/thread.jspa?forumID=7434', N'http://newsforums.bbc.co.uk/nol/thread.jspa?forumID=7434', N'What are your views on US bank reforms?', N'Barack Obama has called for new curbs on banks to prevent future financial crises. Is he right?', CAST(0x00009D0501888014 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (69, 0, N'http://news.bbc.co.uk/today/hi/today/newsid_8472000/8472980.stm', N'http://news.bbc.co.uk/go/rss/-/today/hi/today/newsid_8472000/8472980.stm', N'Going home?', N'Expert doubts half of the UK''s Polish migrants have left ', CAST(0x00009D0600837138 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (70, 0, N'http://news.bbc.co.uk/1/hi/sci/tech/8426132.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/sci/tech/8426132.stm', N'Deep, deep down', N'Rare glimpse of ocean life from way below the surface', CAST(0x00009D06008529D8 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (71, 0, N'http://news.bbc.co.uk/1/hi/magazine/8474124.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/magazine/8474124.stm', N'7 days quiz', N'Spag bol should be made with... milk, celery, red wine?', CAST(0x00009D06009C02AC AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (72, 0, N'http://news.bbc.co.uk/1/hi/world/americas/8473711.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/world/americas/8473711.stm', N'Parent trap', N'What can politicians learn from the John Edwards scandal? ', CAST(0x00009D050174C1C8 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (73, 0, N'http://news.bbc.co.uk/1/hi/uk/8471448.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/uk/8471448.stm', N'Hero''s hour?', N'Police attitude to ''have-a-go heroes'' appears to shift', CAST(0x00009D060097A70C AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (74, 0, N'http://news.bbc.co.uk/1/hi/programmes/from_our_own_correspondent/8472346.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/programmes/from_our_own_correspondent/8472346.stm', N'Blasts of anger', N'Memories make German islands a minefield for Britons', CAST(0x00009D0600960708 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (75, 0, N'http://news.bbc.co.uk/1/hi/england/8473902.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/england/8473902.stm', N'UK rescuers end Haiti quake hunt', N'A Gloucestershire-based rescue team returns from earthquake-hit Haiti after spending a week searching for survivors.', CAST(0x00009D06005BCF20 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (76, 0, N'http://news.bbc.co.uk/1/hi/scotland/glasgow_and_west/8474081.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/scotland/glasgow_and_west/8474081.stm', N'Hospital op photos ''on Facebook''', N'A hospital worker is suspended amid reports that photos of patients having operations were posted on Facebook.', CAST(0x00009D0600B44218 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (77, 0, N'http://news.bbc.co.uk/1/hi/wales/8473493.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/wales/8473493.stm', N'Mother''s brain tumour funds plea', N'The mother of a schoolgirl diagnosed with a brain tumour urges people to back a campaign for more research funding.', CAST(0x00009D0600B4DDF4 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (78, 0, N'http://news.bbc.co.uk/1/hi/northern_ireland/8473842.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/northern_ireland/8473842.stm', N'Man in court on schoolgirl murder', N'A 62-year-old man is charged with the 1981 abduction and murder of nine-year-old Jennifer Cardy near Lisburn.', CAST(0x00009D06006EDED0 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (79, 0, N'http://news.bbc.co.uk/1/hi/world/africa/8474189.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/world/africa/8474189.stm', N'Obasanjo warning to ailing leader', N'Nigeria''s ex-President Obasanjo suggests that his successor, Umaru Yar''Adua, should resign if he is too ill for office.', CAST(0x00009D0600AEDC74 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (80, 0, N'http://news.bbc.co.uk/1/hi/business/8473890.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/business/8473890.stm', N'Shares fall on Obama bank plans', N'Markets in the US and Asia fall sharply after US President Barack Obama unveils plans to regulate the banking industry.', CAST(0x00009D06008CCEE0 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (81, 0, N'http://news.bbc.co.uk/1/hi/world/middle_east/8474013.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/world/middle_east/8474013.stm', N'US envoy to hold West Bank talks', N'US Envoy George Mitchell is to meet Palestinian leaders a day after visiting Israel, in a drive to restart peace talks.', CAST(0x00009D060098BCC8 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (82, 0, N'http://news.bbc.co.uk/1/hi/world/south_asia/8473921.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/world/south_asia/8473921.stm', N'US drone ''kills Filipino militant''', N'A Filipino militant wanted by the US is believed killed in a drone strike in Pakistan near the Afghan border, officials say.', CAST(0x00009D060076D25C AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (83, 0, N'http://news.bbc.co.uk/1/hi/world/europe/8474174.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/world/europe/8474174.stm', N'Turkey nets ''al-Qaeda'' suspects', N'Turkish police arrest 120 al-Qaeda suspects in a major nationwide anti-terror operation, reports say. ', CAST(0x00009D0600AF5654 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (84, 0, N'http://news.bbc.co.uk/1/hi/world/south_asia/8473900.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/world/south_asia/8473900.stm', N'Pakistan ''wants unarmed drones''', N'The US may provide Pakistan unarmed drone aircraft to help strengthen its fight against the Taliban, US defence officials say.', CAST(0x00009D06005CF1C0 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (85, 0, N'http://news.bbc.co.uk/1/hi/business/8473167.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/business/8473167.stm', N'Fraud ''costs the UK £30bn a year''', N'Fraud - including scams, online theft, insurance cheats and tax fraud - costs the UK £30bn a year, an official estimate says.', CAST(0x00009D0600B1EC70 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (86, 0, N'http://news.bbc.co.uk/1/hi/business/8473903.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/business/8473903.stm', N'US bank plans ''in line with UK''s''', N'President Barack Obama''s plans for US banks are "very much in accordance" with Labour''s, the government says.', CAST(0x00009D0600650E50 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (87, 0, N'http://news.bbc.co.uk/1/hi/health/8471137.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/health/8471137.stm', N'Technique ''tracks'' spread of MRSA', N'Cambridge researchers have developed a technique for precisely tracking the spread of the superbug MRSA in hospitals. ', CAST(0x00009D05013DB14C AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (88, 0, N'http://news.bbc.co.uk/1/hi/education/8473517.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/education/8473517.stm', N'Ofsted finds citizenship ''gaps''', N'Schools inspectors say some schools in England are struggling to cover citizenship properly.', CAST(0x00009D060000FD20 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (89, 0, N'http://news.bbc.co.uk/1/hi/sci/tech/8470691.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/sci/tech/8470691.stm', N'Engineered cells produce light show', N'Scientists have produced a very unusual light show by engineering bacterial cells to fluoresce in synchrony.', CAST(0x00009D0600952734 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (90, 0, N'http://news.bbc.co.uk/1/hi/entertainment/8473739.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/entertainment/8473739.stm', N'Cowell signs stars for Haiti song', N'Rod Stewart, Leona Lewis, JLS and Michael Buble agree to take part in the Haiti charity single, which is being organised by Simon Cowell.', CAST(0x00009D060090DD28 AS DateTime), 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (91, 0, N'http://news.bbc.co.uk/1/hi/technology/8469632.stm', N'http://news.bbc.co.uk/go/rss/-/1/hi/technology/8469632.stm', N'Microsoft patches Explorer hole', N'Microsoft has released a patch for a hole in Internet Explorer that is thought to have been exploited by Chinese hackers.', CAST(0x00009D05012E9D24 AS DateTime), 1, 0, 0, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
/****** Object:  Table [dbo].[PostTags]    Script Date: 01/22/2010 14:26:32 ******/
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
/****** Object:  Table [dbo].[PostLocations]    Script Date: 01/22/2010 14:26:32 ******/
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
/****** Object:  UserDefinedFunction [dbo].[NearestMessages]    Script Date: 01/22/2010 14:26:32 ******/
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
/****** Object:  Default [DF_Locations_LocationParentId]    Script Date: 01/22/2010 14:26:32 ******/
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_LocationParentId]  DEFAULT ((0)) FOR [LocationParentId]
GO
/****** Object:  Default [DF_Messages_MessageParentId]    Script Date: 01/22/2010 14:26:32 ******/
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Messages_MessageParentId]  DEFAULT ((0)) FOR [PostParentId]
GO
/****** Object:  ForeignKey [FK_Users_Roles]    Script Date: 01/22/2010 14:26:32 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  ForeignKey [FK_Feeds_FeedCategories]    Script Date: 01/22/2010 14:26:32 ******/
ALTER TABLE [dbo].[Feeds]  WITH CHECK ADD  CONSTRAINT [FK_Feeds_FeedCategories] FOREIGN KEY([FeedCategoryId])
REFERENCES [dbo].[FeedCategories] ([FeedCategoryId])
GO
ALTER TABLE [dbo].[Feeds] CHECK CONSTRAINT [FK_Feeds_FeedCategories]
GO
/****** Object:  ForeignKey [FK_Locations_LocationCategories]    Script Date: 01/22/2010 14:26:32 ******/
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_LocationCategories] FOREIGN KEY([LocationCategoryId])
REFERENCES [dbo].[LocationCategories] ([LocationCategoryId])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_LocationCategories]
GO
/****** Object:  ForeignKey [FK_Posts_Feeds]    Script Date: 01/22/2010 14:26:32 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Feeds] FOREIGN KEY([FeedId])
REFERENCES [dbo].[Feeds] ([FeedId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Feeds]
GO
/****** Object:  ForeignKey [FK_Posts_PostCategories]    Script Date: 01/22/2010 14:26:32 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_PostCategories] FOREIGN KEY([PostCategoryId])
REFERENCES [dbo].[PostCategories] ([PostCategoryId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_PostCategories]
GO
/****** Object:  ForeignKey [FK_Posts_Users]    Script Date: 01/22/2010 14:26:32 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
/****** Object:  ForeignKey [FK_PostTags_Posts]    Script Date: 01/22/2010 14:26:32 ******/
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Posts]
GO
/****** Object:  ForeignKey [FK_PostTags_Tags]    Script Date: 01/22/2010 14:26:32 ******/
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Tags]
GO
/****** Object:  ForeignKey [FK_PostLocations_Locations]    Script Date: 01/22/2010 14:26:32 ******/
ALTER TABLE [dbo].[PostLocations]  WITH CHECK ADD  CONSTRAINT [FK_PostLocations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostLocations] CHECK CONSTRAINT [FK_PostLocations_Locations]
GO
/****** Object:  ForeignKey [FK_PostLocations_Posts]    Script Date: 01/22/2010 14:26:32 ******/
ALTER TABLE [dbo].[PostLocations]  WITH CHECK ADD  CONSTRAINT [FK_PostLocations_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostLocations] CHECK CONSTRAINT [FK_PostLocations_Posts]
GO
