USE [s16guest42]
GO

/****** Object:  Table [dbo].[phone]    Script Date: 5/7/2016 12:16:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[phone](
	[customer_id] [int] NOT NULL,
	[phone_type_id] [int] NOT NULL,
	[phone_number] [varchar](25) NOT NULL,
	[date_added] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_phone_1] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC,
	[phone_number] ASC,
	[date_added] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_phone_number] UNIQUE NONCLUSTERED 
(
	[phone_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[phone] ADD  CONSTRAINT [DF_phone_date_added]  DEFAULT (getdate()) FOR [date_added]
GO

ALTER TABLE [dbo].[phone]  WITH CHECK ADD  CONSTRAINT [FK_customer_phone] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[phone] CHECK CONSTRAINT [FK_customer_phone]
GO

ALTER TABLE [dbo].[phone]  WITH CHECK ADD  CONSTRAINT [FK_phone_type_phone] FOREIGN KEY([phone_type_id])
REFERENCES [dbo].[phone_type] ([phone_type_id])
GO

ALTER TABLE [dbo].[phone] CHECK CONSTRAINT [FK_phone_type_phone]
GO

