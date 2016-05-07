USE [s16guest42]
GO

/****** Object:  StoredProcedure [dbo].[usp_request_download]    Script Date: 5/7/2016 12:33:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lev Sukharev
-- Create date: 02.05.2016
-- Description:	Request from a customer to download
-- a specified software release.
-- =============================================
CREATE PROCEDURE [dbo].[usp_request_download]
	@email_address varchar(50),
	@software_name varchar(50),
	@major_version smallint,
	@minor_version smallint,
	@platform_type varchar(20),
	@major_release smallint,
	@minor_release smallint,

	@customer_id int = NULL OUTPUT,
	@software_id int = NULL OUTPUT,
	@version_id int = NULL OUTPUT,
	@platform_id int = NULL OUTPUT,
	@release_id int = NULL OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @date_downloaded datetime2(7)

	-- Make sure customer email exists in the database
	IF (@email_address = (SELECT email_address FROM dbo.customer WHERE @email_address = email_address))
		SET @customer_id = (SELECT customer_id FROM dbo.customer WHERE @email_address = email_address)
	ELSE
	BEGIN
		RAISERROR ('Invalid parameters: Customer email does not exist in the database.', 18, 0)
		RETURN 2
	END
		
	--Make sure the software release exists in the database
    EXEC dbo.usp_check_release @software_name, @major_version, @minor_version, @platform_type,
								@major_release, @minor_release, @software_id = @software_id OUTPUT,
								@version_id = @version_id OUTPUT, @platform_id = @platform_id OUTPUT,
								@release_id = @release_id OUTPUT

	BEGIN TRY
		BEGIN TRAN
			-- Insert the download into the download table
			SET @date_downloaded = (getdate())
			INSERT INTO dbo.download (customer_id, release_id, date_downloaded)
			VALUES (@customer_id, @release_id, @date_downloaded)

			-- Output the download
			SELECT * FROM dbo.all_customer_downloads_view WHERE @customer_id = customer_id AND
															@date_downloaded = date_downloaded

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		PRINT 'There was an error.'
		PRINT ERROR_MESSAGE ()
	END CATCH
END

GO

