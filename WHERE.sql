USE world;

-- WHERE 절 예시
SELECT * FROM country WHERE Code = 'AFG';
SELECT * FROM country WHERE Name = 'South Korea';
SELECT * FROM country WHERE Continent = 'Asia';

-- 비교연산자
SELECT * FROM country WHERE LifeExpectancy >= 80;
SELECT * FROM country WHERE GNP < 10000;

-- AND OR 연산자
SELECT * FROM country WHERE Continent = 'Asia' AND Population >= 100000000;
SELECT * FROM country WHERE Continent = 'Europe' OR Continent = 'North America';

-- NOT 연산자
SELECT * FROM country WHERE Continent != 'Asia';
SELECT * FROM country WHERE NOT Continent = 'Asia';

-- BETWEEN 범위연산자
SELECT * FROM country WHERE LifeExpectancy > 70 AND LifeExpectancy < 80;
SELECT * FROM country WHERE LifeExpectancy BETWEEN 70 AND 80;

-- IN 범위연산자
SELECT * FROM country WHERE Continent IN ('Asia','Europe');

-- LIKE 패턴 매칭
SELECT * FROM country WHERE Name LIKE 'South%';
SELECT * FROM country WHERE Name LIKE '%States%';
SELECT * FROM country WHERE Name Like '_____';
SELECT * FROM country WHERE Name Like '___land';

SELECT * FROM country;

-- NULL 처리
-- SELECT * FROM country WHERE GNPOld = NULL; 이렇게는 안됌
SELECT * FROM country WHERE GNPOld IS NULL;
SELECT * FROM country WHERE IndepYear IS NOT NULL;

USE sakila;
SELECT title,rental_rate FROM film WHERE rental_rate >= 4;
SELECT * FROM film WHERE length < 120;
SELECT * FROM film WHERE rating = 'PG-13';
SELECT * FROM film WHERE rating = 'PG' AND replacement_cost >= 3;
SELECT * FROM film WHERE rating = 'G' OR rating = 'PG';
SELECT * FROM film WHERE length < 60 OR length >= 180;
SELECT * FROM film WHERE title LIKE '%LOVE%';
SELECT * FROM film WHERE title LIKE 'THE%';
SELECT * FROM actor WHERE last_name = '%SON';
SELECT * FROM film WHERE (rating = 'PG-13') AND (rental_rate BETWEEN 2.99 AND 4.99) AND (length >= 90);