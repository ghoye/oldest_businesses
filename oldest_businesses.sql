-- Connect to database

postgresql:///oldestbusinesses
 
-- What are the oldest and newest founding years?

SELECT MIN(year_founded), MAX(year_founded) FROM businesses;

-- Which businesses were founded in those years?

SELECT * FROM businesses
    WHERE year_founded =
        (SELECT MIN(year_founded)
        FROM businesses)
        OR year_founded =
        (SELECT MAX(year_founded)
        FROM businesses);

-- How many businesses were founded before the year 1000?

SELECT COUNT(*) FROM businesses WHERE year_founded < 1000;

-- Which businesses were founded before the year 1000?

SELECT * FROM businesses 
    WHERE year_founded < 1000 
    ORDER BY year_founded;

-- What kind of businesses are those?

SELECT business, year_founded, country_code, category
    FROM businesses as bus
    INNER JOIN categories as cat
        ON bus.category_code = cat.category_code
    WHERE year_founded < 1000
    ORDER BY year_founded;

-- Which categories are the most prominent among the world's oldest businesses?

SELECT category, COUNT(category) as n
    FROM categories as cat
    INNER JOIN businesses as bus
    ON cat.category_code = bus.category_code
    GROUP BY category
    ORDER BY n desc
    limit 10;

-- What is the earliest founding year by continent? 

SELECT continent, MIN(year_founded) as oldest 
    FROM businesses as bus
    INNER JOIN countries as cou
    ON bus.country_code = cou.country_code
    GROUP BY continent
    ORDER BY oldest;

-- All businesses, including year founded, country, continent, and type of business

SELECT business, year_founded, country, continent, category
    FROM businesses as bus
    INNER JOIN countries as cou
    ON bus.country_code = cou.country_code
    INNER JOIN categories as cat
    ON bus.category_code = cat.category_code
    ORDER BY year_founded;

-- Number of businesses in each continent and category

SELECT continent, category, COUNT(business) as n
    FROM businesses as bus
    INNER JOIN categories as cat
    ON bus.category_code = cat.category_code
    INNER JOIN countries as cou
    ON bus.country_code = cou.country_code
    GROUP BY continent, category
    ORDER BY continent, n DESC;

-- Category totals by continent with high count (> 5)

SELECT continent, category, COUNT(*) as n
    FROM businesses as bus
    INNER JOIN categories as cat
    ON bus.category_code = cat.category_code
    INNER JOIN countries as cou
    ON bus.country_code = cou.country_code
    GROUP BY continent, category
    having COUNT(*) > 5
    ORDER BY continent, n DESC;