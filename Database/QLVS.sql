--- create the database ---
USE [master]
GO
DROP Database [DAILYVESO]
GO
CREATE DATABASE [DAILYVESO]
GO
--- create the tables ---

USE [DAILYVESO]
GO
CREATE TABLE [VESO]
(
	[MAVS] [INT] NOT NULL IDENTITY(1,1),
	[TINH] [NVARCHAR](100) NULL,
	[TINHTRANG] [INT],
	CONSTRAINT [PK_VESO] PRIMARY KEY ([MAVS])
)
GO
CREATE TABLE [DAILY]
(
	[MADL] [INT] NOT NULL IDENTITY(1,1),
	[TEN] [NVARCHAR](100) NULL,
	[TINHTRANG] [INT],
	CONSTRAINT [PK_DAILY] PRIMARY KEY ([MADL])
)
GO
CREATE TABLE [SOLUONGDANGKY]
(
	[MASLDK] [INT] NOT NULL IDENTITY(1,1),
	[MADL] [INT] NULL,
	[NGAY] [DATE] NULL,
	[SLDANGKY] [INT] NULL,
	CONSTRAINT [PK_SOLUONGDANGKY] PRIMARY KEY ([MASLDK])
)
GO
CREATE TABLE [PHANPHOI]
(
	[MAPP] [INT] NOT NULL IDENTITY(1,1),
	[MAVS] [INT] NULL,
	[MADL] [INT] NULL,
	[NGAY] [DATE] NULL,
	[SLGIAO] [INT] NULL,
	[SLBAN] [INT] NULL,
	[TINHTRANG] [INT],
	CONSTRAINT [PK_PHANPHOI] PRIMARY KEY ([MAPP])
)
GO
CREATE TABLE [GIAI]
(
	[MAGIAI] [INT] NOT NULL IDENTITY(1,1),
	[TEN] [NVARCHAR](50) NULL,
	[TIENTHUONG] [MONEY],
	[TINHTRANG] [INT],
	CONSTRAINT [PK_GIAI] PRIMARY KEY ([MAGIAI])
)
GO
CREATE TABLE [KETQUA]
(
	[MAKQ] [INT] NOT NULL IDENTITY(1,1),
	[MAVS] [INT] NULL,
	[NGAY] [DATE] NULL,
	[MAGIAI] [INT] NULL,
	[SOTRUNG] [VARCHAR](6) NULL,
	[TINHTRANG] [INT],
	CONSTRAINT [PK_KETQUA] PRIMARY KEY ([MAKQ])
)
GO
CREATE TABLE [PHIEUTHU]
(
	[MAPT] [INT] NOT NULL IDENTITY(1,1),
	[MADL] [INT] NULL,
	[NGAY] [DATE] NULL,
	[TIEN] [MONEY] NULL,
	[TINHTRANG] [INT],
	CONSTRAINT [PK_PHIEUTHU] PRIMARY KEY ([MAPT])
)
GO
CREATE TABLE [PHIEUCHI]
(
	[MAPC] [INT] NOT NULL IDENTITY(1,1),
	[NGAY] [DATE] NULL,
	[TIEN] [MONEY] NULL,
	[TINHTRANG] [INT],
	CONSTRAINT [PK_PHIEUCHI] PRIMARY KEY ([MAPC])
)
GO

CREATE TABLE [HOAHONG]
(
	[MAHH] [INT] NOT NULL IDENTITY(1,1),
	[NGAY] [DATE] NULL,
	[TILE] [FLOAT],
	[TINHTRANG] [INT],
	CONSTRAINT [PK_HH] PRIMARY KEY ([MAHH])
)

--- Add the foreign key ---

ALTER TABLE [SOLUONGDANGKY]
ADD CONSTRAINT [FK_SOLUONGDANGKY_MADL]
	FOREIGN KEY ([MADL])
	REFERENCES [DAILY]([MADL])
GO
ALTER TABLE [PHANPHOI]
ADD CONSTRAINT [FK_PHANPHOI_MAVS]
	FOREIGN KEY ([MAVS])
	REFERENCES [VESO]([MAVS])
GO
ALTER TABLE [PHANPHOI]
ADD CONSTRAINT [FK_PHANPHOI_MADL]
	FOREIGN KEY ([MADL])
	REFERENCES [DAILY]([MADL])
