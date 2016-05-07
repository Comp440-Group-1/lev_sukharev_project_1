USE [s16guest42]
GO

/****** Object:  Table [dbo].[stable_release]    Script Date: 5/7/2016 12:19:26 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[stable_release](
	[release_id] [int] NOT NULL,
	[download_link] [varchar](50) NOT NULL,
	[date_stable] [datetime] NOT NULL,
 CONSTRAINT [PK_stable_release] PRIMARY KEY CLUSTERED 
(
	[release_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[stable_release] ADD  CONSTRAINT [DF_stable_release_date_stable]  DEFAULT (getdate()) FOR [date_stable]
GO

ALTER TABLE [dbo].[stable_release]  WITH CHECK ADD  CONSTRAINT [FK_release_stable_release] FOREIGN KEY([release_id])
REFERENCES [dbo].[release] ([release_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[stable_release] CHECK CONSTRAINT [FK_release_stable_release]
GO

