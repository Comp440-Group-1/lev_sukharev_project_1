USE [s16guest42]
GO

/****** Object:  Table [dbo].[download]    Script Date: 5/7/2016 12:15:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[download](
	[customer_id] [int] NOT NULL,
	[release_id] [int] NOT NULL,
	[date_downloaded] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_download] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC,
	[release_id] ASC,
	[date_downloaded] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[download] ADD  CONSTRAINT [DF_download_date_downloaded]  DEFAULT (getdate()) FOR [date_downloaded]
GO

ALTER TABLE [dbo].[download]  WITH CHECK ADD  CONSTRAINT [FK_customer_download] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO

ALTER TABLE [dbo].[download] CHECK CONSTRAINT [FK_customer_download]
GO

ALTER TABLE [dbo].[download]  WITH CHECK ADD  CONSTRAINT [FK_release_download] FOREIGN KEY([release_id])
REFERENCES [dbo].[release] ([release_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[download] CHECK CONSTRAINT [FK_release_download]
GO

