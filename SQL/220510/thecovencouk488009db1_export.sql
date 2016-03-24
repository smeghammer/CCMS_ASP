/* Generated by Web Data Administrator on 22/05/2010 11:16:19 */

/* Options selected: database table-schema  */

/****** DATABASE ******/
CREATE DATABASE [thecovencouk_488009_db1]
 COLLATE Latin1_General_CI_AS
ALTER DATABASE [thecovencouk_488009_db1] SET COMPATIBILITY_LEVEL = 100
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [thecovencouk_488009_db1].[dbo].[sp_fulltext_database] @action = 'enable'
end
ALTER DATABASE [thecovencouk_488009_db1] SET ANSI_NULL_DEFAULT OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET ANSI_NULLS OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET ANSI_PADDING OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET ANSI_WARNINGS OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET ARITHABORT OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET AUTO_CLOSE OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET AUTO_CREATE_STATISTICS ON 
ALTER DATABASE [thecovencouk_488009_db1] SET AUTO_SHRINK OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET AUTO_UPDATE_STATISTICS ON 
ALTER DATABASE [thecovencouk_488009_db1] SET CURSOR_CLOSE_ON_COMMIT OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET CURSOR_DEFAULT  GLOBAL 
ALTER DATABASE [thecovencouk_488009_db1] SET CONCAT_NULL_YIELDS_NULL OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET NUMERIC_ROUNDABORT OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET QUOTED_IDENTIFIER OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET RECURSIVE_TRIGGERS OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET  ENABLE_BROKER 
ALTER DATABASE [thecovencouk_488009_db1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET DATE_CORRELATION_OPTIMIZATION OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET TRUSTWORTHY OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET PARAMETERIZATION SIMPLE 
ALTER DATABASE [thecovencouk_488009_db1] SET READ_COMMITTED_SNAPSHOT OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET HONOR_BROKER_PRIORITY OFF 
ALTER DATABASE [thecovencouk_488009_db1] SET  READ_WRITE 
ALTER DATABASE [thecovencouk_488009_db1] SET RECOVERY SIMPLE 
ALTER DATABASE [thecovencouk_488009_db1] SET  MULTI_USER 
ALTER DATABASE [thecovencouk_488009_db1] SET PAGE_VERIFY CHECKSUM  
ALTER DATABASE [thecovencouk_488009_db1] SET DB_CHAINING OFF 


GO
use [thecovencouk_488009_db1]
GO

/****** CREATE TABLES/PROCEDURES ETC ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[uthecov_488009_1].[viewtree]') AND type in (N'U'))
BEGIN
CREATE TABLE [uthecov_488009_1].[viewtree](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[page_id] [int] NOT NULL,
	[parent_id] [int] NOT NULL,
	[layout_id] [int] NULL,
	[ordering] [int] NOT NULL,
 CONSTRAINT [PK_viewtree] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[uthecov_488009_1].[users]') AND type in (N'U'))
BEGIN
CREATE TABLE [uthecov_488009_1].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[fullname] [varchar](255) NOT NULL,
	[email] [varchar](50) NULL,
	[active] [bit] NOT NULL,
	[permissions] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[uthecov_488009_1].[state]') AND type in (N'U'))
BEGIN
CREATE TABLE [uthecov_488009_1].[state](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](15) NOT NULL,
	[description] [varchar](255) NULL,
 CONSTRAINT [PK_state] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[uthecov_488009_1].[page_content_ref]') AND type in (N'U'))
BEGIN
CREATE TABLE [uthecov_488009_1].[page_content_ref](
	[content_id] [int] NOT NULL,
	[page_id] [int] NOT NULL,
	[slot_num] [int] NULL
) ON [PRIMARY]
END
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[uthecov_488009_1].[page]') AND type in (N'U'))
BEGIN
CREATE TABLE [uthecov_488009_1].[page](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[state] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[linktext] [varchar](255) NULL,
	[title] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[keywords] [varchar](255) NULL,
	[created_date] [datetime] NULL,
	[created_user] [int] NULL,
	[updated_date] [datetime] NULL,
	[updated_user] [int] NULL,
	[layout_id] [int] NULL,
 CONSTRAINT [PK_page] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[uthecov_488009_1].[layout]') AND type in (N'U'))
BEGIN
CREATE TABLE [uthecov_488009_1].[layout](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[layout_url] [varchar](255) NULL,
 CONSTRAINT [PK_layout] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[uthecov_488009_1].[content_version]') AND type in (N'U'))
BEGIN
CREATE TABLE [uthecov_488009_1].[content_version](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content_id] [int] NOT NULL,
	[version_id] [int] NOT NULL,
	[state_id] [int] NOT NULL,
	[data] [text] NULL,
	[edit_user] [int] NOT NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_content_version] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[uthecov_488009_1].[content_types]') AND type in (N'U'))
BEGIN
CREATE TABLE [uthecov_488009_1].[content_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[description] [varchar](255) NULL,
 CONSTRAINT [PK_content_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[uthecov_488009_1].[content]') AND type in (N'U'))
BEGIN
CREATE TABLE [uthecov_488009_1].[content](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[created_user] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_user] [int] NULL,
	[updated_date] [datetime] NULL,
	[auth_group] [int] NULL,
	[content_type] [int] NULL,
 CONSTRAINT [PK_content] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_viewtree_ordering]') AND type = 'D')
BEGIN
ALTER TABLE [uthecov_488009_1].[viewtree] ADD  CONSTRAINT [DF_viewtree_ordering]  DEFAULT ((0)) FOR [ordering]
END

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_users_active]') AND type = 'D')
BEGIN
ALTER TABLE [uthecov_488009_1].[users] ADD  CONSTRAINT [DF_users_active]  DEFAULT ((1)) FOR [active]
END

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_users_permissions]') AND type = 'D')
BEGIN
ALTER TABLE [uthecov_488009_1].[users] ADD  CONSTRAINT [DF_users_permissions]  DEFAULT ((0)) FOR [permissions]
END


