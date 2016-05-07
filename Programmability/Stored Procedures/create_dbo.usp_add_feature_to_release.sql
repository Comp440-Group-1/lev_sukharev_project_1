USE [s16guest42]
GO

/****** Object:  StoredProcedure [dbo].[usp_add_feature_to_release]    Script Date: 5/7/2016 12:29:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lev Sukharev
-- Create date: 02.05.2016
-- Description:	Specify a feature description and
-- status to add to a particular release.
-- =============================================
CREATE PROCEDURE [dbo].[usp_add_feature_to_release]
	-- Add the parameters for the stored procedure here
	@software_name varchar(50),
	@major_version smallint,
	@minor_version smallint,
	@platform_type varchar(20),
	@major_release smallint,
	@minor_release smallint,
	@feature_description varchar(200),
	@feature_status varchar(20),

	@software_id int = NULL OUTPUT,
	@version_id int = NULL OUTPUT,
	@platform_id int = NULL OUTPUT,
	@release_id int = NULL OUTPUT,
	@feature_id int = NULL OUTPUT,
	@feature_status_id int = NULL OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Make sure the specified release exists in database
    EXEC dbo.usp_check_release @software_name, @major_version, @minor_version, @platform_type,
								@major_release, @minor_release, @software_id = @software_id OUTPUT,
								@version_id = @version_id OUTPUT, @platform_id = @platform_id OUTPUT,
								@release_id = @release_id OUTPUT
	
	-- Check to see if feature description already exists in database
	-- if not, add it it
	IF (@feature_description = (SELECT feature_description FROM dbo.feature WHERE @feature_description = feature_description))
		SET @feature_id = (SELECT feature_id FROM dbo.feature WHERE @feature_description = feature_description)
	ELSE
		EXEC dbo.usp_insert_new_feature @feature_description, @feature_id = @feature_id OUTPUT

	-- Check to make sure the feature status is a valid value contained in the database
	IF (@feature_status = (SELECT feature_status FROM dbo.feature_status WHERE @feature_status = feature_status))
		SET @feature_status_id = (SELECT feature_status_id FROM dbo.feature_status WHERE @feature_status = feature_status)
	ELSE
	BEGIN
		RAISERROR ('Invalid parameter: Invalid feature status value.', 18, 0)
		RETURN 2
	END

	BEGIN TRY
		BEGIN TRAN
			-- Add a feature to a release
			INSERT INTO dbo.release_feature (release_id, feature_id, feature_status_id)
			VALUES (@release_id, @feature_id, @feature_status_id)

			-- Output the release and feature
			SELECT * FROM dbo.all_release_features_extended_view WHERE @release_id = release_id AND @feature_id = feature_id
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		PRINT 'There was an error.'
		PRINT ERROR_MESSAGE ()
	END CATCH
END

GO

