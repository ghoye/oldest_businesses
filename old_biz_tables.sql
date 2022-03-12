
CREATE DATABASE oldest_businesses
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE TABLE businesses(
	business varchar(250),
	year_founded int,
	category_code varchar(250),
	country_code char(10)
);

SELECT * FROM businesses;

COPY businesses(business, year_founded, category_code, country_code)
-- Customize file path
FROM '/Users/ghoye/Documents/Oldest Businesses/datasets/businesses.csv'
DELIMITER ','
CSV header;

SELECT * FROM businesses;


CREATE TABLE countries(
	country_code char(10),
	country varchar(250),
	continent varchar(250)
);

SELECT * FROM countries;

COPY countries(country_code, country, continent)
-- Customize file path
FROM '/Users/ghoye/Documents/Oldest Businesses/datasets/countries.csv'
DELIMITER ','
CSV header;

SELECT * FROM countries;


CREATE TABLE categories(
	category_code varchar(250),
	category varchar(250)
);

SELECT * FROM categories;

COPY categories(category_code, category)
-- Customize file path
FROM '/Users/ghoye/Documents/Oldest Businesses/datasets/categories.csv'
DELIMITER ','
CSV header;

SELECT * FROM categories;