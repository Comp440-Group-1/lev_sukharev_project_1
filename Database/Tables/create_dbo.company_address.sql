USE [s16guest42]
GO

/****** Object:  Table [dbo].[company_address]    Script Date: 5/7/2016 12:08:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[company_address](
	[company_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [PK_company_address] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC,
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[company_address]  WITH CHECK ADD  CONSTRAINT [FK_company_address_company] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO

ALTER TABLE [dbo].[company_address] CHECK CONSTRAINT [FK_company_address_company]
GO

ALTER TABLE [dbo].[company_address]  WITH CHECK ADD  CONSTRAINT [FK_company_company_address] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([company_id])
GO

ALTER TABLE [dbo].[company_address] CHECK CONSTRAINT [FK_company_company_address]
GO

