USE [s16guest42]
GO

/****** Object:  StoredProcedure [dbo].[usp_check_software]    Script Date: 5/7/2016 12:30:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lev Sukharev
-- Create date: 02.05.2016
-- Description:	This procedure is for checking
-- if a software name exists in the database.

-- The procedure can be used in other procedures
-- that insert / update software.

-- RETURN 0: Successful execution.
-- RETURN 2: Specified parameter value is not valid.
-- =============================================
CREATE PROCEDURE [dbo].[usp_check_software]
	@software_name varchar(50),

	@software_id int = NULL OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Check to make sure software name exists
	IF (@software_name = (SELECT software_name FROM dbo.software WHERE @software_name = software_name))
		SET @software_id = (SELECT software_id FROM dbo.software WHERE @software_name = software_name)
	ELSE
	BEGIN
		RAISERROR ('Invalid parameter: Software name does not exist', 18, 0)
		RETURN 2
	END

	RETURN 0
END

GO