GO
ALTER TABLE [KETQUA]
ADD CONSTRAINT [FK_KETQUA_MAVS]
	FOREIGN KEY ([MAVS])
	REFERENCES [VESO]([MAVS])
GO
ALTER TABLE [KETQUA]
ADD CONSTRAINT [FK_KETQUA_MAGIAI]
	FOREIGN KEY ([MAGIAI])
	REFERENCES [GIAI]([MAGIAI])
GO
ALTER TABLE [PHIEUTHU]
ADD CONSTRAINT [FK_PHIEUTHU_MADL]
	FOREIGN KEY ([MADL])
	REFERENCES [DAILY]([MADL])
GO

--- Insert the test data ---

INSERT INTO VESO(TINH,TINHTRANG) VALUES(N'Tỉnh 1',1)
INSERT INTO VESO(TINH,TINHTRANG) VALUES(N'Tỉnh 2',1)
INSERT INTO VESO(TINH,TINHTRANG) VALUES(N'Tỉnh 3',1)

INSERT INTO DAILY(TEN,TINHTRANG) VALUES(N'Đại lí 1',1)
INSERT INTO DAILY(TEN,TINHTRANG) VALUES(N'Đại lí 2',1)
INSERT INTO DAILY(TEN,TINHTRANG) VALUES(N'Đại lí 3',1)

INSERT INTO GIAI(TEN,TIENTHUONG,TINHTRANG) VALUES(N'Giải đặc biệt',2000000000,1)
INSERT INTO GIAI(TEN,TIENTHUONG,TINHTRANG) VALUES(N'Giải nhất',30000000,1)
INSERT INTO GIAI(TEN,TIENTHUONG,TINHTRANG) VALUES(N'Giải nhì',15000000,1)
INSERT INTO GIAI(TEN,TIENTHUONG,TINHTRANG) VALUES(N'Giải ba',10000000,1)
INSERT INTO GIAI(TEN,TIENTHUONG,TINHTRANG) VALUES(N'Giải tư',3000000,1)
INSERT INTO GIAI(TEN,TIENTHUONG,TINHTRANG) VALUES(N'Giải năm',1000000,1)
INSERT INTO GIAI(TEN,TIENTHUONG,TINHTRANG) VALUES(N'Giải sáu',400000,1)
INSERT INTO GIAI(TEN,TIENTHUONG,TINHTRANG) VALUES(N'Giải bảy',200000,1)
INSERT INTO GIAI(TEN,TIENTHUONG,TINHTRANG) VALUES(N'Giải tám',100000,1)
INSERT INTO GIAI(TEN,TIENTHUONG,TINHTRANG) VALUES(N'Giải phụ đặc biệt',50000000,1)
INSERT INTO GIAI(TEN,TIENTHUONG,TINHTRANG) VALUES(N'Giải khuyến khích',6000000,1)

INSERT INTO SOLUONGDANGKY(MADL,NGAY,SLDANGKY) VALUES('1','01/20/2018',100)
INSERT INTO SOLUONGDANGKY(MADL,NGAY,SLDANGKY) VALUES('1','02/20/2018',200)
INSERT INTO SOLUONGDANGKY(MADL,NGAY,SLDANGKY) VALUES('2','01/20/2018',100)
INSERT INTO SOLUONGDANGKY(MADL,NGAY,SLDANGKY) VALUES('3','01/20/2018',100)

INSERT INTO PHANPHOI(MAVS,MADL,NGAY,SLGIAO,SLBAN,TINHTRANG) VALUES(1,1,'01/25/2018',100,90,1)
INSERT INTO PHANPHOI(MAVS,MADL,NGAY,SLGIAO,SLBAN,TINHTRANG) VALUES(2,1,'01/25/2018',100,80,1)
INSERT INTO PHANPHOI(MAVS,MADL,NGAY,SLGIAO,SLBAN,TINHTRANG) VALUES(1,1,'01/26/2018',100,70,1)

INSERT INTO HOAHONG(NGAY,TILE,TINHTRANG) VALUES('01/01/1970',0.1,1)

--- show the tables ---

SELECT * FROM VESO
GO
SELECT * FROM DAILY
GO
SELECT * FROM SOLUONGDANGKY
GO
SELECT * FROM PHANPHOI
GO
SELECT * FROM GIAI
GO
SELECT * FROM KETQUA
GO
SELECT * FROM PHIEUTHU
GO
SELECT * FROM PHIEUCHI
GO
SELECT * FROM HOAHONG
GO

--- the end ---