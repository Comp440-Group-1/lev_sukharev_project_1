USE [s16guest42]
GO

/****** Object:  Table [dbo].[customer_release]    Script Date: 5/7/2016 12:09:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[customer_release](
	[release_id] [int] NOT NULL,
	[download_link] [varchar](50) NOT NULL,
	[date_released] [datetime] NOT NULL,
 CONSTRAINT [PK_customer_release] PRIMARY KEY CLUSTERED 
(
	[release_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[customer_release] ADD  CONSTRAINT [DF_customer_release_date_released]  DEFAULT (getdate()) FOR [date_released]
GO

ALTER TABLE [dbo].[customer_release]  WITH CHECK ADD  CONSTRAINT [FK_release_customer_release] FOREIGN KEY([release_id])
REFERENCES [dbo].[release] ([release_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[customer_release] CHECK CONSTRAINT [FK_release_customer_release]
GO

