USE world;

-- 단일 컬럼 정렬
SELECT * FROM country ORDER BY Population DESC;
SELECT * FROM country ORDER BY Name DESC;
-- 이중 컬럼 정렬
SELECT * FROM country ORDER BY Continent, Population DESC;

-- WHERE 절과 함께 정렬
SELECT * FROM country WHERE Continent = 'Asia' ORDER BY GNP DESC;

-- LIMIT
SELECT * FROM country ORDER BY Population DESC LIMIT 5;

-- OFFSET
SELECT * FROM country ORDER BY Population DESC LIMIT 5 OFFSET 10;
SELECT * FROM country ORDER BY Population DESC LIMIT 5, 5;
