USE [Web]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 7/20/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[aID] [int] NOT NULL,
	[username] [varchar](255) NULL,
	[password] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[aID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 7/20/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id_cat] [int] NOT NULL,
	[name_cat] [varchar](255) NULL,
	[describe] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/20/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[cid] [int] NOT NULL,
	[totalmoney] [money] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 7/20/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLine](
	[oid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[quantity] [float] NOT NULL,
	[price] [float] NOT NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
 CONSTRAINT [PK_OrderLine] PRIMARY KEY CLUSTERED 
(
	[oid] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 7/20/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id_pro] [int] NOT NULL,
	[id_cat] [int] NULL,
	[name_pro] [varchar](255) NULL,
	[images] [varchar](255) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[supplier] [varchar](255) NULL,
	[infor] [varchar](255) NULL,
	[sell_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 7/20/2021 2:57:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id_user] [int] NOT NULL,
	[username] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[dob] [date] NULL,
	[gender] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[role] [varchar](255) NULL,
	[Block] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[category] ([id_cat], [name_cat], [describe]) VALUES (1, N'MACBOOK', N'LapTop')
INSERT [dbo].[category] ([id_cat], [name_cat], [describe]) VALUES (2, N'ASUS ', N'LapTop')
INSERT [dbo].[category] ([id_cat], [name_cat], [describe]) VALUES (3, N'DELL', N'LapTop')
INSERT [dbo].[category] ([id_cat], [name_cat], [describe]) VALUES (4, N'LENOVO', N'LapTop')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (1, CAST(N'2021-07-09' AS Date), 487, 2347.0680)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (2, CAST(N'2021-07-10' AS Date), 14, 6238.8000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (3, CAST(N'2021-07-10' AS Date), 13, 598.8000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (4, CAST(N'2021-07-10' AS Date), 21, 2516.4000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (5, CAST(N'2021-07-11' AS Date), 170, 5596.8000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (6, CAST(N'2021-07-11' AS Date), 170, 1560.0000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (7, CAST(N'2021-07-11' AS Date), 13, 3000.0000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (8, CAST(N'2021-07-11' AS Date), 625, 720.0000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (9, CAST(N'2021-07-11' AS Date), 625, 1800.0000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (10, CAST(N'2021-07-11' AS Date), 239, 720.0000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (11, CAST(N'2021-07-11' AS Date), 239, 1800.0000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (12, CAST(N'2021-07-11' AS Date), 239, 720.0000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (13, CAST(N'2021-07-11' AS Date), 239, 1466.4000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (14, CAST(N'2021-07-11' AS Date), 487, 2400.0000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (15, CAST(N'2021-07-11' AS Date), 321, 14.4000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (16, CAST(N'2021-07-11' AS Date), 13, 720.0000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (17, CAST(N'2021-07-11' AS Date), 170, 1318.8000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (18, CAST(N'2021-07-12' AS Date), 14, 5664.0000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (19, CAST(N'2021-07-13' AS Date), 13, 2932.8000)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (20, CAST(N'2021-07-13' AS Date), 13, 3669.4680)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (21, CAST(N'2021-07-18' AS Date), 13, 4869.4680)
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (22, CAST(N'2021-07-18' AS Date), 239, 7920.0000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (1, 1001, 1, 360, N'Ngo', N'Nam', N'0973874512', N'Ha Noi')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (1, 1002, 2, 598.8, N'Ngo', N'Nam', N'0973874512', N'Ha Noi')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (1, 1008, 1, 789.468, N'Ngo', N'Nam', N'0973874512', N'Ha Noi')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (2, 1002, 1, 598.8, N'Phan', N'Tung', N'0347777772', N'Hai Phong')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (2, 1010, 1, 1800, N'Phan', N'Tung', N'0347777772', N'Hai Phong')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (2, 5004, 1, 2400, N'Phan', N'Tung', N'0347777772', N'Hai Phong')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (2, 100017, 1, 1440, N'Phan', N'Tung', N'0347777772', N'Hai Phong')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (3, 1002, 1, 598.8, N'Chu', N'Nam', N'0356645824', N'Ninh Binh')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (4, 1001, 2, 360, N'Truong', N'Anh', N'01205502245', N'Yen Vien')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (4, 1002, 3, 598.8, N'Truong', N'Anh', N'01205502245', N'Yen Vien')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (5, 1002, 2, 598.8, N'Linh', N'Dam', N'0348889228', N'Quang Ninh')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (5, 10009, 3, 1466.3999999999999, N'Linh', N'Dam', N'0348889228', N'Quang Ninh')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (13, 10009, 1, 1466.3999999999999, N'Nguyen', N'Dam', N'None', N'Vinh Phuc')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (14, 10001, 1, 2400, N'Nguyen', N'Thi D', N'None', N'Thuy Hoa')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (15, 5005, 1, 14.399999999999999, N'Nguyen ', N'Trinh', N'0356645824', N'Sai Gon')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (16, 1001, 2, 360, N'Nguyen ', N'Van Duc', N'098343746812', N'Yen Phong')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (17, 1001, 2, 360, N'Tran', N'Thu Trang', N'098343346812', N'Ninh Binh')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (17, 1002, 1, 598.8, N'Tran', N'Thu Trang', N'098343346812', N'Ninh Binh')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (18, 1010, 3, 1800, N'Nguyen ', N'Chi Linh', N'0973874512', N'Yen Bai')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (18, 10007, 2, 132, N'Nguyen ', N'Chi Linh', N'0973874512', N'Yen Bai')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (19, 10009, 2, 1466.3999999999999, N'Nguyen ', N'Duc', N'0356645824', N'Bac Ninh')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (20, 1008, 1, 789.468, N'Nguyen ', N'Thu', N'0356645824', N'Ha Noi')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (20, 100017, 2, 1440, N'Nguyen ', N'Thu', N'0356645824', N'Ha Noi')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (21, 1003, 1, 1200, N'Linh', N'Cham', N'0356645824', N'Hai Phong')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (21, 1008, 1, 789.468, N'Linh', N'Cham', N'0356645824', N'Hai Phong')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (21, 100017, 2, 1440, N'Linh', N'Cham', N'0356645824', N'Hai Phong')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (22, 1010, 2, 1800, N'Tran', N'Cham', N'098343746812', N'ha noi')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [FirstName], [LastName], [Phone], [Address]) VALUES (22, 100017, 3, 1440, N'Tran', N'Cham', N'098343746812', N'ha noi')
GO
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (1001, 2, N'AL210', N'images/as1.jpg', 1, 300, N'Microsoft', N' HD Display, Intel Celeron N4020 Processor, 4GB RAM, 64GB Storage, NumberPad, Windows 10 Home in S Mode
', 664)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (1002, 3, N'Inspiron 15', N'images\d1.jpg', 0, 499, N'Amazon', N'15.6 Inch HD Non Touch Display 1TB HDD Quad-Core i5 (8GB RAM, i5-1035G1 Up to 3.6GHz, HDMI, Windows 10 Home) Black', 664)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (1003, 2, N'J97D3', N'https://cdn.vox-cdn.com/thumbor/JzO4RB-vfVtQUVew_a9DdL_VxBI=/0x0:2080x1408/1200x800/filters:focal(865x525:1197x857)/cdn.vox-cdn.com/uploads/chorus_image/image/65168922/asus300hz.0.jpg', 1, 1000, N'FPT', N'Nice', 14)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (1008, 4, N'LIdeaPad 3', N'images\l2.jpg', 1, 657.89, N'Amazon', N'HD Touch Screen Laptop | 10th Gen Quad-Core Intel Core i5-1035G1 (Beat i7-8550U) | 12GB DDR4 RAM, 256GB PCIE SSD, Bundled with Woov Sleeve, Webcam, Windows 10, Grey', 664)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (1010, 1, N'TUF 15.6', N'images/as3.jpg', 6, 1500, N'Microsoft', N'FHD 144Hz 5ms Gaming Laptop Computer, Intel Hexa-Core i7-9750H up to 4.5GHz, 32GB DDR4 RAM, 1TB PCIe SSD, NVIDIA GeForce GTX 1650, RGB...', 664)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (5001, 1, N'MB_P22', N'images\mb2.jpg', 6, 1.239, N'Amazon', N'2020 Apple MacBook Pro with Apple M1 Chip (13-inch, 8GB RAM, 256GB SSD Storage) - Space Gray', 664)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (5004, 1, N'Apple MacBook Air', N'images\mb3.jpg', 46, 2000, N'Amazon', N'
2020 Apple MacBook Air with Apple M1 Chip (13-inch, 8GB RAM, 256GB SSD Storage) - Gold', 18)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (5005, 1, N'MacBook C23L', N'https://cdn.mos.cms.futurecdn.net/QMa729pgead8uFrroav5f5-1200-80.jpg', 0, 12, N'Amazon', N'OK', 13)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (5006, 2, N'ROG Gaming', N'images\as2.jpg', 5, 1000, N'Microsoft', N' Intel Hexa-Core i7-9750H Up to 4.5GHz| 32GB DDR4| 1TB HDD + 512GB SSD| 15.6" FHD |NVIDIA GeForce GTX 1650| 802.11ac...', 664)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (5009, 3, N'DH231 Lap', N'https://cdn.pico.vn/Product/41886/medium_363857_img7605.jpg', 12, 1300, N'Apple', N'OK', 664)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (5010, 3, N'DPro _LJ2', N'https://laptopg7.vn/images/thumbnails/300/300/detailed/102/Surface-Laptop-top-04-02-1621503997.png', 2, 1121, N'Apple', N'That will  be fine', 664)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (10001, 4, N'Lenovo S540', N'images\l3.jpg', 10, 2000, N'Amazon', N'Updating...', 13)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (10004, 1, N'Apple MacBook Pro', N'images\mb4.jpg', 15, 230, N'Amazon', N'2019 Apple MacBook Pro (16-inch, 16GB RAM, 1TB Storage, 2.3GHz Intel Core i9) - Silver', 13)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (10007, 1, N'MacBook Q1', N'https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/3/15/637514121061771814_hp-pavilion-15-eg0008tu-vang-1.jpg', 10, 110, N'Microsoft', N'Ok Product', 13)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (10009, 4, N'Lenovo Pro Laptop', N'http://laptopnamphong.com.vn/Cms_Data/Contents/admin/Media/%E1%BA%A3nh/Nhung-dieu-can-luu-y-khi-chon-mua-laptop-gaming-phu-hop-2.jpg', 5, 1222, N'VinGroup', N'Pro max vip', 13)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (10018, 1, N'M37', N'https://media.istockphoto.com/photos/macbook-pro-16-inch-with-touchbar-front-view-picture-id1202959798?s=170667a', 4, 2000, N'Apple', N'Nice Product', 664)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (100011, 4, N'LD', N'http://bizweb.dktcdn.net/100/330/208/files/1-laptop-lenovo-cua-nuoc-nao.jpg?v=1611243949394', 1, 990, N'Apple', N'Nice', 13)
INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor], [sell_ID]) VALUES (100017, 4, N'Vip ', N'https://lh6.googleusercontent.com/zlStuOCL3DjibIeuBa0hTb_4yDh-5WMfMMMzWAFHo6Iw9X8GXQaXTPdh3G5SvZDjarN9Xcx6AKB4FBThhzthd6Gwk_JObAmC0ZVEnW-1_20EIX_Xzid7PBFdByzib7mqztbbdR_i', 4, 1200, N'Amazon', N'THE BEST LAPTOPS FOR SENIORS OF 2020 COMPARED & REVIEWED', 13)
GO
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (13, N'duc', N'123', CAST(N'2000-01-04' AS Date), N'Male', N'duc123@gmail.com', N'0323473641', N'Bac Ninh', N'2', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (14, N'linh', N'123', CAST(N'1997-02-04' AS Date), N'Female', N'linhntHE141623@gmail.com', N'0383437423', N'Hung Yen-My Hao', N'1', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (17, N'trang', N'456', CAST(N'2001-05-12' AS Date), N'Female', N'trangnv2@gmail.com', N'0247634632', N'Quang Ninh', N'1', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (18, N'nhung', N'456', CAST(N'2011-06-12' AS Date), N'Female', N'nhungvt@gmail.com', N'0327467362', N'Yen Bai', N'2', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (21, N'test', N'test', CAST(N'2015-05-04' AS Date), N'Male', N'duche1@gmail.com', N'0962491151', N'hochiminh', N'2', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (24, N'user2', N'1231', CAST(N'2015-05-11' AS Date), N'Female', N'linh@gmail.com', N'0983435628', N'Ho Chi Minh', N'2', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (27, N'nana', N'nana', CAST(N'2000-01-02' AS Date), N'Male', N'nana123@gmail.com', N'0347389578', N'Nam Dinh', N'2', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (32, N'ducnv', N'123', CAST(N'1994-12-12' AS Date), N'Male', N'ducnvhe141646@fpt.edu.vn', N'0356645824', N'Tuyen Quang', N'2', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (54, N'hai', N'hai', CAST(N'1980-01-11' AS Date), N'Male', N'hai123@gmail.com', N'0347385578', N'Ho Chi Minh', N'2', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (74, N'hai', N'123aq', CAST(N'2003-07-08' AS Date), N'Male', N'hailt@fpt.edu.vn', N'0246757372', N'Ha Noi', N'2', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (90, N'duylong', N'123', CAST(N'0013-01-10' AS Date), N'Male', N'longdt@gmail.com', N'0228374831', N'Hai Phong', N'3', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (170, N'thutrang', N'123', CAST(N'2012-07-28' AS Date), N'Male', N'trang@gmail.com', N'0356645824', N'Ha Noi', N'2', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (234, N'thuy', N'123456', CAST(N'1992-01-02' AS Date), N'Male', N'thuyvl@fpt.edu.vn', N'0356645824', N'Bac Giang', N'2', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (239, N'cham', N'123', CAST(N'2011-12-12' AS Date), N'Female', N'cham@fpt.edu.vn', N'0356645824', N'Ninh Binh', N'3', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (321, N'trinh', N'456', CAST(N'2010-12-11' AS Date), N'Male', N'trang@1gmail.com', N'036888929', N'Nam Dinh', N'3', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (414, N'thuylinh', N'123', CAST(N'2002-12-11' AS Date), N'Female', N'nguyenvanduc14012000@gmail.com', N'0356645824', N'Yen Bai', N'3', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (454, N'vuthiquynh', N'vu', CAST(N'0033-11-21' AS Date), N'Female', N'vtquynh123@gmail.com', N'0348358475', N'Hoa Lac', N'2', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (487, N'linhdan', N'123', CAST(N'2003-05-16' AS Date), N'Female', N'linhdan123@gmail.com', N'0224582375', N'An Giang', N'2', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (519, N'thuytrang', N'123', CAST(N'2011-12-11' AS Date), N'Female', N'nguyenvanduc14012000@gmail.com', N'0356645824', N'Bac Giang', N'2', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (625, N'duc123', N'123', CAST(N'2007-12-12' AS Date), N'Male', N'ducnvhe141646@fpt.edu.vn', N'0356645824', N'Lao Cai', N'3', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (664, N'NgoThiHue', N'hue', CAST(N'0019-12-19' AS Date), N'Female', N'hue@gmail.com', N'022458237711', N'Yen Bai', N'2', 0)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (775, N'men', N'123', CAST(N'2018-02-07' AS Date), N'Male', N'men@gmail.com', N'0356645824', N'Bac Giang', N'2', 1)
INSERT [dbo].[user] ([id_user], [username], [password], [dob], [gender], [email], [phone], [address], [role], [Block]) VALUES (832, N'trung', N'123', CAST(N'2000-01-11' AS Date), N'Male', N'trungtb@gmail.com', N'0356123439', N'Quang Ninh', N'2', 0)
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([cid])
REFERENCES [dbo].[user] ([id_user])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Order] FOREIGN KEY([oid])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Order]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[product] ([id_pro])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([id_cat])
REFERENCES [dbo].[category] ([id_cat])
GO
