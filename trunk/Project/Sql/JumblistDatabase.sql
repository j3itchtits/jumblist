/****** Object:  ForeignKey [FK_Feeds_FeedCategories]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Feeds_FeedCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Feeds]'))
ALTER TABLE [dbo].[Feeds] DROP CONSTRAINT [FK_Feeds_FeedCategories]
GO
/****** Object:  ForeignKey [FK_PostLocations_Locations]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations] DROP CONSTRAINT [FK_PostLocations_Locations]
GO
/****** Object:  ForeignKey [FK_PostLocations_Posts]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations] DROP CONSTRAINT [FK_PostLocations_Posts]
GO
/****** Object:  ForeignKey [FK_Posts_Feeds]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Feeds]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_Feeds]
GO
/****** Object:  ForeignKey [FK_Posts_PostCategories]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_PostCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_PostCategories]
GO
/****** Object:  ForeignKey [FK_Posts_Users]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_Posts_Users]
GO
/****** Object:  ForeignKey [FK_PostTags_Posts]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags] DROP CONSTRAINT [FK_PostTags_Posts]
GO
/****** Object:  ForeignKey [FK_PostTags_Tags]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Tags]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags] DROP CONSTRAINT [FK_PostTags_Tags]
GO
/****** Object:  ForeignKey [FK_Users_Roles]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  Table [dbo].[PostLocations]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostLocations]') AND type in (N'U'))
DROP TABLE [dbo].[PostLocations]
GO
/****** Object:  Table [dbo].[PostTags]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostTags]') AND type in (N'U'))
DROP TABLE [dbo].[PostTags]
GO
/****** Object:  UserDefinedFunction [dbo].[NearestMessages]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NearestMessages]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[NearestMessages]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Posts]') AND type in (N'U'))
DROP TABLE [dbo].[Posts]
GO
/****** Object:  Table [dbo].[Feeds]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Feeds]') AND type in (N'U'))
DROP TABLE [dbo].[Feeds]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[PostCategories]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostCategories]') AND type in (N'U'))
DROP TABLE [dbo].[PostCategories]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
DROP TABLE [dbo].[Locations]
GO
/****** Object:  UserDefinedFunction [dbo].[DistanceBetween]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DistanceBetween]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[DistanceBetween]
GO
/****** Object:  Table [dbo].[FeedCategories]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FeedCategories]') AND type in (N'U'))
DROP TABLE [dbo].[FeedCategories]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tags]') AND type in (N'U'))
DROP TABLE [dbo].[Tags]
GO
/****** Object:  Default [DF_Messages_MessageParentId]    Script Date: 02/17/2010 11:33:24 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Messages_MessageParentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Messages_MessageParentId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [DF_Messages_MessageParentId]
END


End
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 02/17/2010 11:33:24 ******/
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
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (127, N'Sony', N'sony')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (128, N'Saucepan', N'saucepan')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (129, N'Whisk', N'whisk')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (131, N'Spoon', N'spoon')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (132, N'Bowl', N'bowl')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (133, N'Printer', N'printer')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (134, N'Wool', N'wool')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (135, N'Knitting', N'knitting')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (136, N'Tenterden', N'tenterden')
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
GO
print 'Processed 200 total records'
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (220, N'Ironing board', N'ironing-board')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (221, N'Pan', N'pan')
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
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (262, N'Nokia', N'nokia')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (263, N'Headphone', N'headphone')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (264, N'Mouse', N'mouse')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (265, N'Binocular', N'binocular')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (266, N'Wii', N'wii')
INSERT [dbo].[Tags] ([TagId], [TagName], [TagFriendlyUrl]) VALUES (267, N'Nintendo', N'nintendo')
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
SET IDENTITY_INSERT [dbo].[Tags] OFF
/****** Object:  Table [dbo].[Roles]    Script Date: 02/17/2010 11:33:24 ******/
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
/****** Object:  Table [dbo].[FeedCategories]    Script Date: 02/17/2010 11:33:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FeedCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FeedCategories](
	[FeedCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[FeedCategoryName] [nvarchar](255) COLLATE Latin1_General_CI_AS NOT NULL,
 CONSTRAINT [PK_FeedCategories] PRIMARY KEY CLUSTERED 
(
	[FeedCategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[FeedCategories] ON
INSERT [dbo].[FeedCategories] ([FeedCategoryId], [FeedCategoryName]) VALUES (1, N'Freecycle Yahoo Group')
INSERT [dbo].[FeedCategories] ([FeedCategoryId], [FeedCategoryName]) VALUES (2, N'Freegle Yahoo Group')
SET IDENTITY_INSERT [dbo].[FeedCategories] OFF
/****** Object:  UserDefinedFunction [dbo].[DistanceBetween]    Script Date: 02/17/2010 11:33:24 ******/
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
/****** Object:  Table [dbo].[Locations]    Script Date: 02/17/2010 11:33:24 ******/
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
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (3, N'Brede', N'brede')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (4, N'Hastings', N'hastings')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (5, N'TN34', N'tn34')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (6, N'TN38', N'tn38')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (9, N'Warrior Square', N'warrior-square')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (10, N'Hollington ', N'hollington')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (11, N'Sedlescombe', N'sedlescombe')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (12, N'TN37', N'tn37')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (14, N'Rye', N'rye')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (15, N'TN31', N'tn31')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (16, N'Northiam', N'northiam')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (17, N'Beckley', N'beckley')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (18, N'Udimore', N'udimore')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (19, N'Cripps Corner', N'cripps-corner')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (21, N'St Leonards', N'st-leonards')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (22, N'The Green', N'the-green')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (23, N'TN35', N'tn35')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (24, N'TN33', N'tn33')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (25, N'Beauport Park', N'beauport-park')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (26, N'Bohemia', N'bohemia')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (27, N'TN39', N'tn39')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (28, N'Blacklands', N'blacklands')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (29, N'Hailsham', N'hailsham')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (30, N'Seaford', N'seaford')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (31, N'St Helens', N'st-helens')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (32, N'Bexhill', N'bexhill')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (33, N'Silverhill', N'silverhill')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (34, N'Ore', N'ore')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (35, N'Westfield', N'westfield')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (36, N'TN32', N'tn32')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (37, N'TN36', N'tn36')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (38, N'Broad Oak', N'broad-oak')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (39, N'Robertsbridge', N'robertsbridge')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (41, N'Kent Street', N'kent-street')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (54, N'Heathfield', N'heathfield')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (55, N'Hurst Green', N'hurst-green')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (56, N'Sidley', N'sidley')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (59, N'Broadland Row', N'broadland-row')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (60, N'Cackle Street', N'cackle-street')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (61, N'Camber', N'camber')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (62, N'East Guldeford', N'east-guldeford')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (63, N'Four Oaks', N'four-oaks')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (64, N'Horns Cross', N'horns-cross')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (65, N'Iden', N'iden')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (66, N'Millcorner', N'millcorner')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (67, N'Peasmarsh', N'peasmarsh')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (68, N'Playden', N'playden')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (69, N'Rye Foreign', N'rye-foreign')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (70, N'Rye Harbour', N'rye-harbour')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (71, N'Bodiam', N'bodiam')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (72, N'Brightling', N'brightling')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (73, N'Ewhurst', N'ewhurst')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (74, N'Mountfield', N'mountfield')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (75, N'Johns Cross', N'johns-cross')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (76, N'Oxleys Green', N'oxleys-green')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (77, N'Salehurst', N'salehurst')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (78, N'Staple Cross', N'staple-cross')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (79, N'Vinehall Street', N'vinehall-street')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (80, N'Battle', N'battle')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (81, N'Catsfield', N'catsfield')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (82, N'Crowhurst', N'crowhurst')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (83, N'Henleys Down', N'henleys-down')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (84, N'Hooe', N'hooe')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (85, N'Hooe Common', N'hooe-common')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (86, N'Lower Street', N'lower-street')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (87, N'Netherfield', N'netherfield')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (88, N'Ninfield', N'ninfield')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (89, N'Penhurst', N'penhurst')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (90, N'Ponts Green', N'ponts-green')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (91, N'Telham', N'telham')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (92, N'Whatlington', N'whatlington')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (93, N'Ashburnham Place', N'ashburnham-place')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (94, N'Cliff End', N'cliff-end')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (95, N'Fairlight', N'fairlight')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (96, N'Guestling Green', N'guestling-green')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (97, N'Guestling Thorn', N'guestling-thorn')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (98, N'Pett', N'pett')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (99, N'Icklesham', N'icklesham')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (100, N'Winchelsea', N'winchelsea')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (101, N'Winchelsea Beach', N'winchelsea-beach')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (102, N'Silver Hill', N'silver-hill')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (103, N'Baldslow', N'baldslow')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (104, N'Bulverhythe', N'bulverhythe')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (105, N'Cooden', N'cooden')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (106, N'Little Common', N'little-common')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (107, N'Lunsfords Cross', N'lunsfords-cross')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (108, N'TN40', N'tn40')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (109, N'TN21', N'tn21')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (110, N'TN19', N'tn19')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (111, N'TN18', N'tn18')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (112, N'Four Throws', N'four-throws')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (113, N'Hawkhurst', N'hawkhurst')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (114, N'High Street', N'high-street')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (115, N'Linkhill', N'linkhill')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (116, N'Newenden', N'newenden')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (117, N'Sandhurst', N'sandhurst')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (118, N'The Moor', N'the-moor')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (119, N'Boarzell', N'boarzell')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (120, N'Burwash', N'burwash')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (121, N'Burwash Common', N'burwash-common')
GO
print 'Processed 100 total records'
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (122, N'Burwash Weald', N'burwash-weald')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (123, N'Coopers Corner', N'coopers-corner')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (124, N'Etchingham', N'etchingham')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (125, N'Swiftsden', N'swiftsden')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (126, N'Witherenden Hill', N'witherenden-hill')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (127, N'Broadoak', N'broadoak')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (128, N'Burlow', N'burlow')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (129, N'Cade Street', N'cade-street')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (130, N'Chapel Cross', N'chapel-cross')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (131, N'Cross in Hand', N'cross-in-hand')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (132, N'Dallington', N'dallington')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (133, N'Foxhunt Green', N'foxhunt-green')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (134, N'Horam', N'horam')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (135, N'Little London', N'little-london')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (136, N'Maynards Green', N'maynards-green')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (137, N'Punnetts Town', N'punnetts-town')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (138, N'Rushlake Green', N'rushlake-green')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (139, N'Three Cups Corner', N'three-cups-corner')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (140, N'Vines Cross', N'vines-cross')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (141, N'Waldron', N'waldron')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (142, N'Warbleton', N'warbleton')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (143, N'Ticehurst', N'ticehurst')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (144, N'Ashdown', N'ashdown')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (145, N'Conquest', N'conquest')
INSERT [dbo].[Locations] ([LocationId], [LocationName], [LocationFriendlyUrl]) VALUES (146, N'Maze Hill', N'maze-hill')
SET IDENTITY_INSERT [dbo].[Locations] OFF
/****** Object:  Table [dbo].[PostCategories]    Script Date: 02/17/2010 11:33:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PostCategories](
	[PostCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[PostCategoryName] [nvarchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
 CONSTRAINT [PK_PostTypes] PRIMARY KEY CLUSTERED 
(
	[PostCategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[PostCategories] ON
INSERT [dbo].[PostCategories] ([PostCategoryId], [PostCategoryName]) VALUES (1, N'Offered')
INSERT [dbo].[PostCategories] ([PostCategoryId], [PostCategoryName]) VALUES (2, N'Wanted')
INSERT [dbo].[PostCategories] ([PostCategoryId], [PostCategoryName]) VALUES (3, N'Taken')
INSERT [dbo].[PostCategories] ([PostCategoryId], [PostCategoryName]) VALUES (4, N'Unclassified')
SET IDENTITY_INSERT [dbo].[PostCategories] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 02/17/2010 11:33:24 ******/
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
	[UserSearchRadiusMiles] [int] NOT NULL,
	[UserLink] [nvarchar](250) COLLATE Latin1_General_CI_AS NULL,
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
INSERT [dbo].[Users] ([UserId], [UserName], [UserEmail], [UserPassword], [UserPostcode], [UserSearchRadiusMiles], [UserLink], [UserIsActive], [UserDateCreated], [RoleId]) VALUES (10, N'sclode', N'sclode@hodes.co.uk', N'1B4E9835735B0FB2EF62623D0E392EC40E0C339F', NULL, 0, N'', 1, CAST(0x00009CF500B87838 AS DateTime), 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserEmail], [UserPassword], [UserPostcode], [UserSearchRadiusMiles], [UserLink], [UserIsActive], [UserDateCreated], [RoleId]) VALUES (15, N'anonymous', N'anon@jumblist.co.uk', N'1B4E9835735B0FB2EF62623D0E392EC40E0C339F', NULL, 0, NULL, 1, CAST(0x00009D1D00000000 AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Feeds]    Script Date: 02/17/2010 11:33:24 ******/
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
INSERT [dbo].[Feeds] ([FeedId], [FeedName], [FeedFriendlyUrl], [FeedUrl], [FeedUsername], [FeedPassword], [FeedCheckIntervalTicks], [FeedLastUpdateHttpStatus], [FeedLastUpdateDateTime], [FeedCategoryId]) VALUES (2, N'Rye Freecycle', N'rye-freecycle', N'http://groups.yahoo.com/group/rye-freecycle/messages/?xm=1&o=1&l=1&m=e', N'noostu', N'edinburgh', 10000, N'200', CAST(0x00009BC900000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Feeds] OFF
/****** Object:  Table [dbo].[Posts]    Script Date: 02/17/2010 11:33:24 ******/
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
	[PostCategoryId] [int] NOT NULL,
	[PostLatitude] [float] NULL,
	[PostLongitude] [float] NULL,
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
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (2, 0, N'36909', N'http://groups.yahoo.com/group/hastings-freecycle/message/36909?l=1', N'Wanted please; 6ft clothes rail', N'Hi I need a 6t clothes rail and can collect at any time many thanks paula', CAST(0x00009CAE00C3D4D0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 50.12, 0.23, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (3, 0, N'36908', N'http://groups.yahoo.com/group/hastings-freecycle/message/36908?l=1', N'Wanted- roofing felt for shed TN38', N'Wanted: roofing felt for shed, please.
Having Freecycled our end of roll a couple of years ago, we now need some to
repair a leaking allotment shed.

Thanks,
Sarah', CAST(0x00009CAE00BFFC70 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 50.1111, 0.1221, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (4, 0, N'36907', N'http://groups.yahoo.com/group/hastings-freecycle/message/36907?l=1', N'OFFERED: 2 seater sofa TN38', N'This sofa is cream with removeable covers... It does need a wash as it has been
in daughters bedroom so the arms are filthy, but I do not have time to wash it
as it needs to go asap.

It will fit in an estate car.....

Collection from opposite Tescos Hollington

Mel', CAST(0x00009CAE00BBDDC0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 52.1111, 0.2133, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (6, 0, N'36906', N'http://groups.yahoo.com/group/hastings-freecycle/message/36906?l=1', N'OFFERED - few items here, might be worth a read! TN38 hollington area', N'	

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

Thank you for reading', CAST(0x00009CAE00B4FFF0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 51.1111, 0.433, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (11, 0, N'36905', N'http://groups.yahoo.com/group/hastings-freecycle/message/36905?l=1', N'OFFERED Built-In Fridge Sedlescombe', N'Ariston, probably 9 yrs old (came with the house so might be newer, but not
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

Nigel', CAST(0x00009CAE00B054A0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 50, 0.2332, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (13, 0, N'36885', N'http://groups.yahoo.com/group/hastings-freecycle/message/36885?l=1', N'wanted undercounter fidge with freezer compartment', N'anythings a possibility x', CAST(0x00009CAD0112EED0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 50.12213, 0.123123, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (14, 15, N'36881', N'http://groups.yahoo.com/group/hastings-freecycle/message/36881?l=1', N'Taken - Grove School sweatshirts, lampshades still available.', N'Thank you for your interest, these have now gone.', CAST(0x00009CAD00A4CB80 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 3, 49.989, 0.123111, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (15, 0, N'36857', N'http://groups.yahoo.com/group/hastings-freecycle/message/36857?l=1', N'Offered - Grove School polo and sweatshirts.', N'2 sweatshirts, one from wards size medium, one made by uneek, size XS. 3 polo shirts, one from wards size 36, 2 fruit of the loom 152cm. Must be picked up today. TN37  area.', CAST(0x00009CAD009DEDB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 49.989, 0.123111, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (24, 0, N'http://tests', N'http://tests', N'Another sofa in brede', N'another test', CAST(0x00009D17008E8C30 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (25, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40263?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40263?l=1', N'WANTED AND OFFERED: TN34: Wanted - piece of carpet approx. size', N'9ft x 9ft or similar.  Required for newly set up garage &quot;gym&quot; (in the loosest
sense of the word)so not too fussed on colour.

Also OFFERED: White (plasticised) expandable clothes airer. Used but still
serviceable!

Drop me a line and I''ll get back to you via e mail. We
based (upper part) St Helens Down just off The Ridge.', CAST(0x00009D1801217D60 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (26, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40262?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40262?l=1', N're:Taken', N'Cot mattress taken and collected.  Sorry to those who missed out.

[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (27, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40261?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40261?l=1', N'WANTED: Small working fridge for Pier Trust', N'Hi everyone,

Hastings Pier &amp; White Rock Trust are seeking a small, working fridge for their
shop so the volunteers can have a cup of tea to keep them going!

We can collect.

Thanks in advance.

Angela', CAST(0x00009D1801217D60 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (28, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40260?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40260?l=1', N'WANTED--PLEASE HELP', N'please can anyone help.....i am moving in to my first flat in 2 weeks and my
money funds have pretty much dryed up theres a few things i still need so if
anyone could help with the following i would be soooo greatful!!!!
tv stand holds 32&quot; tv
sofa
washing machine
small dining table and chairs
moving boxes!!
small coffee table
thanks in advance becci




[Non-text portions of this message have been removed]', CAST(0x00009D1801217D60 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (29, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40259?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40259?l=1', N'Taken- rug and wall lights', N'Thank you to everone who expressed an interest.






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




[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (30, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40258?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40258?l=1', N'Wanted Items TN38', N'My Daughter and Son in-law are just about to move into a new flat. They are
looking for book-shelves (they are both avid readers and have masses of books),
an armchair and a fridge-freezer (not enough room for seperates).
Would love to hear from anyone that can help with any of these.
Kind regards, Debra



_________________________________________________________________
Do you have a story that started on Hotmail? Tell us now[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (31, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40257?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40257?l=1', N'Wanted sponge or foam for pets bed.', N'Hi all, has anyone got a piece of sponge or foam about 6 foot long by 2 foot
wide please. Can collect.thanks Charlie.', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (32, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40256?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40256?l=1', N'Taken Printer Inks', N'Epson compat. inks gone. Just like that.', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (33, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40255?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40255?l=1', N'OFFERED - Various', N'Yet more stuff......

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

[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (34, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40254?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40254?l=1', N'Offered Parrot Cage', N'Hi,
To start with I live in Sedlescombe and the items you will have to arrange pick
up.

I have a Parrot Cage which will be suitable for a parrot or anything of a
similar type of size  and a metal chair which has a vinyl seat and back rest to
it.
If interested please call Paul on 01424 871610

[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (35, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40253?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40253?l=1', N'OFFERED VARIOUS TN35 WESTFIELD', N'One old toshiba Laptop. Don''t get excited. really doesnt work on account that my
son has ripped it to shreds in a bid to &quot;find out how it works&quot; it has no hard
drive either. The screen is ok and the battery is there.  anything else is a
bonus.  it may be ok for spares?

Electrolux hoover bags for an upright hoover.

Wall tiles  ( approx 50) in shades of blue, lilac.

Bop it childs toy    Still offered!!!  electronic sound thing.

Bathroom corner cabinet in white, with mirror.  needs a good clean but would be
ok after that.  too good to tip


I will wait a while before deciding who to give to,', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (36, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40252?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40252?l=1', N'Offered TN37 TV Cabinett .', N'Hi , I have a Mahogony TV cabinett , the type where the TV goes inside . Also
has a Mock draw for DVD ,Video. Must go by Thursday or its off to the tip.
Harrow Lane. Land line only please.', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (37, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40251?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40251?l=1', N'OFFERED Printer Ink', N'&gt; Epson compatible inks for Epson stylus photo
&gt; R200/R300/R300M/R320/RX500/RX600/RX620
&gt; Magenta, light magenta, cyan, black (Inkrite)
  Epson stylus Color
&gt; 740/850/860/1160/1520: black (Jet-tec)', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (38, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40250?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40250?l=1', N'wanted', N'hi all freecyclers does any body have a old dart dart board and darts they no
longer need plz email and let me know thanks
carl', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (39, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40249?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40249?l=1', N'Wanted - Alvin the Chipmunk - McDonalds Toy', N'Hi All,

My little boy loves all things Alvin right now and keeps asking if we can have
an Alvin toy, i.e. the red one that McDonalds has been giving away.  He''s got
the other two boys and doesn''t want the girly ones, &quot;euggh!&quot; in his words.

Just wondered if anyone had one lying around looking for a place to go.

Many thanks,

Adam.', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (40, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40248?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40248?l=1', N'wanted playstation 1 controllers', N'just wondering if anyone had any ps 1 controlollers and games they dnt want also
im in need of a ide pc harddrive it would be wiped of all information and xp
installed on it for my pc thanks can collect anytime', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (41, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40247?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40247?l=1', N'WANTED. DIGI BOX.', N'HI ALL, HAS NAYONE GOT A FREEVIEW DIGI BOX I CAN HAVE PLEASE, CAN COLLECT. MANY
THANKS MARTIN.', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (42, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40246?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40246?l=1', N'Wanted: red cotton material', N'Dear all

am after an old red sheet or similar.  Doesn''t matter if it is ripped as I am
making some bunting (and already have blue and white sheets).

Thanks
Ali', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (43, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40245?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40245?l=1', N'OFFERED - Various!', N'Ongoing household cull has revealed the following:

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



[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (44, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40244?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40244?l=1', N'OFFERED: KENWOOD TABLE TOP MINI DISHWASHER', N'Hi,
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





[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (45, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40243?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40243?l=1', N'Offered Again: A4 4-Ring Binders, ALSO Electric hairdryer Hollington, St Leonards', N'Hello Chaps and Chapesses

I cleaned up some more A4 4-Ring Binders and have passed on 9 so far; there
remain another 8 on offer if anyone else wants.

Also offered a Pifco Princess Hairdryer with stand, hose and hood..� It probably
dates from the 1970s but still works and has been kept in its original box.

Bryan




[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (46, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40242?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40242?l=1', N'OFFERED: Items for girl''s bedroom', N'There are a few items which have come from my daughter''s old bedroom - she is
now a little older and had grown out of the stuff - there is absolutely nothing
wrong with them - would suit a girl''s bedroom who is under 10 maybe

SIX HOOK COAT/BAG HANGER - PRETTY COLOURFUL BEACH HOUSE DESIGN

CEILING LAMPSHADE - HANGING BLUE AND WHITE FLOWERS IN CHANDELIER STYLE

A BEAUTIFUL LILAC MOSQUITO STYLE NET WITH PRETTY PINK FABRIC FLOWERS SEWN ON -
HANGS FROM A CIRCULAR TUBE SUSPENDED FROM CEILING AND DRAPES ALL ACROSS THE SIZE
OF THE BED.

LARGE PINK PLASTIC FLORAL WALL LIGHT.

A FEW OTHER LITTLE DECORATIONS FOR HANGING OR PUTTING ON SHELVES

Thanks for your time', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (47, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40241?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40241?l=1', N'Taken: Old doll''s House - magazines still avaiable', N'The doll''s house went very quickly to a very deserving family - so sorry to
disappoint so many people.

The fishing and animal and bird magazines are still available





[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (48, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40240?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40240?l=1', N'Offered: Small packaging materials', N'I have on offer a variety of padded envelopes, some cardboard packaging off
books, a couple of small boxes and a few single DVD boxes all used when I have
been sent books or discs.

May be handy for a charity shop or an ebayer.

Collect Sedlescombe or may be able to deliver if to a local charity.

Mags', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (49, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40239?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40239?l=1', N'TAKEN: Casio CTK-601 Keyboard', N'Sorry to all of you who tried, but the keyboard now has a new home.

Catrina', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (50, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40238?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40238?l=1', N'RECEIVED: Books', N'Thanks to Ann for the books!

Caz




[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (51, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40237?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40237?l=1', N'RECEIVED: Cake turntable', N'Thanks to Bev for the cake turntable, it''s perfect!

Caz




[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (52, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40236?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40236?l=1', N'RE: offered again again', N'Ok I have tried to give this away twice now and people keep saying they want it
but not getting back to me.  PLEASE only respond if genuinely interested.

I have a cot matttess in very good condition.  My daughter used it for 18 months
but it has never been soiled and i would hate to just throw it away but I may
have to if no one wants it.

Please leave me your number and I will call you to arrange collection.

Tthanks for reading.

tina
Clive Vale


[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (53, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40235?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40235?l=1', N'Offered- from nr Morrisons, old quilt', N'I''ve just upgraded the continental quilt so the old one''s on offer. Although
it''s not very old and it''s clean, the cover has torn so the stuffing has fallen
out and it''s not a high quality quilt (hence the replacement). It would be
useful for a dog''s bed or the stuffing may be useful for craft projects.
Heather

[Non-text portions of this message have been removed]', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (54, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40234?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40234?l=1', N'Wanted - Carpet a small bit', N'Hi I am in need of a bit of carpet no smaller than a foot wide, and about 2.5
meters long or 2 smaller bits that I can join together etc.
Colour not a problem.
Can collect any time to suit.

Many thanks
Charley', CAST(0x00009D180121A5C6 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (55, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40297?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40297?l=1', N'Wanted: Wooden trunk', N'I am looking for a wooden trunk for clothes storage if anyone has a
spare or one they no longer need.



[Non-text portions of this message have been removed]', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (56, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40296?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40296?l=1', N'WANTED: TN34 SPEAKERS FOR COMPUTER', N'Does anyone have a spare pair of speakers to plug into a computer? My new
monitor doesn''t have sound. I don''t have transport so Hastings/St Leonards area
is best for me. Thanks!', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (57, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40295?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40295?l=1', N'Re -offered Sofa Bed and armchair', N'Perhaps I should explain these are a matching pair in yellow and are what I
would call ''proper'' furniture. i.e. not small, they have a good wooden frame
and are upholstered. The sofa bed has a pull out metal framed bed it''s not
just a futon. The kids have made the yellow mucky, which is why we are
getting new things but I think they will steam clean well. Could do with it
gone at the weekend.



Keith



[Non-text portions of this message have been removed]', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (58, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40294?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40294?l=1', N'TAKEN - assorted', N'Collected today, Kodak digital camera, one printer stand, Event Manager''s Bible.

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





[Non-text portions of this message have been removed]', CAST(0x00009D180156B256 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (59, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40293?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40293?l=1', N'Offered - internal glazed French doors', N'A set of two (one pair) of stained (medium brown), glazed, wooden internal
French doors each door measures 26 and a half inches wide and 77 inches high. 
They are good quality and in excellant condition and have 15 panes of glass in
each door.  Each pane of glass is bevelled and stippled in the middle. They
could be painted to match decor!

Collect from just off The Green in St Leonards', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (60, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40292?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40292?l=1', N'Wanted: PC Power supply', N'Hi all
has anyone got a desktop pc power supply or an old desktop pc i can rob some
parts, a 300w + power supply even if its still in the tower case,
please email.
thanks for reading
Steve', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (61, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40291?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40291?l=1', N'wanted - turf or grass seed, any quantity or type', N'The allotment has taken a real beating over the last few months and there
doesn''t appear to be much grass left on the pathways! So, if anyone has any turf
or grass seed surplus to requirements, I will gladly come and pick it up.
Thanks, Anton.', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (62, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40290?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40290?l=1', N'Wanted: ''Lexx'' DVDs or videos', N'Hi all,

I''m looking for any old ''Lexx'' (sci-fi programme on tv about 10 years ago)
videos or dvds you might not want anymore, on behalf of my husband...

01424/ 850816

Cheers, Katherine', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (63, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40289?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40289?l=1', N'WANTED PLEASE: LARGE DOG BED', N'Hi, I still need one large dog bed please, preferably plastic so I can scrub,
its for a fully grown lab.
Many thanks
Pauline', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (64, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40288?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40288?l=1', N'WANTED: electric fire and Blinds TN34 Blacklands', N'Has anyone got a electric bar fire and window blinds about 4'' to 5''
Thanks Chris





[Non-text portions of this message have been removed]', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (65, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40287?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40287?l=1', N'WANTED: Table top oven/grill', N'Does anyone have a table top oven/grill they no longer use? I''m looking for
something like a Baby Belling.', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (66, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40286?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40286?l=1', N'wanted ; mircalite fastfold pushchair / buggy', N'hi
does anyone have one of these as i have the carry cot but nothing for it to go
on
many thanks
wendy', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (67, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40285?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40285?l=1', N'WANTED: Garden furniture/broom AND freezer', N'Would love if someone had some old garden furniture that is being thrown out for
new!

And looking for a tough outdoor broom to make good off all the fallen soggy
leaves.


Also, we''ve outgrown our tiny freezer and was wondering if anyone had a working
one, possibly with at least 5 drawers, on offer.


Thank you very much. I can collect whenever most convenient.', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (68, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40284?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40284?l=1', N'WANTED; kids or any bedroom warbdrows and sets', N'i have 3 kids and no wardows and chests of draws would give a good home thanks
for time kathy', CAST(0x00009D180156B256 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (69, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40283?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40283?l=1', N'WANTED: Various', N'I have just moved into a small flat in St leonards and would like the following
if in working order:

Small fridge sized freezer
tumble dryer
washing machine
armchair
tv cabinet
also other bits and peices if available
Can collect from local area

Thanks

Ian', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (70, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40282?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40282?l=1', N'wanted please: wicker basket/hamper (hailsham)', N'hi, please if anyone as one they no longer need id be so grateful. thanks emma', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (71, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40281?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40281?l=1', N'wanted: small working tumble dryer', N'Can collect asap

Thanks', CAST(0x00009D180156B256 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (72, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40280?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40280?l=1', N'Wanted: PS2 controller and/or memory card', N'hi there,

i WANT TO PLAY 2-PLAYER ON MY PS2 and need another controller and memory card -
can anyone help

x dave cleasby, hastings area...will collect

01424443008

_________________________________________________________________
Send us your Hotmail stories and be featured in our newsletter[Non-text portions of this message have been removed]', CAST(0x00009D180156B256 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (73, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40279?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40279?l=1', N'OFFERED: Commode and cutlery.', N'Little used commode in excellent clean condition requiring new owner.

Also have some Ikea cutlery -Stainless steell , black handles - 6 place setting
almost complete.

Emailwith phone number', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (74, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40278?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40278?l=1', N'OFFERED TN389HP BIN LINER OF LADIES CLOTHES SIZES 10-12', N'HELLO ALL I HAVE A BIN LINER OF LADIES CLOTHES SIZES 10 TO 12 JEANS,TOPS
TROUSERS, SKIRTS THANKS FOR LOOKING', CAST(0x00009D180156B256 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (75, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40277?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40277?l=1', N'offered (seaford)', N'hi freecyclers i have an empty pc case and small dvd player and few more bits to
find if anyone is interested? Not sure if the dvd player works as been sitting
in the loft.. As soon as i have sorted the rest out will let you all know..
Cheers steve...', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (76, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40276?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40276?l=1', N'OFFERED; HANSOL 900 P CONSOl. Approx. 18&quot;', N'I have the above which is in good working order, a bit big but good for anyone
just starting out with a computer.
Please call landline for more information. Tel; 01424 423325

Best Regards
Chris', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (77, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40275?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40275?l=1', N'OFFERED king size bed and mattress', N'Offered King size divan bed and mattress in very good condition.  Near
Bexhill High in Bexhill. Please email with landline number.


[Non-text portions of this message have been removed]', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (78, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40274?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40274?l=1', N'OFFERED. ADULT MOUNTAIN BKE.', N'HI ALL, I HAVE A GT AGGRESSOR MOUNTAIN BIKE, THE GEARS ARE BROKEN, JUST NEEDS A
NEW REAR DRALIER AND CHAIN I THINK, BUT APART FROM THAT IT''S A GREAT BIKE, VERY
LIGHT TO CARRY, IT HAS SEEN ME PROUD FOR YEARS, IT DOESNT RUST, FRONT SUSPENSION
AND 24 GEARS, SO IT''S U[P FOR GRABS. MARTIN.', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (79, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40273?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40273?l=1', N'offered', N'Hi have five mens shirts to offer they are new but need ironing
and are size 17 1/2 collar 3 white  1 pink 1blue
  Thanks for looking

Rosalind 230', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (80, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40272?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40272?l=1', N'offer - a few items - TN38', N'plastic wallets/polypockets (whatever they''re called!)
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




[Non-text portions of this message have been removed]', CAST(0x00009D180156B256 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (81, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40271?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40271?l=1', N'Offered- Yamaha Organ - TN35 area', N'Yamaha Electone FC10F Electronic Organ on offer.�
�
Piece of furniture rather than just a keyboard, more details or pictures
available upon request or feel free to view.

Regards

Bob

[Non-text portions of this message have been removed]', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (82, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40270?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40270?l=1', N'OFFERED: Epson Scanner, St Helens, TN34', N'Hi everyone,

I have an Epson Perfection 2480 Flatbed Photo Scanner (in spite of name it is a
general purpose scanner)that wants a new home.  It is in good condition and was
working well when last used a couple of months ago. It is a bit slow and
cumbersome though. Comes complete with Driver and cables. My new printer scans
as well so it''s surplus to requirements.

Nick', CAST(0x00009D1801567FB0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (83, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40269?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40269?l=1', N'Offered: Various', N'Hi, we have on offer the following:

-broken-down washing machine for spares

-broken-down tumble dryer for spares

-broken-down hoover (upright) for spares

-slightly damaged, but still usable green, round, plastic garden table (+ 4
chairs to match, but all slightly damaged, can be sat on putting 2 chairs
together...)

If anyone is interested, please email, or call 01424/ 850816.

Must be collected, as we don''t drive. Hollington area of St. Leonards.

Cheers, Katherine', CAST(0x00009D180156B256 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (84, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40268?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40268?l=1', N'OFFERED: Various please read, Pebsham', N'* Sofa, three seater, all removable cushions, with matching armchair and pouffe.
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
Hayley.', CAST(0x00009D180156B256 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (85, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40330?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40330?l=1', N'WANTED: old style wardrobe', N'Wanted double wardrobe old style in dark wood, not chipboard, to suite victorian
house. Can pick up. Thanks please contact 07542 913493', CAST(0x00009D190123F630 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (86, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40329?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40329?l=1', N'WANTED; chair plz read ty', N'hiya, i need a chair for my bedroom i think its called a ratten chair? its
smallish and wicker i think??? i have posted a link 4 a pic of chair i mean, it
doesnt matter if its not white i just need a small chair 4 my room thanks for
looking :)[IMG][/IMG]', CAST(0x00009D1901259C10 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (87, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40328?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40328?l=1', N'Wanted: Suit or jacket', N'I have a student currently going for interviews who wants to make a good
impression. The jackets I have are way too big for him! A black suit would be
great - 32'''' chest, trousers waist 31-32''''. Failing that a jacket would be fine.

Thanks

Mags', CAST(0x00009D1900DC46A0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (88, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40327?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40327?l=1', N'wanted roof slates', N'hello everyone. we are hoping to put a new porch roof up shortly,but we are in
need of roof slates. Has anyone by chance got any?? we can collect. many Thanks.', CAST(0x00009D1900D86E40 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (89, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40326?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40326?l=1', N'wanted/microwave', N'hello everyone im in need of a new microwave oven,can anybody help thanks for
reading regards,tina and lee




[Non-text portions of this message have been removed]', CAST(0x00009D1900FCF5D0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (90, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40325?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40325?l=1', N'WANTED', N'Does anyone have any oddments of wood for toy making please. Natural wood not
MDF.
I can collect.', CAST(0x00009D18018AAF10 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (91, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40324?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40324?l=1', N'Wanted single bed with mattress - bexhill tn39', N'Hi all was wondering if anyone has a single bed pref with mattress my mum in law
is really needing one. be really apperciated. is for the children so must be in
a fairly good cond. thanks all. tn39 bexhill', CAST(0x00009D19009B74E0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (92, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40323?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40323?l=1', N'Offered - Baby Monitor, Door Bouncer &amp; Childrens Building Blocks - Bohemia Area', N'I have the following on offer:

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
Odette', CAST(0x00009D1900FB09A0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (93, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40322?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40322?l=1', N'Offered- Cooker Hood Extractor- TN35', N'Still on offer as the timewaster failed to collect:-

Kitchen Cooker Hood Extractor fan unit, the type�that is designed to fit between
a row of wall cabinets�when fiited with a decor panel to match.

Recently removed during kitchen refurbishment.

Begards

Bob


[Non-text portions of this message have been removed]', CAST(0x00009D1900B4FFF0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (94, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40321?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40321?l=1', N'OFFERED: computer desk', N'OFFERED computer console, pale wood effect, sliding keyboard shelf, plus CD
rack. TN33

[Non-text portions of this message have been removed]', CAST(0x00009D1900BFFC70 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (95, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40320?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40320?l=1', N'offered TN35', N'I have two pink moses baskets and a TWIN stand up for grabs ideally i''d like
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


[Non-text portions of this message have been removed]', CAST(0x00009D19013357B0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (96, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40319?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40319?l=1', N'OFFERED: Garden plants evergreens, conifer', N'To make room in my garden I have dug up the following:
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

Near Beauport Park Roundabout, e-mail me for directions', CAST(0x00009D1900FB9640 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (97, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40318?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40318?l=1', N'OFFERED TODDLER GIRLS WINTER BOOTS NEW, BAG LADIES &amp; GIRLS CLOTHES AGE 1-2', N'3 pairs of boots, all new, ordered from the states, don''t fit and not worth
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
about why you need it to stand the best chance of getting them!', CAST(0x00009D19011BB8D0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (148, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40338?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40338?l=1', N'Wanted: Videos or dvds: carry ons, only fools and horses, and high spirit film', N'If anyone has any of the following dvds or videos they no longer want, my
husband would be very grateful to receive them:
-any only fools and horses
-any carry ons
-oldish film called ''high spirits''

Thanks for reading, regards,
Katherine', CAST(0x00009D19017CF370 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (149, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40339?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40339?l=1', N'Wanted HP 343/337 Ink Cartridge', N'Hi, have you had a printer that uses the HP-337 black and HP-343 colour
cartridges

If you have HP-337 or HP-343 ink cartriges going spare with ink in
them...im all ears!! and they would be much appreciated!

many thanks

Jo', CAST(0x00009D190158F880 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (150, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40337?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40337?l=1', N'Offered: Ikea uplighter chrome. needs minor electrical repair. tn35', N'nice looking modern light needs a new piece in which to put the light bulb. 
please leave landline no.', CAST(0x00009D190174FC60 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (151, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40336?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40336?l=1', N'WANTED - PAVING SLABS', N'WANTED - PAVING SLABS so I can build a little shed in my garden. I only need a
few. Here`s hoping
Regards, Corinne', CAST(0x00009D190149DD50 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (195, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40335?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40335?l=1', N'wanted', N'any furniture for children''s bedrooms




[Non-text portions of this message have been removed]', CAST(0x00009D190143D270 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (200, 0, N'http://test', N'http://test', N'Wanted: Toy', N'based in pontefract - costing approx £10?

thanks', CAST(0x00009D1A00A36BF0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (228, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40340?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40340?l=1', N'OFFERED: Large Awning for Over Shop', N'Hi,

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

Thanks very much', CAST(0x00009D1A00C7AD30 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (258, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40343?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40343?l=1', N'WANTED: Kitchen sink &amp; drainer and a worktop please!', N'Hi,

I am after a kitchen sink with drainer and a worktop so if anyone has any of
these sitting in their shed/garage can you contact me please?

Thanks!

Angela', CAST(0x00009D1A00F31290 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (259, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40342?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40342?l=1', N'offered: maclaren buggy', N'a slighty battered, but working fine buggy with rain cover and cosy toes.

Zoe', CAST(0x00009D1A00EEF3E0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (262, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40341?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40341?l=1', N'Re: OFFERED: Large Awning for Over Shop', N'Hi, I have found an example photograph of the style of awning that it is, to
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
&gt;', CAST(0x00009D1A00E20B30 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (269, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40334?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40334?l=1', N'offer', N'plates cups glasses and cutlery i live near silverhill




[Non-text portions of this message have been removed]', CAST(0x00009D1901438C20 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 4, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (270, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40333?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40333?l=1', N'TAKEN:STC Garden Plants', N'my goodness what a response! I wish I had more.
I have contacted the first responder now.
If not all plants go (remember some have to be dug out!)I will contact the
others in order. Thanks for your interest.', CAST(0x00009D19017E9950 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 3, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (271, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40332?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40332?l=1', N'Offered: Blacklands, Hastings TN34 2ED Various', N'Hi All

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




[Non-text portions of this message have been removed]', CAST(0x00009D1901803F30 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (272, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40331?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40331?l=1', N'Received: camera and webcam etc. from sandra', N'Camera and webcam etc. received with much thanks today off Sandra. They work
perfectly- thanks Sandra!
Regards, Katherine', CAST(0x00009D19017BDA30 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 4, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (273, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40317?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40317?l=1', N'ofered lexmark printer lydd', N'hi i have a lexmark printer , drivers ,power lead and with ink in printer , its
one of the x1100 multi printers/fax an oldy but was working up till a few weeks
ago when i upgraded to windows 7 and the computer said NO ,worked well on
xp.collection asap would be nice as sitting under the table in the way thanks
for looking spence', CAST(0x00009D1901140810 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 4, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (274, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40316?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40316?l=1', N'OFFERED: Epson Printer Ink', N'Hi everyone,

I have approx. 2 sets of COMPATIBLE inks for use with Epson
R200/R220/R300/R320/R330/R340/RX500S/RX600/RX620/RX640 (6 cartridge printers).

My R200 Stylus Photo printer is also available to anyone who fancies the
challenge of getting it to work properly!

Cheers

Nick', CAST(0x00009D1900D2F000 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (275, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40315?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40315?l=1', N'Offered - shower curtain rings', N'Set of twelve, clear plastic shower curtain rings, quite sturdy - not a lot else
to say about them really!!!

Collect from just off The Green in St Leonards', CAST(0x00009D1900853590 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (276, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40314?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40314?l=1', N'Offered Mahogany Wall Display Unit', N'Hi

I have a large wall unit with bureaux compartment and drinks cabinet plus
display window. very nice top quality unit.

Can provide measurements and photo if any one is interested.

Trudy', CAST(0x00009D1900B964F0 AS DateTime), CAST(0x00009D1A0134B740 AS DateTime), 1, 0, 0, 1, 15, 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (283, 0, N'http://tester', N'http://tester', N'Wanted: Suite or Toy', N'baryesed in hastings or brede', CAST(0x00009D1A014A69F0 AS DateTime), CAST(0x00009D1A014AB1C0 AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (284, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40344?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40344?l=1', N'taken', N'sorry plates cups and glasses have all gone', CAST(0x00009D1A00651300 AS DateTime), CAST(0x00009D1A01599301 AS DateTime), 3, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (285, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40364?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40364?l=1', N'WANTED WORK BENCH', N'Hi everyone has anybody got a workbench please




[Non-text portions of this message have been removed]', CAST(0x00009D1A00F9AA10 AS DateTime), CAST(0x00009D1A0186FD1A AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (286, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40363?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40363?l=1', N'wanted.Sea-shells,', N'if anyone has any sea shells they no longer want or old necklaces made of
shells, I would love them for decorating purposes and garden projects.Thank you
in anticipation', CAST(0x00009D1A00D26360 AS DateTime), CAST(0x00009D1A0186FD4E AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (287, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40362?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40362?l=1', N'WANTED: Red Lake uniform', N'Hi I am after any spare Red Lake jumpers, cardigans or fleeces, ages 5-6 or 8-9
many thanks !!!', CAST(0x00009D1A00B3A060 AS DateTime), CAST(0x00009D1A0186FD57 AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (288, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40361?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40361?l=1', N'furniture wanted!', N'hi has any1 got single bed and matress, wardrobes and chest of drawers please?', CAST(0x00009D1A000278D0 AS DateTime), CAST(0x00009D1A0186FD5C AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (289, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40360?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40360?l=1', N'Wanted stairgate central Hastings', N'I am desperately looking for an opening stairgate .If anyone has one they no
longer use I would be really really grateful.
Thanks for looking. Sue x', CAST(0x00009D1A014BC980 AS DateTime), CAST(0x00009D1A0186FD61 AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (290, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40359?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40359?l=1', N'WANTED: WHITE PRIMER AND WHITE PAINT FOR WOOD', N'If anyone has any leftover white primer and wood paint that they know they wont
use then I would very much appreciate any for a project I''m doing.

Many thanks', CAST(0x00009D1A01266F00 AS DateTime), CAST(0x00009D1A0186FD65 AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (291, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40358?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40358?l=1', N'WANTED - JUMP LEADS &amp; LARGE CARDBOARD BOXES (TN38) - CAN COLLECT', N'Hi Freecyclers

Does anybody have any spare jump leads? Hubby''s car is being VERY temperamental
at the minute &amp; we''re are moving 200 miles away in 2 weeks, and getting a bit
worried about the car starting on the day :(

We are also in need of some large cardboard boxes for the move, if anyone has
any?

Thanks for reading

Maria', CAST(0x00009D1A015B7150 AS DateTime), CAST(0x00009D1A0186FD7D AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (292, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40357?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40357?l=1', N'Wanted - Table Saw - TN38', N'Hiya

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

[Non-text portions of this message have been removed]', CAST(0x00009D1A011494B0 AS DateTime), CAST(0x00009D1A0186FD82 AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (293, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40356?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40356?l=1', N'OFFERED: 4 CLOSER TO NATURE BABY BOTTLES', N'4 feeding bottles minus teats - these can be bought from any chemists.
1 pink non-spill baby beaker

Thanks for looking
jonesy', CAST(0x00009D1A01144E60 AS DateTime), CAST(0x00009D1A0186FD86 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (294, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40355?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40355?l=1', N'OFFERED Central Heating Radiator - St Leonards', N'Central Heating Radiator - single panel - modernish design measures about 7 feet
long X 2 feet high. Currently painted blue.

Must be someone cold out there ?

Last chance before landfill !', CAST(0x00009D1A012DD970 AS DateTime), CAST(0x00009D1A0186FD86 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (295, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40354?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40354?l=1', N'Offered TN37 Tinned Potatoes.', N'Hi, I have 4 x 360g tins of New Potatoes . In date till 2012 . Make is Freshona
. Prob from Lidil. Anyone interested can collect from Harrow Lane . Landline
only please.', CAST(0x00009D1A00982920 AS DateTime), CAST(0x00009D1A0186FD8B AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (296, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40353?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40353?l=1', N'Offered: Various - Large wine rack, K�rcher vacuum cleaner bags and more', N'Offered:  Large wine rack for 48 bottles - nothing fancy just a very basic rack.

Bags for a K�rcher 2001 cleaner

several spools of thin yellow nylon cord.

Qantity of old picture frames.

All to be collected from central St Leonards





[Non-text portions of this message have been removed]', CAST(0x00009D1A011B2C30 AS DateTime), CAST(0x00009D1A0186FD90 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (297, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40352?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40352?l=1', N'Offered - hardcore', N'Substantial amount of hardcore available, to collect from The Ridge, Hastings. 
Easy access for loading into car or trailer

Jackie', CAST(0x00009D1A01217D60 AS DateTime), CAST(0x00009D1A0186FD94 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (298, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40351?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40351?l=1', N'offered hollington z-bed', N'hi

have a z-bed looking for a new home, its old but very comfy.

Anja', CAST(0x00009D1A0152A750 AS DateTime), CAST(0x00009D1A0186FD94 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (299, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40350?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40350?l=1', N'OFFERED: pillows, cushions, bedlinen', N'Two square cushions in thick navy twill covers, two hollowfibre pillows, some
duvet covers, and a pillowcase or so. All to go at once please from West Hill
Hastings.', CAST(0x00009D1A00EFC6D0 AS DateTime), CAST(0x00009D1A0186FD99 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (300, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40349?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40349?l=1', N'Offered, Ore village area', N'Non-working electric guitar. The electics that don''t work and it needs the top
two strings. Make is Rockwood (by Hohner)




[Non-text portions of this message have been removed]', CAST(0x00009D1A00CFEA90 AS DateTime), CAST(0x00009D1A0186FD9E AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (301, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40348?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40348?l=1', N'OFFERED TN389HP CANNON NPI550 PHOTOCOPIER', N'HELLO ALL WE HAVE PICKED UP A PHOTOCOPIER FROM A FELLOW FREECYCLER IT HAS 3
SPARE TONERS AND IT COMES WITH ITS CABINATE UNFORTUNATELY WE  CANT SEEM TO SORT
THE PROBLEM OUT WITH IT IT SAIS PAPER JAM BUT THERE ISNT A PAPER JAM THIS WILL
BE  A FANTASTIC PIECE OF EQUIPMENT ONCE THE PROBLEM IS SORTED WE JUST DONT HAVE
THE TIME TO DO IT THIS MUST GO ASAP PLEASE', CAST(0x00009D1A00ED07B0 AS DateTime), CAST(0x00009D1A0186FDA2 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (302, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40347?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40347?l=1', N'Offered - Computer desk', N'Offered metal compuer desk, similar style�to argos pg747 no 4. Has�got
a�slight�dent on 1 side of the shelf that the monitor sits on, but doesnt effect
the overall�use of the desk.
�




[Non-text portions of this message have been removed]', CAST(0x00009D1A00963CF0 AS DateTime), CAST(0x00009D1A0186FDA7 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (303, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40346?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40346?l=1', N'TAKEN: Epson Printer Ink', N'Ink now taken STC.  Thanks to all who replied', CAST(0x00009D1A00AE6870 AS DateTime), CAST(0x00009D1A0186FDAC AS DateTime), 3, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (304, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40345?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40345?l=1', N'TAKEN: lots of useful stuff - gardening tools, watch, curtains', N'Thanks to everyone who responded so postively to the posting for the gardening
tools, the Sekonda watch and the curtains. These have been taken but the pillows
and tea towels are being re-posted. The Bobby McFerrin video has gone to a
charity shop, so that''s off the list as well.', CAST(0x00009D1A00F099C0 AS DateTime), CAST(0x00009D1A0186FDB0 AS DateTime), 3, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (305, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40429?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40429?l=1', N'offered large tv and large monitor hastings', N'i have a 27&quot; tv dark grey old type not flat screen with remote very well used
the aerial socket broken but works with scart lead.

i have a an 18&quot; monitor old type not flat screen well used but works.', CAST(0x00009D1D01380300 AS DateTime), CAST(0x00009D1D0158CC6D AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (306, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40428?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40428?l=1', N'TAKEN: Pillows, cushions, bedlinen', N'Thanks for the interest.', CAST(0x00009D1D0144A560 AS DateTime), CAST(0x00009D1D015946FB AS DateTime), 3, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (307, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40427?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40427?l=1', N'RECEIVED WITH THANKS !!! BUNK BEDS !!!', N'Huge Massive Ginormous thanks to Lisa for the fabulous bunk beds !!!

What would we do without Freecycle eh ??!!



Absolutely fabulous !!!



Rose

Clive Vale xx

_________________________________________________________________
Got a cool Hotmail story? Tell us now[Non-text portions of this message have been removed]', CAST(0x00009D1D0140CD00 AS DateTime), CAST(0x00009D1D01598546 AS DateTime), 4, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (308, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40426?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40426?l=1', N'Wanted - Carpet (Rye Area)', N'Hello there,

Is anyone in the process of replacing a carpet at the moment as I am looking for
a brown/beige/cream coloured one at least 4m x 5m. I don''t have any on the floor
at the moment and it is incredibly cold underfoot.

I would really appreciate anything and thank you for taking the time to read
this .', CAST(0x00009D1D012D9320 AS DateTime), CAST(0x00009D1D0158CD08 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (309, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40425?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40425?l=1', N'TAKEN: COT - STILL ON OFFER : SINGLE DIVAN - Clive Vale Area', N'Hi GUYS !!



The cot is taken I''m afraid, subject to collection.



Still have the single divan - great condition, storage underneath !!   Any
takers ??   Would like collected today if possible please !!!   no mattress.

Desperately need the space !!!!





Rose xxx

_________________________________________________________________
Tell us your greatest, weirdest and funniest Hotmail stories[Non-text portions of this message have been removed]', CAST(0x00009D1D00F9AA10 AS DateTime), CAST(0x00009D1D0158CD11 AS DateTime), 3, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (310, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40424?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40424?l=1', N'Offered: Ore village area', N'Offered:Steering wheel/pedals for Playstation.
Gratefully received from another Freecycler some months ago but now no longer
needed.




[Non-text portions of this message have been removed]', CAST(0x00009D1D01213710 AS DateTime), CAST(0x00009D1D0159A5B3 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (311, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40423?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40423?l=1', N'offered----single divan base and cube toy', N'i have offered a single divan base, good condition, i kept matterss for my
daughters new metal frame bed

and

a cube toy thingy, toddler toy

email only please,
jane
tn38', CAST(0x00009D1D01213710 AS DateTime), CAST(0x00009D1D0158CD29 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (312, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40422?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40422?l=1', N'Wanted - TV Stand', N'Wanted a TV stand or pededstal for a 37&quot; Panasonic Plasma monitor. No suitable
wall.', CAST(0x00009D1D010300B0 AS DateTime), CAST(0x00009D1D0158CD37 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (313, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40421?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40421?l=1', N'Offered Blacklands: Pampering set', N'This is a foot spa, Face steamer and smaller attachment and massager with
three different heads.  Not boxed but just given it a good wash and clean up
as it was in the loft.



Thanks for reading



Kay



[Non-text portions of this message have been removed]', CAST(0x00009D1D012814E0 AS DateTime), CAST(0x00009D1D0158CD45 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (314, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40420?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40420?l=1', N'TAKEN - TABLETOP COOKER', N'Sorry everyone, this went in the first half hour! Regards, Corinne', CAST(0x00009D1D01133520 AS DateTime), CAST(0x00009D1D0158CD53 AS DateTime), 3, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (315, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40419?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40419?l=1', N'taken girl clothes bexhill', N'sorry but baby girls clothes have now gone', CAST(0x00009D1D00E85C60 AS DateTime), CAST(0x00009D1D0158CD61 AS DateTime), 3, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (316, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40418?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40418?l=1', N'wanted/ram/hard drives', N'hello everyone im in the process of building computers for under privileged
children,i need some sd ram/ddr ram/and any hard drives would be ideal thanks
for reading ,lee




[Non-text portions of this message have been removed]', CAST(0x00009D1D00E20B30 AS DateTime), CAST(0x00009D1D0158CD6F AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (317, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40417?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40417?l=1', N'OFFERED: Kawai electric organ, books and stool. TN35', N'Lovely electric organ with some music books and stool so all ready to go! We
were given it and I''d love to keep it but don''t have the time to play it and
could do with the space!

Hope someone out there could get some enjoyment from it.

Shanna', CAST(0x00009D1D00D98780 AS DateTime), CAST(0x00009D1D0158CD78 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (318, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40416?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40416?l=1', N'OFFERED : COT AND SINGLE DIVAN - CLIVE VALE', N'Hello Freecyclers !!!!



Lovely cot up for grabs - really good condition, without mattress, light wood.



Single divan, storage underneath, without mattress, really good condition.



Both must be collected TODAY please !!!!



Whoever can promise to come today will get first refusal !!!



Rose

Clive Vale x

_________________________________________________________________
Send us your Hotmail stories and be featured in our newsletter[Non-text portions of this message have been removed]', CAST(0x00009D1D00D5F570 AS DateTime), CAST(0x00009D1D0158CD86 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (319, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40415?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40415?l=1', N'offered', N'i have had a little sort out and have on offer a black bag with age 2-3 boys
clothes in aswell as
a thomas the tank engine phone
pirate toys
a battery operated train
fimbles noisy book and
size 6 thomas wellies
all  to go together asap please', CAST(0x00009D1D00C8C670 AS DateTime), CAST(0x00009D1D0158CD95 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (320, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40414?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40414?l=1', N'OFFERED. CORNER BATH PANEL.', N'STILL PACKAGED SMALL CORNER BATH PANEL - MISTY GREY. IT`S ABOUT 77&quot; LONG AS YOU
FOLLOW THE CURVE.

ALSO RADIATOR AND BRACKETS ( NOT NEW ) BUT GOOD. 32&quot; LONG X 29&quot; HIGH.', CAST(0x00009D1D00C4EE10 AS DateTime), CAST(0x00009D1D0158CDA3 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (321, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40413?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40413?l=1', N'offered girl clothes bexhill', N'Sent from my iPhone', CAST(0x00009D1D00C9DFB0 AS DateTime), CAST(0x00009D1D0158CDA7 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (322, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40412?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40412?l=1', N'Wanted please fencing.', N'We are moving home soon and ned some wooden fencing high enough to keep our dog
from wandering, up to 5ft minimum and as long as possible please, if anyone can
help we would be really grateful.
Thanks Paul.', CAST(0x00009D1D008721C0 AS DateTime), CAST(0x00009D1D0158CDB5 AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (323, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40411?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40411?l=1', N'wanted: cajun/ zydeco music', N'HELP! We''re having a mardi gras party and (whose stupid idea was that??? Mine!)
haven''t really got it together in time (no change there then) I know we have a
tape called Alligator Stomp somewhere in this house but can''t find it. PLEASE if
anyone has any Cajun or Zydeco music on tape or disc that they would be prepared
to pass on to a good home there''s a group of 12 year olds who would love to
dance to it!
Thanks from Jill', CAST(0x00009D1D006F82E0 AS DateTime), CAST(0x00009D1D0158CDBF AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (324, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40410?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40410?l=1', N'WANTED: TV', N'HI HAS ANY ONE GOT A WORKING T.V THEY NO LONGER WANT. IT NEEDS TO HAVE A REMOTE 
NOT FUSSY ON SIZE CAN COLLECT THANK YOU', CAST(0x00009D1C013C6800 AS DateTime), CAST(0x00009D1D0158CDCD AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (325, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40409?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40409?l=1', N'OFFERED - TABLETOP COOKER', N'I have a table top cooker to offer. It`s got an oven/grill and a hotplate. The
timer doesn`t work, but apart from that it`s fine.
Regards,  Corinne', CAST(0x00009D1C0169B990 AS DateTime), CAST(0x00009D1D0158CDDB AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (326, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40408?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40408?l=1', N'OFFERED; 20&quot; SANYO COLOUR TV. NOT FLATSCREEN OR FREEVIEW', N'I have the above, works o.k but need the space!!!
Please contact by landline 01424 423325.

Regards, Chris', CAST(0x00009D1D00A1C610 AS DateTime), CAST(0x00009D1D0158CDE9 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (327, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40407?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40407?l=1', N'Offered (TN38) Cedar Wood Oil, Double Duvet for pets ets', N'1. 100ml Druids Keep Essential Oil: Cedar Wood
Not for undiluted use. Would prefer this to go to someone with some knowledge of
aromatherapy as quite a strong oil.

2. Had a puppy accident on our nearly new duvet which would have cost more to
have cleaned than to replace. Have cut it in two for washing which gives 2 half
duvets for pet bedding after some sewing or maybe just take out the filling for
cushions.  Unsuitable for our pup as he wants to take it apart. Should be dry
and available tomorrow.', CAST(0x00009D1C0132CB10 AS DateTime), CAST(0x00009D1D0158CE00 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (328, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40406?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40406?l=1', N'offered girl clothes bexhill', N'hi i have 2 black sacs of baby girl clothes if amyone wonts them need gone asap
cheers', CAST(0x00009D1C01510170 AS DateTime), CAST(0x00009D1D0158CE0E AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (329, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40405?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40405?l=1', N'OFFERED TWO BLACK CD TOWERS', N'hello freecyclers

I have two black cd towers looking for a new home if you are interested then
please email. only serious emails only please.  needs to go asap as we are
running out of space

thanks for reading
sarah', CAST(0x00009D1C016481A0 AS DateTime), CAST(0x00009D1D0158CE1C AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (330, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40404?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40404?l=1', N'OFFERED TN38HP CARRIER BAG OF GIRLS CLOTHES', N'HELLO I HAVE A CARRIER BAG OF GIRLS CLOTHES SIZES 5-6-7 YRS IF ANY ONE WANTS
THEM', CAST(0x00009D1C00F285F0 AS DateTime), CAST(0x00009D1D0158CE21 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (331, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40403?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40403?l=1', N'WANTED: Fridge Freezer', N'hello peeps, im asking 4 some friends 4 a fridge and a small freezer or a
fridgefreezer, they just got home to find theres not working :((((, they have 2
small children so if any one can help it would b most appreciated, many thanks
to u all :))),', CAST(0x00009D1C0101A120 AS DateTime), CAST(0x00009D1D0158CE34 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (332, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40402?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40402?l=1', N'computer bits and cases tn34', N'offered box of computer inner bits, like graphics cards, procesors, 3 old mother
boards p2 and p3 and a newer one, lots of other bits including

one computer keyboard, works fine just surplus to requirements

2 computer cases one tall one smaller

a really great scanner that DOES NOT work on windows 7, had it working on xp and
below.  compact easy to use, such a shame to dump

would like the bits to go together but will split the cases if people just want
one of them.�

as always with me, please dont say you want them and not come to collect as I do
have a life!!

claire', CAST(0x00009D1C00F58B60 AS DateTime), CAST(0x00009D1D0158CE42 AS DateTime), 4, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (333, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40401?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40401?l=1', N'offered - sandhurst - computer tower', N'i know nothing about this i was given it to me for a project it has everything
in it so would be a project for someone else to put together - no parts need
purchasing just putting back together - please leave a landline number', CAST(0x00009D1C010B3E10 AS DateTime), CAST(0x00009D1D0158CE5E AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (334, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40400?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40400?l=1', N'Taken Ladies Sheepskin Coat', N'The ladies sheepskin coat is now taken. Thanks to all who responded.
D. Mackrill.', CAST(0x00009D1C010B8460 AS DateTime), CAST(0x00009D1D0158CE6C AS DateTime), 3, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (335, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40430?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40430?l=1', N'Wanted- netgear router', N'Wanted a netgear dg824gt or a dg834v4 if anyone has one they no longer need. thx', CAST(0x00009D1D01544D30 AS DateTime), CAST(0x00009D1D015E468F AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (336, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40431?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40431?l=1', N'OFFERED: a few household items', N'Two green nonstick Marks and Sparks saucepans with glass lids - still life in
them!
Two giant white pasta plates/shallow soup-bowls - about 14 inches across,
restaurant-style.
A square double thickness oven sheet needing a good clean. Could be used for DIY
mixing, or baking if clean. Rather carbonised at present!

Preferred if they all went together. Happy for you to sell any of these on if
you want to and can.', CAST(0x00009D1D015EBD10 AS DateTime), CAST(0x00009D1D01610608 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (338, 0, N'http://testingst', N'http://testingst', N'Antohertets', N'I have some grass, a few boxes, bag of clothes, pair of boots and a chair.', CAST(0x00009D1E00C5C100 AS DateTime), CAST(0x00009D1E00C5E2E3 AS DateTime), 1, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (339, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40483?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40483?l=1', N'wanted please for my baby girl baby bouncer chair and working baby monitors', N'hi all, i am in desperste need of the above items as my 3 month old daughter has
got a medical condition that affects her while she is lying flat, (she turns
grey and stops breathing), if anyone has a bouncy chair to help me keep her
upright i would be so grateful, also if anyone has any working monitors so that
i can listen pout for her more easily,
many thanks
sarah', CAST(0x00009D1F00A81740 AS DateTime), CAST(0x00009D1F00BFDA2B AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (340, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40482?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40482?l=1', N'WANTED: LADDER FOR HIGH CEILINGS', N'I''ve recently moved into a flat with very high ceilings and need a ladder so
that I can hang things.  Anyone got one, I would appreciate it.

Regards,
Kerry', CAST(0x00009D1E016C78B0 AS DateTime), CAST(0x00009D1F00BFDAD9 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (341, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40481?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40481?l=1', N'wanted', N'HI can any one help my fone has stoped working and i am in need of an a phone
for t mobile plz email if any thanks
carl', CAST(0x00009D1E018AF560 AS DateTime), CAST(0x00009D1F00BFDB29 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (342, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40480?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40480?l=1', N'WANTED: OUTDOOR PLANTS/CUTTINGS', N'HELLO, I AM TRYING TO REFURB MY GARDEN AND WONDERED IF ANYONE HAS ANY UNWANTED
SHRUBS/PLANTS/CUTTINGS THAT WOULD HELP TO BUILD UP THE BORDERS

MANY THANKS

CATRINA', CAST(0x00009D1E018AAF10 AS DateTime), CAST(0x00009D1F00CF3BE0 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (343, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40479?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40479?l=1', N'WANTED PLEASE. Manual Sheet Metal Bender', N'Hello, if anyone out there has a manual sheet metal bender thats taking up their
space, my husband would like to have one for his projects.
Thanking you, jo', CAST(0x00009D1E0157DF40 AS DateTime), CAST(0x00009D1F00CD939B AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (344, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40478?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40478?l=1', N'Wanted - - 1st home Items Heathfield / Hurst Green / Bexhill', N'Hello All,

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

James', CAST(0x00009D1F008CE650 AS DateTime), CAST(0x00009D1F00CEDE1E AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (345, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40477?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40477?l=1', N'TAKEN: CARL LEWIS AIR WALKER', N'THANKS TO THE VERY QUICK COLLECTION, I WISH I HAD MORE TO GIVE AWAY!!!', CAST(0x00009D1F00754770 AS DateTime), CAST(0x00009D1F00CCCCBD AS DateTime), 3, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (346, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40476?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40476?l=1', N'Received with thanks- carrier bag of girl''s clothes', N'Thanks Becky, for the clothes, my daughter loves them, and they are just the
right size for her! Thanks! Katherine', CAST(0x00009D1E017615A0 AS DateTime), CAST(0x00009D1F00BFDBA2 AS DateTime), 4, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (347, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40475?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40475?l=1', N'OFFERED......toddler toy', N'hi fellow freescylers
i have for offer a toddler toy that im not sure how to describe!! lol its sort
of a cube with a door and with top like the toys in the banks?
email me for a pic if anyones interested or it will go to a charity shop
jane', CAST(0x00009D1F00761A60 AS DateTime), CAST(0x00009D1F00BFDBBA AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (348, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40474?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40474?l=1', N'Offered - Motorcycle Cover TN377AX', N'Hi I have a used but in alright leave ya bike out side condition, the cover has
a light lining inside to protect the paint work etc, should fit a Honda hornet
600cc &amp; lower. I used to cover my Honda 400 and it went down to the floor.
The cover is a heavey weight and so is good for windy hastings. (Sorry NOT
suitable for a moped as it is 1) - to big and 2) - to heavey)

Collect any time day or night, as I will leave the cover in the black box up the
drive, just need to let me know the day so I can leave it out for you.

Charley', CAST(0x00009D1E01700AC0 AS DateTime), CAST(0x00009D1F00CD541F AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (349, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40473?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40473?l=1', N'Offered - Various', N'Clearing my brother''s flat and we have a box of odds and sods, including a
modem, USB peripheral switch, and a squeaking chicken. Good for boot sale.
A Donnay golf bag with a 2 wheel cart.
A Pro-form cross trainer that needs some attention.', CAST(0x00009D1F009450C0 AS DateTime), CAST(0x00009D1F00BFDBE9 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (350, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40472?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40472?l=1', N'TAKEN (STC) Knitting Yarn, West St Leonards', N'The yarn has been taken subject to collection.

Thanks and sorry to everyone else who was interested.

Cheers

Lesley', CAST(0x00009D1F00A20C60 AS DateTime), CAST(0x00009D1F00BFDBFC AS DateTime), 3, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (351, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40471?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40471?l=1', N'Taken Ladies Sheepskin Coat', N'MANY THANKS DAVID FOR THE LOVELY SHEEPSKIN. JO




[Non-text portions of this message have been removed]', CAST(0x00009D1E015DA3D0 AS DateTime), CAST(0x00009D1F00BFDC13 AS DateTime), 3, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (352, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40470?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40470?l=1', N'Taken - Bike Rack, Drawers and Work Bench', N'All taken, subject to collection.  Thanks for all the interest, sorry for those
who missed out.  They sure were popular items!

Claire', CAST(0x00009D1F009EC0A0 AS DateTime), CAST(0x00009D1F00BFDC26 AS DateTime), 3, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (353, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40469?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40469?l=1', N'TAKEN- single divan base', N'', CAST(0x00009D1F00754770 AS DateTime), CAST(0x00009D1F00BFDC34 AS DateTime), 3, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (354, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40468?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40468?l=1', N'WANTED DESPERATLY: Cot with or without matress!', N'Hi freecyclers,

Im 5 months pregnant and havn''t yet got a cot and considering things are tight
at the moment it''s going to be very hard to afford one,
If anyone has one please mail me!

Thankyou
Naomi', CAST(0x00009D1E014E4250 AS DateTime), CAST(0x00009D1F00BFDC55 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (355, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40466?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40466?l=1', N'Offered - Bike rack for hatchback style car', N'I have a bike rack for 2 bikes, it has all the bits to it, but haven''t been able
to use it since buying my ford mondeo as it fits a hatchback.

Hope someone can make use of it.

Claire', CAST(0x00009D1E01549380 AS DateTime), CAST(0x00009D1F00BFDC71 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (356, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40465?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40465?l=1', N'taken/still offered tv hastings', N'taken tv


still offered monitor 18&quot; screen old type

also goodmans stereo large takes 3cd''s drawer abit temprementle
but works fine.', CAST(0x00009D1E0133E450 AS DateTime), CAST(0x00009D1F00BFDC83 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (357, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40464?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40464?l=1', N'Offered again large wine rack and other things', N'Offered:  Large wine rack for 48 bottles - nothing fancy just a very basic rack.

Quantity of 6&quot; tiles approx 50 light sage green and 22 browny red with one
rounded side (were used as an edging) - also a large matching browny red soap
dish.  These are all reclaimed so would need soaking to remove old tile cement.

Bags for a Kärcher 2001 cleaner

several spools of thin yellow nylon cord.

Qantity of old picture frames.

All to be collected from central St Leonards




[Non-text portions of this message have been removed]', CAST(0x00009D1E012B1A50 AS DateTime), CAST(0x00009D1F00BFDC9B AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (358, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40463?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40463?l=1', N'Offered - Stairgate &amp; Cast Iron Pot stand - Bohemia Area', N'I have a step through stairgate on offer. Has no wall fixing but stays in place
by means of pressure. Lift up opening section but bar along the bottom hence
step through. Metal.
Also a black cast iron pot stand with four shelves from top to bottom.
Scroll/heart shape wrought design on shelves.

Bohemia area.

Thanks, Odette', CAST(0x00009D1E013284C0 AS DateTime), CAST(0x00009D1F00CDD56B AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (359, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40462?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40462?l=1', N'Offered - two white melamine chests of draws and workbench', N'They''ve been in my shed so a bit tatty, but still useable.
One is three and one is 5 drawer as far as I remember, both quite small, would
suit a childs bedroom (need a bit of a clean) or a garage.  They''ve been stacked
on top of each other which also seemed to work ok.

I also have a workbench I don''t think I''ll realistically use.

They''ll all be outside from tonight, so hopefully they''ll be OK!

Claire', CAST(0x00009D1E012D4CD0 AS DateTime), CAST(0x00009D1F00BFDCC5 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (360, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40461?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40461?l=1', N'received bob the builder coat', N'thanks very much for the dod the builder coat my son loves it', CAST(0x00009D1E012C3390 AS DateTime), CAST(0x00009D1F00BFDCD8 AS DateTime), 4, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (361, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40460?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40460?l=1', N'Offered-Blacklands-Mixed items', N'I have 3 bags of mixed items, Clothes, shoes and other. May be suitable for boot
sale items.
Olivia', CAST(0x00009D1E01292E20 AS DateTime), CAST(0x00009D1F00BFDCEB AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (362, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40459?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40459?l=1', N'WANTED please. calor gas heater &amp; empty bottle. hastings &amp; surronding area.', N'Hi guys!,
         possibly not the best time of year to be asking for one of these, but
hey ho, you never know!. Has any one got a working calor gas heater sitting
around,no longer needed?... one with a hose and regulator would be nice, but as
i''m after one for free, i will gratefully accept anything thats offered :-).

                many thanks for reading, here''s hoping.

                          cheers , carl.', CAST(0x00009D1E00E0ABA0 AS DateTime), CAST(0x00009D1F00BFDD02 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (363, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40458?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40458?l=1', N'Wanted - Bird table/Nest boxes', N'Hi people, if you have bird table and bird boxes that you no longer require then
please can we take it off your hands. My son is obsessed with Springwatch and
really want these items so they can watch what birds come into our garden.

If you can help then please get in touch.

Many thanks', CAST(0x00009D1E00EAD530 AS DateTime), CAST(0x00009D1F00BFDD19 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (364, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40457?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40457?l=1', N'WANTED: canvas', N'hi!! im looking for all sizes canvas. just begun learning to paint so need lots
of them. all generosity appreciated.', CAST(0x00009D1E00F3E580 AS DateTime), CAST(0x00009D1F00BFDD3A AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (365, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40456?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40456?l=1', N'Wanted: PC/Laptop', N'Is anybody getting rid of a PC, either desktop or laptop?

I''m looking for something my kids can use for educational games, Paint etc

(Preferably not a desktop with a big heavy monitor though, or something with a
really slow processor).

Many thanks,
Luke







_________________________________________________________________
We want to hear all your funny, exciting and crazy Hotmail stories. Tell us now[Non-text portions of this message have been removed]', CAST(0x00009D1E00CB3F40 AS DateTime), CAST(0x00009D1F00BFDD48 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (366, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40455?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40455?l=1', N'wanted fillter coffee maker', N'hi i no its a long shot but does anyone have an old fillter coffee maker they
dont want as mine has broken has to be one you put a fillter in to and add
coffee to not the one with the coffee pods many thanks lesley', CAST(0x00009D1E00A78AA0 AS DateTime), CAST(0x00009D1F00BFDD60 AS DateTime), 2, 0, 0, 0, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (367, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40454?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40454?l=1', N'WANTED', N'WANTED DESPERATLY NEEDED A PINE FRAMED DOUBLE OR KING SIZE BED FRAME IF CAN
DELIVER TOO THAT WOULD BE GREAT!!', CAST(0x00009D1E00CAF8F0 AS DateTime), CAST(0x00009D1F00BFDD69 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (368, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40453?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40453?l=1', N'Wanted Blowup double airbed Bexhill', N'Please does anyone have a  double airbed that they no longer need, my daughter
and her boyfriend will be coming to stay this week and we have nowhere for them
to sleep so we would love one so they can stay with us.
Im in sidley in bexhill and collect at any time.
many thanks
sandy.


[Non-text portions of this message have been removed]', CAST(0x00009D1E00C27540 AS DateTime), CAST(0x00009D1F00BFDD81 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (369, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40486?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40486?l=1', N'OFFERED TN38: Various', N'Hi guys,

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

[Non-text portions of this message have been removed]', CAST(0x00009D1F00E2DE20 AS DateTime), CAST(0x00009D1F00E7CDE2 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (370, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40485?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40485?l=1', N'Offered nokia charger, land phone, leads and computer bits', N'1 nokia phone charger – older larger pin

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
Leila', CAST(0x00009D1F00E5E390 AS DateTime), CAST(0x00009D1F00E7CE1A AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (371, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40484?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40484?l=1', N'Taken - Stairgate - Bohemia Area', N'Sorry to all who replied but stairgate has now gone to protect a couple''s
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
&gt;', CAST(0x00009D1F00AD4F30 AS DateTime), CAST(0x00009D1F00E7CE36 AS DateTime), 3, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (372, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40488?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40488?l=1', N'OFFERED: TWO SINGER SEWING MACHINES (near Ore Village, Hastings)', N'I have two Singer sewing machines that were given to me but I already have one. 
They are not new models, slightly old fashioned.  One has a hard cover, one has
a soft cover and they both have carry handles.  They have no cables so I haven''t
checked them to see if they work.  E-mail me if you''re interested with a phone
number and I''ll give you a call asap. They need to go by the weekend please. 
Thanks, Sharon.', CAST(0x00009D1F00CF17A0 AS DateTime), CAST(0x00009D1F00E92DA2 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (373, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40487?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40487?l=1', N'Re Offered: Bathroom Cabinet. West Hill', N'Hello there.

Due to non - collection TWICE we still have a pine bathroom cabinet. It has two
mirrored sliding doors measures (approx.) 14&quot;hx23&quot;wx6&quot;d. Must go asap as we''re
falling over it and it''s too good for landfill.

Please only email if you really can and will collect.

Thanks.

Emma Joe and the boys.', CAST(0x00009D1F00BA37E0 AS DateTime), CAST(0x00009D1F00E92DC8 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (374, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40489?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40489?l=1', N'TAKEN STC TN38', N'Bunkbeds
Mattress
Coffee Machine
 
Paula Sanders

[Non-text portions of this message have been removed]', CAST(0x00009D1F00EF8080 AS DateTime), CAST(0x00009D1F00F16B1A AS DateTime), 3, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (375, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40492?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40492?l=1', N'Wanted------------ reggae music urgently', N'hiya everyone

i really would love to get some reggae music  ......i met a guy called tony at
william parker school boot sale on sunday .....he said he had some and was going
to free cycle so please get in touch when you decide to clear out ...


thank you

manish





[Non-text portions of this message have been removed]', CAST(0x00009D1F00AD08E0 AS DateTime), CAST(0x00009D1F00F2D8DD AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (376, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40491?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40491?l=1', N'TAKEN: DVD player &amp; moses basket', N'TAKEN: d.v.d player and babys moses basket.
ï¿½sorry i only posted this now but didn''t see my inbox till today and had quite
a few messages so had to give both to first reply. sorry to anyone who wanted
the bits and missed out.




[Non-text portions of this message have been removed]', CAST(0x00009D1F00ED4E00 AS DateTime), CAST(0x00009D1F00F2D907 AS DateTime), 3, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (377, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40490?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40490?l=1', N'Offered TN38: Mouse set up', N'Cage, little house, food bowl, water bottle &amp; wheel, suitable for two mice or
Hamster that doesent care!!!

Collect only

Paula

[Non-text portions of this message have been removed]', CAST(0x00009D1F00E85C60 AS DateTime), CAST(0x00009D1F00F2D91F AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (378, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40494?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40494?l=1', N'WANTED: Glass demijohns', N'WANTED: glass demijohns
ï¿½
want to try my hand at a bit of homebrewing and wondered if anyone had any
demijohns the don''t want any more, thanks




[Non-text portions of this message have been removed]', CAST(0x00009D1F00EE20F0 AS DateTime), CAST(0x00009D1F00F3C472 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (379, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40493?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40493?l=1', N'WANTED: Vinyl records / Dance music', N'Any unwanted dance music records (or CD''s)(House/Techno/Drum n'' Bass/Hip Hop
etc) for a dj workshop. Can collect. Thanks in advance.', CAST(0x00009D1F00EEAD90 AS DateTime), CAST(0x00009D1F00F3C497 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (380, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40496?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40496?l=1', N'OFFERED: Computer Desk and Amchair', N'Hello all,

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

Adam.', CAST(0x00009D1F00F3E580 AS DateTime), CAST(0x00009D1F00F6C777 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (381, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40495?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40495?l=1', N'OFFERED - Office stuff!', N'On offer, an assortment of office stationery and equipment etc, to be taken as
one lot.  Would be perfect for home office or student.

Includes, lever arch file, assorted folders, card dividers, clear filing
pockets,  notebooks, A4 filing trays, desktop printer stand with paper storage
drawer and various other bits and bobs.

Collection from St. Leonards near Tesco.

Sandra

[Non-text portions of this message have been removed]', CAST(0x00009D1F00F39F30 AS DateTime), CAST(0x00009D1F00F6C7A6 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (382, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40498?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40498?l=1', N'OFFERED: Panasonic quintrix TV,', N'32&quot; fully working with remote control.Silver. Please note this is one of the big
telly''s not a flat screen. Will need 2 to collect as on 2nd floor ASAP.', CAST(0x00009D1F00FE9BB0 AS DateTime), CAST(0x00009D1F01074298 AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (383, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40497?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40497?l=1', N'on offer childs play kitchen and tv for spares or repair', N'on offer i have a childs play kitchen got it from a fellower recycler however my
son no longer plays with it, it has no accesories with it if any1s intrested plz
email me i work on a first come first serve basis would like it gone by weds
night

ALSO ON OFFER I HAVE;
JCV TV quiet bulky needs 2 people to collect if any1s interested
no longer works so as it  says its up for spares or repair if any bodys
intrested plz email me


would like both these items gone by weds night at the latest as no longer have
room for them thanks', CAST(0x00009D1F0104A690 AS DateTime), CAST(0x00009D1F010742B9 AS DateTime), 4, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (384, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40500?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40500?l=1', N'recieved with thanx', N'many thanks 4 the bench radio, ideal 4 night fishing,cheers :))) kev,,,', CAST(0x00009D1F00F7BDE0 AS DateTime), CAST(0x00009D1F0108A37B AS DateTime), 4, 0, 0, 0, 15, 1)
GO
print 'Processed 200 total records'
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (385, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40499?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40499?l=1', N'OFFERED TN38 Part 2!!!', N'1. Disney princess playmat - the one u can draw on with water pens - got no pen
2. Barbie pretend guitar, plastic thing with electronic noises
3. Clear plastic barbie rucksack - small
4. Tesco value crazy kite

I will keep digging!
Expect swift replies - im leaving the computer on!

Paula

[Non-text portions of this message have been removed]', CAST(0x00009D1F0102BA60 AS DateTime), CAST(0x00009D1F0108A38E AS DateTime), 1, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (386, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40502?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40502?l=1', N'Wanted: Fire extinguisher &amp; Fire Blanket', N'Should anyone have a small fire extinguisher and/or fire blanket I would be most
grateful for them. J French

[Non-text portions of this message have been removed]', CAST(0x00009D1F00F61800 AS DateTime), CAST(0x00009D1F010A01B7 AS DateTime), 2, 0, 0, 1, 15, 1)
INSERT [dbo].[Posts] ([PostId], [PostParentId], [PostGuid], [PostUrl], [PostTitle], [PostBody], [PostPublishDateTime], [PostLastUpdatedDateTime], [PostCategoryId], [PostLatitude], [PostLongitude], [PostDisplay], [UserId], [FeedId]) VALUES (387, 0, N'http://groups.yahoo.com/group/hastings-freecycle/message/40501?l=1', N'http://groups.yahoo.com/group/hastings-freecycle/message/40501?l=1', N'OFFERED: navy blue leather sofa', N'this is a heavy sofa due to the amount of wood on it
must go by wednesday.pick up from hawkhurst
cost two thousand when new
pictures available', CAST(0x00009D1F0104ECE0 AS DateTime), CAST(0x00009D1F010A01D8 AS DateTime), 1, 0, 0, 1, 15, 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
/****** Object:  UserDefinedFunction [dbo].[NearestMessages]    Script Date: 02/17/2010 11:33:24 ******/
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
/****** Object:  Table [dbo].[PostTags]    Script Date: 02/17/2010 11:33:24 ******/
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
INSERT [dbo].[PostTags] ([Id], [PostId], [TagId]) VALUES (394, 370, 262)
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
SET IDENTITY_INSERT [dbo].[PostTags] OFF
GO
print 'Processed 400 total records'
/****** Object:  Table [dbo].[PostLocations]    Script Date: 02/17/2010 11:33:24 ******/
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
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (74, 77, 32)
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
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (100, 315, 32)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (101, 317, 23)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (102, 321, 32)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (103, 327, 6)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (104, 328, 32)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (105, 332, 5)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (106, 310, 34)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (107, 344, 32)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (108, 348, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (109, 350, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (110, 356, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (111, 357, 21)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (112, 358, 26)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (113, 361, 28)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (115, 362, 4)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (117, 368, 32)
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
GO
print 'Processed 100 total records'
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (133, 339, 69)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (134, 339, 70)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (135, 339, 71)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (136, 339, 72)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (137, 339, 73)
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (138, 339, 74)
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
INSERT [dbo].[PostLocations] ([Id], [PostId], [LocationId]) VALUES (167, 339, 102)
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
SET IDENTITY_INSERT [dbo].[PostLocations] OFF
/****** Object:  Default [DF_Messages_MessageParentId]    Script Date: 02/17/2010 11:33:24 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Messages_MessageParentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Messages_MessageParentId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Messages_MessageParentId]  DEFAULT ((0)) FOR [PostParentId]
END


End
GO
/****** Object:  ForeignKey [FK_Feeds_FeedCategories]    Script Date: 02/17/2010 11:33:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Feeds_FeedCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Feeds]'))
ALTER TABLE [dbo].[Feeds]  WITH CHECK ADD  CONSTRAINT [FK_Feeds_FeedCategories] FOREIGN KEY([FeedCategoryId])
REFERENCES [dbo].[FeedCategories] ([FeedCategoryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Feeds_FeedCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Feeds]'))
ALTER TABLE [dbo].[Feeds] CHECK CONSTRAINT [FK_Feeds_FeedCategories]
GO
/****** Object:  ForeignKey [FK_PostLocations_Locations]    Script Date: 02/17/2010 11:33:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations]  WITH CHECK ADD  CONSTRAINT [FK_PostLocations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Locations]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations] CHECK CONSTRAINT [FK_PostLocations_Locations]
GO
/****** Object:  ForeignKey [FK_PostLocations_Posts]    Script Date: 02/17/2010 11:33:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations]  WITH CHECK ADD  CONSTRAINT [FK_PostLocations_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostLocations_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostLocations]'))
ALTER TABLE [dbo].[PostLocations] CHECK CONSTRAINT [FK_PostLocations_Posts]
GO
/****** Object:  ForeignKey [FK_Posts_Feeds]    Script Date: 02/17/2010 11:33:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Feeds]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Feeds] FOREIGN KEY([FeedId])
REFERENCES [dbo].[Feeds] ([FeedId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Feeds]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Feeds]
GO
/****** Object:  ForeignKey [FK_Posts_PostCategories]    Script Date: 02/17/2010 11:33:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_PostCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_PostCategories] FOREIGN KEY([PostCategoryId])
REFERENCES [dbo].[PostCategories] ([PostCategoryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_PostCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_PostCategories]
GO
/****** Object:  ForeignKey [FK_Posts_Users]    Script Date: 02/17/2010 11:33:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Posts_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Posts]'))
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
/****** Object:  ForeignKey [FK_PostTags_Posts]    Script Date: 02/17/2010 11:33:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Posts]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Posts]
GO
/****** Object:  ForeignKey [FK_PostTags_Tags]    Script Date: 02/17/2010 11:33:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Tags]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PostTags_Tags]') AND parent_object_id = OBJECT_ID(N'[dbo].[PostTags]'))
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Tags]
GO
/****** Object:  ForeignKey [FK_Users_Roles]    Script Date: 02/17/2010 11:33:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
