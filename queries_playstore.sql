-- Comments in SQL Start with dash-dash --

--1. 
SELECT app_name from analytics
    WHERE id = 1880;

--2. 
SELECT id, app_name FROM analytics
    WHERE last_updated = '2018-08-01';

--3. 
SELECT category, COUNT(*) AS app_count FROM analytics
    GROUP BY category;

--4. 
SELECT app_name, reviews FROM analytics
    ORDER BY reviews desc
    LIMIT 5;

--5. 
SELECT app_name FROM analytics
    WHERE rating >= 4.8
    ORDER BY reviews desc
    LIMIT 1;

--6. 
SELECT category, AVG(rating) AS avg_rating FROM analytics
    GROUP BY category
    ORDER BY AVG(rating) desc;

--7. 
SELECT app_name, price, rating FROM analytics
    WHERE rating < 3
    ORDER BY  price desc
    LIMIT 1;

--8. 
SELECT app_name FROM analytics
    WHERE min_installs < 50 AND rating IS NOT null
    ORDER BY rating desc;

--9. 
SELECT app_name FROM analytics
    WHERE rating < 3 AND reviews > 10000;

--10. 
SELECT app_name FROM analytics
    WHERE price BETWEEN 0.10 AND 1.00
    ORDER BY reviews desc
    LIMIT 10;

--11. 
SELECT app_name FROM analytics
    WHERE last_updated = (
        SELECT MAX(last_updated) FROM analytics
    );

--12. 
SELECT app_name FROM analytics
    WHERE price = (
        SELECT MAX(price) FROM analytics
    );

--13. 
SELECT SUM(reviews) FROM analytics;

--14. 
SELECT category FROM analytics
    GROUP BY category
    HAVING COUNT(*) > 300;

--15. 
SELECT app_name, reviews, min_installs, min_installs/reviews AS proportion FROM analytics
    WHERE min_installs >= 100000
    ORDER BY proportion desc
    LIMIT 1;

--FS1. 
SELECT app_name, rating FROM analytics x
WHERE min_installs >=50000 AND
rating > ALL(SELECT rating from analytics y
WHERE y.category = x.category AND
y.app_name != x.app_name);

--FS2.
SELECT * FROM analytics
WHERE app_name ILIKE ('%facebook%');

--FS3.
SELECT * FROM analytics
WHERE cardinality(genres) > 1;

--FS4.
SELECT * FROM analytics 
WHERE genres @> ARRAY['Education'];