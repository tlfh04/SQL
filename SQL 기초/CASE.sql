USE world;

-- CASE
SELECT Name,Continent, CASE Continent WHEN 'Asia' THEN '아시아' WHEN 'Europe' THEN '유럽' ELSE 'etc' END AS '한글포멧' FROM country;
SELECT Name,Population,CASE WHEN Population >= 100000000 THEN '큰국가' WHEN Population >= 50000000 THEN '중간국가' ELSE '작은국가' END AS '국가크기' FROM country;
SELECT Name,Population,GNP, CASE WHEN (GNP / Population) >= 0.02 THEN '선진국' ELSE '선진국 아님' END AS '선진국' FROM country;
SELECT Name,Continent, Population FROM Country WHERE Population >= CASE Continent WHEN 'Asia' THEN 50000000 WHEN 'Europe' THEN 300000000 ELSE 100000000 END;
SELECT Name,Continent,Population FROM country ORDER BY CASE Continent WHEN 'Asia' THEN Population WHEN 'Europe' THEN GNP ELSE Population END;

-- 조건부 집계
SELECT Continent, COUNT(*),SUM(CASE WHEN Population > 50000000 THEN 1 ELSE 0 END) FROM country GROUP BY Continent;