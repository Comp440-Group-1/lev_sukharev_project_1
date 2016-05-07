USE [s16guest42]
GO

/****** Object:  StoredProcedure [dbo].[usp_insert_new_software]    Script Date: 5/7/2016 12:32:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Lev Sukharev
-- Create date: 01.05.2016
-- Description:	Insert new software by specifying
-- the software name, description, and platform.
--
-- By default the software is created with
-- version 0.1 and release 0.1 and is of type 'dv', 
-- for development release.

-- RETURN 2: Specified parameter value is not valid.
-- =============================================
CREATE PROCEDURE [dbo].[usp_insert_new_software]
	-- Add the parameters for the stored procedure here
	@software_name varchar(50),
	@software_description varchar(200),
	@platform_type varchar(20),

	@software_id int = NULL OUTPUT,
	@version_id int = NULL OUTPUT,
	@platform_id int = NULL OUTPUT,
	@release_id int = NULL OUTPUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Platform parameter has to be a valid value contained in the populated platform table
	IF (@platform_type = (SELECT platform_type FROM dbo.platform WHERE @platform_type = platform_type))
		SET @platform_id = (SELECT platform_id FROM dbo.platform WHERE @platform_type = platform_type)
	ELSE
	BEGIN
		RAISERROR ('Invalid parameter: Platform specified does not exist in the database', 18, 0)
		RETURN 2
	END

	-- Check to make sure software name does not already exists
	IF (@software_name = (SELECT software_name FROM dbo.software WHERE @software_name = software_name))
	BEGIN
		RAISERROR ('Invalid parameter: Software name already exists', 18, 0)
		RETURN 2
	END

	BEGIN TRY
		BEGIN TRAN
			INSERT INTO dbo.software (software_name, software_description)
			VALUES (@software_name, @software_description)
			SELECT @software_id = @@IDENTITY

			-- Version 0.1 is created for new software
			INSERT INTO dbo.version (software_id, platform_id, major_version, minor_version)
			VALUES (@software_id, @platform_id, 0, 1)
			SELECT @version_id = @@IDENTITY

			-- Release 0.1 is created for new software and is of type 'dv' for development
			INSERT INTO dbo.release (version_id, major_release, minor_release, release_type)
			VALUES (@version_id, 0, 1, 'dv')
			SELECT @release_id = @@IDENTITY

			-- Release is given default link for all development releases
			INSERT INTO dbo.development_release (release_id, source_link)
			VALUES (@release_id, 'www.softwarecompany.com/downloads/development_release/')

			-- Output the newly created software
			SELECT * FROM dbo.all_development_releases_extended_view WHERE @software_id = software_id
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		PRINT 'There was an error.'
		PRINT ERROR_MESSAGE ()
	END CATCH
END

GO

