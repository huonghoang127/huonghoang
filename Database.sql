USE [master]
GO
/****** Object:  Database [QLTSDH]    Script Date: 6/15/2020 12:33:43 AM ******/
CREATE DATABASE [QLTSDH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLTSDH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLTSDH.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLTSDH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLTSDH_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLTSDH] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLTSDH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLTSDH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLTSDH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLTSDH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLTSDH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLTSDH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLTSDH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLTSDH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLTSDH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLTSDH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLTSDH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLTSDH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLTSDH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLTSDH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLTSDH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLTSDH] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLTSDH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLTSDH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLTSDH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLTSDH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLTSDH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLTSDH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLTSDH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLTSDH] SET RECOVERY FULL 
GO
ALTER DATABASE [QLTSDH] SET  MULTI_USER 
GO
ALTER DATABASE [QLTSDH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLTSDH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLTSDH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLTSDH] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLTSDH] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLTSDH', N'ON'
GO
USE [QLTSDH]
GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 6/15/2020 12:33:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiemChuan]    Script Date: 6/15/2020 12:33:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DiemChuan](
	[MaNganh] [char](10) NOT NULL,
	[TenNganh] [nvarchar](30) NOT NULL,
	[Diem] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DoUuTien]    Script Date: 6/15/2020 12:33:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DoUuTien](
	[MaUuTien] [char](10) NOT NULL,
	[MaHS] [nvarchar](10) NOT NULL,
	[DiemUuTien] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaUuTien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DSHS]    Script Date: 6/15/2020 12:33:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DSHS](
	[Mã Ngành] [char](10) NOT NULL,
	[Tên Ngành] [nvarchar](30) NOT NULL,
	[Mã HS] [nvarchar](10) NOT NULL,
	[Tên HS] [nvarchar](30) NOT NULL,
	[Tổng Điểm] [float] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HocSinh]    Script Date: 6/15/2020 12:33:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HocSinh](
	[MaHS] [nvarchar](10) NOT NULL,
	[TenHS] [nvarchar](30) NOT NULL,
	[GioiTinh] [nchar](3) NOT NULL,
	[CMND] [char](12) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[NoiSinh] [nvarchar](50) NOT NULL,
	[DanToc] [nvarchar](20) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[SoDT] [char](10) NOT NULL,
	[MaTinh] [char](10) NOT NULL,
	[MaHuyen] [char](10) NOT NULL,
	[MaTruong] [char](10) NOT NULL,
	[KhoiThi] [char](10) NOT NULL,
	[NamTN] [char](4) NOT NULL,
	[NgayNopDon] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NguyenVong]    Script Date: 6/15/2020 12:33:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguyenVong](
	[MaNV] [char](5) NOT NULL,
	[MaHS] [nvarchar](10) NOT NULL,
	[TenHS] [nvarchar](30) NOT NULL,
	[MaNganh] [char](10) NOT NULL,
	[TenNganh] [nvarchar](30) NOT NULL,
	[ThuTuNV] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuBaoDanh]    Script Date: 6/15/2020 12:33:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuBaoDanh](
	[SoPBD] [char](10) NOT NULL,
	[MaHS] [nvarchar](10) NOT NULL,
	[TenHS] [nvarchar](30) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[PhongThi] [char](10) NOT NULL,
	[NgayThi] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SoPBD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuBaoDiem]    Script Date: 6/15/2020 12:33:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuBaoDiem](
	[MaPhieuBD] [smallint] NOT NULL,
	[MaHS] [nvarchar](10) NOT NULL,
	[TenHS] [nvarchar](30) NOT NULL,
	[Mon1] [float] NOT NULL,
	[Mon2] [float] NOT NULL,
	[Mon3] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuBD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongTin]    Script Date: 6/15/2020 12:33:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThongTin](
	[MaHS] [nvarchar](10) NOT NULL,
	[TenHS] [nvarchar](30) NOT NULL,
	[GioiTinh] [nchar](3) NOT NULL,
	[CMND] [char](12) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[KhoiThi] [char](10) NOT NULL,
	[Mon1] [float] NOT NULL,
	[Mon2] [float] NOT NULL,
	[Mon3] [float] NOT NULL,
	[DiemUuTien] [float] NOT NULL,
	[MaNganh] [char](10) NOT NULL,
	[TenNganh] [nvarchar](30) NOT NULL,
	[ThuTuNV] [char](2) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau]) VALUES (N'admin', N'admin')
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN01      ', N'BHN', 25)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN02      ', N'BHD', 25)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN03      ', N'BHT', 26)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN04      ', N'BHA', 23)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN05      ', N'BHB', 25)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN06      ', N'BHR', 22)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN07      ', N'BHU', 23)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN08      ', N'BHI', 21)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN09      ', N'BHO', 28)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN10      ', N'BHP', 29)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN11      ', N'BHR', 24)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN12      ', N'BAT', 23)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN13      ', N'BBN', 25)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN14      ', N'BCN', 23.5)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN15      ', N'BDN', 25)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN16      ', N'BGN', 25.5)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN17      ', N'BEN', 25)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN18      ', N'BTN', 24)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN19      ', N'BUN', 25)
INSERT [dbo].[DiemChuan] ([MaNganh], [TenNganh], [Diem]) VALUES (N'MN20      ', N'BEN', 25)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'01        ', N'21013405', 0.5)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'02        ', N'21013406', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'03        ', N'21013407', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'04        ', N'21013408', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'05        ', N'21013409', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'06        ', N'21013410', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'07        ', N'21013411', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'08        ', N'21013412', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'09        ', N'21013413', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'10        ', N'21013414', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'11        ', N'21013415', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'12        ', N'21013416', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'13        ', N'21013417', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'14        ', N'21013418', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'15        ', N'21013419', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'16        ', N'21013420', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'17        ', N'21013421', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'18        ', N'21013422', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'19        ', N'21013423', 1)
INSERT [dbo].[DoUuTien] ([MaUuTien], [MaHS], [DiemUuTien]) VALUES (N'20        ', N'21013424', 1)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN01      ', N'BHN', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN02      ', N'BHD', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN03      ', N'BHT', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN04      ', N'BHA', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN05      ', N'BHB', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN06      ', N'BHR', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN07      ', N'BHU', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN08      ', N'BHI', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN11      ', N'BHR', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN12      ', N'BAT', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN13      ', N'BBN', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN14      ', N'BCN', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN15      ', N'BDN', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN16      ', N'BGN', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN17      ', N'BEN', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN18      ', N'BTN', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN19      ', N'BUN', N'21013405', N'Nguyễn Văn Hưng', 27.75)
INSERT [dbo].[DSHS] ([Mã Ngành], [Tên Ngành], [Mã HS], [Tên HS], [Tổng Điểm]) VALUES (N'MN01      ', N'BHN', N'21013406', N'Hoàng Thị Hường', 28.25)
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'', N'', N'   ', N'            ', CAST(N'2020-06-08' AS Date), N'', N'', N'', N'          ', N'          ', N'          ', N'          ', N'          ', N'    ', CAST(N'2020-06-08' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013405', N'Nguyễn Văn Hưng', N'Nam', N'030099003100', CAST(N'1999-04-09' AS Date), N'Hải Dương', N'Kinh', N'Bắc An - Chí Linh - Hải Dương', N'0964483842', N'21        ', N'02        ', N'02        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013406', N'Hoàng Thị Hường', N'Nữ ', N'030199002356', CAST(N'1999-03-23' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0356245215', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013407', N'Nguyễn Viết Kiên', N'Nam', N'030099002356', CAST(N'1999-06-23' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0324891270', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013408', N'Nguyễn Thị Ngân', N'Nữ ', N'030199002357', CAST(N'1999-04-24' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0975247674', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013409', N'Đinh Thị Nguyệt', N'Nữ ', N'030199001246', CAST(N'1999-12-23' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0335621456', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013410', N'Nguyễn Hồng Nhung', N'Nữ ', N'030199004656', CAST(N'1999-01-14' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0904210235', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013411', N'Vũ Tiến Mạnh', N'Nam', N'030199002356', CAST(N'1999-07-21' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0912458652', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013412', N'Nguyễn Đình Minh', N'Nam', N'030199002356', CAST(N'1999-02-02' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0325456202', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013413', N'Lê Hà Phương', N'Nam', N'030199002356', CAST(N'1999-03-13' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0142568741', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013414', N'Cao Thu Thảo', N'Nữ ', N'030199002356', CAST(N'1999-09-17' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0968535585', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013415', N'Nguyễn Thị Hồng Thắm', N'Nữ ', N'030199002356', CAST(N'1999-05-23' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0244555815', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013416', N'Vương Minh Thắng', N'Nam', N'030199002356', CAST(N'1999-05-05' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0968245242', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013417', N'Cao Thị Trang', N'Nữ ', N'030199002356', CAST(N'1999-02-28' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0369845615', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013418', N'Ngô Xuân Trường', N'Nam', N'030199002356', CAST(N'1999-01-21' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0987222815', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013419', N'Phạm Anh Tuân', N'Nam', N'030199002356', CAST(N'1999-12-02' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0356235235', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013420', N'Nguyễn Anh Tuấn', N'Nam', N'030199002356', CAST(N'1999-11-20' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0358425458', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013421', N'Vũ Hồng Vị', N'Nam', N'030199002356', CAST(N'1999-03-08' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0356257896', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013422', N'Nguyễn Văn Vịnh', N'Nam', N'030199002356', CAST(N'1999-07-14' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0352354255', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013423', N'Hà Thanh Tùng', N'Nam', N'030199002356', CAST(N'1999-07-14' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0356254202', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21013424', N'Vũ Thị Yên', N'Nữ ', N'030199002356', CAST(N'1999-06-06' AS Date), N'Hải Dương', N'Kinh', N'Bến Tắm - Chí Linh- Hải Dương', N'0353698755', N'21        ', N'02        ', N'01        ', N'A00       ', N'2017', CAST(N'2017-05-16' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'21022222', N'a', N'a  ', N'a           ', CAST(N'2020-06-07' AS Date), N'a', N'a', N'a', N'a         ', N'a         ', N'a         ', N'a         ', N'a         ', N'a   ', CAST(N'2020-06-07' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'22222', N'2', N'2  ', N'2           ', CAST(N'2020-02-07' AS Date), N'2', N'2', N'2', N'2         ', N'2         ', N'2         ', N'2         ', N'2         ', N'2   ', CAST(N'2020-06-07' AS Date))
INSERT [dbo].[HocSinh] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [NoiSinh], [DanToc], [DiaChi], [SoDT], [MaTinh], [MaHuyen], [MaTruong], [KhoiThi], [NamTN], [NgayNopDon]) VALUES (N'45', N'a', N'nam', N'55          ', CAST(N'2020-06-07' AS Date), N's', N's', N's', N's         ', N's         ', N's         ', N's         ', N's         ', N's   ', CAST(N'2020-06-07' AS Date))
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV01 ', N'21013405', N'Nguyễn Văn Hưng', N'MN01      ', N'BHN', N'1 ')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV02 ', N'21013405', N'Nguyễn Văn Hưng', N'MN02      ', N'BHD', N'2 ')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV03 ', N'21013405', N'Nguyễn Văn Hưng', N'MN03      ', N'BHT', N'3 ')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV04 ', N'21013405', N'Nguyễn Văn Hưng', N'MN04      ', N'BHA', N'4 ')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV05 ', N'21013405', N'Nguyễn Văn Hưng', N'MN05      ', N'BHB', N'5 ')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV06 ', N'21013405', N'Nguyễn Văn Hưng', N'MN06      ', N'BHR', N'6 ')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV07 ', N'21013405', N'Nguyễn Văn Hưng', N'MN07      ', N'BHU', N'7 ')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV08 ', N'21013405', N'Nguyễn Văn Hưng', N'MN08      ', N'BHI', N'8 ')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV09 ', N'21013405', N'Nguyễn Văn Hưng', N'MN09      ', N'BHO', N'9 ')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV10 ', N'21013405', N'Nguyễn Văn Hưng', N'MN10      ', N'BHP', N'10')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV11 ', N'21013405', N'Nguyễn Văn Hưng', N'MN11      ', N'BHR', N'11')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV12 ', N'21013405', N'Nguyễn Văn Hưng', N'MN12      ', N'BAT', N'12')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV13 ', N'21013405', N'Nguyễn Văn Hưng', N'MN13      ', N'BBN', N'13')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV14 ', N'21013405', N'Nguyễn Văn Hưng', N'MN14      ', N'BCN', N'14')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV15 ', N'21013405', N'Nguyễn Văn Hưng', N'MN15      ', N'BDN', N'15')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV16 ', N'21013405', N'Nguyễn Văn Hưng', N'MN16      ', N'BGN', N'16')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV17 ', N'21013405', N'Nguyễn Văn Hưng', N'MN17      ', N'BEN', N'17')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV18 ', N'21013405', N'Nguyễn Văn Hưng', N'MN18      ', N'BTN', N'18')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV19 ', N'21013405', N'Nguyễn Văn Hưng', N'MN19      ', N'BUN', N'19')
INSERT [dbo].[NguyenVong] ([MaNV], [MaHS], [TenHS], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'NV20 ', N'21013406', N'Hoàng Thị Hường', N'MN01      ', N'BHN', N'1 ')
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'15        ', N'21013405', N'Nguyễn Văn Hưng', CAST(N'1999-04-09' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'16        ', N'21013406', N'Hoàng Thị Hường', CAST(N'1999-03-23' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'17        ', N'21013407', N'Nguyễn Viết Kiên', CAST(N'1999-06-23' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'18        ', N'21013408', N'Nguyễn Thị Ngân', CAST(N'1999-04-24' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'19        ', N'21013409', N'Đinh Thị Nguyệt', CAST(N'1999-12-23' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'20        ', N'21013410', N'Nguyễn Hồng Nhung', CAST(N'1999-01-14' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'21        ', N'21013411', N'Vũ Tiến Mạnh', CAST(N'1999-07-21' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'22        ', N'21013412', N'Nguyễn Đình Minh', CAST(N'1999-02-02' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'23        ', N'21013413', N'Lê Hà Phương', CAST(N'1999-03-13' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'24        ', N'21013414', N'Cao Thu Thảo', CAST(N'1999-09-17' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'25        ', N'21013415', N'Nguyễn Thị Hồng Thắm', CAST(N'1999-05-23' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'26        ', N'21013416', N'Vương Minh Thắng', CAST(N'1999-05-05' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'27        ', N'21013417', N'Cao Thị Trang', CAST(N'1999-02-28' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'28        ', N'21013418', N'Ngô Xuân Trường', CAST(N'1999-01-21' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'29        ', N'21013419', N'Phạm Anh Tuân', CAST(N'1999-12-02' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'30        ', N'21013420', N'Nguyễn Anh Tuấn', CAST(N'1999-11-20' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'31        ', N'21013421', N'Vũ Hồng Vị', CAST(N'1999-03-08' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'32        ', N'21013422', N'Nguyễn Văn Vịnh', CAST(N'1999-07-14' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'33        ', N'21013423', N'Hà Thanh Tùng', CAST(N'1999-07-14' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDanh] ([SoPBD], [MaHS], [TenHS], [NgaySinh], [PhongThi], [NgayThi]) VALUES (N'34        ', N'21013424', N'Vũ Thị Yên', CAST(N'1999-06-06' AS Date), N'103       ', CAST(N'2017-06-27' AS Date))
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (15, N'21013405', N'Nguyễn Văn Hưng', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (16, N'21013406', N'Hoàng Thị Hường', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (17, N'21013407', N'Nguyễn Viết Kiên', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (18, N'21013408', N'Nguyễn Thị Ngân', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (19, N'21013409', N'Đinh Thị Nguyệt', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (20, N'21013410', N'Nguyễn Hồng Nhung', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (21, N'21013411', N'Vũ Tiến Mạnh', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (22, N'21013412', N'Nguyễn Đình Minh', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (23, N'21013413', N'Lê Hà Phương', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (24, N'21013414', N'Cao Thu Thảo', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (25, N'21013415', N'Nguyễn Thị Hồng Thắm', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (26, N'21013416', N'Vương Minh Thắng', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (27, N'21013417', N'Cao Thị Trang', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (28, N'21013418', N'Ngô Xuân Trường', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (29, N'21013419', N'Phạm Anh Tuân', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (30, N'21013420', N'Nguyễn Anh Tuấnn', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (31, N'21013421', N'Vũ Hồng Vị', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (32, N'21013422', N'Nguyễn Văn Vịnh', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (33, N'21013423', N'Hà Thanh Tùng', 9, 9.25, 9)
INSERT [dbo].[PhieuBaoDiem] ([MaPhieuBD], [MaHS], [TenHS], [Mon1], [Mon2], [Mon3]) VALUES (34, N'21013424', N'Vũ Thị Yên', 9, 9.25, 9)
INSERT [dbo].[ThongTin] ([MaHS], [TenHS], [GioiTinh], [CMND], [NgaySinh], [DiaChi], [KhoiThi], [Mon1], [Mon2], [Mon3], [DiemUuTien], [MaNganh], [TenNganh], [ThuTuNV]) VALUES (N'21013406', N'Hoàng Thị Hường', N'Nữ ', N'030199002356', CAST(N'1999-03-23' AS Date), N'Bến Tắm - Chí Linh- Hải Dương', N'A00       ', 9, 9.25, 9, 1, N'MN01      ', N'BHN', N'1 ')
ALTER TABLE [dbo].[DoUuTien]  WITH CHECK ADD FOREIGN KEY([MaHS])
REFERENCES [dbo].[HocSinh] ([MaHS])
GO
ALTER TABLE [dbo].[NguyenVong]  WITH CHECK ADD FOREIGN KEY([MaNganh])
REFERENCES [dbo].[DiemChuan] ([MaNganh])
GO
ALTER TABLE [dbo].[NguyenVong]  WITH CHECK ADD FOREIGN KEY([MaHS])
REFERENCES [dbo].[HocSinh] ([MaHS])
GO
ALTER TABLE [dbo].[PhieuBaoDanh]  WITH CHECK ADD FOREIGN KEY([MaHS])
REFERENCES [dbo].[HocSinh] ([MaHS])
GO
ALTER TABLE [dbo].[PhieuBaoDiem]  WITH CHECK ADD FOREIGN KEY([MaHS])
REFERENCES [dbo].[HocSinh] ([MaHS])
GO
USE [master]
GO
ALTER DATABASE [QLTSDH] SET  READ_WRITE 
GO
