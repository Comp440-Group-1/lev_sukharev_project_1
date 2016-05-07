USE [s16guest42]
GO

/****** Object:  Table [dbo].[state_province]    Script Date: 5/7/2016 12:20:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[state_province](
	[state_province_id] [int] IDENTITY(1,1) NOT NULL,
	[state_province_code] [char](3) NOT NULL,
	[state_province_name] [varchar](50) NOT NULL,
	[country_region_code] [char](3) NOT NULL,
 CONSTRAINT [PK_state_province] PRIMARY KEY CLUSTERED 
(
	[state_province_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_state_province_code] UNIQUE NONCLUSTERED 
(
	[state_province_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[state_province]  WITH CHECK ADD  CONSTRAINT [FK_country_region_state_province] FOREIGN KEY([country_region_code])
REFERENCES [dbo].[country_region] ([country_region_code])
GO

ALTER TABLE [dbo].[state_province] CHECK CONSTRAINT [FK_country_region_state_province]
GO

