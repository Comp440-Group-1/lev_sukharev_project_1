USE [s16guest42]
GO

/****** Object:  StoredProcedure [dbo].[usp_insert_new_customer]    Script Date: 5/7/2016 12:31:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lev Sukharev
-- Create date: 01.05.2016
-- Description:	Insert a new customer by specifying
-- their First Name, Middle Name, Last Name, Email Address,
-- and Phone Number.

-- Insert their corresponding company information by
-- specifying the Company Name, Description, Address Line 1, 
-- Address Line 2 (optional), Postal code, City,
-- State / Province, and Country / Region
-- =============================================
CREATE PROCEDURE [dbo].[usp_insert_new_customer]
	-- Add the parameters for the stored procedure here
	@first_name varchar(50),
	@middle_name varchar(50) = NULL,
	@last_name varchar(50),
	@email_address varchar(50),
	@phone_number varchar(25),
	@phone_type varchar(20),

	@company_name varchar(50),
	@company_description varchar(200),
	@address_line_1 varchar(50),
	@address_line_2 varchar(50) = NULL,
	@postal_code varchar(15),
	@city varchar(30),
	@state_province_code char(3),
	@country_region_code char(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @customer_id int,
			@phone_type_id int,
			@company_id int,
			@address_id int,
			@state_province_id int

	-- Check to see if email address already exists in the database.
	IF (@email_address = (SELECT email_address FROM dbo.customer WHERE @email_address = email_address))
	BEGIN
		RAISERROR ('Invalid parameters: Email address already exists.', 18, 0)
		RETURN 2
	END

	-- Check to see if phone number already exists in the database
	IF (@phone_number = (SELECT phone_number FROM dbo.phone WHERE @phone_number = phone_number))
	BEGIN
		RAISERROR ('Invalid parameters: Phone number already exists.', 18, 0)
		RETURN 2
	END

	-- Make sure phone type matches a type in the populated phone_type table
	IF (@phone_type = (SELECT phone_type FROM dbo.phone_type WHERE @phone_type = phone_type))
		SET @phone_type_id = (SELECT phone_type_id FROM dbo.phone_type WHERE @phone_type = phone_type)
	ELSE
	BEGIN
		RAISERROR ('Invalid parameters: Invalid phone type.', 18, 0)
		RETURN 2
	END

	BEGIN TRY
		BEGIN TRAN
			-- If the company name already exists, just get its id
			IF (@company_name = (SELECT company_name FROM dbo.company WHERE @company_name = company_name))
				SET @company_id = (SELECT company_id FROM dbo.company WHERE @company_name = company_name)
			ELSE
			BEGIN
				-- Check to make sure that the country region code exists in our populated table
				IF (@country_region_code = (SELECT country_region_code FROM dbo.country_region WHERE @country_region_code = country_region_code))
					SET @country_region_code = (SELECT country_region_code FROM dbo.country_region WHERE @country_region_code = country_region_code)
				ELSE
				BEGIN
					RAISERROR ('Invalid parameters: Invalid country region code', 18, 0)
					RETURN
				END

				-- Get the state_province id with the codes matching the state and country parameters
				IF (@state_province_code = (SELECT state_province_code FROM dbo.state_province WHERE @state_province_code = state_province_code AND
																									@country_region_code = country_region_code))
					SET @state_province_id = (SELECT state_province_id FROM dbo.state_province WHERE @state_province_code = state_province_code AND
																									@country_region_code = country_region_code)
				ELSE
				BEGIN
					RAISERROR ('Invalid parameters: Invalid state province code', 18, 0)
					RETURN
				END

				-- Add the address information into the database
				INSERT INTO dbo.address (address_line_1, address_line_2, postal_code, city, state_province_id)
				VALUES (@address_line_1, @address_line_2, @postal_code, @city, @state_province_id)
				SELECT @address_id = @@IDENTITY

				-- Add the company information into the database
				INSERT INTO dbo.company (company_name, company_description)
				VALUES (@company_name, @company_description)
				SELECT @company_id = @@IDENTITY

				-- Add the address and company into the company_address table
				INSERT INTO dbo.company_address (company_id, address_id)
				VALUES (@company_id, @address_id)
			END

			-- Add the customer information into the database
			INSERT INTO dbo.customer (company_id, first_name, middle_name, last_name, email_address)
			VALUES (@company_id, @first_name, @middle_name, @last_name, @email_address)
			SELECT @customer_id = @@IDENTITY

			-- Add the phone information into the database
			INSERT INTO dbo.phone (customer_id, phone_type_id, phone_number)
			VALUES (@customer_id, @phone_type_id, @phone_number)

			-- Output the newly created customer, company, address information
			SELECT * FROM dbo.all_customer_companies_view WHERE @customer_id = customer_id
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
			PRINT 'There was an error.'
			PRINT ERROR_MESSAGE ()
	END CATCH
END

GO

