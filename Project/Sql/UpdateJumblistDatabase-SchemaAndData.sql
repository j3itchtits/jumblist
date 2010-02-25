/****** Object:  ForeignKey [FK_FeedLocations_Feeds]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FeedLocations_Feeds]') AND parent_object_id = OBJECT_ID(N'[dbo].[FeedLocations]'))
ALTER TABLE [dbo].[FeedLocations] DROP CONSTRAINT [FK_FeedLocations_Feeds]
GO
/****** Object:  ForeignKey [FK_FeedLocations_Locations]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FeedLocations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[FeedLocations]'))
ALTER TABLE [dbo].[FeedLocations] DROP CONSTRAINT [FK_FeedLocations_Locations]
GO
/****** Object:  ForeignKey [FK_Feeds_FeedCategories]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Feeds_FeedCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Feeds]'))
ALTER TABLE [dbo].[Feeds] DROP CONSTRAINT [FK_Feeds_FeedCategories]
GO
/****** Object:  ForeignKey [FK_PostLocations_Locations]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations] DROP CONSTRAINT [FK_PostLocations_Locations]
GO
/****** Object:  ForeignKey [FK_PostLocations_Posts]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations] DROP CONSTRAINT [FK_PostLocations_Posts]
GO
/****** Object:  ForeignKey [FK_Posts_Feeds]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Feeds]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_Feeds]
GO
/****** Object:  ForeignKey [FK_Posts_PostCategories]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_PostCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_PostCategories]
GO
/****** Object:  ForeignKey [FK_Posts_Users]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_Users]
GO
/****** Object:  ForeignKey [FK_PostTags_Posts]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags] DROP CONSTRAINT [FK_PostTags_Posts]
GO
/****** Object:  ForeignKey [FK_PostTags_Tags]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Tags]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags] DROP CONSTRAINT [FK_PostTags_Tags]
GO
/****** Object:  ForeignKey [FK_Users_Roles]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  Table [dbo].[PostLocations]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostLocations]') AND type in (N'U'))
DROP TABLE [dbo].[PostLocations]
GO
/****** Object:  Table [dbo].[PostTags]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostTags]') AND type in (N'U'))
DROP TABLE [dbo].[PostTags]
GO
/****** Object:  UserDefinedFunction [dbo].[NearestMessages]    Script Date: 02/25/2010 17:11:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NearestMessages]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[NearestMessages]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Posts]') AND type in (N'U'))
DROP TABLE [dbo].[Posts]
GO
/****** Object:  Table [dbo].[FeedLocations]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FeedLocations]') AND type in (N'U'))
DROP TABLE [dbo].[FeedLocations]
GO
/****** Object:  Table [dbo].[Feeds]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Feeds]') AND type in (N'U'))
DROP TABLE [dbo].[Feeds]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[PostCategories]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostCategories]') AND type in (N'U'))
DROP TABLE [dbo].[PostCategories]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tags]') AND type in (N'U'))
DROP TABLE [dbo].[Tags]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
DROP TABLE [dbo].[Locations]
GO
/****** Object:  UserDefinedFunction [dbo].[DistanceBetween]    Script Date: 02/25/2010 17:11:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DistanceBetween]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[DistanceBetween]
GO
/****** Object:  Table [dbo].[FeedCategories]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FeedCategories]') AND type in (N'U'))
DROP TABLE [dbo].[FeedCategories]
GO
/****** Object:  Default [DF_Locations_LocationLatitude]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Locations_LocationLatitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Locations]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Locations_LocationLatitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Locations] DROP CONSTRAINT [DF_Locations_LocationLatitude]
END


End
GO
/****** Object:  Default [DF_Locations_LocationLongitude]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Locations_LocationLongitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Locations]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Locations_LocationLongitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Locations] DROP CONSTRAINT [DF_Locations_LocationLongitude]
END


End
GO
/****** Object:  Default [DF_Messages_MessageParentId]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Messages_MessageParentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Messages_MessageParentId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [DF_Messages_MessageParentId]
END


End
GO
/****** Object:  Default [DF_Posts_PostLatitude]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Posts_PostLatitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Posts_PostLatitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [DF_Posts_PostLatitude]
END


End
GO
/****** Object:  Default [DF_Posts_PostLongitude]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Posts_PostLongitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Posts_PostLongitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [DF_Posts_PostLongitude]
END


End
GO
/****** Object:  Default [DF_Users_UserLatitude]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Users_UserLatitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_UserLatitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_UserLatitude]
END


End
GO
/****** Object:  Default [DF_Users_UserLongitude]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Users_UserLongitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_UserLongitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_UserLongitude]
END


End
GO
/****** Object:  Default [DF_Users_UserSearchRadiusMiles]    Script Date: 02/25/2010 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Users_UserSearchRadiusMiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_UserSearchRadiusMiles]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_UserSearchRadiusMiles]
END


End
GO
/****** Object:  Table [dbo].[FeedCategories]    Script Date: 02/25/2010 17:11:38 ******/
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
SET IDENTITY_INSERT [dbo].[FeedCategories] ON
INSERT [dbo].[FeedCategories] ([FeedCategoryId], [FeedCategoryName], [FeedCategoryType]) VALUES (1, N'Freecycle Yahoo Group', N'YahooGroupsCustomHttpFeed')
INSERT [dbo].[FeedCategories] ([FeedCategoryId], [FeedCategoryName], [FeedCategoryType]) VALUES (2, N'Freegle Yahoo Group', N'YahooGroupsCustomHttpFeed')
SET IDENTITY_INSERT [dbo].[FeedCategories] OFF
/****** Object:  UserDefinedFunction [dbo].[DistanceBetween]    Script Date: 02/25/2010 17:11:39 ******/
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
/****** Object:  Table [dbo].[Locations]    Script Date: 02/25/2010 17:11:38 ******/
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
SET IDENTITY_INSERT [dbo].[Locations] ON
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (3, N'Brede', N'brede', N'East Sussex, United Kingdom', 50.93577012, 0.596790165)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (4, N'Hastings', N'hastings', N'East Sussex, United Kingdom', 50.85612327, 0.578795224)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (5, N'TN34', N'tn34', NULL, 50.87134346, 0.586471707)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (6, N'TN38', N'tn38', NULL, 50.86594217, 0.529597476)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (9, N'Warrior Square, Hastings', N'warrior-square-hastings', N'East Sussex, United Kingdom', 50.853544, 0.56347)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (10, N'Hollington, Hastings ', N'hollington-hastings', N'East Sussex, United Kingdom', 50.87829977, 0.545000061)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (11, N'Sedlescombe', N'sedlescombe', N'East Sussex, United Kingdom', 50.93554616, 0.532415807)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (12, N'TN37', N'tn37', NULL, 50.87683931, 0.550297424)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (14, N'Rye', N'rye', N'East Sussex, United Kingdom', 50.95173664, 0.73565416)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (15, N'TN31', N'tn31', NULL, 50.96655585, 0.714250803)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (16, N'Northiam', N'northiam', N'East Sussex, United Kingdom', 50.9979558, 0.602118373)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (17, N'Beckley', N'beckley', N'East Sussex, United Kingdom', 50.98458968, 0.635344908)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (18, N'Udimore', N'udimore', N'East Sussex, United Kingdom', 50.94056524, 0.655254945)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (19, N'Cripps Corner', N'cripps-corner', N'East Sussex, United Kingdom', 50.96666649, 0.533333123)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (21, N'St Leonards', N'st-leonards', N'East Sussex, United Kingdom', 50.85674688, 0.54759644)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (22, N'The Green, Hastings', N'the-green-hastings', N'East Sussex, United Kingdom', 50.8561232686043, 0.578795224428177)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (23, N'TN35', N'tn35', NULL, 50.89661323, 0.635769367)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (24, N'TN33', N'tn33', NULL, 50.89583673, 0.469128415)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (25, N'Beauport Park, Hastings', N'beauport-park-hastings', N'East Sussex, United Kingdom', 50.89363889, 0.54225)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (26, N'Bohemia, Hastings', N'bohemia-hastings', N'East Sussex, United Kingdom', 50.85621228, 0.56981136)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (27, N'TN39', N'tn39', NULL, 50.85583895, 0.439038724)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (28, N'Blacklands, Hastings', N'blacklands-hastings', N'East Sussex, United Kingdom', 50.86804558, 0.581656989)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (29, N'Hailsham', N'hailsham', N'East Sussex, United Kingdom', 50.86538494, 0.256519765)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (30, N'Seaford', N'seaford', N'East Sussex, United Kingdom', 50.77291511, 0.1014103)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (31, N'St Helens, Hastings', N'st-helens-hastings', N'East Sussex, United Kingdom', 50.87850899, 0.588329136)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (33, N'Silverhill, Hastings', N'silverhill-hastings', N'East Sussex, United Kingdom', 50.866861, 0.555496)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (34, N'Ore, Hastings', N'ore', N'East Sussex, United Kingdom', 50.87010026, 0.611899719)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (35, N'Westfield', N'westfield', N'East Sussex, United Kingdom', 50.9108001, 0.576300099)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (36, N'TN32', N'tn32', NULL, 50.98255455, 0.471082404)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (37, N'TN36', N'tn36', NULL, 50.91310143, 0.688855648)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (38, N'Broad Oak', N'broad-oak', N'East Sussex, United Kingdom', 50.9499751, 0.599080101)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (39, N'Robertsbridge', N'robertsbridge', N'East Sussex, United Kingdom', 50.98564982, 0.474470034)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (41, N'Kent Street', N'kent-street', N'East Sussex, United Kingdom', 50.912225, 0.543793)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (54, N'Heathfield', N'heathfield', N'East Sussex, United Kingdom', 50.97186059, 0.252357647)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (55, N'Hurst Green', N'hurst-green', N'East Sussex, United Kingdom', 51.01808511, 0.470265001)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (56, N'Sidley, Bexhill', N'sidley-bexhill', N'East Sussex, United Kingdom', 50.84999844, 0.466699675)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (59, N'Broadland Row', N'broadland-row', N'East Sussex, United Kingdom', 50.94999991, 0.616666675)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (60, N'Cackle Street', N'cackle-street', N'East Sussex, United Kingdom', 50.939105, 0.592413)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (61, N'Camber', N'camber', N'East Sussex, United Kingdom', 50.93592502, 0.79583019)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (62, N'East Guldeford', N'east-guldeford', N'East Sussex, United Kingdom', 50.96057385, 0.754712597)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (63, N'Four Oaks', N'four-oaks', N'East Sussex, United Kingdom', 50.98333307, 0.649999827)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (64, N'Horns Cross', N'horns-cross', N'East Sussex, United Kingdom', 50.89810923, 0.313475803)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (65, N'Iden', N'iden', N'East Sussex, United Kingdom', 50.98214485, 0.730905309)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (66, N'Millcorner', N'millcorner', N'East Sussex, United Kingdom', 50.89810923, 0.313475803)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (67, N'Peasmarsh', N'peasmarsh', N'East Sussex, United Kingdom', 50.97758979, 0.6788899)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (68, N'Playden', N'playden', N'East Sussex, United Kingdom', 50.96352495, 0.731455162)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (69, N'Rye Foreign', N'rye-foreign', N'East Sussex, United Kingdom', 50.97194508, 0.707279742)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (70, N'Rye Harbour', N'rye-harbour', N'East Sussex, United Kingdom', 50.93810499, 0.761774853)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (71, N'Bodiam', N'bodiam', N'East Sussex, United Kingdom', 50.99885501, 0.540532842)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (72, N'Brightling', N'brightling', N'East Sussex, United Kingdom', 50.96330635, 0.397469178)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (73, N'Ewhurst', N'ewhurst', N'East Sussex, United Kingdom', 50.89810923, 0.313475803)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (74, N'Mountfield', N'mountfield', N'East Sussex, United Kingdom', 50.95542938, 0.479841828)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (75, N'Johns Cross', N'johns-cross', N'East Sussex, United Kingdom', 50.96666649, 0.483333394)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (76, N'Oxleys Green', N'oxleys-green', N'East Sussex, United Kingdom', 50.96666649, 0.399999842)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (77, N'Salehurst', N'salehurst', N'East Sussex, United Kingdom', 50.99144004, 0.481160134)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (78, N'Staple Cross', N'staple-cross', N'East Sussex, United Kingdom', 50.97304679, 0.535564721)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (79, N'Vinehall Street', N'vinehall-street', N'East Sussex, United Kingdom', 50.94999991, 0.49999997)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (80, N'Battle', N'battle', N'East Sussex, United Kingdom', 50.9146142, 0.489027724)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (81, N'Catsfield', N'catsfield', N'East Sussex, United Kingdom', 50.89618474, 0.448030159)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (82, N'Crowhurst', N'crowhurst', N'East Sussex, United Kingdom', 50.89007132, 0.499598309)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (83, N'Henleys Down', N'henleys-down', N'East Sussex, United Kingdom', 50.88333361, 0.466666818)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (84, N'Hooe', N'hooe', N'East Sussex, United Kingdom', 50.85865997, 0.398059934)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (85, N'Hooe Common', N'hooe-common', N'East Sussex, United Kingdom', 50.86666636, 0.399999842)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (86, N'Lower Street', N'lower-street', N'East Sussex, United Kingdom', 50.88333361, 0.433333665)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (87, N'Netherfield', N'netherfield', N'East Sussex, United Kingdom', 50.94269156, 0.431433991)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (88, N'Ninfield', N'ninfield', N'East Sussex, United Kingdom', 50.88839494, 0.41506514)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (89, N'Penhurst', N'penhurst', N'East Sussex, United Kingdom', 50.92355669, 0.408837721)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (90, N'Ponts Green', N'ponts-green', N'East Sussex, United Kingdom', 50.91666676, 0.383333266)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (91, N'Telham', N'telham', N'East Sussex, United Kingdom', 50.89810923, 0.313475803)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (92, N'Whatlington', N'whatlington', N'East Sussex, United Kingdom', 50.93906119, 0.506971031)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (93, N'Ashburnham Place', N'ashburnham-place', N'East Sussex, United Kingdom', 50.90000018, 0.399999842)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (94, N'Cliff End', N'cliff-end', N'East Sussex, United Kingdom', 50.89016318, 0.678413808)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (95, N'Fairlight', N'fairlight', N'East Sussex, United Kingdom', 50.87998085, 0.657733306)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (96, N'Guestling Green', N'guestling-green', N'East Sussex, United Kingdom', 50.89220032, 0.633799955)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (97, N'Guestling Thorn', N'guestling-thorn', N'East Sussex, United Kingdom', 50.8922, 0.6338)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (98, N'Pett', N'pett', N'East Sussex, United Kingdom', 50.89487985, 0.663489997)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (99, N'Icklesham', N'icklesham', N'East Sussex, United Kingdom', 50.91651589, 0.669001937)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (100, N'Winchelsea', N'winchelsea', N'East Sussex, United Kingdom', 50.92430033, 0.706815049)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (101, N'Winchelsea Beach', N'winchelsea-beach', N'East Sussex, United Kingdom', 50.91696985, 0.723830312)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (103, N'Baldslow, Hastings', N'baldslow-hastings', N'East Sussex, United Kingdom', 50.86300148, 0.583142288)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (104, N'Bulverhythe', N'bulverhythe', N'East Sussex, United Kingdom', 50.84999979, 0.516666546)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (105, N'Cooden', N'cooden', N'East Sussex, United Kingdom', 50.89810923, 0.313475803)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (106, N'Little Common', N'little-common', N'East Sussex, United Kingdom', 50.84999979, 0.433333665)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (107, N'Lunsfords Cross', N'lunsfords-cross', N'East Sussex, United Kingdom', 50.86666636, 0.450000241)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (108, N'TN40', N'tn40', NULL, 50.84963836, 0.491904393)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (109, N'TN21', N'tn21', NULL, 50.95205784, 0.295843631)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (110, N'TN19', N'tn19', NULL, 51.00748435, 0.41334182)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (111, N'TN18', N'tn18', N'Kent, United Kingdom', 51.03933692, 0.550772846)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (112, N'Four Throws', N'four-throws', N'Kent, United Kingdom', 51.03333347, 0.533333123)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (113, N'Hawkhurst', N'hawkhurst', N'Kent, United Kingdom', 51.04762495, 0.51017493)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (114, N'High Street', N'high-street', N'Kent, United Kingdom', 51.05000004, 0.49999997)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (115, N'Linkhill', N'linkhill', N'Kent, United Kingdom', 51.01666689, 0.583333522)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (116, N'Newenden', N'newenden', N'Kent, United Kingdom', 51.01599097, 0.613202602)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (117, N'Sandhurst', N'sandhurst', N'Kent, United Kingdom', 51.02727972, 0.562545061)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (118, N'The Moor', N'the-moor', N'Kent, United Kingdom', 51.03943013, 0.504614711)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (119, N'Boarzell', N'boarzell', N'East Sussex, United Kingdom', 50.89810923, 0.313475803)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (120, N'Burwash', N'burwash', N'East Sussex, United Kingdom', 50.99924259, 0.390216485)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (121, N'Burwash Common', N'burwash-common', N'East Sussex, United Kingdom', 50.98631769, 0.338225886)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (122, N'Burwash Weald', N'burwash-weald', N'East Sussex, United Kingdom', 50.98787472, 0.356930271)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (123, N'Coopers Corner', N'coopers-corner', N'East Sussex, United Kingdom', 50.99114, 0.104023)
GO
print 'Processed 100 total records'
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (124, N'Etchingham', N'etchingham', N'East Sussex, United Kingdom', 51.00938, 0.441638455)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (125, N'Swiftsden', N'swiftsden', N'East Sussex, United Kingdom', 50.89810923, 0.313475803)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (126, N'Witherenden Hill', N'witherenden-hill', N'East Sussex, United Kingdom', 51.01666689, 0.350000113)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (127, N'Broadoak', N'broadoak', N'East Sussex, United Kingdom', 50.89810923, 0.313475803)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (128, N'Burlow', N'burlow', N'East Sussex, United Kingdom', 50.89810923, 0.313475803)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (129, N'Cade Street', N'cade-street', N'East Sussex, United Kingdom', 50.96649483, 0.282820165)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (130, N'Chapel Cross', N'chapel-cross', N'East Sussex, United Kingdom', 50.96176475, 0.29761523)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (131, N'Cross in Hand', N'cross-in-hand', N'East Sussex, United Kingdom', 50.97356983, 0.225764215)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (132, N'Dallington', N'dallington', N'East Sussex, United Kingdom', 50.94740957, 0.357488841)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (133, N'Foxhunt Green', N'foxhunt-green', N'East Sussex, United Kingdom', 50.93333334, 0.200000256)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (134, N'Horam', N'horam', N'East Sussex, United Kingdom', 50.93359485, 0.242965221)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (135, N'Little London', N'little-london', N'East Sussex, United Kingdom', 50.95707759, 0.234422386)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (136, N'Maynards Green', N'maynards-green', N'East Sussex, United Kingdom', 50.94522022, 0.250380859)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (137, N'Punnetts Town', N'punnetts-town', N'East Sussex, United Kingdom', 50.96010514, 0.312830061)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (138, N'Rushlake Green', N'rushlake-green', N'East Sussex, United Kingdom', 50.9428867, 0.314729735)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (139, N'Three Cups Corner', N'three-cups-corner', N'East Sussex, United Kingdom', 50.94999991, 0.333333537)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (140, N'Vines Cross', N'vines-cross', N'East Sussex, United Kingdom', 50.93737543, 0.266437232)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (141, N'Waldron', N'waldron', N'East Sussex, United Kingdom', 50.95169105, 0.20442456)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (142, N'Warbleton', N'warbleton', N'East Sussex, United Kingdom', 50.93989, 0.290300176)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (143, N'Ticehurst', N'ticehurst', N'East Sussex, United Kingdom', 51.04607195, 0.409617573)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (144, N'Ashdown', N'ashdown', N'East Sussex, United Kingdom', 50.89810923, 0.313475803)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (145, N'Conquest, Hastings', N'conquest-hastings', N'East Sussex, United Kingdom', 50.856123, 0.578795)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (146, N'Maze Hill, St Leonards', N'maze-hill-st-leonards', N'East Sussex, United Kingdom', 50.852063, 0.55481)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (147, N'Guestling', N'guestling', N'East Sussex, United Kingdom', 50.89220032, 0.633799955)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (148, N'East Hill, Hastings', N'east-hill-hastings', N'East Sussex, United Kingdom', 50.856123, 0.578795)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (149, N'Alexandra Park, Hastings', N'alexandra-park-hastings', N'East Sussex, United Kingdom', 50.86339541, 0.577545315)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (150, N'Lydd', N'lydd', N'Kent, United Kingdom', 50.95034391, 0.903744847)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (151, N'Stone', N'stone', N'Kent, United Kingdom', 51.44288868, 0.244635567)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (152, N'Tenterden', N'tenterden', N'Kent, United Kingdom', 51.07540525, 0.694059804)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (153, N'West Hill, Hastings', N'west-hill-hastings', N'East Sussex, United Kingdom', 50.856123, 0.578795)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (154, N'Staplehurst', N'staplehurst', N'Kent, United Kingdom', 51.1670503, 0.552592054)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (155, N'Cranbrook', N'cranbrook', N'Kent, United Kingdom', 51.09650016, 0.535244867)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (156, N'Goudhurst', N'goudhurst', N'Kent, United Kingdom', 51.11284085, 0.458641648)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (157, N'Sissinghurst', N'sissinghurst', N'Kent, United Kingdom', 51.10885777, 0.5613783)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (158, N'Clive Vale, Hastings', N'clive-vale-hastings', N'East Sussex, United Kingdom', 50.856123, 0.578795)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (159, N'Old Town, Hastings', N'old-town-hastings', N'East Sussex, United Kingdom', 50.8573342859745, 0.591270849108696)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (160, N'The Ridge, Hastings', N'the-ridge-hastings', N'East Sussex, United Kingdom', 50.8561232686043, 0.578795224428177)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (161, N'White Rock, Hastings', N'white-rock-hastings', N'East Sussex, United Kingdom', 50.8561232686043, 0.578795224428177)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (162, N'Gills Green', N'gills-green', N'Kent, United Kingdom', 51.06224164, 0.506908)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (163, N'Ewhurst Green', N'ewhurst-green', N'East Sussex, United Kingdom', 50.99232517, 0.555624962)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (164, N'Belmont, Hastings', N'belmont-hastings', N'East Sussex, United Kingdom', 50.86219211, 0.598809835)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (165, N'West St Leonards', N'west-st-leonards', N'East Sussex, United Kingdom', 50.856747, 0.547596)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (167, N'Pebsham, Bexhill', N'pebsham-bexhill', N'East Sussex, United Kingdom', 50.85029392, 0.490003908)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (168, N'Harley Shute, St Leonards', N'harley-shute-st-leonards', N'East Sussex, United Kingdom', 50.85969, 0.534475)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (169, N'Collington, Bexhill', N'collington-bexhil', N'East Sussex, United Kingdom', 50.87829977, 0.545000061)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (172, N'Old Town, Bexhill', N'old-town-bexhill', N'East Sussex, United Kingdom', 50.844967, 0.460397)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (173, N'Bexhill', N'bexhill', N'East Sussex, United Kingdom', 50.84496662, 0.460397154)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (178, N'Silver Hill', N'silver-hill', N'Kent, United Kingdom', 51.078323, 0.69531)
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl], [LocationArea], [LocationLatitude], [LocationLongitude]) VALUES (179, N'Brookland', N'brookland', N'Kent, United Kingdom', 50.99784717, 0.83469674)
SET IDENTITY_INSERT [dbo].[Locations] OFF
/****** Object:  Table [dbo].[Tags]    Script Date: 02/25/2010 17:11:38 ******/
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
SET IDENTITY_INSERT [dbo].[Tags] ON
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (2, N'Roofing felt', N'roofing-felt')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (3, N'Sofa', N'sofa')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (7, N'Dress', N'dress')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (8, N'Skirt', N'skirt')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (9, N'Clothes', N'clothes')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (10, N'Sandal', N'sandal')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (11, N'Game boy', N'game-boy')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (12, N'Coat hanger', N'coat-hanger')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (13, N'Fridge', N'fridge')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (14, N'Sweatshirt', N'sweatshirt')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (15, N'Lamp shade', N'lamp-shade')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (17, N'Fridge freezer', N'fridge-freezer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (19, N'House', N'house')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (20, N'Garden', N'garden')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (23, N'Clothes rail', N'clothes')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (25, N'Speaker', N'speaker')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (26, N'Furniture', N'furniture')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (27, N'Armchair', N'armchair')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (28, N'French door', N'french door')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (29, N'Desktop', N'desktop')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (30, N'PC', N'pc')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (31, N'Moses Basket', N'moses-basket')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (32, N'Chair', N'chair')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (33, N'Wardrobe', N'wardrobe')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (34, N'Boot', N'boot')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (35, N'Toddler', N'toddler')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (36, N'Bag', N'bag')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (37, N'Computer', N'computer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (38, N'Desk', N'desk')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (39, N'Keyboard', N'keyboard')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (40, N'Microwave', N'microwave')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (41, N'Oven', N'oven')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (42, N'Plant', N'plant')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (43, N'Baby', N'baby')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (44, N'Baby Monitor', N'baby-monitor')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (45, N'Door Bouncer', N'door-bouncer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (46, N'Building Block', N'building-block')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (47, N'Suit', N'suit')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (48, N'Jacket', N'jacket')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (49, N'Roof slate', N'roof-slate')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (50, N'Kitchen', N'kitchen')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (51, N'Cooker Hood Extractor', N'cooker-hood-extractor')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (52, N'Bed', N'bed')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (53, N'Mattress', N'mattress')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (54, N'Toy', N'toy')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (55, N'Turf', N'turf')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (56, N'Grass', N'grass')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (57, N'Video', N'video')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (58, N'DVD', N'dvd')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (59, N'Electric Fire', N'electric-fire')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (60, N'Window Blind', N'window-blind')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (61, N'Grill', N'grill')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (62, N'Pushchair', N'pushchair')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (63, N'Buggy', N'buggy')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (64, N'Freezer', N'freezer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (65, N'Broom', N'broom')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (66, N'Tumble Dryer', N'tumble-dryer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (67, N'Washing Machine', N'washing-machine')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (68, N'TV', N'tv')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (69, N'Cabinet', N'cabinet')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (70, N'Wicker Basket', N'wicker-basket')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (71, N'Hamper', N'hamper')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (72, N'Cutlery', N'cutlery')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (73, N'Commode', N'commode')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (74, N'Mountain Bike', N'mountain-bike')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (75, N'Bike', N'bike')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (76, N'Bicycle', N'bicycle')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (77, N'Scanner', N'scanner')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (78, N'Shirt', N'shirt')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (79, N'Trunk', N'trunk')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (80, N'Organ', N'organ')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (81, N'Dining Table', N'dining-table')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (82, N'Coffee Table', N'coffee-table')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (83, N'Table', N'table')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (84, N'Box', N'box')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (85, N'Plate', N'plate')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (86, N'Cup', N'cup')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (87, N'Glass', N'glass')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (88, N'Pillow', N'pillow')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (89, N'Cushions', N'cushions')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (90, N'Linen', N'linen')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (91, N'Playstation', N'playstation')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (92, N'Router', N'router')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (96, N'Duvet', N'duvet')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (97, N'Aromatherapy', N'aromatherapy')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (98, N'Oil', N'oil')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (99, N'Bedding', N'bedding')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (100, N'Cushion', N'cushion')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (101, N'Flatscreen', N'flatscreen')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (102, N'Freeview', N'freeview')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (103, N'Music', N'music')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (104, N'Fencing', N'fencing')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (105, N'Bath', N'bath')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (106, N'Radiator', N'radiator')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (107, N'Phone', N'phone')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (108, N'Pirate', N'pirate')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (109, N'Battery', N'battery')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (110, N'Welly', N'welly')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (111, N'Cot', N'cot')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (112, N'Divan', N'divan')
GO
print 'Processed 100 total records'
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (113, N'Ram', N'ram')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (114, N'Hard drive', N'hard-drive')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (115, N'Foot spa', N'foot-spa')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (116, N'Girl', N'girl')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (117, N'Boy', N'boy')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (118, N'Steamer', N'steamer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (120, N'Carpet', N'carpet')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (121, N'Bunk', N'bunk')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (122, N'Floor', N'floor')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (123, N'Wall', N'wall')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (124, N'Ceiling', N'ceiling')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (125, N'Monitor', N'monitor')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (126, N'Netgear', N'netgear')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (128, N'Saucepan', N'saucepan')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (129, N'Whisk', N'whisk')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (131, N'Spoon', N'spoon')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (132, N'Bowl', N'bowl')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (133, N'Printer', N'printer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (134, N'Wool', N'wool')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (135, N'Knitting', N'knitting')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (137, N'Coat', N'coat')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (138, N'Mat', N'mat')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (139, N'Mirror', N'mirror')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (140, N'Apron', N'apron')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (141, N'Ipod', N'ipod')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (142, N'Iphone', N'Iphone')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (143, N'Snooker', N'snooker')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (144, N'Pool', N'pool')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (145, N'Book', N'book')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (146, N'Bookcase', N'bookcase')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (147, N'Vitamin', N'vitamin')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (148, N'Vinyl', N'vinyl')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (149, N'Frame', N'frame')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (150, N'Retro', N'retro')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (151, N'Stool', N'stool')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (153, N'Graphic', N'graphic')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (154, N'Processor', N'processor')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (156, N'XP', N'xp')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (157, N'Lamp', N'lamp')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (158, N'Light', N'light')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (159, N'Stereo', N'stereo')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (160, N'Swing', N'swing')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (161, N'Car', N'car')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (162, N'Mobile', N'mobile')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (163, N'Walker', N'walker')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (164, N'Motorcycle', N'motorcycle')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (165, N'Sheet metal bender', N'sheet-metal-bender')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (166, N'Stair gate', N'stair-gate')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (167, N'Pot', N'pot')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (168, N'USB', N'usb')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (169, N'Golf', N'golf')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (170, N'Cross trainer', N'cross-trainer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (171, N'CD', N'cd')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (173, N'Gym', N'gym')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (175, N'Sewing', N'sewing')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (176, N'Camping', N'camping')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (177, N'Gas', N'gas')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (178, N'Food', N'food')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (179, N'Tray', N'tray')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (180, N'Xbox', N'xbox')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (181, N'Patio', N'patio')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (182, N'Heater', N'heater')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (183, N'Work bench', N'work-bench')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (184, N'Drawer', N'drawer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (185, N'Charity', N'charity')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (186, N'Shrub', N'shrub')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (187, N'Cutting', N'cutting')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (188, N'Ladder', N'ladder')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (189, N'Lady', N'lady')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (190, N'Rack', N'rack')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (191, N'Chest', N'chest')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (192, N'Bottle', N'bottle')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (193, N'Tile', N'tile')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (194, N'Cord', N'cord')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (195, N'Nylon', N'nylon')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (196, N'Cleaner', N'cleaner')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (197, N'Canvas', N'canvas')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (198, N'Paint', N'paint')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (199, N'Bird', N'bird')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (200, N'Nest box', N'nest-box')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (201, N'Hose', N'hose')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (202, N'Calor', N'calor')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (203, N'Laptop', N'laptop')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (204, N'Airbed', N'airbed')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (205, N'Coffee', N'coffee')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (206, N'Tea', N'tea')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (207, N'Dinner plate', N'dinner-plate')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (208, N'Soup bowl', N'soup-bowl')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (209, N'Fruit bowl', N'fruit-bowl')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (210, N'Gravy', N'gravy')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (211, N'Food processor', N'food-processor')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (212, N'Blender', N'blender')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (213, N'Hand mixer', N'hand-mixer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (214, N'Frying pan', N'frying-pan')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (215, N'Cooker', N'cooker')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (216, N'Fryer', N'fryer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (217, N'Can opener', N'can-opener')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (218, N'Juicer', N'juicer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (219, N'Iron', N'iron')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (220, N'Ironing board', N'ironing-board')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (221, N'Pan', N'pan')
GO
print 'Processed 200 total records'
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (222, N'Cookbook', N'cookbook')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (223, N'Platter', N'platter')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (224, N'Wine', N'wine')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (225, N'Teaspoon', N'teaspoon')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (226, N'Sugar', N'sugar')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (227, N'Salad', N'salad')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (228, N'Carving', N'carving')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (229, N'Knife', N'knife')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (230, N'Goblet', N'goblet')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (231, N'Bread', N'bread')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (232, N'Bread knife', N'bread-knife')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (233, N'Cocktail', N'cocktail')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (234, N'Decanter', N'decanter')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (235, N'Fork', N'fork')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (236, N'Spice rack', N'spice-rack')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (237, N'Pepper', N'pepper')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (238, N'Scale', N'scale')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (239, N'Ladle', N'ladle')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (240, N'Spatula', N'spatula')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (241, N'Casserole', N'casserole')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (242, N'Pillowcase', N'pillowcase')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (243, N'Bath mat', N'bath-mat')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (244, N'Napkin', N'napkin')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (245, N'Tablecloth', N'tablecloth')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (246, N'Towel', N'towel')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (247, N'Sheet', N'sheet')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (248, N'Wastebasket', N'wastebasket')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (249, N'Blanket', N'blanket')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (250, N'Shower curtain', N'shower-curtain')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (251, N'Clock', N'clock')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (252, N'Dishtowel', N'dishtowel')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (253, N'Colander', N'colander')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (254, N'Strainer', N'strainer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (255, N'Baking', N'baking')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (256, N'Door', N'door')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (257, N'Wok', N'wok')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (258, N'Cement', N'cement')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (259, N'Cookery', N'cookery')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (260, N'Yarn', N'yarn')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (261, N'Curtain', N'curtain')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (263, N'Headphone', N'headphone')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (264, N'Mouse', N'mouse')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (265, N'Binocular', N'binocular')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (266, N'Wii', N'wii')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (269, N'Video recorder', N'video-recorder')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (270, N'DVD player', N'dvd-player')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (271, N'Fireplace', N'fireplace')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (273, N'Picture', N'picture')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (275, N'Picture frame', N'picture-frame')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (276, N'Demijohn', N'demijohn')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (277, N'Bunkbed', N'bunkbed')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (278, N'Office', N'office')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (279, N'Stationery', N'stationery')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (280, N'Folder', N'folder')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (281, N'Paper', N'paper')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (282, N'Filing', N'filing')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (283, N'Photo', N'photo')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (284, N'Broadband', N'broadband')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (285, N'Hub', N'hub')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (286, N'Fleece', N'fleece')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (287, N'Car seat', N'car-seat')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (288, N'Vivarium ', N'vivarium')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (289, N'Bedroom', N'bedroom')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (290, N'Suite', N'suite')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (291, N'Jug', N'jug')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (292, N'Caravan', N'caravan')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (293, N'Boot sale', N'boot-sale')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (294, N'Cage', N'cage')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (295, N'Yoga', N'yoga')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (296, N'Xylophone', N'xylophone')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (297, N'Guitar', N'guitar')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (298, N'Clarinet', N'clarinet')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (299, N'Trumpet', N'trumpet')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (300, N'Trumbone', N'trumbone')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (301, N'Recorder', N'recorder')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (302, N'Pregnancy', N'pregnancy')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (303, N'Game', N'game')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (304, N'Needle', N'needle')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (305, N'Sewing machine', N'sewing-machine')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (306, N'Pen', N'pen')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (307, N'Pencil', N'pencil')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (308, N'Rucksack', N'rucksack')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (309, N'Kite', N'kite')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (310, N'Radio', N'radio')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (311, N'Fishing', N'fishing')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (312, N'Fire extinguisher', N'fire-extinguisher')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (313, N'Fire blanket', N'fire-blanket')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (314, N'Tin', N'tin')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (315, N'Teddy', N'teddy')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (316, N'Football', N'football')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (317, N'Rugby', N'rugby')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (318, N'Tennis', N'tennis')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (319, N'Swimming', N'swimming')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (320, N'Vase', N'vase')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (321, N'Rope', N'rope')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (322, N'Filofax', N'filofax')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (323, N'Diary', N'diary')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (324, N'Bathroom', N'bathroom')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (325, N'Bathroom cabinet', N'bathroom-cabinet')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (326, N'Digital Camera', N'digital-camera')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (327, N'Camera', N'camera')
GO
print 'Processed 300 total records'
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (328, N'Software', N'software')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (329, N'Compost', N'compost')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (330, N'Card', N'card')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (331, N'Cardboard box', N'cardboard-box')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (332, N'Jam jar', N'jam-jar')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (333, N'Uniform', N'uniform')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (334, N'Compost bin', N'compost-bin')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (335, N'Bin', N'bin')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (336, N'Camcorder', N'camcorder')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (337, N'Fax machine', N'fax-machine')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (338, N'Ink', N'ink')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (339, N'Log', N'log')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (340, N'Timber', N'timber')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (341, N'Rug', N'rug')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (342, N'VCR', N'vcr')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (343, N'Piggy bank', N'piggy-bank')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (344, N'Wedding Dress', N'wedding-dress')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (345, N'Dumbbell', N'dumbbell')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (346, N'Jigsaw', N'jigsaw')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (347, N'Fish tank', N'fish-tank')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (348, N'Butler sink', N'butler-sink')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (349, N'Headboard', N'headboard')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (350, N'Underlay', N'underlay')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (351, N'Window', N'window')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (352, N'Remote control', N'remote-control')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (353, N'Wind break', N'wind-break')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (354, N'Mower', N'mower')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (355, N'Deck chair', N'deck-chair')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (356, N'Shelve', N'shelve')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (357, N'Shed', N'shed')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (358, N'Saw', N'saw')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (359, N'Cassette', N'cassette')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (360, N'Basin', N'basin')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (361, N'Tap', N'tap')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (362, N'Boat', N'boat')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (363, N'Boating', N'boating')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (364, N'Charger', N'charger')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (365, N'Tight', N'tight')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (366, N'Nappy', N'nappy')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (367, N'Franking machine', N'franking-machine')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (368, N'Wheel', N'wheel')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (369, N'Tyre', N'tyre')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (370, N'Weight', N'weight')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (371, N'Shower', N'shower')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (372, N'Air purifier', N'air-purifier')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (373, N'Cool box', N'cool-box')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (374, N'Detox', N'detox')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (375, N'Sauna', N'sauna')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (376, N'Steriliser', N'steriliser')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (377, N'Amplifier', N'amplifier')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (378, N'Tape', N'tape')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (379, N'Remote', N'remote')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (380, N'Newborn', N'newborn')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (381, N'Carrier', N'carrier')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (382, N'Chicken', N'chicken')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (383, N'Cat', N'cat')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (384, N'Dog', N'dog')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (385, N'Breast pump', N'breast-pump')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (386, N'Basket', N'basket')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (387, N'Dishwasher', N'dishwasher')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (388, N'Cable', N'cable')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (389, N'Pet', N'pet')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (390, N'Child', N'child')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (391, N'Children', N'children')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (392, N'Art', N'art')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (393, N'Mosaic', N'mosaic')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (394, N'Drain', N'drain')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (395, N'Pasta maker', N'pasta-maker')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (396, N'Paving', N'paving')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (397, N'Slab', N'slab')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (398, N'Wheelchair', N'wheelchair')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (399, N'Plank', N'plank')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (400, N'Puppy', N'puppy')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (401, N'Bracelet', N'bracelet')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (402, N'Trouser', N'trouser')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (403, N'Sock', N'sock')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (404, N'Cardigan', N'cardigan')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (405, N'Jumper', N'jumper')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (406, N'Mug', N'mug')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (407, N'Saucer', N'saucer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (408, N'Magazine', N'magazine')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (409, N'Health', N'health')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (410, N'Storage jar', N'storage-jar')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (411, N'Rabbit', N'rabbit')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (412, N'Straw', N'straw')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (413, N'Trampoline', N'trampoline')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (414, N'BBQ', N'bbq')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (415, N'Barbeque', N'barbeque')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (416, N'Aardvark', N'aardvark')
SET IDENTITY_INSERT [dbo].[Tags] OFF
/****** Object:  Table [dbo].[Roles]    Script Date: 02/25/2010 17:11:38 ******/
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
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT [dbo].[Roles] ([RoleId], [RoleLevel], [RoleName]) VALUES (1, 3, N'Author')
INSERT [dbo].[Roles] ([RoleId], [RoleLevel], [RoleName]) VALUES (2, 1, N'Administrator')
INSERT [dbo].[Roles] ([RoleId], [RoleLevel], [RoleName]) VALUES (3, 2, N'Editor')
INSERT [dbo].[Roles] ([RoleId], [RoleLevel], [RoleName]) VALUES (4, 4, N'External User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
/****** Object:  Table [dbo].[PostCategories]    Script Date: 02/25/2010 17:11:38 ******/
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
SET IDENTITY_INSERT [dbo].[PostCategories] ON
INSERT [dbo].[PostCategories] ([PostCategoryId], [PostCategoryName], [PostCategorySearch]) VALUES (1, N'Offered', N'Offer')
INSERT [dbo].[PostCategories] ([PostCategoryId], [PostCategoryName], [PostCategorySearch]) VALUES (2, N'Wanted', N'Want')
INSERT [dbo].[PostCategories] ([PostCategoryId], [PostCategoryName], [PostCategorySearch]) VALUES (3, N'Taken', N'Taken')
INSERT [dbo].[PostCategories] ([PostCategoryId], [PostCategoryName], [PostCategorySearch]) VALUES (4, N'Unclassified', N'Unclassified')
INSERT [dbo].[PostCategories] ([PostCategoryId], [PostCategoryName], [PostCategorySearch]) VALUES (5, N'Received', N'Receive, Recieve')
SET IDENTITY_INSERT [dbo].[PostCategories] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 02/25/2010 17:11:38 ******/
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
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([UserId], [UserName], [UserEmail], [UserPassword], [UserPostcode], [UserLatitude], [UserLongitude], [UserSearchRadiusMiles], [UserIsActive], [UserDateCreated], [RoleId]) VALUES (10, N'sclode', N'sclode@hodes.co.uk', N'1B4E9835735B0FB2EF62623D0E392EC40E0C339F', N'TN31 6HG', 50.923423, 0.5923423, 10, 1, CAST(0x00009CF500B87838 AS DateTime), 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserEmail], [UserPassword], [UserPostcode], [UserLatitude], [UserLongitude], [UserSearchRadiusMiles], [UserIsActive], [UserDateCreated], [RoleId]) VALUES (15, N'anonymous', N'anon@jumblist.co.uk', N'1B4E9835735B0FB2EF62623D0E392EC40E0C339F', NULL, 0, 0, 5, 1, CAST(0x00009D1D00000000 AS DateTime), 4)
INSERT [dbo].[Users] ([UserId], [UserName], [UserEmail], [UserPassword], [UserPostcode], [UserLatitude], [UserLongitude], [UserSearchRadiusMiles], [UserIsActive], [UserDateCreated], [RoleId]) VALUES (20, N'tester', N'test@adf.com', N'F1BC595C9E45F127C2A264255732733A79D2CA5C', N'N1 9RL', 51.534717455506325, -0.11869378387928008, 5, 1, CAST(0x00009D2500FB5A29 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Feeds]    Script Date: 02/25/2010 17:11:38 ******/
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
SET IDENTITY_INSERT [dbo].[Feeds] ON
INSERT [dbo].[Feeds] ([FeedId], [FeedName], [FeedFriendlyUrl], [FeedUrl], [FeedUsername], [FeedPassword], [FeedCheckIntervalTicks], [FeedLastUpdateHttpStatus], [FeedLastUpdateDateTime], [FeedCategoryId]) VALUES (1, N'Hastings Freecycle', N'hastings-freecycle', N'http://groups.yahoo.com/group/hastings-freecycle/messages/?xm=1&o=1&l=1&m=e', N'noostu', N'edinburgh', 10000, N'200', CAST(0x00009BCC00000000 AS DateTime), 1)
INSERT [dbo].[Feeds] ([FeedId], [FeedName], [FeedFriendlyUrl], [FeedUrl], [FeedUsername], [FeedPassword], [FeedCheckIntervalTicks], [FeedLastUpdateHttpStatus], [FeedLastUpdateDateTime], [FeedCategoryId]) VALUES (2, N'Rye Freecycle', N'rye-freecycle', N'http://groups.yahoo.com/group/ryefreecycle/messages/?xm=1&o=1&l=1&m=e', N'noostu', N'edinburgh', 10000, N'200', CAST(0x00009BC900000000 AS DateTime), 1)
INSERT [dbo].[Feeds] ([FeedId], [FeedName], [FeedFriendlyUrl], [FeedUrl], [FeedUsername], [FeedPassword], [FeedCheckIntervalTicks], [FeedLastUpdateHttpStatus], [FeedLastUpdateDateTime], [FeedCategoryId]) VALUES (3, N'Cranbrook Freecycle', N'cranbrook-freecycle', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/messages/?xm=1&o=1&l=1&m=e', N'noostu', N'edinburgh', 10000, NULL, CAST(0x00009D2001107600 AS DateTime), 1)
INSERT [dbo].[Feeds] ([FeedId], [FeedName], [FeedFriendlyUrl], [FeedUrl], [FeedUsername], [FeedPassword], [FeedCheckIntervalTicks], [FeedLastUpdateHttpStatus], [FeedLastUpdateDateTime], [FeedCategoryId]) VALUES (5, N'Bexhill Freegle', N'bexhill-freegle', N'http://groups.yahoo.com/group/bexhill-freecycle/messages/?xm=1&o=1&l=1&m=e', N'noostu', N'edinburgh', 10000, N'200', CAST(0x00009D2100000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Feeds] OFF
/****** Object:  Table [dbo].[FeedLocations]    Script Date: 02/25/2010 17:11:38 ******/
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
SET IDENTITY_INSERT [dbo].[FeedLocations] ON
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (3, 1, 149)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (4, 3, 93)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (5, 3, 144)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (6, 1, 103)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (7, 1, 80)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (8, 1, 25)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (9, 1, 17)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (10, 1, 164)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (12, 1, 28)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (14, 1, 71)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (15, 1, 26)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (16, 1, 3)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (17, 1, 72)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (18, 1, 38)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (19, 1, 59)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (20, 1, 127)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (21, 1, 104)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (22, 1, 128)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (26, 1, 60)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (27, 1, 129)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (28, 2, 61)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (29, 1, 81)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (30, 1, 130)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (31, 1, 94)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (32, 1, 158)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (34, 1, 145)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (37, 3, 155)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (38, 1, 19)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (39, 1, 131)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (40, 1, 82)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (41, 1, 132)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (42, 1, 62)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (43, 1, 148)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (45, 1, 73)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (46, 1, 163)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (47, 1, 95)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (48, 1, 63)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (50, 1, 133)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (52, 3, 156)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (53, 1, 147)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (54, 1, 96)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (55, 1, 97)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (56, 1, 29)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (57, 1, 168)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (58, 1, 4)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (60, 1, 54)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (61, 1, 83)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (63, 1, 10)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (64, 1, 84)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (65, 1, 85)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (66, 1, 134)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (67, 1, 64)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (69, 1, 99)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (70, 1, 65)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (71, 1, 75)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (72, 1, 41)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (74, 1, 106)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (75, 1, 135)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (76, 1, 86)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (77, 1, 107)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (78, 2, 150)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (79, 1, 136)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (80, 1, 146)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (81, 1, 66)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (82, 1, 74)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (83, 1, 87)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (85, 1, 88)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (86, 1, 16)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (88, 1, 159)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (89, 1, 34)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (90, 1, 76)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (91, 1, 67)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (93, 1, 89)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (94, 1, 98)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (95, 1, 68)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (96, 1, 90)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (97, 1, 137)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (98, 1, 39)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (99, 1, 138)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (100, 2, 14)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (101, 2, 69)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (102, 2, 70)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (103, 1, 77)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (106, 1, 11)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (108, 1, 33)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (109, 1, 157)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (110, 1, 31)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (111, 1, 21)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (112, 1, 78)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (113, 1, 154)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (114, 1, 151)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (116, 1, 91)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (117, 3, 152)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (118, 1, 22)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (120, 1, 160)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (121, 1, 139)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (122, 3, 143)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (123, 3, 111)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (124, 3, 110)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (125, 1, 109)
GO
print 'Processed 100 total records'
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (126, 2, 15)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (127, 3, 36)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (128, 1, 24)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (129, 1, 5)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (130, 1, 23)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (131, 2, 37)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (132, 1, 12)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (133, 1, 6)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (134, 5, 27)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (135, 5, 108)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (136, 1, 18)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (137, 1, 79)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (138, 1, 140)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (139, 1, 141)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (140, 1, 142)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (141, 1, 9)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (142, 1, 153)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (143, 1, 165)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (144, 1, 35)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (145, 1, 92)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (146, 1, 161)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (147, 2, 100)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (148, 2, 101)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (150, 5, 172)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (151, 5, 173)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (152, 3, 112)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (153, 3, 162)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (154, 3, 113)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (155, 3, 114)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (156, 3, 115)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (157, 3, 116)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (158, 3, 117)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (159, 3, 118)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (160, 3, 119)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (161, 3, 120)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (162, 3, 121)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (163, 3, 122)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (164, 3, 123)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (165, 3, 124)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (166, 3, 55)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (171, 3, 178)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (173, 5, 105)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (174, 5, 104)
INSERT [dbo].[FeedLocations] ([Id], [FeedId], [LocationId]) VALUES (175, 2, 18)
SET IDENTITY_INSERT [dbo].[FeedLocations] OFF
/****** Object:  Table [dbo].[Posts]    Script Date: 02/25/2010 17:11:38 ******/
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
SET IDENTITY_INSERT [dbo].[Posts] ON
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (2, 0, N'36909', N'http://groups.yahoo.com/group/hastings-freecycle/message/36909?l=1', N'Wanted please; 6ft clothes rail', N'Hi I need a 6t clothes rail and can collect at any time many thanks paula', CAST(0x00009CAE00C3D4D0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (3, 0, N'36908', N'http://groups.yahoo.com/group/hastings-freecycle/message/36908?l=1', N'Wanted- roofing felt for shed TN38', N'Wanted: roofing felt for shed, please.
Having Freecycled our end of roll a couple of years ago, we now need some to
repair a leaking allotment shed.

Thanks,
Sarah', CAST(0x00009CAE00BFFC70 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (4, 0, N'36907', N'http://groups.yahoo.com/group/hastings-freecycle/message/36907?l=1', N'OFFERED: 2 seater sofa TN38', N'This sofa is cream with removeable covers... It does need a wash as it has been
in daughters bedroom so the arms are filthy, but I do not have time to wash it
as it needs to go asap.

It will fit in an estate car.....

Collection from opposite Tescos Hollington

Mel', CAST(0x00009CAE00BBDDC0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (6, 0, N'36906', N'http://groups.yahoo.com/group/hastings-freecycle/message/36906?l=1', N'OFFERED - few items here, might be worth a read! TN38 hollington area', N'	

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

Thank you for reading', CAST(0x00009CAE00B4FFF0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (11, 0, N'36905', N'http://groups.yahoo.com/group/hastings-freecycle/message/36905?l=1', N'OFFERED Built-In Fridge Sedlescombe', N'Ariston, probably 9 yrs old (came with the house so might be newer, but not
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

Nigel', CAST(0x00009CAE00B054A0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (13, 0, N'36885', N'http://groups.yahoo.com/group/hastings-freecycle/message/36885?l=1', N'wanted undercounter fidge with freezer compartment', N'anythings a possibility x', CAST(0x00009CAD0112EED0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (14, 15, N'36881', N'http://groups.yahoo.com/group/hastings-freecycle/message/36881?l=1', N'Taken - Grove School sweatshirts, lampshades still available.', N'Thank you for your interest, these have now gone.', CAST(0x00009CAD00A4CB80 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (15, 0, N'36857', N'http://groups.yahoo.com/group/hastings-freecycle/message/36857?l=1', N'Offered - Grove School polo and sweatshirts.', N'2 sweatshirts, one from wards size medium, one made by uneek, size XS. 3 polo shirts, one from wards size 36, 2 fruit of the loom 152cm. Must be picked up today. TN37  area.', CAST(0x00009CAD009DEDB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (24, 0, N'http://tests', N'http://tests', N'Another sofa in brede', N'another test', CAST(0x00009D17008E8C30 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (25, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40263?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40263?l=1', N'WANTED AND OFFERED: TN34: Wanted - piece of carpet approx. size', N'9ft x 9ft or similar.  Required for newly set up garage &quot;gym&quot; (in the loosest
sense of the word)so not too fussed on colour.

Also OFFERED: White (plasticised) expandable clothes airer. Used but still
serviceable!

Drop me a line and I''ll get back to you via e mail. We
based (upper part) St Helens Down just off The Ridge.', CAST(0x00009D1801217D60 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (26, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40262?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40262?l=1', N're:Taken', N'Cot mattress taken and collected.  Sorry to those who missed out.

[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (27, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40261?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40261?l=1', N'WANTED: Small working fridge for Pier Trust', N'Hi everyone,

Hastings Pier &amp; White Rock Trust are seeking a small, working fridge for their
shop so the volunteers can have a cup of tea to keep them going!

We can collect.

Thanks in advance.

Angela', CAST(0x00009D1801217D60 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (28, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40260?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40260?l=1', N'WANTED--PLEASE HELP', N'please can anyone help.....i am moving in to my first flat in 2 weeks and my
money funds have pretty much dryed up theres a few things i still need so if
anyone could help with the following i would be soooo greatful!!!!
tv stand holds 32&quot; tv
sofa
washing machine
small dining table and chairs
moving boxes!!
small coffee table
thanks in advance becci




[Non-text portions of this message have been removed]', CAST(0x00009D1801217D60 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (29, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40259?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40259?l=1', N'Taken- rug and wall lights', N'Thank you to everone who expressed an interest.






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




[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (30, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40258?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40258?l=1', N'Wanted Items TN38', N'My Daughter and Son in-law are just about to move into a new flat. They are
looking for book-shelves (they are both avid readers and have masses of books),
an armchair and a fridge-freezer (not enough room for seperates).
Would love to hear from anyone that can help with any of these.
Kind regards, Debra



_________________________________________________________________
Do you have a story that started on Hotmail? Tell us now[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (31, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40257?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40257?l=1', N'Wanted sponge or foam for pets bed.', N'Hi all, has anyone got a piece of sponge or foam about 6 foot long by 2 foot
wide please. Can collect.thanks Charlie.', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (32, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40256?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40256?l=1', N'Taken Printer Inks', N'Epson compat. inks gone. Just like that.', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (33, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40255?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40255?l=1', N'OFFERED - Various', N'Yet more stuff......

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

[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (34, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40254?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40254?l=1', N'Offered Parrot Cage', N'Hi,
To start with I live in Sedlescombe and the items you will have to arrange pick
up.

I have a Parrot Cage which will be suitable for a parrot or anything of a
similar type of size  and a metal chair which has a vinyl seat and back rest to
it.
If interested please call Paul on 01424 871610

[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (35, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40253?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40253?l=1', N'OFFERED VARIOUS TN35 WESTFIELD', N'One old toshiba Laptop. Don''t get excited. really doesnt work on account that my
son has ripped it to shreds in a bid to &quot;find out how it works&quot; it has no hard
drive either. The screen is ok and the battery is there.  anything else is a
bonus.  it may be ok for spares?

Electrolux hoover bags for an upright hoover.

Wall tiles  ( approx 50) in shades of blue, lilac.

Bop it childs toy    Still offered!!!  electronic sound thing.

Bathroom corner cabinet in white, with mirror.  needs a good clean but would be
ok after that.  too good to tip


I will wait a while before deciding who to give to,', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (36, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40252?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40252?l=1', N'Offered TN37 TV Cabinett .', N'Hi , I have a Mahogony TV cabinett , the type where the TV goes inside . Also
has a Mock draw for DVD ,Video. Must go by Thursday or its off to the tip.
Harrow Lane. Land line only please.', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (37, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40251?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40251?l=1', N'OFFERED Printer Ink', N'&gt; Epson compatible inks for Epson stylus photo
&gt; R200/R300/R300M/R320/RX500/RX600/RX620
&gt; Magenta, light magenta, cyan, black (Inkrite)
  Epson stylus Color
&gt; 740/850/860/1160/1520: black (Jet-tec)', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (38, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40250?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40250?l=1', N'wanted', N'hi all freecyclers does any body have a old dart dart board and darts they no
longer need plz email and let me know thanks
carl', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (39, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40249?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40249?l=1', N'Wanted - Alvin the Chipmunk - McDonalds Toy', N'Hi All,

My little boy loves all things Alvin right now and keeps asking if we can have
an Alvin toy, i.e. the red one that McDonalds has been giving away.  He''s got
the other two boys and doesn''t want the girly ones, &quot;euggh!&quot; in his words.

Just wondered if anyone had one lying around looking for a place to go.

Many thanks,

Adam.', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (40, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40248?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40248?l=1', N'wanted playstation 1 controllers', N'just wondering if anyone had any ps 1 controlollers and games they dnt want also
im in need of a ide pc harddrive it would be wiped of all information and xp
installed on it for my pc thanks can collect anytime', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (41, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40247?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40247?l=1', N'WANTED. DIGI BOX.', N'HI ALL, HAS NAYONE GOT A FREEVIEW DIGI BOX I CAN HAVE PLEASE, CAN COLLECT. MANY
THANKS MARTIN.', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (42, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40246?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40246?l=1', N'Wanted: red cotton material', N'Dear all

am after an old red sheet or similar.  Doesn''t matter if it is ripped as I am
making some bunting (and already have blue and white sheets).

Thanks
Ali', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (43, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40245?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40245?l=1', N'OFFERED - Various!', N'Ongoing household cull has revealed the following:

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



[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (44, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40244?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40244?l=1', N'OFFERED: KENWOOD TABLE TOP MINI DISHWASHER', N'Hi,
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





[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (45, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40243?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40243?l=1', N'Offered Again: A4 4-Ring Binders, ALSO Electric hairdryer Hollington, St Leonards', N'Hello Chaps and Chapesses

I cleaned up some more A4 4-Ring Binders and have passed on 9 so far; there
remain another 8 on offer if anyone else wants.

Also offered a Pifco Princess Hairdryer with stand, hose and hood..� It probably
dates from the 1970s but still works and has been kept in its original box.

Bryan




[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (46, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40242?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40242?l=1', N'OFFERED: Items for girl''s bedroom', N'There are a few items which have come from my daughter''s old bedroom - she is
now a little older and had grown out of the stuff - there is absolutely nothing
wrong with them - would suit a girl''s bedroom who is under 10 maybe

SIX HOOK COAT/BAG HANGER - PRETTY COLOURFUL BEACH HOUSE DESIGN

CEILING LAMPSHADE - HANGING BLUE AND WHITE FLOWERS IN CHANDELIER STYLE

A BEAUTIFUL LILAC MOSQUITO STYLE NET WITH PRETTY PINK FABRIC FLOWERS SEWN ON -
HANGS FROM A CIRCULAR TUBE SUSPENDED FROM CEILING AND DRAPES ALL ACROSS THE SIZE
OF THE BED.

LARGE PINK PLASTIC FLORAL WALL LIGHT.

A FEW OTHER LITTLE DECORATIONS FOR HANGING OR PUTTING ON SHELVES

Thanks for your time', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (47, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40241?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40241?l=1', N'Taken: Old doll''s House - magazines still avaiable', N'The doll''s house went very quickly to a very deserving family - so sorry to
disappoint so many people.

The fishing and animal and bird magazines are still available





[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (48, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40240?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40240?l=1', N'Offered: Small packaging materials', N'I have on offer a variety of padded envelopes, some cardboard packaging off
books, a couple of small boxes and a few single DVD boxes all used when I have
been sent books or discs.

May be handy for a charity shop or an ebayer.

Collect Sedlescombe or may be able to deliver if to a local charity.

Mags', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (49, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40239?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40239?l=1', N'TAKEN: Casio CTK-601 Keyboard', N'Sorry to all of you who tried, but the keyboard now has a new home.

Catrina', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (50, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40238?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40238?l=1', N'RECEIVED: Books', N'Thanks to Ann for the books!

Caz




[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (51, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40237?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40237?l=1', N'RECEIVED: Cake turntable', N'Thanks to Bev for the cake turntable, it''s perfect!

Caz




[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (52, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40236?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40236?l=1', N'RE: offered again again', N'Ok I have tried to give this away twice now and people keep saying they want it
but not getting back to me.  PLEASE only respond if genuinely interested.

I have a cot matttess in very good condition.  My daughter used it for 18 months
but it has never been soiled and i would hate to just throw it away but I may
have to if no one wants it.

Please leave me your number and I will call you to arrange collection.

Tthanks for reading.

tina
Clive Vale


[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (53, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40235?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40235?l=1', N'Offered- from nr Morrisons, old quilt', N'I''ve just upgraded the continental quilt so the old one''s on offer. Although
it''s not very old and it''s clean, the cover has torn so the stuffing has fallen
out and it''s not a high quality quilt (hence the replacement). It would be
useful for a dog''s bed or the stuffing may be useful for craft projects.
Heather

[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (54, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40234?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40234?l=1', N'Wanted - Carpet a small bit', N'Hi I am in need of a bit of carpet no smaller than a foot wide, and about 2.5
meters long or 2 smaller bits that I can join together etc.
Colour not a problem.
Can collect any time to suit.

Many thanks
Charley', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (55, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40297?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40297?l=1', N'Wanted: Wooden trunk', N'I am looking for a wooden trunk for clothes storage if anyone has a
spare or one they no longer need.



[Non-text portions of this message have been removed]', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (56, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40296?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40296?l=1', N'WANTED: TN34 SPEAKERS FOR COMPUTER', N'Does anyone have a spare pair of speakers to plug into a computer? My new
monitor doesn''t have sound. I don''t have transport so Hastings/St Leonards area
is best for me. Thanks!', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (57, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40295?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40295?l=1', N'Re -offered Sofa Bed and armchair', N'Perhaps I should explain these are a matching pair in yellow and are what I
would call ''proper'' furniture. i.e. not small, they have a good wooden frame
and are upholstered. The sofa bed has a pull out metal framed bed it''s not
just a futon. The kids have made the yellow mucky, which is why we are
getting new things but I think they will steam clean well. Could do with it
gone at the weekend.



Keith



[Non-text portions of this message have been removed]', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (58, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40294?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40294?l=1', N'TAKEN - assorted', N'Collected today, Kodak digital camera, one printer stand, Event Manager''s Bible.

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





[Non-text portions of this message have been removed]', CAST(0x00009D180156B256 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (59, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40293?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40293?l=1', N'Offered - internal glazed French doors', N'A set of two (one pair) of stained (medium brown), glazed, wooden internal
French doors each door measures 26 and a half inches wide and 77 inches high. 
They are good quality and in excellant condition and have 15 panes of glass in
each door.  Each pane of glass is bevelled and stippled in the middle. They
could be painted to match decor!

Collect from just off The Green in St Leonards', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (60, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40292?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40292?l=1', N'Wanted: PC Power supply', N'Hi all
has anyone got a desktop pc power supply or an old desktop pc i can rob some
parts, a 300w + power supply even if its still in the tower case,
please email.
thanks for reading
Steve', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (61, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40291?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40291?l=1', N'wanted - turf or grass seed, any quantity or type', N'The allotment has taken a real beating over the last few months and there
doesn''t appear to be much grass left on the pathways! So, if anyone has any turf
or grass seed surplus to requirements, I will gladly come and pick it up.
Thanks, Anton.', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (62, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40290?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40290?l=1', N'Wanted: ''Lexx'' DVDs or videos', N'Hi all,

I''m looking for any old ''Lexx'' (sci-fi programme on tv about 10 years ago)
videos or dvds you might not want anymore, on behalf of my husband...

01424/ 850816

Cheers, Katherine', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (63, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40289?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40289?l=1', N'WANTED PLEASE: LARGE DOG BED', N'Hi, I still need one large dog bed please, preferably plastic so I can scrub,
its for a fully grown lab.
Many thanks
Pauline', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (64, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40288?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40288?l=1', N'WANTED: electric fire and Blinds TN34 Blacklands', N'Has anyone got a electric bar fire and window blinds about 4'' to 5''
Thanks Chris





[Non-text portions of this message have been removed]', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (65, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40287?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40287?l=1', N'WANTED: Table top oven/grill', N'Does anyone have a table top oven/grill they no longer use? I''m looking for
something like a Baby Belling.', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (66, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40286?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40286?l=1', N'wanted ; mircalite fastfold pushchair / buggy', N'hi
does anyone have one of these as i have the carry cot but nothing for it to go
on
many thanks
wendy', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (67, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40285?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40285?l=1', N'WANTED: Garden furniture/broom AND freezer', N'Would love if someone had some old garden furniture that is being thrown out for
new!

And looking for a tough outdoor broom to make good off all the fallen soggy
leaves.


Also, we''ve outgrown our tiny freezer and was wondering if anyone had a working
one, possibly with at least 5 drawers, on offer.


Thank you very much. I can collect whenever most convenient.', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (68, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40284?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40284?l=1', N'WANTED; kids or any bedroom warbdrows and sets', N'i have 3 kids and no wardows and chests of draws would give a good home thanks
for time kathy', CAST(0x00009D180156B256 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (69, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40283?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40283?l=1', N'WANTED: Various', N'I have just moved into a small flat in St leonards and would like the following
if in working order:

Small fridge sized freezer
tumble dryer
washing machine
armchair
tv cabinet
also other bits and peices if available
Can collect from local area

Thanks

Ian', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (70, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40282?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40282?l=1', N'wanted please: wicker basket/hamper (hailsham)', N'hi, please if anyone as one they no longer need id be so grateful. thanks emma', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (71, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40281?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40281?l=1', N'wanted: small working tumble dryer', N'Can collect asap

Thanks', CAST(0x00009D180156B256 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (72, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40280?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40280?l=1', N'Wanted: PS2 controller and/or memory card', N'hi there,

i WANT TO PLAY 2-PLAYER ON MY PS2 and need another controller and memory card -
can anyone help

x dave cleasby, hastings area...will collect

01424443008

_________________________________________________________________
Send us your Hotmail stories and be featured in our newsletter[Non-text portions of this message have been removed]', CAST(0x00009D180156B256 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (73, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40279?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40279?l=1', N'OFFERED: Commode and cutlery.', N'Little used commode in excellent clean condition requiring new owner.

Also have some Ikea cutlery -Stainless steell , black handles - 6 place setting
almost complete.

Emailwith phone number', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (74, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40278?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40278?l=1', N'OFFERED TN389HP BIN LINER OF LADIES CLOTHES SIZES 10-12', N'HELLO ALL I HAVE A BIN LINER OF LADIES CLOTHES SIZES 10 TO 12 JEANS,TOPS
TROUSERS, SKIRTS THANKS FOR LOOKING', CAST(0x00009D180156B256 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (75, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40277?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40277?l=1', N'offered (seaford)', N'hi freecyclers i have an empty pc case and small dvd player and few more bits to
find if anyone is interested? Not sure if the dvd player works as been sitting
in the loft.. As soon as i have sorted the rest out will let you all know..
Cheers steve...', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (76, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40276?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40276?l=1', N'OFFERED; HANSOL 900 P CONSOl. Approx. 18&quot;', N'I have the above which is in good working order, a bit big but good for anyone
just starting out with a computer.
Please call landline for more information. Tel; 01424 423325

Best Regards
Chris', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (77, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40275?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40275?l=1', N'OFFERED king size bed and mattress', N'Offered King size divan bed and mattress in very good condition.  Near
Bexhill High in Bexhill. Please email with landline number.


[Non-text portions of this message have been removed]', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (78, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40274?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40274?l=1', N'OFFERED. ADULT MOUNTAIN BKE.', N'HI ALL, I HAVE A GT AGGRESSOR MOUNTAIN BIKE, THE GEARS ARE BROKEN, JUST NEEDS A
NEW REAR DRALIER AND CHAIN I THINK, BUT APART FROM THAT IT''S A GREAT BIKE, VERY
LIGHT TO CARRY, IT HAS SEEN ME PROUD FOR YEARS, IT DOESNT RUST, FRONT SUSPENSION
AND 24 GEARS, SO IT''S U[P FOR GRABS. MARTIN.', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (79, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40273?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40273?l=1', N'offered', N'Hi have five mens shirts to offer they are new but need ironing
and are size 17 1/2 collar 3 white  1 pink 1blue
  Thanks for looking

Rosalind 230', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (80, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40272?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40272?l=1', N'offer - a few items - TN38', N'plastic wallets/polypockets (whatever they''re called!)
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




[Non-text portions of this message have been removed]', CAST(0x00009D180156B256 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (81, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40271?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40271?l=1', N'Offered- Yamaha Organ - TN35 area', N'Yamaha Electone FC10F Electronic Organ on offer.�
�
Piece of furniture rather than just a keyboard, more details or pictures
available upon request or feel free to view.

Regards

Bob

[Non-text portions of this message have been removed]', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (82, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40270?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40270?l=1', N'OFFERED: Epson Scanner, St Helens, TN34', N'Hi everyone,

I have an Epson Perfection 2480 Flatbed Photo Scanner (in spite of name it is a
general purpose scanner)that wants a new home.  It is in good condition and was
working well when last used a couple of months ago. It is a bit slow and
cumbersome though. Comes complete with Driver and cables. My new printer scans
as well so it''s surplus to requirements.

Nick', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (83, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40269?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40269?l=1', N'Offered: Various', N'Hi, we have on offer the following:

-broken-down washing machine for spares

-broken-down tumble dryer for spares

-broken-down hoover (upright) for spares

-slightly damaged, but still usable green, round, plastic garden table (+ 4
chairs to match, but all slightly damaged, can be sat on putting 2 chairs
together...)

If anyone is interested, please email, or call 01424/ 850816.

Must be collected, as we don''t drive. Hollington area of St. Leonards.

Cheers, Katherine', CAST(0x00009D180156B256 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (84, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40268?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40268?l=1', N'OFFERED: Various please read, Pebsham', N'* Sofa, three seater, all removable cushions, with matching armchair and pouffe.
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
Hayley.', CAST(0x00009D180156B256 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (85, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40330?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40330?l=1', N'WANTED: old style wardrobe', N'Wanted double wardrobe old style in dark wood, not chipboard, to suite victorian
house. Can pick up. Thanks please contact 07542 913493', CAST(0x00009D190123F630 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (86, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40329?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40329?l=1', N'WANTED; chair plz read ty', N'hiya, i need a chair for my bedroom i think its called a ratten chair? its
smallish and wicker i think??? i have posted a link 4 a pic of chair i mean, it
doesnt matter if its not white i just need a small chair 4 my room thanks for
looking :)[IMG][/IMG]', CAST(0x00009D1901259C10 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (87, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40328?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40328?l=1', N'Wanted: Suit or jacket', N'I have a student currently going for interviews who wants to make a good
impression. The jackets I have are way too big for him! A black suit would be
great - 32'''' chest, trousers waist 31-32''''. Failing that a jacket would be fine.

Thanks

Mags', CAST(0x00009D1900DC46A0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (88, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40327?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40327?l=1', N'wanted roof slates', N'hello everyone. we are hoping to put a new porch roof up shortly,but we are in
need of roof slates. Has anyone by chance got any?? we can collect. many Thanks.', CAST(0x00009D1900D86E40 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (89, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40326?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40326?l=1', N'wanted/microwave', N'hello everyone im in need of a new microwave oven,can anybody help thanks for
reading regards,tina and lee




[Non-text portions of this message have been removed]', CAST(0x00009D1900FCF5D0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (90, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40325?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40325?l=1', N'WANTED', N'Does anyone have any oddments of wood for toy making please. Natural wood not
MDF.
I can collect.', CAST(0x00009D18018AAF10 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (91, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40324?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40324?l=1', N'Wanted single bed with mattress - bexhill tn39', N'Hi all was wondering if anyone has a single bed pref with mattress my mum in law
is really needing one. be really apperciated. is for the children so must be in
a fairly good cond. thanks all. tn39 bexhill', CAST(0x00009D19009B74E0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (92, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40323?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40323?l=1', N'Offered - Baby Monitor, Door Bouncer &amp; Childrens Building Blocks - Bohemia Area', N'I have the following on offer:

1. Baby monitor. Tomy Walkabout Baby Advance. Don''t know if it works as I have
not used it, was given it but never needed it. Comes with 2 adapters &amp; two units
but no instructions.

2. Baby Door Bouncer. Got this originally from Index catalogue store. Has a
metal bar to support baby with cloth sling to hold baby in. This zips up the
back. Then there is a very strong metal spring &amp; clasp at top &amp; the bouncer
clips onto a chain so can be height adjusted. No instructions but make sure
baby''s feet touch floor.

3. Black bin liner of childs building blocks. Mixture of wooden &amp; plastic with
pictures, letters &amp; numbers on some, others are blank. Some are different
shapes.

Bohemia area. Please provide landline where possible.

Cheers,
Odette', CAST(0x00009D1900FB09A0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (93, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40322?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40322?l=1', N'Offered- Cooker Hood Extractor- TN35', N'Still on offer as the timewaster failed to collect:-

Kitchen Cooker Hood Extractor fan unit, the type�that is designed to fit between
a row of wall cabinets�when fiited with a decor panel to match.

Recently removed during kitchen refurbishment.

Begards

Bob


[Non-text portions of this message have been removed]', CAST(0x00009D1900B4FFF0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (94, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40321?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40321?l=1', N'OFFERED: computer desk', N'OFFERED computer console, pale wood effect, sliding keyboard shelf, plus CD
rack. TN33

[Non-text portions of this message have been removed]', CAST(0x00009D1900BFFC70 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (95, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40320?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40320?l=1', N'offered TN35', N'I have two pink moses baskets and a TWIN stand up for grabs ideally i''d like
them to go to someone
really in need and to all go together and are not to be sold on
  they have been used twice and are in perfect new condition i''ve tried
selling them
but had no joy and i really need them gone as i need the space the stand is
assembled so will need a large car
to transport.

Collection from TN35

Thanks

Gill x


[Non-text portions of this message have been removed]', CAST(0x00009D19013357B0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (96, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40319?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40319?l=1', N'OFFERED: Garden plants evergreens, conifer', N'To make room in my garden I have dug up the following:
&gt; Variegated Green/Yellow evergreen shrub 4ft high.
&gt; Variagated Cream/Green evergreen about 4 ft high
&gt; small leafed variagated evergreen about 2 ft high
&gt; Tiny blue green conifer 12&quot; high, all ready for collection

Also if you really want to fill some space in your garden I have 5 more large
specimen plants BUT YOU HAVE TO DIG THEM UP YOURSELF:
   They include:
&gt; 2 large Cordylines (the plumes reach about 7-10ft in the winter)
&gt; One largish green/yellow evergreen
&gt; 2 very large (1X dark green, 1Xlime green) Conifers
&gt; 1 medium sized dark green conifer 4ft high
&gt; 1 Weeping willow about 5ft tall

These sized plants would cost a lot in the garden centre and they''re yours for
the effort!

Near Beauport Park Roundabout, e-mail me for directions', CAST(0x00009D1900FB9640 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (97, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40318?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40318?l=1', N'OFFERED TODDLER GIRLS WINTER BOOTS NEW, BAG LADIES &amp; GIRLS CLOTHES AGE 1-2', N'3 pairs of boots, all new, ordered from the states, don''t fit and not worth
sending back so:

All are ugg style with fur trim, pom poms and really great grippy soles
-especially in this weather! All infant sizes.

Black US size 6, UK size 5 but come up small so will probably be better for a UK
infant 4.

Black US size 7, UK size 6 but come up small so will probably be better for a UK
infant 5.
Tan US size 7, UK size 6 but come up small so will probably be better for a UK
infant 5.

In St Leonards. You must be able to collect. Email telling me when you can
collect and which ones you want.

I always get loads of replies and with baby clothes &amp; shoes I prefer my stuff to
go to those who really need them (rather than people just after a freebie who
can afford to get stuff new) - single parents, teen mums etc so please tell me 
about why you need it to stand the best chance of getting them!', CAST(0x00009D19011BB8D0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (148, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40338?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40338?l=1', N'Wanted: Videos or dvds: carry ons, only fools and horses, and high spirit film', N'If anyone has any of the following dvds or videos they no longer want, my
husband would be very grateful to receive them:
-any only fools and horses
-any carry ons
-oldish film called ''high spirits''

Thanks for reading, regards,
Katherine', CAST(0x00009D19017CF370 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (149, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40339?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40339?l=1', N'Wanted HP 343/337 Ink Cartridge', N'Hi, have you had a printer that uses the HP-337 black and HP-343 colour
cartridges

If you have HP-337 or HP-343 ink cartriges going spare with ink in
them...im all ears!! and they would be much appreciated!

many thanks

Jo', CAST(0x00009D190158F880 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (150, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40337?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40337?l=1', N'Offered: Ikea uplighter chrome. needs minor electrical repair. tn35', N'nice looking modern light needs a new piece in which to put the light bulb. 
please leave landline no.', CAST(0x00009D190174FC60 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (151, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40336?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40336?l=1', N'WANTED - PAVING SLABS', N'WANTED - PAVING SLABS so I can build a little shed in my garden. I only need a
few. Here`s hoping
Regards, Corinne', CAST(0x00009D190149DD50 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (195, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40335?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40335?l=1', N'wanted', N'any furniture for children''s bedrooms




[Non-text portions of this message have been removed]', CAST(0x00009D190143D270 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (200, 0, N'http://test', N'http://test', N'Wanted: Toy', N'based in pontefract - costing approx £10?

thanks', CAST(0x00009D1A00A36BF0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (228, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40340?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40340?l=1', N'OFFERED: Large Awning for Over Shop', N'Hi,

The Hastings Pier &amp; White Rock Trust have a shop awning on their shop, Arthur
Greens (on the seafront opposite the Ice Rink).

The awning is a curved pull out style, the frame is metal and bolted to the
window frame (so quite heavy).

We were previously quoted approx �360 by South East blinds to get a new cover
made, but we don''t have the funding to do this, as well as pay for a new sign.

So, if anyone is interested in the awning for its frame (to get it recovered/get
money for scrap, etc), it is currently folded up over the shop window so
available to view anytime/measure up and remove.  I have posted a photo of it on
freecycle which should be available once the mods have agreed to it.  Any
interested parties can help themselves, it will need 2+ strong blokes to take it
down.

If I don''t hear from anyone by 18th Feb, I will look to find another solution
(at which stage, any polite suggestions would be appreciated!!!).

Thanks very much', CAST(0x00009D1A00C7AD30 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (258, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40343?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40343?l=1', N'WANTED: Kitchen sink &amp; drainer and a worktop please!', N'Hi,

I am after a kitchen sink with drainer and a worktop so if anyone has any of
these sitting in their shed/garage can you contact me please?

Thanks!

Angela', CAST(0x00009D1A00F31290 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (259, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40342?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40342?l=1', N'offered: maclaren buggy', N'a slighty battered, but working fine buggy with rain cover and cosy toes.

Zoe', CAST(0x00009D1A00EEF3E0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (262, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40341?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40341?l=1', N'Re: OFFERED: Large Awning for Over Shop', N'Hi, I have found an example photograph of the style of awning that it is, to
save misleading anyone interested.Thanks
--- In, &quot;angelavdavis&quot; &lt;angelavdavis@...&gt;
wrote:
&gt;
&gt; Hi,
&gt;
&gt; The Hastings Pier &amp; White Rock Trust have a shop awning on their shop, Arthur
Greens (on the seafront opposite the Ice Rink).
&gt;
&gt; The awning is a curved pull out style, the frame is metal and bolted to the
window frame (so quite heavy).
&gt;
&gt; We were previously quoted approx �360 by South East blinds to get a new cover
made, but we don''t have the funding to do this, as well as pay for a new sign.
&gt;
&gt; So, if anyone is interested in the awning for its frame (to get it
recovered/get money for scrap, etc), it is currently folded up over the shop
window so available to view anytime/measure up and remove.  I have posted a
photo of it on freecycle which should be available once the mods have agreed to
it.  Any interested parties can help themselves, it will need 2+ strong blokes
to take it down.
&gt;
&gt; If I don''t hear from anyone by 18th Feb, I will look to find another solution
(at which stage, any polite suggestions would be appreciated!!!).
&gt;
&gt; Thanks very much
&gt;', CAST(0x00009D1A00E20B30 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (269, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40334?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40334?l=1', N'offer', N'plates cups glasses and cutlery i live near silverhill




[Non-text portions of this message have been removed]', CAST(0x00009D1901438C20 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 4, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (270, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40333?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40333?l=1', N'TAKEN:STC Garden Plants', N'my goodness what a response! I wish I had more.
I have contacted the first responder now.
If not all plants go (remember some have to be dug out!)I will contact the
others in order. Thanks for your interest.', CAST(0x00009D19017E9950 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (271, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40332?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40332?l=1', N'Offered: Blacklands, Hastings TN34 2ED Various', N'Hi All

On offer for collection as soon as possibe�(snow depending) are the following:

1 x Gold 28 &quot; chest Brownie / Guide polo shirt
3 x Blacklands School Green Sweatshirt / Jumper 34&quot;
3 x Blacklands School Green Sweatshirt / Jumper 32&quot;
1�x White school polo shirt Age 7 -8
2�x White school polo shirt Age�9 - 10
3 x White school polo shirt Age�11 -12
1 x Green gingham school dress Age 6 - 7
1 x Black pleated elasticated school skirt Age 6 - 7
1 x Black pleated elasticated school skirt Age 7 -8
1 x Black pleated elasticated school skirt Age 8 - 9
1 x Black pleated elasticated school skirt Age 9 - 10
1 x Pastel yellow with spots fleecy dressing gown Age 7 - 8
1 x Blacklands Scout Jumper (with some badges still sewn on) 34&quot;

1 x Moto (Topshop, I think) denim ''fur'' lined waistcoat / gillet Adult size 12

1 x Clean, but used green and blue Eeyore potty

Approx 20 toddler books inc 20 Traditional Bedtime Stories, Rupert - to go as
one lot, please

All items of clothing are in good, used condition, but will need a wash as they
have been under the stairs which is a little damp.

Look forward to hearing from you with a contact landline number, please.

Cheers for now
Cat




[Non-text portions of this message have been removed]', CAST(0x00009D1901803F30 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (272, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40331?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40331?l=1', N'Received: camera and webcam etc. from sandra', N'Camera and webcam etc. received with much thanks today off Sandra. They work
perfectly- thanks Sandra!
Regards, Katherine', CAST(0x00009D19017BDA30 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 4, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (273, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40317?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40317?l=1', N'ofered lexmark printer lydd', N'hi i have a lexmark printer , drivers ,power lead and with ink in printer , its
one of the x1100 multi printers/fax an oldy but was working up till a few weeks
ago when i upgraded to windows 7 and the computer said NO ,worked well on
xp.collection asap would be nice as sitting under the table in the way thanks
for looking spence', CAST(0x00009D1901140810 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 4, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (274, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40316?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40316?l=1', N'OFFERED: Epson Printer Ink', N'Hi everyone,

I have approx. 2 sets of COMPATIBLE inks for use with Epson
R200/R220/R300/R320/R330/R340/RX500S/RX600/RX620/RX640 (6 cartridge printers).

My R200 Stylus Photo printer is also available to anyone who fancies the
challenge of getting it to work properly!

Cheers

Nick', CAST(0x00009D1900D2F000 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (275, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40315?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40315?l=1', N'Offered - shower curtain rings', N'Set of twelve, clear plastic shower curtain rings, quite sturdy - not a lot else
to say about them really!!!

Collect from just off The Green in St Leonards', CAST(0x00009D1900853590 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (276, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40314?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40314?l=1', N'Offered Mahogany Wall Display Unit', N'Hi

I have a large wall unit with bureaux compartment and drinks cabinet plus
display window. very nice top quality unit.

Can provide measurements and photo if any one is interested.

Trudy', CAST(0x00009D1900B964F0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 0, 0, 1, 1, 15, 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (283, 0, N'http://tester', N'http://tester', N'Wanted: Suite or Toy', N'baryesed in hastings or brede', CAST(0x00009D1A014A69F0 AS DateTime), CAST(0x00009D1A014AB1C0 AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (284, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40344?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40344?l=1', N'taken', N'sorry plates cups and glasses have all gone', CAST(0x00009D1A00651300 AS DateTime), CAST(0x00009D1A01599301 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (285, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40364?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40364?l=1', N'WANTED WORK BENCH', N'Hi everyone has anybody got a workbench please




[Non-text portions of this message have been removed]', CAST(0x00009D1A00F9AA10 AS DateTime), CAST(0x00009D1A0186FD1A AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (286, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40363?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40363?l=1', N'wanted.Sea-shells,', N'if anyone has any sea shells they no longer want or old necklaces made of
shells, I would love them for decorating purposes and garden projects.Thank you
in anticipation', CAST(0x00009D1A00D26360 AS DateTime), CAST(0x00009D1A0186FD4E AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (287, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40362?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40362?l=1', N'WANTED: Red Lake uniform', N'Hi I am after any spare Red Lake jumpers, cardigans or fleeces, ages 5-6 or 8-9
many thanks !!!', CAST(0x00009D1A00B3A060 AS DateTime), CAST(0x00009D1A0186FD57 AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (288, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40361?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40361?l=1', N'furniture wanted!', N'hi has any1 got single bed and matress, wardrobes and chest of drawers please?', CAST(0x00009D1A000278D0 AS DateTime), CAST(0x00009D1A0186FD5C AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (289, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40360?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40360?l=1', N'Wanted stairgate central Hastings', N'I am desperately looking for an opening stairgate .If anyone has one they no
longer use I would be really really grateful.
Thanks for looking. Sue x', CAST(0x00009D1A014BC980 AS DateTime), CAST(0x00009D1A0186FD61 AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (290, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40359?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40359?l=1', N'WANTED: WHITE PRIMER AND WHITE PAINT FOR WOOD', N'If anyone has any leftover white primer and wood paint that they know they wont
use then I would very much appreciate any for a project I''m doing.

Many thanks', CAST(0x00009D1A01266F00 AS DateTime), CAST(0x00009D1A0186FD65 AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (291, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40358?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40358?l=1', N'WANTED - JUMP LEADS &amp; LARGE CARDBOARD BOXES (TN38) - CAN COLLECT', N'Hi Freecyclers

Does anybody have any spare jump leads? Hubby''s car is being VERY temperamental
at the minute &amp; we''re are moving 200 miles away in 2 weeks, and getting a bit
worried about the car starting on the day :(

We are also in need of some large cardboard boxes for the move, if anyone has
any?

Thanks for reading

Maria', CAST(0x00009D1A015B7150 AS DateTime), CAST(0x00009D1A0186FD7D AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (292, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40357?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40357?l=1', N'Wanted - Table Saw - TN38', N'Hiya

I know it''s a big ask but I was always told that if you don''t ask you don''t
get.
I was just wondering if anyone had an old table saw sat around that they no
longer use?
I have been getting interested in making my own furniture, that way it will
always fit your room.
It doesn''t matter if it''s working or not as I''m fairly good with things like
that.
I do not drive so pick up will have to be around my brother so he can give
me a lift unless you could drop it off (for petrol money of course).

Thank you for reading

Vince &amp; Kelly

[Non-text portions of this message have been removed]', CAST(0x00009D1A011494B0 AS DateTime), CAST(0x00009D1A0186FD82 AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (293, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40356?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40356?l=1', N'OFFERED: 4 CLOSER TO NATURE BABY BOTTLES', N'4 feeding bottles minus teats - these can be bought from any chemists.
1 pink non-spill baby beaker

Thanks for looking
jonesy', CAST(0x00009D1A01144E60 AS DateTime), CAST(0x00009D1A0186FD86 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (294, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40355?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40355?l=1', N'OFFERED Central Heating Radiator - St Leonards', N'Central Heating Radiator - single panel - modernish design measures about 7 feet
long X 2 feet high. Currently painted blue.

Must be someone cold out there ?

Last chance before landfill !', CAST(0x00009D1A012DD970 AS DateTime), CAST(0x00009D1A0186FD86 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (295, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40354?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40354?l=1', N'Offered TN37 Tinned Potatoes.', N'Hi, I have 4 x 360g tins of New Potatoes . In date till 2012 . Make is Freshona
. Prob from Lidil. Anyone interested can collect from Harrow Lane . Landline
only please.', CAST(0x00009D1A00982920 AS DateTime), CAST(0x00009D1A0186FD8B AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (296, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40353?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40353?l=1', N'Offered: Various - Large wine rack, K�rcher vacuum cleaner bags and more', N'Offered:  Large wine rack for 48 bottles - nothing fancy just a very basic rack.

Bags for a K�rcher 2001 cleaner

several spools of thin yellow nylon cord.

Qantity of old picture frames.

All to be collected from central St Leonards





[Non-text portions of this message have been removed]', CAST(0x00009D1A011B2C30 AS DateTime), CAST(0x00009D1A0186FD90 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (297, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40352?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40352?l=1', N'Offered - hardcore', N'Substantial amount of hardcore available, to collect from The Ridge, Hastings. 
Easy access for loading into car or trailer

Jackie', CAST(0x00009D1A01217D60 AS DateTime), CAST(0x00009D1A0186FD94 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (298, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40351?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40351?l=1', N'offered hollington z-bed', N'hi

have a z-bed looking for a new home, its old but very comfy.

Anja', CAST(0x00009D1A0152A750 AS DateTime), CAST(0x00009D1A0186FD94 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (299, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40350?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40350?l=1', N'OFFERED: pillows, cushions, bedlinen', N'Two square cushions in thick navy twill covers, two hollowfibre pillows, some
duvet covers, and a pillowcase or so. All to go at once please from West Hill
Hastings.', CAST(0x00009D1A00EFC6D0 AS DateTime), CAST(0x00009D1A0186FD99 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (300, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40349?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40349?l=1', N'Offered, Ore village area', N'Non-working electric guitar. The electics that don''t work and it needs the top
two strings. Make is Rockwood (by Hohner)




[Non-text portions of this message have been removed]', CAST(0x00009D1A00CFEA90 AS DateTime), CAST(0x00009D1A0186FD9E AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (301, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40348?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40348?l=1', N'OFFERED TN389HP CANNON NPI550 PHOTOCOPIER', N'HELLO ALL WE HAVE PICKED UP A PHOTOCOPIER FROM A FELLOW FREECYCLER IT HAS 3
SPARE TONERS AND IT COMES WITH ITS CABINATE UNFORTUNATELY WE  CANT SEEM TO SORT
THE PROBLEM OUT WITH IT IT SAIS PAPER JAM BUT THERE ISNT A PAPER JAM THIS WILL
BE  A FANTASTIC PIECE OF EQUIPMENT ONCE THE PROBLEM IS SORTED WE JUST DONT HAVE
THE TIME TO DO IT THIS MUST GO ASAP PLEASE', CAST(0x00009D1A00ED07B0 AS DateTime), CAST(0x00009D1A0186FDA2 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (302, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40347?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40347?l=1', N'Offered - Computer desk', N'Offered metal compuer desk, similar style�to argos pg747 no 4. Has�got
a�slight�dent on 1 side of the shelf that the monitor sits on, but doesnt effect
the overall�use of the desk.
�




[Non-text portions of this message have been removed]', CAST(0x00009D1A00963CF0 AS DateTime), CAST(0x00009D1A0186FDA7 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (303, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40346?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40346?l=1', N'TAKEN: Epson Printer Ink', N'Ink now taken STC.  Thanks to all who replied', CAST(0x00009D1A00AE6870 AS DateTime), CAST(0x00009D1A0186FDAC AS DateTime), 0, 0, 3, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (304, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40345?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40345?l=1', N'TAKEN: lots of useful stuff - gardening tools, watch, curtains', N'Thanks to everyone who responded so postively to the posting for the gardening
tools, the Sekonda watch and the curtains. These have been taken but the pillows
and tea towels are being re-posted. The Bobby McFerrin video has gone to a
charity shop, so that''s off the list as well.', CAST(0x00009D1A00F099C0 AS DateTime), CAST(0x00009D1A0186FDB0 AS DateTime), 0, 0, 3, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (305, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40429?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40429?l=1', N'offered large tv and large monitor hastings', N'i have a 27&quot; tv dark grey old type not flat screen with remote very well used
the aerial socket broken but works with scart lead.

i have a an 18&quot; monitor old type not flat screen well used but works.', CAST(0x00009D1D01380300 AS DateTime), CAST(0x00009D1D0158CC6D AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (306, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40428?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40428?l=1', N'TAKEN: Pillows, cushions, bedlinen', N'Thanks for the interest.', CAST(0x00009D1D0144A560 AS DateTime), CAST(0x00009D1D015946FB AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (307, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40427?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40427?l=1', N'RECEIVED WITH THANKS !!! BUNK BEDS !!!', N'Huge Massive Ginormous thanks to Lisa for the fabulous bunk beds !!!

What would we do without Freecycle eh ??!!



Absolutely fabulous !!!



Rose

Clive Vale xx

_________________________________________________________________
Got a cool Hotmail story? Tell us now[Non-text portions of this message have been removed]', CAST(0x00009D1D0140CD00 AS DateTime), CAST(0x00009D1D01598546 AS DateTime), 0, 0, 4, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (308, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40426?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40426?l=1', N'Wanted - Carpet (Rye Area)', N'Hello there,

Is anyone in the process of replacing a carpet at the moment as I am looking for
a brown/beige/cream coloured one at least 4m x 5m. I don''t have any on the floor
at the moment and it is incredibly cold underfoot.

I would really appreciate anything and thank you for taking the time to read
this .', CAST(0x00009D1D012D9320 AS DateTime), CAST(0x00009D1D0158CD08 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (309, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40425?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40425?l=1', N'TAKEN: COT - STILL ON OFFER : SINGLE DIVAN - Clive Vale Area', N'Hi GUYS !!



The cot is taken I''m afraid, subject to collection.



Still have the single divan - great condition, storage underneath !!   Any
takers ??   Would like collected today if possible please !!!   no mattress.

Desperately need the space !!!!





Rose xxx

_________________________________________________________________
Tell us your greatest, weirdest and funniest Hotmail stories[Non-text portions of this message have been removed]', CAST(0x00009D1D00F9AA10 AS DateTime), CAST(0x00009D1D0158CD11 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (310, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40424?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40424?l=1', N'Offered: Ore village area', N'Offered:Steering wheel/pedals for Playstation.
Gratefully received from another Freecycler some months ago but now no longer
needed.




[Non-text portions of this message have been removed]', CAST(0x00009D1D01213710 AS DateTime), CAST(0x00009D1D0159A5B3 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (311, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40423?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40423?l=1', N'offered----single divan base and cube toy', N'i have offered a single divan base, good condition, i kept matterss for my
daughters new metal frame bed

and

a cube toy thingy, toddler toy

email only please,
jane
tn38', CAST(0x00009D1D01213710 AS DateTime), CAST(0x00009D1D0158CD29 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (312, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40422?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40422?l=1', N'Wanted - TV Stand', N'Wanted a TV stand or pededstal for a 37&quot; Panasonic Plasma monitor. No suitable
wall.', CAST(0x00009D1D010300B0 AS DateTime), CAST(0x00009D1D0158CD37 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (313, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40421?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40421?l=1', N'Offered Blacklands: Pampering set', N'This is a foot spa, Face steamer and smaller attachment and massager with
three different heads.  Not boxed but just given it a good wash and clean up
as it was in the loft.



Thanks for reading



Kay



[Non-text portions of this message have been removed]', CAST(0x00009D1D012814E0 AS DateTime), CAST(0x00009D1D0158CD45 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (314, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40420?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40420?l=1', N'TAKEN - TABLETOP COOKER', N'Sorry everyone, this went in the first half hour! Regards, Corinne', CAST(0x00009D1D01133520 AS DateTime), CAST(0x00009D1D0158CD53 AS DateTime), 0, 0, 3, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (315, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40419?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40419?l=1', N'taken girl clothes bexhill', N'sorry but baby girls clothes have now gone', CAST(0x00009D1D00E85C60 AS DateTime), CAST(0x00009D1D0158CD61 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (316, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40418?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40418?l=1', N'wanted/ram/hard drives', N'hello everyone im in the process of building computers for under privileged
children,i need some sd ram/ddr ram/and any hard drives would be ideal thanks
for reading ,lee




[Non-text portions of this message have been removed]', CAST(0x00009D1D00E20B30 AS DateTime), CAST(0x00009D1D0158CD6F AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (317, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40417?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40417?l=1', N'OFFERED: Kawai electric organ, books and stool. TN35', N'Lovely electric organ with some music books and stool so all ready to go! We
were given it and I''d love to keep it but don''t have the time to play it and
could do with the space!

Hope someone out there could get some enjoyment from it.

Shanna', CAST(0x00009D1D00D98780 AS DateTime), CAST(0x00009D1D0158CD78 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (318, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40416?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40416?l=1', N'OFFERED : COT AND SINGLE DIVAN - CLIVE VALE', N'Hello Freecyclers !!!!



Lovely cot up for grabs - really good condition, without mattress, light wood.



Single divan, storage underneath, without mattress, really good condition.



Both must be collected TODAY please !!!!



Whoever can promise to come today will get first refusal !!!



Rose

Clive Vale x

_________________________________________________________________
Send us your Hotmail stories and be featured in our newsletter[Non-text portions of this message have been removed]', CAST(0x00009D1D00D5F570 AS DateTime), CAST(0x00009D1D0158CD86 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (319, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40415?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40415?l=1', N'offered', N'i have had a little sort out and have on offer a black bag with age 2-3 boys
clothes in aswell as
a thomas the tank engine phone
pirate toys
a battery operated train
fimbles noisy book and
size 6 thomas wellies
all  to go together asap please', CAST(0x00009D1D00C8C670 AS DateTime), CAST(0x00009D1D0158CD95 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (320, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40414?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40414?l=1', N'OFFERED. CORNER BATH PANEL.', N'STILL PACKAGED SMALL CORNER BATH PANEL - MISTY GREY. IT`S ABOUT 77&quot; LONG AS YOU
FOLLOW THE CURVE.

ALSO RADIATOR AND BRACKETS ( NOT NEW ) BUT GOOD. 32&quot; LONG X 29&quot; HIGH.', CAST(0x00009D1D00C4EE10 AS DateTime), CAST(0x00009D1D0158CDA3 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (321, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40413?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40413?l=1', N'offered girl clothes bexhill', N'Sent from my iPhone', CAST(0x00009D1D00C9DFB0 AS DateTime), CAST(0x00009D1D0158CDA7 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (322, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40412?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40412?l=1', N'Wanted please fencing.', N'We are moving home soon and ned some wooden fencing high enough to keep our dog
from wandering, up to 5ft minimum and as long as possible please, if anyone can
help we would be really grateful.
Thanks Paul.', CAST(0x00009D1D008721C0 AS DateTime), CAST(0x00009D1D0158CDB5 AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (323, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40411?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40411?l=1', N'wanted: cajun/ zydeco music', N'HELP! We''re having a mardi gras party and (whose stupid idea was that??? Mine!)
haven''t really got it together in time (no change there then) I know we have a
tape called Alligator Stomp somewhere in this house but can''t find it. PLEASE if
anyone has any Cajun or Zydeco music on tape or disc that they would be prepared
to pass on to a good home there''s a group of 12 year olds who would love to
dance to it!
Thanks from Jill', CAST(0x00009D1D006F82E0 AS DateTime), CAST(0x00009D1D0158CDBF AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (324, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40410?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40410?l=1', N'WANTED: TV', N'HI HAS ANY ONE GOT A WORKING T.V THEY NO LONGER WANT. IT NEEDS TO HAVE A REMOTE 
NOT FUSSY ON SIZE CAN COLLECT THANK YOU', CAST(0x00009D1C013C6800 AS DateTime), CAST(0x00009D1D0158CDCD AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (325, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40409?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40409?l=1', N'OFFERED - TABLETOP COOKER', N'I have a table top cooker to offer. It`s got an oven/grill and a hotplate. The
timer doesn`t work, but apart from that it`s fine.
Regards,  Corinne', CAST(0x00009D1C0169B990 AS DateTime), CAST(0x00009D1D0158CDDB AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (326, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40408?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40408?l=1', N'OFFERED; 20&quot; SANYO COLOUR TV. NOT FLATSCREEN OR FREEVIEW', N'I have the above, works o.k but need the space!!!
Please contact by landline 01424 423325.

Regards, Chris', CAST(0x00009D1D00A1C610 AS DateTime), CAST(0x00009D1D0158CDE9 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (327, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40407?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40407?l=1', N'Offered (TN38) Cedar Wood Oil, Double Duvet for pets ets', N'1. 100ml Druids Keep Essential Oil: Cedar Wood
Not for undiluted use. Would prefer this to go to someone with some knowledge of
aromatherapy as quite a strong oil.

2. Had a puppy accident on our nearly new duvet which would have cost more to
have cleaned than to replace. Have cut it in two for washing which gives 2 half
duvets for pet bedding after some sewing or maybe just take out the filling for
cushions.  Unsuitable for our pup as he wants to take it apart. Should be dry
and available tomorrow.', CAST(0x00009D1C0132CB10 AS DateTime), CAST(0x00009D1D0158CE00 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (328, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40406?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40406?l=1', N'offered girl clothes bexhill', N'hi i have 2 black sacs of baby girl clothes if amyone wonts them need gone asap
cheers', CAST(0x00009D1C01510170 AS DateTime), CAST(0x00009D1D0158CE0E AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (329, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40405?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40405?l=1', N'OFFERED TWO BLACK CD TOWERS', N'hello freecyclers

I have two black cd towers looking for a new home if you are interested then
please email. only serious emails only please.  needs to go asap as we are
running out of space

thanks for reading
sarah', CAST(0x00009D1C016481A0 AS DateTime), CAST(0x00009D1D0158CE1C AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (330, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40404?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40404?l=1', N'OFFERED TN38HP CARRIER BAG OF GIRLS CLOTHES', N'HELLO I HAVE A CARRIER BAG OF GIRLS CLOTHES SIZES 5-6-7 YRS IF ANY ONE WANTS
THEM', CAST(0x00009D1C00F285F0 AS DateTime), CAST(0x00009D1D0158CE21 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (331, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40403?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40403?l=1', N'WANTED: Fridge Freezer', N'hello peeps, im asking 4 some friends 4 a fridge and a small freezer or a
fridgefreezer, they just got home to find theres not working :((((, they have 2
small children so if any one can help it would b most appreciated, many thanks
to u all :))),', CAST(0x00009D1C0101A120 AS DateTime), CAST(0x00009D1D0158CE34 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (332, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40402?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40402?l=1', N'computer bits and cases tn34', N'offered box of computer inner bits, like graphics cards, procesors, 3 old mother
boards p2 and p3 and a newer one, lots of other bits including

one computer keyboard, works fine just surplus to requirements

2 computer cases one tall one smaller

a really great scanner that DOES NOT work on windows 7, had it working on xp and
below.  compact easy to use, such a shame to dump

would like the bits to go together but will split the cases if people just want
one of them.�

as always with me, please dont say you want them and not come to collect as I do
have a life!!

claire', CAST(0x00009D1C00F58B60 AS DateTime), CAST(0x00009D1D0158CE42 AS DateTime), 0, 0, 4, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (333, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40401?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40401?l=1', N'offered - sandhurst - computer tower', N'i know nothing about this i was given it to me for a project it has everything
in it so would be a project for someone else to put together - no parts need
purchasing just putting back together - please leave a landline number', CAST(0x00009D1C010B3E10 AS DateTime), CAST(0x00009D1D0158CE5E AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (334, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40400?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40400?l=1', N'Taken Ladies Sheepskin Coat', N'The ladies sheepskin coat is now taken. Thanks to all who responded.
D. Mackrill.', CAST(0x00009D1C010B8460 AS DateTime), CAST(0x00009D1D0158CE6C AS DateTime), 0, 0, 3, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (335, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40430?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40430?l=1', N'Wanted- netgear router', N'Wanted a netgear dg824gt or a dg834v4 if anyone has one they no longer need. thx', CAST(0x00009D1D01544D30 AS DateTime), CAST(0x00009D1D015E468F AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (336, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40431?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40431?l=1', N'OFFERED: a few household items', N'Two green nonstick Marks and Sparks saucepans with glass lids - still life in
them!
Two giant white pasta plates/shallow soup-bowls - about 14 inches across,
restaurant-style.
A square double thickness oven sheet needing a good clean. Could be used for DIY
mixing, or baking if clean. Rather carbonised at present!

Preferred if they all went together. Happy for you to sell any of these on if
you want to and can.', CAST(0x00009D1D015EBD10 AS DateTime), CAST(0x00009D1D01610608 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (338, 0, N'http://testingst', N'http://testingst', N'Antohertets', N'I have some grass, a few boxes, bag of clothes, pair of boots and a chair.', CAST(0x00009D1E00C5C100 AS DateTime), CAST(0x00009D1E00C5E2E3 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (339, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40483?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40483?l=1', N'wanted please for my baby girl baby bouncer chair and working baby monitors', N'hi all, i am in desperste need of the above items as my 3 month old daughter has
got a medical condition that affects her while she is lying flat, (she turns
grey and stops breathing), if anyone has a bouncy chair to help me keep her
upright i would be so grateful, also if anyone has any working monitors so that
i can listen pout for her more easily,
many thanks
sarah', CAST(0x00009D1F00A81740 AS DateTime), CAST(0x00009D1F00BFDA2B AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (340, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40482?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40482?l=1', N'WANTED: LADDER FOR HIGH CEILINGS', N'I''ve recently moved into a flat with very high ceilings and need a ladder so
that I can hang things.  Anyone got one, I would appreciate it.

Regards,
Kerry', CAST(0x00009D1E016C78B0 AS DateTime), CAST(0x00009D1F00BFDAD9 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (341, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40481?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40481?l=1', N'wanted', N'HI can any one help my fone has stoped working and i am in need of an a phone
for t mobile plz email if any thanks
carl', CAST(0x00009D1E018AF560 AS DateTime), CAST(0x00009D1F00BFDB29 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (342, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40480?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40480?l=1', N'WANTED: OUTDOOR PLANTS/CUTTINGS', N'HELLO, I AM TRYING TO REFURB MY GARDEN AND WONDERED IF ANYONE HAS ANY UNWANTED
SHRUBS/PLANTS/CUTTINGS THAT WOULD HELP TO BUILD UP THE BORDERS

MANY THANKS

CATRINA', CAST(0x00009D1E018AAF10 AS DateTime), CAST(0x00009D1F00CF3BE0 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (343, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40479?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40479?l=1', N'WANTED PLEASE. Manual Sheet Metal Bender', N'Hello, if anyone out there has a manual sheet metal bender thats taking up their
space, my husband would like to have one for his projects.
Thanking you, jo', CAST(0x00009D1E0157DF40 AS DateTime), CAST(0x00009D1F00CD939B AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (344, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40478?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40478?l=1', N'Wanted - - 1st home Items Heathfield / Hurst Green / Bexhill', N'Hello All,

I''ve just got the keys to my first place but unfortunatly lacking the basics, I
don''t suppose anyone has any of the following that they need taking away /
spare.

Washing machine
Fridge
Sofas
Bed(s)

I know I''m asking a lot but it would be a serious help.

I''m often between Heathfield / Hurst Green / Bexhill most of the time and am
very flexible.

Much appreciated as always

James', CAST(0x00009D1F008CE650 AS DateTime), CAST(0x00009D1F00CEDE1E AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (345, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40477?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40477?l=1', N'TAKEN: CARL LEWIS AIR WALKER', N'THANKS TO THE VERY QUICK COLLECTION, I WISH I HAD MORE TO GIVE AWAY!!!', CAST(0x00009D1F00754770 AS DateTime), CAST(0x00009D1F00CCCCBD AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (346, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40476?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40476?l=1', N'Received with thanks- carrier bag of girl''s clothes', N'Thanks Becky, for the clothes, my daughter loves them, and they are just the
right size for her! Thanks! Katherine', CAST(0x00009D1E017615A0 AS DateTime), CAST(0x00009D1F00BFDBA2 AS DateTime), 0, 0, 4, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (347, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40475?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40475?l=1', N'OFFERED......toddler toy', N'hi fellow freescylers
i have for offer a toddler toy that im not sure how to describe!! lol its sort
of a cube with a door and with top like the toys in the banks?
email me for a pic if anyones interested or it will go to a charity shop
jane', CAST(0x00009D1F00761A60 AS DateTime), CAST(0x00009D1F00BFDBBA AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (348, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40474?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40474?l=1', N'Offered - Motorcycle Cover TN377AX', N'Hi I have a used but in alright leave ya bike out side condition, the cover has
a light lining inside to protect the paint work etc, should fit a Honda hornet
600cc &amp; lower. I used to cover my Honda 400 and it went down to the floor.
The cover is a heavey weight and so is good for windy hastings. (Sorry NOT
suitable for a moped as it is 1) - to big and 2) - to heavey)

Collect any time day or night, as I will leave the cover in the black box up the
drive, just need to let me know the day so I can leave it out for you.

Charley', CAST(0x00009D1E01700AC0 AS DateTime), CAST(0x00009D1F00CD541F AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (349, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40473?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40473?l=1', N'Offered - Various', N'Clearing my brother''s flat and we have a box of odds and sods, including a
modem, USB peripheral switch, and a squeaking chicken. Good for boot sale.
A Donnay golf bag with a 2 wheel cart.
A Pro-form cross trainer that needs some attention.', CAST(0x00009D1F009450C0 AS DateTime), CAST(0x00009D1F00BFDBE9 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (350, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40472?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40472?l=1', N'TAKEN (STC) Knitting Yarn, West St Leonards', N'The yarn has been taken subject to collection.

Thanks and sorry to everyone else who was interested.

Cheers

Lesley', CAST(0x00009D1F00A20C60 AS DateTime), CAST(0x00009D1F00BFDBFC AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (351, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40471?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40471?l=1', N'Taken Ladies Sheepskin Coat', N'MANY THANKS DAVID FOR THE LOVELY SHEEPSKIN. JO




[Non-text portions of this message have been removed]', CAST(0x00009D1E015DA3D0 AS DateTime), CAST(0x00009D1F00BFDC13 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (352, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40470?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40470?l=1', N'Taken - Bike Rack, Drawers and Work Bench', N'All taken, subject to collection.  Thanks for all the interest, sorry for those
who missed out.  They sure were popular items!

Claire', CAST(0x00009D1F009EC0A0 AS DateTime), CAST(0x00009D1F00BFDC26 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (353, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40469?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40469?l=1', N'TAKEN- single divan base', N'', CAST(0x00009D1F00754770 AS DateTime), CAST(0x00009D1F00BFDC34 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (354, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40468?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40468?l=1', N'WANTED DESPERATLY: Cot with or without matress!', N'Hi freecyclers,

Im 5 months pregnant and havn''t yet got a cot and considering things are tight
at the moment it''s going to be very hard to afford one,
If anyone has one please mail me!

Thankyou
Naomi', CAST(0x00009D1E014E4250 AS DateTime), CAST(0x00009D1F00BFDC55 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (355, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40466?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40466?l=1', N'Offered - Bike rack for hatchback style car', N'I have a bike rack for 2 bikes, it has all the bits to it, but haven''t been able
to use it since buying my ford mondeo as it fits a hatchback.

Hope someone can make use of it.

Claire', CAST(0x00009D1E01549380 AS DateTime), CAST(0x00009D1F00BFDC71 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (356, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40465?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40465?l=1', N'taken/still offered tv hastings', N'taken tv


still offered monitor 18&quot; screen old type

also goodmans stereo large takes 3cd''s drawer abit temprementle
but works fine.', CAST(0x00009D1E0133E450 AS DateTime), CAST(0x00009D1F00BFDC83 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (357, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40464?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40464?l=1', N'Offered again large wine rack and other things', N'Offered:  Large wine rack for 48 bottles - nothing fancy just a very basic rack.

Quantity of 6&quot; tiles approx 50 light sage green and 22 browny red with one
rounded side (were used as an edging) - also a large matching browny red soap
dish.  These are all reclaimed so would need soaking to remove old tile cement.

Bags for a Kärcher 2001 cleaner

several spools of thin yellow nylon cord.

Qantity of old picture frames.

All to be collected from central St Leonards




[Non-text portions of this message have been removed]', CAST(0x00009D1E012B1A50 AS DateTime), CAST(0x00009D1F00BFDC9B AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (358, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40463?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40463?l=1', N'Offered - Stairgate &amp; Cast Iron Pot stand - Bohemia Area', N'I have a step through stairgate on offer. Has no wall fixing but stays in place
by means of pressure. Lift up opening section but bar along the bottom hence
step through. Metal.
Also a black cast iron pot stand with four shelves from top to bottom.
Scroll/heart shape wrought design on shelves.

Bohemia area.

Thanks, Odette', CAST(0x00009D1E013284C0 AS DateTime), CAST(0x00009D1F00CDD56B AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (359, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40462?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40462?l=1', N'Offered - two white melamine chests of draws and workbench', N'They''ve been in my shed so a bit tatty, but still useable.
One is three and one is 5 drawer as far as I remember, both quite small, would
suit a childs bedroom (need a bit of a clean) or a garage.  They''ve been stacked
on top of each other which also seemed to work ok.

I also have a workbench I don''t think I''ll realistically use.

They''ll all be outside from tonight, so hopefully they''ll be OK!

Claire', CAST(0x00009D1E012D4CD0 AS DateTime), CAST(0x00009D1F00BFDCC5 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (360, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40461?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40461?l=1', N'received bob the builder coat', N'thanks very much for the dod the builder coat my son loves it', CAST(0x00009D1E012C3390 AS DateTime), CAST(0x00009D1F00BFDCD8 AS DateTime), 0, 0, 4, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (361, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40460?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40460?l=1', N'Offered-Blacklands-Mixed items', N'I have 3 bags of mixed items, Clothes, shoes and other. May be suitable for boot
sale items.
Olivia', CAST(0x00009D1E01292E20 AS DateTime), CAST(0x00009D1F00BFDCEB AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (362, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40459?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40459?l=1', N'WANTED please. calor gas heater &amp; empty bottle. hastings &amp; surronding area.', N'Hi guys!,
         possibly not the best time of year to be asking for one of these, but
hey ho, you never know!. Has any one got a working calor gas heater sitting
around,no longer needed?... one with a hose and regulator would be nice, but as
i''m after one for free, i will gratefully accept anything thats offered :-).

                many thanks for reading, here''s hoping.

                          cheers , carl.', CAST(0x00009D1E00E0ABA0 AS DateTime), CAST(0x00009D1F00BFDD02 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (363, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40458?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40458?l=1', N'Wanted - Bird table/Nest boxes', N'Hi people, if you have bird table and bird boxes that you no longer require then
please can we take it off your hands. My son is obsessed with Springwatch and
really want these items so they can watch what birds come into our garden.

If you can help then please get in touch.

Many thanks', CAST(0x00009D1E00EAD530 AS DateTime), CAST(0x00009D1F00BFDD19 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (364, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40457?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40457?l=1', N'WANTED: canvas', N'hi!! im looking for all sizes canvas. just begun learning to paint so need lots
of them. all generosity appreciated.', CAST(0x00009D1E00F3E580 AS DateTime), CAST(0x00009D1F00BFDD3A AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (365, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40456?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40456?l=1', N'Wanted: PC/Laptop', N'Is anybody getting rid of a PC, either desktop or laptop?

I''m looking for something my kids can use for educational games, Paint etc

(Preferably not a desktop with a big heavy monitor though, or something with a
really slow processor).

Many thanks,
Luke







_________________________________________________________________
We want to hear all your funny, exciting and crazy Hotmail stories. Tell us now[Non-text portions of this message have been removed]', CAST(0x00009D1E00CB3F40 AS DateTime), CAST(0x00009D1F00BFDD48 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (366, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40455?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40455?l=1', N'wanted fillter coffee maker', N'hi i no its a long shot but does anyone have an old fillter coffee maker they
dont want as mine has broken has to be one you put a fillter in to and add
coffee to not the one with the coffee pods many thanks lesley', CAST(0x00009D1E00A78AA0 AS DateTime), CAST(0x00009D1F00BFDD60 AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (367, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40454?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40454?l=1', N'WANTED', N'WANTED DESPERATLY NEEDED A PINE FRAMED DOUBLE OR KING SIZE BED FRAME IF CAN
DELIVER TOO THAT WOULD BE GREAT!!', CAST(0x00009D1E00CAF8F0 AS DateTime), CAST(0x00009D1F00BFDD69 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (368, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40453?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40453?l=1', N'Wanted Blowup double airbed Bexhill', N'Please does anyone have a  double airbed that they no longer need, my daughter
and her boyfriend will be coming to stay this week and we have nowhere for them
to sleep so we would love one so they can stay with us.
Im in sidley in bexhill and collect at any time.
many thanks
sandy.


[Non-text portions of this message have been removed]', CAST(0x00009D1E00C27540 AS DateTime), CAST(0x00009D1F00BFDD81 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (369, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40486?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40486?l=1', N'OFFERED TN38: Various', N'Hi guys,

1. Half pack of coving cement,
2. Books: Bag of thriller/ muder novels
                2 cookery books
                 Book on how to make cushion covers
3. Bag of material (Not entirley sure whats in there may be good for patchwork?)
4. Bunk Beds -  all fixings included pine beds nothing amazing but could do
someone a turn
5. single mattress- need to check its still ok as its stored under girls bed at
the moment
6. sewing machine - i know someone was after one the other day &amp; have e-mailed
them, if i get no response or they no longer need one its up for grabs (singer -
with cabinet, 4 draws) has some spares &amp; instructions!
7. knitting needles various
8. Darning yarn
9.Vileda squeegee mop thing requires replacement sponge head
10. pink curtains with heart pattern, no idea what size but they seem
substantial
11. Electric 3 tier steamer, needs a really good clean but still works great
12. 10 large cream dinner plates (all one set.)
13. Senseo coffe machine - one that needs pods

ALL for COLLECTION ONLY no doubt more to follow...


Paula

[Non-text portions of this message have been removed]', CAST(0x00009D1F00E2DE20 AS DateTime), CAST(0x00009D1F00E7CDE2 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (370, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40485?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40485?l=1', N'Offered nokia charger, land phone, leads and computer bits', N'1 nokia phone charger – older larger pin

Telcom landline phone, practically new. Simple but can be programmed with
numbers.

Headphones with microphone for skype etc.

Small mic for computer, pin connection not USB

USB mouse

3 power leads for older computers, monitors, TVs, kettles, printers etc, chunky
(3 rectangular holes)

4 power leads for cd players, some printers etc (two round holes like
binoculars)

2 power leads, not sure what for but they are chunky and have a triangular
arrangement of 3 holes.

Belkin computer to computer connector lead – 2x 25 pin and 2x 9 pin (females) on
same cable.

Male to female lead, the kind used for the keyboard/mouse with a couple of
adaptors to attach different sized connections.

Relisted - black and colour inks for Epson stylus colour printers

All working as far as I know.

Pick up preferred from St Leonards near seafront.
Leila', CAST(0x00009D1F00E5E390 AS DateTime), CAST(0x00009D1F00E7CE1A AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (371, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40484?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40484?l=1', N'Taken - Stairgate - Bohemia Area', N'Sorry to all who replied but stairgate has now gone to protect a couple''s
kitchen plates.

Odette

--- In, &quot;Odette&quot; &lt;oddypotter@...&gt; wrote:
&gt;
&gt; I have a step through stairgate on offer. Has no wall fixing but stays in
place by means of pressure. Lift up opening section but bar along the bottom
hence step through. Metal.
&gt; Also a black cast iron pot stand with four shelves from top to bottom.
Scroll/heart shape wrought design on shelves.
&gt;
&gt; Bohemia area.
&gt;
&gt; Thanks, Odette
&gt;', CAST(0x00009D1F00AD4F30 AS DateTime), CAST(0x00009D1F00E7CE36 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (372, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40488?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40488?l=1', N'OFFERED: TWO SINGER SEWING MACHINES (near Ore Village, Hastings)', N'I have two Singer sewing machines that were given to me but I already have one. 
They are not new models, slightly old fashioned.  One has a hard cover, one has
a soft cover and they both have carry handles.  They have no cables so I haven''t
checked them to see if they work.  E-mail me if you''re interested with a phone
number and I''ll give you a call asap. They need to go by the weekend please. 
Thanks, Sharon.', CAST(0x00009D1F00CF17A0 AS DateTime), CAST(0x00009D1F00E92DA2 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (373, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40487?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40487?l=1', N'Re Offered: Bathroom Cabinet. West Hill', N'Hello there.

Due to non - collection TWICE we still have a pine bathroom cabinet. It has two
mirrored sliding doors measures (approx.) 14&quot;hx23&quot;wx6&quot;d. Must go asap as we''re
falling over it and it''s too good for landfill.

Please only email if you really can and will collect.

Thanks.

Emma Joe and the boys.', CAST(0x00009D1F00BA37E0 AS DateTime), CAST(0x00009D1F00E92DC8 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (374, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40489?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40489?l=1', N'TAKEN STC TN38', N'Bunkbeds
Mattress
Coffee Machine
 
Paula Sanders

[Non-text portions of this message have been removed]', CAST(0x00009D1F00EF8080 AS DateTime), CAST(0x00009D1F00F16B1A AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (375, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40492?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40492?l=1', N'Wanted------------ reggae music urgently', N'hiya everyone

i really would love to get some reggae music  ......i met a guy called tony at
william parker school boot sale on sunday .....he said he had some and was going
to free cycle so please get in touch when you decide to clear out ...


thank you

manish





[Non-text portions of this message have been removed]', CAST(0x00009D1F00AD08E0 AS DateTime), CAST(0x00009D1F00F2D8DD AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (376, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40491?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40491?l=1', N'TAKEN: DVD player &amp; moses basket', N'TAKEN: d.v.d player and babys moses basket.
ï¿½sorry i only posted this now but didn''t see my inbox till today and had quite
a few messages so had to give both to first reply. sorry to anyone who wanted
the bits and missed out.




[Non-text portions of this message have been removed]', CAST(0x00009D1F00ED4E00 AS DateTime), CAST(0x00009D1F00F2D907 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (377, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40490?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40490?l=1', N'Offered TN38: Mouse set up', N'Cage, little house, food bowl, water bottle &amp; wheel, suitable for two mice or
Hamster that doesent care!!!

Collect only

Paula

[Non-text portions of this message have been removed]', CAST(0x00009D1F00E85C60 AS DateTime), CAST(0x00009D1F00F2D91F AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (378, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40494?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40494?l=1', N'WANTED: Glass demijohns', N'WANTED: glass demijohns
ï¿½
want to try my hand at a bit of homebrewing and wondered if anyone had any
demijohns the don''t want any more, thanks




[Non-text portions of this message have been removed]', CAST(0x00009D1F00EE20F0 AS DateTime), CAST(0x00009D1F00F3C472 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (379, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40493?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40493?l=1', N'WANTED: Vinyl records / Dance music', N'Any unwanted dance music records (or CD''s)(House/Techno/Drum n'' Bass/Hip Hop
etc) for a dj workshop. Can collect. Thanks in advance.', CAST(0x00009D1F00EEAD90 AS DateTime), CAST(0x00009D1F00F3C497 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (380, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40496?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40496?l=1', N'OFFERED: Computer Desk and Amchair', N'Hello all,

Two items:

1. Black computer desk, pull out keyboard area, two drawers. Re-freecycling from
another member.
Width: 120.5 cm ( approx 4 ft)
Depth: 60cm (approx 2 ft)
Height: 64cm (approx 2.5 ft)

Pretty solid, reasonable condition.
Pic is here:or here (if the direct link doesn''t make it through):
Photos-&gt;Album-&gt;AdamsPics


2. Old armchair, comfy but a bit tatty.
Also a bit heavy as the leg rest mechanism exists, but doesn''t work.

Can be seen in
Photos-&gt;Albums-&gt;Adams_Pics-&gt;Archchair

or here (maybe):To be collected either today (Tuesday 16th Feb)
or this weekend (Sat 20th or Sun 21st Feb)

Thanks,

Adam.', CAST(0x00009D1F00F3E580 AS DateTime), CAST(0x00009D1F00F6C777 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (381, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40495?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40495?l=1', N'OFFERED - Office stuff!', N'On offer, an assortment of office stationery and equipment etc, to be taken as
one lot.  Would be perfect for home office or student.

Includes, lever arch file, assorted folders, card dividers, clear filing
pockets,  notebooks, A4 filing trays, desktop printer stand with paper storage
drawer and various other bits and bobs.

Collection from St. Leonards near Tesco.

Sandra

[Non-text portions of this message have been removed]', CAST(0x00009D1F00F39F30 AS DateTime), CAST(0x00009D1F00F6C7A6 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (382, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40498?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40498?l=1', N'OFFERED: Panasonic quintrix TV,', N'32&quot; fully working with remote control.Silver. Please note this is one of the big
telly''s not a flat screen. Will need 2 to collect as on 2nd floor ASAP.', CAST(0x00009D1F00FE9BB0 AS DateTime), CAST(0x00009D1F01074298 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (383, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40497?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40497?l=1', N'on offer childs play kitchen and tv for spares or repair', N'on offer i have a childs play kitchen got it from a fellower recycler however my
son no longer plays with it, it has no accesories with it if any1s intrested plz
email me i work on a first come first serve basis would like it gone by weds
night

ALSO ON OFFER I HAVE;
JCV TV quiet bulky needs 2 people to collect if any1s interested
no longer works so as it  says its up for spares or repair if any bodys
intrested plz email me


would like both these items gone by weds night at the latest as no longer have
room for them thanks', CAST(0x00009D1F0104A690 AS DateTime), CAST(0x00009D1F010742B9 AS DateTime), 0, 0, 4, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (384, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40500?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40500?l=1', N'recieved with thanx', N'many thanks 4 the bench radio, ideal 4 night fishing,cheers :))) kev,,,', CAST(0x00009D1F00F7BDE0 AS DateTime), CAST(0x00009D1F0108A37B AS DateTime), 0, 0, 4, 0, 15, 1)
GO
print 'Processed 200 total records'
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (385, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40499?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40499?l=1', N'OFFERED TN38 Part 2!!!', N'1. Disney princess playmat - the one u can draw on with water pens - got no pen
2. Barbie pretend guitar, plastic thing with electronic noises
3. Clear plastic barbie rucksack - small
4. Tesco value crazy kite

I will keep digging!
Expect swift replies - im leaving the computer on!

Paula

[Non-text portions of this message have been removed]', CAST(0x00009D1F0102BA60 AS DateTime), CAST(0x00009D1F0108A38E AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (386, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40502?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40502?l=1', N'Wanted: Fire extinguisher &amp; Fire Blanket', N'Should anyone have a small fire extinguisher and/or fire blanket I would be most
grateful for them. J French

[Non-text portions of this message have been removed]', CAST(0x00009D1F00F61800 AS DateTime), CAST(0x00009D1F010A01B7 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (387, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40501?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40501?l=1', N'OFFERED: navy blue leather sofa', N'this is a heavy sofa due to the amount of wood on it
must go by wednesday.pick up from hawkhurst
cost two thousand when new
pictures available', CAST(0x00009D1F0104ECE0 AS DateTime), CAST(0x00009D1F010A01D8 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (388, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40503?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40503?l=1', N'Needed', N'My computer has developed a virus. So is there a kind person out there with a
old laptop they no longer use? It dosent have to be grand I just need to be able
to get online.. Thankyou', CAST(0x00009D1F011B2C30 AS DateTime), CAST(0x00009D1F01216E54 AS DateTime), 0, 0, 4, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (389, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40521?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40521?l=1', N'WANTED : Small filing cabinet', N'Now i''ve cleared out i need a small filing cabinet 2 drawer A4 or Foolscap - not
fussed on colour just as long as it opens &amp; shuts!

Will collect.
 
Many thanks

Paula


[Non-text portions of this message have been removed]', CAST(0x00009D1F010C1100 AS DateTime), CAST(0x00009D1F016E62D8 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (390, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40520?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40520?l=1', N'wanted', N'Hi All,

Just moved into new 1st time flat and desperately need the following,

bedroom furniture, electric cooker, washing machine, 3 piece sofa or suite.

I know its a big ask but just not in a position to buy them.

Thanks for just reading and hoping someone out there can help!!

Regards

Kayleigh.

Alternative e mail address (dads)[Non-text portions of this message have been removed]', CAST(0x00009D1F01316B80 AS DateTime), CAST(0x00009D1F016E6822 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (391, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40519?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40519?l=1', N'wanted/ram/hard drives', N'hello everyone im in the process of building computers for under privileged
children,i need some sd ram/ddr ram/and any hard drives would be ideal thanks
for reading ,lee

[Non-text portions of this message have been removed]







[Non-text portions of this message have been removed]', CAST(0x00009D1F0137BCB0 AS DateTime), CAST(0x00009D1F016E6872 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (392, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40518?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40518?l=1', N'received with many thanks', N'Thankyou very much to chris for the 20&quot; tv, you have made my daughter more than
happy and made my life so much easier.
Sarah', CAST(0x00009D1F013EE0D0 AS DateTime), CAST(0x00009D1F016E68A6 AS DateTime), 0, 0, 4, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (393, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40517?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40517?l=1', N'wanted..long shot ..but any vivarium equipment ,heat mat-hides etc please', N'Thanks for reading but does any one have an old vivarium and/or any bits of
equipment that go with one .


Any offers gratefully received
Thanks
Tracy', CAST(0x00009D1F0134FD90 AS DateTime), CAST(0x00009D1F016E68C2 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (394, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40516?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40516?l=1', N'offered white bt home hub and a 14&quot; working silver tv', N'Hi all, I have a white bt home hub this is perfect for anyone who is online
gaming via bt broadband and gets kicked offline.
The tv is in perfect working order but i donot have the remote so i couldn''t
tune it to my daughters freeview as needed the remote, it does work with a all
purpose remote from  poundland.', CAST(0x00009D1F013E9A80 AS DateTime), CAST(0x00009D1F016E68DE AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (395, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40515?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40515?l=1', N'Wanted a CD tower', N'Hi everyone

I am looking for a CD tower that can hold between 40 and 50 Cd''s either wooden
or metal.

thanks

Sheila', CAST(0x00009D1F011F0490 AS DateTime), CAST(0x00009D1F016E68FA AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (396, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40514?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40514?l=1', N'WANTED - OLD PC GAMES', N'Do you have any old and unwanted PC games (DOS or WIN95). If so, give me a buzz', CAST(0x00009D1F010E89D0 AS DateTime), CAST(0x00009D1F016E6916 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (397, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40513?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40513?l=1', N'Offered: Computer Desk', N'I have a computer desk which is quite modern looking with pine coloured desk top
along with a pull out drawer for the keyboard. To go asap please.

[Non-text portions of this message have been removed]', CAST(0x00009D1F0108C540 AS DateTime), CAST(0x00009D1F016E6937 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (398, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40512?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40512?l=1', N'OFFERED TN38: Various part 3', N'Hi...

1. kids colourful xylophone
2. pregnancy/ conception &amp; birth book
3. Yoga book

And were still going!

Paula

[Non-text portions of this message have been removed]', CAST(0x00009D1F0115F440 AS DateTime), CAST(0x00009D1F016E6958 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (399, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40511?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40511?l=1', N'Offered &amp; Taken: Blacklands, Hastings TN34 2ED Various', N'Hi All

The following have so far not found a new home, please come and take them before
they go to the charidee shop!
1 x Green gingham school dress Age 6 - 7
1 x Pastel yellow with spots fleecy dressing gown Age 7 - 8
1 x Blacklands Scout Jumper (with some badges still sewn on) 34&quot;
1 x Clean, but used green and blue Eeyore potty
Approx 10 toddler books - to go as one lot, please

All items of clothing are in good, used condition, but will need a wash as they
have been under the stairs which is a little damp.

The following have found good homes, so you need no longer worry about them!
1 x Gold 28 &quot; chest Brownie / Guide polo shirt
3 x Blacklands School Green Sweatshirt / Jumper 34&quot;
3 x Blacklands School Green Sweatshirt / Jumper 32&quot;
1 x White school polo shirt Age 7 -8
2 x White school polo shirt Age 9 - 10
3 x White school polo shirt Age 11 -12
1 x Black pleated elasticated school skirt Age 6 - 7
1 x Black pleated elasticated school skirt Age 7 -8
1 x Black pleated elasticated school skirt Age 8 - 9
1 x Black pleated elasticated school skirt Age 9 - 10
1 x Moto (Topshop, I think) denim ''fur'' lined waistcoat / gillet Adult size 12
Approx 10 toddler books inc 20 Traditional Bedtime Stories, Rupert - to go as
one lot, please

Look forward to hearing from you with a contact landline number, please.

Cheers for now
Cat 




[Non-text portions of this message have been removed]', CAST(0x00009D1F01090B90 AS DateTime), CAST(0x00009D1F016E6AB7 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (400, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40510?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40510?l=1', N'offered various bexhll', N'hi i have small plates large plates milk and cream jug beakers stripped curtains
ideal caravan or small window cups shower curtain rings etc if anyone would like
them need gone asap please and in 1 job lot thanks', CAST(0x00009D1F01300BF0 AS DateTime), CAST(0x00009D1F016E6AF4 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (401, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40509?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40509?l=1', N'TAKEN - VARIOUS, &amp; STILL AVAILABLE - CLIVE VALE', N'Hi All !!



Following have all been taken :



Cot

Single Divan

Baby girls Clothes and coat

Boys Clothes

&quot;Knowlege&quot; books





The girls clothes and bras - are taken, subject to collection.



I still have :



Brand new Hillcrest royal blue P.E. fleece - 140cm

Headugger part of Maxicosi first car seat

Baby Journal book





More to come - watch this space !!!!!!





Rose x

_________________________________________________________________
We want to hear all your funny, exciting and crazy Hotmail stories. Tell us now[Non-text portions of this message have been removed]', CAST(0x00009D1F013A7BD0 AS DateTime), CAST(0x00009D1F016E6B2D AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (402, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40508?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40508?l=1', N'recived with thanks bed', N'we have recived a fab bed for our son thanks again emma', CAST(0x00009D1F01250F70 AS DateTime), CAST(0x00009D1F016E6B52 AS DateTime), 0, 0, 4, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (403, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40507?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40507?l=1', N'TAKEN STC Mouse cage', N'Mouse cage gone STC
 
Paula Sanders

[Non-text portions of this message have been removed]', CAST(0x00009D1F0126FBA0 AS DateTime), CAST(0x00009D1F016E6B6E AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (404, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40506?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40506?l=1', N'TAKEN: Computer desk - Armchair still available', N'Hello again,

ITEM 1 HAS BEEN COLLECTED - thank you.
1. Black computer desk, pull out keyboard area, two drawers.2. Old armchair, comfy but a bit tatty.
Also a bit heavy as the leg rest mechanism exists, but doesn''t work.

Can be seen in
Photos-&gt;Albums-&gt;Adams_Pics-&gt;Archchair

or here (maybe):To be collected either today (Tuesday 16th Feb)
or this weekend (Sat 20th or Sun 21st Feb)
St.Helens area.

Thanks,

Adam.', CAST(0x00009D1F011494B0 AS DateTime), CAST(0x00009D1F016E6B86 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (405, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40505?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40505?l=1', N'TAKEN STC TN38', N'Sewing machine one way or another will go - thanks for the interest!
Curtains
Playmat
Material
Knitting needles

All gone STC if not collected will go to next on list!

Paula

[Non-text portions of this message have been removed]', CAST(0x00009D1F010AB170 AS DateTime), CAST(0x00009D1F016E6BC3 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (406, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40504?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40504?l=1', N'Taken-Blacklands-Boot sale items', N'Sorry to all missed out but these items have now been collected. Thank you to
Rosie for collection as agreed.
Olivia', CAST(0x00009D1F012EF2B0 AS DateTime), CAST(0x00009D1F016E6BE8 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (407, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40524?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40524?l=1', N'Offered - 2010 filofax diary', N'Offered - the section for filofax titled ''one month on two pages diary -
A5''. Don''t get too excited it''s not the cover just the diary insert.

Pick up nr. Hastings Station.


   _____

I am using the Free version of SPAMfighter &lt;&gt;
.
We are a community of 6 million users fighting spam.
SPAMfighter has removed 13982 of my spam emails to date.
The Professional version does not have this message.', CAST(0x00009D2000A74450 AS DateTime), CAST(0x00009D2000CF6893 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (408, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40523?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40523?l=1', N'Taken: Bathroom Cabinet', N'The pine cabinet is now gone STC. I''m hoping this is third time lucky.
Thanks to all who replied with promises to collect promptly... Sorry to
disappoint.

Emma.', CAST(0x00009D1F0160EF90 AS DateTime), CAST(0x00009D2000CF6912 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (409, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40522?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40522?l=1', N'Received with thanks material, curtains and knitting needles', N'Thank you so much Paula for the above I am so pleased with it and can put it all
to good use. Those knitting needles are fab thanks again.
Sharon', CAST(0x00009D1F014CE2C0 AS DateTime), CAST(0x00009D2000CF693C AS DateTime), 0, 0, 4, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (410, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40525?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40525?l=1', N'Offered - 2010 filofax diary', N'Forgot to mention - it''s a 2010 diary!



Offered - the section for filofax titled ''one month on two pages diary -
A5''. Don''t get too excited it''s not the cover just the diary insert.

Pick up nr. Hastings Station.


   _____

I am using the Free version of SPAMfighter &lt;&gt;
.
We are a community of 6 million users fighting spam.
SPAMfighter has removed 13982 of my spam emails to date.
The Professional version does not have this message.


   _____

I am using the Free version of SPAMfighter &lt;&gt;
.
We are a community of 6 million users fighting spam.
SPAMfighter has removed 13982 of my spam emails to date.
The Professional version does not have this message.



[Non-text portions of this message have been removed]', CAST(0x00009D2000D40940 AS DateTime), CAST(0x00009D2000DBBF7E AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (411, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40526?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40526?l=1', N'Offered : Carpet', N'Offered from St Leonards.
I have a carpet approx. 12ft x 12ft in pretty good physical condition, however
it is wine coloured and quite faded by sunlight at one end. If you are
interested  please let me know asap.

[Non-text portions of this message have been removed]', CAST(0x00009D1F015AE4B0 AS DateTime), CAST(0x00009D2000E97C70 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (412, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40527?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40527?l=1', N'OFFERED - Camera & Photo editing software - Guestling', N'I have CD user guide for Canon Digital Camera Solutions.  CD includes Canon
utilities,  ZoomBrowser, PhotoRecord, PhotoStitch, Remote Capture, File
Viewer utility, TWAIN driver and Apple Quicktime.

Also CD Camera Suite 1.2 including ArcSoft PhotoImpression &amp; ArcSoft
VideoImpression CD

They came bundled with a Canon camera I used to have but gave away some time
ago but only just found the software.

Collect from Guestling.

Connie', CAST(0x00009D2000CC1230 AS DateTime), CAST(0x00009D2000EADBA7 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (413, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40531?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40531?l=1', N'Offered: again CARDBOARD BOXES', N'due to non collection from 3 people!

thanks', CAST(0x00009D2000C3D4D0 AS DateTime), CAST(0x00009D2000EC3B1B AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (414, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40530?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40530?l=1', N'Wanted brownie uniform aged 8 yesrs and up!!', N'Hello there my daughter is on week 4 with the brownies now and loving it, so
before i spend a small fortune on her new uniform i was wondering if anyone has
any going spare? she is coming up for nine years old. thanks for reading', CAST(0x00009D1F0163AEB0 AS DateTime), CAST(0x00009D2000EC3B49 AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (415, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40529?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40529?l=1', N'wanted opening stairgate', N'Please has anyone got a stairgate that can be opened and closed, I have a dog
that keeps going upstairs and messing.

Thanks for reading
Zena




[Non-text portions of this message have been removed]', CAST(0x00009D1F015A9E60 AS DateTime), CAST(0x00009D2000EC3B5C AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (416, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40528?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40528?l=1', N'OFFERED - Jam jars with lids', N'Have about half a dozen, standard size with white lids.

Collection from Silverhill area.', CAST(0x00009D2000AE6870 AS DateTime), CAST(0x00009D2000EC3B6F AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (417, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40532?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40532?l=1', N'offered again due to non collection', N'2 bin bags of various linen including barbie duvet covers, bart simpson duvet
cover , a bhs silky bed throw , various other bits

collect from near hastings station

thank you lorraine', CAST(0x00009D20009450C0 AS DateTime), CAST(0x00009D2000ED9A6E AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (418, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40534?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40534?l=1', N'OFFERED &amp; TAKEN TN38', N'Ok, updated list

Still up for grabs:

Coving cement
Barbie Guitar
Xylophone
Yoga book
pregnancy book
10 Dinner plates
Cookery books
Darning yarn
Squeegee mop
plastic barbie rucksack
crazy kite

New to the list:
Vax carpet cleaner - needs new filters otherwise good
Thule roofrack for Volvo V40 (the one without roof rails)
Various kids books - no idea whats in there!!

Everything else has gone - Due to the amount of stuff &amp; requests i will only
reply if successful

Thanks for speedy replies &amp; collection. 

 Paula

[Non-text portions of this message have been removed]', CAST(0x00009D1F01445F10 AS DateTime), CAST(0x00009D2000F059FE AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (419, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40533?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40533?l=1', N'WANTED, Wardrobe for kids room', N'have recently moved and really need a wardrobe for my daughters room if anyone
has one please.
Needs to be able to be taken apart to get in car and round corner on stairs.
thank you', CAST(0x00009D2000789330 AS DateTime), CAST(0x00009D2000F05A49 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (420, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40535?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40535?l=1', N'taken,navy blue leather sofa', N'navy blue leather sofa taken,thanks for quick collection', CAST(0x00009D2000CDFE60 AS DateTime), CAST(0x00009D2000F5D80F AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (421, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40536?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40536?l=1', N'Wanted- fridge', N'Hi does any one have a fridge please. I dont drive so if you could deliver i can
pay for your petrol! Thank you in advance x

Sent from my Nokia phone', CAST(0x00009D2000F9F060 AS DateTime), CAST(0x00009D2000FEB3DC AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (422, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40537?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40537?l=1', N'wanted size 7 riding boots', N'Has anyone got any size 7 riding boots that they dont want anymore.I would be
very grateful as my daughters have just broken.thanks.', CAST(0x00009D2000F9F060 AS DateTime), CAST(0x00009D2001024556 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (423, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40539?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40539?l=1', N'WANTED PLS: baby monitor (hastings area)', N'hi fellow freecyclers! just wonder if anyone has a spare baby monitor they no
longer use. thanks for reading.', CAST(0x00009D2000F91D70 AS DateTime), CAST(0x00009D2001066337 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (424, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40538?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40538?l=1', N'OFFERED: feeding bottles (st leonards-on-sea area)', N'hello fellow freecyclers! i have here 4 feeing bottles up for grabs. thanks for
reading.', CAST(0x00009D2000F963C0 AS DateTime), CAST(0x00009D200106651F AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (425, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3534?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3534?l=1', N'WANTED fax machine LYDD', N'Hi, any working fax machine will do provided i can still get ink and paper, many
thanks Andy', CAST(0x00009D1E012C3390 AS DateTime), CAST(0x00009D20010723A4 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (426, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3533?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3533?l=1', N'** wanted: wood by woodturner', N'Hi New to this so please bare with me I am a Woodturner and Creative Furniture
Maker I am always on the look out for timber of any kind from logs to planks and
off cuts from joinery shops.

sorry not interested in old pallet wood

** subject line & text edited by mod to keep within freecycle
guidelines', CAST(0x00009D1E01266F00 AS DateTime), CAST(0x00009D20010723CE AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (427, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3532?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3532?l=1', N'Offered - mat - Lydd on Sea', N'Hi folks,

We''ve got a rug or mat we no longer need.

It''s light brown / beige / cream coloured.

Measures approx 71" ( 180 cm ) x 48" ( 120 cm) )

In good condition.


There is also a matching runner which measures approx 120" (305 cm ) x 26" ( 66
cm )

The runner came off worse in an argument with a glass of red wine!  and is
stained in places so would need a very good clean.

Thanks for reading.

Dawn', CAST(0x00009D1E01186D10 AS DateTime), CAST(0x00009D20010723E1 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (428, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3531?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3531?l=1', N'WANTED: VCR recorder with remote control', N'Hi, does anyone have a VCR recorder that still works, but is no longer used.
My grans has just packed up and she has loads of video tapes that she can now no
longer watch.
Hope someone can help as she is too old to understand the world of DVD''s!
Can collect anytime, from Stone or Peasmarsh area', CAST(0x00009D1E00FE0F10 AS DateTime), CAST(0x00009D2001072402 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (429, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3530?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3530?l=1', N'Offered - various - Lydd on Sea', N'Hi folks,

We''re having a clear out and have the following items no longer required:

• 25 Reader''s Digest magazines – from January 2008 to January 2010 inclusive.

• 13 VHS videos – various titles – includes – Billy Connolly,  Michael Flatley, 
Cats,  Burn the Floor,  Four Weddings and a Funeral - please email if you would
like the full list.

• Oink Piggy Bank – white with black and gold leopard print.  Unwanted Christmas
present.  Measures approx 10" x 8" so will hold a lot of pennies!

• Books – both paperbacks and hardbacks – various titles – includes Sidney
Sheldon,  Philip Jose Farmer - please email if you would like the full list.

• Cassette storage box.   6 drawers – each drawer holds 12 cassettes.  Black Ash
in colour.

• Wedding Dress – was worn just the once!  in 1986.   Dark cream colour. 
Picture available.

• Dumbbells.    One pair of dumbbells – 2.3kgs / 5lbs each.   One single
dumbbell with two x 2kg weights.

• Bag of knitting wool.  All double knitting.  Some complete 100g balls and some
left overs.

• Jigsaw puzzle felt mat.  Measures approx 33" (84cm) x 52" (132 cm)

• 16 Jigsaw puzzles.  Various sizes – from 550 piece up to 4000 piece.

• Love sheep?   Lots of sheep items.  Includes cuddly sheep,  sheep money box, 
sheep plant holder,  sheep photo frame,  slinky sheep,  Shaun-the-Sheep, sheep
fridge magnet,  sheep keyrings,  wall mounted sheep key hook.

• Bag of soft toys.  Some Ty.   All clean.


That''s all for the moment.

Thanks

Dawn', CAST(0x00009D1E00F7BDE0 AS DateTime), CAST(0x00009D200107241E AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (430, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3529?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3529?l=1', N'OFFERED computer desk LYDD', N'For prompt collection from Lydd (or i''m burning it) a computer desk, 1200mm
long, 600mm wide, 1200 high approx with sliding keyboard shelf. Item is in good
useable condition just too big for my office. Will need to be collected by
thursday at the latest. Thank you for taking the time to read this advert, Andy', CAST(0x00009D1E00F6A4A0 AS DateTime), CAST(0x00009D2001072452 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (431, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3528?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3528?l=1', N'Taken- Yamaha Organ - TN35 area', N'Many thanks to Gaynor for a pick-up at the alloted time, quite aÂ rare
experience for me at the moment ! Â 






[Non-text portions of this message have been removed]', CAST(0x00009D1D00DF05C0 AS DateTime), CAST(0x00009D2001072469 AS DateTime), 0, 0, 3, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (432, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3527?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3527?l=1', N'wanted varous', N'hi has any good any bunk beds going spair my two girls need some despratly
has  any one got a fish tank 4 ft dosent have to be water tight  little girls
clothes 12-24 months.thank you', CAST(0x00009D1D01567FB0 AS DateTime), CAST(0x00009D200107247C AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (433, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3526?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3526?l=1', N'Offered; various - Beckley', N'BUTLER SINK:Well used but not cracked or badly chipped. Complete with brackets
and plug.  Folding GUEST BED: with 4 inch deep sprung mattress -old and well
used but clean and an ideal spare bed. Beckley, near Rye', CAST(0x00009D1D00FB4FF0 AS DateTime), CAST(0x00009D200107248F AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (434, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3525?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3525?l=1', N'**offered: Reclining chair, Beckley', N'Reclining chair, push down on arms to raise leg rest.  Pale green upholstery. 
Still in pretty good condition.

** mode note: item offered added to subject line please remember to use correct
format in future posts , thanks', CAST(0x00009D1B0107AC00 AS DateTime), CAST(0x00009D20010724A6 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (435, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3524?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3524?l=1', N'Wanted please - Windows XP Pro instalation disc - Lydd', N'Hi all My computer messed up recently so I inserted my windows XP Pro disc to
run a restore, however I received an error message saying that there was a file
missing. Now I cant get anything, I am part way through an Open University
course and am now desperate, an computer repair shop in Cheriton said that if I
could find someone with an original disc I can use my licence number printed on
the back of my computer, I am only asking for the installation disc NOT the
licence, please if anyone can help.
Andrew.', CAST(0x00009D1B0152EDA0 AS DateTime), CAST(0x00009D20010724B9 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (436, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3523?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3523?l=1', N'OFFERED - carpets and underlay - Camber', N'Two pieces of plain cream/beige berber type carpet, both about 4m x 3m, some
underlay, reasonable condition, just taken up from a house we are refurbishing

John', CAST(0x00009D1B01841790 AS DateTime), CAST(0x00009D20010724C7 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (437, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3522?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3522?l=1', N'Offered-TN34-Double headboard', N'Offered, beige velour double headboard-vgc
Olivia', CAST(0x00009D1D00B28720 AS DateTime), CAST(0x00009D20010724D5 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (438, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3521?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3521?l=1', N'**offered 32 inch TV - location?', N'offered 32 inch TV, Panasonic, not LCD but good condition and with remote
control, grey
Hope will be useful to someone
Regards
Zena

**please remember to add your location in future posts, ta', CAST(0x00009D1A016D91F0 AS DateTime), CAST(0x00009D20010724E3 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (439, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3520?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3520?l=1', N'**wanted: boot for a peugeot 806 r reg', N'a boot for a peugeot 806 r reg

** item wanted added by mod to subject line
please remember to post correctly to avoid delays or rejected posts', CAST(0x00009D1A0160A940 AS DateTime), CAST(0x00009D20010724F6 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (440, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3519?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3519?l=1', N'**OFFERED: Three piece suite - location?', N'Green three piece suite offered. A little faded, but otherwise good condition.
Covers remove for washing. space needed for new suite.


** keyword ''offered'' added to subject line by mod
please remember to give your location in future posts and don''t give out your
phone number for saftey reasons! many thanks', CAST(0x00009D1A01502E80 AS DateTime), CAST(0x00009D200107250D AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (441, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3518?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3518?l=1', N'Wanted Yorkie', N'looking to replace our yorkie after he sadly passed away', CAST(0x00009D1A00DD5FE0 AS DateTime), CAST(0x00009D2001072529 AS DateTime), 0, 0, 2, 0, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (442, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3517?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3517?l=1', N'offered lexmark printer lydd', N'hi i have a lexmark printer , drivers ,power lead and with ink in printer , its
one of the x1100 multi printers/fax an oldy but was working up till a few weeks
ago when i upgraded to windows 7 and the computer said NO ,worked well on
xp.collection asap would be nice as sitting under the table in the way thanks
for looking spence', CAST(0x00009D1901140810 AS DateTime), CAST(0x00009D2001072537 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (443, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3516?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3516?l=1', N'wanted kitchen unites', N'hi all a long shot i know is anyone doing there kitchen im in desprate need of
wall unites and base unites practally everything!but what evers going is very
much appresiated,thanks to you all', CAST(0x00009D1800D5F570 AS DateTime), CAST(0x00009D2001072545 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (444, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3515?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3515?l=1', N'Offered-Cooker Hood Extrator-TN35', N'Still on offer as the timewaster failed to collect:-

Kitchen Cooker Hood Extractor fan unit, the type that is designed to fit between
a row of wall cabinets when fiited with a decor panel to match.

Recently removed during kitchen refurbishment.

Begards

Bob


[Non-text portions of this message have been removed]', CAST(0x00009D1900B54640 AS DateTime), CAST(0x00009D2001072553 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (445, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3514?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3514?l=1', N'Wanted Please-TN34-Base kitchen unit & B-Bar', N'I wondered if anyone was upgrading their kitchen and has a breakfast bar and a
base unit either 800 or 1000 that you would like to rehome. It would be much
appreciated.
Thank you for reading.
Livvie', CAST(0x00009D1700A6FE00 AS DateTime), CAST(0x00009D2001072566 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (446, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3513?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3513?l=1', N'Offered- Yamaha Organ - TN35 area', N'Yamaha Electone FC10F Electronic Organ on offer. 
 
Piece of furniture rather than just a keyboard, more details or pictures
available upon request or feel free to view.

Regards

Bob

[Non-text portions of this message have been removed]', CAST(0x00009D1800CB3F40 AS DateTime), CAST(0x00009D2001072574 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (447, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3512?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3512?l=1', N'Offered Various Camber', N'Hi all
I have a flymo mower slightly broken but still cuts the grass.
A new wind break and a deck chair.  If these asre any use to anyone please let
me know.

Thanks for looking
Tina', CAST(0x00009D1800B84BB0 AS DateTime), CAST(0x00009D2001072587 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (448, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3511?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3511?l=1', N'WANTED - A Car Battery CHARGER Please - Lydd TN29', N'I would be very grateful if anyone has a Car Battery Charger going spare, I have
a few batteries in my Garage and I do not know if they are any good and the
battery on my wife''s car has started to loose its charge, so am hoping to
replace it with one I have in the garage, thanks for reading.
Kind Regards.
Andrew.', CAST(0x00009D1401232340 AS DateTime), CAST(0x00009D2001072595 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (449, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3510?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3510?l=1', N'WANTED. Boating items.', N'Hi all. I am doing up a narrowboat and need related items. Lister engine/gearbox
items. Brassware, fenders. But any items welcome. Many thanks for looking.
Regards Sarah.', CAST(0x00009D14014DFC00 AS DateTime), CAST(0x00009D20010725A3 AS DateTime), 0, 0, 2, 0, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (450, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3509?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3509?l=1', N'Wanted; mens racer bike', N'Hi,
does anyone have a mens racer bike they no longer need/want.
Condition not really important as long as it works or just needs small repair.
many thanks

Pete', CAST(0x00009D15017A7AA0 AS DateTime), CAST(0x00009D20010725B1 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (451, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3508?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3508?l=1', N'Offer - JVC Music Centre - Tenterden', N'Hi
I''ve got a JVC Music Centre with twin cassette deck, triple CD autochanger and
radio.  Knob is missing off tuner but works OK. Also twin speakers.
Regards
Deb', CAST(0x00009D1600EA8EE0 AS DateTime), CAST(0x00009D20010725BB AS DateTime), 0, 0, 4, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (452, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3507?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3507?l=1', N'WANTED- Circular saw', N'Hiya freecyclers,
Does anyone have a circular saw they no longer use?
Thankyou in advance

Viki', CAST(0x00009D160101A120 AS DateTime), CAST(0x00009D20010725CD AS DateTime), 0, 0, 2, 0, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (453, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3506?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3506?l=1', N'offered basin and taps Sandhurst', N'Basin and taps - sandhurst', CAST(0x00009D14015406E0 AS DateTime), CAST(0x00009D20010725D7 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (454, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3505?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3505?l=1', N'Wanted Shelving location unknown', N'shelving or racking wanted to fit out a 16 x 9ft shed', CAST(0x00009D17009523B0 AS DateTime), CAST(0x00009D20010725E5 AS DateTime), 0, 0, 2, 0, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (455, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40540?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40540?l=1', N'Recieved- phone', N'Thank you leila for the phone and dropping it off to me x

Sent from my Nokia phone', CAST(0x00009D2000FCF5D0 AS DateTime), CAST(0x00009D200109D9B4 AS DateTime), 0, 0, 4, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (456, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40542?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40542?l=1', N'WANTED PLS: electric breast pump (hastings area)', N'hi fellow freecyclers! just wondered if anyone has an electric breast pump they
no longer use. thanks for reading.', CAST(0x00009D2000F8D720 AS DateTime), CAST(0x00009D20010B38EB AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (457, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40541?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40541?l=1', N'OFFERED: 4 x pairs black 40-denier tights', N'New and unworn from Tesco size large up to height 5''5". West Hill Hastings.', CAST(0x00009D200100CE30 AS DateTime), CAST(0x00009D20010B38FE AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (458, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40543?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40543?l=1', N'OFFERED: re-usable nappies (st leonards-on-sea)', N'hi fellow freecyclers! i have here a small box of re-usable nappies in different
sizes. thanks for reading.', CAST(0x00009D2000F9AA10 AS DateTime), CAST(0x00009D20010E6942 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (459, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2312?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2312?l=1', N'OFFERED: Land Rover wheels with tyres', N'Five Land Rover wheels with tyres from a 110 (Defender). All have surface rust
but are perfectly serviceable. Tyres all have tread left but the rubber is
showing its age. They made it through an MOT just prior to my Land Rover dying a
couple of years ago and have been languishing in the garage ever since. Any
takers?', CAST(0x00009D1701765BF0 AS DateTime), CAST(0x00009D20011130FD AS DateTime), 0, 0, 1, 0, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (460, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2311?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2311?l=1', N'OFFERED: WARDROBES', N'Ikea wardrobes: one double with drawers below and one single full height. They
are 2.4m high and approx 1.4m wide when together. The doors are frosted glass,
the drawers are navy blue and the wood surround is cherry veneer.

The full height wardrobe contains a hanging rail with shelf above. The double
wardrobe also contains a hanging rail with a shelf above and has four drawers
below.

They are in good condition.', CAST(0x00009D1701791B10 AS DateTime), CAST(0x00009D2001113110 AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (461, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2310?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2310?l=1', N'THANK YOU ALL FOR THE LAPTOPS! :)', N'Moderators, please allow this message as it''s important to us, thank you.

A MASSIVE thank you to all of those that have donated old and unused laptops and
laptop parts for the charity that myself and my daughter are involved in.

So far with your help we have managed to build and donate 9 working laptops to a
charity that distributes them to the less fortunate around Kent, London and the
UK.

Although this is an on-going project, what you have donated so far has been a
great help, thank you all VERY MUCH.

Kindest regards

Matt', CAST(0x00009D19018A68C0 AS DateTime), CAST(0x00009D2001113127 AS DateTime), 0, 0, 4, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (462, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2309?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2309?l=1', N'TAKEN (Tenterden): Set of Weights', N'Now gone. Thanks for the interest.

--- On Tue, 19/1/10, Louise Hutt <> wrote:


From: Louise Hutt <>
Subject: OFFERED (Tenterden): Set of Weights
To:Date: Tuesday, 19 January, 2010, 14:24







Hello
 
We have a set of weights including bar for weightlifting. Anyone interested, let
me know. Need to go by end January. 
 
Thanks
 
Louise
 
 
 

[Non-text portions of this message have been removed]', CAST(0x00009D1701662780 AS DateTime), CAST(0x00009D200111313A AS DateTime), 0, 0, 3, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (463, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2308?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2308?l=1', N'Wanted Please - Marden: Franking Machine', N'Hi,

I''m on the lookout for a franking machine if anyone has one they no longer use
please?

Maybe you have an old one from an old business?

Thank you in advance.

Matt', CAST(0x00009D1B0120F0C0 AS DateTime), CAST(0x00009D2001113148 AS DateTime), 0, 0, 2, 0, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (464, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2307?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2307?l=1', N'Taken: Voyager videos, staplehurst', N'thanks for all the enquiries from trekkers out there, the videos have now found
a new home.', CAST(0x00009D1A012C3390 AS DateTime), CAST(0x00009D2001113151 AS DateTime), 0, 0, 3, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (465, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2306?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2306?l=1', N'wanted baby clothes for a girl', N'please can any one help? i would like baby clothes for a girl up to 12 months,
thank you for reading', CAST(0x00009D180160A940 AS DateTime), CAST(0x00009D200111315F AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (466, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2305?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2305?l=1', N'Offered Hanging baby bouncer Cranbrook', N'A baby bouncer that grips above a door frame so that you can put your baby in it
to bounce!

Daniela', CAST(0x00009D1600DAA0C0 AS DateTime), CAST(0x00009D200111316D AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (467, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2304?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2304?l=1', N'Offered: Star Trek Voyager videos, Staplehurst', N'Hi All

I have about half a dustbin liner of assorted Star Trek Voyager videos, some are
special editions.

No longer have a video player so they have been languishing in storage

Any trekkers out there who can make use of them? let me know or its off to the
tip with them sadly :-(

Tracey', CAST(0x00009D1700B0E140 AS DateTime), CAST(0x00009D200111317B AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (468, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2303?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2303?l=1', N'Taken:Offered Various, Iden Green', N'Taken desk and chair, very promptly.

Thank you

Jenny





[Non-text portions of this message have been removed]', CAST(0x00009D1700EA8EE0 AS DateTime), CAST(0x00009D2001113189 AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (469, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2302?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2302?l=1', N'WANTED: Any basin / toilet / showertray (Sandhurst)', N'We are on the hunt for a replacement basin toilet and/or shower tray. Sometimes
they are included in suites but are unwanted - we would love them!

Thanks in advance,

Stephen & Gemma', CAST(0x00009D1601266F00 AS DateTime), CAST(0x00009D2001113197 AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (470, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2301?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2301?l=1', N'Offered- Electric Organ- Staplehurst', N'Companion Major Electric Organ - comes in case with 3 detachable legs.size-26" x
11 1/2". 30" high inc. legs.music book included.Not a key board.', CAST(0x00009D1600AB1CB0 AS DateTime), CAST(0x00009D20011131AA AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (471, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2300?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2300?l=1', N'Wanted-Hawkhurst-Grill pan', N'Does anyone have a grill pan they no longer need may be from a non working
cooker?. My daughter has just tried to make toast and the grill pan did not
survive the expericnce!!Thanks for looking Grecia', CAST(0x00009D1600AA49C0 AS DateTime), CAST(0x00009D20011131B8 AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (472, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2299?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2299?l=1', N'Offered-Air purifier-Marden', N'Small portable unit BIONAIRE BAP242 also a larger but still portable on wheels
Air Cooler unit HOMEBASE. Can be collected from Marden.', CAST(0x00009D1401225050 AS DateTime), CAST(0x00009D20011131CB AS DateTime), 0, 0, 1, 0, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (473, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2298?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2298?l=1', N'Offered: Various, Iden Green', N'Hi

I have a beech desk, measuring 123(L) and 59 (D). Also one black and red office
style chair.
As well as a collection of basic cutlery, 24 forks, 13 knifes and 4 spoons. They
are not a set, just all stainless steel.

Please e-mail me if you are interested in any of the above items.

Jenny





[Non-text portions of this message have been removed]', CAST(0x00009D1501556670 AS DateTime), CAST(0x00009D20011131D9 AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (474, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2297?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2297?l=1', N'Taken: Far infrared detox sauna- Hawkhurst', N'Hope it helps!', CAST(0x00009D14010BCAB0 AS DateTime), CAST(0x00009D20011131EC AS DateTime), 0, 0, 3, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (475, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2296?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2296?l=1', N'WANTED: Hi-fi amplifier (Ticehurst)', N'If anyone has an unwanted (but working) old hi-fi amplifier gathering dust then
I''d be interested in hearing from you.

I''ve just found a pair of speakers and a tape recorder in the loft and need an
amp to connect them up to.

Many thanks

Richard', CAST(0x00009D1301259C10 AS DateTime), CAST(0x00009D20011131FA AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (476, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2295?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2295?l=1', N'WANTED: Cold water steriliser (Goudhurst)', N'Dear Freecyclers,

I was hoping someone might have a cold water steriliser they no longer need.  I
would like one to sterilise my little boy''s cups (not bottles) so it doesn''t
need to be a particular size or anything.  I only need it for a short while, so
would like to avoid having to buy one if possible.

I can pick up.

Thank you,

Tamsin', CAST(0x00009D1301746FC0 AS DateTime), CAST(0x00009D2001113216 AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (477, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2294?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2294?l=1', N'OFFERED Shelving Robertsbridge', N'Hi all friends,

I have here something slightly unusual, but would just love to give them a good
home. I have 7 IKEA shelves for a system called IVAR. Their dimensions are, 50cm
deep and 42 wide, just check on their website as you will require supports to
complete the shelving. >>>Copy and paste this into your browser for some extra info. Somebody pretty
handy, could  probably rework them for something else.

I just hope these will be useful, and not just as firewood.

Hoping to hear from someone.

Major', CAST(0x00009D13015F9000 AS DateTime), CAST(0x00009D2001113224 AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (478, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2293?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2293?l=1', N'Offered - 2 VHS recorders - Sissinghurst', N'Panasonic HiFi Nicam NV-HD620B w remote and manual.  Working order when last
used.
Goodmans NV9000 Nicam.  Not sure it works.  Been in garage for some time.', CAST(0x00009D13012555C0 AS DateTime), CAST(0x00009D2001113232 AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (479, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2292?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2292?l=1', N'Offered: Letter Box (Marden)', N'Brand new, 10 inch letterbox for UPVC door.  Black surround with white flaps.

Collect from Marden area.', CAST(0x00009D13011753D0 AS DateTime), CAST(0x00009D2001113240 AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (480, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2291?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2291?l=1', N'COLLECTED - MAIDSTONE (barming) sideborad, tv unit, hifi unit and coffee table', N'these have all gone now, thanks for all your inteset', CAST(0x00009D1300B6A5D0 AS DateTime), CAST(0x00009D200111324E AS DateTime), 0, 0, 4, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (481, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2290?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2290?l=1', N'Offered- Bush TV', N'Old stle TV in good working order.', CAST(0x00009D1300C4EE10 AS DateTime), CAST(0x00009D200111326A AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (482, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2289?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2289?l=1', N'TAKEN - Avent Newborn Starter Set - Nr Marden', N'Gone, in record time!  Thanks for all the interest.', CAST(0x00009D1201285B30 AS DateTime), CAST(0x00009D20011D5AA9 AS DateTime), 0, 0, 3, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (483, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2288?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2288?l=1', N'OFFERED - Avent Newborn Starter Set - Nr Marden', N'I''ve got an Avent Newborn Starter Set, never been used.  It contains 2 x 125ml
bottles, 2 x 260ml feeding bottles, newborn teats, latex newborn soother and
bottle brush.  All as new.  Any takers?', CAST(0x00009D12011148F0 AS DateTime), CAST(0x00009D2001113282 AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (484, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2287?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2287?l=1', N'Wanted Please - Marden: Old Laptops and Laptop Parts for Charity', N'Hi fellow Freecyclers,

As some of you may know, I have been involved in a charity with my daughter who
distribute used laptops to the less fortunate (schools and clubs etc...) around
Kent and the UK.

So if any of you have any old laptops or laptop parts (hard drives etc...)
laying around that you no longer require, we would be very grateful.

I use the parts to refurbish any laptops before we donate them.

And that you so much to those of you that have already helped.

Regards

Matt', CAST(0x00009D1200F39F30 AS DateTime), CAST(0x00009D2001113290 AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (485, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2286?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2286?l=1', N'TAKEN Baby carrier back pack thing to put a baby in - Cranbrook STC', N'Thank-you for the interest.', CAST(0x00009D1200D2F000 AS DateTime), CAST(0x00009D200111329E AS DateTime), 0, 0, 3, 1, 15, 3)
GO
print 'Processed 300 total records'
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (486, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2285?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2285?l=1', N'Offered Baby carrier back pack thing to put a baby in - Cranbrook', N'Sounds cruel, I know but I couldn''t think of a better way to describe it.  It a
metal-framed back thing that you put a baby in when you go for long walks.  Just
found it in the loft, can''t ever remember using it so no help there.  Anyhow, if
you would like the opportunity to put your baby in a back pack you can collect
it from Cranbrook!

Daniela', CAST(0x00009D110145BEA0 AS DateTime), CAST(0x00009D20011132AC AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (487, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2284?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2284?l=1', N'OFFERED-21" TV-TICEHURST', N'GOOD WORKING ORDER WITH REMOTE ..SILVER ..SLIGHT CRACK ON TOP BUT NOT REALLY
NOTICEABLE ... COLLECT EVENINGS FROM TICEHURST ...E-MAIL ME ..THANX', CAST(0x00009D1101391C40 AS DateTime), CAST(0x00009D20011132BA AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (488, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2283?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2283?l=1', N'OFFERES - MAIDSTONE (barming) sideborad, tv unit, hifi unit and coffee table', N'OFFERES - MAIDSTONE (barming) sideborad, tv unit, hifi unit and coffee table

all these are mahogany effect, they will need some TLC but are still in good
condition. ideal for anyone moving into their 1st home!!!

Sideboard - W 4ft 6inches, D 1ft 6inches, H 2ft 11 inches -4 drawers 2
cupboards.

TV unit - W 3ft, D 1ft 8 inches, H 2ft

Hi-fi unit- W 1ft 6inches, D 1ft 8 inches, H 2ft

Coffee table with 4 little tables underneath - D 2ft, H 1ft 9.5 inches

the sideboard, TVA unit and hi fi unit all have (has a cast iron patterned
front)

these will need to be gone by Wednesday eve, latest Thursday morning due to
delivery of new furniture and no room for the old furniture to be stored!', CAST(0x00009D1101090B90 AS DateTime), CAST(0x00009D20011132C8 AS DateTime), 0, 0, 4, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (489, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40544?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40544?l=1', N'TAKEN: panasonice quintrix tv', N'Thank you for your replys, clicked on the first one and hopefully will collect
tommorrow. If not will re post. Sophie', CAST(0x00009D1F01617C30 AS DateTime), CAST(0x00009D200123026B AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (490, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40545?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40545?l=1', N'wanted old cat baskets please', N'if anyone has any old cat baskets can I have them please? They don''t need to be
used for transport as they will be for my chickens to sleep inso any condition.
many thanks Jeanette', CAST(0x00009D200103D3A0 AS DateTime), CAST(0x00009D20012F8FD9 AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (491, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40561?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40561?l=1', N'Thank you', N'Thanks to Paula for the mouse cage - it was lovely.......Jayne




[Non-text portions of this message have been removed]', CAST(0x00009D2000FAC350 AS DateTime), CAST(0x00009D2100A0B753 AS DateTime), 0, 0, 4, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (492, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40560?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40560?l=1', N'OFFERED: 14inch TV and VCR & Tommee tippee breast pump and bottles', N'14 inch portable TV without remote and VCR video recorder without remote.
Tommee Tippee closer to nature manual breast pump and x 4 150ml bottles with
size 1 teats, plus 4 small pots that sit inside bottle to collect the milk and
then store in fridge.
Only been used for a while.
Collection from Clive Vale area.', CAST(0x00009D200105BFD0 AS DateTime), CAST(0x00009D2100A0B9B5 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (493, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40559?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40559?l=1', N'OFFERED: BAG OF STUFF FOR YOUNG GIRL - CLIVE VALE', N'Hello



More of the girls'' bedroom clearout :



A carrier bag of "stuff" - including :



                                  High School Musical Locker - u can put things
in it - jewellery/

                                  black n white cheerleader pompoms

                                  Badge-it machine - needs refills to make badges

                                  A beach game thingy

                                  Bingo game



all to go as one please !!!!

Any takers?





Rose

Clive Vale

_________________________________________________________________
Do you have a story that started on Hotmail? Tell us now[Non-text portions of this message have been removed]', CAST(0x00009D2001570C50 AS DateTime), CAST(0x00009D2100A0B9F2 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (494, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40558?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40558?l=1', N'WANTED: any sony ericcson phone on 3 network', N'unlocked or on 3.  I have one that keeps turning off by itself so if anyone has
a spare they dont want please let me know.  dont even need the charger just the
phone.

thanks

Preston





[Non-text portions of this message have been removed]', CAST(0x00009D20011DA500 AS DateTime), CAST(0x00009D2100A0BA20 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (495, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40557?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40557?l=1', N'WANTED: TABLE, TN37', N'Subject: [hastings-freecycle] Does anyone have a table that could be donated for
students art exam?

Â 
Hi fellow freecycler''s. I wondered if anyoneÂ is able to help?

I need to find a small round table for a student''s art exam. She would like one
to decorate with mosaic tiles. Does anyone have an old wooden table OR a round
metal garden tableÂ Â that we could decorate / create a wooden table top for?Â 

If you happen to have anything that you think we may be able to adapt for
theÂ challengeÂ  then I would be really grateful.

In hope of finding something,
Alison

[Non-text portions of this message have been removed]







[Non-text portions of this message have been removed]', CAST(0x00009D200163F500 AS DateTime), CAST(0x00009D2100A0BA46 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (496, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40556?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40556?l=1', N'wanted. Technika portable DVD player power cable. TN402', N'Hi guys, my kids have been given a portable DVD player but we can''t use it as we
have no charger for it.
If you have a old player that broke but still have the power cable could we
please be considered for it?
The model number is PDVD2005.
Many thanks for reading
:-)', CAST(0x00009D20013D8140 AS DateTime), CAST(0x00009D2100A0BA88 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (497, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40555?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40555?l=1', N'offered: dyson west hill area', N'I have an oldish but working dyson cylinder vacuum  to go to a deserving new
home. Model dc 08 animal. Not as good suction as a new model but not bad.', CAST(0x00009D20015A5810 AS DateTime), CAST(0x00009D2100A0BAB2 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (498, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40554?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40554?l=1', N'WANTED: Manaquin and floorboards', N'Hello there freecyclers, I dont suppose anyone has an old manaquin laying or
standing around that they want to rehome?  Hoping to open a new Charity shop in
the next few months and dont have anything to use for display.

ALSO

I am looking for a couple of spare floorboards, if anyone has any, long or short
pieces I would be very grateful, its for patching up broken floor boards at
home.

THANK you!
Mollx

[Non-text portions of this message have been removed]', CAST(0x00009D2001038D50 AS DateTime), CAST(0x00009D2100A0BACE AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (499, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40553?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40553?l=1', N're : offered again due to none collection', N'I forgot to mention on earlier post I would like the 2 binbags of linen etc to
go as one lot , I have had a few people asking for different things out of them
but the bags are tied up ready to go I don''t really want to be going into them
again to find them

sorry if I sound fussy but as I am having a big clearout due to moving in august
I want things to go ASAP


thank you lorraine', CAST(0x00009D2001099830 AS DateTime), CAST(0x00009D2100A0BB0F AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (500, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40552?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40552?l=1', N'taken various bexhill', N'sorry all items have now gone', CAST(0x00009D20014604F0 AS DateTime), CAST(0x00009D2100A0BB30 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (501, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40551?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40551?l=1', N'WANTED: boys clothes', N'im looking for boys clothes for my sister children
they are aged 12 and 13 , and shoe size 5 ,i know she would be very greatful as
they find it very difficult to make ends meet and as the boys are growning so
fast she cant keep up.
I can collect if possiable
thanks every one
ty', CAST(0x00009D200143D270 AS DateTime), CAST(0x00009D2100A0BB4C AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (502, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40550?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40550?l=1', N'offered childs play kitchen', N'hi all, i recieved 2 messages from people who were intrested in the toy kitchen
who ever gets back 2 me first i will be more than happy to see it go i would
like it gone before this coming sat many thanks
also i dont have any pictures of it', CAST(0x00009D200128A180 AS DateTime), CAST(0x00009D2100A0BB6D AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (503, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40549?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40549?l=1', N'wanted original xbox controll pad', N'Hi all,
does anyone have the very 1st xbox controll pad lying around- not the 360 one. I
would be most grateful as my daughter has lost hers and cannot play her games.
many thanks
sarah', CAST(0x00009D20011A12F0 AS DateTime), CAST(0x00009D2100A0BB8E AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (504, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40548?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40548?l=1', N'wanted table top dishwasher tn34', N'hi all takin a long shot but does anyone have a table top dishwasher working
that they no longer need,i after one for a elderly relative who cannot no longer
bend or stand too long anymore
can collect anytime to suit you
thank you in advance
anne', CAST(0x00009D20013470F0 AS DateTime), CAST(0x00009D2100A0BBAF AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (505, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40547?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40547?l=1', N'Offered : 32" TV Slight fault : Ore', N'Hi,

We have a Sanyo old type 32" widescreen TV with remote (it''s an all for one but
works fine), but it does have a fault which somebody may be able to fix.

The fault is that you have to turn it on about 6-7 times before it stays on,
once it''s on, it''s fine tho', CAST(0x00009D2001102FB0 AS DateTime), CAST(0x00009D2100A0BBDE AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (506, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40546?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40546?l=1', N'offered duvet', N'Hello Freecyclers.

I know there are many pet owners out there, how sometimes ask
for these

So I am offering a large duvet, would be ideal for pets

bedding, need it to be gone by Friday.

Debbie.', CAST(0x00009D20014272E0 AS DateTime), CAST(0x00009D2100A0BC0D AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (507, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3504?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3504?l=1', N'wanted 20+old house bricks lydd', N'hi has anyone got 20+ old type bricks that i can have , i can pick up whenever
suits thanks spence', CAST(0x00009D15010AF7C0 AS DateTime), CAST(0x00009D2100CE548B AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (508, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40562?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40562?l=1', N'offered. Child''s ride on toy TN38 area', N'I have on offer a Baby/Toddler ride on toy.
My Granddaughter is too big for it now and it still has plenty of use left in
it.
Please only ask for this if you intend to collect.

Thanks for looking', CAST(0x00009D2100F42BD0 AS DateTime), CAST(0x00009D21010BAC37 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (509, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3535?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3535?l=1', N'WANTED CAST IRON DRAIN COVER', N'[:)] Hi there all, we just broke a cast iron drain cover, does anyone
have one? A bit unusual, but you never know! We are in the Beckley area,
but happy to travel if you have one. Cheers!



[Non-text portions of this message have been removed]', CAST(0x00009D20017801D0 AS DateTime), CAST(0x00009D21010BB547 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (510, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2313?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2313?l=1', N'Offered: Cutlery and Food Processor, Iden Green', N'Basic cutlery: 24 forks, 13 knifes and 4 spoons. They are not a set,
just all stainless steel.
Plus a Kenwood food processor and blender, it''s old but i''m told it works well.

Plus e-mail me if your interested.

Jenny







[Non-text portions of this message have been removed]', CAST(0x00009D2101099830 AS DateTime), CAST(0x00009D21010D3712 AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (511, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3536?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3536?l=1', N'Offered: Epson colour printer (faulty) - Rye', N'My Epson D88 Plus printer has been playing up recently, so I had to replace it,
as I need a printer for my work. There seems to be a problem with the ink
getting through. Somebody who is good with computers, etc. might be able to get
it working, rather than send it to landfill. Comes with several spare inkjet
cartridges.

e-mail your phone no. please.', CAST(0x00009D2100F7BDE0 AS DateTime), CAST(0x00009D21012A9070 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (512, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40569?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40569?l=1', N'Offered: Boys shoes and slippers for age 7 ish, Board Game, TN38', N'Hi freecyclers,

I have the following bits of footwear for a boy, probably aged between about 7
and 10ish:-

  a pair of  blue slippers size 12 with aliens and rockets on them,
pair of Walkright brown leather velcro fastening ankle boots size 2
pair of football boots ''My First Boot'', velcro fastening, size 3 but they always
seem to come up very small in my experience
pair of white trainers with velcro fastening and  little bit of navy/red trim,
size 13

These shoes can go together or separately - I''d just like them to be of use to
someone as they aren''t very worn at all

A game called Agri Hazard
This is a bit like a monopoly type of game but its based on farming, and I
certainly thought it was more interesting. Before you get too excited its a game
that is only half constructed - I was very taken by it a good few years ago and
I started to build a version of it but although the board is done, the cards are
currently blank with the instructions that should be on them just all written
down in a pad. So its a production project before you can actually play the
game.I can''t bear to just throw it away so I thought I''d see if anyone fancied
having a go at finishing it off.

Julia in Springfield Road', CAST(0x00009D210001A5E0 AS DateTime), CAST(0x00009D210139A362 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (513, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40568?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40568?l=1', N'TAKEN & AVAILABLE TN38', N'Thanks to all for speedy replies & collection, last few bits going tonight.

I still have however:
Yoga book
2 x Cookery books
Vileda mop
Barbie gutar & rucksack (due to non collection)
Crazy kite
4 kids books (for age 8/9 upward)

Let me know ASAP if u want any of this, as saturday it will find a charity shop
home!!

Thanks again
Paula', CAST(0x00009D2100E3B110 AS DateTime), CAST(0x00009D210139A3C9 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (514, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40567?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40567?l=1', N'taken: dyson west hill', N'Dyson gone I''m afraid. Sorry to disappoint.', CAST(0x00009D21012296A0 AS DateTime), CAST(0x00009D210139A42B AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (515, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40566?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40566?l=1', N'Taken: Wine rack, frames and tiles. Other trhings still avaiable', N'The wine rack, picture frames and tiles are now taken.

Still available:
Bags for a Kärcher 2001 cylindrical vacuum cleaner.
Several spools of thin yellow nylon cord.




[Non-text portions of this message have been removed]', CAST(0x00009D2100D79B50 AS DateTime), CAST(0x00009D210139A45A AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (516, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40565?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40565?l=1', N'taken tn38', N'All gone now - thanks Ian & Corinne!

Paula

[Non-text portions of this message have been removed]', CAST(0x00009D210136E9C0 AS DateTime), CAST(0x00009D210139A4A0 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (517, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40564?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40564?l=1', N'OFFERED: Old computer and CD player, Hollington', N'Hi Everybody,



I''m having a bit of a clear out and have a couple of things to give
away.



Firstly an old Compaq Deskpro C400, Celeron 400 in a slimline desktop
case.  There''s no hard disk (IDE) but it has memory, floppy drive and CD
drive.  Quite old now and I haven''t tested it recently but should work
ok and would make a nice little Linux firewall box or similar.



Secondly an old Philips CD732 CD player separate.  Needs a good clean
but was working last time I used it.  I haven''t tested it but it should
be ok.



Collection from Hollington.



Thanks,



Mark.



[Non-text portions of this message have been removed]', CAST(0x00009D21012482D0 AS DateTime), CAST(0x00009D210139A4C1 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (518, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40563?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40563?l=1', N'Take 32" TV Slight fault : Ore', N'Thaks for everyone who answered, but the TV is gone', CAST(0x00009D2101278840 AS DateTime), CAST(0x00009D210139A625 AS DateTime), 0, 0, 4, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (519, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40574?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40574?l=1', N'wanted please - rotovator', N'Hi

I am still on the lookout  for a rotavator for my husband who would dearly love
one to use on his veggie patch,  any condition will do as he can fix most
things.  Can anyone make the old gardeners day please?

Thanks

Jan




[Non-text portions of this message have been removed]', CAST(0x00009D2101064C70 AS DateTime), CAST(0x00009D21013B0677 AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (520, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40573?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40573?l=1', N'Offered: Books on walking, Recorders and books, Elvis tapes,TN38', N'Hi Freecyclers,

1. Books on walking:-
      Walkers Britain, OS pocket guide to 240 rambles
      Lets walk there, Southern England
     The New Forest, official guide with maps and walks
     50 Pub walks in Britain
      Dorset Coast Path
     South Devon Coast Path
     Pembrokeshire Coast National Park
     Long Distance Paths of England and Wales

Preferably to go all together but I don''t really mind

2. 4 recorders, (3 plastic and 1 wooden)
     Assortment of learning to play the recorder books and childrens songboooks
   Usborne Christmas Carols
   Usborne Easy Recorder tunes
   Usborne The Children''s Songbook
    The New Recorder Tutor
    The School Recorder Book 1
   My Recorder Tune Book & More Tunes for my recorder
   Abracadabra Recorder books 1A, 2 and 4

I''ll probably split these between families if there are a few people interested
as there are enough of the books to teach more than one beginner!

3. Elvis Cassette tapes. a dozen of these, prerecorded. Might be good if you
still have a tape player in the car!

Julia in Springfield Road', CAST(0x00009D2100EA4890 AS DateTime), CAST(0x00009D21013B06A1 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (521, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40572?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40572?l=1', N'OFFERED: HOME AND GARDEN MAGAZINES', N'I have a box of home and garden magazines made up of many different ones.  They
are quite old but in good condition and may be worthwhile for projects/surgeries
etc.

I would rather they went onto someone than have to dump so much paper - even if
they do go for recycling

Call on 01424 729217

Catrina', CAST(0x00009D2100956A00 AS DateTime), CAST(0x00009D21013B0725 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (522, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40571?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40571?l=1', N'Offer, Baby cosy toes', N'I have to offer , cosy toes from a terain buggy (3 weeler) brown in colour and
good condition. 
Mandie




[Non-text portions of this message have been removed]', CAST(0x00009D2100A252B0 AS DateTime), CAST(0x00009D21013B074F AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (523, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40570?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40570?l=1', N'Offered: 12ft Trampoline + safety net', N'12ft trampoline not used any more by our children witrh safety netting. Taker
will need to dismantle from the garden. Would like this to go today or tomorow
please.

[Non-text portions of this message have been removed]', CAST(0x00009D2100C4EE10 AS DateTime), CAST(0x00009D21013B077E AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (524, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40586?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40586?l=1', N'WANTED URGENTLY - WASHING MACHINE', N'Does anybody have a washing machine that they no longer need...? (Mines decided
to give up, after firstly decided to completely fill the drum with water...!) It
doesn''t matter if the outside is a little bit tatty as long as its working. I
could possibly collect or pay a small fee if delivered to me (St Leonards).
 
Thanks for reading.
 
Kelly x.




[Non-text portions of this message have been removed]', CAST(0x00009D2100499BC0 AS DateTime), CAST(0x00009D21013C61EA AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (525, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40585?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40585?l=1', N'Wanted single bed with mattress - bexhill tn394aa', N'Hi all we are in real despreate need for a single bed with mattress. cleanish
cond as for my son. will be really apprecited if anyone can help. tn39 4aa', CAST(0x00009D2100CA2600 AS DateTime), CAST(0x00009D21013C622C AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (526, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40584?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40584?l=1', N'wanted technics flat lead cable', N'Hi everyone. Has anyone got a flat lead for a technics seperates stereo. I was
given it and didnt have the leads with it. St-Leonards-On-Sea. Many Thanks', CAST(0x00009D210112A880 AS DateTime), CAST(0x00009D21013C6269 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (527, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40583?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40583?l=1', N'Wanted PLEASE - laptop doesnt need to be working -PLEASE READ !! tn37', N'Hello fellow freecyclers,
my daughter has accidently broken my laptop.. unfortunately i cant afford a new
one but i defo need one i finish my degree in june so i have a dissertation to
be writing lol!!
the hard drive for the laptop itself is fine its just the act casing thats
broken,, Its an advent was wondering if anyone had an old or broken laptop they
dont use that i could try to put my hardrive in so i can keep all my files etc
or a working laptop or desk top thats internet compatible that i can instal word
on to be able to type
thanks sooo much for reading
natalie', CAST(0x00009D2100CE8B00 AS DateTime), CAST(0x00009D21013C62AA AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (528, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40582?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40582?l=1', N'Wanted- kettle-bohemia', N'Wanted- kettle- any type, gas hob type of electric, mine has just died so sad, I
think the element has passed away, leaving the little light on the side to come
on fruitlessly and making me hope for life in the element when there was none.
How cruel. can collect anytime day or night.
kat Bohemia

KATDOG
WWW.KATDOG.CO.UK




[Non-text portions of this message have been removed]', CAST(0x00009D2100ADDBD0 AS DateTime), CAST(0x00009D21013C62D0 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (529, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40581?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40581?l=1', N'Wanted: Guitar stand and amp', N'Hi I am looking for my husband, he is after a stand (I''m assuming for his
acoustic guitar) and an amp for a guitar. Would be most gratefully appreciated!

Cheers
Suz', CAST(0x00009D2101170D80 AS DateTime), CAST(0x00009D21013C6311 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (530, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40580?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40580?l=1', N'WANTED microwave', N'hi, my friends microwave has just blown up!!!! and is in desperate need of
another one if anyone has a working microwave please email me thanks', CAST(0x00009D2100AFC800 AS DateTime), CAST(0x00009D21013C633C AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (531, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40579?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40579?l=1', N'WANTED - OLD PC GAMES', N'I am looking for any old and unwanted PC games - either DOS or windows95/98
games', CAST(0x00009D2100926490 AS DateTime), CAST(0x00009D21013C6361 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (532, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40578?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40578?l=1', N'Wanted: Eastbourne NR Mill Pub Old Beanbags or filling', N'Hi i was wondering if anyone has any old beanbags or filling that they no longer
need as i am hoping to do a project with my children. i can collect,
Many Thanks
Laura', CAST(0x00009D21008F5F20 AS DateTime), CAST(0x00009D21013C638B AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (533, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40577?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40577?l=1', N'Still Offered (St Leonards) Bathroom suite', N'I still have the grey bathroom suite if anyone is interested

Bath
Basin and pedestal
Toilet with wooden seat

Taps will be aqvailable as soon as I have installed the new suite (early next
week)

If anyone wants this let me know

Thanks
Gary', CAST(0x00009D2100E43DB0 AS DateTime), CAST(0x00009D21013C63AC AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (534, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40576?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40576?l=1', N'OFFERED. PC GAMES.', N'A FEW PC GAMES, INC, DRIVER GAME, CHAMIONSHIP MANAGER 3, SNOWBOARDING,
GANGSTERS, THIEF, FA PREMIERE LEAGUE STARS, THEME PARK WORLD. TN38. MARTIN.', CAST(0x00009D2100D495E0 AS DateTime), CAST(0x00009D21013C63DB AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (535, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40575?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40575?l=1', N'Offered: Free admission for 2 Allergy & Gluten-free show. London May21-23', N'Offered: Free admission for 2  Allergy & Gluten-free show. London Olympia
May21-23

Have flyer for this, worth 18pounds (it says)

www.allergyshow.co.uk to see if it''s your cup of tea

Collect from Ore or I will post if you are nice enough!

Thanks,

Lisa', CAST(0x00009D2100DF4C10 AS DateTime), CAST(0x00009D21013C6413 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (536, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40587?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40587?l=1', N'Wanted - Please look (Bexhill)', N'Hi, has anyone got an original cd of ''The Lion Sleeps Tonight'' by Tight
Fit, it features either on a Tight Fit album and Top of The Pops 80''s
album. I have searched everywhere for it to buy and even the library, I
need it for this weekend please.
Thankyou so much - Jane X



[Non-text portions of this message have been removed]', CAST(0x00009D21009988B0 AS DateTime), CAST(0x00009D21013DC1C2 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (537, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40588?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40588?l=1', N'TAKEN: Kawai organ.', N'Thanks for all the interest this has now gone subject to collection.', CAST(0x00009D200142B930 AS DateTime), CAST(0x00009D21013F2044 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (538, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40589?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40589?l=1', N'TAKEN: Carpet for mini-gym! Many thanks to June (and to all others who', N'also offered theirs - a pity I couldn''t accept all offers but thanks anyway.', CAST(0x00009D2000BEE330 AS DateTime), CAST(0x00009D2101449E60 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (539, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40590?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40590?l=1', N'offered various bohemia area', N'right habing a big clear out so far we have on offer
1,rowing machine
2, a small bag of childrens animals jungle and farm
3, black puppy harnes (slightly frayed in one place but does not affect it)
4, small black puppy collar
  there will be more collect asap please thankyou emma', CAST(0x00009D21010FA310 AS DateTime), CAST(0x00009D210153B974 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (540, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40591?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40591?l=1', N'Taken - Stairgate & Cast Iron Pot stand - Bohemia Area', N'Both stairgate & pot stand have now been taken.

Sorry to all who replied.

Odette

--- In, "Odette" <oddypotter@...> wrote:
>
> I have a step through stairgate on offer. Has no wall fixing but stays in
place by means of pressure. Lift up opening section but bar along the bottom
hence step through. Metal.
> Also a black cast iron pot stand with four shelves from top to bottom.
Scroll/heart shape wrought design on shelves.
>
> Bohemia area.
>
> Thanks, Odette
>', CAST(0x00009D20013A3580 AS DateTime), CAST(0x00009D21016C732D AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (541, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40592?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40592?l=1', N'TAKEN - Various.....', N'Sony Walkman and tapes, plus ALL the office stuff were collected this afternoon.

Sorry to everyone who missed out.........





[Non-text portions of this message have been removed]', CAST(0x00009D21010FA310 AS DateTime), CAST(0x00009D21016DD1DE AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (542, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40593?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40593?l=1', N'TAKEN . Child''s ride on toy TN38 area', N'This has now been taken. Many thanks to all interested. Sorry I didn''t have
more.', CAST(0x00009D210174FC60 AS DateTime), CAST(0x00009D2101760F7B AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (543, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40594?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40594?l=1', N'taken - Computer Desk', N'Sorry to all that replied, the table has now gone.


I have a computer desk which is quite modern looking with pine coloured desk top
along with a pull out drawer for the keyboard. To go asap please.

[Non-text portions of this message have been removed]', CAST(0x00009D2100C22EF0 AS DateTime), CAST(0x00009D2101776EF1 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (544, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40599?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40599?l=1', N'Offered books & magazines', N'We have on offer the following

1999 Paperback edition of Official Scrabble words (4th Edition)

Collins Reference Thesaurus in A-Z Form 1992 Edition.

6 1970s Macrame Books

A pile of 2009 Card Making Magazines

These have been offered previously if they don''t go soon we will have to put
then in the recycle bin.

If you are interested ring 441229 evenings', CAST(0x00009D2101457850 AS DateTime), CAST(0x00009D2101826B74 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (545, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40598?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40598?l=1', N'offer', N'mens sports wear, Medium size, must go

TN35 area', CAST(0x00009D210159CB70 AS DateTime), CAST(0x00009D2101826BA8 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (546, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40597?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40597?l=1', N'WANTED. LAPTOP PLEASE.', N'I DON''T SUPPOSE ANYONE HAS AN OLD LAPTOP NOT NEEDED ANYMORE PLEASE, MY ONE WON''T
TAKE CD,S., OR DVD''S. MANY THANKS MARTIN.', CAST(0x00009D2000EEF3E0 AS DateTime), CAST(0x00009D2101826BCD AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (547, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40596?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40596?l=1', N'offered: various items', N'ELC tin of blue powder paint (unused)
Super Badge it
Old  LPs - Tennessee Ernie Ford, Nat King Cole,Victor Borg, Ella Fitzgerald,
Nana Mouskouri.
Reply with landline number if interested please. Sue TN34', CAST(0x00009D2101490A60 AS DateTime), CAST(0x00009D2101826C14 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (548, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40595?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40595?l=1', N'Taken - Motorcycle Cover TN377AX', N'Thanks for a speady collection, sorry to the other 17 people that missed out.
Charley', CAST(0x00009D21016EF180 AS DateTime), CAST(0x00009D2101826C47 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (549, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40602?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40602?l=1', N'Offered - 2 x Cream Sofa cushions (+ 1 that needs stiching up) TN377AX', N'Hi I have 2 Good (+ 1 which needs sewing up the side) 15 x 15 inch sofa cushions
looking for a good home, could do with a refresh in the washer as have been in
the camper van.

Collect any time as I will leave in the black box up the drive, just need to
know the day.

Any Takers

Charley', CAST(0x00009D210171F6F0 AS DateTime), CAST(0x00009D210183CBA1 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (550, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40601?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40601?l=1', N'wanted - baby items', N'my neice is coming from spain to visit her mum, and cannot manage to bring
puschchair sterilizer and car baby seat. so if anyone has these items they are
looking to get rid of i would be very gratefull Thank yo', CAST(0x00009D210144A560 AS DateTime), CAST(0x00009D210183CBEC AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (551, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40600?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40600?l=1', N'Wanted - GreenHouse, Small Slower cooker, & SD Card', N'Hi I am in need of the following items please.

GreenHouse - With or with out glass is fine.

Small slow cooker for 1 or 2 people.

SD card for camera.

I can collect, any time to suit.

Thanks

Charley', CAST(0x00009D2101705110 AS DateTime), CAST(0x00009D210183CC16 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (552, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40607?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40607?l=1', N'Wanted, white cooker extractor', N'Hello,
we are after a white cooker extractor if anyone has one going spare please.
Thank you very much.', CAST(0x00009D2101777530 AS DateTime), CAST(0x00009D2101852AA6 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (553, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40606?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40606?l=1', N'Wanted Scouts Blouse', N'My daughter has started going to Scouts and needs a blouse.

Does anyone have a Scouts Blouse going spare suitable for an eleven year old
girl.

Ever hopeful......

Tracy', CAST(0x00009D210167CD60 AS DateTime), CAST(0x00009D2101852AD0 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (554, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40605?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40605?l=1', N'Wanted - Men''s size 11/12 Ice Hockey Skates', N'Hi all, Long shot, but am after a pair of size 11/12 Men''s Ice Hockey skates.
Going to take up Ice skating again after a break of almost 20 years. Must be
mad.
Want to check if I still have it before looking at investing in a new pair.
Nik', CAST(0x00009D21013CAE50 AS DateTime), CAST(0x00009D2101852AF1 AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (555, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40604?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40604?l=1', N'Taken 12ft Trampoline + safety net', N'Gone subject to collection. Thank you.

----- Original Message -----
From: Julia
To:Sent: Thursday, February 18, 2010 11:57 AM
Subject: Fw: Offered: 12ft Trampoline + safety net



----- Original Message -----
From: Julia
To:Sent: Thursday, February 18, 2010 11:56 AM
Subject: Fw: Offered: 12ft Trampoline + safety net



. 12ft trampoline not used any more by our children witrh safety netting. Taker
will need to dismantle from the garden. Would like this to go today or tomorow
please.

[Non-text portions of this message have been removed]', CAST(0x00009D21013F6D70 AS DateTime), CAST(0x00009D2101852B08 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (556, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40603?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40603?l=1', N'taken - Bike rack for hatchback style car', N'Many thanks for the Bike rack Claire.

Bob




________________________________
From: Claire <>
To:Sent: Monday, 15 February, 2010 20:40:25
Subject: [hastings-freecycle] Offered - Bike rack for hatchback style car

Â 
I have a bike rack for 2 bikes, it has all the bits to it, but haven''t been able
to use it since buying my ford mondeo as it fits a hatchback.

Hope someone can make use of it.

Claire


__._,_..___
Reply to sender | Reply to group Messages in this topic (1)
Recent Activity:  * New Members 36  * New Photos 2
Visit Your Group Start a New Topic
Please refer tofor guidelines on
etiquette and tips on how to organise Freecycle postings

If you have comments to make about the way this list runs, please post to the
Hastings Freecycle moderators at:Do NOT post comments to the list. Please keep it for ''Offered''s, ''Wanted''s and
''Taken''s only.
----------------------------------------------------------------------------

Freecycle and the Freecycle logo are trademarks of The Freecycle Network
in the United States and/or other countries.

---------------------------------------------------------------------------
To chat and offer services which don''t stop landfill,
join the Hastings Freecycle Cafe -Switch to: Text-Only, Daily Digest â€¢ Unsubscribe â€¢ Terms of Use
.



[Non-text portions of this message have been removed]', CAST(0x00009D1F01476480 AS DateTime), CAST(0x00009D2101852B29 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (557, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40608?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40608?l=1', N'Wanted - Bandsaw or fretsaw wanted by woodturner', N'Hi Guys new to freecycle so please bare with me I am about to start a hobby
based business making alternative furniture and woodturning and am looking for
an electric Bandsaw and Fretsaw even broken items considered long shot I know
Thanks Guys', CAST(0x00009D2200636D20 AS DateTime), CAST(0x00009D22007961A8 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (558, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40609?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40609?l=1', N'Offered - Dog Food - Bexhill', N'I have 4 tins of Butchers Dog Food on offer - My dog cant eat it!

They are the normal canned dog food, not the puppy food. Collection from
Sidley in Bexhill please!

--
Natti
xxxx


[Non-text portions of this message have been removed]', CAST(0x00009D220007B0C0 AS DateTime), CAST(0x00009D22007AC143 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (559, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40610?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40610?l=1', N'Received - Carry on dvds', N'A couple of Carry on dvds were received with many thanks by my husband. Thanks
Sarah.
Katherine', CAST(0x00009D2200041EB0 AS DateTime), CAST(0x00009D2200921A43 AS DateTime), 0, 0, 5, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (560, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40617?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40617?l=1', N'WANTED: Pasta Maker - any condition (St L)', N'Hi,

If anyone is clearing out their kitchen cupboards and has a pasta maker they no
longer want, please can you bear in mind that I am looking for one.  Usually
there are loads in the charity shops but for some reason not at the moment!

It is for a craft project so any condition is fine.

Thanks very much', CAST(0x00009D2200E78970 AS DateTime), CAST(0x00009D220102EDA8 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (561, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40616?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40616?l=1', N'WANTED: wood for Woodturner furniture maker', N'Hi I am a Woodturner and creative furniture maker and always looking for free
wood planks logs off cuts from joinery workshops etc.

Sorry not interested in old pallets or old conifer hedges', CAST(0x00009D2200648660 AS DateTime), CAST(0x00009D220102EFC3 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (562, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40615?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40615?l=1', N'Received- picture frames', N'The picture frames were received with many thanks to Prue and her charming
husband.', CAST(0x00009D2200039210 AS DateTime), CAST(0x00009D220102F034 AS DateTime), 0, 0, 5, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (563, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40614?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40614?l=1', N'Offered: Apple Macintosh computers - very old (mid 1990s)', N'1. Macintosh Colour Classic - Very old style (all in one) macintosh computer
from mid 90s. Complete with keyboard and mouse and printer. Running Belgian
(probably Walloon) version of operating system and Word v5. Good working order.
Suit collector or someone who wants a fairly compact desktop machine for word
processing.

2. Macintosh LC 474 - Very old style Apple Macintosh computer (pre- PowerPC
chip) complete with monitor, keyboard and mouse. In working order.

3. Macintosh Performa 460 - Old style Apple Macintosh computer (pre- PowerPC
chip) complete with keyboard and mouse. Suit collector/enthusiast as currently
locked out with software Disklock - password forgotten.

If you are interested in any of the above please reply to:', CAST(0x00009D2200864ED0 AS DateTime), CAST(0x00009D220102F096 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (564, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40613?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40613?l=1', N'offered radiators', N'hi
i have 7 radiators up for grabs were new been outside so need a bit of attention
but nothing that a rub down and repaint wont fix, they are not as bad as it
sounds, they are various sizes, we are just off the ridge in hastings collection
by sat otherwise the scrap man gets them
mel', CAST(0x00009D2200AA49C0 AS DateTime), CAST(0x00009D220102F0E1 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (565, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40612?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40612?l=1', N'wanted table', N'please if someone could help me out i would be gratefull. I have 4 children and
really need a table so they can sit and eat there dinner properly. much thanks
penny x', CAST(0x00009D220090BEB0 AS DateTime), CAST(0x00009D220102F11A AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (566, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40611?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40611?l=1', N'Offered: Shower enclosure - TN35', N'Offered: SHOWERLUX ''SIMPLY'' enclosure, Pivot and Side Door and Cream Tray, 9mm
safety glass, silver finish. 90cm x 90cm. good condition. Must all go together
and asap. Tray base made from concrete so is very heavy!', CAST(0x00009D220085C230 AS DateTime), CAST(0x00009D220102F152 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (567, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3543?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3543?l=1', N'WANTED 8-10 PAVING SLABS FOR SHED BASE PLEASE! (LYDD)', N'Hi Freecyclers!!

I am relocating a shed and am looking for 8 - 10 paving slabs to sit it upon.
Really hoping somebody can help me out!!

Thanks  Chelle




[Non-text portions of this message have been removed]', CAST(0x00009D22009E7A50 AS DateTime), CAST(0x00009D220102F8D4 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (568, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3542?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3542?l=1', N'OFFERED PEASMARSH Fold up wheelchair', N'I am listing this on behalf of a friend who no longer has any use for it. In
working order but probably needs a bit of TLC as it has not been used recently
but has been kept indoors.', CAST(0x00009D22009E7A50 AS DateTime), CAST(0x00009D220102F903 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (569, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3541?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3541?l=1', N'TAKEN - Epson printer & Canon scanner - Rye', N'Taken by a kind gentleman who will offer these items again or pass them on to a
deserving new user, if he gets them working.', CAST(0x00009D2200A62B10 AS DateTime), CAST(0x00009D220102F936 AS DateTime), 0, 0, 3, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (570, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3540?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3540?l=1', N'**WANTED: Bandsaw and Fretsaw', N'Hi Guys I am after an Electric Bandsaw and a Fretsaw for My Woodturning and
Creative Furniture Making will be interested in any machines even broken ones
for repair long shot this but worth trying

**subject line edited by mod to keep within guidelines', CAST(0x00009D220065E5F0 AS DateTime), CAST(0x00009D220102F994 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (571, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3539?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3539?l=1', N'Wanted - VHS video player', N'Hello! Please does anyone have a VHS video player in working order? Thanks!', CAST(0x00009D2101777530 AS DateTime), CAST(0x00009D220102F9B9 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (572, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3538?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3538?l=1', N'Wanted: Washing Machine - Any Area', N'Hi All,

My sister in law in desperate need of a washing machine and being a single
mother with 2 kids she hasn''t the funds to buy one, cannot afford to keep using
the laundrette so is having to hand wash!!!

She was offered one by another freecyler but in the process of arranging
collection this was sold on, and she had also been offered by her neighbour but
said she had now found one as she had been offered one from here

so now she is very upset that she has managed to get offered 2 washing machines
in 2 days and not end up being able to have either of them, through no fault of
her own!

So she is now hoping 3rd time lucky!!!!!!!!!

I will collect for her as she doesn''t have transport and i am free to collect at
most times

Thanks for reading,

Waiting with fingers and toes crossed for her

Fyona', CAST(0x00009D2101438C20 AS DateTime), CAST(0x00009D220102F9E4 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (573, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3537?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3537?l=1', N'Offered - Canon Scanner - Rye', N'I have a Canon CanoScan N650U which I got on Freecycle and in the event have not
used. It seems only fair to pass it on via Freecycle. The previous owner said it
worked OK and that you can get the relevant driver from the internet.

Please e-mail phone no. Thanks.', CAST(0x00009D2100F890D0 AS DateTime), CAST(0x00009D220102FA13 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (574, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40629?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40629?l=1', N'offerred, Kitchen range, nr Robertsbridge.', N'Hi all,

My brother in law has just changed his kitchen and is offering an electric range
cooker, in Blue, 1 conventional oven, 1 fan oven, 1 grill, 1 storage drawer, 4
rings and hot plate.

This is in Mountfield, nr Robertsbridge.

thanks
Andy

[Non-text portions of this message have been removed]', CAST(0x00009D2201090B90 AS DateTime), CAST(0x00009D22014FFEE0 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (575, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40628?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40628?l=1', N'OFFERED printer cartridges West Hill Hastings', N'On offer two unopened compatible cartridges for an Epson Stylus DX6000

•E71y (yellow). Compatible with Epson T0714/TO894
•E71c  (cyan) . Compatible with Epson T0712/T0892

Reason: my printer just won''t use compatible cartridges.

Ann', CAST(0x00009D2200E7CFC0 AS DateTime), CAST(0x00009D220150020F AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (576, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40627?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40627?l=1', N'Offered - 6 x Men Health Magazines - Bexhill', N'Hi

On offer are 6 Mens health magazines from 1999-2000. All complete and full of
usefull training and health tips.

Email me if intersted.

Rick', CAST(0x00009D2200BFB620 AS DateTime), CAST(0x00009D2201500297 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (577, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40626?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40626?l=1', N'OFFERED - TN34 Dinner services (plates etc)', N'Hi

I have a set of 4 square navy blue dinner plates (Argos) with 4 matching side
plates and 4 mugs but only 2 bowls.

Also 6 plain white dinner plates (Tesco) with 6 each of matching side plates,
bowls, cups and saucers.

Grateful for collection ASAP please.

Thanks.', CAST(0x00009D2200EF3A30 AS DateTime), CAST(0x00009D22015002B8 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (578, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40625?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40625?l=1', N'Offered - TV, digibox, blender, iron', N'Digibox with remote.  We now have one with DVD player combined so it''s surplus
to requirements.  We were having trouble getting all the channels at one point -
but think it was the connections to the TV rather than the box.

A steam iron.  Works okay.  We have a new one so it''s surplus to requirements.

Hand held blender.  We got given a posh one for Christmas, so it''s also surplus
to requirements!

Please email a landline number if you''re interested in any of the above.

Jill', CAST(0x00009D22010692C0 AS DateTime), CAST(0x00009D22015002E2 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (579, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40624?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40624?l=1', N'offered various bexhill', N'hi i have some childrens books,power rangers mask,soft teddies,assortment of
small toys, some small ornaments,spiderman cd cardi and trousers girls size
12-18months need gone asap and as a lot please thank you', CAST(0x00009D22012741F0 AS DateTime), CAST(0x00009D2201500316 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (580, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40623?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40623?l=1', N'offered - Office chair and boxes', N'Black vinyl high backed office chair, with arms, on wheels, gas mechanism
doesn''t work, and split in seat.
2 Very large cardboard boxes, 500x500x500.', CAST(0x00009D220101A120 AS DateTime), CAST(0x00009D2201500340 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (581, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40622?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40622?l=1', N'RECEIVED:with thanks!!! from Kevin Saucepans & plates', N'very grateful for this, thank you!', CAST(0x00009D2200BB9770 AS DateTime), CAST(0x00009D2201500366 AS DateTime), 0, 0, 5, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (582, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40621?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40621?l=1', N'Received - Music (Bexhill)', N'Thankyou to everyone who helped. This music has now been obtained on an
original disc
Jane X


[Non-text portions of this message have been removed]', CAST(0x00009D2200AE6870 AS DateTime), CAST(0x00009D2201500386 AS DateTime), 0, 0, 5, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (583, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40620?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40620?l=1', N'taken radiators', N'the radiators have been taken thanks for quick pick up Andy', CAST(0x00009D2201365D20 AS DateTime), CAST(0x00009D22015003A7 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (584, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40619?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40619?l=1', N'taken stc childs toy kitchen', N'this item has now gone sorry for those who didnt get back to me', CAST(0x00009D2201250F70 AS DateTime), CAST(0x00009D22015003C8 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (585, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40618?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40618?l=1', N'TAKEN: a few household items', N'The saucepans, pasta bowls and oven sheet have now gone.

Thanks for the interest.', CAST(0x00009D2200EAD530 AS DateTime), CAST(0x00009D22015003EE AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (586, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40707?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40707?l=1', N'OFFERED HASTINGS', N'Fireside chair good condition will do someone a good turn', CAST(0x00009D2401570C50 AS DateTime), CAST(0x00009D2500A72BB2 AS DateTime), 0, 0, 1, 1, 15, 1)
GO
print 'Processed 400 total records'
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (587, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40706?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40706?l=1', N'wanted canvas', N'hi! has anyone got plain canvas for painting please? any size any shape.', CAST(0x00009D24016B5F70 AS DateTime), CAST(0x00009D2500A72C43 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (588, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40705?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40705?l=1', N'Taken - Car Seat - Still Offered - Wireless Router - Marina', N'Hiya

The forward facing car seat for a child from about 6 months. It is a Britax
freeway has now been taken.

We still have the wireless router, we got this from a fellow freecycler for
my mum but she had got one from my brother in the mean time so is now
surplus to requirements. It plugs into your existing modem via Ethernet
cable and gives you about 4 Ethernet outputs aswell as a wireless connection
  I am unsure if this works as I have never even plugged it in.

If you are interested in either of the above items please reply with a phone
number (mobile no problem) and we will contact you regarding collection. If
you reply without a phone number we will delete your email and offer it to
the next person who does.

Thank you

Vince & Kelly

[Non-text portions of this message have been removed]', CAST(0x00009D24014A69F0 AS DateTime), CAST(0x00009D2500A72C69 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (589, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40704?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40704?l=1', N'OFFERED: various computer bits', N'I got these from another freecycler and said I would pass on what I didn''t
need. I have two motherboards, 4 processors, a box of various cards and an
Asus tower. Certainly enough for somebody to get well on the way to building
a PC.  Please take it all, not just some of it.



Keith



[Non-text portions of this message have been removed]', CAST(0x00009D2401201DD0 AS DateTime), CAST(0x00009D2500A72C8E AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (590, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40703?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40703?l=1', N'Taken Oak laminate', N'Thanks to all who enquired. It has now gone. Clare.', CAST(0x00009D24014F5B90 AS DateTime), CAST(0x00009D2500A72CD0 AS DateTime), 0, 0, 3, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (591, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40702?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40702?l=1', N'Taken - THANK YOU to Kelly & Vince for the car seat.', N'Very generous and very much appreciated.', CAST(0x00009D2401464B40 AS DateTime), CAST(0x00009D2500A72CE8 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (592, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40701?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40701?l=1', N'taken subject to collection king size bed', N'subject to collection the king size bed it taken thanks', CAST(0x00009D240134FD90 AS DateTime), CAST(0x00009D2500A72D04 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (593, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40700?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40700?l=1', N'Taken - Dog Food - Bexhill', N'Dog food now taken - Thanks!

--
Natti
xxxx


[Non-text portions of this message have been removed]', CAST(0x00009D2401144E60 AS DateTime), CAST(0x00009D2500A72D1B AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (594, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40699?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40699?l=1', N'WANTED: TN34: LARGE TYRE - Either Tractor or Lorry (even large car) as', N'long as it has some depth. Afraid I''ll have to keep you guessing as to what I
want it for!  Doesn''t matter what condition as long as in one piece !!!  Please
drop me a line if you can help and I will contact by return.  Thanks and
regards.', CAST(0x00009D24012B60A0 AS DateTime), CAST(0x00009D2500A72D37 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (595, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40698?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40698?l=1', N'Wanted - Curtains hooks', N'Hi I need some curtain hooks, the sort that loop through the curtain tape, then
you can hang the curtians through rings on a track, they are sort of ear shaped!
hard to explain, but if you have some you will know what I mean.

NOT the sort that hook straight on the track

I can collect today, even if you only have 5 or 6, some is better than none..

Thanks
Charley', CAST(0x00009D2400C1E8A0 AS DateTime), CAST(0x00009D2500A72D58 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (596, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40697?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40697?l=1', N'Wanted kitchen appliances', N'We desperately need you to donate your working kitchen appliances, so we can
give them free to the most desperate local applicants.
please see our website for more information about the local re-use project.
www.robin-hoodz.moonfruit.com', CAST(0x00009D2400E6B680 AS DateTime), CAST(0x00009D2500A72D74 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (597, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40696?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40696?l=1', N'Taken:Mosaic Material', N'Sorry to disappoint all the Mosaic makers, but I''ve already said yes to a
Freecycler and they will be collected asap.
If not collected I will mail the next person on the list.
Thanks for all the interest.
Bob





[Non-text portions of this message have been removed]', CAST(0x00009D24010C9DA0 AS DateTime), CAST(0x00009D2500A72D90 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (598, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40695?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40695?l=1', N'OFFERED various TN35 Westfield', N'Two Lett''s science revision books. Age 7 to 11. They haven''t been used as far as
I can see except for one page in one of them
Sony Eriksson phone charger headphones and computer lead
Bathroom cabinet small corner basic white plastic with front mirror. I did offer
this a while ago a couple of people said it was a bit small and I lost the other
contacts !
Tiles lilac and blue unused

Hope these will be useful to someone', CAST(0x00009D24010A6B20 AS DateTime), CAST(0x00009D2500A72DB1 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (599, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40694?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40694?l=1', N'WANTED - 1 TON BUILDERS BAG -BOHEMIA AREA', N'Does anyone have a spare builders bag in good condition? Handles must be
intact.', CAST(0x00009D2400BFFC70 AS DateTime), CAST(0x00009D2500A72DD7 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (600, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40693?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40693?l=1', N'WANTED: plastic plant pots', N'Hello eveyone. I am in need of plant pots for the greenhouse i have done  lots
of seeds and now they need to go into small pots.
Has anybody got some they no longer need. I can collect.
Many thanks Diane.', CAST(0x00009D2400FDC8C0 AS DateTime), CAST(0x00009D2500A72DF3 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (601, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40692?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40692?l=1', N'WANTED : Massage couch', N'The fold up sort to please






[Non-text portions of this message have been removed]', CAST(0x00009D2400C766E0 AS DateTime), CAST(0x00009D2500A72E0F AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (602, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40691?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40691?l=1', N'Offered: Mosaic Material', N'Broken Tiles
Hi All,
I have just lifted a carpet and where the fireplace was I found an area of 1 1/2
ft  x 4 ft of lovely Victorian fireplace tiles with a kind of Lily/ flower
pattern.
Unfortunately they are allbroken !!!
Each tile is in at least 4 pieces or more and they are off to the landfill
unless someone would like them for a mosaic project...
I''m in West St Leonards
Thanks all
Bob





[Non-text portions of this message have been removed]', CAST(0x00009D2400FFFB40 AS DateTime), CAST(0x00009D2500A72E26 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (603, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40690?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40690?l=1', N'Taken - Cream Cusions TN377AX', N'Hi thanks for a speedy collection from the box. charley', CAST(0x00009D2400BDC9F0 AS DateTime), CAST(0x00009D2500A72E4C AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (604, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40689?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40689?l=1', N'OFFERED: Laminate oak coloured flooring ASAP', N'Hello. I have some hardly used clip together oak coloured laminate flooring in
perfect condition to freecycle .  Enough for a small bathroom / or utilty
perhaps. Just taken up and sorted. First to contact and collect as must go ASAP
as now in the way.  Call Clare 07771588862. Hastings just off Ridge.', CAST(0x00009D2400FA7D00 AS DateTime), CAST(0x00009D2500A72E68 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (605, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40688?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40688?l=1', N'OFFERED - BAG OF CARBOOT, GREAT STUFF', N'I have a large bag of carboot - toddler''s toys, shoes, boots, slippers, clothes,
ladies shoes & boots (size 4), clothes, bric-a-brac - much of this stuff is new
or hardly used.

You need to be able to collect from St Leonards. Please email saying when you
can collect - sooner the better, first come first served!', CAST(0x00009D2400F12660 AS DateTime), CAST(0x00009D2500A72E84 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (606, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40687?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40687?l=1', N'Offered - Veg growing Mags 2009 TN377AX', N'HI I a few grow-it and kitchen garden mags from 2009, I am willing to split the
mags for those interested.
Thanks
Charley', CAST(0x00009D2400C08910 AS DateTime), CAST(0x00009D2500A72EA5 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (607, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40686?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40686?l=1', N'Offered - HP deskjet 5550 colour printer', N'Good working order but not compatible with my new PC which runs on VISTA.
Instructions and disk supplied.', CAST(0x00009D2400EFC6D0 AS DateTime), CAST(0x00009D2500A72EC6 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (608, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40685?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40685?l=1', N'Offered - top soil', N'Hi I have some more top soil available - bring some more bin bags to double bag
it as its only in recycling sacks at the moment and Ive run out of bags. 
Collect from Hastings Old Town - needs shifting in the next couple of days
please.  Ive about 15 half full sacks.  Cheers Linda', CAST(0x00009D2400DDA630 AS DateTime), CAST(0x00009D2500A72EE2 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (609, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40684?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40684?l=1', N'Offered - 2 Haynes Manuals - Bexhill', N'Hi all

On offer are 2 Haynes Manuals

Austin Montego - 1984-1987 1275cc-1598

Austin Metro - 1980-1990 998cc-1275cc

Both in excellent condition
Can be split if required

Email if interested.

Rick', CAST(0x00009D2400F3E580 AS DateTime), CAST(0x00009D2500A72F03 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (610, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40683?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40683?l=1', N'offer- king size bed', N'i have recently got a new bed so have for offer a king size divan bed very nice
needs to be taken soon', CAST(0x00009D2400FB4FF0 AS DateTime), CAST(0x00009D2500A72F31 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (611, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40682?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40682?l=1', N'Taken : Capiz shell lampshade, Hastings', N'Thanks for the prompt collection John









Hello
I have a pink and ivory capiz shell pendant lampshade to offer. About 12"
across.  I''ve put a photo on the groups photos in the Bev album.  Just warning
you it looks a bit duller in the daylight.
Bev
 
collect from Hastings TN34


     

[Non-text portions of this message have been removed]



------------------------------------

Please refer tofor guidelines on
etiquette and tips on how to organise Freecycle postings

If you have comments to make about the way this list runs, please post to the
Hastings Freecycle moderators at:Do NOT post comments to the list. Please keep it for ''Offered''s, ''Wanted''s and
''Taken''s only.
----------------------------------------------------------------------------

Freecycle and the Freecycle logo are trademarks of The Freecycle Network
in the United States and/or other countries.

---------------------------------------------------------------------------
To chat and offer services which don''t stop landfill,
join the Hastings Freecycle Cafe -! Groups Links








[Non-text portions of this message have been removed]', CAST(0x00009D2400D8B490 AS DateTime), CAST(0x00009D2500A72F52 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (612, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40681?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40681?l=1', N'Taken, Chimney Cowl. TN35 4HY', N'Thank-you to all who replied for the chimney cowl, TN35 4HY.
It was taken 30 minutes ago to the first timed applicant.
Regards to all,
David', CAST(0x00009D2400B0E140 AS DateTime), CAST(0x00009D2500A72F78 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (613, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40680?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40680?l=1', N'wanted carpet in eastbourne', N'hi does anyone have any decent room size carpet they no longer need pref plain
not pattern
thanx
dave
x', CAST(0x00009D2400083D60 AS DateTime), CAST(0x00009D2500A72F94 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (614, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40679?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40679?l=1', N'WANTED East Hill Pavign Stones', N'Hiya... the snow and winter in general have not helped my bin area... I am in
dire need of something to stop me going through the threat of breaking my neck
every time I throw a bag out so does anyone have even three or four spare paving
stones that I can put onto mud?

Your help is much appreciated.

Will

_________________________________________________________________
Hotmail: Free, trusted and rich email service.[Non-text portions of this message have been removed]', CAST(0x00009D24000956A0 AS DateTime), CAST(0x00009D2500A72FB0 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (615, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40678?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40678?l=1', N'Offered computer programming reference books', N'I have a collection of programming reference books. The programming versions
covered are older, however, they are still relevant. Would definitely suit
someone studying.

Topics covered are:

Visual Basic
Visual Basic for applications - Access Word Excel etc macros

and more...

Would perfer not to split, so please bring a car.', CAST(0x00009D2400B6EC20 AS DateTime), CAST(0x00009D2500A72FD1 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (616, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3554?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3554?l=1', N'WANTED: Set of weights or dumbells: Winchelsea Beach', N'WANTED:Set of weights or dumbells: Winchelsea Beach', CAST(0x00009D24014AF690 AS DateTime), CAST(0x00009D2500A7370D AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (617, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3553?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3553?l=1', N'TAKEN: Cream Leather two seater sofa: Winchelsea Beach', N'TAKEN: Cream Leather two seater sofa: Winchelsea Beach', CAST(0x00009D24014A69F0 AS DateTime), CAST(0x00009D2500A7372D AS DateTime), 0, 0, 3, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (618, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3552?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3552?l=1', N'Offered: Cream Leather 2 Seater Sofa: Winchelsea Beach', N'Offered: Cream Leather 2 Seater Sofa: Winchelsea Beach', CAST(0x00009D2400C0CF60 AS DateTime), CAST(0x00009D2500A73758 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (619, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3551?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3551?l=1', N'RECIEVED fax machine', N'I now have the fax machine i asked for, thank you Andy Dinsdale !', CAST(0x00009D2400A976D0 AS DateTime), CAST(0x00009D2500A73774 AS DateTime), 0, 0, 5, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (620, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3550?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3550?l=1', N'OFFERED - kitchen units - Camber', N'Some kitchen units in woodgrain finish, small kitchenette including electric 4
ring hob and separate oven, sink and tap', CAST(0x00009D23016DD840 AS DateTime), CAST(0x00009D2500A73790 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (621, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3549?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3549?l=1', N'wanted fridge freezer .rye.', N'hello i am in desperate need of a fridge freezer.
can anyone help??', CAST(0x00009D2400034BC0 AS DateTime), CAST(0x00009D2500A737B1 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (622, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3548?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3548?l=1', N'TAKEN computer table lydd', N'Hi all, the computer table i listed has been collected, thanks kelly dynes !', CAST(0x00009D2400A93080 AS DateTime), CAST(0x00009D2500A737D6 AS DateTime), 0, 0, 3, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (623, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3547?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3547?l=1', N'OFFERED - wood fire surround/mantelpiece - Camber', N'Can email picture if interested', CAST(0x00009D22015798F0 AS DateTime), CAST(0x00009D2500A7381C AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (624, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3546?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3546?l=1', N'Wanted- childs toy garage- RYE', N'Hiya freecyclers,

Does anyone have a toy garage or anything car related as my little boy loves his
cars. He only has a few so I would like to try and make it abit more fun for
him.

Thankyou for reading

Viki', CAST(0x00009D2300AD4F30 AS DateTime), CAST(0x00009D2500A73867 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (625, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3545?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3545?l=1', N'OFFERED - contemporary bedroom drawer unit - camber', N'Dwell tall bedroom drawer unit with mirror, in dark stained wood finish, almost
new.  Can email picture if interested.', CAST(0x00009D22015752A0 AS DateTime), CAST(0x00009D2500A7388D AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (626, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3544?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3544?l=1', N'TAKEN - carpets and underlay - Camber', N'Sorry to thos who have replied, these items now taken', CAST(0x00009D220156C600 AS DateTime), CAST(0x00009D2500A738AE AS DateTime), 0, 0, 3, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (627, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2330?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2330?l=1', N'Offered-Metal filing cabinets-Location?', N'To give away - two four drawer grey metal filing cabinets for hanging files.', CAST(0x00009D2301278840 AS DateTime), CAST(0x00009D2500A73BE7 AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (628, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2329?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2329?l=1', N'Offered-Piano-Location?', N'To give away - Upright piano 1942 Boyd.  Very nice piece of furniture.  The
mechanics need some attention.', CAST(0x00009D23012814E0 AS DateTime), CAST(0x00009D2500A73C08 AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (629, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2328?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2328?l=1', N'Wanted : Peugeot 2 button key fob Cranbrook', N'Hi , have you sold your car and find yourself left with a spare key or the key
no longer works in your car . Could i collect it ? the casing on ours is broken
and needs swapping . Its a 2 button key for a peugeot 106 ... i expect the 306
and 406 are the same . thanks', CAST(0x00009D240104ECE0 AS DateTime), CAST(0x00009D2500A73C24 AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (630, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2327?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2327?l=1', N'Offered: Cutlery and Food Processor, Iden Green', N'Basic cutlery: 24 forks, 13 knifes and 4 spoons. They are not a set,

just all stainless steel.

Plus a Kenwood food processor and blender, it''s old but i''m told it
works well.



Plus e-mail me if your interested.



Jenny




[Non-text portions of this message have been removed]', CAST(0x00009D2300ED9450 AS DateTime), CAST(0x00009D2500A73C45 AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (631, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2326?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2326?l=1', N'Offered-Old Portable ''Suitcase Style'' Solar Water Heater-Nr.Hawkhurst', N'Old portable solar water heater ''suitcase style''.  Needs a little bit of
attention to the bung.

If anyone is interested, please e-mail me a home contact number.', CAST(0x00009D2300B9F190 AS DateTime), CAST(0x00009D2500A73C6A AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (632, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2325?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2325?l=1', N'Wanted-reel to reel tape deck-Location?', N'Hi All has anyone got an old AKAI Reel to Reel tape deck spare .
Thanks   Keith


Message from Moderator - Sorry for delay in posting message, not been at
computer this week due to school holidays', CAST(0x00009D22013CAE50 AS DateTime), CAST(0x00009D2500A73C8B AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (633, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2324?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2324?l=1', N'offered- leather sofa - Hawkhurst', N'i have a blue leather 3 seater sofa on offer
excellent condition
cost over two thousand when new
very heavy as alot of wood on it
must be gone by wednesday please
collection from hawkhurst,kent

Message from Moderator - Sorry for delay in posting message, not been at
computer this week due to school holidays', CAST(0x00009D1E01118F40 AS DateTime), CAST(0x00009D2500A73CA7 AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (634, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2323?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2323?l=1', N'Wanted: dolls house for art project, Ticehurst', N'Traditional style dolls house - wooden, cardboard, metal or plastic. Doesn''t
need to be in immaculate condition - just reasonably sound. Doesn''t matter if
incomplete e.g. front missing.

Many thanks

Richard


Message from Moderator - Sorry for delay in posting message, not been at
computer this week due to school holidays', CAST(0x00009D1D012D0680 AS DateTime), CAST(0x00009D2500A73CC8 AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (635, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2322?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2322?l=1', N'WANTED- floor boards please - SELLINDGE', N'Please please please can any one hel[p we need some old floor boards to do our
living room with the old ones would be great so that we can keep up the recycled
theme of our house i can collect any time many thanks in advance kelly


Message from Moderator - Sorry for delay in posting message, not been at
computer this week due to school holidays', CAST(0x00009D1C017CF370 AS DateTime), CAST(0x00009D2500A73CED AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (636, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2321?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2321?l=1', N'wanted please....SOS talisman bracelet or (necklace) me18', N'Hi

Has anyone on the off chance got a SOS (medic alert) bracelet or necklace they
no longer need?

Due to my medication I require one for emergency assistance, preferably a
bracelet one but a necklace would be suffice.  I require one that has the screw
top not the ones that you engrave as my medication is being changed all the
time.

It does not necessarly need to have the slip of paper inside as I can print one
off with all my relevent details.

I would be most grateful and can collect at anytime

Many thanks


Message from Moderator - Sorry for delay in posting message, not been at
computer this week due to school holidays', CAST(0x00009D20011567A0 AS DateTime), CAST(0x00009D2500A73D0E AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (637, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2320?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2320?l=1', N'WANTED: Universal TV remote control (Ticehurst)', N'Hello there
Has anyone got a universal TV remote control they no longer need? We have been
given a TV but its remote is not working properly. If you do have a spare then
please get in touch! Many thanks. Richard

Message from Moderator - Sorry for delay in posting message, not been at
computer this week due to school holidays', CAST(0x00009D20014418C0 AS DateTime), CAST(0x00009D2500A73D34 AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (638, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2319?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2319?l=1', N'taken: Hanging baby bouncer', N'Thank-you to all who were interested.', CAST(0x00009D20010D2A40 AS DateTime), CAST(0x00009D2500A73D59 AS DateTime), 0, 0, 3, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (639, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2318?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2318?l=1', N'wanted : car battery cranbrook', N'hi , would anyone have a car battery available. it has round terminals ,
required for my sisters 106 but many different makes use this type like citreon
, ford, vauxhall,renault , vw.  thankyou


Message from Moderator - Sorry for delay in posting message, not been at
computer this week due to school holidays', CAST(0x00009D1C01655490 AS DateTime), CAST(0x00009D2500A73D75 AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (640, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2317?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2317?l=1', N'wanted petrol lawnmower,runner or non runner,cranbrook', N'maybe youve got a new mower for this year and want to give your old one a new
home,i,d be very grateful graham

Message from Moderator - Sorry for delay in posting message, not been at
computer this week due to school holidays', CAST(0x00009D20001C03E0 AS DateTime), CAST(0x00009D2500A73D96 AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (641, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2316?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2316?l=1', N'Offered: Sharp 21" colour TV (old style); Lloyd Loom style chair, Ticehurst', N'1. Sharp 21" colour TV NOT flatscreen in good condition, works well. Remote a
bit tired and repaired with tape.

2. White painted chair with wooden arms and Lloyd Loom style curved back. In
good condition but detachable seat will need re-covering. Ideal for bathroom or
conservatory.

To be collected from Ticehurst.

regards

Richard



Message from Moderator - Sorry for delay in posting message, not been at
computer this week due to school holidays', CAST(0x00009D1D012C3390 AS DateTime), CAST(0x00009D2500A73DB7 AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (642, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2315?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2315?l=1', N'Offered: Roca toilet and basin with unit-Ticehurst', N'Offered Roca toilet - with a green tint and matching basin which is attached to
a wood veneer cabinet with no front
Collection from Ticehurst



Message from Moderator - Sorry for delay in posting message, not been at
computer this week due to school holidays', CAST(0x00009D1D013616D0 AS DateTime), CAST(0x00009D2500A73DE6 AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (643, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2314?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2314?l=1', N'Wanted please-Microwave - Flimwell', N'Hi - is anyone able to freecycle a working microwave please - ours has just
broken down!  - thanks, Angela.

Message from Moderator - Sorry for delay in posting message, not been at
computer this week due to school holidays


[Non-text portions of this message have been removed]', CAST(0x00009D1C012814E0 AS DateTime), CAST(0x00009D2500A73E07 AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (644, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2331?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2331?l=1', N'Offered, Sandhurst, Various', N'Today we have on offer a nearly full roll of slaters felt, (the type that goes
under roof tiles)
Also a low level walk in shower tray and sides, (the sort that is good for
wheelchairs)
A large winter swimming pool cover.
Thats it for now', CAST(0x00009D2500D6C860 AS DateTime), CAST(0x00009D2500D760D4 AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (645, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3555?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3555?l=1', N'Offered, Various, Sandhurst', N'Today we have on offer a nearly full roll of slaters felt, (the type that goes
under roof tiles)
Also a low level walk in shower tray and sides, (the sort that is good for
wheelchairs)
A large winter swimming pool cover.
Thats it for now', CAST(0x00009D2500D6C860 AS DateTime), CAST(0x00009D2500E1D2C7 AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (646, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3556?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3556?l=1', N'Offered, Sandhurst, Encyclopedias', N'A full set of 15th edition encyclopedia Brittanica.', CAST(0x00009D2500E67030 AS DateTime), CAST(0x00009D2500E7519A AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (647, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2332?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2332?l=1', N'Offered, Sandhurst, Encyclopedias', N'A full set of 15th edition encyclopedia Brittanica', CAST(0x00009D2500E6B680 AS DateTime), CAST(0x00009D2500E8B368 AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (648, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2333?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2333?l=1', N'WANTED - Wired x-box controllers-Cranbrook', N'If anyone has upgraded to wireless controllers and has their old ones sitting
around collecting dust then my son would like to offer them a home in which they
will be well used!

Daniela', CAST(0x00009D2500B4FFF0 AS DateTime), CAST(0x00009D2500EA1271 AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (649, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3558?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3558?l=1', N'OFFERED NORTHIAM SCHOOL SWEATSHIRTS X3 sandhurst', N'I HAVE 3 NORTHIAM SCHOOL SWEATSHIRTS ALL 9-10 YEARS, THEY HAVE BEEN PACKED AWAY
FOR THE LAST 4 YEARS AS I NOW LIVE IN SANDHURST SO IF THE UNIFORM HASN''T CHANGED
SINCE THEN YOUR WELCOME TO THEM. 2 ARE OK I IS CHEWED ROUND THE CUFF BUT STILL
STICHABLE AND WEARABLE ! PLEASE LEAVE A LANDLINE NUMBER IF INTERESTED
LISA', CAST(0x00009D2500E556F0 AS DateTime), CAST(0x00009D2500EB927B AS DateTime), 0, 0, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (650, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3557?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3557?l=1', N'Wanted Sky box, Wooden Ironing board, roll top bath! TN32', N'An electic wish list.
Wanted a Roll top bath, if any one is updating their bathroom, an old fashioned
wooden Ironing board, and a sky box as we cant get Telly without one as the
aerial does not work in the new house, if its sky plus that would be a bonus!
Thanks for looking........
Loads of kitchen stuff to list shortly!', CAST(0x00009D2500E975A0 AS DateTime), CAST(0x00009D2500EB92B7 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (651, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2334?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2334?l=1', N'WANTED: Oven to bake potatos at charity music festival (Tunbridge Wells)', N'Hi Freecyclers,

We are looking for an oven to bake potatos in. It MUST run off a 13amp plug (or
some seperate form of supply) as it will be used in a marquee in a field and we
have limited power available. I''m afraid a standard domestic cooker would not
work for this reason as it would draw too much power. If you have anything we
could use for this it would be very gratefully recieved and have good use
generating money for a very worthwhile charity.

The event is in aid of Hospice in the Weald which is Registered Charity
No.280276. This annual event run entirly by voulenteers, has so far raised
£131,000 in the last 9 years including £29,000 last year.

Cheers,

Hugh.', CAST(0x00009D2401438C20 AS DateTime), CAST(0x00009D2500EB95D0 AS DateTime), 0, 0, 2, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (652, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2335?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2335?l=1', N'OFFERED NORTHIAM SCHOOL SWEATSHIRTS X3-SANDHURST', N'I HAVE 3 NORTHIAM SCHOOL SWEATSHIRTS ALL 9-10 YEARS, THEY HAVE BEEN PACKED AWAY
FOR THE LAST 4 YEARS AS I NOW LIVE IN SANDHURST SO IF THE UNIFORM HASN''T CHANGED
SINCE THEN YOUR WELCOME TO THEM. 2 ARE OK I IS CHEWED ROUND THE CUFF BUT STILL
STICHABLE AND WEARABLE ! PLEASE LEAVE A LANDLINE NUMBER IF INTERESTED
LISA', CAST(0x00009D2500E59D40 AS DateTime), CAST(0x00009D2500ECF4AB AS DateTime), 0, 0, 1, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (653, 0, N'http://asfsdf', N'http://asfsdf', N'Bottle opener', N'I am based in the Old Town, part of Hastings you know.', CAST(0x00009D2501133520 AS DateTime), CAST(0x00009D2501139A7F AS DateTime), 0, 0, 1, 1, 10, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (654, 0, N'http://asfasdf.com', N'http://asfasdf.com', N'Hairy rug', N'i am in the old town, part of hastings, tn345re', CAST(0x00009D2501144E60 AS DateTime), CAST(0x00009D2501149DA5 AS DateTime), 0, 0, 1, 1, 10, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (655, 0, N'http://adfdd', N'http://adfdd', N'Door stopper', N'i am in hte old town - a part of hastings approx. situated in tn345da', CAST(0x00009D250115F440 AS DateTime), CAST(0x00009D25011639A0 AS DateTime), 0, 0, 1, 1, 10, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (656, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40765?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40765?l=1', N'OFFERED: Rotating Laptop / TV Stand with Shelves (Nr. Ore Village)', N'Hi,

Up for grabs a light coloured rotating laptop / TV stand with shelves in good
condition. Very useful but unfortunately now surplus to our needs.

If interested, please respond with land line number. (NO mobile numbers, thank
you.)

Jenny

P.S. Photos available - please see photos file', CAST(0x00009D2600A6B7B0 AS DateTime), CAST(0x00009D2600AC01C8 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (657, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40764?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40764?l=1', N'OFFERED: Metal Shopping Basket w/ Platic Covered Handles (Nr. Ore Village)', N'Up for grabs a silver metal coloured shopping basket with blue plastic covered
handles, good for carrying gardening tools perhaps?

If interested, please respond with land line number only (NO mobile numbers,
thank you).

Jenny', CAST(0x00009D2600AAD660 AS DateTime), CAST(0x00009D2600AC0217 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (658, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40763?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40763?l=1', N'Rec''d - dvd player Clive Vale.', N'Rec''d, with thanks, a dvd player.

Caroline, there was a Thomas the Tank Engine dvd in it. I know you are missing
it badly (hee, hee). I''m sending it into school tomorrow in a padded envelope
addressed to you via reception. The boys should bring it home.
Thank you again x.

[Non-text portions of this message have been removed]', CAST(0x00009D25017B93E0 AS DateTime), CAST(0x00009D2600AC0238 AS DateTime), 0, 0, 4, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (659, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40762?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40762?l=1', N'TAKEN - Greenhouse', N'Matt', CAST(0x00009D2501811220 AS DateTime), CAST(0x00009D2600AC0259 AS DateTime), 0, 0, 3, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (660, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40761?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40761?l=1', N'Offered. Laminate worktop offcut.1.9m length TN37', N'I have a 1.9m length of new work surface.
It is a large off cut from our kitchen.
It is in laminate Wenge Bonobo which is a very dark wood style.
It came from B&Q and is still available now.Please check their website for the
dimensions.
Perfect for anywhere that you can use a worktop.
It is heavy so will need transport and a strong person to lift it.
Collection from Bohemia area.
Thanks.', CAST(0x00009D26009D6110 AS DateTime), CAST(0x00009D2600AC026C AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (661, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40760?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40760?l=1', N'Taken STC - 25" TV - St Leonards', N'', CAST(0x00009D26009B2E90 AS DateTime), CAST(0x00009D2600AC028D AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (662, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40759?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40759?l=1', N'WANTED ... Tens Machine', N'Hello fellow freecyclers I know this may be a long shot but does anyone have a
tens machine they no longer require.. I am currently on the heavy side of
pregnant and my back has decided enough is enough though the baby is gaming for
more!!!!
So if anyone has one that requires a loving home and a tender back to take care
of please send it this way.
Many thanks.
Angie and bump =oD', CAST(0x00009D2600921E40 AS DateTime), CAST(0x00009D2600AC02A9 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (663, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40758?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40758?l=1', N'OFFERED', N'Offered..Graco pushchair,good condition,and 0-9 months baby car seat with
base,need to be collected ASAP as moving very soon.thanks.tasha', CAST(0x00009D26007D3E80 AS DateTime), CAST(0x00009D2600AC02C5 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (664, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40757?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40757?l=1', N'TAKEN: Box of videos', N'The box of videos have now been finally delivered.  Many thanks to Steve for his
patience.

Kind regards

Rowan





[Non-text portions of this message have been removed]', CAST(0x00009D26007B98A0 AS DateTime), CAST(0x00009D2600AC02E6 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (665, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40756?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40756?l=1', N'TAKEN: 28" TV', N'Hi All
Thank you to all those people who wanted the TV but it has now gone. Sorry to
all the others.
Paul

[Non-text portions of this message have been removed]', CAST(0x00009D25015333F0 AS DateTime), CAST(0x00009D2600AC0302 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (666, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40755?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40755?l=1', N'OFFERED: 25" TV - St Leonards', N'25" Tv, think its panasonic. NOT a flat screen, black. works fine. collection
from st leonards...please leave a contact number. mobiles fine', CAST(0x00009D250152A750 AS DateTime), CAST(0x00009D2600AC0319 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (667, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40754?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40754?l=1', N'Received Victorian tiles TN38', N'Thank you so much Bob for the hearth tiles, I am thrilled with them.
Regards
Sharon', CAST(0x00009D2501419FF0 AS DateTime), CAST(0x00009D2600AC033A AS DateTime), 0, 0, 5, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (668, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40753?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40753?l=1', N'Taken, Various , Sandhurst', N'All gone stc', CAST(0x00009D25014C0FD0 AS DateTime), CAST(0x00009D2600AC0356 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (669, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40752?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40752?l=1', N'REOFFERED: Large Sun Awning for Shop (TN34)', N'Hi, I am reoffering the awning to anyone interested.

The Hastings Pier & White Rock Trust have a shop awning on their shop, Arthur
Greens (on the seafront opposite the Ice Rink).The awning is a curved pull out style, the frame is metal and bolted to the
window frame (so quite heavy). Opened out, it looks similar to this awningWe were previously quoted approx £360 by South East blinds to get a new cover
made, but we don''t have the funding to do this, as well as pay for a new sign.

So, if anyone is interested in the awning for its frame (to get it recovered/get
money for scrap, etc), it is currently folded up over the shop window so
available to view anytime/measure up and remove.

Any interested parties, please contact me asap to save the Trust £70 for the
cost of disposal.  Please note, it will need 2+ strong types  to take it down.

Thanks very much

Angela
07768 456884', CAST(0x00009D25015D1730 AS DateTime), CAST(0x00009D2600AC036E AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (670, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40751?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40751?l=1', N'Wanted - Poster frame', N'I urgently need a poster frame (min 38" x 27").  Does anyone have one they don''t
want or need?

Fingers crossed.

Sandra

[Non-text portions of this message have been removed]', CAST(0x00009D2501384950 AS DateTime), CAST(0x00009D2600AC0393 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (671, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40750?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40750?l=1', N'WANTED : FUJIFILM BC-45A - DIGITAL CAMERA BATTERY CHARGER', N'WANTED : FUJIFILM BC-45A - DIGITAL CAMERA BATTERY CHARGER

Mine seems to have died after less than a year :(
Plugs into mains & charges flat rectangular type battery for Fujifilm Finepix
J10.

More than happy to collect,
thanks for reading

Paul', CAST(0x00009D2501373010 AS DateTime), CAST(0x00009D2600AC03AF AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (672, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40749?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40749?l=1', N'TAKEN: various computer bits', N'Gone to another freecycler who can use them.



[Non-text portions of this message have been removed]', CAST(0x00009D25013E0DE0 AS DateTime), CAST(0x00009D2600AC03CB AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (673, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40748?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40748?l=1', N'offered, two boxes catherine cookson books, ore', N'mostly paperbooks, might be a couple of doubles but not many.

thanks', CAST(0x00009D250135D080 AS DateTime), CAST(0x00009D2600AC03E8 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (674, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40747?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40747?l=1', N'RECIEVED: thank you', N'A big thank you to Mel for the clothes for my sisters two boys. they are made up
with them.
tadgh




[Non-text portions of this message have been removed]', CAST(0x00009D2501342AA0 AS DateTime), CAST(0x00009D2600AC0404 AS DateTime), 0, 0, 5, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (675, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40746?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40746?l=1', N'Wanted Urgently - Fridge Freezer & Wardrobes', N'Hi i am Moving into a property in the hastings area and am desperatly in need of
a fridge freezer and some wardrobes if anyone can help .
Thank you in advance
Stuart', CAST(0x00009D250100CE30 AS DateTime), CAST(0x00009D2600AC0420 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (676, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40745?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40745?l=1', N'OFFERED Greenhouse', N'6x4 greenhouse
dismantled and ready for collection
Clive Vale

Call Matt', CAST(0x00009D2500F73140 AS DateTime), CAST(0x00009D2600AC0441 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (677, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40744?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40744?l=1', N'Wanted - wardrobe or clothes rail', N'Hello

I would be interested in a old wardrobe or just a clothing rail - as I am
renting out rooms in my house.

Thanks
Maresa

Hastings TN34', CAST(0x00009D24011E31A0 AS DateTime), CAST(0x00009D2600AC045D AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (678, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40743?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40743?l=1', N'Wanted - Sky Cable + Fixings - Bexhill', N'Hi All

I need to move my Sky+ Box and need to extend the cable by about 1.5 metres.
Does anybody have any spare cable to do this and also the fixings to connect
them together. This would be a big help. I can collect.

Regards

Rick', CAST(0x00009D2500DBBA00 AS DateTime), CAST(0x00009D2600AC047E AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (679, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40742?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40742?l=1', N'offered Free kitchen', N'Free kitchen Appliances for local people in desperate situations.
Please go to our website to apply.
www.robin-hoodz.moonfruit.com', CAST(0x00009D24013DC790 AS DateTime), CAST(0x00009D2600AC049A AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (680, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40741?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40741?l=1', N'Bric-a-Brac etc Wanted for Charity Table Sale In Westham', N'Hi It''s that time of year again and I''ve been given the Bric-a-Brac, books and
Video/CD Stall at my Daughters Table Sale on 6th March at Westham Village hall,
for her Charity, Look Beyond the Heart, supporting Families in the aftermath of
organ transplantation.

I can collect pretty well anytime .
Many Thanks
Regards
Jim Langlands', CAST(0x00009D2500A20C60 AS DateTime), CAST(0x00009D2600AC04B6 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (681, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40740?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40740?l=1', N'Offered - Rabbit/guinea pig cage + bowl toys & food', N'I have a rabbit/guinea pig cage along with some toys and bowls, water bottle,
hay and rabbit food.  Cage size is approx 95 x 46 x 57 cm.', CAST(0x00009D2500FDC8C0 AS DateTime), CAST(0x00009D2600AC04D7 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (682, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40739?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40739?l=1', N'Wanted Office furniture', N'We are a local charitable organisation, about to move into new offices.

We need any office furniture you can spare.

We also need a computer, 2 moniters, a printer & telephone.

For information of what we do to help local people, please see our website:
www.robin-hoodz.moonfruit.com

fast local collection.

Thank you.
Graham
Robin Hoodz', CAST(0x00009D24013CAE50 AS DateTime), CAST(0x00009D2600AC04F7 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (683, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40738?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40738?l=1', N'wanted paving slabs', N'Hello everyone. With all this rain the area around my shed is sinking!!!! Has
anyone got paving slabs they no longer require. I could do with at least 6. So
if anybody could help!!!.Many Thanks. Diane.', CAST(0x00009D25012FC5A0 AS DateTime), CAST(0x00009D2600AC0522 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (684, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40737?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40737?l=1', N'WANTED: TN34 Cake decorating equipment', N'Hello, I have recently taken up cake decorating, but don''t have much equipment
yet. If anyone has anything they no longer use lurking in their cupboards, I
would be most grateful. Thanks, Jackie', CAST(0x00009D2501071F60 AS DateTime), CAST(0x00009D2600AC053E AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (685, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40736?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40736?l=1', N'Offered: Grill and Wanted: Fire Grate Battle Road Area', N'Wanted: small fire grate and grate surround.If any one has one it would be much
appreciated.
Offered:healthy grill -like george forman type- mid size,silver, good condition
but lost tray to catch drips - not really a problem.
thanks', CAST(0x00009D2500B1FA80 AS DateTime), CAST(0x00009D2600AC055A AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (686, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3560?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3560?l=1', N'Wanted TN35 4HY Pett Gramophone player, to play old 1930;''s ( 78''s)', N'I have inherited a box of old 78 gramophone records and would like to play them.
Does anyone have an old wind up, or turntable that will play 1930''s,
78 records, they no longer have use for?', CAST(0x00009D250112EED0 AS DateTime), CAST(0x00009D2600AC0C09 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (687, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3559?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3559?l=1', N'Taken, Various , Sandhurst', N'All gone stc', CAST(0x00009D25014C5620 AS DateTime), CAST(0x00009D2600AC0C2A AS DateTime), 0, 0, 3, 1, 15, 2)
GO
print 'Processed 500 total records'
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (688, 0, N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2336?l=1', N'http://groups.yahoo.com/group/Cranbrook_Freecycle/message/2336?l=1', N'Taken, Various , Sandhurst', N'All gone stc', CAST(0x00009D25014C5620 AS DateTime), CAST(0x00009D2600AC0F71 AS DateTime), 0, 0, 3, 1, 15, 3)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (689, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40766?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40766?l=1', N'RECIEVED: sewing machine', N'Hi there!
thank you to Sharon for the sewing machine.
Wish me luck!!
Caz




[Non-text portions of this message have been removed]', CAST(0x00009D2600AB6300 AS DateTime), CAST(0x00009D2600AD326F AS DateTime), 0, 0, 5, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (690, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40767?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40767?l=1', N'OFFERED. X FILES.', N'LARGE SELECTION OF THE X FILES VIDEO''S UP FOR GRABS, IF YOU LIKE THE UFO STUFF,
IVE SEEN''EM ALL A THOUSAND TIMES SO THEY MUST GO, I NEED THE SPACE.', CAST(0x00009D2600B054A0 AS DateTime), CAST(0x00009D2600B4C415 AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (691, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40768?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40768?l=1', N'WANTED!! Tumble dryer and chest of drawers', N'Can anyone help please! Mine died on me and all the new baby gear is hogging the
room spare in the drawers we have already. If you can help I am willing to give
these items a loving home. Can collect. Many thanks. Angie and Rich =o)', CAST(0x00009D2600B42D00 AS DateTime), CAST(0x00009D2600B6415F AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (692, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40769?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40769?l=1', N'WANTED please moving boxes', N'Hi, anyone out there with any moving boxes up for grabs! thanks in advance.', CAST(0x00009D2600BE1040 AS DateTime), CAST(0x00009D2600C44B08 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (693, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40771?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40771?l=1', N'OFFERED', N'OFFERED..2 black bags full of boys toys,cars,baby toys,cuddly toys.Activity
table,monkey bandstand,plays tunes reggae style,lights etc.
FREEVIEW BOX,all working order.tasha..must go ASAP,moving soon.

**Please remove telephone numbers before posting on the list**', CAST(0x00009D2600CA2600 AS DateTime), CAST(0x00009D2600CF2D2E AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (694, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40770?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40770?l=1', N'OFFERED: HANDMADE POTTERY DISH & BAG OF ASSORTED "STUFF"- CLIVE VALE', N'Hi Everyone,



I have a lovely blue and green stripes large round flatish dish - its approx 13"
in diameter, with a 2" rise all the way round.   Its really nice, I just have
nowhere to put it really.



Would anybody like it?



Also a bag of assorted bits and pieces - includes a baby journal, a couple of
mens shirts, a 35mm camera, couple of baby bits - allsorts really - all to go as
one lot please.



Rose xx

_________________________________________________________________
Tell us your greatest, weirdest and funniest Hotmail stories[Non-text portions of this message have been removed]', CAST(0x00009D2600C8C670 AS DateTime), CAST(0x00009D2600CF2D7D AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (695, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40772?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40772?l=1', N'TAKEN: Subject to Collection Rotating Laptop / TV Stand (Nr. Ore Village)', N'Many thanks to all those who expressed an interest but the stand has already
gone (subject to collection later today).

Jenny', CAST(0x00009D2600CF17A0 AS DateTime), CAST(0x00009D2600D34AE1 AS DateTime), 90.123123, 90.12434, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (696, 0, N'http://asdfsdfasdf.com', N'http://asdfsdfasdf.com', N'Offered: A nice bath and spoon set', N'i am based in the old town, a part of hastings you know.', CAST(0x00009D2600D33650 AS DateTime), CAST(0x00009D2600D3E4DD AS DateTime), 50.923423, 0.5923423, 1, 1, 10, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (697, 0, N'http://asdfsd.cdaf', N'http://asdfsd.cdaf', N'Wanted: Video cassette', N'I am in brede', CAST(0x00009D2600D3C2F0 AS DateTime), CAST(0x00009D2600D453CC AS DateTime), 90.123123, 90.12434, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (698, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40773?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40773?l=1', N'OFFERED', N'offered...Baby slide,water and sand table,night garden ride along car,4 black
bags of play balls...to collect ASAP..tasha.', CAST(0x00009D2600D70EB0 AS DateTime), CAST(0x00009D2600E0A7B2 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (699, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40775?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40775?l=1', N'RECEIVED: Children''s videos', N'Thanks Rowan! Videos received by Oxfam bookshop', CAST(0x00009D2600D3C2F0 AS DateTime), CAST(0x00009D2600DA2745 AS DateTime), 90.123123, 90.12434, 5, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (700, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40774?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40774?l=1', N'tAKEN', N'thanks to all that showed great interest in pushchair and baby seat,now have
both gone(picking up tonite)
tasha.', CAST(0x00009D2600D4DC30 AS DateTime), CAST(0x00009D2600DA2774 AS DateTime), 90.123123, 90.12434, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (701, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40776?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40776?l=1', N'OFFERED : PORTMEIRION TOTEM POTTERY - CLIVE VALE', N'Hiya !!



I have a brown Portmeirion Totem Storage jar - with no lid - has a small crack
at top - but otherwise fine up for grabs !!



Any takers ????



Rose x

_________________________________________________________________
Got a cool Hotmail story? Tell us now[Non-text portions of this message have been removed]', CAST(0x00009D2600D9CDD0 AS DateTime), CAST(0x00009D26011A3BC0 AS DateTime), 50.856123, 0.578795, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (704, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40777?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40777?l=1', N'offered:" Loving what is" by Byron Katie TN38', N'You may have had this book recommended to you - it''s apparently a great read to
help with depression, mental and emotional difficulties and I''d like someone
special to have it - maybe YOU?!! (Can''t vouch for it personally as I bought it
in a jumble sale thinking it was something else!) From Jill', CAST(0x00009D2600E0ABA0 AS DateTime), CAST(0x00009D2600E804FD AS DateTime), 0, 0, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (706, 0, N'http://asdfasdf.co.uk', N'http://asdfasdf.co.uk', N'Offered: a nice bath', N'i am in brede', CAST(0x00009D2600EBA820 AS DateTime), CAST(0x00009D2600EC0709 AS DateTime), 50.93577012, 0.596790165, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (707, 0, N'http://asdfasdfsdaf.comadf', N'http://asdfasdfsdaf.comadf', N'bottle and glass', N'i am in brede', CAST(0x00009D2600EC7B10 AS DateTime), CAST(0x00009D2600ECD015 AS DateTime), 50.95173664, 0.73565416, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (708, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40780?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40780?l=1', N'OFFERED=lemon paint and bubble bath machine', N'hi guys i have up for grabs the following---
a nearly full 2.5L tub of focus lemon fizz silk emulsion lovely colour

and

  a bubble bath machine, its pink and makes lots of bubbles for your bath! i got
this for my 18month old daughter thinking shed love it but she hats it! lol

pick up near tescos, hollington xxxx', CAST(0x00009D260103D3A0 AS DateTime), CAST(0x00009D260113D9C0 AS DateTime), 50.87829977, 0.545000061, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (709, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40779?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40779?l=1', N'offered, for dummies books, ore', N'hi,

   i have got windows vista.... internet for..... macs for... and windows XP for
dummies,

    thanks', CAST(0x00009D2600FD3C20 AS DateTime), CAST(0x00009D260113DA01 AS DateTime), 50.87010026, 0.611899719, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (710, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40778?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40778?l=1', N'TAKEN: CLIVE VALE', N'Hello



Bag of "stuff" and Portmeirion Pottery taken - thanks Keith for collecting so
promptly !!!    Hope you can make use of some if not all of it !!



Rose x

_________________________________________________________________
Got a cool Hotmail story? Tell us now[Non-text portions of this message have been removed]', CAST(0x00009D2600FB9640 AS DateTime), CAST(0x00009D260113DA27 AS DateTime), 50.856123, 0.578795, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (711, 0, N'http://asfasdfc', N'http://asfasdfc', N'Testing: bath water', N'i am in brede (or am i really in london?)', CAST(0x00009D26011A12F0 AS DateTime), CAST(0x00009D26011A85A8 AS DateTime), 51.534717455506325, -0.11869378387928008, 1, 1, 20, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (712, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40787?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40787?l=1', N'OFFERED: Rabbit accesories', N'Wooden folding run approx 2m x 1m
Steel mesh collapsable run approx 1m x 1.5m
Rabbit food
Large bag of wood shavings
Small bags of straw and hay', CAST(0x00009D26016B5F70 AS DateTime), CAST(0x00009D2700B7F65C AS DateTime), 50.85612327, 0.578795224, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (714, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40786?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40786?l=1', N'WANTED', N'Double bed frame and clean mattress..can collect...many thanks.', CAST(0x00009D26011FD780 AS DateTime), CAST(0x00009D2700B251D3 AS DateTime), 0, 0, 2, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (718, 0, N'http://testss', N'http://testss', N'TAKEN - Avent Newborn Starter Set - Nr Marden', N'i am in brede not hastings', CAST(0x00009D2700B61930 AS DateTime), CAST(0x00009D2700B6EEF7 AS DateTime), 50.83577012, 0.696790165, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (719, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40785?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40785?l=1', N'wanted', N'hi does anybody have a freeveiw box they no longer need please my one has given
up and no longer wants to work thank you i live tn34', CAST(0x00009D26012C3390 AS DateTime), CAST(0x00009D2700B7B49B AS DateTime), 50.87134346, 0.586471707, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (720, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40784?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40784?l=1', N'Offered - large blue rug / dble headboard', N'Hi all, 

I have often seen requests for large rugs and I have come across one in my
garage,  is not in bad condition - no damp or anything but may have couple of
marks is plain blue.

also I have a double headboard which may be of use to someone- it would need
recovering , is buttoned material and if no-one can rehome will be off to the
dump by the weekend.

I may be able to drop off locally.

Thanks for reading
Lucie
West st Leos




[Non-text portions of this message have been removed]', CAST(0x00009D26014B8330 AS DateTime), CAST(0x00009D270154A705 AS DateTime), 50.856747, 0.547596, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (721, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40783?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40783?l=1', N'taken calor gas heater and bbq', N'sorry to all those who missed out', CAST(0x00009D26014B8330 AS DateTime), CAST(0x00009D2700B7B4E6 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (722, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40782?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40782?l=1', N'received trampoline', N'Many thanks to Julia, not only for the trampoline but for her patience in us
collecting, thank you!




[Non-text portions of this message have been removed]', CAST(0x00009D2601586BE0 AS DateTime), CAST(0x00009D270155033B AS DateTime), 0, 0, 5, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (723, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40781?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40781?l=1', N'OFFERED Assorted items from Loft clearance', N'* Top half of Gerbil cage, to fit over approx 40x26 cm base. We used it over a
plastic fishtank. Also a water dish and wheel
* Baskets from defunct Lec freezer. we meant to mount on runners and use as
storage, but didn''t get round to it.
* Shelves etc from defunct Lec fridge.
* Small wooden abacus
* Set for starting off plant cuttings, looks lika a set of bulbous test tubes in
a stand.
* Quantity of assorted shells and a few pieces of mineral.
* 4 short screw-in legs with castors, originally from a ''stack away'' bed
* Wipe clean/waterproof table covering. Well used, great for children''s painting
sessions, hence the paint splodges on it.  Approx 1x1.5 metres
* Swivel arm support for telephone, to attach to a desk. In battered box, with
instructions.
* Baby Activity Pool, (ex ELC). With box, working when last used some years ago.
Should be complete with sunshade and toys, but haven''t undone it to check.

Central Hastings, to be collected as soon as possible please. Communication by e
mail only, please do not ask me to phone you. Thanks', CAST(0x00009D26012B1A50 AS DateTime), CAST(0x00009D2700B7B51A AS DateTime), 50.85612327, 0.578795224, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (724, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40788?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40788?l=1', N'OFFERED: Various for kids - see below: TN34', N'Plug n'' Play Xtreme Super Games comprising

Joystick games console; Joypad for Player 2; IR Light Gun; AV Connecting Cable;
Battery box and AC Adaptor + instruction leaflet.

This is somewhat dated (circa late 1990s), preceding both PS2, Wii, etc etc but
if your budget won''t run to any of the above then this is ideal.  Plugs directly
into your TV set with the main console holding  circa. 75 games (if memory
serves).  Anyhow only used by the grandchildren and they have now outgrown this.

Also:

Dorling Kindersley Hardback (1994 edition) "History of the World" book in great
condition; and

Usborne Facts of Life "Growing Up" - (adolescence, body changes, etc etc)
suitable for 10 years upwards.

If interested in any of the above drop me a line and I''ll get back to you as
soon as I am able!', CAST(0x00009D2700D9CDD0 AS DateTime), CAST(0x00009D2700DB68C6 AS DateTime), 50.87134346, 0.586471707, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (725, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40828?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40828?l=1', N'taken', N'baby swing and small trampoline gone.', CAST(0x00009D2800B1FA80 AS DateTime), CAST(0x00009D2800E81222 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (726, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40827?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40827?l=1', N'wanted..dishwasher..please if anyone has one they dont want..Mine has broken..', N'Hi all

Hoping some lovely freecycler has one going spare..Mine has given up the ghost

I would be very grateful

thank you', CAST(0x00009D28009C47D0 AS DateTime), CAST(0x00009D2800E81289 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (727, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40826?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40826?l=1', N'Offered: 3 Drawer dressing table with Mirror', N'Hi All,
Due to an upgrade,  we have on offer an old, dark wood 3 drawer dressing table
with some inlaid marquetry around the edges.
Overall it is in good condition apart from the top surface, which  has a split
where the wood was joined......
It is  93cm  long   x   47cm  wide    and  81 high
Location West St Leonards
Thanks
Bob





[Non-text portions of this message have been removed]', CAST(0x00009D2800D98780 AS DateTime), CAST(0x00009D2800E812A5 AS DateTime), 50.85674688, 0.54759644, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (728, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40825?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40825?l=1', N'Desperately wanted!!', N'Hi everyone,

I work for a charity based locally, called Ufosa Foundation.  We desperately
need any good quality clothing, bric a brac, and in particular, furniture.  If
you have anything please could you let me know?  Anything would be fantastic!

We also really need any shop fittings, or dress dummies.

You can either email me, or call on 01424 223 700

If you would like to know more about us, visit our website
www.ufosafoundation.org.

We are a registered charity, number 1118416.

Thank you in advance,

Becky

[Non-text portions of this message have been removed]', CAST(0x00009D27013284C0 AS DateTime), CAST(0x00009D2800E812D4 AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (729, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40824?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40824?l=1', N'Offered Blue O''baby buggy.', N'Needs a scrub but fully functional..with Rain cover.Its light blue stroller with
lie back positions ..', CAST(0x00009D28009CD470 AS DateTime), CAST(0x00009D2800E812F5 AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (730, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40823?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40823?l=1', N'TAKEN KS2/3 history books', N'These now have gone - thanks to Deborah for what is the fastest freecycle
collection I''ve experienced. And my apologies to the many other freecyclers who
also emailed me. Ann', CAST(0x00009D2800BFFC70 AS DateTime), CAST(0x00009D2800E81311 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (731, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40822?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40822?l=1', N'Wanted', N'Hi,is there anyone out there that has an extended dining room table,if with
chairs then even better as moving to a much bigger house and gota find furniture
to fill it.
Also any oak furniture would be great too.
Fingers crossed.tasha', CAST(0x00009D28009B74E0 AS DateTime), CAST(0x00009D2800E8132D AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (732, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40821?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40821?l=1', N'want want want - ph level meter, toilet seat hinges, gerald brenan spain books', N'A bit more greedy and obscure than usual....

I am after a ph soil tester meter...
A white toilet seat or just the hinges for the seat should be enough...
Any of Gerald Brenan''s books on spain....

Please!
Thanks, Anton.', CAST(0x00009D2701659AE0 AS DateTime), CAST(0x00009D2800E8134E AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (733, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40820?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40820?l=1', N'WANTED : Portable PA system', N'Hi everyone,

Does anybody have a small portable PA system they no longer want or need?
We have a parents & toddlers group where we do singing and stories, but the
number of children coming (up to 30) can make the ambient noise level quite
loud. In order to help us preserve our vocal chords we need help!

It''s a longshot but if you can help, please get in touch.

Thanks

Mike', CAST(0x00009D2800C693F0 AS DateTime), CAST(0x00009D2800E8136A AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (734, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40819?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40819?l=1', N'Wanted - Single Bed Frame - Any Area', N'Wanted a single bed frame for my friends daughter as her''s broke the other day &
she is now sleeping on her mattress on the floor.

Any area as can collect.

Thanks,
Odette', CAST(0x00009D2800C5C100 AS DateTime), CAST(0x00009D2800E8138B AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (735, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40818?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40818?l=1', N'TAKEN- bubble machine- still OFFERED lemon paint', N'any takers on the paint?', CAST(0x00009D2800B00E50 AS DateTime), CAST(0x00009D2800E813AC AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (736, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40817?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40817?l=1', N'taken', N'travel cot gone,thanks.tasha', CAST(0x00009D2800D4DC30 AS DateTime), CAST(0x00009D2800E813C8 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (737, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40816?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40816?l=1', N'TAKEN: STC - Various for kids inc. Xtreme Games Console : TN34', N'', CAST(0x00009D2800D70EB0 AS DateTime), CAST(0x00009D2800E813E4 AS DateTime), 50.87134346, 0.586471707, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (738, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40815?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40815?l=1', N'OFFERED: bag of bags', N'there is two small backpacks and two shoulder bags. there are a couple more i
think. From TN38 area.
      Viki', CAST(0x00009D27012741F0 AS DateTime), CAST(0x00009D2800E81447 AS DateTime), 50.86594217, 0.529597476, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (739, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40814?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40814?l=1', N'TAKEN: KING SIZE BED FRAME - CLIVE VALE', N'Hi ALL



The King size bed frame has been claimed - subject to collection.   Sorry to all
others that were interested.



Regards,



Rose

Clive Vale

_________________________________________________________________
We want to hear all your funny, exciting and crazy Hotmail stories. Tell us now[Non-text portions of this message have been removed]', CAST(0x00009D270130DEE0 AS DateTime), CAST(0x00009D2800E8147F AS DateTime), 50.856123, 0.578795, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (740, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40813?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40813?l=1', N'TAKEN - Rabbit Accessories (40787)', N'Thanks for all the interest but they have been taken.', CAST(0x00009D27015C8A90 AS DateTime), CAST(0x00009D2800E814A0 AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (741, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40812?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40812?l=1', N'offering', N'Ride-on for toddler, need to go before my see it as hes to big for it now, TN35

[Non-text portions of this message have been removed]', CAST(0x00009D27012CC030 AS DateTime), CAST(0x00009D2800E814BC AS DateTime), 50.89661323, 0.635769367, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (742, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40811?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40811?l=1', N'TAKEN printer cartridges', N'Printer cartridges now gone. Thanks to Jeny for prompt collection. Ann', CAST(0x00009D2701772EE0 AS DateTime), CAST(0x00009D2800E814DD AS DateTime), 0, 0, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (743, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40810?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40810?l=1', N'OFFERED Key Stage 2 history resources West Hill Hastings', N'I have three KS2 &3 history resources for anyone who would like them. They''re
in perfect condition. Very useful, easy to use and could save a parent some
money.

* History: covers all topics and facts, includes exercises (WH Smith)
* History 6: Victorian Britain; Victorian local history; Britain since 1948
(Scholastic)
• History II: Life in Tudor Times; Victorian Britain; Britain since 1930; Local
History.

Ann', CAST(0x00009D27017801D0 AS DateTime), CAST(0x00009D2800E814F9 AS DateTime), 50.856123, 0.578795, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (744, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40809?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40809?l=1', N'TAKEN (sorry): Anti-snore/neck pillow (Bexhill)', N'WOW! I can''t believe how many snorers there are out there!!! I''m so sorry, but
this has gone subject to collection.
It was on offer in the big Tesco at Hollington, if that helps anyone at all!
Wish I had more of them :o(', CAST(0x00009D27016208D0 AS DateTime), CAST(0x00009D2800E8151E AS DateTime), 50.87829977, 0.545000061, 3, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (745, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40808?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40808?l=1', N'Recieved- with thanks--Rabbit cage, hay etc', N'Thank you so much nita.', CAST(0x00009D28006B1DE0 AS DateTime), CAST(0x00009D2800E8153F AS DateTime), 0, 0, 5, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (746, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40807?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40807?l=1', N'OFFERED', N'Hi..I have 3 black bags of Boys toys.
     travel Cot,used alot but does its job!', CAST(0x00009D270142B930 AS DateTime), CAST(0x00009D2800E8155B AS DateTime), 0, 0, 1, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (747, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40806?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40806?l=1', N'WANTED - OLD PC GAMES', N'I am after any old PC games, DOS or windows95, that are not longer needed', CAST(0x00009D2700C115B0 AS DateTime), CAST(0x00009D2800E8157C AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (748, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40805?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40805?l=1', N'OFFERED: VARIOUS - CLIVE VALE', N'Hiya

I have a pair of boys sandals, size 5

a pair of girls boots, black fake suede with fur trim on front, little bit
scuffed, but lots of wear left in em - size 1

Small furry santa sack - with his face on the front

purple/lilac "Lets Party" shoulder bag - never been used, still has the tag on
it !!



And a bed guard !!!





thats all for now !!!!



Rose x


_________________________________________________________________
Send us your Hotmail stories and be featured in our newsletter[Non-text portions of this message have been removed]', CAST(0x00009D2700EDDAA0 AS DateTime), CAST(0x00009D2800E81598 AS DateTime), 50.856123, 0.578795, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (749, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40804?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40804?l=1', N'taken', N'sand and water pit,balls,slide gone.thankyou for taking away.', CAST(0x00009D2700EEF3E0 AS DateTime), CAST(0x00009D2800E815C2 AS DateTime), 0, 0, 3, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (750, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40803?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40803?l=1', N'WANTED PLEASE', N'HI DOES ANYONE HAVE ANY SKI GLASSES (NOT GOGGLES) FOR A TEENAGER OFF TO THE
SLOPES, MANY THANKS PAT.', CAST(0x00009D2700AF81B0 AS DateTime), CAST(0x00009D2800E815DA AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (751, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40802?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40802?l=1', N'RECIEVED: MANY THANKS NATASHA', N'For the Baby slide,water and sand table,night garden ride along car,4 black bags
of play balls, I''m sure my granddaughters will have fun with these.', CAST(0x00009D2701126230 AS DateTime), CAST(0x00009D2800E815F6 AS DateTime), 0, 0, 5, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (752, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40801?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40801?l=1', N'WANTED: WORKING PAPER SHREDDER', N'Hi all, I have tones of paper to recycle BUT I have animals who need shredded
paper, does anyone have a WORKING shredder they would like to get rid of?  I
have actually collected one before but it didnt work so would really apreciate
one that did work, im not techi enough to fix them.
Thank you in advance
Mollx

[Non-text portions of this message have been removed]', CAST(0x00009D2701243C80 AS DateTime), CAST(0x00009D2800E8161B AS DateTime), 0, 0, 2, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (753, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40800?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40800?l=1', N'TAKEN : 3 ''bombo'' style barstools - Sedlescombe', N'Apologies to some, but these have now gone', CAST(0x00009D270101E770 AS DateTime), CAST(0x00009D2800E8163C AS DateTime), 50.93554616, 0.532415807, 3, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (754, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40799?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40799?l=1', N'OFFERED TN35 ( Westfield) various', N'Chicken manure. Please being bags. There is probably about 6 or 7 bags. There
was a lady that wanted some when I offered a while ago and I have lost your
address. Sorry
Sofa bed for children in brown similar to Argos page 192 old catalogue. Winter
2009. There are a couple tears on the side could be sewn up I think. But
cushions are all in excellent condition and was in facthardly used. Would make
ideal sleepover bed for kids', CAST(0x00009D2701099830 AS DateTime), CAST(0x00009D2800E81658 AS DateTime), 50.89661323, 0.635769367, 1, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (755, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3565?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3565?l=1', N'Offered - Table and curtains - Lydd on Sea', N'Hi folks,

We have the following on offer:

A pair of  dusky pink / lilac curtains. Pencil pleat. Fully lined.  Each curtain
approx size 102" width -  83" drop.

A pair of dusky pink / lilac curtains. Pencil pleat. Fully lined. Each curtain
approx size 52" width -  83" drop.

A pair of green patterned curtains. Green background with bird design in
brown/beige/cream. Pencil pleat.  Each curtain approx size 9ft wide - 7ft drop.

A pair of green patterned curtains. Green background with bird design in
brown/beige/cream.  Pencil pleat.  Each curtain approx size 6ft 6in wide - 7ft
drop.

A kitchen table with 6 chairs.   Oval shape.   Approx size 5ft x 33".

Pictures available of curtains and table.

Thanks for reading.

Dawn', CAST(0x00009D2800C72090 AS DateTime), CAST(0x00009D2800E81CF0 AS DateTime), 50.95034391, 0.903744847, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (756, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3564?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3564?l=1', N'Wanted in Ashford Kent small Electric Dog Training Collar to fit a yorkie', N'Wanted in Ashford Kent small Electric Dog Training Collar  to fit a yorkie', CAST(0x00009D2800B54640 AS DateTime), CAST(0x00009D2800E81D1A AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (757, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3563?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3563?l=1', N'Offered - Kitchen stools and Wedgewood - Lydd on Sea', N'Hi folks,

The clear out continues and we have the following items no longer required:

•Wedgewood – Angela design.   An oval plate and a round trinket bowl with lid. 
Suitable for dressing table etc.

•Two high backed kitchen bar stools. Beech and chrome colour.



Thanks for reading.


Dawn', CAST(0x00009D27012814E0 AS DateTime), CAST(0x00009D2800E81D36 AS DateTime), 50.95034391, 0.903744847, 1, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (758, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3562?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3562?l=1', N'Wanted: Chicken wire to fence in my 74ft x 74 ft garden', N'Wanted Urgent Chicken wire to fence in my 74ft x 74 ft garden so we can re-home
a rescue dog, in total we need about 250ft if any one has this kicking about
that they don''t need any more', CAST(0x00009D2700D5F570 AS DateTime), CAST(0x00009D2800E81D57 AS DateTime), 0, 0, 2, 1, 15, 2)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostLatitude], [PostLongitude], [PostCategoryId], [PostDisplay], [UserId], [FeedId]) VALUES (759, 0, N'http://groups.yahoo.com/group/ryefreecycle/message/3561?l=1', N'http://groups.yahoo.com/group/ryefreecycle/message/3561?l=1', N'TAKEN - Dwell bedroom unit and fire surround, Camber', N'', CAST(0x00009D28008D2CA0 AS DateTime), CAST(0x00009D2800E81D78 AS DateTime), 50.93592502, 0.79583019, 3, 1, 15, 2)
SET IDENTITY_INSERT [dbo].[Posts] OFF
/****** Object:  UserDefinedFunction [dbo].[NearestMessages]    Script Date: 02/25/2010 17:11:39 ******/
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
/****** Object:  Table [dbo].[PostTags]    Script Date: 02/25/2010 17:11:38 ******/
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
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (29, 43, 19)
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
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (49, 96, 20)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (50, 97, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (51, 95, 31)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (52, 86, 32)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (53, 85, 33)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (54, 97, 34)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (55, 97, 35)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (56, 97, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (57, 94, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (58, 94, 38)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (59, 94, 39)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (60, 89, 40)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (61, 89, 41)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (62, 96, 42)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (63, 92, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (64, 92, 44)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (65, 92, 45)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (66, 92, 46)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (67, 87, 47)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (68, 87, 48)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (69, 88, 49)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (70, 93, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (71, 93, 51)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (72, 91, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (73, 91, 53)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (74, 90, 54)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (75, 61, 55)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (76, 61, 56)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (77, 62, 57)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (78, 62, 58)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (80, 64, 59)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (81, 64, 60)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (82, 65, 41)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (83, 65, 61)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (84, 66, 62)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (85, 66, 63)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (86, 67, 64)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (87, 67, 65)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (88, 69, 64)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (89, 69, 66)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (90, 69, 67)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (91, 69, 32)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (92, 69, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (93, 69, 69)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (94, 70, 70)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (95, 70, 71)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (96, 73, 72)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (97, 73, 73)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (98, 78, 74)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (99, 78, 75)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (101, 78, 76)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (102, 75, 58)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (103, 75, 30)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (104, 82, 77)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (105, 79, 78)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (106, 76, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (107, 55, 79)
GO
print 'Processed 100 total records'
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (108, 81, 80)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (109, 77, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (110, 77, 53)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (111, 28, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (112, 28, 67)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (113, 28, 32)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (114, 28, 81)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (115, 28, 82)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (116, 28, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (117, 28, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (124, 148, 57)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (125, 148, 58)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (126, 151, 20)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (130, 195, 26)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (131, 195, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (133, 200, 54)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (134, 258, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (135, 259, 63)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (136, 269, 72)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (137, 270, 20)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (138, 270, 42)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (139, 271, 7)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (140, 271, 8)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (141, 271, 14)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (142, 271, 35)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (143, 271, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (144, 271, 78)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (145, 273, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (146, 273, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (147, 276, 69)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (148, 269, 85)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (149, 269, 86)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (150, 269, 87)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (161, 283, 47)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (162, 283, 54)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (163, 284, 85)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (164, 284, 86)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (165, 284, 87)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (167, 291, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (168, 305, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (169, 309, 53)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (170, 311, 35)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (171, 311, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (172, 311, 54)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (173, 312, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (174, 315, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (175, 315, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (176, 317, 80)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (177, 318, 53)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (178, 319, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (179, 319, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (180, 321, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (181, 323, 19)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (182, 324, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (183, 325, 41)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (184, 325, 61)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (185, 325, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (186, 326, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (187, 328, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (188, 328, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (189, 330, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (190, 330, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (191, 331, 13)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (192, 331, 17)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (193, 331, 64)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (194, 332, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (195, 332, 39)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (196, 332, 77)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (197, 333, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (198, 306, 88)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (199, 306, 89)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (200, 306, 90)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (201, 307, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (202, 310, 91)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (203, 336, 41)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (204, 336, 87)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (205, 335, 92)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (212, 338, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (213, 338, 32)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (214, 338, 34)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (215, 338, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (216, 338, 56)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (217, 338, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (218, 339, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (219, 339, 44)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (220, 339, 32)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (221, 339, 116)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (222, 339, 125)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (223, 340, 124)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (224, 341, 107)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (225, 342, 20)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (226, 342, 42)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (227, 344, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (228, 344, 13)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (229, 344, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (230, 344, 67)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (231, 346, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (232, 346, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (233, 346, 116)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (234, 347, 35)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (235, 347, 54)
GO
print 'Processed 200 total records'
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (236, 348, 75)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (237, 348, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (238, 348, 122)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (239, 348, 158)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (240, 349, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (241, 349, 34)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (242, 349, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (243, 350, 135)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (244, 351, 137)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (245, 352, 75)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (246, 353, 112)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (247, 354, 111)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (248, 355, 75)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (249, 355, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (250, 356, 125)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (251, 356, 159)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (252, 356, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (253, 357, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (254, 357, 149)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (255, 357, 158)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (256, 358, 123)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (257, 359, 47)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (258, 360, 137)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (259, 361, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (260, 361, 34)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (261, 361, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (262, 363, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (263, 363, 20)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (264, 363, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (265, 365, 29)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (266, 365, 125)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (267, 365, 30)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (268, 365, 154)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (269, 367, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (270, 367, 149)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (271, 341, 162)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (272, 345, 163)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (273, 348, 164)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (274, 343, 165)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (275, 358, 166)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (276, 358, 167)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (277, 349, 168)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (278, 349, 169)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (279, 349, 170)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (280, 352, 183)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (281, 352, 184)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (282, 347, 185)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (283, 342, 186)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (284, 342, 187)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (285, 340, 188)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (286, 351, 189)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (287, 355, 190)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (288, 359, 183)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (289, 359, 191)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (290, 357, 192)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (291, 357, 193)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (292, 357, 190)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (293, 357, 194)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (294, 357, 195)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (295, 357, 196)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (296, 364, 197)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (297, 364, 198)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (298, 363, 199)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (299, 363, 200)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (300, 362, 182)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (301, 362, 201)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (302, 362, 202)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (303, 362, 177)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (304, 365, 203)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (305, 368, 204)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (306, 366, 205)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (307, 366, 206)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (308, 336, 128)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (309, 369, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (310, 369, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (311, 369, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (312, 369, 121)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (313, 369, 69)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (314, 369, 100)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (315, 369, 116)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (316, 369, 135)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (317, 369, 53)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (318, 369, 85)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (319, 369, 175)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (320, 369, 118)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (321, 370, 171)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (322, 370, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (323, 370, 39)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (324, 370, 125)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (325, 370, 107)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (326, 370, 133)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (327, 370, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (328, 370, 168)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (329, 371, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (330, 371, 85)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (331, 371, 167)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (332, 371, 166)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (333, 371, 123)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (334, 372, 107)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (335, 372, 175)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (336, 373, 117)
GO
print 'Processed 300 total records'
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (337, 373, 69)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (338, 339, 207)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (339, 339, 208)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (340, 339, 209)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (341, 339, 210)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (342, 339, 211)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (343, 339, 212)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (344, 339, 213)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (345, 339, 214)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (346, 339, 215)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (347, 339, 216)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (348, 339, 217)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (349, 339, 218)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (350, 339, 219)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (351, 339, 220)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (352, 339, 221)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (353, 339, 222)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (354, 339, 223)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (355, 339, 224)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (356, 339, 225)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (357, 339, 226)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (358, 339, 227)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (359, 339, 228)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (360, 339, 229)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (361, 339, 230)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (363, 339, 232)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (364, 339, 233)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (365, 339, 234)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (366, 339, 235)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (367, 339, 236)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (368, 339, 237)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (369, 339, 238)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (370, 339, 239)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (371, 339, 240)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (372, 339, 241)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (373, 339, 242)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (374, 339, 243)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (375, 339, 244)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (376, 339, 245)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (377, 339, 246)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (378, 339, 247)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (379, 339, 248)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (380, 339, 249)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (381, 339, 250)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (382, 339, 251)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (383, 339, 252)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (384, 339, 253)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (385, 339, 254)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (386, 339, 255)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (387, 373, 256)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (390, 369, 258)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (391, 369, 259)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (392, 369, 260)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (393, 369, 261)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (395, 370, 263)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (396, 370, 264)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (397, 370, 265)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (398, 374, 205)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (399, 374, 53)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (400, 375, 34)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (401, 375, 103)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (402, 376, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (403, 376, 58)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (404, 376, 31)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (405, 377, 192)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (406, 377, 132)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (407, 377, 178)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (408, 377, 19)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (409, 377, 264)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (410, 378, 87)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (411, 379, 171)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (412, 379, 19)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (413, 379, 103)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (414, 379, 148)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (415, 380, 27)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (416, 380, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (417, 380, 38)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (418, 380, 184)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (419, 380, 39)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (420, 381, 29)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (421, 381, 184)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (422, 381, 133)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (423, 381, 179)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (424, 378, 276)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (425, 374, 277)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (426, 381, 278)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (427, 381, 279)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (428, 381, 280)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (429, 381, 281)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (430, 381, 282)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (431, 380, 283)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (432, 382, 122)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (433, 382, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (434, 383, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (435, 383, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (436, 385, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (437, 386, 249)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (438, 387, 273)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (439, 387, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (440, 388, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (441, 388, 203)
GO
print 'Processed 400 total records'
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (442, 389, 69)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (443, 389, 184)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (444, 389, 282)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (445, 390, 215)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (446, 390, 26)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (447, 390, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (448, 390, 67)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (449, 391, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (450, 391, 114)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (451, 391, 113)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (452, 392, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (453, 393, 138)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (454, 394, 102)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (455, 394, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (456, 395, 171)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (457, 396, 30)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (458, 397, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (459, 397, 38)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (460, 397, 184)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (461, 397, 39)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (462, 398, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (463, 399, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (464, 399, 191)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (465, 399, 7)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (466, 399, 78)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (467, 399, 8)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (468, 399, 14)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (469, 399, 35)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (470, 400, 86)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (471, 400, 261)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (472, 400, 85)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (473, 400, 250)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (474, 401, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (475, 401, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (476, 401, 117)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (477, 401, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (478, 401, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (479, 401, 137)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (480, 401, 111)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (481, 401, 112)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (482, 401, 116)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (483, 402, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (484, 403, 264)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (485, 404, 27)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (486, 404, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (487, 404, 38)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (488, 404, 184)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (489, 404, 39)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (490, 404, 283)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (491, 405, 261)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (492, 405, 135)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (493, 405, 175)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (494, 406, 34)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (495, 394, 284)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (496, 394, 285)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (497, 401, 286)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (498, 401, 287)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (499, 393, 288)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (500, 390, 289)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (501, 390, 290)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (502, 400, 291)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (503, 400, 292)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (504, 406, 293)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (505, 403, 294)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (506, 398, 295)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (507, 398, 296)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (508, 398, 297)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (509, 398, 298)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (510, 398, 299)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (511, 398, 300)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (512, 398, 301)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (513, 398, 302)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (514, 396, 303)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (515, 405, 304)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (516, 405, 305)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (517, 385, 306)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (518, 385, 307)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (519, 385, 308)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (520, 385, 309)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (521, 384, 310)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (522, 384, 311)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (523, 386, 312)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (524, 386, 313)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (525, 392, 314)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (526, 392, 315)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (527, 392, 316)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (528, 392, 317)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (529, 392, 318)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (530, 392, 319)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (531, 392, 320)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (532, 408, 69)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (533, 409, 261)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (534, 409, 135)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (535, 409, 304)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (536, 407, 322)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (537, 407, 323)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (538, 408, 324)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (539, 408, 325)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (540, 410, 323)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (541, 410, 322)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (542, 411, 120)
GO
print 'Processed 500 total records'
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (543, 411, 224)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (544, 412, 171)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (545, 412, 283)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (546, 412, 290)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (547, 413, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (548, 415, 166)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (549, 417, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (550, 417, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (551, 417, 96)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (552, 417, 90)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (553, 418, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (554, 418, 120)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (555, 418, 258)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (556, 418, 196)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (557, 418, 259)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (558, 418, 207)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (559, 418, 297)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (560, 418, 309)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (561, 418, 85)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (562, 418, 302)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (563, 418, 308)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (564, 418, 296)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (565, 418, 260)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (566, 418, 295)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (567, 419, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (568, 419, 33)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (569, 412, 326)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (570, 412, 327)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (571, 412, 328)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (572, 412, 329)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (573, 413, 330)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (574, 413, 331)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (575, 416, 332)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (576, 414, 333)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (577, 410, 334)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (578, 410, 335)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (579, 420, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (580, 421, 13)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (582, 421, 107)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (583, 422, 34)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (584, 423, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (585, 423, 44)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (586, 423, 125)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (587, 424, 192)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (588, 425, 281)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (589, 426, 26)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (590, 427, 87)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (591, 427, 158)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (592, 427, 138)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (593, 427, 224)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (594, 428, 58)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (595, 428, 301)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (596, 428, 57)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (597, 429, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (598, 429, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (599, 429, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (600, 429, 184)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (601, 429, 7)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (602, 429, 122)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (603, 429, 149)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (604, 429, 13)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (605, 429, 135)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (606, 429, 138)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (607, 429, 283)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (608, 429, 273)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (609, 429, 42)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (610, 429, 54)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (611, 429, 57)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (612, 429, 123)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (613, 429, 134)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (614, 430, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (615, 430, 38)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (616, 430, 39)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (617, 430, 278)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (618, 431, 80)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (619, 432, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (620, 432, 121)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (621, 432, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (622, 432, 116)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (623, 433, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (624, 433, 53)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (625, 434, 32)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (626, 435, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (627, 435, 156)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (628, 436, 120)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (629, 436, 19)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (630, 438, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (631, 439, 34)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (632, 440, 107)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (633, 440, 290)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (634, 442, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (635, 442, 133)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (636, 442, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (637, 442, 156)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (638, 443, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (639, 443, 123)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (640, 444, 69)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (641, 444, 215)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (642, 444, 51)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (643, 444, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (644, 444, 123)
GO
print 'Processed 600 total records'
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (645, 445, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (646, 446, 26)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (647, 446, 39)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (648, 446, 80)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (649, 446, 273)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (650, 447, 32)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (651, 447, 56)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (652, 448, 109)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (653, 448, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (654, 450, 75)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (655, 451, 171)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (656, 451, 103)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (657, 451, 310)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (658, 451, 25)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (659, 455, 107)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (660, 425, 337)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (661, 425, 338)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (662, 426, 339)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (663, 426, 340)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (664, 427, 341)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (665, 428, 342)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (666, 429, 343)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (667, 429, 344)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (668, 429, 345)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (669, 429, 346)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (670, 432, 347)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (671, 433, 348)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (672, 437, 349)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (673, 436, 350)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (674, 435, 351)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (675, 438, 352)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (676, 458, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (677, 447, 353)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (678, 447, 354)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (679, 447, 355)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (680, 454, 356)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (681, 454, 357)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (682, 452, 358)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (683, 451, 359)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (684, 453, 360)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (685, 453, 361)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (686, 449, 362)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (687, 449, 363)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (688, 448, 364)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (689, 457, 365)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (690, 458, 366)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (691, 460, 256)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (692, 460, 184)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (693, 460, 87)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (694, 460, 33)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (695, 461, 185)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (696, 461, 203)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (697, 464, 57)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (698, 465, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (699, 465, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (700, 465, 116)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (701, 466, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (702, 466, 256)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (703, 466, 149)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (704, 467, 57)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (705, 468, 32)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (706, 468, 38)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (707, 469, 360)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (708, 469, 47)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (709, 469, 290)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (710, 469, 179)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (711, 470, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (712, 470, 103)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (713, 470, 80)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (714, 471, 215)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (715, 471, 61)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (716, 471, 221)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (717, 473, 32)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (718, 473, 72)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (719, 473, 38)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (720, 473, 235)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (721, 473, 229)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (722, 473, 278)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (723, 473, 131)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (724, 475, 301)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (725, 475, 25)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (726, 476, 192)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (727, 476, 117)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (728, 476, 86)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (729, 477, 356)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (730, 478, 301)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (731, 479, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (732, 479, 256)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (733, 480, 205)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (734, 480, 82)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (735, 480, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (736, 480, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (737, 481, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (738, 483, 192)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (739, 484, 185)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (740, 484, 114)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (741, 484, 203)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (742, 485, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (743, 486, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (744, 487, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (745, 488, 205)
GO
print 'Processed 700 total records'
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (746, 488, 82)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (747, 488, 184)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (748, 488, 26)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (749, 488, 219)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (750, 488, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (751, 488, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (752, 463, 367)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (753, 459, 368)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (754, 459, 369)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (755, 462, 370)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (756, 469, 371)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (757, 472, 372)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (758, 472, 373)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (759, 474, 374)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (760, 474, 375)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (761, 476, 376)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (762, 475, 377)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (763, 475, 378)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (764, 478, 379)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (765, 482, 380)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (766, 485, 381)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (767, 489, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (768, 490, 382)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (769, 490, 383)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (770, 490, 384)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (771, 456, 385)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (772, 490, 386)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (773, 491, 294)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (774, 491, 264)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (775, 492, 192)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (776, 492, 385)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (777, 492, 13)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (778, 492, 167)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (779, 492, 301)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (780, 492, 379)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (781, 492, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (782, 492, 342)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (783, 492, 57)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (784, 492, 269)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (785, 493, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (786, 493, 289)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (787, 493, 381)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (788, 493, 303)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (789, 493, 116)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (790, 494, 364)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (791, 494, 107)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (793, 495, 20)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (794, 495, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (795, 495, 193)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (796, 496, 364)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (797, 496, 58)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (798, 496, 270)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (799, 498, 185)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (800, 498, 122)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (801, 499, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (802, 499, 90)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (803, 501, 117)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (804, 501, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (805, 502, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (806, 502, 273)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (807, 502, 54)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (808, 503, 303)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (809, 503, 180)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (810, 504, 47)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (811, 504, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (812, 505, 379)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (813, 505, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (814, 506, 99)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (815, 506, 96)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (816, 504, 387)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (817, 496, 388)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (818, 506, 389)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (819, 501, 390)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (820, 501, 391)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (821, 495, 392)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (822, 495, 393)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (823, 507, 19)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (824, 507, 47)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (825, 508, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (826, 508, 390)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (827, 508, 35)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (828, 508, 54)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (829, 509, 219)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (830, 510, 212)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (831, 510, 72)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (832, 510, 178)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (833, 510, 211)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (834, 510, 235)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (835, 510, 229)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (836, 510, 154)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (837, 510, 131)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (838, 509, 394)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (839, 511, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (840, 511, 338)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (841, 511, 107)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (842, 511, 133)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (843, 512, 34)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (844, 512, 117)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (845, 512, 330)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (846, 512, 316)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (847, 512, 303)
GO
print 'Processed 800 total records'
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (848, 513, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (849, 513, 185)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (850, 513, 259)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (851, 513, 309)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (852, 513, 308)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (853, 513, 295)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (854, 515, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (855, 515, 196)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (856, 515, 194)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (857, 515, 149)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (858, 515, 195)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (859, 515, 273)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (860, 515, 275)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (861, 515, 190)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (862, 515, 193)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (863, 515, 224)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (864, 517, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (865, 517, 171)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (866, 517, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (867, 517, 29)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (868, 518, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (869, 520, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (870, 520, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (871, 520, 359)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (872, 520, 391)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (873, 520, 301)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (874, 520, 361)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (875, 520, 378)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (876, 520, 163)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (877, 521, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (878, 521, 20)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (879, 521, 281)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (880, 522, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (881, 522, 63)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (882, 523, 391)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (883, 523, 20)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (884, 524, 67)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (885, 525, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (886, 525, 53)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (887, 526, 388)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (888, 526, 159)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (889, 527, 38)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (890, 527, 114)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (891, 527, 203)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (892, 528, 177)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (893, 528, 158)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (894, 529, 297)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (895, 530, 40)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (896, 531, 303)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (897, 531, 30)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (898, 532, 391)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (899, 533, 360)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (900, 533, 105)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (901, 533, 324)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (902, 533, 290)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (903, 533, 361)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (904, 534, 303)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (905, 534, 30)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (906, 535, 86)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (907, 535, 206)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (908, 536, 171)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (909, 536, 365)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (910, 537, 80)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (911, 538, 120)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (912, 538, 173)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (913, 539, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (914, 539, 391)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (915, 540, 219)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (916, 540, 167)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (917, 540, 356)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (918, 540, 166)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (919, 540, 123)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (920, 541, 278)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (921, 541, 361)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (922, 541, 378)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (923, 542, 390)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (924, 542, 54)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (925, 543, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (926, 543, 38)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (927, 543, 184)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (928, 543, 39)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (929, 543, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (930, 544, 335)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (931, 544, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (932, 544, 330)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (933, 546, 171)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (934, 546, 58)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (935, 546, 203)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (936, 547, 198)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (937, 547, 314)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (938, 548, 164)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (939, 549, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (940, 549, 100)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (941, 549, 89)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (942, 549, 175)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (943, 549, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (944, 550, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (945, 550, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (946, 551, 327)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (947, 551, 330)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (948, 551, 215)
GO
print 'Processed 900 total records'
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (949, 551, 87)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (950, 551, 47)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (951, 552, 215)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (952, 553, 116)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (953, 555, 391)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (954, 555, 20)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (955, 556, 75)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (956, 556, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (957, 556, 283)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (958, 556, 190)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (959, 557, 26)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (960, 558, 384)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (961, 558, 178)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (962, 558, 314)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (963, 559, 58)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (964, 560, 185)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (965, 560, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (966, 561, 26)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (967, 561, 339)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (968, 562, 149)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (969, 562, 273)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (970, 562, 275)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (971, 563, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (972, 563, 29)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (973, 563, 39)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (974, 563, 125)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (975, 563, 264)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (976, 563, 133)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (977, 563, 328)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (978, 563, 47)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (979, 564, 106)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (980, 565, 391)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (981, 565, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (982, 566, 256)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (983, 566, 87)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (984, 566, 371)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (985, 566, 179)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (986, 567, 357)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (987, 569, 133)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (988, 569, 77)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (989, 570, 26)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (990, 571, 57)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (991, 572, 67)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (992, 573, 107)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (993, 573, 77)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (994, 560, 395)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (995, 567, 396)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (996, 567, 397)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (997, 568, 398)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (998, 561, 399)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (999, 558, 400)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1000, 574, 41)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1001, 574, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1002, 574, 61)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1003, 574, 85)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1004, 574, 184)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1005, 574, 215)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1006, 575, 133)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1007, 577, 85)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1008, 577, 86)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1009, 577, 132)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1010, 577, 207)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1011, 578, 58)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1012, 578, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1013, 578, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1014, 578, 212)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1015, 578, 219)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1016, 578, 270)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1017, 578, 379)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1018, 579, 54)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1019, 579, 116)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1020, 579, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1021, 579, 171)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1022, 579, 315)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1023, 579, 391)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1024, 580, 32)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1025, 580, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1026, 580, 148)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1027, 580, 177)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1028, 580, 278)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1029, 580, 331)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1030, 580, 368)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1031, 581, 85)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1032, 581, 128)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1033, 582, 103)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1034, 583, 106)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1035, 584, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1036, 584, 54)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1037, 584, 390)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1038, 585, 41)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1039, 585, 128)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1040, 585, 132)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1041, 585, 247)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1042, 583, 401)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1043, 579, 402)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1044, 579, 403)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1045, 579, 404)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1046, 579, 405)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1047, 577, 406)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1048, 577, 407)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1049, 576, 408)
GO
print 'Processed 1000 total records'
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1050, 576, 409)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1051, 586, 32)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1052, 587, 197)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1053, 588, 92)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1054, 588, 107)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1055, 588, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1056, 588, 162)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1057, 588, 287)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1058, 588, 388)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1059, 588, 390)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1060, 589, 30)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1061, 589, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1062, 589, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1063, 589, 154)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1064, 589, 330)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1065, 591, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1066, 591, 287)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1067, 592, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1068, 593, 178)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1069, 593, 384)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1070, 594, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1071, 594, 369)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1072, 595, 261)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1073, 595, 378)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1074, 596, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1075, 597, 393)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1076, 598, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1077, 598, 69)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1078, 598, 107)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1079, 598, 139)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1080, 598, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1081, 598, 193)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1082, 598, 263)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1083, 598, 324)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1084, 598, 325)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1085, 598, 364)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1086, 599, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1087, 600, 42)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1088, 600, 167)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1089, 602, 120)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1090, 602, 193)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1091, 602, 271)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1092, 602, 393)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1093, 603, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1094, 604, 324)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1095, 605, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1096, 605, 34)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1097, 605, 35)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1098, 605, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1099, 605, 54)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1100, 605, 189)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1101, 606, 20)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1102, 606, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1103, 607, 30)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1104, 607, 133)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1105, 608, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1106, 608, 335)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1107, 610, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1108, 610, 112)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1109, 611, 15)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1110, 611, 283)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1111, 613, 120)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1112, 614, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1113, 614, 335)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1114, 614, 396)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1115, 615, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1116, 615, 47)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1117, 615, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1118, 615, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1119, 616, 370)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1120, 617, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1121, 618, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1122, 619, 337)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1123, 620, 41)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1124, 620, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1125, 620, 361)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1126, 621, 13)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1127, 621, 17)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1128, 621, 64)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1129, 622, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1130, 622, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1131, 623, 273)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1132, 624, 54)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1133, 624, 117)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1134, 624, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1135, 624, 390)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1136, 625, 139)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1137, 625, 184)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1138, 625, 273)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1139, 625, 289)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1140, 626, 120)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1141, 626, 350)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1142, 627, 69)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1143, 627, 184)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1144, 627, 282)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1145, 628, 26)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1146, 629, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1147, 630, 72)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1148, 630, 131)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1149, 630, 154)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1150, 630, 178)
GO
print 'Processed 1100 total records'
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1151, 630, 211)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1152, 630, 212)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1153, 630, 229)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1154, 630, 235)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1155, 631, 182)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1156, 632, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1157, 632, 378)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1158, 633, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1159, 633, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1160, 634, 19)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1161, 634, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1162, 634, 392)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1163, 635, 19)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1164, 635, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1165, 635, 122)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1166, 636, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1167, 636, 281)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1168, 636, 401)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1169, 637, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1170, 637, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1171, 637, 352)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1172, 637, 379)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1173, 638, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1174, 639, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1175, 639, 109)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1176, 639, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1177, 640, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1178, 640, 354)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1179, 641, 32)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1180, 641, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1181, 641, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1182, 641, 101)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1183, 641, 324)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1184, 641, 378)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1185, 641, 379)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1186, 642, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1187, 642, 69)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1188, 642, 360)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1189, 643, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1190, 643, 40)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1191, 644, 144)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1192, 644, 179)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1193, 644, 193)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1194, 644, 319)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1195, 644, 371)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1196, 644, 398)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1197, 645, 144)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1198, 645, 179)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1199, 645, 193)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1200, 645, 319)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1201, 645, 371)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1202, 645, 398)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1203, 648, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1204, 649, 14)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1205, 649, 333)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1206, 650, 19)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1207, 650, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1208, 650, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1209, 650, 105)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1210, 650, 220)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1211, 650, 324)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1212, 651, 41)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1213, 651, 103)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1214, 651, 185)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1215, 651, 215)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1216, 652, 14)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1217, 652, 333)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1218, 653, 192)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1219, 655, 256)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1220, 656, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1221, 656, 158)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1222, 656, 162)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1223, 656, 203)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1224, 656, 283)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1225, 656, 356)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1226, 657, 162)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1227, 657, 386)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1228, 658, 58)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1229, 658, 117)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1230, 658, 270)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1231, 660, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1232, 661, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1233, 662, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1234, 663, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1235, 663, 62)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1236, 663, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1237, 663, 287)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1238, 664, 57)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1239, 664, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1240, 665, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1241, 666, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1242, 666, 162)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1243, 667, 193)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1244, 669, 149)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1245, 669, 351)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1246, 670, 149)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1247, 671, 109)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1248, 671, 326)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1249, 671, 327)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1250, 671, 364)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1251, 672, 37)
GO
print 'Processed 1200 total records'
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1252, 673, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1253, 673, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1254, 674, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1255, 674, 117)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1256, 675, 13)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1257, 675, 17)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1258, 675, 33)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1259, 675, 64)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1260, 677, 9)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1261, 677, 19)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1262, 677, 23)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1263, 677, 33)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1264, 678, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1265, 678, 388)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1266, 679, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1267, 680, 57)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1268, 680, 80)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1269, 680, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1270, 680, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1271, 680, 171)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1272, 680, 185)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1273, 681, 54)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1274, 681, 132)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1275, 681, 178)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1276, 681, 192)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1277, 681, 294)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1278, 682, 26)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1279, 682, 37)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1280, 682, 133)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1281, 682, 278)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1282, 683, 357)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1283, 683, 396)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1284, 683, 397)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1285, 685, 61)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1286, 685, 179)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1287, 686, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1288, 689, 175)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1289, 689, 305)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1290, 690, 57)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1291, 691, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1292, 691, 66)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1293, 691, 184)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1294, 691, 191)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1295, 692, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1296, 693, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1297, 693, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1298, 693, 54)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1299, 693, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1300, 693, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1301, 693, 102)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1302, 693, 117)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1303, 693, 158)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1304, 693, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1305, 694, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1306, 694, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1307, 694, 78)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1308, 694, 327)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1309, 695, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1310, 695, 203)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1311, 696, 105)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1312, 696, 131)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1313, 697, 57)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1314, 697, 359)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1315, 698, 20)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1316, 698, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1317, 698, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1318, 698, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1319, 698, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1320, 699, 57)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1321, 699, 391)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1322, 700, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1323, 700, 62)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1324, 704, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1325, 706, 105)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1326, 707, 87)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1327, 707, 192)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1328, 708, 105)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1329, 708, 198)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1330, 708, 357)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1331, 709, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1332, 709, 156)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1333, 709, 351)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1334, 710, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1335, 701, 410)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1336, 711, 105)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1337, 712, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1338, 712, 178)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1339, 712, 411)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1340, 712, 412)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1342, 714, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1343, 714, 53)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1344, 714, 149)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1348, 718, 380)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1349, 719, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1350, 720, 341)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1351, 720, 349)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1352, 721, 177)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1353, 721, 182)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1354, 721, 202)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1355, 723, 13)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1356, 723, 38)
GO
print 'Processed 1300 total records'
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1357, 723, 42)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1358, 723, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1359, 723, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1360, 723, 54)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1361, 723, 64)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1362, 723, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1363, 723, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1364, 723, 107)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1365, 723, 144)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1366, 723, 187)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1367, 723, 198)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1368, 723, 294)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1369, 723, 347)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1370, 723, 356)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1371, 723, 368)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1372, 723, 386)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1373, 723, 391)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1374, 724, 68)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1375, 724, 84)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1376, 724, 109)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1377, 724, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1378, 724, 158)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1379, 724, 266)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1380, 724, 303)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1381, 724, 388)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1382, 722, 413)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1383, 721, 414)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1384, 721, 415)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1385, 725, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1386, 725, 160)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1387, 725, 413)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1388, 726, 387)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1389, 727, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1390, 727, 139)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1391, 727, 184)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1392, 728, 7)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1393, 728, 26)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1394, 728, 185)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1395, 729, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1396, 729, 63)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1397, 729, 158)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1398, 730, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1399, 731, 19)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1400, 731, 26)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1401, 731, 32)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1402, 731, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1403, 732, 145)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1404, 733, 35)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1405, 733, 391)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1406, 734, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1407, 734, 53)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1408, 734, 122)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1409, 734, 149)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1410, 735, 198)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1411, 736, 111)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1412, 737, 303)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1413, 738, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1414, 739, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1415, 739, 149)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1416, 740, 411)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1417, 741, 35)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1418, 742, 133)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1419, 744, 88)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1420, 745, 294)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1421, 745, 411)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1422, 746, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1423, 746, 54)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1424, 746, 111)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1425, 746, 117)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1426, 747, 30)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1427, 747, 303)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1428, 748, 10)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1429, 748, 34)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1430, 748, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1431, 748, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1432, 748, 116)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1433, 748, 117)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1434, 750, 87)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1435, 751, 20)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1436, 751, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1437, 751, 43)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1438, 751, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1439, 751, 161)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1440, 752, 281)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1441, 754, 3)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1442, 754, 36)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1443, 754, 52)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1444, 754, 89)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1445, 754, 100)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1446, 754, 189)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1447, 754, 382)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1448, 754, 391)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1449, 755, 32)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1450, 755, 50)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1451, 755, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1452, 755, 199)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1453, 755, 261)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1454, 755, 273)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1455, 755, 307)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1456, 756, 384)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1457, 757, 50)
GO
print 'Processed 1400 total records'
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1458, 757, 83)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1459, 757, 85)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1460, 757, 132)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1461, 757, 151)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1462, 758, 20)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1463, 758, 382)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1464, 758, 384)
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (1465, 759, 289)
SET IDENTITY_INSERT [dbo].[PostTags] OFF
/****** Object:  Table [dbo].[PostLocations]    Script Date: 02/25/2010 17:11:38 ******/
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
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (61, 97, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (62, 95, 23)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (63, 94, 24)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (64, 96, 25)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (65, 92, 26)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (66, 93, 23)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (67, 91, 27)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (68, 64, 28)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (69, 69, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (70, 70, 29)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (71, 75, 30)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (72, 82, 31)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (73, 81, 23)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (78, 150, 23)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (81, 228, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (84, 262, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (85, 271, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (86, 271, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (87, 271, 28)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (88, 275, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (89, 275, 22)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (90, 269, 33)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (93, 283, 3)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (94, 283, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (95, 283, 14)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (96, 305, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (97, 308, 14)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (98, 311, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (99, 313, 28)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (101, 317, 23)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (103, 327, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (105, 332, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (106, 310, 34)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (108, 348, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (109, 350, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (110, 356, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (111, 357, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (112, 358, 26)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (113, 361, 28)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (115, 362, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (118, 348, 12)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (119, 344, 54)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (120, 344, 55)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (121, 368, 56)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (122, 339, 17)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (123, 339, 59)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (124, 339, 60)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (125, 339, 61)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (126, 339, 62)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (127, 339, 63)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (128, 339, 64)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (129, 339, 65)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (130, 339, 66)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (131, 339, 67)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (132, 339, 68)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (133, 339, 69)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (134, 339, 70)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (135, 339, 71)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (136, 339, 72)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (137, 339, 73)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (138, 339, 74)
GO
print 'Processed 100 total records'
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (139, 339, 75)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (140, 339, 76)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (141, 339, 77)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (142, 339, 78)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (143, 339, 79)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (144, 339, 80)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (145, 339, 81)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (146, 339, 82)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (147, 339, 83)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (148, 339, 84)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (149, 339, 85)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (150, 339, 41)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (151, 339, 86)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (152, 339, 87)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (153, 339, 88)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (154, 339, 89)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (155, 339, 90)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (156, 339, 91)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (157, 339, 92)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (158, 339, 93)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (159, 339, 94)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (160, 339, 95)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (161, 339, 96)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (162, 339, 97)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (163, 339, 98)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (164, 339, 99)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (165, 339, 100)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (166, 339, 101)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (168, 339, 103)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (169, 339, 104)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (170, 339, 105)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (171, 339, 106)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (172, 339, 107)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (173, 339, 108)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (174, 339, 109)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (175, 339, 110)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (176, 339, 111)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (177, 339, 112)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (178, 339, 113)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (179, 339, 114)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (180, 339, 115)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (181, 339, 116)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (182, 339, 117)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (183, 339, 118)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (184, 339, 119)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (185, 339, 120)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (186, 339, 121)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (187, 339, 122)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (188, 339, 123)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (189, 339, 124)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (190, 339, 125)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (191, 339, 126)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (192, 339, 127)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (193, 339, 128)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (194, 339, 129)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (195, 339, 130)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (196, 339, 131)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (197, 339, 132)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (198, 339, 133)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (199, 339, 134)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (200, 339, 135)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (201, 339, 136)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (202, 339, 137)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (203, 339, 138)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (204, 339, 139)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (205, 339, 140)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (206, 339, 141)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (207, 339, 142)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (208, 369, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (209, 370, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (210, 371, 26)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (211, 339, 143)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (212, 339, 144)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (213, 339, 145)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (214, 372, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (215, 372, 34)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (216, 339, 146)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (217, 374, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (218, 377, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (219, 385, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (220, 387, 113)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (221, 398, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (222, 399, 28)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (223, 399, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (224, 399, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (225, 405, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (226, 406, 28)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (227, 407, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (228, 410, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (229, 411, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (231, 416, 33)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (232, 417, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (233, 418, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (234, 412, 147)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (235, 412, 148)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (236, 412, 149)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (237, 423, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (238, 424, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (239, 428, 67)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (240, 431, 23)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (241, 433, 17)
GO
print 'Processed 200 total records'
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (242, 433, 14)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (243, 434, 17)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (244, 436, 61)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (245, 437, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (246, 444, 23)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (247, 445, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (248, 446, 23)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (249, 447, 61)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (250, 453, 117)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (251, 456, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (252, 457, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (253, 425, 150)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (254, 428, 151)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (255, 458, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (256, 451, 152)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (257, 457, 153)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (258, 462, 152)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (259, 468, 65)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (260, 469, 117)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (261, 471, 113)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (262, 473, 65)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (263, 474, 113)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (264, 475, 143)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (265, 477, 39)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (266, 487, 143)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (267, 464, 154)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (268, 466, 155)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (269, 476, 156)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (270, 478, 157)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (271, 495, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (272, 495, 12)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (273, 497, 153)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (275, 504, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (276, 505, 34)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (277, 493, 158)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (278, 493, 159)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (279, 495, 160)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (280, 495, 161)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (281, 507, 150)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (282, 508, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (283, 509, 17)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (284, 510, 65)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (285, 511, 14)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (286, 512, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (287, 513, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (288, 514, 153)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (289, 516, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (290, 517, 10)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (291, 518, 34)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (292, 520, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (293, 524, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (295, 525, 27)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (296, 526, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (297, 527, 12)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (298, 528, 26)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (299, 533, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (300, 534, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (301, 535, 34)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (303, 539, 26)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (304, 540, 26)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (305, 542, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (306, 545, 23)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (307, 547, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (308, 556, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (310, 558, 56)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (311, 564, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (312, 564, 160)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (313, 566, 23)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (314, 567, 150)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (315, 568, 67)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (316, 569, 14)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (317, 573, 14)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (318, 560, 163)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (319, 574, 39)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (320, 574, 74)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (321, 575, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (322, 575, 153)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (324, 577, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (327, 586, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (329, 594, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (330, 598, 23)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (331, 598, 35)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (332, 602, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (333, 603, 12)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (334, 604, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (335, 605, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (336, 606, 12)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (337, 608, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (339, 611, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (340, 611, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (341, 612, 23)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (342, 616, 100)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (343, 616, 101)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (344, 617, 100)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (345, 617, 101)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (346, 618, 100)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (347, 618, 101)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (348, 620, 61)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (349, 621, 14)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (350, 622, 150)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (351, 623, 61)
GO
print 'Processed 300 total records'
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (352, 624, 14)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (353, 625, 61)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (354, 626, 61)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (355, 629, 155)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (356, 630, 65)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (357, 633, 113)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (358, 634, 143)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (359, 637, 143)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (360, 639, 155)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (361, 640, 155)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (362, 641, 143)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (363, 642, 143)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (364, 644, 117)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (365, 645, 117)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (366, 646, 117)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (367, 647, 117)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (368, 648, 155)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (369, 649, 16)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (370, 649, 117)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (371, 650, 36)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (372, 652, 16)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (373, 652, 117)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (374, 653, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (375, 655, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (376, 655, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (377, 655, 159)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (378, 655, 172)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (379, 656, 34)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (380, 657, 34)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (381, 658, 158)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (382, 660, 12)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (383, 660, 26)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (384, 661, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (385, 666, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (386, 667, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (387, 668, 117)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (388, 669, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (389, 669, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (390, 669, 161)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (391, 673, 34)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (392, 675, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (393, 676, 158)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (394, 677, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (395, 677, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (396, 678, 173)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (397, 684, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (398, 685, 80)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (399, 686, 23)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (400, 686, 98)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (401, 687, 117)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (402, 688, 117)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (403, 689, 179)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (404, 694, 158)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (405, 695, 34)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (406, 696, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (407, 696, 159)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (408, 697, 3)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (412, 704, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (414, 706, 3)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (419, 707, 14)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (420, 708, 10)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (421, 709, 34)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (422, 710, 158)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (423, 701, 158)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (424, 711, 3)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (432, 718, 3)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (433, 718, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (434, 719, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (435, 723, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (436, 712, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (437, 724, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (439, 720, 165)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (440, 727, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (441, 727, 165)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (442, 737, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (443, 738, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (444, 739, 158)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (445, 741, 23)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (446, 743, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (447, 743, 153)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (448, 744, 10)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (449, 748, 158)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (450, 753, 11)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (451, 754, 23)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (452, 754, 35)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (453, 755, 150)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (454, 757, 150)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (455, 759, 61)
SET IDENTITY_INSERT [dbo].[PostLocations] OFF
/****** Object:  Default [DF_Locations_LocationLatitude]    Script Date: 02/25/2010 17:11:38 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Locations_LocationLatitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Locations]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Locations_LocationLatitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_LocationLatitude]  DEFAULT ((0)) FOR [LocationLatitude]
END


End
GO
/****** Object:  Default [DF_Locations_LocationLongitude]    Script Date: 02/25/2010 17:11:38 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Locations_LocationLongitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Locations]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Locations_LocationLongitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_LocationLongitude]  DEFAULT ((0)) FOR [LocationLongitude]
END


End
GO
/****** Object:  Default [DF_Messages_MessageParentId]    Script Date: 02/25/2010 17:11:38 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Messages_MessageParentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Messages_MessageParentId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Messages_MessageParentId]  DEFAULT ((0)) FOR [PostParentId]
END


End
GO
/****** Object:  Default [DF_Posts_PostLatitude]    Script Date: 02/25/2010 17:11:38 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Posts_PostLatitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Posts_PostLatitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Posts_PostLatitude]  DEFAULT ((0)) FOR [PostLatitude]
END


End
GO
/****** Object:  Default [DF_Posts_PostLongitude]    Script Date: 02/25/2010 17:11:38 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Posts_PostLongitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Posts_PostLongitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Posts_PostLongitude]  DEFAULT ((0)) FOR [PostLongitude]
END


End
GO
/****** Object:  Default [DF_Users_UserLatitude]    Script Date: 02/25/2010 17:11:38 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Users_UserLatitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_UserLatitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserLatitude]  DEFAULT ((0)) FOR [UserLatitude]
END


End
GO
/****** Object:  Default [DF_Users_UserLongitude]    Script Date: 02/25/2010 17:11:38 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Users_UserLongitude]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_UserLongitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserLongitude]  DEFAULT ((0)) FOR [UserLongitude]
END


End
GO
/****** Object:  Default [DF_Users_UserSearchRadiusMiles]    Script Date: 02/25/2010 17:11:38 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Users_UserSearchRadiusMiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Users_UserSearchRadiusMiles]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserSearchRadiusMiles]  DEFAULT ((5)) FOR [UserSearchRadiusMiles]
END


End
GO
/****** Object:  ForeignKey [FK_FeedLocations_Feeds]    Script Date: 02/25/2010 17:11:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FeedLocations_Feeds]') AND parent_object_id = OBJECT_ID(N'[dbo].[FeedLocations]'))
ALTER TABLE [dbo].[FeedLocations]  WITH CHECK ADD  CONSTRAINT [FK_FeedLocations_Feeds] FOREIGN KEY([FeedId])
REFERENCES [dbo].[Feeds] ([FeedId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FeedLocations_Feeds]') AND parent_object_id = OBJECT_ID(N'[dbo].[FeedLocations]'))
ALTER TABLE [dbo].[FeedLocations] CHECK CONSTRAINT [FK_FeedLocations_Feeds]
GO
/****** Object:  ForeignKey [FK_FeedLocations_Locations]    Script Date: 02/25/2010 17:11:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FeedLocations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[FeedLocations]'))
ALTER TABLE [dbo].[FeedLocations]  WITH CHECK ADD  CONSTRAINT [FK_FeedLocations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FeedLocations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[FeedLocations]'))
ALTER TABLE [dbo].[FeedLocations] CHECK CONSTRAINT [FK_FeedLocations_Locations]
GO
/****** Object:  ForeignKey [FK_Feeds_FeedCategories]    Script Date: 02/25/2010 17:11:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Feeds_FeedCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Feeds]'))
ALTER TABLE [dbo].[Feeds]  WITH CHECK ADD  CONSTRAINT [FK_Feeds_FeedCategories] FOREIGN KEY([FeedCategoryId])
REFERENCES [dbo].[FeedCategories] ([FeedCategoryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Feeds_FeedCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Feeds]'))
ALTER TABLE [dbo].[Feeds] CHECK CONSTRAINT [FK_Feeds_FeedCategories]
GO
/****** Object:  ForeignKey [FK_PostLocations_Locations]    Script Date: 02/25/2010 17:11:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations]  WITH CHECK ADD  CONSTRAINT [FK_PostLocations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations] CHECK CONSTRAINT [FK_PostLocations_Locations]
GO
/****** Object:  ForeignKey [FK_PostLocations_Posts]    Script Date: 02/25/2010 17:11:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations]  WITH CHECK ADD  CONSTRAINT [FK_PostLocations_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations] CHECK CONSTRAINT [FK_PostLocations_Posts]
GO
/****** Object:  ForeignKey [FK_Posts_Feeds]    Script Date: 02/25/2010 17:11:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Feeds]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Feeds] FOREIGN KEY([FeedId])
REFERENCES [dbo].[Feeds] ([FeedId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Feeds]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Feeds]
GO
/****** Object:  ForeignKey [FK_Posts_PostCategories]    Script Date: 02/25/2010 17:11:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_PostCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_PostCategories] FOREIGN KEY([PostCategoryId])
REFERENCES [dbo].[PostCategories] ([PostCategoryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_PostCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_PostCategories]
GO
/****** Object:  ForeignKey [FK_Posts_Users]    Script Date: 02/25/2010 17:11:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
/****** Object:  ForeignKey [FK_PostTags_Posts]    Script Date: 02/25/2010 17:11:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Posts]
GO
/****** Object:  ForeignKey [FK_PostTags_Tags]    Script Date: 02/25/2010 17:11:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Tags]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Tags]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Tags]
GO
/****** Object:  ForeignKey [FK_Users_Roles]    Script Date: 02/25/2010 17:11:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
