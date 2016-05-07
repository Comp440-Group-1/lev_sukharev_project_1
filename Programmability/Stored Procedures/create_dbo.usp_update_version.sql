USE [s16guest42]
GO

/****** Object:  StoredProcedure [dbo].[usp_update_version]    Script Date: 5/7/2016 12:34:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lev Sukharev
-- Create date: 02.05.2016
-- Description:	Update the version of software.
-- Specify the name of the software, which version
-- that needs updating, for which platform, and the
-- new major or minor version number or both of them.
-- =============================================
CREATE PROCEDURE [dbo].[usp_update_version]
	-- Add the parameters for the stored procedure here
	@software_name varchar(50),
	@major_version smallint,
	@minor_version smallint,
	@platform_type varchar(20),

	@new_major_version smallint = NULL,
	@new_minor_version smallint = NULL,

	@software_id int = NULL OUTPUT,
	@version_id int = NULL OUTPUT,
	@platform_id int = NULL OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Check to make sure that at least one of the new version parameters is not NULL
	IF (@new_major_version IS NULL OR @new_minor_version IS NULL)
	BEGIN
		RAISERROR ('Invalid parameter: Provide at least one new (major / minor) version number', 18, 0)
		RETURN
	END

	-- Check to make sure software name and version number exists
	EXEC dbo.usp_check_version @software_name, @major_version, @minor_version, @platform_type, @software_id = @software_id OUTPUT,
																						   @version_id = @version_id OUTPUT,
																						   @platform_id = @platform_id OUTPUT

	BEGIN TRY
		BEGIN TRAN
			IF (@new_major_version IS NULL)
			BEGIN
				UPDATE dbo.version
				SET minor_version = @new_minor_version
				WHERE software_id = @software_id AND version_id = @version_id AND platform_id = @platform_id
			END
			ELSE IF (@new_minor_version IS NULL)
			BEGIN
				UPDATE dbo.version
				SET major_version = @new_major_version
				WHERE software_id = @software_id AND version_id = @version_id AND platform_id = @platform_id
			END
			ELSE
			BEGIN
				UPDATE dbo.version
				SET major_version = @new_major_version, minor_version = @new_minor_version
				WHERE software_id = @software_id AND version_id = @version_id AND platform_id = @platform_id
			END

			-- Output the newly created version and release
			SELECT * FROM dbo.software a
			INNER JOIN dbo.version b
			ON a.software_id = b.software_id
			WHERE @software_id = a.software_id AND
				  @version_id = b.version_id AND
				  @platform_id = b.platform_id
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		PRINT 'There was an error.'
		PRINT ERROR_MESSAGE ()
	END CATCH
END

GO

