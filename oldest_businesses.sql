-- Connect to database

postgresql:///oldestbusinesses
 
-- Select the oldest and newest founding years from 'businesses'

SELECT MIN(year_founded), MAX(year_founded) FROM businesses;

-- Select all columns for oldest and newest businesses

SELECT * FROM businesses
    WHERE year_founded =
        (SELECT MIN(year_founded)
        FROM businesses)
        OR year_founded =
        (SELECT MAX(year_founded)
        FROM businesses);

-- Get the count of rows in 'businesses' where the founding year was before 1000 AD

SELECT COUNT(*) FROM businesses WHERE year_founded < 1000;

-- Select all columns where the founding year was before 1000, arrange the results from oldest to newest

SELECT * FROM businesses 
    WHERE year_founded < 1000 
    ORDER BY year_founded;

-- Select business name, founding year, and country code from businesses; and category from categories
-- where the founding year was before 1000, arranged from oldest to newest

SELECT business, year_founded, country_code, category
    FROM businesses as bus
    INNER JOIN categories as cat
        ON bus.category_code = cat.category_code
    WHERE year_founded < 1000
    ORDER BY year_founded;

-- Select the category and count of category (as "n") arranged by descending count, 
-- limited to 10 most common categories

SELECT category, COUNT(category) as n
    FROM categories as cat
    INNER JOIN businesses as bus
    ON cat.category_code = bus.category_code
    GROUP BY category
    ORDER BY n desc
    limit 10;

-- Select the oldest founding year (as "oldest") from businesses, and continent from countries
-- for each continent, ordered from oldest to newest 

SELECT continent, MIN(year_founded) as oldest 
    FROM businesses as bus
    INNER JOIN countries as cou
    ON bus.country_code = cou.country_code
    GROUP BY continent
    ORDER BY oldest;

-- Select the business, founding year, category, country, and continent

SELECT business, year_founded, country, continent, category
    FROM businesses as bus
    INNER JOIN countries as cou
    ON bus.country_code = cou.country_code
    INNER JOIN categories as cat
    ON bus.category_code = cat.category_code
    ORDER BY year_founded;

-- Count the number of businesses in each continent and category

SELECT continent, category, COUNT(business) as n
    FROM businesses as bus
    INNER JOIN categories as cat
    ON bus.category_code = cat.category_code
    INNER JOIN countries as cou
    ON bus.country_code = cou.country_code
    GROUP BY continent, category
    ORDER BY continent, n DESC;

-- Repeat that previous query, filtering for results having a count greater than 5

SELECT continent, category, COUNT(*) as n
    FROM businesses as bus
    INNER JOIN categories as cat
    ON bus.category_code = cat.category_code
    INNER JOIN countries as cou
    ON bus.country_code = cou.country_code
    GROUP BY continent, category
    having COUNT(*) > 5
    ORDER BY continent, n DESC;