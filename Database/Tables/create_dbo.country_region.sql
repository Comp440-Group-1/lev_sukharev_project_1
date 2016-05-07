USE [s16guest42]
GO

/****** Object:  Table [dbo].[country_region]    Script Date: 5/7/2016 12:09:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[country_region](
	[country_region_code] [char](3) NOT NULL,
	[country_region_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_country_region] PRIMARY KEY CLUSTERED 
(
	[country_region_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_country_region_name] UNIQUE NONCLUSTERED 
(
	[country_region_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

