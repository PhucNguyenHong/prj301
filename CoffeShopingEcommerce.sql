USE [master]
GO
/****** Object:  Database [Assignment]    Script Date: 14/12/2023 12:55:01 ******/
CREATE DATABASE [Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Assignment_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Assignment] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assignment', N'ON'
GO
ALTER DATABASE [Assignment] SET QUERY_STORE = ON
GO
ALTER DATABASE [Assignment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Assignment]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 14/12/2023 12:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 14/12/2023 12:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customers_id] [int] NOT NULL,
	[message] [nvarchar](4000) NULL,
	[status] [nvarchar](30) NOT NULL,
	[total] [decimal](10, 2) NOT NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 14/12/2023 12:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 14/12/2023 12:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 14/12/2023 12:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bill_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 14/12/2023 12:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](4000) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[category_id] [int] NOT NULL,
	[image_link] [nvarchar](4000) NOT NULL,
	[discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([id], [username], [password], [name]) VALUES (1, N'admin', N'123456', N'admin')
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (1, 1, N'Không có', N'Đã giao', CAST(39.00 AS Decimal(10, 2)), CAST(N'2023-11-04' AS Date))
INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (10, 1, N'Không có', N'Đã giao', CAST(78.00 AS Decimal(10, 2)), CAST(N'2023-11-04' AS Date))
INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (18, 1, N'Không có', N'Đã giao', CAST(45.00 AS Decimal(10, 2)), CAST(N'2023-11-04' AS Date))
INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (19, 1, N'Không có', N'Đã giao', CAST(49.00 AS Decimal(10, 2)), CAST(N'2023-11-04' AS Date))
INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (20, 1, N'Không có', N'Đã giao', CAST(196.00 AS Decimal(10, 2)), CAST(N'2023-11-04' AS Date))
INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (21, 1, N'Không có', N'Đã giao', CAST(98.00 AS Decimal(10, 2)), CAST(N'2023-11-04' AS Date))
INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (22, 1, N'Không có', N'Đã giao', CAST(49.00 AS Decimal(10, 2)), CAST(N'2023-11-04' AS Date))
INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (23, 1, N'Không có', N'Đã giao', CAST(78.00 AS Decimal(10, 2)), CAST(N'2023-11-04' AS Date))
INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (24, 1, N'Không có', N'Đã giao', CAST(49.00 AS Decimal(10, 2)), CAST(N'2023-11-04' AS Date))
INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (26, 1, N'Không có', N'Đã giao', CAST(383.00 AS Decimal(10, 2)), CAST(N'2023-11-07' AS Date))
INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (27, 1, N'abc', N'Đã giao', CAST(139.00 AS Decimal(10, 2)), CAST(N'2023-11-07' AS Date))
INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (28, 1, N'Không có', N'Đã giao', CAST(143.00 AS Decimal(10, 2)), CAST(N'2023-11-07' AS Date))
INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (29, 1, N'Không có', N'Đã giao', CAST(45.00 AS Decimal(10, 2)), CAST(N'2023-11-07' AS Date))
INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (30, 1, N'Không có', N'Đã giao', CAST(45.00 AS Decimal(10, 2)), CAST(N'2023-11-07' AS Date))
INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (31, 1, N'Không có', N'Đã giao', CAST(94.00 AS Decimal(10, 2)), CAST(N'2023-11-07' AS Date))
INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (32, 1, N'qwe', N'Đã giao', CAST(68.00 AS Decimal(10, 2)), CAST(N'2023-11-08' AS Date))
INSERT [dbo].[bill] ([id], [customers_id], [message], [status], [total], [date]) VALUES (34, 1, N'Làm nhanh giúp tôi', N'Đang chờ', CAST(49.00 AS Decimal(10, 2)), CAST(N'2023-11-08' AS Date))
SET IDENTITY_INSERT [dbo].[bill] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name], [description]) VALUES (1, N'Cà Phê', N'Hương ngọt nhẹ, đắng dịu, êm.')
INSERT [dbo].[categories] ([id], [name], [description]) VALUES (2, N'Trà', N'Thức uống thanh tuý giầu hương vị, lại vừa mang đến một cảm nghiệm tâm thức cho tinh thần, hoài cổ, an nhiên.')
INSERT [dbo].[categories] ([id], [name], [description]) VALUES (3, N'Cloud', N'Lớp kem đậm đà kết hợp cùng trà/cà phê tuyệt đỉnh.')
INSERT [dbo].[categories] ([id], [name], [description]) VALUES (4, N'Hi-Tea Healthy', N'Trà hoa quả nâng cao tinh thần và sức khỏe.')
INSERT [dbo].[categories] ([id], [name], [description]) VALUES (5, N'Trà Xanh - Sô cô la', N'Tận hưởng sự thơm mát đến từ thiên nhiên.')
INSERT [dbo].[categories] ([id], [name], [description]) VALUES (6, N'Thức uống đá xay', N'Thơm ngon, mát lạnh, món thức uống mang hương vị mới với sự kết hợp độc đáo, phong, phú, lạ miệng.')
INSERT [dbo].[categories] ([id], [name], [description]) VALUES (7, N'Bánh & Snack', N'Không chỉ là thức uống, đồ ăn cũng là mĩ vị.')
INSERT [dbo].[categories] ([id], [name], [description]) VALUES (8, N'Thưởng Thức Tại Nhà', N'Dù là ở nhà, chỉ cần bạn muốn.')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([id], [username], [password], [fullname], [phone], [address]) VALUES (1, N'phusc', N'123456', N'Nguyễn Văn Phúc', N'0123456789', N'Hà Nội')
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [phone], [address]) VALUES (97, N'mra', N'mra', N'MR A', N'0123456789', N'Hà Nội')
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [phone], [address]) VALUES (98, N'mrb', N'123', N'Nguyễn Văn B', N'0987654321', N'HN')
INSERT [dbo].[customers] ([id], [username], [password], [fullname], [phone], [address]) VALUES (99, N'mrc', N'mrc', N'Nguyễn Văn C', N'0123456789', N'VN')
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (1, 1, 4, 1)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (2, 10, 4, 2)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (3, 18, 17, 1)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (4, 19, 1, 1)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (5, 20, 2, 4)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (6, 21, 1, 2)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (7, 22, 2, 1)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (8, 23, 4, 2)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (9, 24, 1, 1)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (11, 26, 1, 1)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (12, 26, 2, 2)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (13, 26, 3, 2)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (14, 26, 4, 3)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (15, 26, 5, 1)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (16, 27, 1, 1)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (17, 27, 3, 2)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (18, 28, 1, 2)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (19, 28, 3, 1)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (20, 29, 3, 1)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (21, 30, 3, 1)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (22, 31, 2, 1)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (23, 31, 3, 1)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (24, 32, 4, 1)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (25, 32, 5, 1)
INSERT [dbo].[order] ([id], [bill_id], [product_id], [quantity]) VALUES (28, 34, 1, 1)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (1, N'Phin Sữa Tươi Bánh Flan', N'Tỉnh tức thì cùng cà phê Robusta pha phin đậm đà và bánh flan núng nính. Uống là tỉnh, ăn là dính, xứng đáng là highlight trong ngày của bạn.', CAST(49.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/1696220170_phin-sua-tuoi-banh-flan_348e4d8886cc49cb968799018001c6fb.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (2, N'Trà Xanh Espresso Marble', N'Cho ngày thêm tươi, tỉnh, êm, mượt với Trà Xanh Espresso Marble. Đây là sự mai mối bất ngờ giữa trà xanh Tây Bắc vị mộc và cà phê Arabica Đà Lạt. Muốn ngày thêm chút highlight, nhớ tìm đến sự bất ngờ này bạn nhé!', CAST(49.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/1696220139_tra-xanh-espresso-marble_492d249bb3ab498496bff16663d9649b.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (3, N'Đường Đen Sữa Đá', N'Nếu chuộng vị cà phê đậm đà, bùng nổ và thích vị đường đen ngọt thơm, Đường Đen Sữa Đá đích thị là thức uống dành cho bạn. Không chỉ giúp bạn tỉnh táo buổi sáng, Đường Đen Sữa Đá còn hấp dẫn đến ngụm cuối cùng bởi thạch cà phê giòn dai, nhai cực cuốn. - Khuấy đều trước khi sử dụng', CAST(45.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/1686716532_dd-suada_4f2bf8d7f1af4f408500d6d85e150582.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (4, N'The Coffee House Sữa Đá', N'Thức uống giúp tỉnh táo tức thì để bắt đầu ngày mới thật hứng khởi. Không đắng khét như cà phê truyền thống, The Coffee House Sữa Đá mang hương vị hài hoà đầy lôi cuốn. Là sự đậm đà của 100% cà phê Arabica Cầu Đất rang vừa tới, biến tấu tinh tế với sữa đặc và kem sữa ngọt ngào cực quyến rũ. Càng hấp dẫn hơn với topping thạch 100% cà phê nguyên chất giúp giữ trọn vị ngon đến ngụm cuối cùng.', CAST(39.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/1675355354_bg-tch-sua-da-no_f3d8150a7b2744e68c7215ff13c0fe96.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (5, N'Cà Phê Sữa Đá', N'Cà phê Đắk Lắk nguyên chất được pha phin truyền thống kết hợp với sữa đặc tạo nên hương vị đậm đà, hài hòa giữa vị ngọt đầu lưỡi và vị đắng thanh thoát nơi hậu vị.', CAST(29.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/1669736835_ca-phe-sua-da_841285ad62c2440fb7ab03a5b3b6404d.png', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (6, N'Cà Phê Sữa Nóng', N'Cà phê được pha phin truyền thống kết hợp với sữa đặc tạo nên hương vị đậm đà, hài hòa giữa vị ngọt đầu lưỡi và vị đắng thanh thoát nơi hậu vị.', CAST(39.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/1639377770_cfsua-nong_8a83a7628b8b44839cb692c578b7c9b4.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (7, N'Bạc Sỉu', N'Bạc sỉu chính là ""Ly sữa trắng kèm một chút cà phê"". Thức uống này rất phù hợp những ai vừa muốn trải nghiệm chút vị đắng của cà phê vừa muốn thưởng thức vị ngọt béo ngậy từ sữa.', CAST(29.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/1639377904_bac-siu_2ec66781492d4bb0aa7acb48ef9a1742.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (8, N'Bạc Sỉu Nóng', N'Bạc sỉu chính là ""Ly sữa trắng kèm một chút cà phê"". Thức uống này rất phù hợp những ai vừa muốn trải nghiệm chút vị đắng của cà phê vừa muốn thưởng thức vị ngọt béo ngậy từ sữa.', CAST(39.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/1639377926_bacsiunong_3b30ddb6aeae4ce0b255bf3d3e4819f1.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (9, N'Cà Phê Đen Đá', N'Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng.', CAST(29.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/1639377797_ca-phe-den-da_64a5cacc17d949be995fd0cbe7cb14f9.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (10, N'Cà Phê Đen Nóng', N'Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng.', CAST(39.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/1639377816_ca-phe-den-nong_72e83f2776104ee599314d166693282a.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (11, N'Cà Phê Sữa Đá Chai Fresh 250ML', N'Vẫn là hương vị cà phê sữa đậm đà quen thuộc của The Coffee House nhưng khoác lên mình một chiếc áo mới tiện lợi hơn, tiết kiệm hơn phù hợp với bình thường mới, giúp bạn tận hưởng một ngày dài trọn vẹn. *Sản phẩm dùng ngon nhất trong ngày. *Sản phẩm mặc định mức đường và không đá.', CAST(75.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/bottlecfsd_496652_4b7d5ae89d07453b804ee2375ab770ce.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (12, N'Đường Đen Marble Latte', N'Đường Đen Marble Latte êm dịu cực hấp dẫn bởi vị cà phê đắng nhẹ hoà quyện cùng vị đường đen ngọt thơm và sữa tươi béo mịn. Sự kết hợp đầy mới mẻ của cà phê và đường đen cũng tạo nên diện mạo phân tầng đẹp mắt. Đây là lựa chọn đáng thử để bạn khởi đầu ngày mới đầy hứng khởi. - Khuấy đều trước khi sử dụng', CAST(55.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/1686716537_dd-latte_8c95c52adaba4e0d9a1c75cd5f740e9d.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (13, N'Caramel Macchiato Đá', N'Khuấy đều trước khi sử dụng Caramel Macchiato sẽ mang đến một sự ngạc nhiên thú vị khi vị thơm béo của bọt sữa, sữa tươi, vị đắng thanh thoát của cà phê Espresso hảo hạng và vị ngọt đậm của sốt caramel được gói gọn trong một tách cà phê.', CAST(55.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/caramel-macchiato_143623_def76753869f42979203b0d65bac672e.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (14, N'Caramel Macchiato Nóng', N'Caramel Macchiato sẽ mang đến một sự ngạc nhiên thú vị khi vị thơm béo của bọt sữa, sữa tươi, vị đắng thanh thoát của cà phê Espresso hảo hạng và vị ngọt đậm của sốt caramel được gói gọn trong một tách cà phê.', CAST(55.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/caramelmacchiatonong_168039_9eec76d0e1e740da9d4c4d67562859c2.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (15, N'Latte Đá', N'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.', CAST(55.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/latte-da_438410_685272383d5b4a9b9e16ca0848d1ed46.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (16, N'Latte Nóng', N'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.', CAST(55.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/latte_851143_bd78ea096c2740e3b861fa92769fe18e.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (17, N'Americano Đá', N'Americano được pha chế bằng cách pha thêm nước với tỷ lệ nhất định vào tách cà phê Espresso, từ đó mang lại hương vị nhẹ nhàng và giữ trọn được mùi hương cà phê đặc trưng.', CAST(45.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/classic-cold-brew_791256_3995716b699041dd851ce4bd485dfded.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (18, N'Americano Nóng', N'Americano được pha chế bằng cách pha thêm nước với tỷ lệ nhất định vào tách cà phê Espresso, từ đó mang lại hương vị nhẹ nhàng và giữ trọn được mùi hương cà phê đặc trưng.', CAST(45.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/1636647328_arme-nong_7429bf8c27bb4fc395a8f9e0d7326e2b.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (19, N'Cappuccino Đá', N'Capuchino là thức uống hòa quyện giữa hương thơm của sữa, vị béo của bọt kem cùng vị đậm đà từ cà phê Espresso. Tất cả tạo nên một hương vị đặc biệt, một chút nhẹ nhàng, trầm lắng và tinh tế.', CAST(55.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/capu-da_487470_63be2fbca8df487b87b30f3442b6383e.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (20, N'Cappuccino Nóng', N'Capuchino là thức uống hòa quyện giữa hương thơm của sữa, vị béo của bọt kem cùng vị đậm đà từ cà phê Espresso. Tất cả tạo nên một hương vị đặc biệt, một chút nhẹ nhàng, trầm lắng và tinh tế.', CAST(55.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/cappuccino_621532_0b1f725203ec4145a7ae741f0b456e66.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (21, N'Espresso Đá', N'Một tách Espresso nguyên bản được bắt đầu bởi những hạt Arabica chất lượng, phối trộn với tỉ lệ cân đối hạt Robusta, cho ra vị ngọt caramel, vị chua dịu và sánh đặc.', CAST(49.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/cfdenda-espressoda_185438_727b25aec6d243229213bf165af5bda6.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (22, N'Espresso Nóng', N'Một tách Espresso nguyên bản được bắt đầu bởi những hạt Arabica chất lượng, phối trộn với tỉ lệ cân đối hạt Robusta, cho ra vị ngọt caramel, vị chua dịu và sánh đặc.', CAST(45.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/espressonong_612688_9e028d77a9d5496ba032f07cf619a1e8.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (23, N'Cold Brew Phúc Bồn Tử', N'Vị chua ngọt của trái phúc bồn tử, làm dậy lên hương vị trái cây tự nhiên vốn sẵn có trong hạt cà phê, hòa quyện thêm vị đăng đắng, ngọt dịu nhẹ nhàng của Cold Brew 100% hạt Arabica Cầu Đất để mang đến một cách thưởng thức cà phê hoàn toàn mới, vừa thơm lừng hương cà phê quen thuộc, vừa nhẹ nhàng và thanh mát bởi hương trái cây đầy thú vị.', CAST(49.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/1675329120_coldbrew-pbt_32f62826946540f3a910e7d71d57ab48.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (24, N'Cold Brew Sữa Tươi', N'Thanh mát và cân bằng với hương vị cà phê nguyên bản 100% Arabica Cầu Đất cùng sữa tươi thơm béo cho từng ngụm tròn vị, hấp dẫn.', CAST(49.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/cold-brew-sua-tuoi_379576_f223f3e7b6ab4f1bb643ecb333a74590.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (25, N'Cold Brew Truyền Thống', N'Tại The Coffee House, Cold Brew được ủ và phục vụ mỗi ngày từ 100% hạt Arabica Cầu Đất với hương gỗ thông, hạt dẻ, nốt sô-cô-la đặc trưng, thoang thoảng hương khói nhẹ giúp Cold Brew giữ nguyên vị tươi mới.', CAST(45.00 AS Decimal(10, 2)), 1, N'https://product.hstatic.net/1000075078/product/classic-cold-brew_239501_3dd775c33d2b4c018a41dda675667fba.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (26, N'Trà Long Nhãn Hạt Sen', N'Thức uống mang hương vị của nhãn, của sen, của trà Oolong đầy thanh mát cho tất cả các thành viên trong dịp Tết này. An lành, thư thái và đậm đà chính là những gì The Coffee House mong muốn gửi trao đến bạn và gia đình.', CAST(49.00 AS Decimal(10, 2)), 2, N'https://product.hstatic.net/1000075078/product/1649378747_tra-sen-nhan_01472713cfef4b8fb7fb4a90efeadd39.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (27, N'Trà Đào Cam Sả - Đá', N'Vị thanh ngọt của đào, vị chua dịu của Cam Vàng nguyên vỏ, vị chát của trà đen tươi được ủ mới mỗi 4 tiếng, cùng hương thơm nồng đặc trưng của sả chính là điểm sáng làm nên sức hấp dẫn của thức uống này.', CAST(49.00 AS Decimal(10, 2)), 2, N'https://product.hstatic.net/1000075078/product/1669736819_tra-dao-cam-sa-da_c0a2708af2a249f6a8df029a3faef564.png', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (28, N'Trà Đào Cam Sả - Nóng', N'Vị thanh ngọt của đào, vị chua dịu của Cam Vàng nguyên vỏ, vị chát của trà đen tươi được ủ mới mỗi 4 tiếng, cùng hương thơm nồng đặc trưng của sả chính là điểm sáng làm nên sức hấp dẫn của thức uống này.', CAST(59.00 AS Decimal(10, 2)), 2, N'https://product.hstatic.net/1000075078/product/tdcs-nong_288997_53cde51f5e3247258068e08fd536b4c3.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (29, N'Trà Hạt Sen - Đá', N'Nền trà oolong hảo hạng kết hợp cùng hạt sen tươi, bùi bùi và lớp foam cheese béo ngậy. Trà hạt sen là thức uống thanh mát, nhẹ nhàng phù hợp cho cả buổi sáng và chiều tối.', CAST(39.00 AS Decimal(10, 2)), 2, N'https://product.hstatic.net/1000075078/product/tra-sen_905594_e99901165a514279926c06e359da76e4.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (30, N'Trà Hạt Sen - Nóng', N'Nền trà oolong hảo hạng kết hợp cùng hạt sen tươi, bùi bùi và lớp foam cheese béo ngậy. Trà hạt sen là thức uống thanh mát, nhẹ nhàng phù hợp cho cả buổi sáng và chiều tối.', CAST(49.00 AS Decimal(10, 2)), 2, N'https://product.hstatic.net/1000075078/product/tra-sen-nong_025153_3f1cef3de4894213a883653325b2c83e.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (31, N'Trà Đào Cam Sả Chai Fresh 500ML', N'Với phiên bản chai fresh 500ml, thức uống ""best seller"" đỉnh cao mang một diện mạo tươi mới, tiện lợi, phù hợp với bình thường mới và vẫn giữ nguyên vị thanh ngọt của đào, vị chua dịu của cam vàng nguyên vỏ và vị trà đen thơm lừng ly Trà đào cam sả nguyên bản. *Sản phẩm dùng ngon nhất trong ngày. *Sản phẩm mặc định mức đường và không đá.', CAST(105.00 AS Decimal(10, 2)), 2, N'https://product.hstatic.net/1000075078/product/bottle_tradao_836487_73425d2bcd244d88918412052e15022e.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (32, N'Trà Đen Macchiato', N'Trà đen được ủ mới mỗi ngày, giữ nguyên được vị chát mạnh mẽ đặc trưng của lá trà, phủ bên trên là lớp Macchiato ""homemade"" bồng bềnh quyến rũ vị phô mai mặn mặn mà béo béo.', CAST(55.00 AS Decimal(10, 2)), 2, N'https://product.hstatic.net/1000075078/product/tra-den-matchiato_430281_f4e02e63a407429d919a731e0c965f9d.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (33, N'Hồng Trà Sữa Trân Châu', N'Thêm chút ngọt ngào cho ngày mới với hồng trà nguyên lá, sữa thơm ngậy được cân chỉnh với tỉ lệ hoàn hảo, cùng trân châu trắng dai giòn có sẵn để bạn tận hưởng từng ngụm trà sữa ngọt ngào thơm ngậy thiệt đã.', CAST(55.00 AS Decimal(10, 2)), 2, N'https://product.hstatic.net/1000075078/product/hong-tra-sua-tran-chau_326977_b96428ea780a44a1903e2015e1978259.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (34, N'Hồng Trà Sữa Nóng', N'Từng ngụm trà chuẩn gu ấm áp, đậm đà beo béo bởi lớp sữa tươi chân ái hoà quyện. Trà đen nguyên lá âm ấm dịu nhẹ, quyện cùng lớp sữa thơm béo khó lẫn - hương vị ấm áp chuẩn gu trà, cho từng ngụm nhẹ nhàng, ngọt dịu lưu luyến mãi nơi cuống họng.', CAST(55.00 AS Decimal(10, 2)), 2, N'https://product.hstatic.net/1000075078/product/hong-tra-sua-nong_941687_6cbdc9953ee243b5a58eba59d9be8a7e.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (35, N'Trà sữa Oolong Nướng Trân Châu', N'Hương vị chân ái đúng gu đậm đà với trà oolong được “sao” (nướng) lâu hơn cho hương vị đậm đà, hòa quyện với sữa thơm béo mang đến cảm giác mát lạnh, lưu luyến vị trà sữa đậm đà nơi vòm họng.', CAST(55.00 AS Decimal(10, 2)), 2, N'https://product.hstatic.net/1000075078/product/1669736877_tra-sua-oolong-nuong-tran-chau_151faaf57f854008a25f67ee121d587b.png', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (36, N'Trà sữa Oolong Nướng (Nóng)', N'Đậm đà chuẩn gu và ấm nóng - bởi lớp trà oolong nướng đậm vị hoà cùng lớp sữa thơm béo. Hương vị chân ái đúng gu đậm đà - trà oolong được ""sao"" (nướng) lâu hơn cho vị đậm đà, hoà quyện với sữa thơm ngậy. Cho từng ngụm ấm áp, lưu luyến vị trà sữa đậm đà mãi nơi cuống họng.', CAST(55.00 AS Decimal(10, 2)), 2, N'https://product.hstatic.net/1000075078/product/oolong-nuong-nong_948581_6e7c5829782143bb89432dccafc424bb.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (37, N'Trà Sữa Mắc Ca Trân Châu', N'Mỗi ngày với The Coffee House sẽ là điều tươi mới hơn với sữa hạt mắc ca thơm ngon, bổ dưỡng quyện cùng nền trà oolong cho vị cân bằng, ngọt dịu đi kèm cùng Trân châu trắng giòn dai mang lại cảm giác “đã” trong từng ngụm trà sữa.', CAST(55.00 AS Decimal(10, 2)), 2, N'https://product.hstatic.net/1000075078/product/tra-sua-mac-ca_377522_e38edea18fa541ff943604b2d95efe0c.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (38, N'Trà Sữa Oolong Nướng Trân Châu Chai Fresh 500ML', N'Phiên bản chai fresh 500ml mới, The Coffee House tin rằng với diện mạo mới: tiện lợi và phù hợp với bình thường mới này, các tín đồ trà sữa sẽ được thưởng thức hương vị đậm đà, hòa quyện với sữa thơm béo mang đến cảm giác mát lạnh ở bất cứ nơi đâu. *Sản phẩm dùng ngon nhất trong ngày. *Sản phẩm mặc định mức đường và không đá.', CAST(95.00 AS Decimal(10, 2)), 2, N'https://product.hstatic.net/1000075078/product/bottle_oolong_285082_cd2ed77fc5ca4c4597c00962a9334ea8.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (39, N'CloudTea Oolong Nướng Kem Dừa', N'Vừa chạm môi là mê mẩn ngay lớp kem dừa beo béo, kèm vụn bánh quy phô mai giòn tan trong miệng. Đặc biệt, trà Oolong nướng đậm đà, hòa cùng sữa dừa ngọt dịu. Hương vị thêm bùng nổ nhờ có thạch Oolong nướng nguyên chất, giòn dai.', CAST(55.00 AS Decimal(10, 2)), 3, N'https://product.hstatic.net/1000075078/product/1697442297_cloudtea-oolong-nuong-kem-dua_0907996a1d184892aace1217ef6df572.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (40, N'CloudTea Oolong Nướng Kem Cheese', N'Hội mê cheese sao có thể bỏ lỡ chiếc trà sữa siêu mlem này. Món đậm vị Oolong nướng - nền trà được yêu thích nhất hiện nay, quyện thêm kem sữa thơm béo. Đặc biệt, chinh phục ngay fan ghiền cheese bởi lớp foam phô mai mềm tan mằn mặn. Càng ngon cực với thạch Oolong nướng nguyên chất giòn dai nhai siêu thích.', CAST(55.00 AS Decimal(10, 2)), 3, N'https://product.hstatic.net/1000075078/product/1675355728_cheese_d9c6329f669b477bbf69079668392e6c.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (41, N'CloudTea Oolong Nướng Kem Dừa Đá Xay', N'Trà sữa đá xay - phiên bản nâng cấp đầy mới lạ của trà sữa truyền thống, lần đầu xuất hiện tại Nhà. Ngon khó cưỡng với lớp kem dừa béo ngậy nhưng không ngấy, thêm vụn bánh quy phô mai giòn tan vui miệng. Trà Oolong nướng rõ hương đậm vị, quyện với sữa dừa beo béo, được xay mịn cùng đá, mát rượi trong tích tắc. Đặc biệt, thạch Oolong nướng nguyên chất giúp giữ trọn vị đậm đà của trà sữa đến giọt cuối cùng.', CAST(55.00 AS Decimal(10, 2)), 3, N'https://product.hstatic.net/1000075078/product/1675329651_bg-cloudtea-daxay_660f56fceea34003b8f7b5864dc84a65.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (42, N'CloudFee Hạnh Nhân Nướng', N'Vị đắng nhẹ từ cà phê phin truyền thống kết hợp Espresso Ý, lẫn chút ngọt ngào của kem sữa và lớp foam trứng cacao, nhấn thêm hạnh nhân nướng thơm bùi, kèm topping thạch cà phê dai giòn mê ly. Tất cả cùng quyện hoà trong một thức uống làm vị giác ""thức giấc"", thơm ngon hết nấc.', CAST(49.00 AS Decimal(10, 2)), 3, N'https://product.hstatic.net/1000075078/product/1697442235_cloudfee-hanh-nhan-nuong_a061c9ad84f54dd1ac0c3247d8808da4.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (43, N'CloudFee Caramel', N'Ngon khó cưỡng bởi xíu đắng nhẹ từ cà phê phin truyền thống pha trộn với Espresso lừng danh nước Ý, quyện vị kem sữa và caramel ngọt ngọt, thêm lớp foam trứng cacao bồng bềnh béo mịn, kèm topping thạch cà phê dai giòn nhai cực cuốn. Một thức uống ""điểm mười"" cho cả ngày tươi không cần tưới.', CAST(49.00 AS Decimal(10, 2)), 3, N'https://product.hstatic.net/1000075078/product/1675329314_bg-cloudfee-caramel_883c788f07a842a29783283cf36fe0ec.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (44, N'CloudFee Hà Nội', N'Khiến bạn mê mẩn ngay ngụm đầu tiên bởi vị đắng nhẹ của cà phê phin truyền thống kết hợp Espresso Ý, quyện hòa cùng chút ngọt ngào của kem sữa, và thơm béo từ foam trứng cacao. Nhấp một ngụm rồi nhai cùng thạch cà phê dai dai giòn giòn, đúng chuẩn ""ngon quên lối về"". CloudFee Classic là món đậm vị cà phê nhất trong bộ sưu tập nhưng không quá đắng, ngậy nhưng không hề ngấy.', CAST(49.00 AS Decimal(10, 2)), 3, N'https://product.hstatic.net/1000075078/product/1675329376_bg-cloudfee-classic_981065e78f2b4c28bccd3c94354af329.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (45, N'Hi-Tea Đào Kombucha', N'Trà hoa Hibiscus 0% caffeine chua nhẹ, kết hợp cùng trà lên men Kombucha hoàn toàn tự nhiên và Đào thanh mát tạo nên Hi-Tea Đào Kombucha chua ngọt cực cuốn. Đặc biệt Kombucha Detox giàu axit hữu cơ, Đào nhiều chất xơ giúp thanh lọc cơ thể và hỗ trợ giảm cân hiệu quả. Lưu ý: Khuấy đều trước khi dùng', CAST(59.00 AS Decimal(10, 2)), 4, N'https://product.hstatic.net/1000075078/product/1686716517_kombucha-dao_8770cff45b1c43de9aecf217928d56a1.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (46, N'Hi-Tea Yuzu Kombucha', N'Trà hoa Hibiscus 0% caffeine thanh mát, hòa quyện cùng trà lên men Kombucha 100% tự nhiên và mứt Yuzu Marmalade (quýt Nhật) mang đến hương vị chua chua lạ miệng. Đặc biệt, Hi-Tea Yuzu Kombucha cực hợp cho team thích detox, muốn sáng da nhờ Kombucha Detox nhiều chất chống oxy hoá cùng Yuzu giàu vitamin C. Lưu ý: Khuấy đều trước khi dùng', CAST(59.00 AS Decimal(10, 2)), 4, N'https://product.hstatic.net/1000075078/product/1686716508_kombucha-yuzu_87b4c04d2a3d49448a0538787d2497e0.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (47, N'Hi-Tea Phúc Bồn Tử Mandarin', N'Nền trà Hibiscus thanh mát, quyện vị chua chua ngọt ngọt của phúc bồn tử 100% tự nhiên cùng quýt mọng nước mang đến cảm giác sảng khoái tức thì.', CAST(49.00 AS Decimal(10, 2)), 4, N'https://product.hstatic.net/1000075078/product/1669707649_bg-hitea-quyt-no_927d1df2bebf493d8c6778102a90c314.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (48, N'Hi-Tea Yuzu Trân Châu', N'Không chỉ nổi bật với sắc đỏ đặc trưng từ trà hoa Hibiscus, Hi-Tea Yuzu còn gây ấn tượng với topping Yuzu (quýt Nhật) lạ miệng, kết hợp cùng trân châu trắng dai giòn sần sật, nhai vu', CAST(49.00 AS Decimal(10, 2)), 4, N'https://product.hstatic.net/1000075078/product/1669736859_hi-tea-yuzu-tran-chau_cb7ff6313e664ec0ab31779717640ed4.png', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (49, N'Hi-Tea Vải', N'Chút ngọt ngào của Vải, mix cùng vị chua thanh tao từ trà hoa Hibiscus, mang đến cho bạn thức uống đúng chuẩn vừa ngon, vừa healthy.', CAST(49.00 AS Decimal(10, 2)), 4, N'https://product.hstatic.net/1000075078/product/1669736893_hi-tea-vai_0480f192e6574e42a8c62cab2b591be6.png', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (50, N'Hi-Tea Đào', N'Sự kết hợp ăn ý giữa Đào cùng trà hoa Hibiscus, tạo nên tổng thể hài hoà dễ gây “thương nhớ” cho team thích món thanh mát, có vị chua nhẹ.', CAST(49.00 AS Decimal(10, 2)), 4, N'https://product.hstatic.net/1000075078/product/1669737919_hi-tea-dao_a2b13b98764e4b5f9fab18777d896c40.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (51, N'Hi-Tea Đá Tuyết Yuzu Vải', N'Vị trà hoa Hibiscus chua chua, kết hợp cùng đá tuyết Yuzu mát lạnh tái tê, thêm miếng vải căng mọng, ngọt ngào sẽ khiến bạn thích thú ngay từ lần thử đầu tiên.', CAST(59.00 AS Decimal(10, 2)), 4, N'https://product.hstatic.net/1000075078/product/1653291175_da-tuyet-vai_4105a50bee10419aaf9862a9da6c8cac.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (52, N'Trà Xanh Latte', N'Không cần đến Tây Bắc mới cảm nhận được sự trong trẻo của núi rừng, khi Trà Xanh Latte từ Nhà được chắt lọc từ những búp trà xanh mướt, ủ mình trong sương sớm. Trà xanh Tây Bắc vị thanh, chát nhẹ hoà cùng sữa tươi nguyên kem ngọt béo tạo nên hương vị dễ uống, dễ yêu. Đây là thức uống healthy, giúp bạn tỉnh táo một cách êm mượt, xoa dịu những căng thẳng.', CAST(45.00 AS Decimal(10, 2)), 5, N'https://product.hstatic.net/1000075078/product/1697450388_tx-latte_4b852fea23d540ccbdf10a61a37c8cd3.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (53, N'Trà Xanh Latte (Nóng)', N'Trà Xanh Latte (Nóng) là phiên bản rõ vị trà nhất. Nhấp một ngụm, bạn chạm ngay vị trà xanh Tây Bắc chát nhẹ hoà cùng sữa nguyên kem thơm béo, đọng lại hậu vị ngọt ngào, êm dịu. Không chỉ là thức uống tốt cho sức khoẻ, Trà Xanh Latte (Nóng) còn là cái ôm ấm áp của đồng bào Tây Bắc gửi cho người miền xuôi.', CAST(45.00 AS Decimal(10, 2)), 5, N'https://product.hstatic.net/1000075078/product/1697450393_tx-latte-nong_b79deb1bbbe64c649ee889289f4c0c72.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (54, N'Trà Xanh Đường Đen', N'Trà Xanh Đường Đen với hiệu ứng phân tầng đẹp mắt, như phác hoạ núi đồi Tây Bắc bảng lảng trong sương mây, thấp thoáng những nương chè xanh ngát. Từng ngụm là sự hài hoà từ trà xanh đậm đà, đường đen ngọt ngào, sữa tươi thơm béo. Khuấy đều trước khi dùng, để thưởng thức đúng vị', CAST(55.00 AS Decimal(10, 2)), 5, N'https://product.hstatic.net/1000075078/product/1697450399_tx-duong-den_60f5150f774d472dbd62a6a39ff42eaf.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (55, N'Frosty Trà Xanh', N'Đá Xay Frosty Trà Xanh như lời mời mộc mạc, ghé thăm Tây Bắc vào những ngày tiết trời se lạnh, núi đèo mây phủ. Vị chát dịu, ngọt thanh của trà xanh Tây Bắc kết hợp đá xay sánh mịn, whipping cream bồng bềnh và bột trà xanh trên cùng thêm đậm vị. Đây không chỉ là thức uống mát lạnh bật mood, mà còn tốt cho sức khoẻ nhờ giàu vitamin và các chất chống oxy hoá.', CAST(59.00 AS Decimal(10, 2)), 5, N'https://product.hstatic.net/1000075078/product/1697450407_tx-frosty_b1d04892f10741b2bdae1ea1821a0e8a.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (56, N'Chocolate Đá', N'Bột chocolate nguyên chất hoà cùng sữa tươi béo ngậy, ấm nóng. Vị ngọt tự nhiên, không gắt cổ, để lại một chút đắng nhẹ, cay cay trên đầu lưỡi.', CAST(55.00 AS Decimal(10, 2)), 5, N'https://product.hstatic.net/1000075078/product/chocolate-da_877186_f901d7b2ff1d48f98abc6ef5e6e7d80f.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (57, N'Chocolate Đá Xay', N'Sữa và kem tươi béo ngọt được “cá tính hoá” bởi vị chocolate/sô-cô-la đăng đắng. Dành cho các tín đồ hảo ngọt. Lựa chọn hàng đầu nếu bạn đang cần chút năng lượng tinh thần.', CAST(58.00 AS Decimal(10, 2)), 5, N'https://product.hstatic.net/1000075078/product/chocolate-ice-blended_400940_6c850f527ec647858d15a5641a28728d.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (58, N'Frosty Phin-Gato', N'Đá Xay Frosty Phin-Gato là lựa chọn không thể bỏ lỡ cho tín đồ cà phê. Cà phê nguyên chất pha phin truyền thống, thơm đậm đà, đắng mượt mà, quyện cùng kem sữa béo ngậy và đá xay mát lạnh. Nhân đôi vị cà phê nhờ có thêm thạch cà phê đậm đà, giòn dai. Thức uống khơi ngay sự tỉnh táo tức thì. Lưu ý: Khuấy đều phần đá xay trước khi dùng', CAST(55.00 AS Decimal(10, 2)), 6, N'https://product.hstatic.net/1000075078/product/1697441914_phin-gato_5cd67f4becff41d7aa43c4b8efd22f7e.png', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (59, N'Frosty Cà Phê Đường Đen', N'Đá Xay Frosty Cà Phê Đường Đen mát lạnh, sảng khoái ngay từ ngụm đầu tiên nhờ sự kết hợp vượt chuẩn vị quen giữa Espresso đậm đà và Đường Đen ngọt thơm. Đặc biệt, whipping cream beo béo cùng thạch cà phê giòn dai, đậm vị nhân đôi sự hấp dẫn, khơi bừng sự hứng khởi trong tích tắc.', CAST(59.00 AS Decimal(10, 2)), 6, N'https://product.hstatic.net/1000075078/product/1697441939_ca-phe-duong-den_637cdf5cb4e84a3699c9609bdf04a6af.png', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (60, N'Frosty Caramel Arabica', N'Caramel ngọt thơm quyện cùng cà phê Arabica Cầu Đất đượm hương gỗ thông, hạt dẻ và nốt sô cô la đặc trưng tạo nên Đá Xay Frosty Caramel Arabica độc đáo chỉ có tại Nhà. Cực cuốn với lớp whipping cream béo mịn, thêm thạch cà phê giòn ngon bắt miệng.', CAST(59.00 AS Decimal(10, 2)), 6, N'https://product.hstatic.net/1000075078/product/1697441933_caramel-arabica_80e751b9ead844adacf5a0bd5f85a381.png', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (61, N'Frosty Bánh Kem Dâu', N'Bồng bềnh như một đám mây, Đá Xay Frosty Bánh Kem Dâu vừa ngon mắt vừa chiều vị giác bằng sự ngọt ngào. Bắt đầu bằng cái chạm môi với lớp kem whipping cream, cảm nhận ngay vị beo béo lẫn sốt dâu thơm lừng. Sau đó, hút một ngụm là cuốn khó cưỡng bởi đá xay mát lạnh quyện cùng sốt dâu ngọt dịu. Lưu ý: Khuấy đều phần đá xay trước khi dùng', CAST(59.00 AS Decimal(10, 2)), 6, N'https://product.hstatic.net/1000075078/product/1697441945_banh-kem-dau_cfadffce83b0414eaced5dd068efee2d.png', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (62, N'Frosty Choco Chip', N'Đá Xay Frosty Choco Chip, thử là đã! Lớp whipping cream bồng bềnh, beo béo lại có thêm bột sô cô la và sô cô la chip trên cùng. Gấp đôi vị ngon với sô cô la thật xay với đá sánh mịn, đậm đà đến tận ngụm cuối cùng.', CAST(59.00 AS Decimal(10, 2)), 6, N'https://product.hstatic.net/1000075078/product/1697441952_choco-chip_f909e9a6e86242a7a440cbf9d1cde6fa.png', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (63, N'Bánh Mì Gậy Gà Kim Quất', N'Phiên bản nâng cấp với trọng lượng tăng 80% so với bánh mì que thông thường, đem đến cho bạn bữa ăn nhanh gọn mà vẫn đầy đủ dinh dưỡng. Cắn một miếng là mê mẩn bởi vỏ bánh nướng giòn rụm, nhân đậm vị với từng miếng thịt gà mềm, ướp sốt kim quất chua ngọt, thơm nức đặc trưng. Càng ""đúng bài"" hơn khi thưởng thức kèm Cà phê đượm vị hoặc trà Hi-Tea thanh mát.', CAST(25.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/1669737009_banh-mi-gay-ga-kim-quat_e302b3277a224476be2f3ee31c615e08.png', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (64, N'Bánh Mì Gậy Cá Ngừ Mayo', N'Trọng lượng tăng 70% so với bánh mì que thông thường, thêm nhiều dinh dưỡng, thích hợp cho cả bữa ăn nhẹ lẫn ăn no. Ngon hết chỗ chê từ vỏ bánh nướng nóng giòn, cá ngừ đậm đà quyện lẫn sốt mayo thơm béo đến từng hạt bắp ngọt bùi hấp dẫn. Nhâm nhi bánh cùng ly Cà phê thơm nồng hay Hi-Tea tươi mát thì đúng chuẩn ""điểm mười"".', CAST(25.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/1669825303_bami-gay-tunajpg_071d512f4e3b4c73ab365130eb9e1935.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (65, N'Bánh Mì Que Pate', N'Vỏ bánh mì giòn tan, kết hợp với lớp nhân pate béo béo đậm đà sẽ là lựa chọn lý tưởng nhẹ nhàng để lấp đầy chiếc bụng đói , cho 1 bữa sáng - trưa - chiều - tối của bạn thêm phần thú vị.', CAST(15.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/1669736956_banh-mi-que-pate_574aee0f444d42abaa82d560a525b4ef.png', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (66, N'Bánh Mì Que Pate Cay', N'Vỏ bánh mì giòn tan, kết hợp với lớp nhân pate béo béo đậm đà và 1 chút cay cay sẽ là lựa chọn lý tưởng nhẹ nhàng để lấp đầy chiếc bụng đói , cho 1 bữa sáng - trưa - chiều - tối của bạn thêm phần thú vị.', CAST(15.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/banhmique_683851_e06b8c0a40b3498b8aa384f4853a24e4.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (67, N'Bánh Mì VN Thịt Nguội', N'Gói gọn trong ổ bánh mì Việt Nam là từng lớp chả, từng lớp jambon hòa quyện cùng bơ và pate thơm lừng, thêm dưa rau cho bữa sáng đầy năng lượng. *Phần bánh sẽ ngon và đậm đà nhất khi kèm pate. Để đảm bảo hương vị được trọn vẹn, Nhà mong bạn thông cảm vì không thể thay đổi định lượng pate.', CAST(35.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/1638440015_banh-mi-vietnam_4572ff903ac84ed7bf64e2868a0779e3.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (68, N'Croissant trứng muối', N'Croissant trứng muối thơm lừng, bên ngoài vỏ bánh giòn hấp dẫn bên trong trứng muối vị ngon khó cưỡng.', CAST(35.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/croissant-trung-muoi_880850_e7bd166049b648afb6c50881cccc30fe.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (69, N'Chà Bông Phô Mai', N'Chiếc bánh với lớp phô mai vàng sánh mịn bên trong, được bọc ngoài lớp vỏ xốp mềm thơm lừng. Thêm lớp chà bông mằn mặn hấp dẫn bên trên.', CAST(35.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/1669736993_cha-bong-pho-mai_4364a43f2a0349829980323f762b0c7c.png', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (70, N'Mochi Kem Phúc Bồn Tử', N'Bao bọc bởi lớp vỏ Mochi dẻo thơm, bên trong là lớp kem lạnh cùng nhân phúc bồn tử ngọt ngào. Gọi 1 chiếc Mochi cho ngày thật tươi mát. Sản phẩm phải bảo quán mát và dùng ngon nhất trong 2h sau khi nhận hàng.', CAST(19.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/1643102019_mochi-phucbontu_f8326df6a27f4df58df878b15e23f159.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (71, N'Mochi Kem Việt Quất', N'Bao bọc bởi lớp vỏ Mochi dẻo thơm, bên trong là lớp kem lạnh cùng nhân việt quất đặc trưng thơm thơm, ngọt dịu. Gọi 1 chiếc Mochi cho ngày thật tươi mát. Sản phẩm phải bảo quán mát và dùng ngon nhất trong 2h sau khi nhận hàng.', CAST(19.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/1643102034_mochi-vietquat_ea985cfb7ea54e59a38e858df7182ef3.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (72, N'Mochi Kem Dừa Dứa', N'Bao bọc bởi lớp vỏ Mochi dẻo thơm, bên trong là lớp kem lạnh cùng nhân dừa dứa thơm lừng lạ miệng. Gọi 1 chiếc Mochi cho ngày thật tươi mát. Sản phẩm phải bảo quán mát và dùng ngon nhất trong 2h sau khi nhận hàng.', CAST(19.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/1643101996_mochi-dua_2a5ce60d5a404117925739267e4437dc.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (73, N'Mochi Kem Chocolate', N'Bao bọc bởi lớp vỏ Mochi dẻo thơm, bên trong là lớp kem lạnh cùng nhân chocolate độc đáo. Gọi 1 chiếc Mochi cho ngày thật tươi mát. Sản phẩm phải bảo quán mát và dùng ngon nhất trong 2h sau khi nhận hàng.', CAST(19.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/1655348107_mochi-choco_7fe236bf59b448ffa8d0800be90c263c.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (74, N'Mochi Kem Matcha', N'Bao bọc bởi lớp vỏ Mochi dẻo thơm, bên trong là lớp kem lạnh cùng nhân trà xanh đậm vị. Gọi 1 chiếc Mochi cho ngày thật tươi mát. Sản phẩm phải bảo quán mát và dùng ngon nhất trong 2h sau khi nhận hàng.', CAST(19.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/1655348113_mochi-traxanh_bde0f0642b3d4e09a4fee852a2b40027.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (75, N'Mochi Kem Xoài', N'Bao bọc bởi lớp vỏ Mochi dẻo thơm, bên trong là lớp kem lạnh cùng nhân xoài chua chua ngọt ngọt. Gọi 1 chiếc Mochi cho ngày thật tươi mát. Sản phẩm phải bảo quán mát và dùng ngon nhất trong 2h sau khi nhận hàng.', CAST(19.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/1643101968_mochi-xoai_95decc9f0f0d4f37a841ab6fab8c6436.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (76, N'Mousse Red Velvet', N'Bánh nhiều lớp được phủ lớp kem bên trên bằng Cream cheese.', CAST(35.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/5dd2087ff2546c2614fb08d1_red-velvet_087977_9b4d82415d384286975d73830b5c7f9a.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (77, N'Mousse Tiramisu', N'Hương vị dễ ghiền được tạo nên bởi chút đắng nhẹ của cà phê, lớp kem trứng béo ngọt dịu hấp dẫn', CAST(35.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/1638170137_tiramisu_bfa19481f2ae4ffd8ec696bfd040adf3.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (78, N'Mousse Gấu Chocolate', N'Với vẻ ngoài đáng yêu và hương vị ngọt ngào, thơm béo nhất định bạn phải thử ít nhất 1 lần.', CAST(39.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/1638170066_gau_264637ab90e8417c872a11b55515d20d.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (79, N'Mít Sấy', N'Mít sấy khô vàng ươm, giòn rụm, giữ nguyên được vị ngọt lịm của mít tươi.', CAST(20.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/mit-say_666228_bddcae8ad43142a493eafa83544bdae4.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (80, N'Gà Xé Lá Chanh', N'Thịt gà được xé tơi, mang hương vị mặn, ngọt, cay cay quyện nhau vừa chuẩn, thêm chút thơm thơm thơm từ lá chanh sấy khô giòn giòn xua tan ngay cơn buồn miệng.', CAST(25.00 AS Decimal(10, 2)), 7, N'https://product.hstatic.net/1000075078/product/kho-ga-la-chanh_995862_c7d3a627e1234da69150a9230de033b4.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (81, N'Cà Phê Đen Đá Hộp (14 gói x 16g)', N'Cà Phê Đen Đá hoà tan The Coffee House với 100% hạt cà phê Robusta mang đến hương vị mạnh cực bốc, đậm đắng đầy lôi cuốn, đúng gu người Việt.', CAST(58.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1697446954_ca-phe-den-da-hop_9903f4390fd144c3a2ddc5a0b1f06bb4.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (82, N'Cà Phê Đen Đá Túi (30 gói x 16g)', N'Cà Phê Đen Đá hoà tan The Coffee House với 100% hạt cà phê Robusta mang đến hương vị mạnh cực bốc, đậm đắng đầy lôi cuốn, đúng gu người Việt.', CAST(110.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1697446642_ca-phe-den-da-tui_5cc117543b714890b2797279ed409a83.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (83, N'Thùng Cà Phê Sữa Espresso', N'Được sản xuất theo công nghệ Nhật, Cà Phê Sữa Espresso The Coffee House giữ trọn hương vị đậm đà của 100% cà phê Robusta nguyên chất quyện hoà cùng sữa béo thơm lừng. Bật nắp trải nghiệm ngay chất cà phê mạnh mẽ giúp sảng khoái tức thì, tuôn trào hứng khởi', CAST(336.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1669707271_24lon-espresso-no_4d9e764590f94af399b30071c4b8b6f0.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (84, N'Combo 6 Lon Cà Phê Sữa Espresso', N'Được sản xuất theo công nghệ Nhật, Cà Phê Sữa Espresso The Coffee House giữ trọn hương vị đậm đà của 100% cà phê Robusta nguyên chất quyện hoà cùng sữa béo thơm lừng. Bật nắp trải nghiệm ngay chất cà phê mạnh mẽ giúp sảng khoái tức thì, tuôn trào hứng khởi', CAST(84.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1669707292_6lon-espresso-no_d98906aba47a4ff7bb5fd83e7244bbbd.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (85, N'Cà Phê Rang Xay Original 1 Túi 1KG', N'Cà phê Original 1 của The Coffee House với 100% thành phần cà phê Robusta Đăk Lăk, vùng trồng cà phê ngon nhất Việt Nam. Bằng cách áp dụng kỹ thuật rang xay hiện đại, Cà phê Original 1 mang đến trải nghiệm tuyệt vời khi uống cà phê tại nhà với hương vị đậm đà truyền thống hợp khẩu vị của giới trẻ sành cà phê.', CAST(235.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1684727946_photo-2023-05-22-105837_fb23439a42c743e19f37199732563334.jpeg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (86, N'Cà Phê Rang Xay Original 1 250g', N'Cà phê Original 1 của The Coffee House với thành phần chính cà phê Robusta Đắk Lắk, vùng trồng cà phê nổi tiếng nhất Việt Nam. Bằng cách áp dụng kỹ thuật rang xay hiện đại, Cà phê Original 1 mang đến trải nghiệm tuyệt vời khi uống cà phê tại nhà với hương vị đậm đà truyền thống hợp khẩu vị của giới trẻ sành cà phê.', CAST(60.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1639648297_ca-phe-rang-xay-original-1-250gr_3f68e8075d4c41e6a302857ffd9f332d.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (87, N'Cà Phê Sữa Đá Hòa Tan (10 gói x 22g)', N'Thật dễ dàng để bắt đầu ngày mới với tách cà phê sữa đá sóng sánh, thơm ngon như cà phê pha phin. Vị đắng thanh của cà phê hoà quyện với vị ngọt béo của sữa, giúp bạn luôn tỉnh táo và hứng khởi cho ngày làm việc thật hiệu quả.', CAST(44.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/cpsd-3in1_971575_f7c93ba8a9b1402a994777a3d50e69c7.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (88, N'Cà Phê Sữa Đá Hòa Tan Túi 25x22G', N'Thật dễ dàng để bắt đầu ngày mới với tách cà phê sữa đá sóng sánh, thơm ngon như cà phê pha phin. Vị đắng thanh của cà phê hoà quyện với vị ngọt béo của sữa, giúp bạn luôn tỉnh táo và hứng khởi cho ngày làm việc thật hiệu quả.', CAST(99.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1639648355_ca-phe-sua-da-hoa-tan-tui-25x22gr_4977ec42768c47349d6594bbd4ac04bf.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (89, N'Cà Phê Hoà Tan Đậm Vị Việt (18 gói x 16 gam)', N'Bắt đầu ngày mới với tách cà phê sữa “Đậm vị Việt” mạnh mẽ sẽ giúp bạn luôn tỉnh táo và hứng khởi cho ngày làm việc thật hiệu quả.', CAST(48.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1639648313_ca-phe-sua-da-hoa-tan-dam-vi-viet_c2c8f3a4d73d4ef19e13764a16827fa1.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (90, N'Cà Phê Hòa Tan Đậm Vị Việt Túi 40x16G', N'Bắt đầu ngày mới với tách cà phê sữa “Đậm vị Việt” mạnh mẽ sẽ giúp bạn luôn tỉnh táo và hứng khởi cho ngày làm việc thật hiệu quả.', CAST(99.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1669707374_1642353251-ca-phe-dam-vi-viet-tui-new_17df90f4c4624164a7e6ab95f99a8c82.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (91, N'Cà Phê Sữa Đá Pack 6 Lon', N'Với thiết kế lon cao trẻ trung, hiện đại và tiện lợi, Cà phê sữa đá lon thơm ngon đậm vị của The Coffee House sẽ đồng hành cùng nhịp sống sôi nổi của tuổi trẻ và giúp bạn có được một ngày làm việc đầy hứng khởi.', CAST(84.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/p6-lon-3in1_717216_d15357f24ebe4d29bd54b30c3cc11144.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (92, N'Thùng 24 Lon Cà Phê Sữa Đá', N'Với thiết kế lon cao trẻ trung, hiện đại và tiện lợi, Cà phê sữa đá lon thơm ngon đậm vị của The Coffee House sẽ đồng hành cùng nhịp sống sôi nổi của tuổi trẻ và giúp bạn có được một ngày làm việc đầy hứng khởi.', CAST(336.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/24-lon-cpsd_225680_fe4ea1e64502430e971e7fe3c15f791f.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (93, N'Trà Vị Đào Tearoma 14x14g', N'Được chiết xuất từ 100% trà tự nhiên, không phẩm màu tổng hợp, Trà vị Đào Tearoma mang đến cảm giác thanh mát cực đã. Nhấp một ngụm, cảm nhận trọn vị đào chua ngọt thơm ngon bùng nổ. Ngoài ra, trà còn bổ sung vitamin C cực kỳ có lợi cho sức khoẻ.', CAST(32.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1669706771_bg-tradao-min_c854b114941941a7b2e8db58eac7467c.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (94, N'Trà Sữa Trân Châu Tearoma 250g', N'Chỉ 2 phút có ngay ly Trà sữa trân châu ngon chuẩn vị quán. Thơm vị trà, béo vị sữa, cùng trân châu thật giòn dai sật sật. Đặc biệt, đây còn là thức uống tốt cho sức khoẻ nhờ thành phần 100% chiết xuất trà tự nhiên, không chất hoá học.', CAST(38.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1669880647_bg-trasua-min_91c425aa6b894426906b001d19bc86b3.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (95, N'Trà Vị Tắc Mật Ong Tearoma 14x14g', N'Thổi bùng sảng khoái cùng Trà vị Tắc Mật Ong Tearoma không phẩm màu tổng hợp. Chiết xuất từ 100% trà tự nhiên, bổ sung vitamin C tốt cho sức khoẻ. Vị tắc chua chua hoà cùng mật ong ngọt dịu giúp bật vị giác, bừng vị mát tức thì.', CAST(32.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1669706748_bg-tratatmatong-min_06c36ebf8cb049cc81231963b562eee2.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (96, N'Trà Oolong Túi Lọc Tearoma 20x2G', N'Trà Oolong túi lọc với mùi hương dịu nhẹ hoàn toàn từ tự nhiên, vị hậu ngọt, và hương thơm tinh tế. Trà túi lọc Tearoma tiện lợi để sử dụng tại văn phòng, tại nhà,... nhưng vẫn đảm bảo được chất lượng về hương trà tinh tế, vị trà đậm đà.', CAST(28.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1639646968_tra-oolong-tui-loc-tearoma-20x2gr_c2711a73548f467f8f43c89731123c01.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (97, N'Trà Lài Túi Lọc Tearoma 20x2G', N'Trà túi lọc Tearoma hương lài thơm tinh tế, thanh mát, trên nền trà xanh đậm đà khó quên. Trà túi lọc Tearoma tiện lợi để sử dụng tại văn phòng, tại nhà,.. nhưng vẫn đảm bảo được chất lượng về hương trà tinh tế, vị trà đậm đà.', CAST(28.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1639647075_tra-lai-tui-loc-tearoma-20x2gr_5eb9f80bcb334381ae689cb01d650d6c.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (98, N'Trà Sen Túi Lọc Tearoma 20x2G', N'Trà túi lọc Tearoma hương sen tinh tế, thanh mát, trên nền trà xanh đậm đà khó quên. Trà túi lọc Tearoma tiện lợi để sử dụng tại văn phòng, tại nhà, đi du lịch,... nhưng vẫn đảm bảo được chất lượng về hương trà tinh tế, vị trà đậm đà.', CAST(28.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1639648068_tra-sen-tui-loc-tearoma-20x2gr_a75ef3779c1c444a80022d1d7ff3bcb1.jpg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (99, N'Trà Đào Túi Lọc Tearoma 20x2G', N'Trà túi lọc Tearoma hương đào với hương thơm tinh tế và hoàn toàn tự nhiên, cùng nền trà đen đậm vị khó quên. Trà túi lọc Tearoma tiện lợi để sử dụng tại văn phòng, tại nhà,.. nhưng vẫn đảm bảo được chất lượng về hương trà tinh tế, vị trà đậm đà.', CAST(28.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1639646846_tra-dao-tui-loc-tearoma-20x2gr_d7a3e2d66e3d4a1abb4a997f44479f32.jpg', 0)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (100, N'Giftset Trà Tearoma', N'Hộp quà tặng với 4 hộp trà túi lọc Tearoma các loại là món quà thật ý nghĩa cho những người thân yêu.', CAST(166.00 AS Decimal(10, 2)), 8, N'https://product.hstatic.net/1000075078/product/1641440575_gift-set-tearoma-1_9778e2767bb348508f530475e92287c1.jpeg', 0)
INSERT [dbo].[products] ([id], [name], [description], [price], [category_id], [image_link], [discount]) VALUES (111, N'Loại mới', N'abc', CAST(500.00 AS Decimal(10, 2)), 8, N'https://img4.thuthuatphanmem.vn/uploads/2020/06/22/anh-nen-anime-cho-dien-thoai_092516282.jpg', NULL)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__admin__F3DBC572EB903582]    Script Date: 14/12/2023 12:55:01 ******/
ALTER TABLE [dbo].[admin] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD FOREIGN KEY([customers_id])
REFERENCES [dbo].[customers] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([bill_id])
REFERENCES [dbo].[bill] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
USE [master]
GO
ALTER DATABASE [Assignment] SET  READ_WRITE 
GO
