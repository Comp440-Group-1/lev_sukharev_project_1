USE [s16guest42]
GO

/****** Object:  StoredProcedure [dbo].[usp_insert_new_feature]    Script Date: 5/7/2016 12:32:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lev Sukharev
-- Create date: 02.05.2016
-- Description:	Insert a new feature description
-- into the database.
-- =============================================
CREATE PROCEDURE [dbo].[usp_insert_new_feature]
	@feature_description varchar(200),
	@feature_id int = NULL OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Check if description already exists in the database
    IF (@feature_description = (SELECT feature_description FROM dbo.feature WHERE @feature_description = feature_description))
	BEGIN
		RAISERROR ('Invalid parameter: Feature description already exists in the database.', 18, 0)
		RETURN 2
	END
	ELSE
		BEGIN TRY
			BEGIN TRAN
				-- Add the feature
				INSERT INTO dbo.feature (feature_description)
				VALUES (@feature_description)
				SET @feature_id = @@IDENTITY

				-- Output the newly created feature
				SELECT * FROM dbo.feature WHERE @feature_id = feature_id
			COMMIT TRAN
		END TRY

		BEGIN CATCH
			ROLLBACK TRAN
			PRINT 'There was an error.'
			PRINT ERROR_MESSAGE ()
		END CATCH
END

GO

