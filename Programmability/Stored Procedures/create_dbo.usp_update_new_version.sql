USE [s16guest42]
GO

/****** Object:  StoredProcedure [dbo].[usp_update_new_version]    Script Date: 5/7/2016 12:33:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lev Sukharev
-- Create date: 02.05.2016
-- Description:	Update an existing version of a
-- particular software by duplicating the specified
-- version to a new row with a specified new version number.

-- The new version created is given a default release 0.1
-- and is put into the development table.
-- =============================================
CREATE PROCEDURE [dbo].[usp_update_new_version]
	-- Add the parameters for the stored procedure here
	@software_name varchar(50),
	@major_version smallint,
	@minor_version smallint,
	@platform_type varchar(20),

	@new_major_version smallint = NULL,
	@new_minor_version smallint = NULL,

	@software_id int = NULL OUTPUT,
	@new_version_id int = NULL OUTPUT,
	@platform_id int = NULL OUTPUT,
	@release_id int = NULL OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @version_id int = NULL

    -- Check to see that at least one of the new version numbers is not null
	IF (@new_major_version IS NULL AND @new_minor_version IS NULL)
	BEGIN
		RAISERROR ('Specify at lease one new version number (major / minor) to update the existing version.', 18, 0)
		RETURN 2
	END
	
	-- Make sure that the specified version exists in the database
	EXEC dbo.usp_check_version @software_name, @major_version, @minor_version, @platform_type, @software_id = @software_id OUTPUT,
																								@version_id = @version_id OUTPUT,
																								@platform_id = @platform_id OUTPUT

	BEGIN TRY
		BEGIN TRAN
			IF (@new_minor_version IS NULL)
			BEGIN
				INSERT INTO dbo.version (software_id, platform_id, major_version, minor_version)
				VALUES (@software_id, @platform_id, @new_major_version, @minor_version)
				SET @new_version_id = @@IDENTITY
			END
			ELSE IF (@new_major_version IS NULL)
			BEGIN
				INSERT INTO dbo.version (software_id, platform_id, major_version, minor_version)
				VALUES (@software_id, @platform_id, @major_version, @new_minor_version)
				SET @new_version_id = @@IDENTITY
			END
			ELSE
			BEGIN
				INSERT INTO dbo.version (software_id, platform_id, major_version, minor_version)
				VALUES (@software_id, @platform_id, @new_major_version, @new_minor_version)
				SET @new_version_id = @@IDENTITY
			END

			INSERT INTO dbo.release (version_id, major_release, minor_release, release_type)
			VALUES (@new_version_id, 0, 1, 'dv')
			SET @release_id = @@IDENTITY

			INSERT INTO dbo.development_release (release_id, source_link)
			VALUES (@release_id, 'www.softwarecompany.com/downloads/development_release/')
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		PRINT 'There was an error.'
		PRINT ERROR_MESSAGE ()
	END CATCH
END

GO

