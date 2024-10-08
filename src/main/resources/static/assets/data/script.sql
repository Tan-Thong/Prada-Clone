USE [master]
GO
/****** Object:  Database [Prada]    Script Date: 27/09/2024 8:42:38 CH ******/
CREATE DATABASE [Prada]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prada', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Prada.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prada_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Prada_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prada].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prada] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prada] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prada] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prada] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prada] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prada] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prada] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prada] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prada] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prada] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prada] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prada] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prada] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prada] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prada] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Prada] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prada] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prada] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prada] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prada] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prada] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prada] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prada] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Prada] SET  MULTI_USER 
GO
ALTER DATABASE [Prada] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prada] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prada] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prada] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prada] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Prada] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Prada] SET QUERY_STORE = ON
GO
ALTER DATABASE [Prada] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Prada]
GO
/****** Object:  Table [cart_items]    Script Date: 27/09/2024 8:42:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [cart_items](
	[cart_item_id] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[cart_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [carts]    Script Date: 27/09/2024 8:42:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [carts](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [categories]    Script Date: 27/09/2024 8:42:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[gender] [int] NOT NULL,
	[category_name] [varchar](255) NULL,
	[parent_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [colors]    Script Date: 27/09/2024 8:42:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [colors](
	[color_id] [varchar](255) NOT NULL,
	[color_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[color_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [invoice_items]    Script Date: 27/09/2024 8:42:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [invoice_items](
	[invoice_item_id] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[invoice_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[invoice_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [invoices]    Script Date: 27/09/2024 8:42:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [invoices](
	[invoice_id] [int] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NULL,
	[first_name] [varchar](255) NULL,
	[invoice_date] [date] NULL,
	[last_name] [varchar](255) NULL,
	[message] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[total_amount] [float] NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [products]    Script Date: 27/09/2024 8:42:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](2000) NULL,
	[gender] [bit] NOT NULL,
	[image] [varchar](255) NULL,
	[material] [varchar](255) NULL,
	[product_name] [varchar](255) NULL,
	[price] [float] NOT NULL,
	[stock] [int] NOT NULL,
	[category_id] [int] NULL,
	[color_id] [varchar](255) NULL,
	[is_like] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [roles]    Script Date: 27/09/2024 8:42:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [users]    Script Date: 27/09/2024 8:42:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NULL,
	[email] [varchar](100) NULL,
	[enabled] [bit] NOT NULL,
	[full_name] [varchar](100) NULL,
	[password] [varchar](255) NULL,
	[phone] [varchar](15) NULL,
	[user_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [users_roles]    Script Date: 27/09/2024 8:42:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [users_roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [wist_list]    Script Date: 27/09/2024 8:42:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [wist_list](
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [wist_list_items]    Script Date: 27/09/2024 8:42:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [wist_list_items](
	[wish_list_id] [int] NOT NULL,
	[items_product_id] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [cart_items] ON 

INSERT [cart_items] ([cart_item_id], [price], [quantity], [cart_id], [product_id]) VALUES (53, 4800, 1, 1, 1)
SET IDENTITY_INSERT [cart_items] OFF
GO
SET IDENTITY_INSERT [carts] ON 

INSERT [carts] ([cart_id]) VALUES (1)
SET IDENTITY_INSERT [carts] OFF
GO
SET IDENTITY_INSERT [categories] ON 

INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (1, 3, N'Clothes', NULL)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (2, 3, N'Bags', NULL)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (3, 3, N'Shoes', NULL)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (4, 2, N'Dresses', 1)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (5, 1, N'Jackets and coats', 1)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (6, 1, N'Shirts', 1)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (7, 1, N'Messenger bags', 2)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (8, 1, N'Backpacks and Belt Bags', 2)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (9, 3, N'Totes', 2)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (10, 1, N'Briefcases', 2)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (11, 3, N'Sneakers', 3)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (12, 1, N'Boots', 3)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (13, 1, N'Driving shoes', 3)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (14, 1, N'Suits', 1)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (15, 3, N'Denim', 1)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (16, 2, N'Shirts and tops', 1)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (17, 2, N'Skirts', 1)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (18, 2, N'Top handles', 2)
INSERT [categories] ([category_id], [gender], [category_name], [parent_id]) VALUES (19, 2, N'Mini bags', 2)
SET IDENTITY_INSERT [categories] OFF
GO
INSERT [colors] ([color_id], [color_name]) VALUES (N'#000000', N'Black')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#0161e9', N'Mid Blue')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#0e4573', N'Navy')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#167beb', N'Sapphire Blue')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#2d5c41', N'Billiard Green')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#2f394c', N'Baltic Blue')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#443232', N'Dark Brown')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#463b2a', N'Camouflage Green')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#48a049', N'Green')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#4a3731', N'Ebony')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#59ace8', N'Periwinkle Blue')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#7aad96', N'Sage Green')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#863f2b', N'Cocoa Brown')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#8c8a8f', N'Iron Gray')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#999a95', N'Slate Gray')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#a4bec8', N'Light Blue')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#a86738', N'Cognac')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#ab7c44', N'Tobacco')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#c2c3c3', N'Grey')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#cca17e', N'Cork Beige')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#ccdde8', N'Sky Blue')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#ce9860', N'Caramel')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#d1e1d7', N'Chlorophyll Green')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#d2d2d2', N'Steel Gray')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#d3e1c7', N'Aqua')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#d5bba1', N'Ecru')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#d5d2d3', N'Crystal')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#d8c7b0', N'Tan')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#dcdbe1', N'Cornflower')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#e2e2cd', N'Marigold')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#e5d5bd', N'Desert Beige')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#e6ccc1', N'Powder Pink')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#e775a4', N'Azalea Red')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#e9ddcf', N'Grayish White')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#f0e5d6', N'Natural')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#f3d6da', N'Pink')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#f4e3eb', N'Alabaster Pink')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#f5e5cb', N'Ivory')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#f6e2c4', N'Albino White')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#faf1df', N'Vanilla')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#ffa2ba', N'Begonia Pink')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#ffbf97', N'Apricot')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#ffde57', N'Yellow')
INSERT [colors] ([color_id], [color_name]) VALUES (N'#ffffff', N'White')
GO
SET IDENTITY_INSERT [invoice_items] ON 

INSERT [invoice_items] ([invoice_item_id], [price], [quantity], [invoice_id], [product_id]) VALUES (1, 5200, 2, 1, 28)
INSERT [invoice_items] ([invoice_item_id], [price], [quantity], [invoice_id], [product_id]) VALUES (2, 1890, 1, 1, 59)
INSERT [invoice_items] ([invoice_item_id], [price], [quantity], [invoice_id], [product_id]) VALUES (3, 5200, 1, 2, 51)
INSERT [invoice_items] ([invoice_item_id], [price], [quantity], [invoice_id], [product_id]) VALUES (4, 1790, 1, 3, 60)
INSERT [invoice_items] ([invoice_item_id], [price], [quantity], [invoice_id], [product_id]) VALUES (5, 2600, 1, 4, 28)
INSERT [invoice_items] ([invoice_item_id], [price], [quantity], [invoice_id], [product_id]) VALUES (6, 1020, 1, 5, 32)
INSERT [invoice_items] ([invoice_item_id], [price], [quantity], [invoice_id], [product_id]) VALUES (7, 2450, 1, 6, 19)
INSERT [invoice_items] ([invoice_item_id], [price], [quantity], [invoice_id], [product_id]) VALUES (8, 9900, 1, 6, 8)
INSERT [invoice_items] ([invoice_item_id], [price], [quantity], [invoice_id], [product_id]) VALUES (9, 3950, 1, 6, 52)
INSERT [invoice_items] ([invoice_item_id], [price], [quantity], [invoice_id], [product_id]) VALUES (10, 3780, 2, 8, 59)
INSERT [invoice_items] ([invoice_item_id], [price], [quantity], [invoice_id], [product_id]) VALUES (11, 7680, 4, 9, 63)
SET IDENTITY_INSERT [invoice_items] OFF
GO
SET IDENTITY_INSERT [invoices] ON 

INSERT [invoices] ([invoice_id], [address], [first_name], [invoice_date], [last_name], [message], [phone], [total_amount], [user_id]) VALUES (1, N'328, Nguy?n Th? Nê, ?p Phú Hi?p, xa Phú Hòa Ðông, huy?n C? Chi, thành ph? H? Chí Minh', N'Thông', CAST(N'2024-08-28' AS Date), N'Lê', N'abc', N'0348807764', 7090, 2)
INSERT [invoices] ([invoice_id], [address], [first_name], [invoice_date], [last_name], [message], [phone], [total_amount], [user_id]) VALUES (2, N'328, Nguy?n Th? Nê, ?p Phú Hi?p, xa Phú Hòa Ðông, huy?n C? Chi, thành ph? H? Chí Minh', N'Thông', CAST(N'2024-08-28' AS Date), N'Lê', N'null', N'0348807764', 5200, 2)
INSERT [invoices] ([invoice_id], [address], [first_name], [invoice_date], [last_name], [message], [phone], [total_amount], [user_id]) VALUES (3, N'328, Nguy?n Th? Nê, ?p Phú Hi?p, xa Phú Hòa Ðông, huy?n C? Chi, thành ph? H? Chí Minh', N'Thông', CAST(N'2024-08-28' AS Date), N'Lê', N'abc', N'0348807764', 1790, 2)
INSERT [invoices] ([invoice_id], [address], [first_name], [invoice_date], [last_name], [message], [phone], [total_amount], [user_id]) VALUES (4, N'328, Nguy?n Th? Nê, ?p Phú Hi?p, xa Phú Hòa Ðông, huy?n C? Chi, thành ph? H? Chí Minh', N'Thông', CAST(N'2024-08-28' AS Date), N'Lê', N'null', N'0348807764', 2600, 2)
INSERT [invoices] ([invoice_id], [address], [first_name], [invoice_date], [last_name], [message], [phone], [total_amount], [user_id]) VALUES (5, N'328, Nguy?n Th? Nê, ?p Phú Hi?p, xa Phú Hòa Ðông, huy?n C? Chi, thành ph? H? Chí Minh', N'Thông', CAST(N'2024-08-28' AS Date), N'Lê', N'abc', N'0348807764', 1020, 1)
INSERT [invoices] ([invoice_id], [address], [first_name], [invoice_date], [last_name], [message], [phone], [total_amount], [user_id]) VALUES (6, N'Long An', N'Trung', CAST(N'2024-08-30' AS Date), N'Nguyen Van', N'No problem', N'0123456789', 16300, 2)
INSERT [invoices] ([invoice_id], [address], [first_name], [invoice_date], [last_name], [message], [phone], [total_amount], [user_id]) VALUES (8, N'Ca Mau', N'Tan', CAST(N'2024-09-13' AS Date), N'Thong', N'No problem', N'0348807764', 3780, 2)
INSERT [invoices] ([invoice_id], [address], [first_name], [invoice_date], [last_name], [message], [phone], [total_amount], [user_id]) VALUES (9, N'100 du?ng 490 ?p 2', N'Lê van', CAST(N'2024-09-13' AS Date), N'thông', N'No problem', N'0348807764', 7680, 2)
SET IDENTITY_INSERT [invoices] OFF
GO
SET IDENTITY_INSERT [products] ON 

INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (1, N'A rediscovery of formal elegance from a contemporary perspective inspires the design of this wool coat characterized by its tailored cut with timeless style.', 1, N'Jackets-and-coats-men-sp1.avif', N'Virgin wool', N'Single-breasted wool coat', 4800, 3, 5, N'#0e4573', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (2, N'The timeless elegance of tailored garments comes to life in the refined design of this double-breasted wool jacket. The contoured silhouette with a clean cut is enriched with peak lapels and decorated with the signature touch of the iconic triangle logo.', 1, N'Jackets-and-coats-men-sp2.avif', N'Virgin wool', N'Double-breasted wool jacket', 4400, 2, 5, N'#4a3731', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (3, N'The tailored silhouette of this wool jacket reinterprets a menswear classic with new proportions, enhancing its timeless style in a rediscovery of formal elegance reinterpreted in a contemporary way.', 1, N'Jackets-and-coats-men-sp3.avif', N'Wool', N'Single-breasted wool jacket', 4800, 5, 5, N'#999a95', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (4, N'Classic lines and sporty details elevated by sartorial rigor define this single-breasted coat with contemporary charm.', 1, N'Jackets-and-coats-men-sp4.avif', N'Virgin wool', N'Single-breasted wool blend coat', 6400, 2, 5, N'#0e4573', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (5, N'The classically elegant silhouette of this coat is reinterpreted with contemporary proportions, clean lines and refined details. The wool coat with a boxy cut is defined by classic notch lapels and back vent, while the knit triangle logo completes the garment with its iconic geometric shape.', 1, N'Jackets-and-coats-men-sp5.avif', N'Virgin wool', N'Single-breasted wool coat', 5100, 2, 5, N'#999a95', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (6, N'The refined design of this coat in fine wool and mohair is characterized by its wide welt pockets, raglan sleeves, and back vent.', 1, N'Jackets-and-coats-men-sp6.avif', N'Virgin wool', N'Wool and mohair coat', 4300, 8, 5, N'#c2c3c3', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (7, N'Formal lines are reimagined in modernist designs and classic sartorial details are renewed and streamlined in a sophisticated process of reduction. This jacket made of fine mohair wool blends different souls and inspirations, evoking contemporary craftsmanship.', 1, N'Jackets-and-coats-men-sp7.avif', N'Virgin wool', N'Single-breasted mohair wool jacket', 4500, 50, 5, N'#c2c3c3', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (8, N'This cashmere and silk jacket combines pragmatic details and fine materials in a stylish casual design. The warm, enveloping hooded silhouette is defined by refined elements and details with contemporary charm. The garment is embellished with the enameled metal triangle logo that adds its iconic signature touch.', 1, N'Jackets-and-coats-men-sp8.avif', N'Cashmere', N'Cashmere and silk jacket', 9900, 3, 5, N'#f6e2c4', 1)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (9, N'Strong graphic contrasts define Double Match shirts, animated by the dualities and contrasts emblematic of the brand. This cotton garment with a sporty oversized fit is characterized by the distinctive bowling collar. Half of the shirt is enriched by a geometric print. The triangle logo printed on the breast pocket completes the silhouette with retro charm.', 1, N'Skirt-men-sp1.avif', N'Cotton', N'Double Match cotton shirt', 1890, 50, 6, N'#faf1df', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (10, N'Strong graphic contrasts define Double Match shirts, animated by the dualities and contrasts emblematic of the brand. This cotton garment with a sporty oversized fit is characterized by the distinctive bowling collar. Half of the shirt is enriched with a refined geometric motif. The triangle logo printed on the breast pocket completes the silhouette with retro charm.', 1, N'Skirt-men-sp2.avif', N'Cotton', N'Double Match cotton shirt', 1890, 50, 6, N'#d5d2d3', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (11, N'Strong graphic contrasts define Double Match shirts, animated by the dualities and contrasts emblematic of the brand. This cotton garment features a sporty oversized cut characterized by the distinctive bowling collar and enriched by the iconic Lipstick print contrasting with a geometric motif. The triangle logo printed on the breast pocket completes the silhouette with retro charm.', 1, N'Skirt-men-sp3.avif', N'Cotton', N'Double Match cotton shirt', 1890, 100, 6, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (12, N'Strong graphic contrasts define Double Match shirts, animated by the dualities and contrasts emblematic of the brand. This silk garment with a sporty oversized fit is characterized by the distinctive bowling collar and enriched by two contrasting prints. The triangle logo printed on the breast pocket completes the silhouette with retro charm.', 1, N'Skirt-men-sp4.avif', N'Silk', N'Double Match silk shirt', 2200, 100, 6, N'#ffffff', 1)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (13, N'Contrasting graphic prints enliven the Double Match shirt made of cotton, playing with the concepts of duality and juxtaposition that are inherent in the Prada aesthetic. The two diametrically opposed sides revolutionize the classic short-sleeved silhouette with bowling collar. The design combines a simple sporty cut with archive prints in brilliant colors, while the triangle logo printed on the breast pocket completes the garment with retro charm.', 1, N'Skirt-men-sp5.avif', N'Cotton', N'Short-sleeved cotton shirt', 1890, 100, 6, N'#48a049', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (14, N'Strong graphic contrasts define Double Match shirts, animated by the dualities and contrasts emblematic of the brand. This cotton garment features a sporty oversized cut characterized by the distinctive bowling collar and enriched by a floral print contrasting with a stripe motif. The triangle logo printed on the breast pocket completes the silhouette with retro charm.', 1, N'Skirt-men-sp6.avif', N'Cotton', N'Double Match cotton shirt', 1890, 60, 6, N'#ffde57', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (15, N'This shirt with a Cuban collar combines a sporty attitude and retro inspiration in a design with a refined allure. This style, with an oversized silhouette, is made of silk twill and features a vibrant Argyle print with vintage charm. Embellished with mother-of-pearl buttons, it sports the iconic fabric triangle logo.', 1, N'Skirt-men-sp7.avif', N'Silk', N'Short-sleeved Argyle-pattern silk twill shirt', 1920, 100, 6, N'#4a3731', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (16, N'This shirt with a Cuban collar combines a sporty attitude and retro inspiration in a design with a refined allure. This style, with an oversized silhouette, is made of silk twill and features a vibrant Argyle print with vintage charm. Embellished with mother-of-pearl buttons, it sports the iconic fabric triangle logo.', 1, N'Skirt-men-sp8.avif', N'Silk', N'Short-sleeved Argyle-pattern silk twill shirt', 1920, 80, 6, N'#0e4573', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (17, N'This bag with a casual attitude features a clean, sleek silhouette, emphasized by the buttery touch of soft grain leather. The accessory with a minimalist design and adjustable shoulder strap is enriched with simple yet refined details, an expression of the brand''s artisan know-how. The style is completed by the elegant lettering logo that enhances the refined simplicity of the accessory.', 1, N'Messenger-bag-men-sp1.avif', N'Leather', N'Leather shoulder bag', 3600, 50, 7, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (18, N'This bag with a casual attitude features a clean, sleek silhouette, emphasized by the buttery touch of soft grain leather. The accessory with a minimalist design and adjustable shoulder strap is enriched with simple yet refined details, an expression of the brand''s artisan know-how. The style is completed by the elegant lettering logo that enhances the refined simplicity of the accessory.', 1, N'Messenger-bag-men-sp2.avif', N'Leather', N'Leather shoulder bag', 3600, 50, 7, N'#ce9860', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (19, N'This leather shoulder bag features a pragmatic design emphasized by the versatility of Re-Nylon, the innovative regenerated nylon yarn that is an emblem of the brand. The accessory with a functional silhouette has several zipper pockets and is embellished with leather details and the iconic enameled metal triangle logo.', 1, N'Messenger-bag-men-sp3.avif', N'Fabric / leather', N'Re-Nylon and leather shoulder bag', 2450, 18, 7, N'#cca17e', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (20, N'This Re-Nylon backpack with an iconic design and timeless style stands out for its innovative, functional, and refined character. The accessory, a perfect synthesis of Prada codes, is reinterpreted in regenerated nylon with details enriching the versatile silhouette decorated with the signature touch of the triangle logo.  The archive style is enhanced with the leather shoulder strap with metal buckle that completes the backpack with a contemporary touch.', 1, N'Backpacks-and-Belt-Bags-men-sp1.avif', N'Fabric / leather', N'Re-Nylon backpack', 3290, 100, 8, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (21, N'This leather shoulder bag with geometric, modernist lines has a versatile design with contemporary charm. The compact style made of soft leather has functional but refined details like roomy utility-style pockets and side-release buckle. The accessory with an adjustable shoulder strap for cross-body wear is completed by the signature touch of the iconic enameled metal triangle logo. ', 1, N'Backpacks-and-Belt-Bags-men-sp2.avif', N'Leather', N'Leather shoulder bag', 3100, 100, 8, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (22, N'A refined architecture with clean lines defines the Prada Buckle bag, expression of a dual aesthetic that moves between simplicity and detail, functionality and elegance. The soft leather style, characterized by a nappa leather interior, summarizes the brand''s codes in a pragmatic yet sophisticated design. The spacious silhouette is characterized by a multifaceted soul, expressed by the interchangeable belt with iconic buckle that enriches the accessory with a unique and contemporary touch.', 1, N'Totes-men-sp1.avif', N'Leather', N'Prada Buckle leather bag with belt', 6900, 100, 9, N'#443232', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (23, N'This elegant and pragmatic briefcase features a structured silhouette with clean lines enriched by the unmistakable crosshatch pattern of Saffiano leather. The spacious and versatile bag, which comes with an adjustable shoulder strap, is completed by the iconic enameled metal triangle logo.', 1, N'Briefcases-men-sp1.avif', N'Leather', N'Saffiano leather briefcase', 4600, 100, 10, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (24, N'Made of Re-Nylon with Saffiano leather details, this briefcase combines two of Prada''s iconic materials in an elegant and versatile design. The roomy accessory with a functional zipper closure and detachable shoulder strap is embellished with the enameled metal triangle logo. For sustainable care to preserve the product''s characteristics and reduce microfiber shedding, we recommend not washing the item too often. Let the product air out after every use and have it dry cleaned at a specialized ecological dry cleaners.', 1, N'Briefcases-men-sp2.avif', N'Fabric / leather', N'Re-Nylon and Saffiano leather briefcase', 2650, 50, 10, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (25, N'This pragmatic and refined briefcase is made of Re-Nylon, the sustainable evolution of a distinctive material of Prada collections. Enhanced with Saffiano leather details, the style made of regenerated nylon presents a versatile and functional structure characterized by two compartments, several zipper pockets, and a trolley band. The roomy accessory, which can also be transformed into a backpack if needed, is completed by the iconic signature of the enameled metal triangle logo. For sustainable care to preserve the product''s characteristics and reduce microfiber shedding, we recommend not washing the item too often. Let the product air out after every use and have it dry cleaned at a specialized ecological dry cleaners.', 1, N'Briefcases-men-sp3.avif', N'Fabric / leather', N'Re-Nylon and Saffiano leather briefcase', 3450, 100, 10, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (26, N'A curve-edged leather briefcase with metal Prada lettering. The case has two handles, a detachable shoulder strap and name tag. The inside has dedicated spaces for an iPad and two smartphones.', 1, N'Briefcases-men-sp4.avif', N'Leather', N'Saffiano Leather Work Bag', 4100, 50, 10, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (27, N'This elegant and refined briefcase is characterized by its functional structure composed of two compartments, a removable name tag, various internal pockets, and a detachable nylon and leather shoulder strap. Made of Saffiano leather, an iconic material of the brand, the accessory is decorated with the emblematic enameled metal triangle logo, which first appeared in 1913 on trunks designed by Mario Prada.', 1, N'Briefcases-men-sp5.avif', N'Leather', N'Saffiano leather briefcase', 4600, 100, 10, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (28, N'This silk twill mini-dress has a shirt-dress silhouette brightened by a paisley print. Embellished with a refined bow collar, the style with simple yet sophisticated details is decorated with the iconic geometric shape of the fabric triangle logo. ', 0, N'Dresses-women-sp1.avif', N'Silk', N'Printed silk twill mini-dress', 2600, 0, 4, N'#f4e3eb', 1)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (29, N'These sporty and versatile sneakers are made of suede with a faded effect that gives character to the contemporary design decorated with the triangle logo.', 1, N'Sneakers-men-sp1.avif', N'Leather', N'Trail faded suede sneakers', 1100, 100, 11, N'#443232', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (30, N'These fabric sneakers defined by contemporary, minimalist details have a sporty design with clean, classic lines. The versatile, casual style characterized by light rubber soles features a modern interpretation of the triangle logo, reinterpreted in rubber and applied on the upper in the same color. ', 1, N'Sneakers-men-sp2.avif', N'Fabric', N'Printed cotton sneakers', 1050, 1000, 11, N'#f0e5d6', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (31, N'These fabric sneakers defined by contemporary, minimalist details have a sporty design with clean, classic lines. The versatile, casual style characterized by light rubber soles features a modern interpretation of the triangle logo, reinterpreted in rubber and applied on the upper in the same color. ', 1, N'Sneakers-men-sp3.avif', N'Fabric', N'Printed cotton sneakers', 1050, 50, 11, N'#2f394c', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (32, N'A sporty design with minimalist details defines these light, versatile sneakers decorated with the iconic fabric triangle logo.', 1, N'Sneakers-men-sp4.avif', N'Fabric', N'Hemp sneakers', 1020, 99, 11, N'#e9ddcf', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (33, N'A sporty design with contemporary charm characterizes these nappa leather sneakers with clean lines and a light rubber sole. The shoe, enhanced by different interpretations of the Prada logo, is completed by the distinctive touch of the iconic enameled metal triangle logo.', 1, N'Sneakers-men-sp5.avif', N'Leather', N'Downtown nappa leather sneakers', 1100, 50, 11, N'#f5e5cb', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (34, N'Defined by their lightweight yet durable chunky soles, these combat boots have a sleek, contemporary design completed by the distinctive enameled metal triangle logo. ', 1, N'Boots-men-sp1.avif', N'Leather', N'Brushed leather combat boots', 1550, 100, 12, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (35, N'These leather work boots with a functional design and refined details have Re-Nylon elements and are completed by chunky rubber soles that give the footwear structure and a comfortable fit. ', 1, N'Boots-men-sp2.avif', N'Fabric / leather', N'Leather and Re-Nylon work boots', 1550, 100, 12, N'#a86738', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (36, N'These sporty, minimalist high-top sneakers are inspired by the iconic Prada Linea Rossa archive style presented during the 1998 Fall/Winter show. The innovative, dual character of the original design is recalled by the revolutionary rubber soles, while the matte leather introduces a refined modern touch. The sleek, tapered shoes are decorated with the distinctive Linea Rossa logo. ', 1, N'Boots-men-sp3.avif', N'Leather', N'Toblach high-top sneakers', 1250, 100, 12, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (37, N'Sleek lines and classic style define these nappa leather Chukka boots characterized by a deconstructed silhouette with pinch stitch seams. Timeless, minimalist allure is combined with comfortable rubber soles to give the shoe with a soft design a contemporary look.', 1, N'Boots-men-sp4.avif', N'Leather', N'Nappa leather Chukka boots', 950, 50, 12, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (38, N'Sleek lines and classic style define these nappa leather Chukka boots characterized by a deconstructed silhouette with pinch stitch seams. Timeless, minimalist allure is combined with comfortable rubber soles to give the shoe with a soft design a contemporary look.', 1, N'Boots-men-sp5.avif', N'Leather', N'Nappa leather Chukka boots', 950, 100, 12, N'#ce9860', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (39, N'These delavé suede chukka boots have a sports-inspired design reinterpreted with clean lines and sleek details. The hot-stamped lettering logo on the upper adds its signature to these soft, comfortable shoes with light rubber soles.', 1, N'Boots-men-sp6.avif', N'Leather', N'Delavé suede chukka boots', 995, 100, 12, N'#d5bba1', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (40, N'Strong, angular lines define the volumes of these Chelsea boots with a contemporary design. The square-toe style is emphasized by the sophisticated, glossy finish of brushed leather that amplifies the slim, minimalist silhouette of the shoe completed with a chunky but lightweight rubber sole. ', 1, N'Boots-men-sp7.avif', N'Leather', N'Brushed leather Chelsea boots', 1370, 100, 12, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (41, N'Unique and bold, this shoe emphasizes the concept of duality, which is essential in the aesthetics of the brand. The modernist maxi sole with a unique monolithic design creates a dialog with the brushed leather upper of these boots, featuring a rigorous look and polished finish. A hybrid yet harmonious soul characterizes the Monolith line that combines diametrically opposed images to create a timeless silhouette.', 1, N'Boots-men-sp8.avif', N'Fabric / leather', N'Monolith brushed leather Chelsea boots', 1470, 100, 12, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (42, N'These brushed leather and nylon boots are decorated with a versatile pouch that recalls a multi-pocket design. The formal rigor of the uniform inspires this shoe, an expression of a timeless design, monolithic and unique, that reinterprets the dual soul of Prada from a modernist perspective. The maxi sole that defines the bold lines of Monolith footwear is combined with elegant brushed leather, emphasizing the brand''s desire to create harmony through diametrically opposed hybrid concepts. ', 1, N'Boots-men-sp9.avif', N'Fabric / leather', N'Monolith brushed leather and Re-Nylon boots with pouch', 1750, 50, 12, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (43, N'Traditionally used in fine classic footwear, brushed leather has been one of the iconic materials of the brand since the ''90s and is used here in a pair of Chelsea boots with a light rubber sole. New, contemporary elegance with sleek, clean lines defines Prada footwear for men.', 1, N'Boots-men-sp10.avif', N'Fabric / leather', N'Brushed leather Chelsea boots', 1490, 100, 12, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (44, N'These suede driving shoes feature a timeless design enriched by sleek, but sophisticated details that combine aesthetic and functionality. Refined craftsmanship gives the upper the distinctive tubular construction that creates a silhouette with soft, tapered lines. Defined by the light and flexible rubber tread sole, the shoes are enhanced with the enameled metal triangle logo.  ', 1, N'Driving-shoes-men-sp1.avif', N'Leather', N'Suede driving shoes', 975, 100, 13, N'#0e4573', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (45, N'This sophisticated dress with soft lines, defined by the refined neckline illuminated with crystals, is an expression of evening elegance with retro charm.', 0, N'Dresses-women-sp2.avif', N'Silk', N'Embroidered cady dress', 4900, 2, 4, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (46, N'Sophisticated tailoring makes this slim-fit single-breasted suit distinctive. The jacket with a two-button closure has classic lapels and a center vent, while the pants feature front slant pockets and back welt pockets. Combining tailoring tradition and modern aesthetics, Prada creates a timeless design, featuring luxury materials and a high degree of technical know-how.', 1, N'Suit-men-sp1.avif', N'Virgin wool', N'Single-breasted wool suit', 4700, 10, 14, N'#0e4573', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (47, N'Sophisticated tailoring makes this slim-fit single-breasted suit distinctive. The jacket with a two-button closure has classic lapels and a center vent, while the pants feature front slant pockets and back welt pockets. Combining tailoring tradition and modern aesthetics, Prada creates a timeless design, featuring luxury materials and a high degree of technical know-how.', 1, N'Suit-men-sp2.avif', N'Virgin wool', N'Single-breasted wool suit', 4000, 5, 14, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (48, N'Tailored with black soft wool and mohair this suit is an expression of Italian style with a slim fit and a very clean aesthetic. Constructed shoulder for the blazer and slash pockets for the pants.', 1, N'Suit-men-sp3.avif', N'Virgin wool', N'Single Breasted Wool And Mohair Suit', 4000, 4, 14, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (49, N'Tailored with black soft wool and mohair this suit is an expression of Italian style with a slim fit and a very clean aesthetic. Constructed shoulder for the blazer and slash pockets for the pants.', 1, N'Suit-men-sp4.avif', N'Virgin wool', N'Single Breasted Wool And Mohair Suit', 4000, 3, 14, N'#0e4573', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (50, N'The elegance of this slim-fit single-breasted wool and mohair tuxedo is enhanced by its silk satin lapels and details. The one-button style is decorated with Prada''s iconic sartorial label.', 1, N'Suit-men-sp5.avif', N'Wool', N'Single-breasted wool and mohair tuxedo', 5200, 2, 14, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (51, N'The elegance of this slim-fit single-breasted wool and mohair tuxedo is enhanced by its silk satin lapels and details. The one-button style is decorated with Prada''s iconic sartorial label.', 1, N'Suit-men-sp6.avif', N'Wool', N'Single-breasted wool and mohair tuxedo', 5200, 1, 14, N'#0e4573', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (52, N'This collection celebrates contradictions, evoking Prada’s core spirit. It is made from innovative, high-tech fabric in tailored volumes and treatments. This stretch technical-fabric suit is enhanced by sophisticated details, embodying the brand’s modernist, artisanal soul.', 1, N'Suit-men-sp7.avif', N'Recycled polyester', N'Single-breasted techno stretch suit', 3950, 3, 14, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (53, N'This washed denim shirt features a boxy silhouette with contemporary style. The snap closure completes the casual style decorated with the iconic enameled triangle logo on the breast pocket. ', 1, N'Denim-men-sp1.avif', N'Cotton', N'Denim shirt', 1720, 3, 15, N'#a4bec8', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (54, N'These jeans have a contemporary low-rise silhouette enriched by the vintage allure of washed denim and the archive logo printed on the label. ', 1, N'Denim-men-sp2.avif', N'Cotton', N'Low-rise denim jeans', 1590, 5, 15, N'#a4bec8', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (55, N'Long-sleeved bull-denim shirt in a boxy cut, with a worn-effect treatment that gives the piece a vintage feel. The contrasting stitching defines the silhouette, enhanced by a patch pocket with the iconic enameled triangle logo that stands out.', 1, N'Denim-men-sp3.avif', N'Cotton', N'Worn bull-denim shirt', 1720, 4, 15, N'#f0e5d6', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (56, N'Sporty details and retro influences blend in the design of this Cuban-collared shirt made of worn-look bull-denim. The contrasting stitching defines the boxy silhouette with short sleeves and a patch pocket, completed by the iconic enameled-metal triangle logo.', 1, N'Denim-men-sp4.avif', N'Cotton', N'Short-sleeved shirt in worn bull-denim', 1470, 5, 15, N'#f0e5d6', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (57, N'These Bermudas with a casual attitude come in a design featuring sophisticated details and are made of bull-denim with a worn finish. The contrasting stitching defines the mid-rise waist silhouette, with the signature enameled-metal triangle logo.', 1, N'Denim-men-sp5.avif', N'Cotton', N'Worn bull-denim Bermudas', 1390, 4, 15, N'#f0e5d6', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (58, N'A play of color contrasts animates this Double Match denim shirt that reflects the duality inherent in the Prada aesthetic. Emphasized by a light washed treatment, the style with bowling collar has a sports-inspired boxy cut. The enameled metal triangle logo on the breast pocket completes the casual design with retro charm. ', 1, N'Denim-men-sp6.avif', N'Cotton', N'Double Match denim shirt', 1890, 2, 15, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (59, N'Precious details brighten the silhouette of this top covered with rhinestones featuring a delicate gradient effect. The cropped design with scoop neck is enhanced with elegant gold chain shoulder straps and chain trim on the neckline and hem. The enameled metal triangle logo completes the luminous garment with its iconic signature.', 0, N'Shirts_and_tops_women_sp9.avif', N'Cotton', N'Embroidered ribbed knit jersey top', 1890, 0, 16, N'#ffffff', 1)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (60, N'A modern floral print animates this short-sleeved top with slim lines. The style, characterized by a wrap silhouette with V-neck is completed by the emblematic triangle logo reinterpreted with a conceptual design.', 0, N'Shirts_and_tops_women_sp8.avif', N'Viscose', N'Printed pongé top', 1790, 3, 16, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (61, N'This cotton bandana top with a slim-fit, minimalist silhouette expresses summery lightness. A check pattern inspired by vintage pocket squares enriches the strapless style.', 0, N'Shirts_and_tops_women_sp7.avif', N'Cotton', N'Checked cotton bandana top', 1790, 2, 16, N'#f3d6da', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (62, N'New lines and details enrich the design of this cropped cotton shirt, characterized by a check pattern inspired by vintage pocket squares. The lightweight style has a sleeveless silhouette defined by side ties and embellished with the embroidered logo on the back.', 0, N'Shirts_and_tops_women_sp6.avif', N'Cotton', N'Checked cropped cotton shirt', 1850, 3, 16, N'#a4bec8', 1)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (63, N'Original lines and details enrich the design of this silk twill shirt characterized by a refined print with vintage charm. The lightweight style has a sleeveless silhouette defined by knots on the side and embellished with the simple geometric shape of the fabric triangle logo. ', 0, N'Shirts_and_tops_women_sp1.avif', N'Silk', N'Printed twill silk shirt', 1920, 0, 16, N'#ce9860', 1)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (64, N'This silk twill top has a light, contemporary, slim-fit design. The style features a refined geometric print that enriches the silhouette with halter neck. ', 0, N'Shirts_and_tops_women_sp2.avif', N'Silk', N'Printed silk twill halter top', 1270, 4, 16, N'#0e4573', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (65, N'This refined silk twill shirt with a menswear silhouette is brightened by a geometric print with vintage charm. The light silhouette with oversized lines is enriched with sleek and sophisticated details such as the fabric triangle logo, which completes the style with its distinctive signature.', 0, N'Shirts_and_tops_women_sp3.avif', N'Silk', N'Printed twill shirt', 2600, 5, 16, N'#ccdde8', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (66, N'This refined silk twill shirt has a menswear silhouette animated by a refined paisley print. The light silhouette with oversized lines is enriched with simple yet sophisticated details such as the fabric triangle logo that completes the garment with its distinctive signature touch. ', 0, N'Shirts_and_tops_women_sp4.avif', N'Silk', N'Printed twill silk shirt', 2600, 5, 16, N'#cca17e', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (67, N'This silk shirt with timeless details is characterized by its elegant and refined allure. The style is accented with a sophisticated scarf collar in a color contrasting with the soft silhouette. ', 0, N'Shirts_and_tops_women_sp5.avif', N'Silk', N'Silk shirt', 2150, 3, 16, N'#f4e3eb', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (68, N'New lines and details enrich the design of this cropped cotton shirt, characterized by a check pattern inspired by vintage pocket squares. The lightweight style has a sleeveless silhouette defined by side ties and embellished with the embroidered logo on the back.', 0, N'Shirts_and_tops_women_sp6.avif', N'Cotton', N'Checked cropped cotton shirt', 1850, 3, 16, N'#a4bec8', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (69, N'These casual overalls made of washed denim have a loose-fit silhouette. The workwear-inspired style with classic details is decorated with an archive logo printed on the label and by the iconic enameled metal triangle logo. ', 0, N'Denim_women_sp2.avif', N'Cotton', N'Denim overalls', 2800, 2, 15, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (70, N'Washed denim gives this short-sleeved shirt with an oversized, boxy silhouette vintage allure. Simple details complete the style enriched by an archive logo printed on the label and by the sleek yet iconic geometric shape of the enameled metal triangle logo. ', 0, N'Denim_women_sp1.avif', N'Cotton', N'Denim shirt', 1590, 5, 15, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (71, N'Washed denim gives this straight mini-dress vintage allure, enriched with distinctive workwear-style details. The style is completed by the archive logo printed on a label and the sleek and iconic geometric shape of the enameled metal triangle logo. ', 0, N'Denim_women_sp3.avif', N'Cotton', N'Denim mini-dress', 2450, 3, 15, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (72, N'The classic denim jacket takes on a new contemporary design defined by the pointy collar and the cropped silhouette that emphasizes the waist. In a play of volumes, the clean, defined lines of the silhouette are softened by the full, soft sleeves. The garment is made of organic denim with a washed treatment that adds a vintage inspired feel.', 0, N'Denim_women_sp5.avif', N'Cotton', N'Cropped organic denim jacket', 2200, 4, 15, N'#0161e9', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (73, N'References to streetwear define this oversized shirt made of organic denim with a washed effect that adds a vintage inspired feel. Contrasting stitching outlines the silhouette, accented with a patch pocket featuring the iconic enameled triangle logo.', 0, N'Denim_women_sp6.avif', N'Cotton', N'Oversized organic denim shirt', 1790, 3, 15, N'#0161e9', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (74, N'These jeans with a flared leg and retro allure are made of denim treated for a faded effect that gives them vintage charm. The essential five-pocket design is enhanced with matching top-stitching and Prada''s emblematic enameled metal triangle logo.', 0, N'Denim_women_sp4.avif', N'Cotton', N'Five-pocket denim jeans', 1290, 3, 15, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (75, N'Refined details with vintage allure embellish this skirt made of silk  habutai, a sophisticated design that looks to elegance of the past to redefine contemporary codes.', 0, N'Skirts_women_sp1.avif', N'Silk', N'Embroidered silk habutai skirt', 4900, 3, 17, N'#d1e1d7', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (76, N'Refined details with vintage allure embellish this skirt made of silk and linen, a sophisticated design that looks to elegance of the past to redefine contemporary codes.', 0, N'Skirts_women_sp2.avif', N'Linen', N'Embroidered linen skirt', 3850, 2, 17, N'#ffffff', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (77, N'Refined details with vintage allure embellish this silk habutai skirt with soft lines, a sophisticated design that looks to the elegance of the past to redefine contemporary codes.', 0, N'Skirts_women_sp3.avif', N'Silk', N'Embroidered habutai silk skirt', 5500, 3, 17, N'#ffbf97', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (78, N'Subtle elegance is transformed into finely embroidered, lightweight linen: this maxi-skirt with a straight silhouette reveals sophisticated workmanship and attention to detail.', 0, N'Skirts_women_sp4.avif', N'Linen', N'Embroidered linen maxi-skirt', 3450, 4, 17, N'#f5e5cb', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (79, N'Refined details with vintage charm enhance this silk habutai skirt with a soft silhouette and sophisticated design that looks to the elegance of the past to redefine contemporary codes. ', 0, N'Skirts_women_sp5.avif', N'Silk', N'Embroidered silk habutai skirt', 3600, 3, 17, N'#faf1df', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (80, N'Refined details with vintage charm embellish this habutai silk skirt, a sophisticated design that looks to elegance of the past to redefine contemporary codes. ', 0, N'Skirts_women_sp6.avif', N'Silk', N'Embroidered habutai silk midi-skirt', 4900, 2, 17, N'#d1e1d7', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (81, N'Elegance of the past inspires this georgette dress that establishes a dialogue between the light 1920s silhouette and refined retro-inspired embellishments, reinterpreted with masterful workmanship for an effect in relief with contemporary charm.', 0, N'Dresses-women-sp3.avif', N'Silk', N'Embroidered georgette dress', 7200, 2, 4, N'#ffa2ba', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (82, N'Elegance of the past inspires this georgette dress that establishes a dialogue between the light 1920s silhouette and refined retro-inspired embellishments, reinterpreted with masterful workmanship for an effect in relief with contemporary charm. ', 0, N'Dresses-women-sp4.avif', N'Silk', N'Embroidered georgette dress', 7700, 3, 4, N'#863f2b', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (83, N'For the Fall/Winter collection 2024, symbols of femininity are reconsidered and revolutionized in function and meaning. The straight, lines of this sablé dress, embellished with refined satin bows, acquire a new dimension of elegance.', 0, N'Dresses-women-sp10.avif', N'Viscose', N'Sablé dress with bows', 6100, 4, 4, N'#e775a4', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (84, N'This minidress with a sixties mood is made of soft twill with a modern washed effect. Clean lines with a precise cut define the structured silhouette with round neck. A gold-tone safety pin adds an unexpected and contemporary touch. The sophisticated, feminine garment is decorated with the leather logo label that completes the timeless design with an iconic note.', 0, N'Dresses-women-sp9.avif', N'Wool', N'Washed twill minidress with safety pin', 2600, 2, 4, N'#f5e5cb', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (85, N'This sablé dress with sophisticated charm has a light, feminine silhouette. The garment with soft lines, enriched by a large floral print, is characterized by cape sleeves and an elegant scarf collar. ', 0, N'Dresses-women-sp8.avif', N'Viscose', N'Printed sablé dress with scarf collar', 4400, 4, 4, N'#e6ccc1', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (86, N'This long silk twill dress with a light and refined silhouette is enhanced by the nuances of the gradient shading effect. The shirt-dress style, completed with the fabric triangle logo, is defined by casual yet refined details like the removable narrow belt with plaque buckle. ', 0, N'Dresses-women-sp6.avif', N'Silk', N'Long silk twill dress', 6100, 3, 4, N'#463b2a', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (87, N'This silk twill shirt dress with a light, refined silhouette is enhanced by the nuances of the gradient shading effect. The garment, completed by the fabric triangle logo, is defined by casual yet sophisticated details like the narrow belt with plaque buckle. ', 0, N'Dresses-women-sp5.avif', N'Silk', N'Silk twill shirt dress', 5200, 3, 4, N'#463b2a', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (88, N'Soft lines define the silhouette of this crepe satin shirt dress. The short-sleeved design with bowling collar combines retro details with contemporary elements like the plaque buckle that adds a casual touch to the garment. ', 0, N'Dresses-women-sp7.avif', N'Silk', N'Printed satin crepe dress', 4800, 3, 4, N'#e2e2cd', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (89, N'The continuous search for excellence is inherent in Prada''s DNA and creations made with sleek lines and fine materials. The elegant and versatile Prada Galleria bag blends industrial precision and refined, meticulous workmanship in a clean and sophisticated leather design. Composed of over 80 separate pieces assembled by hand, the three-compartment style reveals a multifaceted and universal nature that makes it the perfect canvas for always new interpretations. Refined leather floral appliqués decorate the iconic accessory with a unique and refined note. ', 0, N'Top_handles_sp8.avif', N'Leather', N'Large Prada Galleria leather bag with floral appliqués', 8500, 3, 18, N'#ffffff', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (90, N'The continuous search for excellence is inherent in Prada''s DNA and creations made with sleek lines and fine materials. The elegant and versatile Prada Galleria bag blends industrial precision and refined, meticulous workmanship in a clean and sophisticated leather design. Composed of over 80 separate pieces assembled by hand, the three-compartment style reveals a multifaceted and universal nature that makes it the perfect canvas for always new interpretations. Leather floral appliqués with modernist allure decorate the iconic accessory with a unique and refined note. ', 0, N'Top_handles_sp9.avif', N'Leather', N'Large Prada Galleria leather bag with floral appliqués', 8500, 3, 18, N'#000000', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (91, N'The sophisticated and timeless Prada Galleria bag blends industrial precision and the refined accuracy of craftsmanship in a design that celebrates the historic shop opened in the Galleria Vittorio Emanuele II of Milan in 1913. Consisting of more than 80 separate pieces assembled by hand, the style reveals a versatile and universal nature that makes it the perfect canvas for always new interpretations. The accessory, characterized by the iconic three pockets, features the distinctive crosshatch pattern with waxed finish of Saffiano leather, animated by an elegant floral print in vibrant colors. ', 0, N'Top_handles_sp1.avif', N'Leather', N'Prada Galleria printed Saffiano leather bag', 5500, 3, 18, N'#7aad96', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (92, N'The sophisticated and timeless Prada Galleria bag blends industrial precision and the refined accuracy of craftsmanship in a design that celebrates the historic shop opened in the Galleria Vittorio Emanuele II of Milan in 1913. Consisting of more than 80 separate pieces assembled by hand, the style reveals a versatile and universal nature that makes it the perfect canvas for always new interpretations. The accessory, characterized by the iconic three pockets, features the distinctive crosshatch pattern with waxed finish of Saffiano leather, animated by an elegant floral print in vibrant colors. ', 0, N'Top_handles_sp4.avif', N'Leather', N'Prada Galleria printed Saffiano leather bag', 5500, 3, 18, N'#ffa2ba', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (93, N'The sophisticated and timeless Prada Galleria bag blends industrial precision and the refined accuracy of craftsmanship in a design that celebrates the historic shop opened in the Galleria Vittorio Emanuele II of Milan in 1913. Consisting of more than 80 separate pieces assembled by hand, the style reveals a versatile and universal nature that makes it the perfect canvas for always new interpretations. The accessory, characterized by the iconic three pockets, features the distinctive crosshatch pattern with wax finish of Saffiano leather, animated by a romantic floral print that enhances the sleek and elegant silhouette. ', 0, N'Top_handles_sp2.avif', N'Leather', N'Prada Galleria printed Saffiano leather bag', 5500, 3, 18, N'#59ace8', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (94, N'The sophisticated and timeless Prada Galleria bag blends industrial precision and the refined accuracy of craftsmanship in a design that celebrates the historic shop opened in the Galleria Vittorio Emanuele II of Milan in 1913. Consisting of more than 80 separate pieces assembled by hand, the style reveals a versatile and universal nature that makes it the perfect canvas for always new interpretations. The accessory, characterized by the iconic three pockets, features the distinctive crosshatch pattern with wax finish of Saffiano leather, animated by a romantic floral print that enhances the sleek and elegant silhouette. ', 0, N'Top_handles_sp3.avif', N'Leather', N'Prada Galleria printed Saffiano leather bag', 5500, 3, 18, N'#ffa2ba', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (95, N'The Prada Galleria bag is reinterpreted for the Fall/Winter 2024 season with eccentric volumes and alluring retro details. The timeless silhouette, entirely covered with satin petals applied by hand, is transformed into a precious object, a true gem of artisan crafting with iconic elegance. ', 0, N'Top_handles_sp5.avif', N'Fabric', N'Satin and patent leather Prada Galleria mini-bag', 6200, 4, 18, N'#2f394c', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (96, N'The Prada Galleria bag is reinterpreted for the Fall/Winter 2024 season with eccentric volumes and alluring retro details. The timeless silhouette, entirely covered with feathers applied by hand, is transformed into a precious object, a true gem of artisan crafting with iconic elegance. ', 0, N'Top_handles_sp6.avif', N'Fabric', N'Prada Galleria mini-bag with feather trim', 6200, 4, 18, N'#ffbf97', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (97, N'This tote bag with a soft, deconstructed design is made of raffia-effect yarn, a light material with a summery mood. The embroidered lettering logo decorates the front, while the emblematic triangle in enameled metal embellishes the side.', 0, N'Totes_women_sp4.avif', N'Leather', N'Small crochet tote bag', 1750, 3, 9, N'#f0e5d6', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (98, N'This crochet tote bag with a soft, deconstructed design boasts a light and summery mood. The embroidered lettering logo decorates the front, while the emblematic triangle in enameled metal embellishes the side.', 0, N'Totes_women_sp1.avif', N'Leather', N'Small crochet tote bag', 1750, 3, 9, N'#d3e1c7', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (99, N'This crochet tote bag with a soft, deconstructed design boasts a light and summery mood. The embroidered lettering logo decorates the front, while the emblematic triangle in enameled metal embellishes the side.', 0, N'Totes_women_sp8.avif', N'Leather', N'Small crochet tote bag', 1750, 2, 9, N'#ffffff', 0)
GO
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (100, N'This modern and sophisticated tote bag evokes a summery atmosphere due to the combination of crochet and leather details. The contrasting embroidered lettering logo on the front embellishes the accessory with double handles for use as a handbag or shoulder bag. ', 0, N'Totes_women_sp5.avif', N'Leather', N'Small crochet and leather tote bag', 2250, 2, 9, N'#d8c7b0', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (101, N'This crochet tote bag with a soft, deconstructed design boasts a light and summery mood. A new interpretation of Prada''s emblematic triangle decorates the front and is embellished at its center with the embroidered lettering logo.', 0, N'Totes_women_sp3.avif', N'Leather', N'Crochet tote bag', 2050, 3, 9, N'#ffffff', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (102, N'This crochet tote bag with a soft, deconstructed design boasts a light and summery mood. A new interpretation of Prada''s emblematic triangle decorates the front and is embellished at its center with the embroidered lettering logo.', 0, N'Totes_women_sp2.avif', N'Leather', N'Crochet tote bag', 2050, 2, 9, N'#d3e1c7', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (103, N'The iconic triangle, the distinctive signature of Prada collections, is transformed into a modernist geometric motif that enhances this bag with a versatile, modern design. The roomy style is made of laser-cut perforated leather that adds a touch of summery lightness and uniqueness. The embossed tonal lettering logo completes the accessory.', 0, N'Totes_women_sp6.avif', N'Leather', N'Large perforated leather tote bag', 2850, 2, 9, N'#ffffff', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (104, N'This tote bag with a summery mood reinterprets classic styles in crochet with a modern, sophisticated design. The light, roomy accessory is enhanced by a refined geometric motif inspired by the iconic Prada triangle, while the embroidered lettering logo in a contrasting color completes it with a distinctive touch. ', 0, N'Totes_women_sp7.avif', N'Leather', N'Crochet tote bag', 1950, 3, 9, N'#f0e5d6', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (105, N'A perfect synthesis of classicism and futurism, the Prada Cleo bag reinterprets an iconic design from the brand''s archives. Sleek, curved lines emphasized by the particular sloping construction on the bottom and sides give this flap bag sophisticated allure, while the handle with extension makes the accessory functional and allows it to be worn as a shoulder bag or handbag. Brushed leather, a distinctive material of Prada collections, is a modern, chameleonic material that is perfect for always new combinations and contrasts. The enameled triangle logo completes the silhouette.', 0, N'Mini_bags_women_sp1.avif', N'Leather', N'Prada Cleo brushed leather mini bag', 2800, 3, 19, N'#dcdbe1', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (106, N'Sleek lines and iconic details define this leather bag with a versatile design characterized by removable handles and decorated with the enameled metal triangle logo.', 0, N'Mini_bags_women_sp2.avif', N'Leather', N'Prada Re-Edition leather mini-bag', 2600, 3, 19, N'#ffffff', 0)
INSERT [products] ([product_id], [description], [gender], [image], [material], [product_name], [price], [stock], [category_id], [color_id], [is_like]) VALUES (107, N'Inspired by basketball sneakers of the ''80s, these Downtown Bold sneakers have a sporty design with refined details. The shoes made of two-tone perforated leather are reinterpreted with flatform soles that give the style a distinctive, contemporary character. Different interpretations of the Prada logo decorate the shoe, completed with the iconic geometric shape of the enameled metal triangle. ', 0, N'Sneaker_women_sp1.avif', N'Leather', N'Downtown Bold leather sneakers', 1120, 3, 11, N'#ffffff', 0)
SET IDENTITY_INSERT [products] OFF
GO
SET IDENTITY_INSERT [roles] ON 

INSERT [roles] ([id], [name]) VALUES (1, N'ADMIN')
INSERT [roles] ([id], [name]) VALUES (2, N'USER')
SET IDENTITY_INSERT [roles] OFF
GO
SET IDENTITY_INSERT [users] ON 

INSERT [users] ([id], [address], [email], [enabled], [full_name], [password], [phone], [user_name]) VALUES (1, N'TP.HCM', N'admin@gmail.com', 1, N'Le Van Tan Thong', N'$2a$10$1gXLGAk8nEe7m4J60lZAZuxpzTpNkOx95HA5s03sAzWdllw3tk9j2', N'0348807764', N'Admin')
INSERT [users] ([id], [address], [email], [enabled], [full_name], [password], [phone], [user_name]) VALUES (2, N'Thanh pho Ho Chi Minh', N'levantanthong.2602@gmail.com', 1, N'Le Van Tan Thong', N'$2a$10$lgusqGo7CND55Eo/UmX1YuOir3KCjLJ.mziAZSHXk21eVn2/8laTS', N'0348807764', N'tanthong')
SET IDENTITY_INSERT [users] OFF
GO
SET IDENTITY_INSERT [users_roles] ON 

INSERT [users_roles] ([id], [role_id], [user_id]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [users_roles] OFF
GO
SET IDENTITY_INSERT [wist_list] ON 

INSERT [wist_list] ([id]) VALUES (1)
SET IDENTITY_INSERT [wist_list] OFF
GO
INSERT [wist_list_items] ([wish_list_id], [items_product_id]) VALUES (1, 8)
INSERT [wist_list_items] ([wish_list_id], [items_product_id]) VALUES (1, 12)
INSERT [wist_list_items] ([wish_list_id], [items_product_id]) VALUES (1, 28)
INSERT [wist_list_items] ([wish_list_id], [items_product_id]) VALUES (1, 59)
INSERT [wist_list_items] ([wish_list_id], [items_product_id]) VALUES (1, 63)
INSERT [wist_list_items] ([wish_list_id], [items_product_id]) VALUES (1, 62)
GO
/****** Object:  Index [UKfmv9fn24y2jk0eoy4aw5elpr7]    Script Date: 27/09/2024 8:42:38 CH ******/
ALTER TABLE [wist_list_items] ADD  CONSTRAINT [UKfmv9fn24y2jk0eoy4aw5elpr7] UNIQUE NONCLUSTERED 
(
	[items_product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [products] ADD  DEFAULT ((0)) FOR [is_like]
GO
ALTER TABLE [cart_items]  WITH CHECK ADD  CONSTRAINT [FK1re40cjegsfvw58xrkdp6bac6] FOREIGN KEY([product_id])
REFERENCES [products] ([product_id])
GO
ALTER TABLE [cart_items] CHECK CONSTRAINT [FK1re40cjegsfvw58xrkdp6bac6]
GO
ALTER TABLE [cart_items]  WITH CHECK ADD  CONSTRAINT [FKpcttvuq4mxppo8sxggjtn5i2c] FOREIGN KEY([cart_id])
REFERENCES [carts] ([cart_id])
GO
ALTER TABLE [cart_items] CHECK CONSTRAINT [FKpcttvuq4mxppo8sxggjtn5i2c]
GO
ALTER TABLE [categories]  WITH CHECK ADD  CONSTRAINT [FKsaok720gsu4u2wrgbk10b5n8d] FOREIGN KEY([parent_id])
REFERENCES [categories] ([category_id])
GO
ALTER TABLE [categories] CHECK CONSTRAINT [FKsaok720gsu4u2wrgbk10b5n8d]
GO
ALTER TABLE [invoice_items]  WITH CHECK ADD  CONSTRAINT [FK46ae0lhu1oqs7cv91fn6y9n7w] FOREIGN KEY([invoice_id])
REFERENCES [invoices] ([invoice_id])
GO
ALTER TABLE [invoice_items] CHECK CONSTRAINT [FK46ae0lhu1oqs7cv91fn6y9n7w]
GO
ALTER TABLE [invoice_items]  WITH CHECK ADD  CONSTRAINT [FKs3tu9gmkgshq8oeq5n0rinxeu] FOREIGN KEY([product_id])
REFERENCES [products] ([product_id])
GO
ALTER TABLE [invoice_items] CHECK CONSTRAINT [FKs3tu9gmkgshq8oeq5n0rinxeu]
GO
ALTER TABLE [invoices]  WITH CHECK ADD  CONSTRAINT [FKbwr4d4vyqf2bkoetxtt8j9dx7] FOREIGN KEY([user_id])
REFERENCES [users] ([id])
GO
ALTER TABLE [invoices] CHECK CONSTRAINT [FKbwr4d4vyqf2bkoetxtt8j9dx7]
GO
ALTER TABLE [products]  WITH CHECK ADD  CONSTRAINT [FKebociq5k3b2tkcxh3q5dg4eed] FOREIGN KEY([color_id])
REFERENCES [colors] ([color_id])
GO
ALTER TABLE [products] CHECK CONSTRAINT [FKebociq5k3b2tkcxh3q5dg4eed]
GO
ALTER TABLE [products]  WITH CHECK ADD  CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9] FOREIGN KEY([category_id])
REFERENCES [categories] ([category_id])
GO
ALTER TABLE [products] CHECK CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9]
GO
ALTER TABLE [users_roles]  WITH CHECK ADD  CONSTRAINT [FK2o0jvgh89lemvvo17cbqvdxaa] FOREIGN KEY([user_id])
REFERENCES [users] ([id])
GO
ALTER TABLE [users_roles] CHECK CONSTRAINT [FK2o0jvgh89lemvvo17cbqvdxaa]
GO
ALTER TABLE [users_roles]  WITH CHECK ADD  CONSTRAINT [FKj6m8fwv7oqv74fcehir1a9ffy] FOREIGN KEY([role_id])
REFERENCES [roles] ([id])
GO
ALTER TABLE [users_roles] CHECK CONSTRAINT [FKj6m8fwv7oqv74fcehir1a9ffy]
GO
ALTER TABLE [wist_list_items]  WITH CHECK ADD  CONSTRAINT [FKftc4oy0rcpvnuqiyit6j847sd] FOREIGN KEY([wish_list_id])
REFERENCES [wist_list] ([id])
GO
ALTER TABLE [wist_list_items] CHECK CONSTRAINT [FKftc4oy0rcpvnuqiyit6j847sd]
GO
ALTER TABLE [wist_list_items]  WITH CHECK ADD  CONSTRAINT [FKrw2lbaunnk3x06wdnpslqwvd7] FOREIGN KEY([items_product_id])
REFERENCES [products] ([product_id])
GO
ALTER TABLE [wist_list_items] CHECK CONSTRAINT [FKrw2lbaunnk3x06wdnpslqwvd7]
GO
USE [master]
GO
ALTER DATABASE [Prada] SET  READ_WRITE 
GO
