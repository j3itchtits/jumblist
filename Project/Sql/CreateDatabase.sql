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
/****** Object:  Table [dbo].[Tags]    Script Date: 11/26/2009 09:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[TagParentId] [int] NULL,
	[TagName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tags] ON
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (1, 19, N'Clothes railer')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (2, 20, N'Roofing felt')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (3, 19, N'Sofa')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (7, 9, N'Dress')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (8, 9, N'Skirt')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (9, 19, N'Clothes')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (10, 19, N'Sandals')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (11, 19, N'Game')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (12, 19, N'Coat hanger')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (13, 19, N'Fridge')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (14, 19, N'Sweatshirt')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (15, 19, N'Lamp shade')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (16, 15, N'Lampshade')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (17, 13, N'Fridge freezer')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (18, 13, N'Fridge-freezer')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (19, 0, N'House')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (20, 0, N'Garden')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (21, 19, N'Clothes rails')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (22, 19, N'Clothes raill')
INSERT [dbo].[Tags] ([TagId], [TagParentId], [TagName]) VALUES (23, 20, N'Roofing feltt')
SET IDENTITY_INSERT [dbo].[Tags] OFF
/****** Object:  Table [dbo].[PostCategories]    Script Date: 11/26/2009 09:47:46 ******/
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
/****** Object:  Table [dbo].[FeedCategories]    Script Date: 11/26/2009 09:47:46 ******/
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
SET IDENTITY_INSERT [dbo].[FeedCategories] OFF
/****** Object:  UserDefinedFunction [dbo].[DistanceBetween]    Script Date: 11/26/2009 09:47:47 ******/
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
/****** Object:  Table [dbo].[Authors]    Script Date: 11/26/2009 09:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](250) NOT NULL,
	[AuthorProfile] [nvarchar](250) NOT NULL,
	[AuthorEmailHttpLink] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Authors] ON
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [AuthorProfile], [AuthorEmailHttpLink]) VALUES (1, N'wish4lifeoriley', N'http://profiles.yahoo.com/wish4lifeoriley', N'http://groups.yahoo.com/group/hastings-freecycle/post?postID=ENZOPaItqO_7Y8uUJdCQtCDOeuZx-cfGtf3_TagWtv-3kdnG9cZd9UolmDLqRqDSOWWrcih_gWeNrAQ64YyNU5BabuGnF59BVxrtF_exCX_GtTKu5Fwj')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [AuthorProfile], [AuthorEmailHttpLink]) VALUES (2, N'shewhodigs1 ', N'http://profiles.yahoo.com/shewhodigs1', N'http://groups.yahoo.com/group/hastings-freecycle/post?postID=r_S4hBTW6hE3fqafDdsGkMGOf5n-A4DXMnA170292d94cn2FCT9r0j-knG2exn5RfI0XKuvviqrd6aExHDBm7ad3KcFYGFrDDXZzh-D5')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [AuthorProfile], [AuthorEmailHttpLink]) VALUES (6, N'mel8258 ', N'http://profiles.yahoo.com/mel8258 ', N'http://groups.yahoo.com/group/hastings-freecycle/post?postID=gIzD0Zi9vHL9aaQhzKktSD3k8zgAhdnMnWuX2IRSPUnwOK3nmoNZfO18dEETrYq_WWyQG_pRUU02Z2l94gkonXKQSgDEOab4c3Cd1Nk')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [AuthorProfile], [AuthorEmailHttpLink]) VALUES (7, N'bluemerle38', N'http://profiles.yahoo.com/bluemerle38', N'http://groups.yahoo.com/group/hastings-freecycle/post?postID=QEeKGqvcY9q273kctJpm0VvxMfRgEw3-vrOOcoYAoaFeJLm24DfDT1jpoRc6kcsKP9SctSdwSfRJm_RAXaDRWMLF5TS7nDUhzh_nJkk')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [AuthorProfile], [AuthorEmailHttpLink]) VALUES (8, N'Nigel Ford', N'http://profiles.yahoo.com/nigel9131 ', N'http://groups.yahoo.com/group/hastings-freecycle/post?postID=gFhJMfqqfKHGcbPMpMbwYnccwhZluLZXUnV54KCsU98LF-aowGN0J-zv1ZVG2m6ZUG8FMFGrbmdS2ejHHgKEtHpe7V5kLV6x1aZvNns')
INSERT [dbo].[Authors] ([AuthorId], [AuthorName], [AuthorProfile], [AuthorEmailHttpLink]) VALUES (9, N'b.fosberry', N'http://profiles.yahoo.com/b.fosberry', N'http://groups.yahoo.com/group/hastings-freecycle/post?postID=aTtb9qoHYdJgCSDWd1FEguqcMuW8O2S6yvIOEFqDUYYkVzJy7bWVOCwzD5TY_qp-0yIH8PHTGdTbeucA3EaHDeRZpQ77j2lGKfMMuN17HbUWdbGfwTO0f7A7NfV5H_Y')
SET IDENTITY_INSERT [dbo].[Authors] OFF
/****** Object:  Table [dbo].[LocationCategories]    Script Date: 11/26/2009 09:47:47 ******/
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
/****** Object:  Table [dbo].[Feeds]    Script Date: 11/26/2009 09:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feeds](
	[FeedId] [int] IDENTITY(1,1) NOT NULL,
	[FeedTitle] [nvarchar](250) NOT NULL,
	[FeedTitleUrlEncoded] [nvarchar](250) NOT NULL,
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
INSERT [dbo].[Feeds] ([FeedId], [FeedTitle], [FeedTitleUrlEncoded], [FeedUrl], [FeedUsername], [FeedPassword], [FeedCheckIntervalTicks], [FeedLastUpdateHttpStatus], [FeedLastUpdateDateTime], [FeedCategoryId]) VALUES (1, N'Hastings Freecycle Group', N'hastings-freecycle-group', N'http://groups.yahoo.com/group/hastings-freecycle/messages/?xm=1&o=1&l=1&m=e', N'noostu', N'edinburgh', 10000, N'200', CAST(0x00009BC100000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Feeds] OFF
/****** Object:  Table [dbo].[Locations]    Script Date: 11/26/2009 09:47:47 ******/
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
/****** Object:  Table [dbo].[Posts]    Script Date: 11/26/2009 09:47:47 ******/
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
	[AuthorId] [int] NOT NULL,
	[FeedId] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Posts] ON
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [AuthorId], [FeedId]) VALUES (2, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/36909?l=1', N'Wanted please; 6ft clothes rail', N'Hi
I need a 6t clothes rail and can collect at any time
many thanks
paula', CAST(0x00009CAE00C3D4D0 AS DateTime), 2, 50.12323, 0.2334324, 1, 1, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [AuthorId], [FeedId]) VALUES (3, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/36908?l=1', N'Wanted- roofing felt for shed TN38', N'Wanted: roofing felt for shed, please.
Having Freecycled our end of roll a couple of years ago, we now need some to
repair a leaking allotment shed.

Thanks,
Sarah', CAST(0x00009CAE00BFFC70 AS DateTime), 2, 50.1111, 0.1221, 1, 2, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [AuthorId], [FeedId]) VALUES (4, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/36907?l=1', N'OFFERED: 2 seater sofa TN38', N'This sofa is cream with removeable covers... It does need a wash as it has been
in daughters bedroom so the arms are filthy, but I do not have time to wash it
as it needs to go asap.

It will fit in an estate car.....

Collection from opposite Tescos Hollington

Mel', CAST(0x00009CAE00BBDDC0 AS DateTime), 1, 52.1111, 0.2133, 1, 6, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [AuthorId], [FeedId]) VALUES (6, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/36906?l=1', N'OFFERED - few items here, might be worth a read! TN38 hollington area', N'	

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
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [AuthorId], [FeedId]) VALUES (11, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/36905?l=1', N'OFFERED Built-In Fridge Sedlescombe', N'Ariston, probably 9 yrs old (came with the house so might be newer, but not
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
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [AuthorId], [FeedId]) VALUES (13, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/36885?l=1', N'wanted undercounter fidge with freezer compartment', N'anythings a possibility x', CAST(0x00009CAD0112EED0 AS DateTime), 2, 50.12213, 0.123123, 1, 2, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [AuthorId], [FeedId]) VALUES (14, 15, N'http://groups.yahoo.com/group/hastings-freecycle/message/36881?l=1', N'Taken - Grove School sweatshirts, lampshades still available.', N'Thank you for your interest, these have now gone.', CAST(0x00009CAD00A4CB80 AS DateTime), 3, 49.989, 0.123111, 1, 9, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostUrl], [PostTitle], [PostBody], [PostDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [AuthorId], [FeedId]) VALUES (15, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/36857?l=1', N'Offered - Grove School polo and sweatshirts.', N'2 sweatshirts, one from wards size medium, one made by uneek, size XS. 3 polo shirts, one from wards size 36, 2 fruit of the loom 152cm. Must be picked up today. TN37  area.', CAST(0x00009CAD009DEDB0 AS DateTime), 1, 49.989, 0.123111, 1, 9, 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
/****** Object:  Table [dbo].[Temp]    Script Date: 11/26/2009 09:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp](
	[TempId] [int] IDENTITY(1,1) NOT NULL,
	[TempParentId] [int] NOT NULL,
	[TempName] [nvarchar](50) NOT NULL,
	[FeedId] [int] NULL,
 CONSTRAINT [PK_Temp] PRIMARY KEY CLUSTERED 
(
	[TempId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Temp] ON
INSERT [dbo].[Temp] ([TempId], [TempParentId], [TempName], [FeedId]) VALUES (1, 0, N'Hello', 1)
INSERT [dbo].[Temp] ([TempId], [TempParentId], [TempName], [FeedId]) VALUES (2, 1, N'Worlds', 1)
INSERT [dbo].[Temp] ([TempId], [TempParentId], [TempName], [FeedId]) VALUES (3, 1, N'Have', 1)
INSERT [dbo].[Temp] ([TempId], [TempParentId], [TempName], [FeedId]) VALUES (4, 1, N'WorldofWayterd', 1)
INSERT [dbo].[Temp] ([TempId], [TempParentId], [TempName], [FeedId]) VALUES (5, 0, N'World', 1)
INSERT [dbo].[Temp] ([TempId], [TempParentId], [TempName], [FeedId]) VALUES (6, 0, N'Enemies', 1)
SET IDENTITY_INSERT [dbo].[Temp] OFF
/****** Object:  Table [dbo].[PostTags]    Script Date: 11/26/2009 09:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTags](
	[PostId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_PostTags] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (2, 1)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (3, 2)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (4, 3)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (6, 7)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (6, 8)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (6, 9)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (6, 10)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (6, 11)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (6, 12)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (11, 13)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (13, 13)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (14, 14)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (14, 15)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (15, 14)
/****** Object:  Table [dbo].[PostLocations]    Script Date: 11/26/2009 09:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostLocations](
	[PostId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
 CONSTRAINT [PK_PostLocations] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[LocationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[PostLocations] ([PostId], [LocationId]) VALUES (3, 6)
INSERT [dbo].[PostLocations] ([PostId], [LocationId]) VALUES (4, 6)
INSERT [dbo].[PostLocations] ([PostId], [LocationId]) VALUES (4, 10)
INSERT [dbo].[PostLocations] ([PostId], [LocationId]) VALUES (6, 6)
INSERT [dbo].[PostLocations] ([PostId], [LocationId]) VALUES (6, 10)
INSERT [dbo].[PostLocations] ([PostId], [LocationId]) VALUES (11, 11)
INSERT [dbo].[PostLocations] ([PostId], [LocationId]) VALUES (15, 12)
/****** Object:  UserDefinedFunction [dbo].[NearestMessages]    Script Date: 11/26/2009 09:47:47 ******/
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
/****** Object:  Default [DF_Tags_TagParentId]    Script Date: 11/26/2009 09:47:46 ******/
ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_TagParentId]  DEFAULT ((0)) FOR [TagParentId]
GO
/****** Object:  Default [DF_Locations_LocationParentId]    Script Date: 11/26/2009 09:47:47 ******/
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_LocationParentId]  DEFAULT ((0)) FOR [LocationParentId]
GO
/****** Object:  Default [DF_Messages_MessageParentId]    Script Date: 11/26/2009 09:47:47 ******/
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Messages_MessageParentId]  DEFAULT ((0)) FOR [PostParentId]
GO
/****** Object:  ForeignKey [FK_Feeds_FeedCategories]    Script Date: 11/26/2009 09:47:47 ******/
ALTER TABLE [dbo].[Feeds]  WITH CHECK ADD  CONSTRAINT [FK_Feeds_FeedCategories] FOREIGN KEY([FeedCategoryId])
REFERENCES [dbo].[FeedCategories] ([FeedCategoryId])
GO
ALTER TABLE [dbo].[Feeds] CHECK CONSTRAINT [FK_Feeds_FeedCategories]
GO
/****** Object:  ForeignKey [FK_Locations_LocationCategories]    Script Date: 11/26/2009 09:47:47 ******/
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_LocationCategories] FOREIGN KEY([LocationCategoryId])
REFERENCES [dbo].[LocationCategories] ([LocationCategoryId])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_LocationCategories]
GO
/****** Object:  ForeignKey [FK_Posts_Authors]    Script Date: 11/26/2009 09:47:47 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Authors] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([AuthorId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Authors]
GO
/****** Object:  ForeignKey [FK_Posts_Feeds]    Script Date: 11/26/2009 09:47:47 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Feeds] FOREIGN KEY([FeedId])
REFERENCES [dbo].[Feeds] ([FeedId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Feeds]
GO
/****** Object:  ForeignKey [FK_Posts_PostCategories]    Script Date: 11/26/2009 09:47:47 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_PostCategories] FOREIGN KEY([PostCategoryId])
REFERENCES [dbo].[PostCategories] ([PostCategoryId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_PostCategories]
GO
/****** Object:  ForeignKey [FK_Temp_Feeds]    Script Date: 11/26/2009 09:47:47 ******/
ALTER TABLE [dbo].[Temp]  WITH CHECK ADD  CONSTRAINT [FK_Temp_Feeds] FOREIGN KEY([FeedId])
REFERENCES [dbo].[Feeds] ([FeedId])
GO
ALTER TABLE [dbo].[Temp] CHECK CONSTRAINT [FK_Temp_Feeds]
GO
/****** Object:  ForeignKey [FK_PostTags_Posts]    Script Date: 11/26/2009 09:47:47 ******/
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Posts]
GO
/****** Object:  ForeignKey [FK_PostTags_Tags]    Script Date: 11/26/2009 09:47:47 ******/
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Tags]
GO
/****** Object:  ForeignKey [FK_PostLocations_Locations]    Script Date: 11/26/2009 09:47:47 ******/
ALTER TABLE [dbo].[PostLocations]  WITH CHECK ADD  CONSTRAINT [FK_PostLocations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostLocations] CHECK CONSTRAINT [FK_PostLocations_Locations]
GO
/****** Object:  ForeignKey [FK_PostLocations_Posts]    Script Date: 11/26/2009 09:47:47 ******/
ALTER TABLE [dbo].[PostLocations]  WITH CHECK ADD  CONSTRAINT [FK_PostLocations_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostLocations] CHECK CONSTRAINT [FK_PostLocations_Posts]
GO
