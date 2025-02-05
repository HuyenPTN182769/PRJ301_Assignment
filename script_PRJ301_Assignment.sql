USE [PRJ301_FALL2022_Assignment]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 17-Mar-23 11:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
	[aid] [int] NOT NULL,
	[fullname] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attandance]    Script Date: 17-Mar-23 11:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attandance](
	[sesid] [int] NOT NULL,
	[stdid] [int] NOT NULL,
	[present] [bit] NOT NULL,
	[description] [varchar](150) NOT NULL,
	[record_time] [datetime] NULL,
 CONSTRAINT [PK_Attandance] PRIMARY KEY CLUSTERED 
(
	[sesid] ASC,
	[stdid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 17-Mar-23 11:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[fname] [varchar](150) NOT NULL,
	[url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 17-Mar-23 11:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
	[subid] [int] NOT NULL,
	[lid] [int] NOT NULL,
	[sem] [varchar](150) NOT NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 17-Mar-23 11:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[lid] [int] NOT NULL,
	[lname] [varchar](150) NULL,
	[lfullname] [nvarchar](200) NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 17-Mar-23 11:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Account]    Script Date: 17-Mar-23 11:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Account](
	[rid] [int] NOT NULL,
	[username] [varchar](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 17-Mar-23 11:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[rid] [int] NOT NULL,
	[fid] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 17-Mar-23 11:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 17-Mar-23 11:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[sesid] [int] NOT NULL,
	[gid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[tid] [int] NOT NULL,
	[index] [int] NOT NULL,
	[lid] [int] NOT NULL,
	[attanded] [bit] NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[sesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 17-Mar-23 11:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[stdid] [int] NOT NULL,
	[stdname] [nvarchar](150) NOT NULL,
	[stdcode] [varchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[stdid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Group]    Script Date: 17-Mar-23 11:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Group](
	[stdid] [int] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Student_Group] PRIMARY KEY CLUSTERED 
(
	[stdid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 17-Mar-23 11:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subid] [int] NOT NULL,
	[subname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 17-Mar-23 11:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[tid] [int] NOT NULL,
	[description] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [displayname], [aid], [fullname]) VALUES (N'anhntq', N'123', N'AnhNTQ', 4, N'Nguyễn Thị Quỳnh Anh')
INSERT [dbo].[Account] ([username], [password], [displayname], [aid], [fullname]) VALUES (N'bantq', N'123', N'BanTQ', 3, N'Trần Quý Ban')
INSERT [dbo].[Account] ([username], [password], [displayname], [aid], [fullname]) VALUES (N'duyct', N'123', N'DuyCT', 7, N'Chu Thành Duy')
INSERT [dbo].[Account] ([username], [password], [displayname], [aid], [fullname]) VALUES (N'giangnxt', N'123', N'GiangNXT', 5, N'Nguyên Xuân Trường Giang')
INSERT [dbo].[Account] ([username], [password], [displayname], [aid], [fullname]) VALUES (N'huyenptn', N'123', N'HuyenPTN', 1, N'Phạm Thị Ngọc Huyền')
INSERT [dbo].[Account] ([username], [password], [displayname], [aid], [fullname]) VALUES (N'longnt', N'123', N'LongNT', 2, N'Nguyễn Thành Long')
INSERT [dbo].[Account] ([username], [password], [displayname], [aid], [fullname]) VALUES (N'minhnt', N'123', N'MinhNT', 6, N'Nguyễn Trường Minh')
INSERT [dbo].[Account] ([username], [password], [displayname], [aid], [fullname]) VALUES (N'sonnt', N'123', N'SonNT5', 1, N'Ngô Tùng Sơn')
INSERT [dbo].[Account] ([username], [password], [displayname], [aid], [fullname]) VALUES (N'trangdt', N'123', N'TrangDT', 3, N'Đặng Thùy Trang')
INSERT [dbo].[Account] ([username], [password], [displayname], [aid], [fullname]) VALUES (N'tuanvm', N'123', N'TuanVM2', 2, N'Vương Minh Tuấn')
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 1, 1, N'', CAST(N'2023-03-17T20:51:44.880' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 2, 1, N'', CAST(N'2023-03-17T20:51:44.880' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 3, 1, N'', CAST(N'2023-03-17T20:51:44.880' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 4, 1, N'', CAST(N'2023-03-17T20:51:44.880' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 1, 1, N'', CAST(N'2023-03-17T20:51:58.420' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 2, 1, N'', CAST(N'2023-03-17T20:51:58.420' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 3, 1, N'', CAST(N'2023-03-17T20:51:58.420' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 4, 1, N'', CAST(N'2023-03-17T20:51:58.420' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 1, 1, N'', CAST(N'2023-03-17T20:52:17.020' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 2, 1, N'', CAST(N'2023-03-17T20:52:17.020' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 3, 1, N'', CAST(N'2023-03-17T20:52:17.020' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 4, 1, N'', CAST(N'2023-03-17T20:52:17.020' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 7, 1, N'', CAST(N'2023-03-17T20:52:17.020' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, 1, 1, N'', CAST(N'2023-03-17T20:52:20.507' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, 2, 1, N'', CAST(N'2023-03-17T20:52:20.507' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, 3, 1, N'', CAST(N'2023-03-17T20:52:20.507' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, 4, 1, N'', CAST(N'2023-03-17T20:52:20.507' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, 7, 0, N'', CAST(N'2023-03-17T20:52:20.507' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (11, 1, 1, N'', CAST(N'2023-03-17T20:52:34.063' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (11, 2, 1, N'', CAST(N'2023-03-17T20:52:34.063' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (11, 3, 1, N'', CAST(N'2023-03-17T20:52:34.063' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (11, 4, 1, N'', CAST(N'2023-03-17T20:52:34.063' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (12, 1, 1, N'', CAST(N'2023-03-17T20:52:37.817' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (12, 2, 0, N'', CAST(N'2023-03-17T20:52:37.817' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (12, 3, 1, N'', CAST(N'2023-03-17T20:52:37.817' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (12, 4, 1, N'', CAST(N'2023-03-17T20:52:37.817' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (16, 5, 1, N'', CAST(N'2023-03-17T20:51:50.313' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (16, 6, 1, N'', CAST(N'2023-03-17T20:51:50.313' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (16, 7, 1, N'', CAST(N'2023-03-17T20:51:50.313' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (17, 5, 0, N'', CAST(N'2023-03-17T20:52:04.210' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (17, 6, 1, N'', CAST(N'2023-03-17T20:52:04.210' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (17, 7, 1, N'', CAST(N'2023-03-17T20:52:04.210' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (21, 5, 1, N'', CAST(N'2023-03-17T21:05:20.343' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (21, 6, 1, N'', CAST(N'2023-03-17T21:05:20.343' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (21, 7, 1, N'', CAST(N'2023-03-17T21:05:20.343' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (22, 5, 1, N'', CAST(N'2023-03-17T21:05:58.850' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (22, 6, 1, N'', CAST(N'2023-03-17T21:05:58.853' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (22, 7, 1, N'', CAST(N'2023-03-17T21:05:58.853' AS DateTime))
GO
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (1, N'Timetable for Lecturer', N'/lecturer/timetable')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (2, N'Take Attendance', N'/lecturer/takeatt')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (3, N'Check Attendance ', N'/lecturer/checkatt')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (4, N'Timetable for Student', N'/student/timetable')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (5, N'Home for Lecturer', N'/lecturer/home')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (6, N'Home for Student', N'/student/home')
GO
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (1, N'SE1643', 1, 1, N'SPRING', 2023)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (2, N'SE1643', 2, 3, N'SPRING', 2023)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (3, N'SE1643', 3, 2, N'SPRING', 2023)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (4, N'SE1644', 1, 3, N'SPRING', 2023)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (5, N'SE1644', 3, 2, N'SPRING', 2023)
GO
INSERT [dbo].[Lecturer] ([lid], [lname], [lfullname]) VALUES (1, N'SonNT5', N'Ngô Tùng Sơn')
INSERT [dbo].[Lecturer] ([lid], [lname], [lfullname]) VALUES (2, N'TuanVM2', N'Vương Minh Tuấn')
INSERT [dbo].[Lecturer] ([lid], [lname], [lfullname]) VALUES (3, N'BanTQ', N'Trần Quý Ban')
GO
INSERT [dbo].[Role] ([rid], [rname]) VALUES (1, N'lecturer')
INSERT [dbo].[Role] ([rid], [rname]) VALUES (2, N'student')
GO
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (1, N'sonnt')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (1, N'bantq')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (1, N'tuanvm')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'huyenptn')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'longnt')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'trangdt')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'anhntq')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'minhnt')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'giangnxt')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'duyct')
GO
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 1)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 2)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 3)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 4)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 5)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 6)
GO
INSERT [dbo].[Room] ([rid], [rname]) VALUES (1, N'DE-C201')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (2, N'DE-C202')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (3, N'DE-C203')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (4, N'DE-C204')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (5, N'DE-C205')
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (1, 1, 1, CAST(N'2023-03-16' AS Date), 1, 1, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (2, 1, 1, CAST(N'2023-03-17' AS Date), 1, 2, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (3, 1, 1, CAST(N'2023-03-18' AS Date), 1, 3, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (4, 1, 1, CAST(N'2023-03-21' AS Date), 1, 4, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (5, 1, 1, CAST(N'2023-03-22' AS Date), 1, 5, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (6, 2, 2, CAST(N'2023-03-16' AS Date), 2, 1, 3, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (7, 2, 2, CAST(N'2023-03-17' AS Date), 2, 2, 3, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (8, 2, 2, CAST(N'2023-03-18' AS Date), 2, 3, 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (9, 2, 2, CAST(N'2023-03-21' AS Date), 2, 4, 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (10, 2, 2, CAST(N'2023-03-22' AS Date), 2, 5, 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (11, 3, 3, CAST(N'2023-03-16' AS Date), 4, 1, 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (12, 3, 3, CAST(N'2023-03-17' AS Date), 4, 2, 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (13, 3, 3, CAST(N'2023-03-18' AS Date), 4, 3, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (14, 3, 3, CAST(N'2023-03-21' AS Date), 4, 4, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (15, 3, 3, CAST(N'2023-03-22' AS Date), 4, 5, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (16, 4, 1, CAST(N'2023-03-16' AS Date), 3, 1, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (17, 4, 1, CAST(N'2023-03-17' AS Date), 3, 2, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (18, 4, 1, CAST(N'2023-03-18' AS Date), 3, 3, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (19, 4, 1, CAST(N'2023-03-21' AS Date), 3, 4, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (20, 4, 1, CAST(N'2023-03-22' AS Date), 3, 5, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (21, 5, 4, CAST(N'2023-03-16' AS Date), 2, 1, 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (22, 5, 4, CAST(N'2023-03-17' AS Date), 2, 2, 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (23, 5, 4, CAST(N'2023-03-18' AS Date), 2, 3, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (24, 5, 4, CAST(N'2023-03-21' AS Date), 2, 4, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (25, 5, 4, CAST(N'2023-03-22' AS Date), 2, 5, 2, 0)
GO
INSERT [dbo].[Student] ([stdid], [stdname], [stdcode]) VALUES (1, N'Phạm Thị Ngọc Huyền', N'HE160769')
INSERT [dbo].[Student] ([stdid], [stdname], [stdcode]) VALUES (2, N'Nguyễn Thành Long', N'HE162222')
INSERT [dbo].[Student] ([stdid], [stdname], [stdcode]) VALUES (3, N'Đặng Thùy Trang', N'HE163333')
INSERT [dbo].[Student] ([stdid], [stdname], [stdcode]) VALUES (4, N'Nguyễn Thị Quỳnh Anh', N'HE164444')
INSERT [dbo].[Student] ([stdid], [stdname], [stdcode]) VALUES (5, N'Nguyễn Trường Minh', N'HE165555')
INSERT [dbo].[Student] ([stdid], [stdname], [stdcode]) VALUES (6, N'Nguyên Xuân Trường Giang', N'HE166666')
INSERT [dbo].[Student] ([stdid], [stdname], [stdcode]) VALUES (7, N'Chu Thành Duy', N'HE167777')
GO
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (1, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (1, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (1, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (2, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (2, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (2, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (3, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (3, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (3, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (4, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (4, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (4, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (5, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (5, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (6, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (6, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 5)
GO
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (1, N'PRJ301')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (2, N'DBI202')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (3, N'LAB211')
GO
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (1, N'7:30 - 9:00')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (2, N'9:10 - 10:40')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (3, N'10:50 - 12:20')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (4, N'12:50 - 14:20')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (5, N'14:30 - 16:00')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (6, N'16:10 - 17:40')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (7, N'18:00 - 19:30')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (8, N'19:40 - 21:10')
GO
ALTER TABLE [dbo].[Attandance]  WITH CHECK ADD  CONSTRAINT [FK_Attandance_Session] FOREIGN KEY([sesid])
REFERENCES [dbo].[Session] ([sesid])
GO
ALTER TABLE [dbo].[Attandance] CHECK CONSTRAINT [FK_Attandance_Session]
GO
ALTER TABLE [dbo].[Attandance]  WITH CHECK ADD  CONSTRAINT [FK_Attandance_Student] FOREIGN KEY([stdid])
REFERENCES [dbo].[Student] ([stdid])
GO
ALTER TABLE [dbo].[Attandance] CHECK CONSTRAINT [FK_Attandance_Student]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Lecturer]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([subid])
REFERENCES [dbo].[Subject] ([subid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Account]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Role]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Feature]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Role]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Group]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Lecturer]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Room] FOREIGN KEY([rid])
REFERENCES [dbo].[Room] ([rid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Room]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_TimeSlot] FOREIGN KEY([tid])
REFERENCES [dbo].[TimeSlot] ([tid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_TimeSlot]
GO
ALTER TABLE [dbo].[Student_Group]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Student_Group] CHECK CONSTRAINT [FK_Student_Group_Group]
GO
ALTER TABLE [dbo].[Student_Group]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group_Student] FOREIGN KEY([stdid])
REFERENCES [dbo].[Student] ([stdid])
GO
ALTER TABLE [dbo].[Student_Group] CHECK CONSTRAINT [FK_Student_Group_Student]
GO
USE [master]
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET  READ_WRITE 
GO
