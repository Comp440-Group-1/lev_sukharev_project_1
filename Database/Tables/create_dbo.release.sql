USE [s16guest42]
GO

/****** Object:  Table [dbo].[release]    Script Date: 5/7/2016 12:18:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[release](
	[release_id] [int] IDENTITY(1,1) NOT NULL,
	[version_id] [int] NOT NULL,
	[major_release] [smallint] NOT NULL,
	[minor_release] [smallint] NOT NULL,
	[release_type] [char](2) NOT NULL,
 CONSTRAINT [PK_release] PRIMARY KEY CLUSTERED 
(
	[release_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_version_major_minor_release] UNIQUE NONCLUSTERED 
(
	[version_id] ASC,
	[major_release] ASC,
	[minor_release] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[release] ADD  CONSTRAINT [DF_release_major_release_number]  DEFAULT ((0)) FOR [major_release]
GO

ALTER TABLE [dbo].[release] ADD  CONSTRAINT [DF_release_sub_release_number]  DEFAULT ((1)) FOR [minor_release]
GO

ALTER TABLE [dbo].[release] ADD  CONSTRAINT [DF_release_type]  DEFAULT ('dv') FOR [release_type]
GO

ALTER TABLE [dbo].[release]  WITH CHECK ADD  CONSTRAINT [FK_version_release] FOREIGN KEY([version_id])
REFERENCES [dbo].[version] ([version_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[release] CHECK CONSTRAINT [FK_version_release]
GO

ALTER TABLE [dbo].[release]  WITH CHECK ADD  CONSTRAINT [CK_positive_release] CHECK  (([major_release]>=(0) AND [minor_release]>=(0)))
GO

ALTER TABLE [dbo].[release] CHECK CONSTRAINT [CK_positive_release]
GO

ALTER TABLE [dbo].[release]  WITH CHECK ADD  CONSTRAINT [CK_release_type] CHECK  (([release_type]='cu' OR [release_type]='st' OR [release_type]='dv' OR [release_type]='dp'))
GO

ALTER TABLE [dbo].[release] CHECK CONSTRAINT [CK_release_type]
GO

