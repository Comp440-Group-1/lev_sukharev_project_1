USE [s16guest42]
GO

/****** Object:  StoredProcedure [dbo].[usp_check_version]    Script Date: 5/7/2016 12:31:20 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lev Sukharev
-- Create date: 02.05.2016
-- Description:	This procedure is for checking
-- if a software name and a version of that software
-- exists in the database.

-- The procedure can be used in other procedures
-- that insert / update software or versions of
-- software.

-- RETURN 0: Successful execution.
-- RETURN 2: Specified parameter value is not valid.
-- =============================================
CREATE PROCEDURE [dbo].[usp_check_version]
	@software_name varchar(50),
	@major_version smallint,
	@minor_version smallint,
	@platform_type varchar(20),

	@software_id int = NULL OUTPUT,
	@version_id int = NULL OUTPUT,
	@platform_id int = NULL OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Use dbo.usp_check_software to make sure the software name exists
	EXEC dbo.usp_check_software @software_name, @software_id = @software_id OUTPUT

	IF (@software_id IS NULL)
		RETURN 2

	-- Check to make sure that the correct version exists
	IF (@major_version = (SELECT major_version FROM dbo.version WHERE @software_id = software_id AND 
																	  @major_version = major_version))
		SET @major_version = (SELECT major_version FROM dbo.version WHERE @software_id = software_id AND
																		  @major_version = major_version)
	ELSE
	BEGIN
		RAISERROR ('Invalid parameter: Major version number does not exist for this software', 18, 0)
		RETURN 2
	END

	IF (@minor_version = (SELECT minor_version FROM dbo.version WHERE @software_id = software_id AND 
																	  @major_version = major_version AND
																	  @minor_version = minor_version))
		SET @minor_version = (SELECT minor_version FROM dbo.version WHERE @software_id = software_id AND
																		  @major_version = major_version AND
																		  @minor_version = minor_version)
	ELSE
	BEGIN
		RAISERROR ('Invalid parameter: Minor version number does not exist for this software', 18, 0)
		RETURN 2
	END

	-- Check to make sure that the correct platform exists with the specified version
	SET @platform_id = (SELECT platform_id FROM dbo.platform WHERE @platform_type = platform_type)

	IF (@platform_id = (SELECT platform_id FROM dbo.version WHERE @software_id = software_id AND
																  @major_version = major_version AND
																  @minor_version = minor_version))
		SET @version_id = (SELECT version_id FROM dbo.version WHERE @software_id = software_id AND 
																	@major_version = major_version AND
																	@minor_version = minor_version AND
																	@platform_id = platform_id)
	ELSE
	BEGIN
		RAISERROR ('Invalid parameter: Platform does not exist for the specified version', 18, 0)
		RETURN 2
	END

	RETURN 0
END

GO

