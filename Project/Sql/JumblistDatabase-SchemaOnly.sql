/****** Object:  ForeignKey [FK_FeedLocations_Feeds]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FeedLocations_Feeds]') AND parent_object_id = OBJECT_ID(N'[dbo].[FeedLocations]'))
ALTER TABLE [dbo].[FeedLocations] DROP CONSTRAINT [FK_FeedLocations_Feeds]
GO
/****** Object:  ForeignKey [FK_FeedLocations_Locations]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FeedLocations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[FeedLocations]'))
ALTER TABLE [dbo].[FeedLocations] DROP CONSTRAINT [FK_FeedLocations_Locations]
GO
/****** Object:  ForeignKey [FK_Feeds_FeedCategories]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Feeds_FeedCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Feeds]'))
ALTER TABLE [dbo].[Feeds] DROP CONSTRAINT [FK_Feeds_FeedCategories]
GO
/****** Object:  ForeignKey [FK_PostLocations_Locations]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations] DROP CONSTRAINT [FK_PostLocations_Locations]
GO
/****** Object:  ForeignKey [FK_PostLocations_Posts]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations] DROP CONSTRAINT [FK_PostLocations_Posts]
GO
/****** Object:  ForeignKey [FK_Posts_Feeds]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Feeds]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_Feeds]
GO
/****** Object:  ForeignKey [FK_Posts_PostCategories]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_PostCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_PostCategories]
GO
/****** Object:  ForeignKey [FK_Posts_Users]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_Users]
GO
/****** Object:  ForeignKey [FK_PostTags_Posts]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags] DROP CONSTRAINT [FK_PostTags_Posts]
GO
/****** Object:  ForeignKey [FK_PostTags_Tags]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Tags]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags] DROP CONSTRAINT [FK_PostTags_Tags]
GO
/****** Object:  ForeignKey [FK_Users_Roles]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  Table [dbo].[PostLocations]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostLocations]') AND type in (N'U'))
DROP TABLE [dbo].[PostLocations]
GO
/****** Object:  Table [dbo].[PostTags]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostTags]') AND type in (N'U'))
DROP TABLE [dbo].[PostTags]
GO
/****** Object:  UserDefinedFunction [dbo].[NearestMessages]    Script Date: 02/24/2010 10:14:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NearestMessages]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[NearestMessages]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Posts]') AND type in (N'U'))
DROP TABLE [dbo].[Posts]
GO
/****** Object:  Table [dbo].[FeedLocations]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FeedLocations]') AND type in (N'U'))
DROP TABLE [dbo].[FeedLocations]
GO
/****** Object:  Table [dbo].[Feeds]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Feeds]') AND type in (N'U'))
DROP TABLE [dbo].[Feeds]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[PostCategories]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostCategories]') AND type in (N'U'))
DROP TABLE [dbo].[PostCategories]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tags]') AND type in (N'U'))
DROP TABLE [dbo].[Tags]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
DROP TABLE [dbo].[Locations]
GO
/****** Object:  UserDefinedFunction [dbo].[DistanceBetween]    Script Date: 02/24/2010 10:14:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DistanceBetween]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[DistanceBetween]
GO
/****** Object:  Table [dbo].[FeedCategories]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FeedCategories]') AND type in (N'U'))
DROP TABLE [dbo].[FeedCategories]
GO
/****** Object:  Default [DF_Locations_LocationLatitude]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Locations_LocationLatitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Locations]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Locations_LocationLatitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Locations] DROP CONSTRAINT [DF_Locations_LocationLatitude]
END


End
GO
/****** Object:  Default [DF_Locations_LocationLongitude]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Locations_LocationLongitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Locations]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Locations_LocationLongitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Locations] DROP CONSTRAINT [DF_Locations_LocationLongitude]
END


End
GO
/****** Object:  Default [DF_Messages_MessageParentId]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Messages_MessageParentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Messages_MessageParentId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [DF_Messages_MessageParentId]
END


End
GO
/****** Object:  Default [DF_Posts_PostLatitude]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Posts_PostLatitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Posts_PostLatitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [DF_Posts_PostLatitude]
END


End
GO
/****** Object:  Default [DF_Posts_PostLongitude]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Posts_PostLongitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Posts_PostLongitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [DF_Posts_PostLongitude]
END


End
GO
/****** Object:  Default [DF_Users_UserLatitude]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Users_UserLatitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_UserLatitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_UserLatitude]
END


End
GO
/****** Object:  Default [DF_Users_UserLongitude]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Users_UserLongitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_UserLongitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_UserLongitude]
END


End
GO
/****** Object:  Default [DF_Users_UserSearchRadiusMiles]    Script Date: 02/24/2010 10:14:28 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Users_UserSearchRadiusMiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_UserSearchRadiusMiles]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_UserSearchRadiusMiles]
END


End
GO
/****** Object:  Table [dbo].[FeedCategories]    Script Date: 02/24/2010 10:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FeedCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FeedCategories](
	[FeedCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[FeedCategoryName] [nvarchar](255) COLLATE Latin1_General_CI_AS NOT NULL,
	[FeedCategoryType] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_FeedCategories] PRIMARY KEY CLUSTERED 
(
	[FeedCategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  UserDefinedFunction [dbo].[DistanceBetween]    Script Date: 02/24/2010 10:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DistanceBetween]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[DistanceBetween] (@Lat1 as real,
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
' 
END
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 02/24/2010 10:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](250) COLLATE Latin1_General_CI_AS NOT NULL,
	[LocationFriendlyUrl] [nvarchar](250) COLLATE Latin1_General_CI_AS NOT NULL,
	[LocationArea] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LocationLatitude] [float] NOT NULL,
	[LocationLongitude] [float] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND name = N'IX_Locations')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Locations] ON [dbo].[Locations] 
(
	[LocationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 02/24/2010 10:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tags]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](250) COLLATE Latin1_General_CI_AS NOT NULL,
	[TagFriendlyUrl] [nvarchar](250) COLLATE Latin1_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Tags]') AND name = N'IX_Tags')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Tags] ON [dbo].[Tags] 
(
	[TagName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02/24/2010 10:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleLevel] [int] NOT NULL,
	[RoleName] [nvarchar](250) COLLATE Latin1_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[PostCategories]    Script Date: 02/24/2010 10:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PostCategories](
	[PostCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[PostCategoryName] [nvarchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[PostCategorySearch] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_PostTypes] PRIMARY KEY CLUSTERED 
(
	[PostCategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/24/2010 10:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[UserEmail] [nvarchar](250) COLLATE Latin1_General_CI_AS NOT NULL,
	[UserPassword] [nvarchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[UserPostcode] [nvarchar](10) COLLATE Latin1_General_CI_AS NULL,
	[UserLatitude] [float] NOT NULL,
	[UserLongitude] [float] NOT NULL,
	[UserSearchRadiusMiles] [int] NOT NULL,
	[UserIsActive] [bit] NOT NULL,
	[UserDateCreated] [datetime] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Feeds]    Script Date: 02/24/2010 10:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Feeds]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Feeds](
	[FeedId] [int] IDENTITY(1,1) NOT NULL,
	[FeedName] [nvarchar](250) COLLATE Latin1_General_CI_AS NOT NULL,
	[FeedFriendlyUrl] [nvarchar](250) COLLATE Latin1_General_CI_AS NOT NULL,
	[FeedUrl] [nvarchar](250) COLLATE Latin1_General_CI_AS NOT NULL,
	[FeedUsername] [nvarchar](250) COLLATE Latin1_General_CI_AS NULL,
	[FeedPassword] [nvarchar](250) COLLATE Latin1_General_CI_AS NULL,
	[FeedCheckIntervalTicks] [int] NOT NULL,
	[FeedLastUpdateHttpStatus] [nvarchar](50) COLLATE Latin1_General_CI_AS NULL,
	[FeedLastUpdateDateTime] [datetime] NULL,
	[FeedCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Feeds] PRIMARY KEY CLUSTERED 
(
	[FeedId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[FeedLocations]    Script Date: 02/24/2010 10:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FeedLocations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FeedLocations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeedId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
 CONSTRAINT [PK_FeedLocations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 02/24/2010 10:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Posts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[PostParentId] [int] NOT NULL,
	[PostGuid] [nvarchar](250) COLLATE Latin1_General_CI_AS NOT NULL,
	[PostUrl] [nvarchar](250) COLLATE Latin1_General_CI_AS NOT NULL,
	[PostTitle] [nvarchar](250) COLLATE Latin1_General_CI_AS NOT NULL,
	[PostBody] [nvarchar](max) COLLATE Latin1_General_CI_AS NOT NULL,
	[PostPublishDateTime] [datetime] NOT NULL,
	[PostLastUpdatedDateTime] [datetime] NOT NULL,
	[PostLatitude] [float] NOT NULL,
	[PostLongitude] [float] NOT NULL,
	[PostCategoryId] [int] NOT NULL,
	[PostDisplay] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
	[FeedId] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  UserDefinedFunction [dbo].[NearestMessages]    Script Date: 02/24/2010 10:14:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NearestMessages]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[NearestMessages]
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
' 
END
GO
/****** Object:  Table [dbo].[PostTags]    Script Date: 02/24/2010 10:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostTags]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PostTags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_PostTags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[PostLocations]    Script Date: 02/24/2010 10:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostLocations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PostLocations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
 CONSTRAINT [PK_PostLocations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Default [DF_Locations_LocationLatitude]    Script Date: 02/24/2010 10:14:28 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Locations_LocationLatitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Locations]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Locations_LocationLatitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_LocationLatitude]  DEFAULT ((0)) FOR [LocationLatitude]
END


End
GO
/****** Object:  Default [DF_Locations_LocationLongitude]    Script Date: 02/24/2010 10:14:28 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Locations_LocationLongitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Locations]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Locations_LocationLongitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_LocationLongitude]  DEFAULT ((0)) FOR [LocationLongitude]
END


End
GO
/****** Object:  Default [DF_Messages_MessageParentId]    Script Date: 02/24/2010 10:14:28 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Messages_MessageParentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Messages_MessageParentId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Messages_MessageParentId]  DEFAULT ((0)) FOR [PostParentId]
END


End
GO
/****** Object:  Default [DF_Posts_PostLatitude]    Script Date: 02/24/2010 10:14:28 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Posts_PostLatitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Posts_PostLatitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Posts_PostLatitude]  DEFAULT ((0)) FOR [PostLatitude]
END


End
GO
/****** Object:  Default [DF_Posts_PostLongitude]    Script Date: 02/24/2010 10:14:28 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Posts_PostLongitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Posts_PostLongitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Posts_PostLongitude]  DEFAULT ((0)) FOR [PostLongitude]
END


End
GO
/****** Object:  Default [DF_Users_UserLatitude]    Script Date: 02/24/2010 10:14:28 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Users_UserLatitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_UserLatitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserLatitude]  DEFAULT ((0)) FOR [UserLatitude]
END


End
GO
/****** Object:  Default [DF_Users_UserLongitude]    Script Date: 02/24/2010 10:14:28 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Users_UserLongitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_UserLongitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserLongitude]  DEFAULT ((0)) FOR [UserLongitude]
END


End
GO
/****** Object:  Default [DF_Users_UserSearchRadiusMiles]    Script Date: 02/24/2010 10:14:28 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Users_UserSearchRadiusMiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_UserSearchRadiusMiles]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserSearchRadiusMiles]  DEFAULT ((5)) FOR [UserSearchRadiusMiles]
END


End
GO
/****** Object:  ForeignKey [FK_FeedLocations_Feeds]    Script Date: 02/24/2010 10:14:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FeedLocations_Feeds]') AND parent_object_id = OBJECT_ID(N'[dbo].[FeedLocations]'))
ALTER TABLE [dbo].[FeedLocations]  WITH CHECK ADD  CONSTRAINT [FK_FeedLocations_Feeds] FOREIGN KEY([FeedId])
REFERENCES [dbo].[Feeds] ([FeedId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FeedLocations_Feeds]') AND parent_object_id = OBJECT_ID(N'[dbo].[FeedLocations]'))
ALTER TABLE [dbo].[FeedLocations] CHECK CONSTRAINT [FK_FeedLocations_Feeds]
GO
/****** Object:  ForeignKey [FK_FeedLocations_Locations]    Script Date: 02/24/2010 10:14:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FeedLocations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[FeedLocations]'))
ALTER TABLE [dbo].[FeedLocations]  WITH CHECK ADD  CONSTRAINT [FK_FeedLocations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FeedLocations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[FeedLocations]'))
ALTER TABLE [dbo].[FeedLocations] CHECK CONSTRAINT [FK_FeedLocations_Locations]
GO
/****** Object:  ForeignKey [FK_Feeds_FeedCategories]    Script Date: 02/24/2010 10:14:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Feeds_FeedCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Feeds]'))
ALTER TABLE [dbo].[Feeds]  WITH CHECK ADD  CONSTRAINT [FK_Feeds_FeedCategories] FOREIGN KEY([FeedCategoryId])
REFERENCES [dbo].[FeedCategories] ([FeedCategoryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Feeds_FeedCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Feeds]'))
ALTER TABLE [dbo].[Feeds] CHECK CONSTRAINT [FK_Feeds_FeedCategories]
GO
/****** Object:  ForeignKey [FK_PostLocations_Locations]    Script Date: 02/24/2010 10:14:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations]  WITH CHECK ADD  CONSTRAINT [FK_PostLocations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations] CHECK CONSTRAINT [FK_PostLocations_Locations]
GO
/****** Object:  ForeignKey [FK_PostLocations_Posts]    Script Date: 02/24/2010 10:14:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations]  WITH CHECK ADD  CONSTRAINT [FK_PostLocations_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations] CHECK CONSTRAINT [FK_PostLocations_Posts]
GO
/****** Object:  ForeignKey [FK_Posts_Feeds]    Script Date: 02/24/2010 10:14:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Feeds]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Feeds] FOREIGN KEY([FeedId])
REFERENCES [dbo].[Feeds] ([FeedId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Feeds]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Feeds]
GO
/****** Object:  ForeignKey [FK_Posts_PostCategories]    Script Date: 02/24/2010 10:14:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_PostCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_PostCategories] FOREIGN KEY([PostCategoryId])
REFERENCES [dbo].[PostCategories] ([PostCategoryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_PostCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_PostCategories]
GO
/****** Object:  ForeignKey [FK_Posts_Users]    Script Date: 02/24/2010 10:14:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
/****** Object:  ForeignKey [FK_PostTags_Posts]    Script Date: 02/24/2010 10:14:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Posts]
GO
/****** Object:  ForeignKey [FK_PostTags_Tags]    Script Date: 02/24/2010 10:14:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Tags]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Tags]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Tags]
GO
/****** Object:  ForeignKey [FK_Users_Roles]    Script Date: 02/24/2010 10:14:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
