USE [ccms]
GO
/****** Object:  Table [dbo].[users]    Script Date: 05/05/2009 13:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NOT NULL,
	[fullname] [varchar](max) NOT NULL,
	[email] [nvarchar](50) NULL,
	[active] [bit] NOT NULL CONSTRAINT [DF_users_active]  DEFAULT ((1)),
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[state]    Script Date: 05/05/2009 13:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[state](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_state] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[content]    Script Date: 05/05/2009 13:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[content](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_content] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[layout]    Script Date: 05/05/2009 13:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[layout](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data] [text] NULL,
 CONSTRAINT [PK_layout] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[page]    Script Date: 05/05/2009 13:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[page](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[linktext] [varchar](255) NOT NULL,
	[description] [varchar](max) NULL,
	[keywords] [varchar](max) NULL,
	[created_user] [int] NOT NULL,
	[updated_user] [int] NOT NULL,
	[layout_id] [int] NULL,
 CONSTRAINT [PK_page] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[content_version]    Script Date: 05/05/2009 13:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_version](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content_id] [int] NOT NULL,
	[version_id] [int] NOT NULL,
	[state_id] [int] NOT NULL,
	[data] [text] NULL,
 CONSTRAINT [PK_content_version] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[page_content_ref]    Script Date: 05/05/2009 13:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[page_content_ref](
	[content_id] [int] NOT NULL,
	[page_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[viewtree]    Script Date: 05/05/2009 13:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[viewtree](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[page_id] [int] NOT NULL,
	[parent_id] [int] NOT NULL,
	[layout_id] [int] NULL,
 CONSTRAINT [PK_viewtree] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_content_version_content]    Script Date: 05/05/2009 13:13:50 ******/
ALTER TABLE [dbo].[content_version]  WITH CHECK ADD  CONSTRAINT [FK_content_version_content] FOREIGN KEY([content_id])
REFERENCES [dbo].[content] ([id])
GO
ALTER TABLE [dbo].[content_version] CHECK CONSTRAINT [FK_content_version_content]
GO
/****** Object:  ForeignKey [FK_content_version_state]    Script Date: 05/05/2009 13:13:50 ******/
ALTER TABLE [dbo].[content_version]  WITH CHECK ADD  CONSTRAINT [FK_content_version_state] FOREIGN KEY([state_id])
REFERENCES [dbo].[state] ([id])
GO
ALTER TABLE [dbo].[content_version] CHECK CONSTRAINT [FK_content_version_state]
GO
/****** Object:  ForeignKey [FK_page_layout]    Script Date: 05/05/2009 13:13:50 ******/
ALTER TABLE [dbo].[page]  WITH CHECK ADD  CONSTRAINT [FK_page_layout] FOREIGN KEY([layout_id])
REFERENCES [dbo].[layout] ([id])
GO
ALTER TABLE [dbo].[page] CHECK CONSTRAINT [FK_page_layout]
GO
/****** Object:  ForeignKey [FK_page_users]    Script Date: 05/05/2009 13:13:50 ******/
ALTER TABLE [dbo].[page]  WITH CHECK ADD  CONSTRAINT [FK_page_users] FOREIGN KEY([created_user])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[page] CHECK CONSTRAINT [FK_page_users]
GO
/****** Object:  ForeignKey [FK_page_users1]    Script Date: 05/05/2009 13:13:50 ******/
ALTER TABLE [dbo].[page]  WITH CHECK ADD  CONSTRAINT [FK_page_users1] FOREIGN KEY([updated_user])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[page] CHECK CONSTRAINT [FK_page_users1]
GO
/****** Object:  ForeignKey [FK_page_content_ref_content]    Script Date: 05/05/2009 13:13:50 ******/
ALTER TABLE [dbo].[page_content_ref]  WITH CHECK ADD  CONSTRAINT [FK_page_content_ref_content] FOREIGN KEY([content_id])
REFERENCES [dbo].[content] ([id])
GO
ALTER TABLE [dbo].[page_content_ref] CHECK CONSTRAINT [FK_page_content_ref_content]
GO
/****** Object:  ForeignKey [FK_page_content_ref_page]    Script Date: 05/05/2009 13:13:50 ******/
ALTER TABLE [dbo].[page_content_ref]  WITH CHECK ADD  CONSTRAINT [FK_page_content_ref_page] FOREIGN KEY([page_id])
REFERENCES [dbo].[page] ([id])
GO
ALTER TABLE [dbo].[page_content_ref] CHECK CONSTRAINT [FK_page_content_ref_page]
GO
/****** Object:  ForeignKey [FK_viewtree_layout]    Script Date: 05/05/2009 13:13:50 ******/
ALTER TABLE [dbo].[viewtree]  WITH CHECK ADD  CONSTRAINT [FK_viewtree_layout] FOREIGN KEY([layout_id])
REFERENCES [dbo].[layout] ([id])
GO
ALTER TABLE [dbo].[viewtree] CHECK CONSTRAINT [FK_viewtree_layout]
GO
/****** Object:  ForeignKey [FK_viewtree_page]    Script Date: 05/05/2009 13:13:50 ******/
ALTER TABLE [dbo].[viewtree]  WITH CHECK ADD  CONSTRAINT [FK_viewtree_page] FOREIGN KEY([page_id])
REFERENCES [dbo].[page] ([id])
GO
ALTER TABLE [dbo].[viewtree] CHECK CONSTRAINT [FK_viewtree_page]
GO
