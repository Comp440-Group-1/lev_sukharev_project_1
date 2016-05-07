USE [s16guest42]
GO

/****** Object:  Table [dbo].[branch]    Script Date: 5/7/2016 12:07:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[branch](
	[employee_id] [int] NOT NULL,
	[release_id] [int] NOT NULL,
	[date_created] [datetime2](7) NOT NULL,
	[source_link] [varchar](50) NOT NULL,
	[commit_changes] [int] NOT NULL,
	[pull_requested] [bit] NOT NULL,
 CONSTRAINT [PK_branch] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC,
	[release_id] ASC,
	[date_created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[branch] ADD  CONSTRAINT [DF_branch_date_created]  DEFAULT (getdate()) FOR [date_created]
GO

ALTER TABLE [dbo].[branch] ADD  CONSTRAINT [DF_branch_commit_changes]  DEFAULT ((0)) FOR [commit_changes]
GO

ALTER TABLE [dbo].[branch] ADD  CONSTRAINT [DF_branch_pull_requested]  DEFAULT ((0)) FOR [pull_requested]
GO

ALTER TABLE [dbo].[branch]  WITH CHECK ADD  CONSTRAINT [FK_development_release_branch] FOREIGN KEY([release_id])
REFERENCES [dbo].[development_release] ([release_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[branch] CHECK CONSTRAINT [FK_development_release_branch]
GO

ALTER TABLE [dbo].[branch]  WITH CHECK ADD  CONSTRAINT [FK_employee_branch] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO

ALTER TABLE [dbo].[branch] CHECK CONSTRAINT [FK_employee_branch]
GO

ALTER TABLE [dbo].[branch]  WITH CHECK ADD  CONSTRAINT [CK_positive_commit_changes] CHECK  (([commit_changes]>=(0)))
GO

ALTER TABLE [dbo].[branch] CHECK CONSTRAINT [CK_positive_commit_changes]
GO

