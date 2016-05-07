USE [s16guest42]
GO

/****** Object:  Table [dbo].[release_feature]    Script Date: 5/7/2016 12:18:26 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[release_feature](
	[release_id] [int] NOT NULL,
	[feature_id] [int] NOT NULL,
	[feature_status_id] [int] NOT NULL,
 CONSTRAINT [PK_release_feature] PRIMARY KEY CLUSTERED 
(
	[release_id] ASC,
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[release_feature]  WITH CHECK ADD  CONSTRAINT [FK_feature_release_feature] FOREIGN KEY([feature_id])
REFERENCES [dbo].[feature] ([feature_id])
GO

ALTER TABLE [dbo].[release_feature] CHECK CONSTRAINT [FK_feature_release_feature]
GO

ALTER TABLE [dbo].[release_feature]  WITH CHECK ADD  CONSTRAINT [FK_feature_status_release_feature] FOREIGN KEY([feature_status_id])
REFERENCES [dbo].[feature_status] ([feature_status_id])
GO

ALTER TABLE [dbo].[release_feature] CHECK CONSTRAINT [FK_feature_status_release_feature]
GO

ALTER TABLE [dbo].[release_feature]  WITH CHECK ADD  CONSTRAINT [FK_release_release_feature] FOREIGN KEY([release_id])
REFERENCES [dbo].[release] ([release_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[release_feature] CHECK CONSTRAINT [FK_release_release_feature]
GO

