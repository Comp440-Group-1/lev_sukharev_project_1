USE [s16guest42]
GO

/****** Object:  Table [dbo].[version]    Script Date: 5/7/2016 12:20:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[version](
	[version_id] [int] IDENTITY(1,1) NOT NULL,
	[software_id] [int] NOT NULL,
	[platform_id] [int] NOT NULL,
	[major_version] [smallint] NOT NULL,
	[minor_version] [smallint] NOT NULL,
	[date_created] [datetime] NOT NULL,
 CONSTRAINT [PK_version] PRIMARY KEY CLUSTERED 
(
	[version_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_software_version] UNIQUE NONCLUSTERED 
(
	[software_id] ASC,
	[major_version] ASC,
	[minor_version] ASC,
	[platform_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[version] ADD  CONSTRAINT [DF_version_major_version_number]  DEFAULT ((0)) FOR [major_version]
GO

ALTER TABLE [dbo].[version] ADD  CONSTRAINT [DF_version_sub_version_number]  DEFAULT ((1)) FOR [minor_version]
GO

ALTER TABLE [dbo].[version] ADD  CONSTRAINT [DF_version_date_created]  DEFAULT (getdate()) FOR [date_created]
GO

ALTER TABLE [dbo].[version]  WITH CHECK ADD  CONSTRAINT [FK_platform_version] FOREIGN KEY([platform_id])
REFERENCES [dbo].[platform] ([platform_id])
GO

ALTER TABLE [dbo].[version] CHECK CONSTRAINT [FK_platform_version]
GO

ALTER TABLE [dbo].[version]  WITH CHECK ADD  CONSTRAINT [FK_software_version] FOREIGN KEY([software_id])
REFERENCES [dbo].[software] ([software_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[version] CHECK CONSTRAINT [FK_software_version]
GO

ALTER TABLE [dbo].[version]  WITH CHECK ADD  CONSTRAINT [CK_positive_version] CHECK  (([major_version]>=(0) AND [minor_version]>=(0)))
GO

ALTER TABLE [dbo].[version] CHECK CONSTRAINT [CK_positive_version]
GO

