USE [master]
GO
/****** Object:  Database [dbemarketing]    Script Date: 12/21/2019 7:43:45 PM ******/
CREATE DATABASE [dbemarketing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbemarketing', FILENAME = N'E:\SQL sever\MSSQL12.SQLEXPRESS\MSSQL\DATA\dbemarketing.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbemarketing_log', FILENAME = N'E:\SQL sever\MSSQL12.SQLEXPRESS\MSSQL\DATA\dbemarketing_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbemarketing] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbemarketing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbemarketing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbemarketing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbemarketing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbemarketing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbemarketing] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbemarketing] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbemarketing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbemarketing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbemarketing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbemarketing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbemarketing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbemarketing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbemarketing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbemarketing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbemarketing] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbemarketing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbemarketing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbemarketing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbemarketing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbemarketing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbemarketing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbemarketing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbemarketing] SET RECOVERY FULL 
GO
ALTER DATABASE [dbemarketing] SET  MULTI_USER 
GO
ALTER DATABASE [dbemarketing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbemarketing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbemarketing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbemarketing] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbemarketing] SET DELAYED_DURABILITY = DISABLED 
GO
USE [dbemarketing]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 12/21/2019 7:43:45 PM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
/****** Object:  Table [dbo].[tbl_admin]    Script Date: 12/21/2019 7:43:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admin](
	[ad_id] [int] IDENTITY(1,1) NOT NULL,
	[ad_username] [nvarchar](50) NOT NULL,
	[ad_password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_category]    Script Date: 12/21/2019 7:43:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_category](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_name] [nvarchar](50) NOT NULL,
	[cat_image] [nvarchar](max) NOT NULL,
	[cat_fk_ad] [int] NULL,
	[cat_status] [int] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_comment]    Script Date: 12/21/2019 7:43:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[comment_content] [nvarchar](max) NOT NULL,
	[comment_fk_pro] [int] NULL,
	[comment_fk_user] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 12/21/2019 7:43:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_name] [nvarchar](50) NOT NULL,
	[pro_image] [nvarchar](max) NOT NULL,
	[pro_des] [nvarchar](max) NOT NULL,
	[pro_price] [int] NULL,
	[pro_fk_cat] [int] NULL,
	[pro_fk_admin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_rate]    Script Date: 12/21/2019 7:43:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_rate](
	[rate_id] [int] IDENTITY(1,1) NOT NULL,
	[rate_content] [nvarchar](max) NOT NULL,
	[rate_fk_pro] [int] NULL,
	[rate_fk_user] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[rate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 12/21/2019 7:43:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[u_name] [nvarchar](50) NOT NULL,
	[u_email] [nvarchar](50) NOT NULL,
	[u_password] [nvarchar](50) NOT NULL,
	[u_image] [nvarchar](max) NOT NULL,
	[u_contact] [nvarchar](50) NOT NULL,
	[u_fk_admin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[u_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_admin] ON 

INSERT [dbo].[tbl_admin] ([ad_id], [ad_username], [ad_password]) VALUES (1, N'root', N'admin123')
INSERT [dbo].[tbl_admin] ([ad_id], [ad_username], [ad_password]) VALUES (2, N'admin', N'admin123')
INSERT [dbo].[tbl_admin] ([ad_id], [ad_username], [ad_password]) VALUES (3, N'test', N'admin123')
SET IDENTITY_INSERT [dbo].[tbl_admin] OFF
SET IDENTITY_INSERT [dbo].[tbl_category] ON 

INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (9, N'Animals', N'~/Content/upload/47474012Pets-Animals-720x500.jpg', 1, 1)
INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (10, N'Home Appliances', N'~/Content/upload/10945175504-zs-home_appliances_111-ab.jpg', 1, 1)
INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (11, N'Real Estate', N'~/Content/upload/1298096855504481783-k6ZD--621x414@LiveMint.jpg', 1, 1)
INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (12, N'Vehicles', N'~/Content/upload/1378569238shoppingtools-buildandprice-Rio-SnowWhitePearl-RO_46J.jpg', 1, 1)
INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (13, N'job & services', N'~/Content/upload/1183167686201708091305-11472-Job-Opportunity-05.jpg', 1, 1)
INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (14, N'Furniture', N'~/Content/upload/369272983FNZ1553-AW18-Landing-Furniture-DT-Hor-Banner-880x395-Fabric-Sofa.jpg', 1, 1)
INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (15, N'Garments', N'~/Content/upload/1314136553Shirts_Wholesale-1.jpg', 1, 1)
INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_image], [cat_fk_ad], [cat_status]) VALUES (16, N'Cosmetics', N'~/Content/upload/182975300THUMBNAIL_Fotolia_124863579_Subscription_Monthly_M.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[tbl_category] OFF
SET IDENTITY_INSERT [dbo].[tbl_comment] ON 

INSERT [dbo].[tbl_comment] ([comment_id], [comment_content], [comment_fk_pro], [comment_fk_user]) VALUES (1, N'This fridge is good', 2, 1)
INSERT [dbo].[tbl_comment] ([comment_id], [comment_content], [comment_fk_pro], [comment_fk_user]) VALUES (2, N'Nice Fridge', 2, 2)
INSERT [dbo].[tbl_comment] ([comment_id], [comment_content], [comment_fk_pro], [comment_fk_user]) VALUES (3, N'This fridge is nice', 2, 3)
SET IDENTITY_INSERT [dbo].[tbl_comment] OFF
SET IDENTITY_INSERT [dbo].[tbl_product] ON 

INSERT [dbo].[tbl_product] ([pro_id], [pro_name], [pro_image], [pro_des], [pro_price], [pro_fk_cat], [pro_fk_admin]) VALUES (2, N'Fridge', N'~/Content/upload/792009978tu lanh.jpg', N'Good Fridge', 1000000, 14, 1)
SET IDENTITY_INSERT [dbo].[tbl_product] OFF
SET IDENTITY_INSERT [dbo].[tbl_rate] ON 

INSERT [dbo].[tbl_rate] ([rate_id], [rate_content], [rate_fk_pro], [rate_fk_user]) VALUES (1, N'5 star', 2, 1)
INSERT [dbo].[tbl_rate] ([rate_id], [rate_content], [rate_fk_pro], [rate_fk_user]) VALUES (3, N'3 Star', 2, 2)
INSERT [dbo].[tbl_rate] ([rate_id], [rate_content], [rate_fk_pro], [rate_fk_user]) VALUES (7, N'4 star', 2, 3)
SET IDENTITY_INSERT [dbo].[tbl_rate] OFF
SET IDENTITY_INSERT [dbo].[tbl_user] ON 

INSERT [dbo].[tbl_user] ([u_id], [u_name], [u_email], [u_password], [u_image], [u_contact], [u_fk_admin]) VALUES (1, N'khanh', N'khanh@gmail.com', N'admin123', N'~/Content/upload/988831623person1.jpeg', N'0987123456', 1)
INSERT [dbo].[tbl_user] ([u_id], [u_name], [u_email], [u_password], [u_image], [u_contact], [u_fk_admin]) VALUES (2, N'vy', N'vy@gmail.com', N'admin123', N'~/Content/upload/501092063real_logo.png', N'0972648172', 1)
INSERT [dbo].[tbl_user] ([u_id], [u_name], [u_email], [u_password], [u_image], [u_contact], [u_fk_admin]) VALUES (3, N'ngan', N'ngan@gmail.com', N'admin123', N'~/Content/upload/327300685toy1.jpg', N'0982163742', NULL)
SET IDENTITY_INSERT [dbo].[tbl_user] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_admi__9CC208173EB79518]    Script Date: 12/21/2019 7:43:45 PM ******/
ALTER TABLE [dbo].[tbl_admin] ADD UNIQUE NONCLUSTERED 
(
	[ad_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_cate__FA8C1790E5F1637A]    Script Date: 12/21/2019 7:43:45 PM ******/
ALTER TABLE [dbo].[tbl_category] ADD UNIQUE NONCLUSTERED 
(
	[cat_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_user__3DF9EF22303BB636]    Script Date: 12/21/2019 7:43:45 PM ******/
ALTER TABLE [dbo].[tbl_user] ADD UNIQUE NONCLUSTERED 
(
	[u_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_user__F8193DB769A3C825]    Script Date: 12/21/2019 7:43:45 PM ******/
ALTER TABLE [dbo].[tbl_user] ADD UNIQUE NONCLUSTERED 
(
	[u_contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_category]  WITH CHECK ADD FOREIGN KEY([cat_fk_ad])
REFERENCES [dbo].[tbl_admin] ([ad_id])
GO
ALTER TABLE [dbo].[tbl_comment]  WITH CHECK ADD FOREIGN KEY([comment_fk_pro])
REFERENCES [dbo].[tbl_product] ([pro_id])
GO
ALTER TABLE [dbo].[tbl_comment]  WITH CHECK ADD FOREIGN KEY([comment_fk_user])
REFERENCES [dbo].[tbl_user] ([u_id])
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD FOREIGN KEY([pro_fk_cat])
REFERENCES [dbo].[tbl_category] ([cat_id])
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_product_tbl_admin] FOREIGN KEY([pro_fk_admin])
REFERENCES [dbo].[tbl_admin] ([ad_id])
GO
ALTER TABLE [dbo].[tbl_product] CHECK CONSTRAINT [FK_tbl_product_tbl_admin]
GO
ALTER TABLE [dbo].[tbl_rate]  WITH CHECK ADD FOREIGN KEY([rate_fk_pro])
REFERENCES [dbo].[tbl_product] ([pro_id])
GO
ALTER TABLE [dbo].[tbl_rate]  WITH CHECK ADD FOREIGN KEY([rate_fk_user])
REFERENCES [dbo].[tbl_user] ([u_id])
GO
ALTER TABLE [dbo].[tbl_user]  WITH CHECK ADD  CONSTRAINT [FK_tbl_user_tbl_admin] FOREIGN KEY([u_fk_admin])
REFERENCES [dbo].[tbl_admin] ([ad_id])
GO
ALTER TABLE [dbo].[tbl_user] CHECK CONSTRAINT [FK_tbl_user_tbl_admin]
GO
USE [master]
GO
ALTER DATABASE [dbemarketing] SET  READ_WRITE 
GO
