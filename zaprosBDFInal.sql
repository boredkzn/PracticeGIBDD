USE [GIBDD]
GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 19.12.2022 17:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers](
	[IdGuid] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Surname] [nvarchar](150) NOT NULL,
	[Middlename] [nvarchar](150) NULL,
	[PassportSerial] [int] NOT NULL,
	[PassportNumber] [int] NOT NULL,
	[Postcode] [int] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[AddressLife] [nvarchar](max) NULL,
	[Company] [nvarchar](max) NULL,
	[Jobname] [nvarchar](max) NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Photo] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DTP]    Script Date: 19.12.2022 17:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DTP](
	[Id] [int] NOT NULL,
	[NameStreet] [nvarchar](200) NOT NULL,
	[NumberHome] [int] NOT NULL,
	[RoadSection] [nvarchar](max) NOT NULL,
	[TrafficLane] [nvarchar](max) NOT NULL,
	[MoreDetails] [nvarchar](max) NOT NULL,
	[CountVictims] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Date] [date] NOT NULL,
	[Time] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DTP_Driver]    Script Date: 19.12.2022 17:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DTP_Driver](
	[Id] [int] NOT NULL,
	[IdDriver] [uniqueidentifier] NOT NULL,
	[IdDtp] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fine]    Script Date: 19.12.2022 17:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fine](
	[Id] [int] NOT NULL,
	[CarNumber] [nvarchar](50) NOT NULL,
	[RegionNameRU] [nvarchar](150) NOT NULL,
	[LicenceNumber] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[Photo] [varbinary](max) NOT NULL,
	[IdStatus] [int] NOT NULL,
	[IdDriver] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FineStatuses]    Script Date: 19.12.2022 17:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FineStatuses](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Licences]    Script Date: 19.12.2022 17:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Licences](
	[Id] [int] NOT NULL,
	[IdGuidDriver] [uniqueidentifier] NOT NULL,
	[LicenceDate] [datetime] NOT NULL,
	[ExpireDate] [datetime] NOT NULL,
	[Categories] [nvarchar](10) NOT NULL,
	[LicenceSeries] [int] NOT NULL,
	[LicenceNumber] [int] NOT NULL,
	[VIN] [nvarchar](50) NULL,
	[Manufacturer] [nvarchar](50) NULL,
	[Model] [nvarchar](200) NULL,
	[Year] [int] NULL,
	[Weight] [int] NULL,
	[Color] [int] NULL,
	[TypeOfDrive] [nvarchar](200) NULL,
	[IdStatus] [int] NOT NULL,
	[CarNumber] [nvarchar](50) NULL,
	[IdRegion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicenceStatus]    Script Date: 19.12.2022 17:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicenceStatus](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photo_DTPDriver]    Script Date: 19.12.2022 17:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo_DTPDriver](
	[Id] [int] NOT NULL,
	[IdDTPDriver] [int] NOT NULL,
	[Photo] [varbinary](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 19.12.2022 17:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[Id] [int] NOT NULL,
	[RegionNameEN] [nvarchar](150) NOT NULL,
	[RegionNameRU] [nvarchar](150) NOT NULL,
	[Code] [nvarchar](150) NOT NULL,
	[OKATOcode] [int] NOT NULL,
	[ISO3166_2] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusHistory]    Script Date: 19.12.2022 17:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusHistory](
	[Id] [int] NOT NULL,
	[IdLicence] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[DateChange] [datetime] NOT NULL,
	[OldStatus] [int] NOT NULL,
	[NewStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19.12.2022 17:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'07caad4e-bfd5-4ce4-8b83-00005c0c7420', N'Alondra', N'Le', N'Clark', 3059, 930219, 301844, N'South Lyon, MI 48178', N'South Lyon, MI 48178', N'Kia Motors', N'Event Planner', N'3 424 530 606', N'matthijs@live.com', N'172-nerd.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'055cf888-1a4f-46a8-a852-00aedc91f447', N'Adison ', N'Olson', N'Henry', 4402, 114286, 550100, N'Hamburg, NY 14075', N'Hamburg, NY 14075', N'H&M', N'Pharmacist', N'86 269 742 035', N'bhima@sbcglobal.net', N'088-father.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'4c8d80c5-e141-454f-bc4f-00b2e6907be8', N'Jadon', N'Ponce', N'Doran', 9853, 763831, 457951, N'7018 Pilgrim Street', N'7018 Pilgrim Street', N'The Walt Disney Company', N'Surveyor', N'5 988 952 899', N'gfxguy@aol.com', N'183-sad-5.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'1b85c947-2651-459b-871a-00ec57aca60b', N'Hannah', N'Jordan', N'Verena', 5511, 931653, 233625, N'14 West Fifth St.', N'14 West Fifth St.', N'Panasonic Corporation', N'Police Officer', N'83 993 448 840', N'elflord@me.com', N'127-angry-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'360e4ddf-5c3a-46c5-ba92-0244a6123448', N'Carolina', N'Casey', N'Timothy', 2307, 511412, 598986, N'Centereach, NY 11720', N'Centereach, NY 11720', N'Apple Inc.', N'Secretary', N'8 872 368 493', N'nighthawk@msn.com', N'048-moon.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'dd2314f7-91f5-409e-8cfd-045fc43ed106', N'Lincoln', N'Mason', N'Emeline', 5387, 689700, 252988, N'Egg Harbor Township, NJ 08234', N'Egg Harbor Township, NJ 08234', N'Avon', N'Judge', N'2 839 453 092', N'jnolan@aol.com', N'010-drool.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'd697224a-72bf-45b1-b536-04cbb3d80f6e', N'Paula ', N'Walls', N'Breean', 7817, 774559, 929343, N'9662 Bay Ave.', N'9662 Bay Ave.', N'Pizza Hut', N'Dancer', N'87 512 403 137', N'jugalator@me.com', N'087-father-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'1445fa82-f7d8-406f-8acb-0615fea80f13', N'Dorian', N'Bird', N'Judd', 5208, 664172, 833457, N'694 Linden St.', N'694 Linden St.', N'Cisco Systems, Inc.', N'Coach', N'4 345 744 540', N'bryam@icloud.com', N'173-in-love-3.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'15f7a9ad-6441-4e0d-9910-063219db65f3', N'Serena', N'Duke', N'Arthur', 5150, 553212, 190255, N'70 Cambridge Ave.', N'70 Cambridge Ave.', N'Moët et Chandon', N'IT Manager', N'8 128 144 854', N'plover@hotmail.com', N'153-injury.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'8989ed49-3ec9-4750-afa5-074f2bea687c', N'Brendan', N'Kelly', N'Damien', 7019, 883500, 537973, N'697 Westminster St.', N'697 Westminster St.', N'Burberry', N'Middle School Teacher', N'2 767 501 655', N'shang@yahoo.ca', N'185-sad-3.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'7a794881-860f-4147-866d-07b9bcabbaa4', N'Layton', N'Ruiz', N'Aryn', 8656, 317830, 924502, N'Jackson Heights, NY 11372', N'Jackson Heights, NY 11372', N'Cartier SA', N'Computer Systems Administrator', N'6 824 698 567', N'mobileip@icloud.com', N'032-bored.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'3a97cf39-b84b-4837-8694-0a0b084095a9', N'Xavier', N'Baxter', N'Joseph', 1373, 588622, 962553, N'Nottingham, MD 21236', N'Nottingham, MD 21236', N'BlackBerry', N'Actuary', N'3 805 734 186', N'esbeck@comcast.net', N'160-crying-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'52f52f82-341f-47bd-a791-0d3880d1dc4d', N'Andre', N'Taylor', N'Felix', 4813, 710684, 233687, N'82 Oak Meadow Dr.', N'82 Oak Meadow Dr.', N'Cartier SA', N'Reporter', N'84 578 476 033', N'nanop@verizon.net', N'131-sad-8.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'95939d3f-2c4f-4b87-b3b6-0ee66f6be9b3', N'Jolie', N'Charles', N'Matteo', 3285, 403999, 586366, N'556 Summerhouse Street', N'556 Summerhouse Street', N'Pampers', N'Carpenter', N'8 549 415 210', N'dkasak@gmail.com', N'159-crying-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'60a830bf-d135-46b4-aac5-0f29b68abf8f', N'Athena', N'King', N'Lilibeth', 3307, 217825, 236159, N'Muskogee, OK 74403', N'Muskogee, OK 74403', N'Facebook, Inc.', N'Computer Systems Administrator', N'6 712 935 634', N'mhouston@me.com', N'162-surprised-3.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'e25b2f5d-6a7a-4b17-8fc2-1020796f686d', N'Nayeli ', N'Church', N'Kent', 9527, 410913, 790714, N'Ann Arbor, MI 48103', N'Ann Arbor, MI 48103', N'MasterCard', N'Public Relations Specialist', N'87 594 523 846', N'jlbaumga@hotmail.com', N'096-tongue-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'ce4472d1-b582-4c09-a444-11aa5af16e8f', N'Carlie', N'Lang', N'Rebecca', 9368, 90494, 983441, N'West Babylon, NY 11704', N'West Babylon, NY 11704', N'Zara', N'Automotive mechanic', N'89 523 744 396', N'mcnihil@me.com', N'120-nerd-3.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'c7fdbcdb-a138-4bf1-8b6a-138de0d04172', N'Jaylene', N'Schneider', N'Xavier', 6948, 84332, 144573, N'Waynesboro, PA 17268', N'Waynesboro, PA 17268', N'NTT Data', N'Occupational Therapist', N'9 446 270 176', N'pereinar@yahoo.com', N'014-tongue-5.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'9484b47e-4db9-43c0-9736-169ac6029da4', N'Bryan', N'Hays', N'Wade', 8451, 370682, 475381, N'8021 Shadow Brook Dr.', N'8021 Shadow Brook Dr.', N'Microsoft', N'Farmer', N'87 799 668 126', N'tjensen@verizon.net', N'117-confused-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'e6df62de-807f-4475-abf9-1a278e9520a7', N'Jeffrey', N'Rowland', N'Gillian', 4406, 46042, 450845, N'East Lansing, MI 48823', N'East Lansing, MI 48823', N'Wal-Mart', N'Physicist', N'86 693 357 511', N'harryh@live.com', N'126-graduated.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'6da24dfe-b526-423f-9c43-1cade318ce23', N'Rocco ', N'Harding', N'Gwendolen', 2018, 304278, 690136, N'4 Division Lane', N'4 Division Lane', N'Sony', N'Marketing Manager', N'83 478 078 932', N'bcevc@yahoo.ca', N'115-pirate-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'7ca128e7-50c3-495b-88cd-1d2927019f35', N'Cynthia ', N'Garrison', N'Matilda', 3516, 398883, 21763, N'2 Greenrose Rd.', N'2 Greenrose Rd.', N'SAP', N'Medical Assistant', N'85 782 205 882', N'mpiotr@yahoo.com', N'105-kiss-3.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'f47f6525-6204-409d-bd0c-1f8f86c0a20c', N'Mohammed ', N'Farley', N'Levi', 7748, 504230, 200443, N'3 Peg Shop St.', N'3 Peg Shop St.', N'Avon', N'Dental Hygienist', N'86 493 744 690', N'syrinx@gmail.com', N'109-nerd-6.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'209d8566-16e1-4d56-92b0-22370719c5c4', N'Clayton', N'Munoz', N'Caylen', 8862, 885055, 225076, N'94 Longbranch St.', N'94 Longbranch St.', N'HSBC', N'Landscape Architect', N'8 976 550 021', N'twoflower@mac.com', N'193-in-love-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'f12f767c-07c2-49e4-b36c-269b693408b6', N'Byron ', N'Haynes', N'Bram', 1685, 42988, 97229, N'9523 Linda Lane', N'9523 Linda Lane', N'Johnson & Johnson', N'Marriage & Family Therapist', N'84 828 029 580', N'jsnover@comcast.net', N'093-ugly-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'a9b89e97-2f7c-4c3b-8263-27cf2749660a', N'Chace', N'Spears', N'Elodie', 3126, 716773, 124048, N'8723 Cedar Swamp Drive', N'8723 Cedar Swamp Drive', N'Apple Inc.', N'Cashier', N'83 248 861 499', N'bockelboy@outlook.com', N'147-tired.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'c10b5584-97b0-4560-b8f7-2a181768a5d3', N'Bruce', N'Medina', N'Elein', 7843, 990305, 242952, N'566 Gulf St.', N'566 Gulf St.', N'MasterCard', N'Respiratory Therapist', N'6 129 342 623', N'yfreund@sbcglobal.net', N'195-kiss-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'effadfe4-0bb4-43a2-b38e-2a658de47f96', N'Ellen', N'Contreras', N'Fawn', 1559, 96165, 783035, N'Encino, CA 91316', N'Encino, CA 91316', N'L''Oréal', N'Architect', N'3 092 793 798', N'lcheng@mac.com', N'198-kiss.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'5acf91e7-3cc1-4cef-8a85-2b2826e03a28', N'Alonso', N'Hopkins', N'Caleb', 2303, 160716, 760832, N'452 Cobblestone St.', N'452 Cobblestone St.', N'Global Gillette', N'Reporter', N'9 703 838 933', N'skippy@icloud.com', N'001-happy-18.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'dd674d5f-5b5c-4fc8-8a9d-2b33e9809aa6', N'Beckham', N'Roach', N'Elias', 4756, 956293, 906312, N'946 Yukon Lane', N'946 Yukon Lane', N'Verizon Communications', N'Bus Driver', N'5 315 970 196', N'qmacro@outlook.com', N'049-robot.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'5c318755-4f49-47d1-9179-2c1a0d503514', N'Lexie', N'Mckinney', N'Charles', 9803, 515191, 938289, N'881 Temple St.', N'881 Temple St.', N'Canon', N'Bus Driver', N'7 134 628 265', N'tubesteak@mac.com', N'179-surprised-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'6bcf6586-fe14-4bb5-86ee-3437c589d56f', N'Miguel', N'Leon', N'Haiden', 1318, 208906, 140377, N'179 Manchester St.', N'179 Manchester St.', N'Yahoo!', N'Massage Therapist', N'4 893 616 374', N'tezbo@live.com', N'151-sick-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'961d322d-ec47-486a-be16-346737b2e3fe', N'Efrain', N'Stark', N'Jared', 4204, 741281, 838795, N'53 E. Marvon St.', N'53 E. Marvon St.', N'Zara', N'Massage Therapist', N'2 665 617 456', N'bwcarty@yahoo.com', N'021-wink-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'01a194ef-d74d-4092-accd-376afee083b8', N'Reilly ', N'Nielsen', N'Marcella', 9350, 821275, 836368, N'7762 North County St.', N'7762 North County St.', N'AT&T', N'Accountant', N' 967 763  6475', N'ateniese@outlook.com', N'069-happy-6.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'da536668-6b48-4f68-b9ff-383f8170b618', N'Noah', N'Daugherty', N'Thomas', 2924, 764363, 504859, N'Villa Park, IL 60181', N'Villa Park, IL 60181', N'IBM', N'Budget analyst', N'4 405 610 314', N'ranasta@icloud.com', N'012-tongue-7.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'e4bbdeb6-0673-4303-a8d1-38d797c61bd1', N'Jay', N'Campos', N'Georgina', 1446, 216584, 901170, N'67 Pumpkin Hill Lane', N'67 Pumpkin Hill Lane', N'PepsiCo', N'Database administrator', N'9 396 417 992', N'timtroyr@icloud.com', N'189-happy-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'816e1f24-451c-4635-9709-3a2e3fe96e4a', N'Marcelo', N'Johns', N'Louisa', 5292, 664723, 936784, N'Euless, TX 76039', N'Euless, TX 76039', N'Heineken Brewery', N'Database administrator', N'2 424 877 082', N'treeves@comcast.net', N'188-sad-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'32268434-1ab5-42eb-836b-3a75a748f8e8', N'Presley', N'Vasquez', N'Sheridan', 9144, 720543, 529399, N'44 Ocean Ave.', N'44 Ocean Ave.', N'Sprite', N'Coach', N'4 543 538 089', N'stomv@aol.com', N'043-baby-boy.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'6d5a6dc1-74ed-4dcf-83d0-3bc5485fdea3', N'Cheyenne ', N'Kirk', N'Julian', 4306, 595389, 40675, N'New Haven, CT 06511', N'New Haven, CT 06511', N'Gap Inc.', N'Historian', N'87 188 502 518', N'jugalator@att.net', N'072-sick-3.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'a6501f74-c176-4009-a073-3cedf9857c76', N'Branson', N'Richard', N'Linnea', 2225, 886655, 446339, N'9971 N. Rockville Avenue', N'9971 N. Rockville Avenue', N'Hyundai', N'Middle School Teacher', N' 995 610  9002', N'muadip@me.com', N'055-tongue-3.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'396d6d2f-d817-4c43-8961-3d58ffc4f790', N'Ellis', N'Choi', N'Julina', 3520, 765331, 185983, N'Centreville, VA 20120', N'Centreville, VA 20120', N'Shell Oil Company', N'Electrician', N'88 396 944 168', N'djpig@sbcglobal.net', N'138-smart.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'47c5209e-da57-4a76-bf02-3d7185aefaa3', N'Joyce', N'Wilkerson', N'Payten', 6440, 241468, 838036, N'Wausau, WI 54401', N'Wausau, WI 54401', N'General Electric', N'School Counselor', N'7 654 619 730', N'hoangle@optonline.net', N'200-sleepy.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'c8eda812-fe1f-4f6c-b532-3ef357b4a52a', N'Kayley', N'Cuevas', N'Tyson', 4676, 263545, 194258, N'Long Branch, NJ 07740', N'Long Branch, NJ 07740', N'Google', N'Housekeeper', N'6 478 852 301', N'jlbaumga@gmail.com', N'046-dubious.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'e8c4fe99-a4e4-417f-ad97-4022fb093050', N'Scott', N'Dickerson', N'Arden', 5913, 725569, 579121, N'Florence, SC 29501', N'Florence, SC 29501', N'Sprite', N'Budget analyst', N'85 034 467 180', N'makarow@comcast.net', N'142-sleeping.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'1ae6a2d6-bddf-4ab9-8dbf-402a7fd3f45a', N'Selina ', N'Walls', N'Ashten', 8168, 514525, 434380, N'9 Prince Street', N'9 Prince Street', N'Oracle Corporation', N'Fitness Trainer', N'89 793 466 593', N'wetter@yahoo.ca', N'079-crying-5.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'64f949fd-3421-4b93-8dff-422cf8fd278b', N'Selah', N'Keller', N'Merle', 4434, 406702, 268770, N'Phoenixville, PA 19460', N'Phoenixville, PA 19460', N'Deere & Company', N'Database administrator', N' 587 444  2070', N'lbecchi@me.com', N'058-popcorn.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'28765b51-f322-4e0d-9298-42b4bd23117b', N'Jacob ', N'Haynes', N'Marcellus', 2794, 857949, 735633, N'8604 Fairfield Ave.', N'8604 Fairfield Ave.', N'Heineken Brewery', N'Truck Driver', N'82 019 791 451', N'gommix@comcast.net', N'089-angel-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'e89ccbe7-a53a-4982-bce6-4314d9435186', N'Leonard', N'Schmitt', N'Vincent', 7045, 366325, 864380, N'549 Lake View Dr.', N'549 Lake View Dr.', N'Intel Corporation', N'Physical Therapist', N'6 214 057 195', N'tskirvin@mac.com', N'015-smile-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'f35dcad0-92ca-4cee-9285-43af8c5cafeb', N'Mohammed ', N'Crawford', N'Amelia', 8478, 213639, 327248, N'116 Woodside St.', N'116 Woodside St.', N'Home Depot', N'Hairdresser', N'84 894 443 438', N'jpflip@optonline.net', N'075-shocked-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'76caf041-1cc9-498b-939b-44803c8df981', N'Jessie', N'Nelson', N'Jack', 7035, 527026, 89070, N'Lancaster, NY 14086', N'Lancaster, NY 14086', N'McDonald''s', N'Human Resources Assistant', N'87 913 574 942', N'gozer@icloud.com', N'118-nerd-4.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'f951fb5f-b1db-4109-a822-45801114faef', N'Alejandro ', N'Cordova', N'Hollyn', 9370, 315564, 249749, N'Mount Juliet, TN 37122', N'Mount Juliet, TN 37122', N'Nintendo', N'High School Teacher', N'89 194 782 497', N'jeteve@optonline.net', N'092-outrage-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'ed336c24-5654-4a9d-b421-46564b640b0d', N'Katelynn', N'Montgomery', N'Drake', 1209, 731500, 520544, N'Jamaica Plain, MA 02130', N'Jamaica Plain, MA 02130', N'Morgan Stanley', N'Psychologist', N'4 086 730 059', N'facet@outlook.com', N'022-laughing-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'4c2dbe27-1459-4646-b856-46bfa502b52c', N'Killian', N'Davidson', N'Janetta', 8029, 73589, 357874, N'8440 Lyme St.', N'8440 Lyme St.', N'Vodafone', N'Market Research Analyst', N'8 894 494 391', N'makarow@verizon.net', N'175-cool.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'c538ebfc-de32-45cc-b929-47e90070393b', N'Thalia', N'Leach', N'Nicolas', 2646, 768816, 584534, N'Forney, TX 75126', N'Forney, TX 75126', N'Beko', N'Artist', N'4 645 853 155', N'keutzer@yahoo.com', N'156-sick.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'd0cc02c8-b4da-4cab-89fd-49d526f215ca', N'Brendan ', N'Ewing', N'Adele', 4152, 160995, 626951, N'7773 Ridge Dr.', N'7773 Ridge Dr.', N'Prada', N'Computer Support Specialist', N'89 754 835 566', N'oechslin@optonline.net', N'071-heart.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'597dab6f-2797-463e-bf18-4af8e73595eb', N'Coby ', N'Robertson', N'Juliet', 4083, 683928, 133197, N'7219 Prospect Drive', N'7219 Prospect Drive', N'Adidas', N'Respiratory Therapist', N' 260 814  7458', N'tellis@yahoo.ca', N'065-crying-6.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'c2fa3a34-a177-426b-890c-4bafa5f55362', N'Jamal', N'Stokes', N'Rayleen', 7125, 277444, 684826, N'Canton, GA 30114', N'Canton, GA 30114', N'Audi', N'Anthropologist', N'8 667 324 338', N'slaff@aol.com', N'024-sweat-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'0d4a8ef7-1556-4c0c-993b-4bc663a55b49', N'Lesly', N'Landry', N'Gregory', 5688, 765287, 140550, N'Wantagh, NY 11793', N'Wantagh, NY 11793', N'Gucci', N'Mason', N'8 963 969 500', N'nogin@msn.com', N'196-in-love-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'6afe90cb-9578-4759-a64f-4c160181c7f5', N'Seth', N'Sweeney', N'Jax', 3810, 530169, 845247, N'708 6th Drive', N'708 6th Drive', N'Caterpillar Inc.', N'Referee', N'8 364 290 386', N'aegreene@me.com', N'009-angry-6.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'54648811-52c8-4aee-96e1-4cf66c27c557', N'Madalyn', N'Moon', N'Carleen', 7513, 42100, 519988, N'959 Birchpond St.', N'959 Birchpond St.', N'H&M', N'Personal Care Aide', N'6 116 702 147', N'kildjean@msn.com', N'187-rich.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'eae65a34-d7cf-4963-aa44-4d0a4b04b5aa', N'Cherish', N'Monroe', N'Vanessa', 3912, 930948, 254859, N'Wake Forest, NC 27587', N'Wake Forest, NC 27587', N'Prada', N'Recreational Therapist', N'5 747 597 866', N'hauma@icloud.com', N'170-happy-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'a49d2ed1-ae04-4ed7-821e-4d8b00c6622a', N'Imani', N'Calderon', N'Sullivan', 7598, 90859, 46335, N'330 Poplar Lane', N'330 Poplar Lane', N'Wells Fargo', N'Chef', N'6 398 138 035', N'blixem@msn.com', N'051-happy-10.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'39d4618a-cc87-4272-ab9b-52903e1a00fb', N'Eleanor ', N'Zavala', N'George', 3709, 656706, 905558, N'Hartford, CT 06106', N'Hartford, CT 06106', N'Global Gillette', N'Teacher Assistant', N'89 834 704 528', N'crusader@sbcglobal.net', N'100-whistle.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'5def0390-e7a1-4652-942b-53c78736b2eb', N'Terrence', N'Acevedo', N'Viola', 9575, 262338, 906781, N'9591 Honey Creek St.', N'9591 Honey Creek St.', N'General Electric', N'Chef', N'4 397 136 117', N'lahvak@hotmail.com', N'181-furious.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'4ac50169-9d58-4158-a63d-542c9986e3cc', N'Ayana', N'Hart', N'Dash', 9342, 187671, 123262, N'Algonquin, IL 60102', N'Algonquin, IL 60102', N'Citigroup', N'Auto Mechanic', N'2 063 232 722', N'qrczak@me.com', N'166-happy-3.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'5eaa8e1d-e388-4532-b681-54667f051b5d', N'Lily ', N'Green', N'Lynn', 9827, 633690, 976908, N'Arlington Heights, IL 60004', N'Arlington Heights, IL 60004', N'Amazon.com', N'Architect', N' 280 214  8022', N'mastinfo@gmail.com', N'068-father-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'a2a6b45e-c883-4bd9-b5f0-555d4b1cb7e6', N'Ashleigh', N'Walters', N'Claude', 3634, 590673, 418814, N'9441 W. Pineknoll Drive', N'9441 W. Pineknoll Drive', N'Nokia', N'Security Guard', N'89 216 830 258', N'atmarks@icloud.com', N'141-in-love-5.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'89a1242c-c582-4797-820c-570a5ec3961e', N'Drew', N'Mayer', N'Carlen', 2381, 911641, 336638, N'Glen Allen, VA 23059', N'Glen Allen, VA 23059', N'IKEA', N'Judge', N'83 255 747 514', N'xnormal@verizon.net', N'140-3d-glasses.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'8076858c-f4a3-4876-bae8-5733f91271d1', N'Gideon', N'Arias', N'Varian', 5810, 721066, 768289, N'Hanover Park, IL 60133', N'Hanover Park, IL 60133', N'Corona', N'Loan Officer', N'7 862 747 872', N'mugwump@mac.com', N'004-surprised-9.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'4ea38941-f54c-4ff7-a210-5895d5b3788c', N'Sofia', N'Barr', N'Kingston', 3480, 736537, 897782, N'370 Ashley Lane', N'370 Ashley Lane', N'KFC', N'Accountant', N'4 836 649 876', N'bdthomas@yahoo.com', N'199-angry.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'6907939b-2257-400b-95e3-58e54afc33c4', N'Isabella ', N'Fuller', N'Naomi', 4021, 304017, 306011, N'Hagerstown, MD 21740', N'Hagerstown, MD 21740', N'Johnnie Walker', N'Zoologist', N'88 057 218 540', N'thowell@yahoo.ca', N'104-in-love-8.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'f2dccf6d-cce5-470e-b29e-592bdc551948', N'Steven', N'Johnston', N'Kai', 8507, 252786, 812525, N'308 Studebaker Drive', N'308 Studebaker Drive', N'Siemens AG', N'Financial Advisor', N'7 547 693 349', N'louise@gmail.com', N'165-cool-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'76a62d28-6cf4-445d-b2dc-5ce532c3f3af', N'Joseph', N'Stokes', N'William', 8114, 880420, 561214, N'8419 E. Harvey Drive', N'8419 E. Harvey Drive', N'Credit Suisse', N'Professional athlete', N'88 689 822 419', N'krueger@mac.com', N'149-baby.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'7612266c-e53e-47e9-a4c9-5f2987cc68c0', N'Amy ', N'Garner', N'Tanner', 6127, 199319, 509105, N'Fair Lawn, NJ 07410', N'Fair Lawn, NJ 07410', N'Jack Daniel''s', N'Bookkeeping clerk', N' 497 215  8724', N'pthomsen@verizon.net', N'062-happy-8.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'c530577c-1d3b-4b20-b4ff-602dbbd12426', N'Lorelei', N'Hurley', N'Coralie', 8085, 811955, 969805, N'Groton, CT 06340', N'Groton, CT 06340', N'Wells Fargo', N'Janitor', N'87 817 855 837', N'skaufman@optonline.net', N'150-tongue.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'be931bdd-6724-4789-a346-613cc28d43b5', N'Karley', N'Harrington', N'Kathryn', 8059, 911426, 882058, N'9465 St Paul Avenue', N'9465 St Paul Avenue', N'Kleenex', N'Drafter', N'83 695 374 704', N'uncle@sbcglobal.net', N'135-selfie.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'4efbe24d-fc69-481d-ac28-62a5619dc79a', N'Lukas', N'Dean', N'Ellice', 1890, 691040, 594473, N'9750 Hawthorne Ave.', N'9750 Hawthorne Ave.', N'Jack Daniel''s', N'Compliance Officer', N'2 973 690 265', N'novanet@aol.com', N'161-muted-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'126debec-367e-477f-9748-6598556275a5', N'Salvatore', N'Cabrera', N'Krystan', 7218, 277801, 348484, N'Harrisonburg, VA 22801', N'Harrisonburg, VA 22801', N'MTV', N'Epidemiologist', N'83 109 258 844', N'louise@aol.com', N'130-confused-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'b13d053d-207e-4914-ab8a-66363b7f04df', N'Pierre', N'Alvarado', N'Harriet', 7184, 275223, 845839, N'Woodstock, GA 30188', N'Woodstock, GA 30188', N'SAP', N'Cost Estimator', N'4 466 396 043', N'dinther@hotmail.com', N'006-shocked-3.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'5c00c22c-172d-4010-986d-675a0f2f9f6f', N'Annabelle', N'Hebert', N'Annora', 6571, 27113, 415905, N'43 SE. Cross Court', N'43 SE. Cross Court', N'Louis Vuitton', N'Computer Programmer', N'8 226 933 953', N'temmink@mac.com', N'047-phone-call.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'cea5be90-4082-4d43-9acf-68315550befb', N'Romeo', N'Singleton', N'Preston', 7677, 990002, 425361, N'Evans, GA 30809', N'Evans, GA 30809', N'Adobe Systems', N'Recreational Therapist', N'4 879 573 536', N'adillon@verizon.net', N'040-surprised-7.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'386a886d-ea81-429c-91f2-69621afd6862', N'Dane ', N'Obrien', N'Shane', 9596, 712362, 813449, N'3 Ashley Ave.', N'3 Ashley Ave.', N'Kellogg Company', N'Substance Abuse Counselor', N'87 103 882 563', N'dexter@sbcglobal.net', N'095-scared.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'58a527f2-e6bd-496d-afcf-6984257bf2c9', N'Cornelius', N'Winters', N'James', 9584, 586486, 424571, N'Maryville, TN 37803', N'Maryville, TN 37803', N'Kleenex', N'Auto Mechanic', N'6 087 830 267', N'slanglois@msn.com', N'036-angry-4.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'1f34b609-4f15-4b61-8e14-6a35b38d2d4c', N'Jaylyn', N'Leon', N'Ellison', 8629, 761047, 629180, N'3 Alton Lane', N'3 Alton Lane', N'Adobe Systems', N'Referee', N'89 838 686 473', N'oechslin@hotmail.com', N'139-surprised-4.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'51af59bc-06ca-42de-9e3b-6bdcaec753bc', N'Nancy ', N'Bryan', N'Devon', 1871, 347268, 990658, N'Bridgewater, NJ 08807', N'Bridgewater, NJ 08807', N'Vodafone', N'Lawyer', N'84 018 621 637', N'mgemmons@comcast.net', N'076-happy-5.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'03235637-b471-4d60-ae88-6c9ef21d019c', N'Koen', N'Waters', N'Abraham', 4065, 664366, 732787, N'Lititz, PA 17543', N'Lititz, PA 17543', N'Nissan Motor Co., Ltd.', N'Actuary', N'8 334 605 788', N'jipsen@sbcglobal.net', N'030-crying-8.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'e20018b1-3496-4417-b190-6d6b8b99d7c4', N'Clayton', N'Forbes', N'Zachary', 8660, 236405, 422773, N'7267 W. Roehampton St.', N'7267 W. Roehampton St.', N'Nissan Motor Co., Ltd.', N'Statistician', N'85 359 837 587', N'kronvold@mac.com', N'129-cool-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'dd73fb64-d22e-4028-a093-6da7bb7de0fc', N'Kadin', N'Mcclain', N'Riley', 8704, 683064, 28020, N'Cambridge, MA 02138', N'Cambridge, MA 02138', N'Nescafé', N'Elementary School Teacher', N'83 307 307 648', N'gtewari@sbcglobal.net', N'132-nerd-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'daa5867d-af0e-4603-9186-6dbf60cc1180', N'Sariah', N'Lin', N'Olive', 2153, 460491, 905724, N'Billings, MT 59101', N'Billings, MT 59101', N'Louis Vuitton', N'Photographer', N'83 685 991 877', N'gward@yahoo.ca', N'146-in-love-4.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'4b1cb764-03ae-457e-af1c-6e0954c87d5b', N'Darien', N'Sellers', N'Nadeen', 5110, 869140, 779085, N'12 Windsor St.', N'12 Windsor St.', N'Chase', N'Painter', N'3 319 182 434', N'punkis@hotmail.com', N'013-tongue-6.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'7b9cadfb-d39b-4bd5-a094-6e3f28e03fac', N'Ryleigh ', N'Brooks', N'Leonie', 2681, 769203, 532086, N'Holly Springs, NC 27540', N'Holly Springs, NC 27540', N'Starbucks', N'School Counselor', N' 625 810  5235', N'ismail@hotmail.com', N'070-late.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'c5880b15-a0e4-468d-852f-6eda298e635d', N'Lindsay', N'Curtis', N'Syllable', 1152, 481271, 777867, N'8992 Union Rd.', N'8992 Union Rd.', N'Budweiser Stag Brewing Company', N'Security Guard', N'6 213 593 669', N'msherr@optonline.net', N'011-tired-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'6c5bcf4c-c307-4b41-a04b-713d5ea95bbc', N'Jacquelyn ', N'Mccall', N'Sherleen', 3605, 373737, 964951, N'Lumberton, NC 28358', N'Lumberton, NC 28358', N'The Walt Disney Company', N'Environmental scientist', N'85 789 351 637', N'gtewari@icloud.com', N'084-thief.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'df8da09d-77fb-43a3-84fb-74958afa7f6f', N'Adam', N'Horton', N'Blake', 2735, 502335, 933854, N'7632 Oakwood Rd.', N'7632 Oakwood Rd.', N'Hermès', N'Computer Programmer', N'3 973 342 086', N'jaxweb@me.com', N'177-easter.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'8255752c-6447-459d-b8d1-74b82fc0cea0', N'Kaydence', N'Sellers', N'Susannah', 5563, 160745, 807042, N'Hyattsville, MD 20782', N'Hyattsville, MD 20782', N'Coca-Cola', N'Elementary School Teacher', N'8 677 084 447', N'isotopian@sbcglobal.net', N'002-cool-5.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'd8cb247f-a386-46ec-91cc-75b86671f6ed', N'Jamiya', N'Cross', N'Trevor', 1754, 958143, 246531, N'9542 Sutor Drive', N'9542 Sutor Drive', N'Beko', N'Personal Care Aide', N' 732 375  2363', N'nicktrig@me.com', N'057-music-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'4e36932f-d2ed-4bcc-bcff-77559d3ec89f', N'Kamden', N'Hardin', N'Ray', 2179, 517256, 939472, N'Columbus, GA 31904', N'Columbus, GA 31904', N'Allianz', N'Recreation & Fitness Worker', N'5 759 857 625', N'animats@yahoo.ca', N'034-angry-5.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'b8c4557a-0791-4e4d-8bfd-7780e7730ca7', N'Kyle', N'Mathis', N'Raine', 8966, 340666, 490162, N'Duluth, GA 30096', N'Duluth, GA 30096', N'Honda Motor Company, Ltd', N'Speech-Language Pathologist', N' 394 581  3937', N'gavinls@yahoo.com', N'056-vampire.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'4db2bd8d-d88b-4fc6-bcb5-77e6402848bf', N'Kane', N'Jacobson', N'Emerson', 3896, 957754, 368276, N'626 Leatherwood St.', N'626 Leatherwood St.', N'Porsche', N'Surveyor', N'8 339 144 764', N'jacks@mac.com', N'053-tired-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'3f49208c-a37f-4480-933c-77ec1cdbcd82', N'Joy', N'Franklin', N'Warren', 2846, 798890, 15158, N'7073 Hall Avenue', N'7073 Hall Avenue', N'VISA', N'Paramedic', N'82 926 627 836', N'brbarret@yahoo.ca', N'119-greed.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'f0d0f6c2-7c9b-4de7-82c1-77f22a26530a', N'Khalil', N'Montgomery', N'Eloise', 2574, 326715, 276634, N'Mount Prospect, IL 60056', N'Mount Prospect, IL 60056', N'Kellogg Company', N'College Professor', N'7 108 593 522', N'howler@msn.com', N'194-happy.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'ce2d8b0d-7212-4aea-913f-78023090ed35', N'Niko', N'Calderon', N'Troy', 7220, 353462, 163048, N'South El Monte, CA 91733', N'South El Monte, CA 91733', N'KFC', N'Systems Analyst', N'8 548 222 331', N'kludge@verizon.net', N'180-surprised.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'8f2ce420-b0b0-4900-9dc9-7979d1d89a90', N'Maya ', N'Clark', N'Evelyn', 4625, 441301, 224776, N'Champlin, MN 55316', N'Champlin, MN 55316', N'Tesco Corporation', N'Insurance Agent', N'86 756 948 839', N'crobles@me.com', N'116-music.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'd6abed4f-90f8-4ba4-8552-7cca7cc6f998', N'Jaidyn', N'Ali', N'Kaitlin', 9255, 131955, 623940, N'Piedmont, SC 29673', N'Piedmont, SC 29673', N'Ralph Lauren Corporation', N'Artist', N'8 722 303 310', N'jigsaw@verizon.net', N'026-happy-14.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'ede41cfe-13c0-45f3-a7bd-7dc3e70e6a7c', N'Nicholas ', N'Velez', N'Dawn', 4853, 175687, 971839, N'Bayonne, NJ 07002', N'Bayonne, NJ 07002', N'Budweiser Stag Brewing Company', N'School Psychologist', N'84 878 715 975', N'konit@aol.com', N'110-crying-4.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'f14bad3c-3da4-430d-8254-7e3a417ab094', N'Saniyah', N'Hawkins', N'Josiah', 7466, 33192, 845900, N'566 S. Cherry Street', N'566 S. Cherry Street', N'Honda Motor Company, Ltd', N'Executive Assistant', N'8 693 699 524', N'timtroyr@live.com', N'155-rich-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'5c5749db-f6ee-41d8-b7c8-7f379c9f0d78', N'Nikhil', N'Bowen', N'Glenn', 5254, 555116, 207488, N'Norwood, MA 02062', N'Norwood, MA 02062', N'Volkswagen Group', N'Firefighter', N'5 156 150 912', N'mbalazin@att.net', N'158-nerd-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'52a9c95a-c6c5-48c8-aad6-8123f648c385', N'Emery', N'Pitts', N'Eli', 2273, 445653, 327317, N'Garden City, NY 11530', N'Garden City, NY 11530', N'AT&T', N'Civil Engineer', N'4 639 323 808', N'mfburgo@icloud.com', N'168-muted.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'e9755c90-a34b-4604-bf67-8146a64f8c18', N'Donte ', N'Flowers', N'Brock', 8533, 684076, 494549, N'Maspeth, NY 11378', N'Maspeth, NY 11378', N'Smirnoff', N'Desktop publisher', N'84 156 318 358', N'bester@gmail.com', N'106-in-love-7.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'90d673c4-8dce-480b-854a-82e35c23df11', N'Cale', N'Odom', N'Ann', 4877, 252066, 650754, N'7285 Locust Drive', N'7285 Locust Drive', N'MTV', N'Compliance Officer', N'2 348 958 976', N'agapow@hotmail.com', N'031-crying-7.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'a5628073-4f74-4c84-ac3c-8431e2f2ef1c', N'Steve', N'Miles', N'Lydon', 4607, 499410, 292234, N'192 West Foster St.', N'192 West Foster St.', N'Samsung Group', N'Market Research Analyst', N'5 946 158 545', N'dougj@yahoo.com', N'045-star.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'f410f555-2054-4f63-8978-84ae676b2d4a', N'Anya', N'Higgins', N'Erin', 6573, 581276, 372963, N'Lynn, MA 01902', N'Lynn, MA 01902', N'Moët et Chandon', N'Urban Planner', N' 810 945  3933', N'nwiger@att.net', N'054-ugly-3.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'6c97db48-7606-4541-93f1-85c1dc4ca646', N'Dakota ', N'Haney', N'Marguerite', 1270, 718764, 946776, N'Rolla, MO 65401', N'Rolla, MO 65401', N'Siemens AG', N'Mason', N' 302 844  3480', N'scotfl@att.net', N'066-happy-7.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'ce1e0d98-7761-481f-adb3-87eeaaef4b75', N'Keshawn ', N'Cummings', N'Paul', 4536, 115339, 249425, N'Mount Holly, NJ 08060', N'Mount Holly, NJ 08060', N'Cisco Systems, Inc.', N'Designer', N'85 512 704 620', N'bryam@verizon.net', N'074-in-love-10.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'f5551d02-3144-4597-8fca-88df86afb0e6', N'Issac', N'Hurley', N'Blanche', 7906, 721186, 930722, N'985B Winding Way Dr.', N'985B Winding Way Dr.', N'Morgan Stanley', N'Receptionist', N'87 588 499 991', N'damian@yahoo.com', N'121-crying-3.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'a3b8b4bb-e0d6-4987-99b6-8a6579d5d4c4', N'Esteban', N'Bell', N'Cameron', 9563, 574791, 94009, N'148 Catherine Dr.', N'148 Catherine Dr.', N'Smirnoff', N'Clinical Laboratory Technician', N'5 554 448 316', N'pizza@yahoo.com', N'007-nervous-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'd7849903-6661-4f01-af1d-8d1cd25d8181', N'Corinne ', N'Roberts', N'Suzan', 7429, 823005, 329850, N'Wisconsin Rapids, WI 54494', N'Wisconsin Rapids, WI 54494', N'PepsiCo', N'Medical Secretary', N'84 932 193 942', N'symbolic@verizon.net', N'090-happy-4.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'09a872f3-2758-42de-88f6-8dc5fbc8864e', N'Adan', N'Noble', N'Bree', 3286, 297169, 238674, N'97 Elmwood Street', N'97 Elmwood Street', N'United Parcel Service', N'HR Specialist', N'3 052 146 934', N'bahwi@yahoo.com', N'163-crying.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'938ef42c-1928-4d54-b016-8ec60f5eddd8', N'Reid', N'Church', N'Candice', 6752, 159699, 228468, N'Alliance, OH 44601', N'Alliance, OH 44601', N'Ferrari S.p.A.', N'Loan Officer', N'84 827 447 133', N'gommix@yahoo.com', N'134-surprised-5.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'd6a51e1b-659f-432d-bf66-8ffb860f11ec', N'Kimberly ', N'Wilkerson', N'Carelyn', 9484, 965470, 262017, N'Dothan, AL 36301', N'Dothan, AL 36301', N'Mercedes-Benz', N'Preschool Teacher', N'86 913 363 494', N'daveewart@verizon.net', N'098-nerd-9.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'31e895e1-c8c4-4b40-9d74-92c1ac940e99', N'Milton ', N'Swanson', N'Chase', 8146, 691253, 765391, N'673 Hamilton Road', N'673 Hamilton Road', N'American Express', N'Patrol Officer', N'89 276 524 631', N'hampton@yahoo.com', N'085-sad-11.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'975ee74a-59b4-4f28-8928-9378b1fe9861', N'Trace ', N'Hahn', N'Clelia', 2835, 991998, 464652, N'Howell, NJ 07731', N'Howell, NJ 07731', N'Caterpillar Inc.', N'Sports Coach', N'88 794 426 528', N'jschauma@icloud.com', N'108-nerd-7.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'17639311-f51b-4027-972e-94cc5b87d27e', N'Kaila ', N'Carroll', N'Grey', 2909, 822374, 535063, N'549 Marvon St.', N'549 Marvon St.', N'KFC', N'Economist', N'84 298 091 931', N'sassen@msn.com', N'081-pain.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'5c27e0ed-f5f9-4b7b-8e0b-955175de8d27', N'Braeden ', N'Shea', N'Abe', 5348, 104186, 316595, N'Westport, CT 06880', N'Westport, CT 06880', N'Pampers', N'Landscaper & Groundskeeper', N' 320 478  3865', N'rnelson@yahoo.com', N'060-sad-13.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'63ca8a63-f563-467e-8a8e-9578cfbcec52', N'Case', N'Schultz', N'Aiden', 2208, 937197, 780691, N'8438 North Fairground Court', N'8438 North Fairground Court', N'Johnnie Walker', N'Drafter', N'3 657 526 445', N'mcmillan@optonline.net', N'005-shocked-4.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'a3b918eb-e50b-4f26-8f8d-978e8fb67efe', N'Madisyn', N'May', N'Byron', 7751, 986773, 13897, N'Webster, NY 14580', N'Webster, NY 14580', N'BMW', N'Registered Nurse', N'2 309 068 815', N'raides@sbcglobal.net', N'182-sad-6.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'b0c6ebb7-0b13-4e49-90bc-9c1271f693fc', N'Zack ', N'Khan', N'Gabriel', 9952, 372202, 670847, N'West Des Moines, IA 50265', N'West Des Moines, IA 50265', N'Hermès', N'Customer Service Representative', N'84 585 660 054', N'karasik@msn.com', N'078-cool-3.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'8dea0d68-d019-485b-ab2d-9e08ddbd5302', N'Kiara ', N'James', N'Jeremy', 7133, 997003, 791278, N'63 53rd Ave.', N'63 53rd Ave.', N'Corona', N'Software Developer', N'83 904 997 403', N'calin@att.net', N'103-in-love-9.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'eced4b32-ffed-4fc1-a992-9e2f0d8d14f1', N'Aimee ', N'Ewing', N'Lane', 6306, 285690, 230064, N'56 Vale St.', N'56 Vale St.', N'Bank of America', N'Diagnostic Medical Sonographer', N'84 074 855 030', N'bruck@outlook.com', N'091-sad-10.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'bc18c6dd-cb43-4b95-8b3e-9e50839d385a', N'Sammy', N'Freeman', N'Lane', 1085, 749551, 902946, N'15 Indian Summer St.', N'15 Indian Summer St.', N'Mitsubishi', N'IT Manager', N'9 068 255 704', N'metzzo@att.net', N'023-laughing-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'05253225-bddd-4c33-b1cc-9eaad6accdd4', N'Haylie', N'Singleton', N'Sue', 1646, 243340, 134470, N'146 East Bank Street', N'146 East Bank Street', N'Google', N'Physical Therapist', N'86 328 747 209', N'scitext@gmail.com', N'145-wink.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'f77071dd-6a77-40a0-a553-a127ea9b77ca', N'Spencer', N'Anderson', N'Meaghan', 9008, 379623, 674783, N'Lithonia, GA 30038', N'Lithonia, GA 30038', N'Toyota Motor Corporation', N'Electrician', N'3 926 824 442', N'murty@outlook.com', N'008-nervous-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'9f96fd92-64bd-4ef3-90a3-a532900d9937', N'Genevieve ', N'Keith', N'David', 5467, 865823, 316039, N'Tullahoma, TN 37388', N'Tullahoma, TN 37388', N'HSBC', N'Editor', N'84 559 446 449', N'hakim@comcast.net', N'094-ugly-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'4d6e6e42-4e78-4cc7-92e4-a55a5f86ed86', N'Abbey', N'Gordon', N'Berlynn', 8909, 475995, 60302, N'Vienna, VA 22180', N'Vienna, VA 22180', N'Nokia', N'Event Planner', N'4 127 068 937', N'emcleod@outlook.com', N'042-book.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'e174d8f1-343c-49f2-b47f-a724ddd1d585', N'Matias ', N'Valencia', N'Reagan', 2102, 137023, 279901, N'Lynnwood, WA 98037', N'Lynnwood, WA 98037', N'Intel Corporation', N'Food Scientist', N'85 244 497 554', N'adillon@comcast.net', N'114-greed-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'ae3fc212-e2d9-408e-92e9-a7f7b97c8578', N'Helena', N'Houston', N'Murphy', 1529, 516117, 374799, N'Harleysville, PA 19438', N'Harleysville, PA 19438', N'Pizza Hut', N'Speech-Language Pathologist', N'8 059 532 020', N'kalpol@comcast.net', N'186-angry-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'30ac3682-cdcf-42c9-905c-a9c612c574f3', N'Beau', N'Rivers', N'Lillian', 8452, 55461, 577380, N'Massillon, OH 44646', N'Massillon, OH 44646', N'Tiffany & Co.', N'Cost Estimator', N'85 402 398 104', N'smcnabb@live.com', N'136-tongue-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'4a828c12-295f-4854-8235-ac0d83c3eec9', N'Larry', N'Watson', N'Blayne', 4859, 211563, 898596, N'299 E. George St.', N'299 E. George St.', N'Volkswagen Group', N'Art Director', N' 845 438  1802', N'willg@att.net', N'059-nurse.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'15a2aaff-caec-48bf-8a90-afef67c532c3', N'Liam', N'Frazier', N'Korin', 8828, 972758, 885712, N'Norman, OK 73072', N'Norman, OK 73072', N'Verizon Communications', N'Educator', N'83 743 564 166', N'tubesteak@comcast.net', N'148-bang.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'7da92742-8a24-4aa0-b9d9-b04959645f27', N'Melina', N'Hamilton', N'Isaac', 3115, 642377, 74940, N'Chelmsford, MA 01824', N'Chelmsford, MA 01824', N'Porsche', N'Psychologist', N'8 728 567 001', N'crowl@icloud.com', N'152-outrage.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'2f2bec30-2a61-44c5-aea5-b0de1a07600c', N'Kiley', N'Pham', N'Madeleine', 2401, 289619, 924581, N'Seymour, IN 47274', N'Seymour, IN 47274', N'Adidas', N'Recreation & Fitness Worker', N'8 129 199 643', N'chrisj@outlook.com', N'164-sad-7.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'68cc3704-853b-432d-8021-b1dc1b8d38b9', N'Jamir ', N'Curtis', N'Tavian', 3983, 947212, 30097, N'648 Hill Field St.', N'648 Hill Field St.', N'IBM', N'Librarian', N'85 035 726 773', N'wonderkid@hotmail.com', N'111-muted-3.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'88db7403-c068-4be6-ad46-b49f6c24392a', N'Isaias', N'Mcdowell', N'Kalan', 4368, 409875, 697427, N'Savannah, GA 31404', N'Savannah, GA 31404', N'Panasonic Corporation', N'Firefighter', N'4 517 686 075', N'danneng@msn.com', N'028-happy-13.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'386f9359-69d8-474d-b6d6-b5dc49a45ef6', N'Irene', N'Caldwell', N'Noah', 5732, 336554, 660042, N'83 NE. Hill Dr.', N'83 NE. Hill Dr.', N'Deere & Company', N'Mechanical Engineer', N'7 039 587 186', N'thurston@outlook.com', N'157-angel.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'32137ee1-46ec-4288-8074-b7acdfc32b19', N'Ava', N'Melton', N'Annabel', 1788, 509266, 809566, N'Zeeland, MI 49464', N'Zeeland, MI 49464', N'Hewlett-Packard', N'Housekeeper', N'8 253 018 250', N'citadel@msn.com', N'176-shocked.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'b802ad47-14c5-4913-a989-b8f0687e685a', N'Marisol', N'Roach', N'Dezi', 2416, 240325, 245515, N'Titusville, FL 32780', N'Titusville, FL 32780', N'Yahoo!', N'Registered Nurse', N'8 834 555 204', N'mccurley@optonline.net', N'052-happy-9.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'6845ec2b-2046-4cf8-8a02-b98b61f8ae24', N'Jaylen', N'Thornton', N'Tobias', 2868, 392150, 998746, N'Bismarck, ND 58501', N'Bismarck, ND 58501', N'American Express', N'Urban Planner', N'4 296 781 872', N'krueger@msn.com', N'184-sad-4.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'e4fbc3d5-cd81-4d99-8f5a-b99b368dca16', N'Asia ', N'Rivera', N'Carmden', 1618, 439727, 262275, N'298 N. Hudson Court', N'298 N. Hudson Court', N'Toyota Motor Corporation', N'Actor', N'89 009 030 657', N'imightb@gmail.com', N'107-ugly.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'79495bb9-3a22-4b18-aab4-bbb22cf0126d', N'Kaden', N'Love', N'Neil', 1850, 453434, 478037, N'139 N. Grand St.', N'139 N. Grand St.', N'Tiffany & Co.', N'Web Developer', N'6 886 567 203', N'notaprguy@verizon.net', N'037-happy-11.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'af0113cb-1934-4ce7-8095-bc74a1e0efda', N'Karley', N'Petersen', N'Rory', 4008, 604291, 450994, N'57 Gulf Avenue', N'57 Gulf Avenue', N'Gap Inc.', N'Microbiologist', N'8 528 025 653', N'scitext@me.com', N'171-thinking.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'71f8ef40-9c36-4a2f-81f9-bec3b670a10d', N'Seamus', N'Pugh', N'Jackson', 4693, 133588, 989757, N'Winter Springs, FL 32708', N'Winter Springs, FL 32708', N'Credit Suisse', N'Systems Analyst', N'5 067 741 574', N'stewwy@att.net', N'050-flower.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'1a757f21-b674-4539-830b-bef4b0ad0afc', N'Sean ', N'Conway', N'Garrison', 5367, 598823, 325417, N'Dundalk, MD 21222', N'Dundalk, MD 21222', N'General Electric', N'Writer', N'84 642 859 954', N'jandrese@yahoo.ca', N'082-cyclops.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'30a8ca6c-47e0-4e36-88a9-bf4e3719d42f', N'Alexis', N'Levine', N'Juan', 6021, 143882, 191499, N'Long Beach, NY 11561', N'Long Beach, NY 11561', N'Xerox', N'Radiologic Technologist', N'6 237 167 237', N'msusa@comcast.net', N'044-dead-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'5c63a539-7ebf-4fdf-b02e-bfed3aef16d7', N'Finley', N'Mills', N'Ace', 4286, 976952, 843098, N'Irwin, PA 15642', N'Irwin, PA 15642', N'3M', N'Civil Engineer', N'5 304 027 915', N'yruan@sbcglobal.net', N'038-angry-3.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'a2475fd4-89de-4c9f-a53e-c03444a6136d', N'Lilah', N'Marks', N'Anthony', 3584, 358162, 882011, N'9122 South Addison St.', N'9122 South Addison St.', N'Ralph Lauren Corporation', N'Electrical Engineer', N'86 283 261 104', N'sjava@aol.com', N'125-sick-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'05673185-4eab-4f2d-b51e-c034b23083d4', N'Tripp ', N'Curtis', N'Apollo', 6426, 682782, 201742, N'8329 North Greenview St.', N'8329 North Greenview St.', N'L''Oréal', N'Dentist', N'84 932 743 888', N'msherr@sbcglobal.net', N'099-greed-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'8e423ed4-70de-4994-bdfe-c1b904e5e992', N'Malia ', N'Rivas', N'Louis', 3871, 532007, 875661, N'697 Cypress Lane', N'697 Cypress Lane', N'Citigroup', N'Veterinarian', N' 449 380  7477', N'jramio@optonline.net', N'067-sun.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'75ffa39d-2d19-4a21-83fe-c3afc3d4d5d2', N'Neveah', N'Dean', N'Evony', 9283, 299023, 503601, N'56 Annadale Dr.', N'56 Annadale Dr.', N'Nike, Inc.', N'Carpenter', N'5 558 026 671', N'burniske@outlook.com', N'029-happy-12.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'62cfb3af-07d1-4b32-86e5-c5c724acbbfb', N'Braedon', N'Delgado', N'Oliver', 3627, 384983, 821333, N'570 Old Bayberry Street', N'570 Old Bayberry Street', N'Audi', N'Physician', N'86 425 484 829', N'tellis@icloud.com', N'123-surprised-6.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'1aeeb978-c797-466f-8d8f-c6d7af21d9ef', N'Markus', N'Henry', N'Edward', 2767, 784535, 900432, N'400 Amerige St.', N'400 Amerige St.', N'Shell Oil Company', N'Chemist', N'2 626 352 834', N'bmorrow@me.com', N'039-cyclops-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'64b05453-be65-4f03-8ca4-c7071d9bc9bf', N'Jaydin', N'Singh', N'Jordon', 7540, 934686, 651032, N'Pembroke Pines, FL 33028', N'Pembroke Pines, FL 33028', N'Oracle Corporation', N'Secretary', N'2 415 703 040', N'mcsporran@aol.com', N'178-surprised-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'3b9de90c-398f-4743-9882-c7e6e3549a69', N'Janiya', N'Neal', N'Irene', 5244, 495362, 172365, N'720 Summerhouse Street', N'720 Summerhouse Street', N'Ferrari S.p.A.', N'Financial Advisor', N'3 135 078 540', N'drewf@me.com', N'035-sad-14.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'ee9dbec4-ebb8-493b-82fe-c90aed908a02', N'Thalia', N'Delacruz', N'Caprice', 9169, 340517, 137788, N'314 N. Gulf Lane', N'314 N. Gulf Lane', N'Tesco Corporation', N'Cashier', N'7 696 107 084', N'ehood@icloud.com', N'017-nervous.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'57c5fa77-18fb-4eb1-928e-caaa2a9a90e3', N'Izabelle', N'Boyle', N'Naveen', 2262, 625946, 196936, N'Lewiston, ME 04240', N'Lewiston, ME 04240', N'Samsung Group', N'Occupational Therapist', N'86 337 007 724', N'hwestiii@mac.com', N'144-santa-claus.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'bf3e6dea-e88d-4a24-9d18-cc7b2b83adc7', N'Lilliana', N'Bell', N'Quintin', 4858, 465200, 299125, N'1 Rockville Ave.', N'1 Rockville Ave.', N'eBay', N'Executive Assistant', N'7 448 769 856', N'caidaperl@mac.com', N'025-happy-15.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'c799b4b6-fcb7-4bd5-a807-cd22058fdb19', N'Harper ', N'Thomas', N'Jae', 4948, 205524, 243277, N'215 Purple Finch Lane', N'215 Purple Finch Lane', N'Coca-Cola', N'Musician', N'84 369 518 996', N'mdielmann@sbcglobal.net', N'101-nerd-8.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'7d1fa9b9-6fb7-4561-8631-ce034b640453', N'Ethen', N'Glenn', N'Kate', 6342, 37367, 815003, N'225 Iroquois St.', N'225 Iroquois St.', N'IKEA', N'Microbiologist', N'9 182 854 740', N'kimvette@me.com', N'041-thinking-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'96735479-61d6-4615-965c-cf7293560d24', N'Nikhil', N'Merritt', N'Claudia', 8638, 615943, 809450, N'5 NE. Newcastle Drive', N'5 NE. Newcastle Drive', N'Nintendo', N'Court Reporter', N'8 018 140 510', N'kspiteri@icloud.com', N'191-sad.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'5276c7e7-c6ab-4103-8fac-d126cab643e2', N'Aileen', N'Copeland', N'Seth', 1067, 401389, 840534, N'15 Marsh St.', N'15 Marsh St.', N'Amazon.com', N'Web Developer', N'2 734 957 160', N'arachne@hotmail.com', N'167-thinking-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'fd40a935-2692-4e0e-b4df-d1482f6cdafc', N'Karley', N'Goodwin', N'Noel', 6338, 777372, 522008, N'Missoula, MT 59801', N'Missoula, MT 59801', N'Home Depot', N'Radiologic Technologist', N'4 257 832 253', N'tellis@att.net', N'174-hypnotized.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'82c4e0c6-49cf-4fa8-9ae0-d2386f3766ff', N'Cyrus ', N'Rose', N'Jacklyn', 7435, 360206, 655574, N'South Richmond Hill, NY 11419', N'South Richmond Hill, NY 11419', N'Chase', N'Telemarketer', N'87 097 566 389', N'pjacklam@verizon.net', N'112-nerd-5.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'746ed40b-2e09-457f-b0f0-d2cb623379af', N'Maya', N'Richardson', N'Heath', 7100, 947091, 265294, N'Garland, TX 75043', N'Garland, TX 75043', N'Sony', N'Photographer', N'8 376 391 067', N'kewley@sbcglobal.net', N'016-sleeping-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'81ae9ad8-c4ec-4e02-b09e-d6ec60a28026', N'Maci', N'Baird', N'Dustin', 3097, 188032, 340075, N'Hollywood, FL 33020', N'Hollywood, FL 33020', N'Microsoft', N'Educator', N'3 086 867 622', N'ilial@aol.com', N'018-surprised-8.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'32bdc237-4154-4da5-9b01-d989f8cab66e', N'Peyton', N'Hinton', N'Benjamin', 8020, 284910, 672826, N'Skokie, IL 60076', N'Skokie, IL 60076', N'Nike, Inc.', N'Maintenance & Repair Worker', N'86 436 765 328', N'ramollin@mac.com', N'128-in-love-6.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'9a210cce-290d-44c9-9c2d-dd44db3d7bd2', N'Alyson', N'Hartman', N'Lee', 7217, 461000, 925983, N'518 Clinton Ave.', N'518 Clinton Ave.', N'Mercedes-Benz', N'Veterinarian', N'5 338 911 018', N'onestab@live.com', N'197-in-love.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'cef02815-95cb-42c5-832d-ddda2926c5fe', N'Makaila ', N'Cantu', N'Fernando', 5298, 472573, 825989, N'1 Theatre Drive', N'1 Theatre Drive', N'BMW', N'Logistician', N'87 484 614 491', N'tmccarth@live.com', N'083-sweat.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'97009c23-8be0-4e6a-94cc-dddb7cada22a', N'Jacoby ', N'Rojas', N'Rose', 9367, 402446, 7428, N'551 Spruce St.', N'551 Spruce St.', N'Kia Motors', N'Computer Hardware Engineer', N'85 506 452 520', N'subir@verizon.net', N'073-sad-12.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'7111828c-31ad-4fd6-a960-e02c5ae7e395', N'Ariel', N'Sims', N'Bailey', 9254, 479522, 866890, N'South Windsor, CT 06074', N'South Windsor, CT 06074', N'Mitsubishi', N'Construction Manager', N'85 346 872 128', N'neonatus@aol.com', N'122-cheering.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'283737af-334d-4abe-9307-e08ada993375', N'Allisson ', N'Woodard', N'Joan', 9216, 132859, 635754, N'7671 Tunnel Street', N'7671 Tunnel Street', N'BlackBerry', N'Court Reporter', N' 486 828  8733', N'roesch@aol.com', N'061-graduated-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'f53a1725-af16-431b-b690-e0ec0c5ebf7b', N'Solomon', N'Nixon', N'Jolee', 3965, 425455, 243802, N'154 Galvin Ave.', N'154 Galvin Ave.', N'Wal-Mart', N'Mechanical Engineer', N'5 724 672 895', N'hoyer@optonline.net', N'027-laughing.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'3daae7a2-2cae-40b7-a2af-e1ff24115c3d', N'Reagan ', N'Simmons', N'Sharon', 2020, 814747, 470174, N'Windsor, CT 06095', N'Windsor, CT 06095', N'United Parcel Service', N'College Professor', N' 205 278  4756', N'marcs@verizon.net', N'064-police.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'4f20d730-dc4c-4bc7-8b91-e4700fd555cb', N'Vicente', N'Chavez', N'Bernice', 6403, 754163, 917835, N'8614 Charles Street', N'8614 Charles Street', N'Starbucks', N'Chemist', N'5 517 890 645', N'karasik@att.net', N'169-confused.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'1afdee70-3e17-423d-bd08-e681a2aaa047', N'Kristen', N'Dillon', N'Kylie', 4169, 626192, 521443, N'Durham, NC 27703', N'Durham, NC 27703', N'Hyundai', N'Anthropologist', N'8 035 104 214', N'calin@aol.com', N'154-dead.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'b8b4bfe1-4ec6-433f-b07a-e7fc9a4b8aad', N'Robert', N'Castro', N'Isaiah', 5001, 550223, 912556, N'Coventry, RI 02816', N'Coventry, RI 02816', N'VISA', N'Janitor', N'3 416 205 356', N'scarolan@live.com', N'020-happy-16.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'31c1a695-ead6-4da2-ada5-e85f3f87dd29', N'Saniyah ', N'Choi', N'Debree', 1102, 719495, 815229, N'41 Harvard Drive', N'41 Harvard Drive', N'Facebook, Inc.', N'Landscape Architect', N' 399 887  3591', N'itstatus@yahoo.ca', N'063-hungry.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'658b9986-84fe-4398-b6dd-e85fb1e1981a', N'Blaine', N'Melendez', N'Vivian', 5428, 298274, 921280, N'Ithaca, NY 14850', N'Ithaca, NY 14850', N'Johnson & Johnson', N'Bookkeeping clerk', N'3 623 384 199', N'rtanter@att.net', N'192-smile.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'54ac4083-4033-4fb0-84ba-e91f58d21a11', N'Kolton', N'Knight', N'Miriam', 7702, 344201, 254837, N'7070 Shady Street', N'7070 Shady Street', N'Xerox', N'Painter', N'84 672 435 219', N'raides@yahoo.com', N'143-pirate.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'cb03ffbd-4c16-4af2-8cec-eb6c8aba0677', N'Riley', N'Bentley', N'Hugh', 4452, 331700, 279775, N'7651 South La Sierra Dr.', N'7651 South La Sierra Dr.', N'3M', N'Clinical Laboratory Technician', N'88 637 142 111', N'shrapnull@aol.com', N'137-smart-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'2fe9d039-a9ef-4ff6-abb8-ef500d9077a5', N'Jerry ', N'Garner', N'Everett', 8239, 393741, 255295, N'Brookline, MA 02446', N'Brookline, MA 02446', N'Canon', N'Social Worker', N'83 205 479 952', N'thassine@me.com', N'080-zombie.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'0695a2e4-9bd7-4175-bc5e-f064bfb26fcf', N'Maximo ', N'Stephenson', N'Dex', 8134, 605243, 119462, N'Annapolis, MD 21401', N'Annapolis, MD 21401', N'Harley-Davidson Motor Company', N'Paralegal', N'82 108 897 840', N'ovprit@me.com', N'102-muted-4.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'6c8c3303-1afc-413a-a44d-f1753e466bed', N'Finnegan', N'Bray', N'Brighton', 3719, 717453, 83282, N'9648 Philmont Lane', N'9648 Philmont Lane', N'Harley-Davidson Motor Company', N'Childcare worker', N'2 214 287 850', N'isaacson@att.net', N'003-happy-17.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'adfdbf3a-5cf2-4285-b8b0-f27d4189dabf', N'Dakota ', N'Torres', N'Cash', 4559, 179023, 592365, N'477 Oakland Street', N'477 Oakland Street', N'NTT Data', N'Interpreter & Translator', N'89 316 527 478', N'tokuhirom@live.com', N'113-kiss-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'5b192946-c539-40f1-9a49-f58cf7d1fad2', N'Ace', N'Stephenson', N'Amity', 7796, 170860, 531408, N'3 Cooper Street', N'3 Cooper Street', N'McDonald''s', N'Professional athlete', N'3 198 723 287', N'elmer@comcast.net', N'019-tongue-4.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'b73a368f-4a13-4cb6-8867-f7150322e2c4', N'Jaida', N'Nichols', N'Lucinda', 9908, 341967, 683123, N'864 Highland Drive', N'864 Highland Drive', N'Allianz', N'Childcare worker', N'86 198 834 911', N'ylchang@mac.com', N'133-birthday-boy.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'77c5c2cd-6882-400d-b2db-f74627888593', N'Monserrat', N'Patrick', N'Coralie', 1583, 513755, 670778, N'935 West Ave.', N'935 West Ave.', N'Nescafé', N'HR Specialist', N'6 825 557 940', N'mglee@yahoo.com', N'033-cool-4.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'057f2db4-b921-4a57-8a53-fa113a62c770', N'Maxwell ', N'Lynn', N'Ellory', 1567, 431190, 707963, N'9817 Manor St.', N'9817 Manor St.', N'Hewlett-Packard', N'Real Estate Agent', N'85 076 254 900', N'csilvers@icloud.com', N'077-shocked-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'c308d85d-ceac-4cd8-817d-fa11e27e13f0', N'Rodolfo ', N'Lynn', N'Zion', 7932, 623470, 852333, N'Farmingdale, NY 11735', N'Farmingdale, NY 11735', N'Burberry', N'Plumber', N'85 956 156 057', N'jesse@me.com', N'086-kiss-4.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'dc98d84e-4865-4a66-ae91-faa5d44fdf2b', N'Khalil', N'Sullivan', N'Rylie', 6353, 693874, 525378, N'Yorktown Heights, NY 10598', N'Yorktown Heights, NY 10598', N'Bank of America', N'Landscaper & Groundskeeper', N'6 694 822 353', N'world@att.net', N'190-sad-1.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'cf4946bb-2147-48bb-b56f-fad73dfac9ea', N'Christian', N'Suarez', N'Lee', 5989, 222522, 74910, N'Billerica, MA 01821', N'Billerica, MA 01821', N'eBay', N'Mathematician', N'89 805 315 346', N'frode@live.com', N'124-muted-2.png', N'')
GO
INSERT [dbo].[Drivers] ([IdGuid], [Name], [Surname], [Middlename], [PassportSerial], [PassportNumber], [Postcode], [Address], [AddressLife], [Company], [Jobname], [Phone], [Email], [Photo], [Description]) VALUES (N'c7e8eee3-5b11-4e76-86a6-fe07ea42a252', N'Ashtyn ', N'Jimenez', N'Rhett', 6760, 404116, 515537, N'9851 East Prince Street', N'9851 East Prince Street', N'Gucci', N'Computer Systems Analyst', N'86 878 011 332', N'djupedal@hotmail.com', N'097-sad-9.png', N'')
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (1, N'5acf91e7-3cc1-4cef-8a85-2b2826e03a28', CAST(N'2019-01-13T00:00:00.000' AS DateTime), CAST(N'2027-07-03T00:00:00.000' AS DateTime), N'B', 5640, 613073, N'WBAKG7C54DJ746310', N'BMW', N'1-Series', 2009, 1794, 116, N'front-wheel drive', 1, N'О525УК', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (2, N'8255752c-6447-459d-b8d1-74b82fc0cea0', CAST(N'2018-08-02T00:00:00.000' AS DateTime), CAST(N'2023-09-21T00:00:00.000' AS DateTime), N'B', 7465, 904246, N'JN1CV6APXCM884333', N'BMW', N'1-Series', 2018, 1523, 118, N'front-wheel drive', 2, N'H014OH', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (3, N'6c8c3303-1afc-413a-a44d-f1753e466bed', CAST(N'2018-12-31T00:00:00.000' AS DateTime), CAST(N'2025-01-25T00:00:00.000' AS DateTime), N'B, A', 6750, 769897, N'2C4RDGCG2FR292116', N'BMW', N'2-Series', 1994, 1750, 120, N'front-wheel drive', 3, N'H015OH', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (4, N'8076858c-f4a3-4876-bae8-5733f91271d1', CAST(N'2019-02-26T00:00:00.000' AS DateTime), CAST(N'2021-10-30T00:00:00.000' AS DateTime), N'B', 4467, 967541, N'2HNYD2H46CH088623', N'BMW', N'1-Series', 1991, 1799, 127, N'front-wheel drive', 4, N'H016OH', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (5, N'63ca8a63-f563-467e-8a8e-9578cfbcec52', CAST(N'2019-03-12T00:00:00.000' AS DateTime), CAST(N'2025-06-03T00:00:00.000' AS DateTime), N'B', 9360, 117922, N'KNAFU5A29D5373281', N'BMW', N'New Class 1602, 1802, 2002', 2016, 1791, 128, N'front-wheel drive', 1, N'H017OH', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (6, N'b13d053d-207e-4914-ab8a-66363b7f04df', CAST(N'2018-05-29T00:00:00.000' AS DateTime), CAST(N'2021-07-15T00:00:00.000' AS DateTime), N'B', 9640, 750187, N'1FTMF1E84AK129978', N'BMW', N'3-Series', 2006, 1637, 129, N'front-wheel drive', 2, N'H018OH', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (7, N'a3b8b4bb-e0d6-4987-99b6-8a6579d5d4c4', CAST(N'2018-09-20T00:00:00.000' AS DateTime), CAST(N'2019-07-10T00:00:00.000' AS DateTime), N'B, A', 1148, 615982, N'WBAKE5C5XCJ498380', N'BMW', N'3-Series, M3', 2016, 1483, 133, N'full drive', 3, N'H019OH', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (8, N'f77071dd-6a77-40a0-a553-a127ea9b77ca', CAST(N'2018-06-21T00:00:00.000' AS DateTime), CAST(N'2022-11-18T00:00:00.000' AS DateTime), N'B', 6161, 864298, N'JTHFF2C27F2931205', N'BMW', N'3-Series, M3', 2008, 1574, 145, N'front-wheel drive', 4, N'H020OH', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (9, N'6afe90cb-9578-4759-a64f-4c160181c7f5', CAST(N'2019-05-14T00:00:00.000' AS DateTime), CAST(N'2020-11-18T00:00:00.000' AS DateTime), N'B', 9566, 936083, N'WBABW33455P972485', N'BMW', N'3-Series, M3', 1996, 1753, 170, N'front-wheel drive', 1, N'H021OH', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (10, N'dd2314f7-91f5-409e-8cfd-045fc43ed106', CAST(N'2019-02-28T00:00:00.000' AS DateTime), CAST(N'2019-10-15T00:00:00.000' AS DateTime), N'B', 1754, 167771, N'5FNRL5H2XCB183642', N'BMW', N'3-Series, M3', 2009, 1409, 180, N'front-wheel drive', 1, N'H022OH', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (11, N'c5880b15-a0e4-468d-852f-6eda298e635d', CAST(N'2018-06-23T00:00:00.000' AS DateTime), CAST(N'2022-06-14T00:00:00.000' AS DateTime), N'B', 8965, 820437, N'JTEBU4BF9DK234908', N'BMW', N'3-Series, M3', 2018, 1729, 201, N'front-wheel drive', 1, N'B111BB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (12, N'da536668-6b48-4f68-b9ff-383f8170b618', CAST(N'2019-02-01T00:00:00.000' AS DateTime), CAST(N'2027-05-06T00:00:00.000' AS DateTime), N'B', 1345, 505754, N'1G6DM577280903075', N'BMW', N'4-Series, M4', 2010, 1711, 202, N'front-wheel drive', 1, N'H342KK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (13, N'4b1cb764-03ae-457e-af1c-6e0954c87d5b', CAST(N'2019-04-11T00:00:00.000' AS DateTime), CAST(N'2020-01-08T00:00:00.000' AS DateTime), N'B', 6845, 157412, N'1GYFC43539R480716', N'BMW', N'3-Series, M3', 2001, 1748, 203, N'front-wheel drive', 1, N'A919HP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (14, N'c7fdbcdb-a138-4bf1-8b6a-138de0d04172', CAST(N'2018-10-20T00:00:00.000' AS DateTime), CAST(N'2021-08-28T00:00:00.000' AS DateTime), N'B', 3763, 724944, N'1N6AA0CJ3FN926889', N'BMW', N'4-Series, M4', 1995, 1761, 204, N'front-wheel drive', 1, N'C453CC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (15, N'e89ccbe7-a53a-4982-bce6-4314d9435186', CAST(N'2018-11-04T00:00:00.000' AS DateTime), CAST(N'2020-08-18T00:00:00.000' AS DateTime), N'B', 5753, 428231, N'2T1BURHE6EC080516', N'BMW', N'3-Series GT', 2009, 1574, 210, N'full drive', 1, N'T333HH', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (16, N'746ed40b-2e09-457f-b0f0-d2cb623379af', CAST(N'2018-08-23T00:00:00.000' AS DateTime), CAST(N'2024-01-30T00:00:00.000' AS DateTime), N'B', 2159, 855910, N'WBA3T7C57FP608583', N'BMW', N'New Class 1500, 1600, 1800, 2000', 2002, 1495, 215, N'front-wheel drive', 1, N'T103CC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (17, N'ee9dbec4-ebb8-493b-82fe-c90aed908a02', CAST(N'2019-02-08T00:00:00.000' AS DateTime), CAST(N'2024-08-16T00:00:00.000' AS DateTime), N'B', 5771, 562291, N'5FNYF3H48FB049614', N'BMW', N'5-Series', 2004, 1569, 217, N'front-wheel drive', 1, N'C403PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (18, N'81ae9ad8-c4ec-4e02-b09e-d6ec60a28026', CAST(N'2018-12-31T00:00:00.000' AS DateTime), CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'B, A', 9550, 828023, N'WVWGD7AJ7EW053317', N'BMW', N'5-Series, M5', 2008, 1705, 223, N'front-wheel drive', 1, N'E222EE', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (19, N'5b192946-c539-40f1-9a49-f58cf7d1fad2', CAST(N'2018-08-05T00:00:00.000' AS DateTime), CAST(N'2028-01-24T00:00:00.000' AS DateTime), N'B', 2269, 366545, N'JM1NC2LF0E0131767', N'BMW', N'5-Series, M5', 1998, 1585, 228, N'full drive', 2, N'E333KK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (20, N'b8b4bfe1-4ec6-433f-b07a-e7fc9a4b8aad', CAST(N'2018-12-09T00:00:00.000' AS DateTime), CAST(N'2020-04-19T00:00:00.000' AS DateTime), N'B', 3449, 882286, N'1FTSW2A50AE633032', N'BMW', N'5-Series, M5', 1993, 1493, 233, N'front-wheel drive', 1, N'K222CC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (21, N'961d322d-ec47-486a-be16-346737b2e3fe', CAST(N'2018-11-22T00:00:00.000' AS DateTime), CAST(N'2020-06-14T00:00:00.000' AS DateTime), N'B', 3453, 766347, N'2C3CCAKT5CH834724', N'BMW', N'5-Series, M5', 2019, 1633, 235, N'front-wheel drive', 1, N'K777KK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (22, N'ed336c24-5654-4a9d-b421-46564b640b0d', CAST(N'2018-12-11T00:00:00.000' AS DateTime), CAST(N'2027-08-22T00:00:00.000' AS DateTime), N'B', 2252, 107095, N'1FMJU1F5XAE067185', N'BMW', N'X7', 2004, 1557, 236, N'front-wheel drive', 1, N'A111AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (23, N'bc18c6dd-cb43-4b95-8b3e-9e50839d385a', CAST(N'2019-02-11T00:00:00.000' AS DateTime), CAST(N'2028-05-02T00:00:00.000' AS DateTime), N'B', 2259, 191387, N'5TFBY5F18AX095253', N'Cadillac', N'Cimarron', 1994, 1539, 245, N'front-wheel drive', 1, N'A222AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (24, N'c2fa3a34-a177-426b-890c-4bafa5f55362', CAST(N'2019-02-12T00:00:00.000' AS DateTime), CAST(N'2028-02-26T00:00:00.000' AS DateTime), N'B', 5567, 914299, N'WAUVC68E55A439175', N'Cadillac', N'BLS', 2005, 1471, 276, N'front-wheel drive', 4, N'E454KK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (25, N'bf3e6dea-e88d-4a24-9d18-cc7b2b83adc7', CAST(N'2018-06-28T00:00:00.000' AS DateTime), CAST(N'2025-06-14T00:00:00.000' AS DateTime), N'B', 3755, 538095, N'3D73M4CL0AG485600', N'Cadillac', N'ATS', 2013, 1500, 277, N'front-wheel drive', 1, N'B430CC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (26, N'd6abed4f-90f8-4ba4-8552-7cca7cc6f998', CAST(N'2018-05-23T00:00:00.000' AS DateTime), CAST(N'2027-02-17T00:00:00.000' AS DateTime), N'B, A', 2365, 140143, N'3D73M3CL4BG992821', N'Cadillac', N'ELR', 1998, 1750, 280, N'full drive', 1, N'C444CC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (27, N'f53a1725-af16-431b-b690-e0ec0c5ebf7b', CAST(N'2018-10-09T00:00:00.000' AS DateTime), CAST(N'2019-11-02T00:00:00.000' AS DateTime), N'B', 7644, 231262, N'2HNYD18214H913977', N'Cadillac', N'Catera', 1992, 1586, 286, N'front-wheel drive', 1, N'C555CC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (28, N'88db7403-c068-4be6-ad46-b49f6c24392a', CAST(N'2018-06-06T00:00:00.000' AS DateTime), CAST(N'2020-06-20T00:00:00.000' AS DateTime), N'B', 7180, 465917, N'1G6DJ5E34C0750992', N'Cadillac', N'CTS', 2005, 1455, 295, N'front-wheel drive', 1, N'C323PC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (29, N'75ffa39d-2d19-4a21-83fe-c3afc3d4d5d2', CAST(N'2019-02-13T00:00:00.000' AS DateTime), CAST(N'2021-03-19T00:00:00.000' AS DateTime), N'B', 8854, 797589, N'3VW217AU7FM147306', N'Cadillac', N'CTS', 2004, 1795, 311, N'front-wheel drive', 1, N'A777YE', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (30, N'03235637-b471-4d60-ae88-6c9ef21d019c', CAST(N'2018-06-25T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), N'B', 9243, 289084, N'1FMJU1J56AE113733', N'Cadillac', N'CTS', 1997, 1445, 340, N'front-wheel drive', 1, N'A332AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (31, N'90d673c4-8dce-480b-854a-82e35c23df11', CAST(N'2019-02-15T00:00:00.000' AS DateTime), CAST(N'2025-06-24T00:00:00.000' AS DateTime), N'B', 2457, 286769, N'JN1CV6AP0CM243398', N'Cadillac', N'Series 60', 1999, 1433, 345, N'front-wheel drive', 1, N'E343EE', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (32, N'7a794881-860f-4147-866d-07b9bcabbaa4', CAST(N'2018-08-15T00:00:00.000' AS DateTime), CAST(N'2024-08-25T00:00:00.000' AS DateTime), N'B', 9062, 811272, N'1FTWW3B5XAE601405', N'Cadillac', N'Series 61', 2000, 1459, 370, N'front-wheel drive', 2, N'E555EE', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (33, N'77c5c2cd-6882-400d-b2db-f74627888593', CAST(N'2019-01-05T00:00:00.000' AS DateTime), CAST(N'2021-06-11T00:00:00.000' AS DateTime), N'B', 8160, 668818, N'WBASN2C55AC523024', N'Cadillac', N'Series 61', 2000, 1504, 371, N'front-wheel drive', 1, N'A111AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (34, N'4e36932f-d2ed-4bcc-bcff-77559d3ec89f', CAST(N'2018-09-25T00:00:00.000' AS DateTime), CAST(N'2027-10-07T00:00:00.000' AS DateTime), N'B', 4954, 493125, N'NM0KS9BNXBT830533', N'Cadillac', N'Series 61', 1991, 1401, 373, N'front-wheel drive', 2, N'C112BB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (35, N'3b9de90c-398f-4743-9882-c7e6e3549a69', CAST(N'2018-09-19T00:00:00.000' AS DateTime), CAST(N'2028-04-08T00:00:00.000' AS DateTime), N'B', 2858, 111698, N'1C4RJEAG6FC571030', N'Cadillac', N'Series 61', 2015, 1677, 377, N'front-wheel drive', 3, N'H113BA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (36, N'58a527f2-e6bd-496d-afcf-6984257bf2c9', CAST(N'2018-11-14T00:00:00.000' AS DateTime), CAST(N'2026-09-10T00:00:00.000' AS DateTime), N'B', 6268, 279896, N'WBS3R9C51FF196091', N'Cadillac', N'Series 65', 2001, 1596, 383, N'front-wheel drive', 4, N'T114BK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (37, N'79495bb9-3a22-4b18-aab4-bbb22cf0126d', CAST(N'2018-12-16T00:00:00.000' AS DateTime), CAST(N'2022-07-25T00:00:00.000' AS DateTime), N'B', 3169, 987280, N'1G4HD57238U904159', N'Cadillac', N'Series 62', 1993, 1583, 385, N'front-wheel drive', 1, N'K115BC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (38, N'5c63a539-7ebf-4fdf-b02e-bfed3aef16d7', CAST(N'2018-08-30T00:00:00.000' AS DateTime), CAST(N'2019-06-04T00:00:00.000' AS DateTime), N'B, A', 6257, 783363, N'1HGCP2E46AA778977', N'Cadillac', N'Series 62', 2019, 1417, 387, N'front-wheel drive', 1, N'E116PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (39, N'1aeeb978-c797-466f-8d8f-c6d7af21d9ef', CAST(N'2018-06-24T00:00:00.000' AS DateTime), CAST(N'2028-01-27T00:00:00.000' AS DateTime), N'B, A', 7146, 913695, N'WAUBGAFB1AN276966', N'Cadillac', N'Series 62', 1992, 1423, 399, N'front-wheel drive', 1, N'H117PK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (40, N'cea5be90-4082-4d43-9acf-68315550befb', CAST(N'2019-02-17T00:00:00.000' AS DateTime), CAST(N'2026-05-15T00:00:00.000' AS DateTime), N'B, A', 9066, 607418, N'WAUDF48H97A496239', N'Cadillac', N'Series 62', 2002, 1652, 403, N'front-wheel drive', 1, N'Y118PA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (41, N'7d1fa9b9-6fb7-4561-8631-ce034b640453', CAST(N'2018-09-01T00:00:00.000' AS DateTime), CAST(N'2023-01-25T00:00:00.000' AS DateTime), N'B, A', 3748, 951841, N'5UXFG83558L839159', N'Cadillac', N'Series 62', 2016, 1777, 406, N'front-wheel drive', 2, N'T119AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (42, N'4d6e6e42-4e78-4cc7-92e4-a55a5f86ed86', CAST(N'2018-10-13T00:00:00.000' AS DateTime), CAST(N'2022-09-26T00:00:00.000' AS DateTime), N'B, A', 9570, 754064, N'1FMJK1J51AE558998', N'Cadillac', N'6200', 2000, 1426, 408, N'rear drive', 3, N'K120BB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (43, N'32268434-1ab5-42eb-836b-3a75a748f8e8', CAST(N'2018-10-25T00:00:00.000' AS DateTime), CAST(N'2023-09-16T00:00:00.000' AS DateTime), N'B, A', 8174, 301902, N'SCFBF03B27G582917', N'Cadillac', N'6200', 2012, 1629, 415, N'front-wheel drive', 1, N'A121PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (44, N'30a8ca6c-47e0-4e36-88a9-bf4e3719d42f', CAST(N'2018-09-24T00:00:00.000' AS DateTime), CAST(N'2023-05-23T00:00:00.000' AS DateTime), N'B, A', 9873, 370750, N'WAUCFAFH0AN942677', N'Cadillac', N'Series 60 (Sixty Special)', 2002, 1438, 416, N'front-wheel drive', 2, N'C122PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (45, N'a5628073-4f74-4c84-ac3c-8431e2f2ef1c', CAST(N'2018-10-07T00:00:00.000' AS DateTime), CAST(N'2021-01-08T00:00:00.000' AS DateTime), N'B, A', 9263, 836793, N'JN8CS1MU3EM315101', N'Cadillac', N'Series 60 (Sixty Special)', 1999, 1724, 417, N'front-wheel drive', 3, N'H123CC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (46, N'c8eda812-fe1f-4f6c-b532-3ef357b4a52a', CAST(N'2019-01-30T00:00:00.000' AS DateTime), CAST(N'2024-01-08T00:00:00.000' AS DateTime), N'B, A', 8567, 433962, N'1D7RE3BK7AS869215', N'Cadillac', N'Fleetwood Brougham', 1992, 1434, 425, N'front-wheel drive', 1, N'T124CP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (47, N'5c00c22c-172d-4010-986d-675a0f2f9f6f', CAST(N'2019-02-11T00:00:00.000' AS DateTime), CAST(N'2019-07-20T00:00:00.000' AS DateTime), N'B, A', 6853, 739807, N'5N1AA0NC5EN749211', N'Cadillac', N'Brougham', 1995, 1459, 427, N'front-wheel drive', 1, N'K125PC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (48, N'360e4ddf-5c3a-46c5-ba92-0244a6123448', CAST(N'2019-01-26T00:00:00.000' AS DateTime), CAST(N'2021-08-13T00:00:00.000' AS DateTime), N'B, A', 8459, 127815, N'3D7TT2CT1BG470774', N'Cadillac', N'Fleetwood', 2015, 1460, 428, N'front-wheel drive', 1, N'E126AP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (49, N'dd674d5f-5b5c-4fc8-8a9d-2b33e9809aa6', CAST(N'2018-06-17T00:00:00.000' AS DateTime), CAST(N'2020-04-19T00:00:00.000' AS DateTime), N'B, A', 6558, 972443, N'WBA3V5C5XFP343527', N'Cadillac', N'Fleetwood', 1997, 1583, 445, N'front-wheel drive', 1, N'H127PA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (50, N'71f8ef40-9c36-4a2f-81f9-bec3b670a10d', CAST(N'2019-03-21T00:00:00.000' AS DateTime), CAST(N'2028-03-11T00:00:00.000' AS DateTime), N'B, A', 1179, 215392, N'1G6DE5E5XC0016413', N'Cadillac', N'Series 75', 1997, 1601, 446, N'front-wheel drive', 1, N'Y128CP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (51, N'a49d2ed1-ae04-4ed7-821e-4d8b00c6622a', CAST(N'2018-11-29T00:00:00.000' AS DateTime), CAST(N'2024-03-22T00:00:00.000' AS DateTime), N'B', 4750, 682392, N'1FTSF3A50AE770400', N'Cadillac', N'Series 75', 2006, 1505, 447, N'front-wheel drive', 4, N'T129PC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (52, N'b802ad47-14c5-4913-a989-b8f0687e685a', CAST(N'2019-03-14T00:00:00.000' AS DateTime), CAST(N'2024-10-02T00:00:00.000' AS DateTime), N'B', 5780, 704668, N'1FTEX1CM5BK565807', N'Cadillac', N'Series 75', 2009, 1518, 448, N'front-wheel drive', 1, N'K130CA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (53, N'4db2bd8d-d88b-4fc6-bcb5-77e6402848bf', CAST(N'2018-09-26T00:00:00.000' AS DateTime), CAST(N'2021-10-09T00:00:00.000' AS DateTime), N'B', 8351, 612336, N'1G6AH5S31F0348385', N'Cadillac', N'Series 75', 1998, 1781, 449, N'front-wheel drive', 1, N'A131AB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (54, N'f410f555-2054-4f63-8978-84ae676b2d4a', CAST(N'2019-02-25T00:00:00.000' AS DateTime), CAST(N'2020-04-15T00:00:00.000' AS DateTime), N'B', 8848, 700693, N'1N4AB7APXDN538514', N'Cadillac', N'Series 75', 1999, 1404, 456, N'front-wheel drive', 1, N'C132BA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (55, N'a6501f74-c176-4009-a073-3cedf9857c76', CAST(N'2018-10-17T00:00:00.000' AS DateTime), CAST(N'2022-07-04T00:00:00.000' AS DateTime), N'B', 4556, 360521, N'3C6LD4AT3CG450587', N'Cadillac', N'Series 75', 2012, 1744, 458, N'front-wheel drive', 1, N'H133BY', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (56, N'b8c4557a-0791-4e4d-8bfd-7780e7730ca7', CAST(N'2018-10-13T00:00:00.000' AS DateTime), CAST(N'2025-11-13T00:00:00.000' AS DateTime), N'D, C', 3550, 716066, N'3GYFNCEY2BS887540', N'Cadillac', N'Series 75', 1994, 1468, 460, N'front-wheel drive', 1, N'T134AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (57, N'd8cb247f-a386-46ec-91cc-75b86671f6ed', CAST(N'2019-01-04T00:00:00.000' AS DateTime), CAST(N'2025-08-18T00:00:00.000' AS DateTime), N'B', 4443, 378433, N'1GYS4FEJ9CR310756', N'Cadillac', N'Series 75', 2019, 1535, 464, N'front-wheel drive', 1, N'K135BB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (58, N'64f949fd-3421-4b93-8dff-422cf8fd278b', CAST(N'2018-12-31T00:00:00.000' AS DateTime), CAST(N'2025-04-19T00:00:00.000' AS DateTime), N'B', 7044, 504351, N'WAUBFCFL8CN296660', N'Cadillac', N'Series 75', 1996, 1573, 480, N'front-wheel drive', 1, N'E136BA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (59, N'4a828c12-295f-4854-8235-ac0d83c3eec9', CAST(N'2019-03-16T00:00:00.000' AS DateTime), CAST(N'2025-08-16T00:00:00.000' AS DateTime), N'B', 4465, 130693, N'2T1BURHE5EC940812', N'Cadillac', N'Series 75', 2018, 1679, 481, N'front-wheel drive', 1, N'H137BK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (60, N'5c27e0ed-f5f9-4b7b-8e0b-955175de8d27', CAST(N'2018-12-24T00:00:00.000' AS DateTime), CAST(N'2021-07-11T00:00:00.000' AS DateTime), N'D, C', 8744, 923347, N'WAULT58EX5A470410', N'Cadillac', N'Fleetwood Limousine', 2016, 1604, 487, N'front-wheel drive', 1, N'Y138BC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (61, N'283737af-334d-4abe-9307-e08ada993375', CAST(N'2018-08-12T00:00:00.000' AS DateTime), CAST(N'2020-07-30T00:00:00.000' AS DateTime), N'D, C', 8378, 995967, N'JN8AF5MR7ET518545', N'Cadillac', N'Fleetwood 75', 2013, 1614, 498, N'front-wheel drive', 1, N'T139PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (62, N'7612266c-e53e-47e9-a4c9-5f2987cc68c0', CAST(N'2019-01-07T00:00:00.000' AS DateTime), CAST(N'2026-04-27T00:00:00.000' AS DateTime), N'D, C', 9973, 996427, N'WAUAC48H96K683520', N'Cadillac', N'Eldorado', 2011, 1649, 509, N'rear drive', 1, N'K140PK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (63, N'31c1a695-ead6-4da2-ada5-e85f3f87dd29', CAST(N'2019-01-06T00:00:00.000' AS DateTime), CAST(N'2022-06-15T00:00:00.000' AS DateTime), N'D, C', 7153, 413313, N'WAUHGAFC8FN632100', N'Cadillac', N'Eldorado', 2017, 1711, 601, N'front-wheel drive', 1, N'A141PA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (64, N'3daae7a2-2cae-40b7-a2af-e1ff24115c3d', CAST(N'2019-05-18T00:00:00.000' AS DateTime), CAST(N'2026-10-19T00:00:00.000' AS DateTime), N'D, C', 4343, 983635, N'WAUWFBFL6AA160138', N'Cadillac', N'Eldorado', 2017, 1406, 602, N'front-wheel drive', 1, N'C142AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (65, N'597dab6f-2797-463e-bf18-4af8e73595eb', CAST(N'2019-03-01T00:00:00.000' AS DateTime), CAST(N'2020-04-19T00:00:00.000' AS DateTime), N'D, C', 2561, 922773, N'WAUEH48H68K095273', N'Cadillac', N'Eldorado', 2004, 1736, 626, N'front-wheel drive', 1, N'H143BB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (66, N'6c97db48-7606-4541-93f1-85c1dc4ca646', CAST(N'2018-10-29T00:00:00.000' AS DateTime), CAST(N'2022-02-26T00:00:00.000' AS DateTime), N'D, C', 5878, 165905, N'WAUEH74F76N744161', N'Cadillac', N'Eldorado', 1995, 1490, 628, N'front-wheel drive', 1, N'T144PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (67, N'8e423ed4-70de-4994-bdfe-c1b904e5e992', CAST(N'2019-04-22T00:00:00.000' AS DateTime), CAST(N'2022-12-14T00:00:00.000' AS DateTime), N'D, C', 7242, 458530, N'1J4RG4GK7AC818854', N'Cadillac', N'Eldorado', 2000, 1636, 640, N'front-wheel drive', 1, N'K145PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (68, N'5eaa8e1d-e388-4532-b681-54667f051b5d', CAST(N'2018-06-02T00:00:00.000' AS DateTime), CAST(N'2026-10-26T00:00:00.000' AS DateTime), N'D, C', 5458, 150506, N'KNADH4A36B6877082', N'Cadillac', N'Eldorado', 2006, 1753, 670, N'front-wheel drive', 1, N'E146CC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (69, N'01a194ef-d74d-4092-accd-376afee083b8', CAST(N'2019-01-31T00:00:00.000' AS DateTime), CAST(N'2025-10-22T00:00:00.000' AS DateTime), N'D, C', 6976, 403371, N'3GYFNGEY9BS444647', N'Cadillac', N'Eldorado', 2010, 1419, 671, N'front-wheel drive', 1, N'H147CP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (70, N'7b9cadfb-d39b-4bd5-a094-6e3f28e03fac', CAST(N'2019-03-26T00:00:00.000' AS DateTime), CAST(N'2027-05-16T00:00:00.000' AS DateTime), N'D, C', 4565, 502480, N'WP0AB2A87FK108949', N'Cadillac', N'Eldorado', 2006, 1791, 690, N'full drive', 1, N'Y148PC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (71, N'd0cc02c8-b4da-4cab-89fd-49d526f215ca', CAST(N'2018-10-01T00:00:00.000' AS DateTime), CAST(N'2025-04-03T00:00:00.000' AS DateTime), N'D, C', 5647, 346550, N'3VWML7AJXEM569531', N'Kia', N'Cee''d', 1993, 1472, 793, N'front-wheel drive', 1, N'T149AP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (72, N'6d5a6dc1-74ed-4dcf-83d0-3bc5485fdea3', CAST(N'2018-07-14T00:00:00.000' AS DateTime), CAST(N'2027-02-10T00:00:00.000' AS DateTime), N'D, C', 5940, 123897, N'WBSBR93493P275260', N'Kia', N'Cee''d', 2010, 1551, 795, N'front-wheel drive', 1, N'K150PA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (73, N'97009c23-8be0-4e6a-94cc-dddb7cada22a', CAST(N'2018-11-03T00:00:00.000' AS DateTime), CAST(N'2023-09-19T00:00:00.000' AS DateTime), N'D, C', 7567, 880032, N'1G6DP567750890960', N'Kia', N'Cee''d', 2009, 1449, 798, N'front-wheel drive', 1, N'A151CP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (74, N'ce1e0d98-7761-481f-adb3-87eeaaef4b75', CAST(N'2018-08-20T00:00:00.000' AS DateTime), CAST(N'2021-11-07T00:00:00.000' AS DateTime), N'D, C', 5369, 329732, N'1FTEW1CM3DF334371', N'Kia', N'Sephia', 2005, 1540, 963, N'front-wheel drive', 1, N'C152PC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (75, N'f35dcad0-92ca-4cee-9285-43af8c5cafeb', CAST(N'2019-01-30T00:00:00.000' AS DateTime), CAST(N'2024-01-19T00:00:00.000' AS DateTime), N'D, C', 4265, 754604, N'WAUDH78E47A363910', N'Kia', N'Sephia', 1999, 1736, 101, N'full drive', 1, N'H153CA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (76, N'51af59bc-06ca-42de-9e3b-6bdcaec753bc', CAST(N'2018-10-13T00:00:00.000' AS DateTime), CAST(N'2025-09-25T00:00:00.000' AS DateTime), N'B', 4571, 347925, N'1C4RJEAG6CC011603', N'Kia', N'Cerato / Spectra', 2009, 1692, 107, N'front-wheel drive', 1, N'T154AB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (77, N'057f2db4-b921-4a57-8a53-fa113a62c770', CAST(N'2019-02-11T00:00:00.000' AS DateTime), CAST(N'2022-11-06T00:00:00.000' AS DateTime), N'B', 1849, 397861, N'1G6AB5SA9D0113584', N'Kia', N'Forte', 1991, 1665, 110, N'front-wheel drive', 1, N'K155BA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (78, N'b0c6ebb7-0b13-4e49-90bc-9c1271f693fc', CAST(N'2018-08-14T00:00:00.000' AS DateTime), CAST(N'2021-01-30T00:00:00.000' AS DateTime), N'B', 9755, 409226, N'1N6BF0KM6FN922689', N'Kia', N'Forte / K3', 1993, 1725, 116, N'full drive', 1, N'E156BY', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (79, N'1ae6a2d6-bddf-4ab9-8dbf-402a7fd3f45a', CAST(N'2018-07-10T00:00:00.000' AS DateTime), CAST(N'2021-02-22T00:00:00.000' AS DateTime), N'B', 1761, 996073, N'WA1YL64B34N831763', N'Kia', N'Forte / K3', 1995, 1710, 118, N'front-wheel drive', 1, N'H157AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (80, N'2fe9d039-a9ef-4ff6-abb8-ef500d9077a5', CAST(N'2018-10-17T00:00:00.000' AS DateTime), CAST(N'2023-07-20T00:00:00.000' AS DateTime), N'B', 8860, 686627, N'WBAUP9C58AV223509', N'Kia', N'Shuma', 2011, 1562, 120, N'front-wheel drive', 1, N'Y158BB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (81, N'17639311-f51b-4027-972e-94cc5b87d27e', CAST(N'2018-10-31T00:00:00.000' AS DateTime), CAST(N'2028-01-19T00:00:00.000' AS DateTime), N'B', 3368, 892304, N'WAUHF98P96A724812', N'Kia', N'Concord', 1991, 1512, 127, N'front-wheel drive', 1, N'T159BA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (82, N'1a757f21-b674-4539-830b-bef4b0ad0afc', CAST(N'2019-05-07T00:00:00.000' AS DateTime), CAST(N'2024-11-04T00:00:00.000' AS DateTime), N'B', 9645, 996326, N'1FTEX1CM1BF296018', N'Kia', N'Clarus', 1992, 1638, 128, N'front-wheel drive', 1, N'K160BK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (83, N'cef02815-95cb-42c5-832d-ddda2926c5fe', CAST(N'2019-02-28T00:00:00.000' AS DateTime), CAST(N'2024-03-02T00:00:00.000' AS DateTime), N'B', 5372, 524117, N'3LNDL2L33CR462059', N'Kia', N'Magentis / Optima', 2000, 1609, 129, N'front-wheel drive', 1, N'A161BC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (84, N'6c5bcf4c-c307-4b41-a04b-713d5ea95bbc', CAST(N'2019-01-16T00:00:00.000' AS DateTime), CAST(N'2021-01-23T00:00:00.000' AS DateTime), N'B', 3076, 820189, N'19UUA66218A797800', N'Kia', N'Magentis / Optima', 2003, 1603, 133, N'rear drive', 1, N'C162PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (85, N'31e895e1-c8c4-4b40-9d74-92c1ac940e99', CAST(N'2019-04-05T00:00:00.000' AS DateTime), CAST(N'2020-09-10T00:00:00.000' AS DateTime), N'B', 3153, 732792, N'ZFBCFACH5FZ996096', N'Kia', N'Magentis / Optima / K5', 1995, 1669, 145, N'full drive', 1, N'H163PK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (86, N'c308d85d-ceac-4cd8-817d-fa11e27e13f0', CAST(N'2018-05-31T00:00:00.000' AS DateTime), CAST(N'2024-07-30T00:00:00.000' AS DateTime), N'B', 2754, 500373, N'4T1BF1FK2EU831999', N'Kia', N'Magentis / Optima / K5', 2015, 1468, 170, N'front-wheel drive', 1, N'T164PA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (87, N'd697224a-72bf-45b1-b536-04cbb3d80f6e', CAST(N'2018-09-18T00:00:00.000' AS DateTime), CAST(N'2022-04-24T00:00:00.000' AS DateTime), N'B', 9752, 660653, N'2G4WS55J341869989', N'Kia', N'Stinger', 2006, 1546, 180, N'front-wheel drive', 1, N'K165AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (88, N'055cf888-1a4f-46a8-a852-00aedc91f447', CAST(N'2018-10-31T00:00:00.000' AS DateTime), CAST(N'2020-01-21T00:00:00.000' AS DateTime), N'B', 1645, 771049, N'1G6DN57U260742856', N'Kia', N'Potentia', 1995, 1608, 201, N'front-wheel drive', 1, N'E166BB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (89, N'28765b51-f322-4e0d-9298-42b4bd23117b', CAST(N'2018-08-04T00:00:00.000' AS DateTime), CAST(N'2027-01-17T00:00:00.000' AS DateTime), N'B', 6445, 186021, N'YV1382MW1A2097161', N'Kia', N'Potentia', 1997, 1757, 202, N'front-wheel drive', 1, N'H167PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (90, N'd7849903-6661-4f01-af1d-8d1cd25d8181', CAST(N'2018-11-07T00:00:00.000' AS DateTime), CAST(N'2021-04-17T00:00:00.000' AS DateTime), N'B', 5045, 725156, N'WA1LMAFE9DD722859', N'Kia', N'Enterprise', 2004, 1505, 203, N'full drive', 1, N'Y168PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (91, N'eced4b32-ffed-4fc1-a992-9e2f0d8d14f1', CAST(N'2019-04-14T00:00:00.000' AS DateTime), CAST(N'2022-07-18T00:00:00.000' AS DateTime), N'B', 2965, 213322, N'1FAHP3E28CL132877', N'Kia', N'Opirus / Amanti', 2003, 1651, 204, N'front-wheel drive', 1, N'T169CC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (92, N'f951fb5f-b1db-4109-a822-45801114faef', CAST(N'2019-02-23T00:00:00.000' AS DateTime), CAST(N'2020-01-27T00:00:00.000' AS DateTime), N'B', 3141, 340685, N'WBAUP7C52BV069773', N'Kia', N'Cadenza / K7', 1995, 1675, 210, N'front-wheel drive', 1, N'K170CP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (93, N'f12f767c-07c2-49e4-b36c-269b693408b6', CAST(N'2019-02-06T00:00:00.000' AS DateTime), CAST(N'2019-10-17T00:00:00.000' AS DateTime), N'B', 6071, 733903, N'1ZVBP8JZ2D5191071', N'Kia', N'Cadenza / K7', 1996, 1459, 215, N'front-wheel drive', 1, N'A171PC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (94, N'9f96fd92-64bd-4ef3-90a3-a532900d9937', CAST(N'2018-05-27T00:00:00.000' AS DateTime), CAST(N'2023-09-29T00:00:00.000' AS DateTime), N'B', 5449, 298803, N'3C63D2GL5CG863137', N'Kia', N'Quoris / K9 / K900', 2011, 1576, 217, N'front-wheel drive', 1, N'C172AP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (95, N'386a886d-ea81-429c-91f2-69621afd6862', CAST(N'2018-08-05T00:00:00.000' AS DateTime), CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'B', 7158, 321618, N'1G6KF57952U735337', N'Kia', N'Quoris / K9 / K900', 1994, 1421, 223, N'full drive', 1, N'H173PA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (96, N'e25b2f5d-6a7a-4b17-8fc2-1020796f686d', CAST(N'2018-11-06T00:00:00.000' AS DateTime), CAST(N'2024-12-24T00:00:00.000' AS DateTime), N'B', 8553, 424706, N'5XYKT3A62FG416932', N'Kia', N'Elan', 2000, 1518, 228, N'front-wheel drive', 1, N'T174CP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (97, N'c7e8eee3-5b11-4e76-86a6-fe07ea42a252', CAST(N'2019-02-06T00:00:00.000' AS DateTime), CAST(N'2019-06-19T00:00:00.000' AS DateTime), N'B', 2963, 456353, N'WBANV1C59AC580740', N'Kia', N'Venga', 2012, 1682, 233, N'front-wheel drive', 1, N'K175PC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (98, N'd6a51e1b-659f-432d-bf66-8ffb860f11ec', CAST(N'2019-01-21T00:00:00.000' AS DateTime), CAST(N'2025-10-16T00:00:00.000' AS DateTime), N'D1, D1E', 5759, 552536, N'WAUFGAFC6DN013144', N'Kia', N'Carens', 2006, 1508, 235, N'front-wheel drive', 1, N'E176CA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (99, N'05673185-4eab-4f2d-b51e-c034b23083d4', CAST(N'2018-08-17T00:00:00.000' AS DateTime), CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'B', 5565, 355405, N'3VWKX7AJ2DM808838', N'Kia', N'Carens / Rondo', 1995, 1475, 236, N'front-wheel drive', 1, N'H177AB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (100, N'39d4618a-cc87-4272-ab9b-52903e1a00fb', CAST(N'2019-02-15T00:00:00.000' AS DateTime), CAST(N'2022-05-09T00:00:00.000' AS DateTime), N'B', 5157, 441335, N'1G6DJ1E37D0628461', N'Kia', N'Joice', 1990, 1768, 245, N'front-wheel drive', 1, N'Y178BA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (101, N'c799b4b6-fcb7-4bd5-a807-cd22058fdb19', CAST(N'2019-01-13T00:00:00.000' AS DateTime), CAST(N'2025-08-29T00:00:00.000' AS DateTime), N'B', 5949, 144483, N'5FRYD4H97GB588815', N'Kia', N'Carnival / Sedona', 1998, 1737, 276, N'front-wheel drive', 1, N'T179BY', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (102, N'0695a2e4-9bd7-4175-bc5e-f064bfb26fcf', CAST(N'2018-08-02T00:00:00.000' AS DateTime), CAST(N'2019-07-06T00:00:00.000' AS DateTime), N'B', 7663, 351410, N'SCBDU3ZA7CC107541', N'Kia', N'Carnival / Sedona', 2005, 1680, 277, N'front-wheel drive', 1, N'K180AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (103, N'8dea0d68-d019-485b-ab2d-9e08ddbd5302', CAST(N'2018-12-31T00:00:00.000' AS DateTime), CAST(N'2019-05-25T00:00:00.000' AS DateTime), N'B', 7045, 177463, N'3VWF17AT3FM605285', N'Kia', N'Carnival / Sedona', 1991, 1539, 280, N'rear drive', 1, N'A181BB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (104, N'6907939b-2257-400b-95e3-58e54afc33c4', CAST(N'2019-02-26T00:00:00.000' AS DateTime), CAST(N'2026-12-12T00:00:00.000' AS DateTime), N'B', 5169, 640455, N'1LNHL9DK8EG585379', N'Kia', N'Retona', 2003, 1757, 286, N'front-wheel drive', 1, N'C182BA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (105, N'7ca128e7-50c3-495b-88cd-1d2927019f35', CAST(N'2019-03-12T00:00:00.000' AS DateTime), CAST(N'2022-01-03T00:00:00.000' AS DateTime), N'B', 8758, 537518, N'JN8AZ2KR3DT115699', N'Kia', N'Stonic', 2019, 1725, 295, N'front-wheel drive', 1, N'H183BK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (106, N'e9755c90-a34b-4604-bf67-8146a64f8c18', CAST(N'2018-05-29T00:00:00.000' AS DateTime), CAST(N'2019-06-20T00:00:00.000' AS DateTime), N'B', 1448, 206175, N'JN1CV6FEXCM381103', N'Kia', N'Niro', 2003, 1698, 301, N'front-wheel drive', 1, N'T184BC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (107, N'e4fbc3d5-cd81-4d99-8f5a-b99b368dca16', CAST(N'2018-09-20T00:00:00.000' AS DateTime), CAST(N'2022-12-06T00:00:00.000' AS DateTime), N'B', 9862, 646552, N'1G6DH5E5XC0462438', N'Kia', N'Sportage', 2017, 1705, 302, N'front-wheel drive', 1, N'K185PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (108, N'975ee74a-59b4-4f28-8928-9378b1fe9861', CAST(N'2018-06-21T00:00:00.000' AS DateTime), CAST(N'2023-08-21T00:00:00.000' AS DateTime), N'B', 9252, 511894, N'TRURD38J381614210', N'Kia', N'Sportage', 1993, 1767, 307, N'rear drive', 1, N'E186PK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (109, N'f47f6525-6204-409d-bd0c-1f8f86c0a20c', CAST(N'2019-05-14T00:00:00.000' AS DateTime), CAST(N'2022-07-23T00:00:00.000' AS DateTime), N'B', 6965, 215700, N'4T1BD1FK6FU133645', N'Kia', N'Sportage', 2018, 1668, 310, N'front-wheel drive', 1, N'H187PA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (110, N'ede41cfe-13c0-45f3-a7bd-7dc3e70e6a7c', CAST(N'2019-02-28T00:00:00.000' AS DateTime), CAST(N'2027-04-07T00:00:00.000' AS DateTime), N'B', 5344, 602449, N'2T1BURHE4FC565514', N'Kia', N'Sorento', 2011, 1571, 311, N'front-wheel drive', 1, N'Y188AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (111, N'68cc3704-853b-432d-8021-b1dc1b8d38b9', CAST(N'2018-06-23T00:00:00.000' AS DateTime), CAST(N'2027-11-16T00:00:00.000' AS DateTime), N'B', 5662, 189864, N'5TDBW5G12FS063304', N'Kia', N'Sorento', 2004, 1783, 340, N'front-wheel drive', 1, N'T189BB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (112, N'82c4e0c6-49cf-4fa8-9ae0-d2386f3766ff', CAST(N'2019-02-01T00:00:00.000' AS DateTime), CAST(N'2024-02-11T00:00:00.000' AS DateTime), N'B', 4455, 179449, N'WAULFAFR3DA033269', N'Kia', N'Sorento', 2009, 1659, 345, N'front-wheel drive', 1, N'K190PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (113, N'adfdbf3a-5cf2-4285-b8b0-f27d4189dabf', CAST(N'2019-04-11T00:00:00.000' AS DateTime), CAST(N'2021-08-06T00:00:00.000' AS DateTime), N'B', 1446, 984592, N'1G6DK8ED9B0319764', N'Kia', N'Mohave / Borrego', 1995, 1720, 370, N'front-wheel drive', 1, N'A191PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (114, N'e174d8f1-343c-49f2-b47f-a724ddd1d585', CAST(N'2018-10-20T00:00:00.000' AS DateTime), CAST(N'2023-04-03T00:00:00.000' AS DateTime), N'B', 3875, 480183, N'3VW4A7AT6DM813925', N'Kia', N'Bongo', 2017, 1744, 371, N'full drive', 1, N'C192CC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (115, N'6da24dfe-b526-423f-9c43-1cade318ce23', CAST(N'2018-11-04T00:00:00.000' AS DateTime), CAST(N'2028-01-13T00:00:00.000' AS DateTime), N'B', 4548, 143560, N'WVWAB7AJ0CW557264', N'Kia', N'Bongo Frontier', 2017, 1667, 373, N'front-wheel drive', 1, N'H193CP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (116, N'8f2ce420-b0b0-4900-9dc9-7979d1d89a90', CAST(N'2018-08-23T00:00:00.000' AS DateTime), CAST(N'2025-03-08T00:00:00.000' AS DateTime), N'B', 8775, 143198, N'4A31K2DF7BE138498', N'Kia', N'Bongo', 2016, 1745, 110, N'front-wheel drive', 1, N'T194PC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (117, N'9484b47e-4db9-43c0-9736-169ac6029da4', CAST(N'2019-02-08T00:00:00.000' AS DateTime), CAST(N'2021-07-10T00:00:00.000' AS DateTime), N'B', 4456, 698959, N'JN1AZ4EH7AM509399', N'Volkswagen', N'Fusca', 2008, 1775, 116, N'front-wheel drive', 1, N'K195AP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (118, N'76caf041-1cc9-498b-939b-44803c8df981', CAST(N'2018-12-31T00:00:00.000' AS DateTime), CAST(N'2021-06-23T00:00:00.000' AS DateTime), N'B', 5774, 218810, N'2T3BFREV2EW071669', N'Volkswagen', N'Gol', 1992, 1779, 118, N'front-wheel drive', 1, N'E196PA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (119, N'3f49208c-a37f-4480-933c-77ec1cdbcd82', CAST(N'2018-08-05T00:00:00.000' AS DateTime), CAST(N'2026-07-05T00:00:00.000' AS DateTime), N'B', 7372, 870584, N'YV1612FH2D1519917', N'Volkswagen', N'Gol', 2008, 1769, 120, N'front-wheel drive', 1, N'H197CP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (120, N'ce4472d1-b582-4c09-a444-11aa5af16e8f', CAST(N'2018-12-09T00:00:00.000' AS DateTime), CAST(N'2023-05-20T00:00:00.000' AS DateTime), N'B', 2462, 735138, N'JH4KA96631C195497', N'Volkswagen', N'Gol', 1990, 1528, 127, N'full drive', 1, N'Y198PC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (121, N'f5551d02-3144-4597-8fca-88df86afb0e6', CAST(N'2018-11-22T00:00:00.000' AS DateTime), CAST(N'2022-03-05T00:00:00.000' AS DateTime), N'B', 6070, 112930, N'WBAEK13597C722490', N'Volkswagen', N'Voyage / Fox', 1991, 1496, 128, N'front-wheel drive', 1, N'T199CA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (122, N'7111828c-31ad-4fd6-a960-e02c5ae7e395', CAST(N'2018-12-11T00:00:00.000' AS DateTime), CAST(N'2022-01-13T00:00:00.000' AS DateTime), N'B', 4576, 922777, N'1GYS3HKJ9FR278172', N'Volkswagen', N'Voyage', 2011, 1420, 129, N'front-wheel drive', 1, N'K200AB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (123, N'62cfb3af-07d1-4b32-86e5-c5c724acbbfb', CAST(N'2019-02-11T00:00:00.000' AS DateTime), CAST(N'2025-09-03T00:00:00.000' AS DateTime), N'B', 4562, 434160, N'WAUD2AFD1EN207208', N'Volkswagen', N'Parati', 2013, 1763, 133, N'rear drive', 1, N'A201BA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (124, N'cf4946bb-2147-48bb-b56f-fad73dfac9ea', CAST(N'2019-02-12T00:00:00.000' AS DateTime), CAST(N'2021-08-12T00:00:00.000' AS DateTime), N'B', 8067, 198658, N'WAULL44E35N431957', N'Volkswagen', N'Parati', 1992, 1460, 145, N'front-wheel drive', 1, N'C202BY', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (125, N'a2475fd4-89de-4c9f-a53e-c03444a6136d', CAST(N'2018-06-28T00:00:00.000' AS DateTime), CAST(N'2026-11-07T00:00:00.000' AS DateTime), N'B', 3651, 955678, N'KNAFU6A20B5806571', N'Volkswagen', N'Fox', 2007, 1526, 170, N'front-wheel drive', 1, N'H203AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (126, N'e6df62de-807f-4475-abf9-1a278e9520a7', CAST(N'2018-05-23T00:00:00.000' AS DateTime), CAST(N'2019-01-26T00:00:00.000' AS DateTime), N'B', 5673, 570962, N'SAJWA2GTXEM305896', N'Volkswagen', N'Brasilia', 1995, 1771, 180, N'front-wheel drive', 1, N'T204BB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (127, N'1b85c947-2651-459b-871a-00ec57aca60b', CAST(N'2018-10-09T00:00:00.000' AS DateTime), CAST(N'2025-08-08T00:00:00.000' AS DateTime), N'B', 8043, 244787, N'WAULL44E95N690503', N'Volkswagen', N'Apollo', 2017, 1601, 201, N'front-wheel drive', 1, N'K205BA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (128, N'32bdc237-4154-4da5-9b01-d989f8cab66e', CAST(N'2018-06-06T00:00:00.000' AS DateTime), CAST(N'2028-02-08T00:00:00.000' AS DateTime), N'B', 6143, 360486, N'WAUGFAFC5DN926548', N'Volkswagen', N'Logus', 1992, 1663, 202, N'front-wheel drive', 1, N'E206BK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (129, N'e20018b1-3496-4417-b190-6d6b8b99d7c4', CAST(N'2019-02-13T00:00:00.000' AS DateTime), CAST(N'2028-05-11T00:00:00.000' AS DateTime), N'B', 7764, 593417, N'5TDBM5G19BS020076', N'Volkswagen', N'Pointer', 2009, 1594, 203, N'front-wheel drive', 1, N'H207BC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (130, N'126debec-367e-477f-9748-6598556275a5', CAST(N'2018-06-25T00:00:00.000' AS DateTime), CAST(N'2020-11-10T00:00:00.000' AS DateTime), N'B', 7869, 300408, N'3N1AB6AP7BL573385', N'Volkswagen', N'Santana', 1998, 1515, 204, N'front-wheel drive', 1, N'Y208PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (131, N'52f52f82-341f-47bd-a791-0d3880d1dc4d', CAST(N'2019-02-15T00:00:00.000' AS DateTime), CAST(N'2027-07-14T00:00:00.000' AS DateTime), N'B', 9261, 564412, N'5XYZT3LB7FG893235', N'Volkswagen', N'Quantum', 2013, 1662, 210, N'front-wheel drive', 1, N'T209PK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (132, N'dd73fb64-d22e-4028-a093-6da7bb7de0fc', CAST(N'2018-08-15T00:00:00.000' AS DateTime), CAST(N'2019-04-06T00:00:00.000' AS DateTime), N'B', 8650, 649001, N'JH4KC1F78EC530392', N'Volkswagen', N'SpaceFox / Suran / SportVan / Fox Plus', 2004, 1718, 215, N'front-wheel drive', 1, N'K210PA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (133, N'b73a368f-4a13-4cb6-8867-f7150322e2c4', CAST(N'2019-01-05T00:00:00.000' AS DateTime), CAST(N'2021-10-31T00:00:00.000' AS DateTime), N'B', 8051, 417594, N'2G4WE587581834383', N'Volkswagen', N'SP2', 2004, 1577, 217, N'front-wheel drive', 1, N'A211AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (134, N'938ef42c-1928-4d54-b016-8ec60f5eddd8', CAST(N'2018-09-25T00:00:00.000' AS DateTime), CAST(N'2023-08-09T00:00:00.000' AS DateTime), N'B', 8165, 173583, N'WAUDF48H98K345526', N'Volkswagen', N'Saveiro', 2008, 1469, 223, N'front-wheel drive', 1, N'C212BB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (135, N'be931bdd-6724-4789-a346-613cc28d43b5', CAST(N'2018-09-19T00:00:00.000' AS DateTime), CAST(N'2027-05-20T00:00:00.000' AS DateTime), N'B', 6163, 107404, N'WBA3G7C54EF309612', N'Volkswagen', N'Saveiro', 2008, 1453, 228, N'front-wheel drive', 1, N'H213PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (136, N'30ac3682-cdcf-42c9-905c-a9c612c574f3', CAST(N'2018-11-14T00:00:00.000' AS DateTime), CAST(N'2026-02-12T00:00:00.000' AS DateTime), N'B', 6455, 604567, N'1G6DD8E31E0169171', N'BMW', N'New Class 1602, 1802, 2002', 2016, 1633, 233, N'rear drive', 1, N'T214PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (137, N'cb03ffbd-4c16-4af2-8cec-eb6c8aba0677', CAST(N'2018-12-16T00:00:00.000' AS DateTime), CAST(N'2026-12-19T00:00:00.000' AS DateTime), N'B', 4177, 152038, N'YV1902FH3D1001332', N'BMW', N'3-Series', 2019, 1797, 235, N'front-wheel drive', 1, N'K215CC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (138, N'396d6d2f-d817-4c43-8961-3d58ffc4f790', CAST(N'2018-08-30T00:00:00.000' AS DateTime), CAST(N'2023-12-18T00:00:00.000' AS DateTime), N'B', 4775, 631972, N'3N1CN7AP5FL866147', N'BMW', N'3-Series, M3', 2006, 1706, 236, N'front-wheel drive', 1, N'E216CP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (139, N'1f34b609-4f15-4b61-8e14-6a35b38d2d4c', CAST(N'2018-06-24T00:00:00.000' AS DateTime), CAST(N'2019-03-28T00:00:00.000' AS DateTime), N'B', 5856, 389246, N'YV4902NC8F1531985', N'BMW', N'3-Series, M3', 2014, 1685, 245, N'front-wheel drive', 1, N'H217PC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (140, N'89a1242c-c582-4797-820c-570a5ec3961e', CAST(N'2019-02-17T00:00:00.000' AS DateTime), CAST(N'2023-06-24T00:00:00.000' AS DateTime), N'B', 5665, 672465, N'KL4CJFSB9FB654370', N'BMW', N'3-Series, M3', 1993, 1664, 276, N'front-wheel drive', 1, N'Y218AP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (141, N'a2a6b45e-c883-4bd9-b5f0-555d4b1cb7e6', CAST(N'2018-09-01T00:00:00.000' AS DateTime), CAST(N'2019-06-02T00:00:00.000' AS DateTime), N'B', 1352, 375141, N'JN1BV7APXFM374795', N'BMW', N'3-Series, M3', 1994, 1756, 277, N'front-wheel drive', 1, N'T219PA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (142, N'e8c4fe99-a4e4-417f-ad97-4022fb093050', CAST(N'2018-10-13T00:00:00.000' AS DateTime), CAST(N'2023-09-02T00:00:00.000' AS DateTime), N'B', 9580, 672343, N'WAUAFAFH7EN465064', N'BMW', N'3-Series, M3', 2000, 1534, 280, N'front-wheel drive', 1, N'K220CP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (143, N'54ac4083-4033-4fb0-84ba-e91f58d21a11', CAST(N'2018-10-25T00:00:00.000' AS DateTime), CAST(N'2028-04-14T00:00:00.000' AS DateTime), N'B', 9460, 114388, N'WAUVC68E33A401568', N'BMW', N'4-Series, M4', 2006, 1716, 286, N'front-wheel drive', 1, N'A221PC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (144, N'57c5fa77-18fb-4eb1-928e-caaa2a9a90e3', CAST(N'2018-09-24T00:00:00.000' AS DateTime), CAST(N'2022-06-26T00:00:00.000' AS DateTime), N'B', 7946, 834138, N'KMHTC6AD4EU662541', N'BMW', N'3-Series, M3', 2000, 1610, 295, N'front-wheel drive', 1, N'C222CA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (145, N'05253225-bddd-4c33-b1cc-9eaad6accdd4', CAST(N'2018-10-07T00:00:00.000' AS DateTime), CAST(N'2023-03-25T00:00:00.000' AS DateTime), N'B', 4160, 943122, N'5UXFG43539L241999', N'BMW', N'4-Series, M4', 2012, 1597, 301, N'front-wheel drive', 1, N'H223AB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (146, N'daa5867d-af0e-4603-9186-6dbf60cc1180', CAST(N'2019-01-30T00:00:00.000' AS DateTime), CAST(N'2024-12-12T00:00:00.000' AS DateTime), N'B', 9358, 978442, N'1GYS3FEJ8CR664092', N'BMW', N'3-Series GT', 1996, 1701, 302, N'front-wheel drive', 1, N'T224BA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (147, N'a9b89e97-2f7c-4c3b-8263-27cf2749660a', CAST(N'2019-02-11T00:00:00.000' AS DateTime), CAST(N'2028-02-26T00:00:00.000' AS DateTime), N'B', 7577, 669648, N'WBAKN9C51FD688174', N'BMW', N'New Class 1500, 1600, 1800, 2000', 2008, 1691, 307, N'front-wheel drive', 1, N'K225BY', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (148, N'15a2aaff-caec-48bf-8a90-afef67c532c3', CAST(N'2019-01-26T00:00:00.000' AS DateTime), CAST(N'2025-10-29T00:00:00.000' AS DateTime), N'B', 8963, 563046, N'5NMSG3AB7AH234028', N'BMW', N'5-Series', 2007, 1447, 310, N'front-wheel drive', 1, N'E226AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (149, N'76a62d28-6cf4-445d-b2dc-5ce532c3f3af', CAST(N'2018-06-17T00:00:00.000' AS DateTime), CAST(N'2025-12-10T00:00:00.000' AS DateTime), N'B', 8559, 935502, N'SALAB2V67FA465605', N'BMW', N'5-Series, M5', 2008, 1723, 311, N'front-wheel drive', 1, N'H227BB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (150, N'c530577c-1d3b-4b20-b4ff-602dbbd12426', CAST(N'2019-03-21T00:00:00.000' AS DateTime), CAST(N'2020-10-17T00:00:00.000' AS DateTime), N'B', 5647, 618832, N'JN1CY0APXAM160384', N'BMW', N'5-Series, M5', 2007, 1722, 340, N'front-wheel drive', 1, N'Y228BA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (151, N'6bcf6586-fe14-4bb5-86ee-3437c589d56f', CAST(N'2018-11-29T00:00:00.000' AS DateTime), CAST(N'2022-01-20T00:00:00.000' AS DateTime), N'B', 1844, 286148, N'WBAUP7C58DV367411', N'BMW', N'5-Series, M5', 2007, 1622, 345, N'front-wheel drive', 1, N'T229BK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (152, N'7da92742-8a24-4aa0-b9d9-b04959645f27', CAST(N'2019-03-14T00:00:00.000' AS DateTime), CAST(N'2024-06-13T00:00:00.000' AS DateTime), N'B', 1542, 848910, N'WAUAFAFL0FN838290', N'BMW', N'5-Series, M5', 2017, 1725, 370, N'front-wheel drive', 1, N'K230BC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (153, N'15f7a9ad-6441-4e0d-9910-063219db65f3', CAST(N'2018-09-26T00:00:00.000' AS DateTime), CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'B', 8648, 153332, N'1LNHL9EK9FG365197', N'BMW', N'5-Series, M5', 2015, 1456, 371, N'front-wheel drive', 1, N'A231PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (154, N'1afdee70-3e17-423d-bd08-e681a2aaa047', CAST(N'2019-02-25T00:00:00.000' AS DateTime), CAST(N'2027-12-23T00:00:00.000' AS DateTime), N'B', 2164, 281543, N'YV1672MK0D2114467', N'BMW', N'5-Series, M5', 2004, 1480, 373, N'front-wheel drive', 1, N'C232PK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (155, N'f14bad3c-3da4-430d-8254-7e3a417ab094', CAST(N'2018-10-17T00:00:00.000' AS DateTime), CAST(N'2019-06-24T00:00:00.000' AS DateTime), N'B', 4465, 689019, N'WAUKG98E56A006286', N'BMW', N'5-Series GT', 2009, 1481, 377, N'front-wheel drive', 1, N'H233PA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (156, N'c538ebfc-de32-45cc-b929-47e90070393b', CAST(N'2018-10-13T00:00:00.000' AS DateTime), CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'B', 6373, 339944, N'SAJWA4EB7EL432469', N'BMW', N'6-Series GT', 2004, 1438, 383, N'front-wheel drive', 1, N'T234AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (157, N'386f9359-69d8-474d-b6d6-b5dc49a45ef6', CAST(N'2019-01-04T00:00:00.000' AS DateTime), CAST(N'2020-10-22T00:00:00.000' AS DateTime), N'B', 8043, 838745, N'3LNHL2GC0AR226381', N'BMW', N'New Six CS', 1992, 1611, 385, N'front-wheel drive', 1, N'K235BB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (158, N'5c5749db-f6ee-41d8-b7c8-7f379c9f0d78', CAST(N'2018-12-31T00:00:00.000' AS DateTime), CAST(N'2026-08-09T00:00:00.000' AS DateTime), N'B', 4174, 833772, N'WAUVFAFH7BN873285', N'BMW', N'X4', 2006, 1581, 387, N'front-wheel drive', 1, N'E236PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (159, N'95939d3f-2c4f-4b87-b3b6-0ee66f6be9b3', CAST(N'2019-03-16T00:00:00.000' AS DateTime), CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Tb', 7053, 197719, N'SALAG2D47AA801263', N'BMW', N'X5', 1993, 1527, 399, N'front-wheel drive', 1, N'H237PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (160, N'3a97cf39-b84b-4837-8694-0a0b084095a9', CAST(N'2018-12-24T00:00:00.000' AS DateTime), CAST(N'2025-01-15T00:00:00.000' AS DateTime), N'B', 5347, 642355, N'WBSWD9C57AP228332', N'BMW', N'X5', 2007, 1426, 403, N'front-wheel drive', 1, N'Y238CC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (161, N'4efbe24d-fc69-481d-ac28-62a5619dc79a', CAST(N'2018-08-12T00:00:00.000' AS DateTime), CAST(N'2022-02-10T00:00:00.000' AS DateTime), N'B', 3945, 599900, N'1FTWW3B53AE587413', N'BMW', N'X5', 2007, 1674, 406, N'rear drive', 1, N'T239CP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (162, N'60a830bf-d135-46b4-aac5-0f29b68abf8f', CAST(N'2019-01-07T00:00:00.000' AS DateTime), CAST(N'2023-09-12T00:00:00.000' AS DateTime), N'B', 9970, 313651, N'4USBU53567L936239', N'BMW', N'X6', 1991, 1596, 408, N'front-wheel drive', 1, N'K240PC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (163, N'09a872f3-2758-42de-88f6-8dc5fbc8864e', CAST(N'2019-01-06T00:00:00.000' AS DateTime), CAST(N'2026-01-09T00:00:00.000' AS DateTime), N'B', 5378, 482016, N'1FTWF3D57AE486873', N'BMW', N'X6', 2014, 1656, 415, N'front-wheel drive', 1, N'A241AP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (164, N'2f2bec30-2a61-44c5-aea5-b0de1a07600c', CAST(N'2019-05-18T00:00:00.000' AS DateTime), CAST(N'2025-05-30T00:00:00.000' AS DateTime), N'B', 8247, 608653, N'2G4WD582261511218', N'BMW', N'X7', 1994, 1731, 416, N'front-wheel drive', 1, N'C242PA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (165, N'f2dccf6d-cce5-470e-b29e-592bdc551948', CAST(N'2019-03-01T00:00:00.000' AS DateTime), CAST(N'2019-08-09T00:00:00.000' AS DateTime), N'B', 3276, 726052, N'WBAGN83515D855874', N'Cadillac', N'Cimarron', 2005, 1763, 417, N'front-wheel drive', 1, N'H243CP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (166, N'4ac50169-9d58-4158-a63d-542c9986e3cc', CAST(N'2018-10-29T00:00:00.000' AS DateTime), CAST(N'2026-04-18T00:00:00.000' AS DateTime), N'B', 1056, 710506, N'2C3CDXL97FH493561', N'Cadillac', N'BLS', 2000, 1454, 215, N'rear drive', 1, N'T244PC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (167, N'5276c7e7-c6ab-4103-8fac-d126cab643e2', CAST(N'2019-04-22T00:00:00.000' AS DateTime), CAST(N'2027-05-07T00:00:00.000' AS DateTime), N'B', 4447, 857224, N'WAUKD78P89A662503', N'Cadillac', N'ATS', 1994, 1450, 217, N'front-wheel drive', 1, N'K245CA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (168, N'52a9c95a-c6c5-48c8-aad6-8123f648c385', CAST(N'2018-06-02T00:00:00.000' AS DateTime), CAST(N'2022-01-03T00:00:00.000' AS DateTime), N'B', 1544, 216181, N'JM3TB2MA6A0887683', N'Cadillac', N'ELR', 2014, 1675, 223, N'front-wheel drive', 1, N'E246AB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (169, N'4f20d730-dc4c-4bc7-8b91-e4700fd555cb', CAST(N'2019-01-31T00:00:00.000' AS DateTime), CAST(N'2028-01-25T00:00:00.000' AS DateTime), N'B', 9060, 267003, N'5TDBK3EH2BS734111', N'Cadillac', N'Catera', 2019, 1567, 228, N'front-wheel drive', 1, N'H247BA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (170, N'eae65a34-d7cf-4963-aa44-4d0a4b04b5aa', CAST(N'2019-03-26T00:00:00.000' AS DateTime), CAST(N'2026-03-24T00:00:00.000' AS DateTime), N'B', 2557, 211673, N'WBABV13466J082217', N'Cadillac', N'CTS', 1993, 1499, 233, N'front-wheel drive', 1, N'Y248BY', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (171, N'af0113cb-1934-4ce7-8095-bc74a1e0efda', CAST(N'2018-10-01T00:00:00.000' AS DateTime), CAST(N'2027-06-21T00:00:00.000' AS DateTime), N'B', 7263, 140335, N'WBAPM7C57AE459062', N'Cadillac', N'CTS', 2007, 1696, 235, N'front-wheel drive', 1, N'T249AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (172, N'07caad4e-bfd5-4ce4-8b83-00005c0c7420', CAST(N'2018-07-14T00:00:00.000' AS DateTime), CAST(N'2025-12-25T00:00:00.000' AS DateTime), N'B', 8146, 112671, N'2FMPK3K98FB482688', N'Cadillac', N'CTS', 2007, 1678, 236, N'front-wheel drive', 1, N'K250BB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (173, N'1445fa82-f7d8-406f-8acb-0615fea80f13', CAST(N'2018-11-03T00:00:00.000' AS DateTime), CAST(N'2025-01-09T00:00:00.000' AS DateTime), N'B', 5372, 121874, N'WAUKFAFL5EA281418', N'Cadillac', N'Series 60', 2005, 1442, 245, N'front-wheel drive', 1, N'A251BA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (174, N'fd40a935-2692-4e0e-b4df-d1482f6cdafc', CAST(N'2018-08-20T00:00:00.000' AS DateTime), CAST(N'2023-04-03T00:00:00.000' AS DateTime), N'B', 3855, 988267, N'WAUVT68E94A410180', N'Cadillac', N'Series 61', 2009, 1663, 276, N'front-wheel drive', 1, N'C252BK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (175, N'4c2dbe27-1459-4646-b856-46bfa502b52c', CAST(N'2019-01-30T00:00:00.000' AS DateTime), CAST(N'2027-05-27T00:00:00.000' AS DateTime), N'B', 9366, 407687, N'2B3CK2CV1AH775495', N'Cadillac', N'Series 61', 2002, 1526, 277, N'front-wheel drive', 1, N'H253BC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (176, N'32137ee1-46ec-4288-8074-b7acdfc32b19', CAST(N'2018-10-13T00:00:00.000' AS DateTime), CAST(N'2026-07-07T00:00:00.000' AS DateTime), N'B', 7150, 321250, N'1HGCR2E55EA286661', N'Cadillac', N'Series 61', 1992, 1523, 280, N'front-wheel drive', 1, N'T254PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (177, N'df8da09d-77fb-43a3-84fb-74958afa7f6f', CAST(N'2019-02-11T00:00:00.000' AS DateTime), CAST(N'2020-09-03T00:00:00.000' AS DateTime), N'B', 5548, 283081, N'JH4CU2F68BC631071', N'Cadillac', N'Series 61', 1994, 1770, 286, N'front-wheel drive', 1, N'K255PK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (178, N'64b05453-be65-4f03-8ca4-c7071d9bc9bf', CAST(N'2018-08-14T00:00:00.000' AS DateTime), CAST(N'2020-12-15T00:00:00.000' AS DateTime), N'B', 1841, 954617, N'2HNYB1H68DH924015', N'Cadillac', N'Series 65', 1992, 1773, 295, N'front-wheel drive', 1, N'E256PA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (179, N'5c318755-4f49-47d1-9179-2c1a0d503514', CAST(N'2018-07-10T00:00:00.000' AS DateTime), CAST(N'2021-05-04T00:00:00.000' AS DateTime), N'B', 7260, 808111, N'1FTEW1E86AF818093', N'Cadillac', N'Series 62', 1995, 1437, 301, N'front-wheel drive', 1, N'H257AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (180, N'ce2d8b0d-7212-4aea-913f-78023090ed35', CAST(N'2018-10-17T00:00:00.000' AS DateTime), CAST(N'2021-01-08T00:00:00.000' AS DateTime), N'B', 8853, 584291, N'3C6TD4HTXCG839880', N'Cadillac', N'Series 62', 2017, 1488, 302, N'front-wheel drive', 1, N'Y258BB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (181, N'5def0390-e7a1-4652-942b-53c78736b2eb', CAST(N'2018-10-31T00:00:00.000' AS DateTime), CAST(N'2026-09-02T00:00:00.000' AS DateTime), N'B', 5142, 920836, N'WVGAV7AX3BW390470', N'Cadillac', N'Series 62', 2011, 1493, 307, N'front-wheel drive', 1, N'T259PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (182, N'a3b918eb-e50b-4f26-8f8d-978e8fb67efe', CAST(N'2019-05-07T00:00:00.000' AS DateTime), CAST(N'2025-10-16T00:00:00.000' AS DateTime), N'B', 5274, 843119, N'WAUUL78E45A200167', N'Cadillac', N'Escalade', 1998, 1532, 310, N'front-wheel drive', 1, N'K260PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (183, N'4c8d80c5-e141-454f-bc4f-00b2e6907be8', CAST(N'2019-02-28T00:00:00.000' AS DateTime), CAST(N'2027-10-12T00:00:00.000' AS DateTime), N'B', 8769, 608724, N'JTMHY7AJ9B4091499', N'Cadillac', N'Allanté', 2012, 1694, 311, N'front-wheel drive', 1, N'A261CC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (184, N'6845ec2b-2046-4cf8-8a02-b98b61f8ae24', CAST(N'2019-01-16T00:00:00.000' AS DateTime), CAST(N'2024-02-23T00:00:00.000' AS DateTime), N'B', 2278, 602987, N'SAJWA0FS8FP468222', N'Cadillac', N'XLR', 2007, 1614, 340, N'front-wheel drive', 1, N'C262CP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (185, N'8989ed49-3ec9-4750-afa5-074f2bea687c', CAST(N'2019-04-05T00:00:00.000' AS DateTime), CAST(N'2019-06-14T00:00:00.000' AS DateTime), N'B', 2960, 390525, N'JM1NC2LF9D0043475', N'Kia', N'Picanto', 1999, 1483, 345, N'front-wheel drive', 1, N'H263PC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (186, N'ae3fc212-e2d9-408e-92e9-a7f7b97c8578', CAST(N'2018-05-31T00:00:00.000' AS DateTime), CAST(N'2025-07-24T00:00:00.000' AS DateTime), N'B', 7956, 112224, N'1GD422CGXEF170253', N'Kia', N'Picanto', 1990, 1579, 370, N'front-wheel drive', 1, N'T264AP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (187, N'54648811-52c8-4aee-96e1-4cf66c27c557', CAST(N'2018-09-18T00:00:00.000' AS DateTime), CAST(N'2020-08-26T00:00:00.000' AS DateTime), N'B', 1156, 742127, N'JN1BV7APXFM590680', N'Kia', N'Picanto', 2003, 1762, 371, N'front-wheel drive', 1, N'K265PA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (188, N'816e1f24-451c-4635-9709-3a2e3fe96e4a', CAST(N'2018-10-31T00:00:00.000' AS DateTime), CAST(N'2021-08-29T00:00:00.000' AS DateTime), N'B', 5242, 884090, N'JHMZF1C46CS958531', N'Kia', N'Pride', 1992, 1572, 373, N'front-wheel drive', 1, N'E266CP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (189, N'e4bbdeb6-0673-4303-a8d1-38d797c61bd1', CAST(N'2018-08-04T00:00:00.000' AS DateTime), CAST(N'2023-08-15T00:00:00.000' AS DateTime), N'B', 8958, 989847, N'WAUGGAFR1DA366441', N'Kia', N'Pride', 2005, 1753, 377, N'front-wheel drive', 1, N'H267PC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (190, N'dc98d84e-4865-4a66-ae91-faa5d44fdf2b', CAST(N'2018-11-07T00:00:00.000' AS DateTime), CAST(N'2022-09-23T00:00:00.000' AS DateTime), N'B', 4046, 106016, N'WA1WMAFE2DD971257', N'Kia', N'Rio', 1999, 1487, 383, N'front-wheel drive', 1, N'Y268CA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (191, N'96735479-61d6-4615-965c-cf7293560d24', CAST(N'2019-04-14T00:00:00.000' AS DateTime), CAST(N'2024-03-06T00:00:00.000' AS DateTime), N'B', 8766, 120201, N'WA1AV94L37D000070', N'Kia', N'Rio', 2016, 1702, 385, N'front-wheel drive', 1, N'T269AB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (192, N'658b9986-84fe-4398-b6dd-e85fb1e1981a', CAST(N'2019-02-23T00:00:00.000' AS DateTime), CAST(N'2021-01-25T00:00:00.000' AS DateTime), N'B', 9065, 677102, N'WVWAA7AJ5CW398762', N'Kia', N'Rio', 2014, 1587, 301, N'front-wheel drive', 1, N'K270BA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (193, N'209d8566-16e1-4d56-92b0-22370719c5c4', CAST(N'2019-02-06T00:00:00.000' AS DateTime), CAST(N'2019-05-26T00:00:00.000' AS DateTime), N'B', 7072, 962735, N'1G6AP5SX1E0768734', N'Kia', N'Rio', 2001, 1713, 302, N'front-wheel drive', 1, N'A271BY', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (194, N'f0d0f6c2-7c9b-4de7-82c1-77f22a26530a', CAST(N'2018-05-27T00:00:00.000' AS DateTime), CAST(N'2025-06-03T00:00:00.000' AS DateTime), N'B', 8580, 622744, N'WBAWV13557P451979', N'Kia', N'Soul', 1993, 1560, 307, N'front-wheel drive', 1, N'C272AA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (195, N'c10b5584-97b0-4560-b8f7-2a181768a5d3', CAST(N'2018-08-05T00:00:00.000' AS DateTime), CAST(N'2020-04-10T00:00:00.000' AS DateTime), N'B', 8246, 115947, N'1G6DA1E30E0416888', N'Kia', N'Soul', 2010, 1506, 310, N'front-wheel drive', 1, N'H273BB', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (196, N'0d4a8ef7-1556-4c0c-993b-4bc663a55b49', CAST(N'2018-11-06T00:00:00.000' AS DateTime), CAST(N'2021-12-10T00:00:00.000' AS DateTime), N'B', 1974, 705660, N'SALFR2BG8FH292196', N'Kia', N'Avella', 2017, 1769, 311, N'front-wheel drive', 1, N'T274BA', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (197, N'9a210cce-290d-44c9-9c2d-dd44db3d7bd2', CAST(N'2019-02-06T00:00:00.000' AS DateTime), CAST(N'2026-12-26T00:00:00.000' AS DateTime), N'B', 3946, 518387, N'TRUDD38J481844056', N'Kia', N'Cee''d', 2015, 1567, 340, N'front-wheel drive', 1, N'K275BK', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (198, N'effadfe4-0bb4-43a2-b38e-2a658de47f96', CAST(N'2019-01-21T00:00:00.000' AS DateTime), CAST(N'2022-12-18T00:00:00.000' AS DateTime), N'B', 6360, 909624, N'WDDHH8HB5BA767975', N'Kia', N'Cee''d', 1997, 1788, 345, N'front-wheel drive', 1, N'E276BC', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (199, N'4ea38941-f54c-4ff7-a210-5895d5b3788c', CAST(N'2018-08-17T00:00:00.000' AS DateTime), CAST(N'2028-01-28T00:00:00.000' AS DateTime), N'B', 3365, 198629, N'WA1CV74LX9D994734', N'Kia', N'Cee''d', 2019, 1784, 370, N'front-wheel drive', 1, N'H277PP', NULL)
GO
INSERT [dbo].[Licences] ([Id], [IdGuidDriver], [LicenceDate], [ExpireDate], [Categories], [LicenceSeries], [LicenceNumber], [VIN], [Manufacturer], [Model], [Year], [Weight], [Color], [TypeOfDrive], [IdStatus], [CarNumber], [IdRegion]) VALUES (200, N'47c5209e-da57-4a76-bf02-3d7185aefaa3', CAST(N'2019-02-15T00:00:00.000' AS DateTime), CAST(N'2025-09-02T00:00:00.000' AS DateTime), N'B', 7568, 533909, N'1FTSX2A58AE041570', N'Kia', N'Sephia', 1996, 1651, 371, N'front-wheel drive', 1, N'Y278PK', NULL)
GO
INSERT [dbo].[LicenceStatus] ([Id], [Name]) VALUES (1, N'Активен')
GO
INSERT [dbo].[LicenceStatus] ([Id], [Name]) VALUES (2, N'Приостановлен')
GO
INSERT [dbo].[LicenceStatus] ([Id], [Name]) VALUES (3, N'Утратил силу')
GO
INSERT [dbo].[LicenceStatus] ([Id], [Name]) VALUES (4, N'Изъят')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (1, N'Republic of Adygea', N'Республика Адыгея', N'1', 79, N'RU-AD')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (2, N'Republic of Bashkortostan', N'Республика Башкортостан', N'02, 102', 80, N'RU-BA')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (3, N'The Republic of Buryatia', N'Республика Бурятия', N'3', 81, N'RU-BU')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (4, N'Altai Republic', N'Республика Алтай', N'4', 84, N'RU-AL')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (5, N'The Republic of Dagestan', N'Республика Дагестан', N'5', 82, N'RU-DA')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (6, N'The Republic of Ingushetia', N'Республика Ингушетия', N'6', 26, N'RU-IN')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (7, N'Kabardino-Balkaria Republic', N'Кабардино-Балкарская республика', N'7', 83, N'RU-KB')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (8, N'Republic of Kalmykia', N'Республика Калмыкия', N'8', 85, N'RU-KL')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (9, N'Karachay-Cherkess Republic', N'Карачаево-Черкесская республика', N'9', 91, N'RU-KC')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (10, N'Republic of Karelia', N'Республика Карелия', N'10', 86, N'RU-KR')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (11, N'Komi Republic', N'Республика Коми', N'11, 111', 87, N'RU-KO')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (12, N'Mari El Republic', N'Республика Марий Эл', N'12', 88, N'RU-ME')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (13, N'The Republic of Mordovia', N'Республика Мордовия', N'13, 113', 89, N'RU-MO')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (14, N'The Republic of Sakha (Yakutia)', N'Республика Саха (Якутия)', N'14', 98, N'RU-SA')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (15, N'Republic of North Ossetia - Alania', N'Республика Северная Осетия — Алания', N'15', 90, N'RU-SE')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (16, N'Republic of Tatarstan', N'Республика Татарстан', N'16, 116', 92, N'RU-TA')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (17, N'Tyva Republic', N'Республика Тыва', N'17', 93, N'RU-TY')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (18, N'Udmurtia', N'Удмуртская республика', N'18', 94, N'RU-UD')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (19, N'The Republic of Khakassia', N'Республика Хакасия', N'19', 95, N'RU-KK')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (20, N'Chechen Republic', N'Чеченская республика', N'95', 96, N'RU-CE')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (21, N'Chuvash Republic', N'Чувашская республика', N'21, 121', 97, N'RU-CU')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (22, N'Altai region', N'Алтайский край', N'22', 1, N'RU-ALT')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (23, N'Krasnodar region', N'Краснодарский край', N'23, 93, 123', 3, N'RU-KDA')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (24, N'Krasnoyarsk region', N'Красноярский край', N'24, 124, 84, 88', 4, N'RU-KYA')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (25, N'Primorsky Krai', N'Приморский край', N'25, 125', 5, N'RU-PRI')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (26, N'Stavropol region', N'Ставропольский край', N'26, 126', 7, N'RU-STA')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (27, N'Khabarovsk region', N'Хабаровский край', N'27', 8, N'RU-KHA')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (28, N'Amur region', N'Амурская область', N'28', 10, N'RU-AMU')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (29, N'Arkhangelsk region', N'Архангельская область', N'29', 11, N'RU-ARK')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (30, N'Astrakhan region', N'Астраханская область', N'30', 12, N'RU-AST')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (31, N'Belgorod region', N'Белгородская область', N'31', 14, N'RU-BEL')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (32, N'Bryansk region', N'Брянская область', N'32', 15, N'RU-BRY')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (33, N'Vladimir region', N'Владимирская область', N'33', 17, N'RU-VLA')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (34, N'Volgograd region', N'Волгоградская область', N'34, 134', 18, N'RU-VGG')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (35, N'Vologodskaya Oblast', N'Вологодская область', N'35', 19, N'RU-VLG')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (36, N'Voronezh region', N'Воронежская область', N'36, 136', 20, N'RU-VOR')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (37, N'Ivanovo region', N'Ивановская область', N'37', 24, N'RU-IVA')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (38, N'Irkutsk region', N'Иркутская область', N'38, 138, 85', 25, N'RU-IRK')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (39, N'Kaliningrad region', N'Калининградская область', N'39, 91', 27, N'RU-KGD')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (40, N'Kaluga region', N'Калужская область', N'40', 29, N'RU-KLU')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (41, N'Kamchatka Krai', N'Камчатский край', N'41', 30, N'RU-KAM')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (42, N'Kemerovo region', N'Кемеровская область', N'42, 142', 32, N'RU-KEM')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (43, N'Kirov region', N'Кировская область', N'43', 33, N'RU-KIR')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (44, N'Kostroma region', N'Костромская область', N'44', 34, N'RU-KOS')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (45, N'Kurgan region', N'Курганская область', N'45', 37, N'RU-KGN')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (46, N'Kursk region', N'Курская область', N'46', 38, N'RU-KRS')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (47, N'Leningrad region', N'Ленинградская область', N'47', 41, N'RU-LEN')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (48, N'Lipetsk region', N'Липецкая область', N'48', 42, N'RU-LIP')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (49, N'Magadan Region', N'Магаданская область', N'49', 44, N'RU-MAG')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (50, N'Moscow region', N'Московская область', N'50, 90, 150, 190, 750', 46, N'RU-MOS')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (51, N'Murmansk region', N'Мурманская область', N'51', 47, N'RU-MUR')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (52, N'Nizhny Novgorod Region', N'Нижегородская область', N'52, 152', 22, N'RU-NIZ')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (53, N'Novgorod region', N'Новгородская область', N'53', 49, N'RU-NGR')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (54, N'Novosibirsk region', N'Новосибирская область', N'54, 154', 50, N'RU-NVS')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (55, N'Omsk region', N'Омская область', N'55', 52, N'RU-OMS')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (56, N'Orenburg region', N'Оренбургская область', N'56', 53, N'RU-ORE')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (57, N'Oryol Region', N'Орловская область', N'57', 54, N'RU-ORL')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (58, N'Penza region', N'Пензенская область', N'58', 56, N'RU-PNZ')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (59, N'Perm region', N'Пермский край', N'59, 81, 159', 57, N'RU-PER')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (60, N'Pskov region', N'Псковская область', N'60', 58, N'RU-PSK')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (61, N'Rostov region', N'Ростовская область', N'61, 161', 60, N'RU-ROS')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (62, N'Ryazan Oblast', N'Рязанская область', N'62', 61, N'RU-RYA')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (63, N'Samara Region', N'Самарская область', N'63, 163', 36, N'RU-SAM')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (64, N'Saratov region', N'Саратовская область', N'64, 164', 63, N'RU-SAR')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (65, N'Sakhalin region', N'Сахалинская область', N'65', 64, N'RU-SAK')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (66, N'Sverdlovsk region', N'Свердловская область', N'66, 96, 196', 65, N'RU-SVE')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (67, N'Smolensk region', N'Смоленская область', N'67', 66, N'RU-SMO')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (68, N'Tambov Region', N'Тамбовская область', N'68', 68, N'RU-TAM')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (69, N'Tver region', N'Тверская область', N'69', 28, N'RU-TVE')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (70, N'Tomsk region', N'Томская область', N'70', 69, N'RU-TOM')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (71, N'Tula region', N'Тульская область', N'71', 70, N'RU-TUL')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (72, N'Tyumen region', N'Тюменская область', N'72', 71, N'RU-TYU')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (73, N'Ulyanovsk region', N'Ульяновская область', N'73, 173', 73, N'RU-ULY')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (74, N'Chelyabinsk region', N'Челябинская область', N'74, 174', 75, N'RU-CHE')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (75, N'Transbaikal region', N'Забайкальский край', N'75, 80', 76, N'RU-ZAB')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (76, N'Yaroslavskaya oblast', N'Ярославская область', N'76', 78, N'RU-YAR')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (77, N'Moscow', N'Москва', N'77, 97, 99, 177, 197, 199, 777', 45, N'RU-MOW')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (78, N'St. Petersburg', N'Санкт-Петербург', N'78, 98, 178', 40, N'RU-SPE')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (79, N'Jewish Autonomous Region', N'Еврейская автономная область', N'79', 99, N'RU-YEV')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (87, N'Chukotka Autonomous Region', N'Чукотский автономный округ', N'87', 77, N'RU-CHU')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (91, N'Republic of Crimea', N'Республика Крым', N'82 ', 35, N'RU-CR')
GO
INSERT [dbo].[Regions] ([Id], [RegionNameEN], [RegionNameRU], [Code], [OKATOcode], [ISO3166_2]) VALUES (92, N'Sevastopol', N'Севастополь', N'92', 67, N'RU-SEV')
GO
INSERT [dbo].[Users] ([Id], [Login], [Password], [Name]) VALUES (1, N'inspector', N'inspector', N'inspector')
GO
ALTER TABLE [dbo].[DTP_Driver]  WITH CHECK ADD FOREIGN KEY([IdDriver])
REFERENCES [dbo].[Drivers] ([IdGuid])
GO
ALTER TABLE [dbo].[DTP_Driver]  WITH CHECK ADD FOREIGN KEY([IdDtp])
REFERENCES [dbo].[DTP] ([Id])
GO
ALTER TABLE [dbo].[Fine]  WITH CHECK ADD FOREIGN KEY([IdStatus])
REFERENCES [dbo].[FineStatuses] ([Id])
GO
ALTER TABLE [dbo].[Fine]  WITH CHECK ADD  CONSTRAINT [FK_Fine_Drivers] FOREIGN KEY([IdDriver])
REFERENCES [dbo].[Drivers] ([IdGuid])
GO
ALTER TABLE [dbo].[Fine] CHECK CONSTRAINT [FK_Fine_Drivers]
GO
ALTER TABLE [dbo].[Licences]  WITH CHECK ADD FOREIGN KEY([IdGuidDriver])
REFERENCES [dbo].[Drivers] ([IdGuid])
GO
ALTER TABLE [dbo].[Licences]  WITH CHECK ADD FOREIGN KEY([IdStatus])
REFERENCES [dbo].[LicenceStatus] ([Id])
GO
ALTER TABLE [dbo].[Licences]  WITH CHECK ADD  CONSTRAINT [FK_Licences_Regions] FOREIGN KEY([IdRegion])
REFERENCES [dbo].[Regions] ([Id])
GO
ALTER TABLE [dbo].[Licences] CHECK CONSTRAINT [FK_Licences_Regions]
GO
ALTER TABLE [dbo].[Photo_DTPDriver]  WITH CHECK ADD FOREIGN KEY([IdDTPDriver])
REFERENCES [dbo].[DTP_Driver] ([Id])
GO
ALTER TABLE [dbo].[StatusHistory]  WITH CHECK ADD FOREIGN KEY([IdLicence])
REFERENCES [dbo].[Licences] ([Id])
GO
