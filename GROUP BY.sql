USE world;

SELECT * FROM country;

-- GROUP BY
SELECT * FROM country GROUP BY Continent ORDER BY 인구수 DESC;
SELECT Continent,Region,COUNT(*) FROM country GROUP BY Continent,Region ORDER BY Continent, COUNT(*);
SELECT Continent,COUNT(*) FROM country WHERE Population >= 100000000 GROUP BY Continent;
SELECT Continent,AVG(Population) FROM country GROUP BY Continent HAVING AVG(Population) > 20000000;

-- 실습
USE sakila;
SELECT * FROM film;
SELECT rating,COUNT(*) FROM film GROUP BY rating ORDER BY COUNT(*) DESC;
SELECT rating,COUNT(*),ROUND(AVG(rental_rate),2),MAX(rental_rate),MIN(rental_rate) FROM film GROUP BY rating ORDER BY AVG(rental_rate) DESC;
SELECT rating, COUNT(*), AVG(rental_rate) FROM film GROUP BY rating HAVING COUNT(*) > 100;
SELECT rating,COUNT(*),AVG(rental_rate) FROM film WHERE rating >= 2.99 GROUP BY rating HAVING COUNT(*) >= 50;
SELECT * FROM actor;
SELECT last_name,COUNT(*) FROM actor GROUP BY last_name HAVING COUNT(*) >= 2 ORDER BY COUNT(*) DESC;