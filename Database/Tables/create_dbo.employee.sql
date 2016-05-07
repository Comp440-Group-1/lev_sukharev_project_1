USE [s16guest42]
GO

/****** Object:  Table [dbo].[employee]    Script Date: 5/7/2016 12:15:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[employee](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[title_id] [int] NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[middle_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email_address] [varchar](50) NOT NULL,
	[hire_date] [datetime] NOT NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_employee_email_address] UNIQUE NONCLUSTERED 
(
	[email_address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [DF_employee_hire_date]  DEFAULT (getdate()) FOR [hire_date]
GO

ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_job_employee] FOREIGN KEY([title_id])
REFERENCES [dbo].[title] ([title_id])
GO

ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_job_employee]
GO

