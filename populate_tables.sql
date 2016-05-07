INSERT INTO dbo.country_region (country_region_code, country_region_name)
VALUES ('AR', 'Argentina'),
	   ('AU', 'Australia'),
	   ('BR', 'Brazil'),
	   ('CA', 'Canada'),
	   ('CN', 'China'),
	   ('DE', 'Germany'),
	   ('ES', 'Spain'),
	   ('FI', 'Finland'),
	   ('FR', 'France'),
	   ('IE', 'Ireland'),
	   ('IS', 'Iceland'),
	   ('MX', 'Mexico'),
	   ('RU', 'Russia'),
	   ('SE', 'Sweden'),
	   ('UA', 'Ukraine'),
	   ('US', 'United States of America')

INSERT INTO dbo.state_province (state_province_code, state_province_name, country_region_code)
VALUES ('AK', 'Alaska', 'US'),
	   ('CA', 'California', 'US'),
	   ('CO', 'Colorado', 'US'),
	   ('IL', 'Illinois', 'US'),
	   ('ME', 'Maine', 'US'),
	   ('MI', 'Michigan', 'US'),
	   ('NE', 'Nebraska', 'US'),
	   ('OR', 'Oregon', 'US'),
	   ('PA', 'Pennsylvania', 'US'),
	   ('WA', 'Washington', 'US'),
	   ('BC', 'British Columbia', 'CA'),
	   ('NS', 'Nova Scotia', 'CA'),
	   ('ON', 'Ontario', 'CA'),
	   ('QC', 'Quebec', 'CA')

INSERT INTO dbo.phone_type (phone_type)
VALUES ('work'),
	   ('mobile'),
	   ('home')

INSERT INTO dbo.title (title_name, title_description)
VALUES ('Manager', 'Accomplishes department objectives by managing staff; planning and evaluating department activities.'),
	   ('Team Leader', 'Provides direction, instructions and guidance to a group of individuals'),
	   ('Programmer', 'Creates and modifies computer programs by converting project requirements into code.')

INSERT INTO dbo.platform (platform_type)
VALUES ('Windows'),
	   ('Mac'),
	   ('Linux')

INSERT INTO dbo.feature_status (feature_status)
VALUES ('new'), 
	   ('active'),
	   ('testing'),
	   ('depricated')