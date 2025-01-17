USE [BIDs]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/18/2023 12:28:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminNotificationDetail]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminNotificationDetail](
	[NotificationID] [uniqueidentifier] NOT NULL,
	[TypeID] [int] NOT NULL,
	[AdminID] [uniqueidentifier] NOT NULL,
	[Messages] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BanHistory]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanHistory](
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Reason] [nvarchar](50) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingItem]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingItem](
	[ID] [uniqueidentifier] NOT NULL,
	[ItemID] [uniqueidentifier] NOT NULL,
	[StaffID] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Description]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Description](
	[ID] [uniqueidentifier] NOT NULL,
	[CategoryID] [uniqueidentifier] NOT NULL,
	[Status] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fee]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Min] [float] NOT NULL,
	[Max] [float] NOT NULL,
	[ParticipationFee] [float] NOT NULL,
	[DepositFee] [float] NOT NULL,
	[Surcharge] [float] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[CategoryID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DescriptionDetail] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[StepPrice] [float] NOT NULL,
	[Deposit] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[FirstPrice] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemDescription]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemDescription](
	[ID] [uniqueidentifier] NOT NULL,
	[ItemID] [uniqueidentifier] NOT NULL,
	[DescriptionID] [uniqueidentifier] NOT NULL,
	[Detail] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ItemDescription] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[ID] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ExpireDate] [datetime] NOT NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationType]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethodStaff]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethodStaff](
	[ID] [uniqueidentifier] NOT NULL,
	[StaffID] [uniqueidentifier] NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[BankName] [nvarchar](50) NOT NULL,
	[OwnerName] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethodUser]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethodUser](
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[BankName] [nvarchar](50) NOT NULL,
	[OwnerName] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentStaff]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentStaff](
	[ID] [uniqueidentifier] NOT NULL,
	[MethodID] [uniqueidentifier] NOT NULL,
	[StaffID] [uniqueidentifier] NOT NULL,
	[SessionID] [uniqueidentifier] NULL,
	[type] [nvarchar](100) NOT NULL,
	[Detail] [nvarchar](100) NOT NULL,
	[Amount] [float] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentUser]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentUser](
	[ID] [uniqueidentifier] NOT NULL,
	[MethodID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[SessionID] [uniqueidentifier] NOT NULL,
	[type] [nvarchar](100) NOT NULL,
	[Detail] [nvarchar](100) NOT NULL,
	[Amount] [float] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[ID] [uniqueidentifier] NOT NULL,
	[FeeID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BeginTime] [datetime] NOT NULL,
	[AuctionTime] [time](7) NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[ItemID] [uniqueidentifier] NOT NULL,
	[FinalPrice] [float] NOT NULL,
	[SessionRuleID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SessionDetail]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionDetail](
	[UserID] [uniqueidentifier] NOT NULL,
	[SessionID] [uniqueidentifier] NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[ID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SessionRule]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionRule](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IncreaseTime] [int] NOT NULL,
	[FreeTime] [time](7) NOT NULL,
	[DelayTime] [time](7) NOT NULL,
	[DelayFreeTime] [time](7) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_SessionRule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[ID] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffNotificationDetail]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffNotificationDetail](
	[NotificationID] [uniqueidentifier] NOT NULL,
	[TypeID] [int] NOT NULL,
	[StaffID] [uniqueidentifier] NOT NULL,
	[Messages] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserNotificationDetail]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserNotificationDetail](
	[NotificationID] [uniqueidentifier] NOT NULL,
	[TypeID] [int] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[Messages] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/18/2023 12:28:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [uniqueidentifier] NOT NULL,
	[Role] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Avatar] [nvarchar](max) NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[CCCDNumber] [nvarchar](20) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CCCDFrontImage] [nvarchar](max) NOT NULL,
	[CCCDBackImage] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([ID], [Email], [Name], [Password], [Address], [Phone], [Status]) VALUES (N'd25f5e0c-efb3-435e-8bea-8f4df5e308a5', N'seedadmin@gmail.com', N'Seed Admin', N'05072001', N'115/4/2 du?ng s? 11 thành ph? Th? Ð?c', N'0933403842', 1)
