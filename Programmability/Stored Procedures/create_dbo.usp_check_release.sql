USE [s16guest42]
GO

/****** Object:  StoredProcedure [dbo].[usp_check_release]    Script Date: 5/7/2016 12:30:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lev Sukharev
-- Create date: 02.05.2016
-- Description:	This procedure is for checking
-- if a software name, version, and a release of 
-- that software version exists in the database.

-- The procedure can be used in other procedures
-- that insert / update software, software versions,
-- or releases of versions

-- RETURN 0: Successful execution.
-- RETURN 2: Specified parameter value is not valid.
-- =============================================
CREATE PROCEDURE [dbo].[usp_check_release]
	@software_name varchar(50),
	@major_version smallint,
	@minor_version smallint,
	@platform_type varchar(20),
	@major_release smallint,
	@minor_release smallint,

	@software_id int = NULL OUTPUT,
	@version_id int = NULL OUTPUT,
	@platform_id int = NULL OUTPUT,
	@release_id int = NULL OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Use dbo.usp_check_version to make sure the software name and version exists
	EXEC dbo.usp_check_version @software_name, @major_version, @minor_version, @platform_type, 
							   @software_id = @software_id OUTPUT,
							   @version_id = @version_id OUTPUT,
							   @platform_id = @platform_id OUTPUT

	IF (@software_id IS NULL OR @version_id IS NULL OR @platform_id IS NULL)
		RETURN 2

	-- Check to make sure that the release exists with the specified version
	If (@major_release = (SELECT major_release FROM dbo.release WHERE @version_id = version_id AND
																	  @major_release = major_release))
		SET @major_release = (SELECT major_release FROM dbo.release WHERE @version_id = version_id AND
																		  @major_release = major_release)
	ELSE
	BEGIN
		RAISERROR ('Invalid parameter: Major release number does not exist for the specified version', 18, 0)
		RETURN 2
	END

	If (@minor_release = (SELECT minor_release FROM dbo.release WHERE @version_id = version_id AND
																	  @major_release = major_release AND
																	  @minor_release = minor_release))
		SET @minor_release = (SELECT minor_release FROM dbo.release WHERE @version_id = version_id AND
																		  @major_release = major_release AND
																		  @minor_release = minor_release)
	ELSE
	BEGIN
		RAISERROR ('Invalid parameter: Minor release number does not exist for the specified version', 18, 0)
		RETURN 2
	END

	SET @release_id = (SELECT release_id FROM dbo.release WHERE @version_id = version_id AND
																@major_release = major_release AND
																@minor_release = minor_release)
	RETURN 0
END

GO

