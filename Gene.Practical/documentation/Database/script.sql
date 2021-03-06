USE [master]
GO
/****** Object:  Database [GeneDB]    Script Date: 29/9/2020 7:17:57 PM ******/
CREATE DATABASE [GeneDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GeneDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GeneDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GeneDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GeneDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GeneDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GeneDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GeneDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GeneDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GeneDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GeneDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GeneDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GeneDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GeneDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GeneDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GeneDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GeneDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GeneDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GeneDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GeneDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GeneDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GeneDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GeneDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GeneDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GeneDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GeneDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GeneDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GeneDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [GeneDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GeneDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GeneDB] SET  MULTI_USER 
GO
ALTER DATABASE [GeneDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GeneDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GeneDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GeneDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GeneDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GeneDB] SET QUERY_STORE = OFF
GO
USE [GeneDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 29/9/2020 7:17:57 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 29/9/2020 7:17:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 29/9/2020 7:17:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 29/9/2020 7:17:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 29/9/2020 7:17:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 29/9/2020 7:17:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 29/9/2020 7:17:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 29/9/2020 7:17:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBranch]    Script Date: 29/9/2020 7:17:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBranch](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[Created] [datetime2](7) NOT NULL,
	[User_FK] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblBranch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInfo]    Script Date: 29/9/2020 7:17:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInfo](
	[Id] [nvarchar](450) NOT NULL,
	[Certificate] [nvarchar](max) NULL,
	[Created] [datetime2](7) NOT NULL,
	[Branch_FK] [nvarchar](max) NULL,
	[User_FK] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'2.1.14-servicing-32113')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200929144348_initial', N'2.1.14-servicing-32113')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2539bad8-1b9a-4448-a09f-6ecfec2a03d6', N'test@gmail.com', N'TEST@GMAIL.COM', N'test@gmail.com', N'TEST@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAELgfQY5gBabZo4XjdCo7DZqDaKPiggAqth7gPxD4mOlKznMfX0GQ5brpd71HeTCYkg==', N'COJELMYMHLKFCTTJTDLFTYVU322IQWQX', N'dd7d66bd-fa99-4925-b7b2-3533dd24f4cc', N'+263777086674', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ba1f4e24-87a8-47b5-aecd-ec6da1576b8c', N'percy.munyunyu@gmail.com', N'PERCY.MUNYUNYU@GMAIL.COM', N'percy.munyunyu@gmail.com', N'PERCY.MUNYUNYU@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOXBHuqBqFFHhyl2miSubhx29UYcjxDsTEjrmgnw0vIny1k2gXu8mkNiy4afDYU18g==', N'27ZHLOZLCYQZEKOHA5OSMP3ZDJ3X7VBW', N'0e766145-25c5-41a6-be8d-05a5fdd3109e', N'+263777086674', 0, 0, NULL, 1, 0)
INSERT [dbo].[tblBranch] ([Id], [Name], [Code], [Created], [User_FK]) VALUES (N'5564684e-a155-4ea3-b1af-a5e8576af4ba', N'Kadoma', N'100', CAST(N'2020-09-29T17:10:55.2385473' AS DateTime2), N'ba1f4e24-87a8-47b5-aecd-ec6da1576b8c')
INSERT [dbo].[tblBranch] ([Id], [Name], [Code], [Created], [User_FK]) VALUES (N'7d88a4fe-87f6-484e-aaaf-8bf9e0527806', N'Harare', N'200', CAST(N'2020-09-29T17:04:57.0008242' AS DateTime2), N'ba1f4e24-87a8-47b5-aecd-ec6da1576b8c')
INSERT [dbo].[tblBranch] ([Id], [Name], [Code], [Created], [User_FK]) VALUES (N'95d699fa-866b-4f39-bf2e-55df336481cf', N'Hwedza', N'103', CAST(N'2020-09-29T17:39:32.4832727' AS DateTime2), N'ba1f4e24-87a8-47b5-aecd-ec6da1576b8c')
INSERT [dbo].[tblBranch] ([Id], [Name], [Code], [Created], [User_FK]) VALUES (N'9ddbfe03-e580-4533-b9ee-65742d862bec', N'Kuwadzana', N'150', CAST(N'2020-09-29T17:11:10.9610770' AS DateTime2), N'ba1f4e24-87a8-47b5-aecd-ec6da1576b8c')
INSERT [dbo].[tblBranch] ([Id], [Name], [Code], [Created], [User_FK]) VALUES (N'e545bea9-09e5-4fef-a9c3-347626a0b6c1', N'Chegutu', N'500', CAST(N'2020-09-29T17:30:10.8741564' AS DateTime2), N'ba1f4e24-87a8-47b5-aecd-ec6da1576b8c')
INSERT [dbo].[tblInfo] ([Id], [Certificate], [Created], [Branch_FK], [User_FK]) VALUES (N'247acbdb-bbb9-4e24-afd4-fc5aa1ca8b1f', N'EF-20209-4056F', CAST(N'2020-09-29T18:41:43.4740577' AS DateTime2), N'5564684e-a155-4ea3-b1af-a5e8576af4ba', N'2539bad8-1b9a-4448-a09f-6ecfec2a03d6')
INSERT [dbo].[tblInfo] ([Id], [Certificate], [Created], [Branch_FK], [User_FK]) VALUES (N'40db8620-38d6-451b-83d9-5d673593e6d2', N'GD-20209-4254D', CAST(N'2020-09-29T18:42:58.2802081' AS DateTime2), N'7d88a4fe-87f6-484e-aaaf-8bf9e0527806', N'2539bad8-1b9a-4448-a09f-6ecfec2a03d6')
INSERT [dbo].[tblInfo] ([Id], [Certificate], [Created], [Branch_FK], [User_FK]) VALUES (N'7ab782b8-da6d-4c1b-a552-4418bb61b9d7', N'FE-20209-4310E', CAST(N'2020-09-29T18:43:14.3795478' AS DateTime2), N'9ddbfe03-e580-4533-b9ee-65742d862bec', N'ba1f4e24-87a8-47b5-aecd-ec6da1576b8c')
INSERT [dbo].[tblInfo] ([Id], [Certificate], [Created], [Branch_FK], [User_FK]) VALUES (N'b8fc43d4-4cca-4af2-b35c-a369036fd7b0', N'CH-20209-4320H', CAST(N'2020-09-29T18:43:24.6256327' AS DateTime2), N'95d699fa-866b-4f39-bf2e-55df336481cf', N'ba1f4e24-87a8-47b5-aecd-ec6da1576b8c')
INSERT [dbo].[tblInfo] ([Id], [Certificate], [Created], [Branch_FK], [User_FK]) VALUES (N'c5be4f71-a5d2-49a9-8205-c41481c6f67d', N'2020-9-29-18', CAST(N'2020-09-29T18:09:08.5456781' AS DateTime2), N'5564684e-a155-4ea3-b1af-a5e8576af4ba', N'2539bad8-1b9a-4448-a09f-6ecfec2a03d6')
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 29/9/2020 7:17:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 29/9/2020 7:17:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 29/9/2020 7:17:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 29/9/2020 7:17:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 29/9/2020 7:17:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 29/9/2020 7:17:58 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 29/9/2020 7:17:58 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [GeneDB] SET  READ_WRITE 
GO
