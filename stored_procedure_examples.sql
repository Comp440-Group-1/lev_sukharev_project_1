DECLARE @software_id_1 int,
		@version_id_1 int,
		@platform_id_1 int,
		@release_id_1 int
EXEC dbo.usp_insert_new_software 'SQL Server', 'Relational database management system', 'Windows', @software_id = @software_id_1 OUTPUT,
																								   @version_id = @version_id_1 OUTPUT,
																								   @platform_id = @platform_id_1 OUTPUT,
																								   @release_id = @release_id_1 OUTPUT

EXEC dbo.usp_add_feature_to_release 'SQL Server', 0, 1, 'Windows', 0, 1, 'Multiple query windows', 'new'
EXEC dbo.usp_add_feature_to_release 'SQL Server', 0, 1, 'Windows', 0, 1, 'Command line interface', 'new'

EXEC dbo.usp_update_new_version 'SQL Server', 0, 1, 'Windows', 1, 2

EXEC dbo.usp_add_feature_to_release 'SQL Server', 1, 2, 'Windows', 0, 1, 'Multiple query windows', 'active'
EXEC dbo.usp_add_feature_to_release 'SQL Server', 1, 2, 'Windows', 0, 1, 'Command line interface', 'active'
EXEC dbo.usp_add_feature_to_release 'SQL Server', 1, 2, 'Windows', 0, 1, 'Error checking', 'new'

---------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @software_id_2 int,
		@version_id_2 int,
		@platform_id_2 int,
		@release_id_2 int
EXEC dbo.usp_insert_new_software 'MySQL', 'Relational database management system', 'Linux', @software_id = @software_id_2 OUTPUT,
																								   @version_id = @version_id_2 OUTPUT,
																								   @platform_id = @platform_id_2 OUTPUT,
																								   @release_id = @release_id_2 OUTPUT
EXEC dbo.usp_update_new_version 'MySQL', 0, 1, 'Linux', 1, 1
EXEC dbo.usp_add_feature_to_release 'MySQL', 1, 1, 'Linux', 0, 1, 'Multiple database connections', 'new'

EXEC dbo.usp_update_new_version 'MySQL', 1, 1, 'Linux', 2, 1
EXEC dbo.usp_add_feature_to_release 'MySQL', 2, 1, 'Linux', 0, 1, 'Multiple database connections', 'active'
EXEC dbo.usp_add_feature_to_release 'MySQL', 2, 1, 'Linux', 0, 1, 'Excel integration', 'new'
---------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @software_id_3 int,
		@version_id_3 int,
		@platform_id_3 int,
		@release_id_3 int
EXEC dbo.usp_insert_new_software 'Word', 'Word processing program', 'Windows', @software_id = @software_id_3 OUTPUT,
																								   @version_id = @version_id_3 OUTPUT,
																								   @platform_id = @platform_id_3 OUTPUT,
																								   @release_id = @release_id_3 OUTPUT
EXEC dbo.usp_add_feature_to_release 'Word', 0, 1, 'Windows', 0, 1, 'Spell checking', 'new'
EXEC dbo.usp_add_feature_to_release 'Word', 0, 1, 'Windows', 0, 1, 'Open multiple documents', 'new'

EXEC dbo.usp_update_new_version 'Word', 0, 1, 'Windows', 3, 1
EXEC dbo.usp_add_feature_to_release 'Word', 3, 1, 'Windows', 0, 1, 'Spell checking', 'active'
EXEC dbo.usp_add_feature_to_release 'Word', 3, 1, 'Windows', 0, 1, 'Open multiple documents', 'active'
---------------------------------------------------------------------------------------------------------------------------------------------------
EXEC dbo.usp_insert_new_customer 'Bill', 'E.', 'Gates', 'bgates@microsoft.com', '818-555-3847', 'work',
								'Microsoft', 'Tech company', '3989 Hill St.', NULL, '93489', 'Los Angeles', 'CA', 'US'

EXEC dbo.usp_insert_new_customer 'Linus', 'F.', 'Torvalds', 'ltorvalds@gmail.com', '909-555-8329', 'home',
								'Red Hat', 'Tech company', '9384 Tampa Ave.', NULL, '93494', 'Portland', 'OR', 'US'

EXEC dbo.usp_request_download 'bgates@microsoft.com', 'SQL Server', 0, 1, 'Windows', 0, 1
EXEC dbo.usp_request_download 'bgates@microsoft.com', 'SQL Server', 1, 2, 'Windows', 0, 1

EXEC dbo.usp_request_download 'ltorvalds@gmail.com', 'MySQL', 0, 1, 'Linux', 0, 1
EXEC dbo.usp_request_download 'ltorvalds@gmail.com', 'MySQL', 1, 1, 'Linux', 0, 1
EXEC dbo.usp_request_download 'ltorvalds@gmail.com', 'MySQL', 2, 1, 'Linux', 0, 1

EXEC dbo.usp_request_download 'bgates@microsoft.com', 'Word', 0, 1, 'Windows', 0, 1
EXEC dbo.usp_request_download 'bgates@microsoft.com', 'Word', 3, 1, 'Windows', 0, 1
---------------------------------------------------------------------------------------------------------------------------------------------------