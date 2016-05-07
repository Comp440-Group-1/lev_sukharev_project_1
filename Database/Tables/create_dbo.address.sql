USE [s16guest42]
GO

/****** Object:  Table [dbo].[address]    Script Date: 5/7/2016 12:07:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[address](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[address_line_1] [varchar](60) NOT NULL,
	[address_line_2] [varchar](60) NULL,
	[postal_code] [varchar](15) NOT NULL,
	[city] [varchar](30) NOT NULL,
	[state_province_id] [int] NOT NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_address_zip_code] UNIQUE NONCLUSTERED 
(
	[address_line_1] ASC,
	[address_line_2] ASC,
	[postal_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_state_province] FOREIGN KEY([state_province_id])
REFERENCES [dbo].[state_province] ([state_province_id])
GO

ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_state_province]
GO