GO
INSERT [dbo].[BanHistory] ([ID], [UserID], [Reason], [UpdateDate], [CreateDate], [Status]) VALUES (N'3873d218-2b43-4180-8950-67879f271db1', N'a2c10d33-9847-40b9-9c6f-1dc8558c5d03', N'D? li?u khóa tài kho?n m?u', CAST(N'2023-07-03T01:32:17.970' AS DateTime), CAST(N'2023-07-03T01:32:17.970' AS DateTime), 1)
GO
INSERT [dbo].[BookingItem] ([ID], [ItemID], [StaffID], [CreateDate], [Status], [UpdateDate]) VALUES (N'753a742c-2214-4807-93a7-43f53b8a89ad', N'126285f2-b4c6-435b-8fb4-79e239ccc35d', N'9b20198e-9c70-4f22-8714-52a7b6e034d8', CAST(N'2023-07-10T01:25:29.607' AS DateTime), 1, CAST(N'2023-07-10T01:25:29.607' AS DateTime))
INSERT [dbo].[BookingItem] ([ID], [ItemID], [StaffID], [CreateDate], [Status], [UpdateDate]) VALUES (N'43ebe25e-0d94-4319-99e2-864bc9b8977c', N'f827f124-741c-4f82-8c92-ba8f8edc21c5', N'9b20198e-9c70-4f22-8714-52a7b6e034d8', CAST(N'2023-07-03T01:33:04.363' AS DateTime), 1, CAST(N'2023-07-03T01:33:04.363' AS DateTime))
INSERT [dbo].[BookingItem] ([ID], [ItemID], [StaffID], [CreateDate], [Status], [UpdateDate]) VALUES (N'00c378ee-8813-4591-9308-cd73867c70ae', N'85b409b2-f7a0-4c5f-8e8b-60faa05267b3', N'9b20198e-9c70-4f22-8714-52a7b6e034d8', CAST(N'2023-07-04T02:51:32.193' AS DateTime), 2, CAST(N'2023-07-05T00:42:36.187' AS DateTime))
INSERT [dbo].[BookingItem] ([ID], [ItemID], [StaffID], [CreateDate], [Status], [UpdateDate]) VALUES (N'1ac16a74-6d6e-4be9-9d39-df29f4c8afef', N'67b21edf-2b92-4f26-9e0c-8e1ef41c01e4', N'9b20198e-9c70-4f22-8714-52a7b6e034d8', CAST(N'2023-07-03T01:33:04.360' AS DateTime), 1, CAST(N'2023-07-03T01:33:04.360' AS DateTime))
GO
INSERT [dbo].[Category] ([ID], [Name], [UpdateDate], [CreateDate], [Status]) VALUES (N'f345f47b-83c3-42f7-9f0d-2342fb4567b4', N'Ð? công ngh?', CAST(N'2023-07-03T01:32:18.013' AS DateTime), CAST(N'2023-07-03T01:32:18.013' AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [UpdateDate], [CreateDate], [Status]) VALUES (N'890fca36-29ab-4a50-a99e-51f9d3db3ae2', N'Xe d?p', CAST(N'2023-07-03T01:32:18.013' AS DateTime), CAST(N'2023-07-03T01:32:18.013' AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [UpdateDate], [CreateDate], [Status]) VALUES (N'7d534f13-1d22-4baf-9d67-590d3ae4d07d', N'Xe máy', CAST(N'2023-07-03T01:32:18.013' AS DateTime), CAST(N'2023-07-03T01:32:18.013' AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [UpdateDate], [CreateDate], [Status]) VALUES (N'6d2e3f84-4e39-41e2-99eb-cba4de0d2e44', N'Ð? c?', CAST(N'2023-07-03T01:32:18.017' AS DateTime), CAST(N'2023-07-03T01:32:18.017' AS DateTime), 1)
GO
INSERT [dbo].[Description] ([ID], [CategoryID], [Status], [Name]) VALUES (N'b0f5b80d-ff41-4b2f-84db-1530b6018e76', N'7d534f13-1d22-4baf-9d67-590d3ae4d07d', 1, N'Mua vào nam')
INSERT [dbo].[Description] ([ID], [CategoryID], [Status], [Name]) VALUES (N'f6a6c63f-56a0-4164-979b-1c6a5f69c512', N'6d2e3f84-4e39-41e2-99eb-cba4de0d2e44', 1, N'Lo?i s?n ph?m c? th?')
INSERT [dbo].[Description] ([ID], [CategoryID], [Status], [Name]) VALUES (N'6340b24d-9257-4d4a-940f-2e34a9e42830', N'6d2e3f84-4e39-41e2-99eb-cba4de0d2e44', 1, N'Niên d?i(dã t?n t?i bao lâu)')
INSERT [dbo].[Description] ([ID], [CategoryID], [Status], [Name]) VALUES (N'7a41a429-ba57-4d34-92d6-48a12ad0c98c', N'f345f47b-83c3-42f7-9f0d-2342fb4567b4', 1, N'Mua vào nam')
INSERT [dbo].[Description] ([ID], [CategoryID], [Status], [Name]) VALUES (N'8d91b4f0-8b59-4ea9-9e42-49c6dd7e098a', N'6d2e3f84-4e39-41e2-99eb-cba4de0d2e44', 1, N'Nhãn hi?u(N?u có)')
INSERT [dbo].[Description] ([ID], [CategoryID], [Status], [Name]) VALUES (N'c87ee0b6-96e1-4bbf-8e8e-4f09fe46a4a8', N'890fca36-29ab-4a50-a99e-51f9d3db3ae2', 1, N'Nhãn hi?u')
INSERT [dbo].[Description] ([ID], [CategoryID], [Status], [Name]) VALUES (N'b20e94ce-05f6-41ff-b9de-4fc748dabce0', N'6d2e3f84-4e39-41e2-99eb-cba4de0d2e44', 1, N'Ð? hu h?i')
INSERT [dbo].[Description] ([ID], [CategoryID], [Status], [Name]) VALUES (N'3e6d3540-c9e9-493d-a01b-64a6c7b07f88', N'890fca36-29ab-4a50-a99e-51f9d3db3ae2', 1, N'Mua vào nam')
INSERT [dbo].[Description] ([ID], [CategoryID], [Status], [Name]) VALUES (N'9053c700-35d1-4d46-9c5d-6e3288d6ce15', N'f345f47b-83c3-42f7-9f0d-2342fb4567b4', 1, N'Lo?i s?n ph?m c? th?')
INSERT [dbo].[Description] ([ID], [CategoryID], [Status], [Name]) VALUES (N'8e9e6a68-3a45-4135-92d4-85d7ae4e7c82', N'7d534f13-1d22-4baf-9d67-590d3ae4d07d', 1, N'Hãng xe')
INSERT [dbo].[Description] ([ID], [CategoryID], [Status], [Name]) VALUES (N'2fb11c2d-2b3c-41a9-82c1-8e1a2445f5c3', N'f345f47b-83c3-42f7-9f0d-2342fb4567b4', 1, N'Màu s?c')
INSERT [dbo].[Description] ([ID], [CategoryID], [Status], [Name]) VALUES (N'e2d739f8-ef82-471a-b5a9-98dd3e3a976e', N'7d534f13-1d22-4baf-9d67-590d3ae4d07d', 1, N'Màu s?c')
INSERT [dbo].[Description] ([ID], [CategoryID], [Status], [Name]) VALUES (N'4b25a648-32c6-4a95-96d0-9cb02f2da01a', N'890fca36-29ab-4a50-a99e-51f9d3db3ae2', 1, N'Màu s?c')
INSERT [dbo].[Description] ([ID], [CategoryID], [Status], [Name]) VALUES (N'52bc7b17-3820-42e9-a775-aa729f2dd4ef', N'7d534f13-1d22-4baf-9d67-590d3ae4d07d', 1, N'Bi?n s?')
INSERT [dbo].[Description] ([ID], [CategoryID], [Status], [Name]) VALUES (N'b79a7df5-af17-4a75-8a4b-ef21c51e9d46', N'f345f47b-83c3-42f7-9f0d-2342fb4567b4', 1, N'Nhãn hi?u')
GO
SET IDENTITY_INSERT [dbo].[Fee] ON 

INSERT [dbo].[Fee] ([ID], [Name], [Min], [Max], [ParticipationFee], [DepositFee], [Surcharge], [CreateDate], [UpdateDate], [Status]) VALUES (10, N'Phân khúc v?a và nh?', 1000000, 10000000, 0.005, 0, 0.1, CAST(N'2023-07-03T01:32:17.997' AS DateTime), CAST(N'2023-07-03T01:32:17.997' AS DateTime), 1)
INSERT [dbo].[Fee] ([ID], [Name], [Min], [Max], [ParticipationFee], [DepositFee], [Surcharge], [CreateDate], [UpdateDate], [Status]) VALUES (11, N'Phân khúc trung bình và cao', 10000000, 30000000, 0.004, 0.15, 0.1, CAST(N'2023-07-03T01:32:18.010' AS DateTime), CAST(N'2023-07-03T01:32:18.010' AS DateTime), 1)
INSERT [dbo].[Fee] ([ID], [Name], [Min], [Max], [ParticipationFee], [DepositFee], [Surcharge], [CreateDate], [UpdateDate], [Status]) VALUES (12, N'Phân khúc cao c?p', 30000000, 1000000000, 0.003, 0.25, 0.1, CAST(N'2023-07-03T01:32:18.010' AS DateTime), CAST(N'2023-07-03T01:32:18.010' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Fee] OFF
GO
INSERT [dbo].[Item] ([ID], [UserID], [CategoryID], [Name], [DescriptionDetail], [Quantity], [Image], [StepPrice], [Deposit], [CreateDate], [UpdateDate], [FirstPrice]) VALUES (N'85b409b2-f7a0-4c5f-8e8b-60faa05267b3', N'c8e6ab5d-4f53-4f3d-ae4d-9d98e3fbb5b1', N'f345f47b-83c3-42f7-9f0d-2342fb4567b4', N'Test Item', N'Item Test Create', 1, N'Test Item', 5000000, 0, CAST(N'2023-07-04T02:50:27.843' AS DateTime), CAST(N'2023-07-04T02:50:27.843' AS DateTime), 50000000)
INSERT [dbo].[Item] ([ID], [UserID], [CategoryID], [Name], [DescriptionDetail], [Quantity], [Image], [StepPrice], [Deposit], [CreateDate], [UpdateDate], [FirstPrice]) VALUES (N'126285f2-b4c6-435b-8fb4-79e239ccc35d', N'285ba1e8-8bf8-4cc3-817c-453187a234c9', N'890fca36-29ab-4a50-a99e-51f9d3db3ae2', N'Item test case 1', N'test case 1', 2, N'image test case 1', 100000, 0, CAST(N'2023-07-10T01:25:28.657' AS DateTime), CAST(N'2023-07-10T01:25:28.657' AS DateTime), 1500000)
INSERT [dbo].[Item] ([ID], [UserID], [CategoryID], [Name], [DescriptionDetail], [Quantity], [Image], [StepPrice], [Deposit], [CreateDate], [UpdateDate], [FirstPrice]) VALUES (N'67b21edf-2b92-4f26-9e0c-8e1ef41c01e4', N'051e3ac9-8299-4f85-b56e-d0f3cfc1fead', N'f345f47b-83c3-42f7-9f0d-2342fb4567b4', N'Laptop ASUS', N'NVIDIA 930, intel core i7 8th Gen', 1, N'Image m?u', 1000000, 0, CAST(N'2023-07-03T01:32:55.110' AS DateTime), CAST(N'2023-07-03T01:32:55.110' AS DateTime), 25000000)
INSERT [dbo].[Item] ([ID], [UserID], [CategoryID], [Name], [DescriptionDetail], [Quantity], [Image], [StepPrice], [Deposit], [CreateDate], [UpdateDate], [FirstPrice]) VALUES (N'f827f124-741c-4f82-8c92-ba8f8edc21c5', N'c8e6ab5d-4f53-4f3d-ae4d-9d98e3fbb5b1', N'7d534f13-1d22-4baf-9d67-590d3ae4d07d', N'XSR 155R', N'Xe máy xsr 155r c?a yamaha', 1, N'Image m?u', 2000000, 0, CAST(N'2023-07-03T01:32:55.147' AS DateTime), CAST(N'2023-07-03T01:32:55.147' AS DateTime), 50000000)
GO
INSERT [dbo].[ItemDescription] ([ID], [ItemID], [DescriptionID], [Detail], [Status]) VALUES (N'5c5644b3-480a-4081-8aa9-1c6e6700e15b', N'67b21edf-2b92-4f26-9e0c-8e1ef41c01e4', N'9053c700-35d1-4d46-9c5d-6e3288d6ce15', N'Laptop', 1)
INSERT [dbo].[ItemDescription] ([ID], [ItemID], [DescriptionID], [Detail], [Status]) VALUES (N'd2f49117-d4b2-404d-9a69-208c47ed926f', N'f827f124-741c-4f82-8c92-ba8f8edc21c5', N'52bc7b17-3820-42e9-a775-aa729f2dd4ef', N'72K109144', 1)
INSERT [dbo].[ItemDescription] ([ID], [ItemID], [DescriptionID], [Detail], [Status]) VALUES (N'95fd3353-3d5d-4c9a-816a-2af6f2a8c45e', N'f827f124-741c-4f82-8c92-ba8f8edc21c5', N'8e9e6a68-3a45-4135-92d4-85d7ae4e7c82', N'Yamaha', 1)
INSERT [dbo].[ItemDescription] ([ID], [ItemID], [DescriptionID], [Detail], [Status]) VALUES (N'0a273a1d-c202-4f68-9b67-37f4d79c7585', N'67b21edf-2b92-4f26-9e0c-8e1ef41c01e4', N'b79a7df5-af17-4a75-8a4b-ef21c51e9d46', N'Asus', 1)
INSERT [dbo].[ItemDescription] ([ID], [ItemID], [DescriptionID], [Detail], [Status]) VALUES (N'8e15a7d9-46c5-468a-bd95-5b228cb518d2', N'67b21edf-2b92-4f26-9e0c-8e1ef41c01e4', N'2fb11c2d-2b3c-41a9-82c1-8e1a2445f5c3', N'Ðen nhám', 1)
INSERT [dbo].[ItemDescription] ([ID], [ItemID], [DescriptionID], [Detail], [Status]) VALUES (N'e15e4f65-163e-4b75-b63d-881a50832772', N'f827f124-741c-4f82-8c92-ba8f8edc21c5', N'b0f5b80d-ff41-4b2f-84db-1530b6018e76', N'2023', 1)
INSERT [dbo].[ItemDescription] ([ID], [ItemID], [DescriptionID], [Detail], [Status]) VALUES (N'50c691c7-074f-4862-afbc-ada3afdf8ae3', N'126285f2-b4c6-435b-8fb4-79e239ccc35d', N'c87ee0b6-96e1-4bbf-8e8e-4f09fe46a4a8', N'Lamborghini', 1)
INSERT [dbo].[ItemDescription] ([ID], [ItemID], [DescriptionID], [Detail], [Status]) VALUES (N'7c48668c-7c2e-4d26-934e-c4b8b7f65492', N'f827f124-741c-4f82-8c92-ba8f8edc21c5', N'e2d739f8-ef82-471a-b5a9-98dd3e3a976e', N'B?c và nâu', 1)
INSERT [dbo].[ItemDescription] ([ID], [ItemID], [DescriptionID], [Detail], [Status]) VALUES (N'e6f829e9-b543-4039-96d8-e5e081b6c9ed', N'126285f2-b4c6-435b-8fb4-79e239ccc35d', N'4b25a648-32c6-4a95-96d0-9cb02f2da01a', N'vang den', 1)
INSERT [dbo].[ItemDescription] ([ID], [ItemID], [DescriptionID], [Detail], [Status]) VALUES (N'1f13e9b6-543d-4bfb-81f9-ef2e6e190e2b', N'67b21edf-2b92-4f26-9e0c-8e1ef41c01e4', N'7a41a429-ba57-4d34-92d6-48a12ad0c98c', N'2018', 1)
INSERT [dbo].[ItemDescription] ([ID], [ItemID], [DescriptionID], [Detail], [Status]) VALUES (N'edcb85bf-2bb8-4186-8732-f6d1fd735f6b', N'126285f2-b4c6-435b-8fb4-79e239ccc35d', N'3e6d3540-c9e9-493d-a01b-64a6c7b07f88', N'2021', 1)
GO
INSERT [dbo].[Session] ([ID], [FeeID], [Name], [BeginTime], [AuctionTime], [EndTime], [UpdateDate], [CreateDate], [Status], [ItemID], [FinalPrice], [SessionRuleID]) VALUES (N'82f4e6fb-4e33-4c19-b70b-2807f5b24d01', 12, N'test case 4', CAST(N'2023-07-19T00:30:00.000' AS DateTime), CAST(N'23:59:59.0010000' AS Time), CAST(N'2023-07-20T00:29:59.000' AS DateTime), CAST(N'2023-07-18T00:06:14.343' AS DateTime), CAST(N'2023-07-18T00:06:14.343' AS DateTime), 1, N'85b409b2-f7a0-4c5f-8e8b-60faa05267b3', 50000000, N'b7370eb2-3fff-4b91-f31b-08db7d91cd0c')
INSERT [dbo].[Session] ([ID], [FeeID], [Name], [BeginTime], [AuctionTime], [EndTime], [UpdateDate], [CreateDate], [Status], [ItemID], [FinalPrice], [SessionRuleID]) VALUES (N'458fede1-9a26-42ce-8cf1-2fd43c1208fb', 12, N'Test Session', CAST(N'2023-09-10T12:00:00.000' AS DateTime), CAST(N'23:59:59.0010000' AS Time), CAST(N'2023-09-11T11:59:59.000' AS DateTime), CAST(N'2023-07-09T03:53:11.190' AS DateTime), CAST(N'2023-07-09T03:53:11.187' AS DateTime), 1, N'f827f124-741c-4f82-8c92-ba8f8edc21c5', 50000000, N'b7370eb2-3fff-4b91-f31b-08db7d91cd0c')
INSERT [dbo].[Session] ([ID], [FeeID], [Name], [BeginTime], [AuctionTime], [EndTime], [UpdateDate], [CreateDate], [Status], [ItemID], [FinalPrice], [SessionRuleID]) VALUES (N'd53f1cb4-8f07-4490-8a8e-9bc77866675a', 10, N'test case 1', CAST(N'2023-10-10T09:30:00.000' AS DateTime), CAST(N'22:30:00.0010000' AS Time), CAST(N'2023-10-11T08:00:00.000' AS DateTime), CAST(N'2023-07-10T01:32:46.480' AS DateTime), CAST(N'2023-07-10T01:32:46.480' AS DateTime), 1, N'126285f2-b4c6-435b-8fb4-79e239ccc35d', 1500000, N'b7370eb2-3fff-4b91-f31b-08db7d91cd0c')
INSERT [dbo].[Session] ([ID], [FeeID], [Name], [BeginTime], [AuctionTime], [EndTime], [UpdateDate], [CreateDate], [Status], [ItemID], [FinalPrice], [SessionRuleID]) VALUES (N'0b187593-1d7a-4928-ac54-de5038fe21f9', 11, N'test case 3', CAST(N'2023-07-18T23:45:00.000' AS DateTime), CAST(N'23:59:59.0010000' AS Time), CAST(N'2023-07-19T23:44:59.000' AS DateTime), CAST(N'2023-07-17T23:44:17.680' AS DateTime), CAST(N'2023-07-17T23:44:16.693' AS DateTime), 1, N'67b21edf-2b92-4f26-9e0c-8e1ef41c01e4', 25000000, N'b7370eb2-3fff-4b91-f31b-08db7d91cd0c')
GO
INSERT [dbo].[SessionRule] ([ID], [Name], [IncreaseTime], [FreeTime], [DelayTime], [DelayFreeTime], [CreateDate], [UpdateDate], [Status]) VALUES (N'b7370eb2-3fff-4b91-f31b-08db7d91cd0c', N'First Rule', 20, CAST(N'00:05:00' AS Time), CAST(N'00:10:00' AS Time), CAST(N'00:00:15' AS Time), CAST(N'2023-07-06T02:55:35.100' AS DateTime), CAST(N'2023-07-06T02:55:35.097' AS DateTime), 1)
GO
INSERT [dbo].[Staff] ([ID], [Email], [Name], [Password], [Address], [Phone], [DateOfBirth], [CreateDate], [UpdateDate], [Status]) VALUES (N'9b20198e-9c70-4f22-8714-52a7b6e034d8', N'seedstaff@gmail.com', N'Seed Staff', N'05072001', N'115/4/2 du?ng s? 11 thành ph? Th? Ð?c', N'0933403842', CAST(N'2001-07-05T00:00:00.000' AS DateTime), CAST(N'2023-07-03T01:32:01.580' AS DateTime), CAST(N'2023-07-03T01:32:01.580' AS DateTime), 1)
GO
INSERT [dbo].[Users] ([ID], [Role], [Name], [Email], [Password], [Avatar], [Address], [Phone], [DateOfBirth], [CCCDNumber], [CreateDate], [UpdateDate], [CCCDFrontImage], [CCCDBackImage], [Status]) VALUES (N'a2c10d33-9847-40b9-9c6f-1dc8558c5d03', 2, N'User seed 5', N'nhutdmse1512910@fpt.edu.vn', N'07072001', N'Avater mẫu', N'115/4/2 du?ng s? 11 thành ph? Th? Ð?c', N'0933403844', CAST(N'2003-07-07T00:00:00.000' AS DateTime), N'077201000702', CAST(N'2023-07-03T01:32:01.580' AS DateTime), CAST(N'2023-07-03T01:32:01.580' AS DateTime), N'CCCD m?t tru?c m?u', N'CCCD m?t sau m?u', 2)
INSERT [dbo].[Users] ([ID], [Role], [Name], [Email], [Password], [Avatar], [Address], [Phone], [DateOfBirth], [CCCDNumber], [CreateDate], [UpdateDate], [CCCDFrontImage], [CCCDBackImage], [Status]) VALUES (N'285ba1e8-8bf8-4cc3-817c-453187a234c9', 1, N'Minh Nhut', N'nhutdmse151298@fpt.edu.vn', N'05072001', N'Minh Nhut', N'dia chi mau', N'0933403849', CAST(N'2001-07-05T00:00:00.000' AS DateTime), N'077201000709', CAST(N'2023-07-10T01:11:57.523' AS DateTime), CAST(N'2023-07-10T01:11:57.523' AS DateTime), N'cccd mau', N'cccd mau', 1)
INSERT [dbo].[Users] ([ID], [Role], [Name], [Email], [Password], [Avatar], [Address], [Phone], [DateOfBirth], [CCCDNumber], [CreateDate], [UpdateDate], [CCCDFrontImage], [CCCDBackImage], [Status]) VALUES (N'8776e6d7-442d-4b19-9fe8-63b6f8d48d8f', 1, N'User seed 1', N'minhnhut05072003@gmail.com', N'07072001', N'Avater m?u', N'115/4/2 du?ng s? 11 thành ph? Th? Ð?c', N'0933403844', CAST(N'2003-07-07T00:00:00.000' AS DateTime), N'077201000702', CAST(N'2023-07-03T01:32:01.547' AS DateTime), CAST(N'2023-07-03T01:32:01.547' AS DateTime), N'CCCD m?t tru?c m?u', N'CCCD m?t sau m?u', 0)
INSERT [dbo].[Users] ([ID], [Role], [Name], [Email], [Password], [Avatar], [Address], [Phone], [DateOfBirth], [CCCDNumber], [CreateDate], [UpdateDate], [CCCDFrontImage], [CCCDBackImage], [Status]) VALUES (N'c8e6ab5d-4f53-4f3d-ae4d-9d98e3fbb5b1', 2, N'User seed 3', N'minhnhut05072004@gmail.com', N'07072001', N'Avater m?u', N'115/4/2 du?ng s? 11 thành ph? Th? Ð?c', N'0933403844', CAST(N'2003-07-07T00:00:00.000' AS DateTime), N'077201000702', CAST(N'2023-07-03T01:32:01.577' AS DateTime), CAST(N'2023-07-03T01:32:01.577' AS DateTime), N'CCCD m?t tru?c m?u', N'CCCD m?t sau m?u', 1)
INSERT [dbo].[Users] ([ID], [Role], [Name], [Email], [Password], [Avatar], [Address], [Phone], [DateOfBirth], [CCCDNumber], [CreateDate], [UpdateDate], [CCCDFrontImage], [CCCDBackImage], [Status]) VALUES (N'859298cf-6650-4c55-b255-c122e17f2ede', 1, N'test case 2', N'nhutdmse151298@gmail.com', N'05072001', N'test case 2', N'test case 2', N'0933403811', CAST(N'2001-07-05T00:00:00.000' AS DateTime), N'077201000555', CAST(N'2023-07-13T00:07:13.363' AS DateTime), CAST(N'2023-07-13T00:07:13.363' AS DateTime), N'test case 2', N'test case 2', 0)
INSERT [dbo].[Users] ([ID], [Role], [Name], [Email], [Password], [Avatar], [Address], [Phone], [DateOfBirth], [CCCDNumber], [CreateDate], [UpdateDate], [CCCDFrontImage], [CCCDBackImage], [Status]) VALUES (N'051e3ac9-8299-4f85-b56e-d0f3cfc1fead', 2, N'User seed 2', N'minhnhut05072001@gmail.com', N'07072001', N'Avater m?u', N'115/4/2 du?ng s? 11 thành ph? Th? Ð?c', N'0933403842', CAST(N'2003-07-07T00:00:00.000' AS DateTime), N'077201000702', CAST(N'2023-07-03T01:32:01.577' AS DateTime), CAST(N'2023-07-03T01:32:01.577' AS DateTime), N'CCCD m?t tru?c m?u', N'CCCD m?t sau m?u', 1)
GO
ALTER TABLE [dbo].[AdminNotificationDetail]  WITH CHECK ADD FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([ID])
GO
ALTER TABLE [dbo].[AdminNotificationDetail]  WITH CHECK ADD FOREIGN KEY([NotificationID])
REFERENCES [dbo].[Notification] ([ID])
GO
ALTER TABLE [dbo].[AdminNotificationDetail]  WITH CHECK ADD FOREIGN KEY([TypeID])
REFERENCES [dbo].[NotificationType] ([ID])
GO
ALTER TABLE [dbo].[BanHistory]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[BookingItem]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ID])
GO
ALTER TABLE [dbo].[BookingItem]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([ID])
GO
ALTER TABLE [dbo].[Description]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[ItemDescription]  WITH CHECK ADD  CONSTRAINT [FK_ItemDescription_Description] FOREIGN KEY([DescriptionID])
REFERENCES [dbo].[Description] ([ID])
GO
ALTER TABLE [dbo].[ItemDescription] CHECK CONSTRAINT [FK_ItemDescription_Description]
GO
ALTER TABLE [dbo].[ItemDescription]  WITH CHECK ADD  CONSTRAINT [FK_ItemDescription_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ID])
GO
ALTER TABLE [dbo].[ItemDescription] CHECK CONSTRAINT [FK_ItemDescription_Item]
GO
ALTER TABLE [dbo].[PaymentMethodStaff]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([ID])
GO
ALTER TABLE [dbo].[PaymentMethodUser]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[PaymentStaff]  WITH CHECK ADD FOREIGN KEY([MethodID])
REFERENCES [dbo].[PaymentMethodStaff] ([ID])
GO
ALTER TABLE [dbo].[PaymentStaff]  WITH CHECK ADD FOREIGN KEY([SessionID])
REFERENCES [dbo].[Session] ([ID])
GO
ALTER TABLE [dbo].[PaymentStaff]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([ID])
GO
ALTER TABLE [dbo].[PaymentUser]  WITH CHECK ADD FOREIGN KEY([MethodID])
REFERENCES [dbo].[PaymentMethodUser] ([ID])
GO
ALTER TABLE [dbo].[PaymentUser]  WITH CHECK ADD FOREIGN KEY([SessionID])
REFERENCES [dbo].[Session] ([ID])
GO
ALTER TABLE [dbo].[PaymentUser]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD FOREIGN KEY([FeeID])
REFERENCES [dbo].[Fee] ([ID])
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Item]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_SessionRule] FOREIGN KEY([SessionRuleID])
REFERENCES [dbo].[SessionRule] ([ID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_SessionRule]
GO
ALTER TABLE [dbo].[SessionDetail]  WITH CHECK ADD FOREIGN KEY([SessionID])
REFERENCES [dbo].[Session] ([ID])
GO
ALTER TABLE [dbo].[SessionDetail]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[StaffNotificationDetail]  WITH CHECK ADD FOREIGN KEY([NotificationID])
REFERENCES [dbo].[Notification] ([ID])
GO
ALTER TABLE [dbo].[StaffNotificationDetail]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([ID])
GO
ALTER TABLE [dbo].[StaffNotificationDetail]  WITH CHECK ADD FOREIGN KEY([TypeID])
REFERENCES [dbo].[NotificationType] ([ID])
GO
ALTER TABLE [dbo].[UserNotificationDetail]  WITH CHECK ADD FOREIGN KEY([NotificationID])
REFERENCES [dbo].[Notification] ([ID])
GO
ALTER TABLE [dbo].[UserNotificationDetail]  WITH CHECK ADD FOREIGN KEY([TypeID])
REFERENCES [dbo].[NotificationType] ([ID])
GO
ALTER TABLE [dbo].[UserNotificationDetail]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
