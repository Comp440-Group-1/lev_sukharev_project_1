USE [s16guest42]
GO

/****** Object:  Table [dbo].[development_release]    Script Date: 5/7/2016 12:14:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[development_release](
	[release_id] [int] NOT NULL,
	[iteration] [int] NOT NULL,
	[last_completed_iteration_date] [datetime] NULL,
	[source_link] [varchar](100) NOT NULL,
	[customer_release_ready] [bit] NOT NULL,
 CONSTRAINT [PK_development_release] PRIMARY KEY CLUSTERED 
(
	[release_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[development_release] ADD  CONSTRAINT [DF_development_release_iteration]  DEFAULT ((0)) FOR [iteration]
GO

ALTER TABLE [dbo].[development_release] ADD  CONSTRAINT [DF_development_release_last_completed_iteration_date]  DEFAULT (NULL) FOR [last_completed_iteration_date]
GO

ALTER TABLE [dbo].[development_release] ADD  CONSTRAINT [DF_development_release_customer_release_ready]  DEFAULT ((0)) FOR [customer_release_ready]
GO

ALTER TABLE [dbo].[development_release]  WITH CHECK ADD  CONSTRAINT [FK_release_development_release] FOREIGN KEY([release_id])
REFERENCES [dbo].[release] ([release_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[development_release] CHECK CONSTRAINT [FK_release_development_release]
GO

ALTER TABLE [dbo].[development_release]  WITH CHECK ADD  CONSTRAINT [CK_positive_iterations] CHECK  (([iteration]>=(0)))
GO

ALTER TABLE [dbo].[development_release] CHECK CONSTRAINT [CK_positive_iterations]
GO

