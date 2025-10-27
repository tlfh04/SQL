USE world;
SELECT * FROM city WHERE CountryCode = 'KOR';
SELECT * FROM country WHERE Code = 'KOR';
SELECT 
	ci.name AS '도시이름',
    co.name AS '나라이름',
    co.Continent AS '대륙',
    ci.Population AS '도시인구' ,
    co.Population AS '국가인구',
    ci.population / co.population 
FROM city ci INNER JOIN country co 
ON ci.CountryCode = co.Code 
WHERE co.name = 'South Korea';

SELECT co.name,count(*) FROM city ci INNER JOIN country co ON ci.CountryCode = co.Code GROUP BY co.Name ORDER BY COUNT(*) DESC;

SELECT co.Continent,COUNT(*),AVG(ci.Population) FROM city ci INNER JOIN country co 
ON ci.CountryCode = co.Code
GROUP BY co.Continent;

SELECT COUNT(DISTINCT co.Code) AS '전체 국가수_Join', (SELECT COUNT(*) FROM country) AS '전체 국가수_Country' FROM city ci INNER JOIN country co
ON ci.CountryCode = co.Code;

SELECT * FROM country co RIGHT JOIN city ci ON co.Code = ci.CountryCode ORDER BY co.population;

SELECT c1.name,c2.name FROM city c1 INNER JOIN city c2 ON c1.ID = c2.ID WHERE c1.CountryCode = 'kor';

SELECT *
FROM country co INNER JOIN city ci ON co.Code = ci.CountryCode
				INNER JOIN countrylanguage cl ON ci.CountryCode = cl.CountryCode;
                
-- 실습

USE sakila;
SELECT * FROM film;
SELECT * FROM language;
SELECT * FROM category;
SELECT * FROM customer;
SELECT * FROM rental;
-- 영화(`film`)와 언어(`language`) 테이블을 조인하여 다음을 조회하세요:
-- - 영화 제목 (`film.title`), 언어 이름 (`language.name`)

SELECT * FROM film fm INNER JOIN language lg ON fm.film_id = lg.language_id;

-- 영화와 카테고리를 조인하여 다음을 조회하세요:
-- - 영화 제목, 카테고리 이름, 대여료

SELECT fm.title,cg.name,fm.rental_rate FROM film fm INNER JOIN film_category fc ON fm.film_id = fc.category_id INNER JOIN category cg ON fc.category_id = cg.category_id;

-- 모든 고객(`customer`)과 그들의 대여 내역(`rental`)을 조회하세요.
-- - 고객 이름 (first_name, last_name), 대여 ID (rental_id), 대여 날짜 (rental_date)

SELECT ct.first_name,ct.last_name,rt.rental_id,rt.rental_date FROM customer ct LEFT JOIN rental rt ON ct.customer_id = rt.customer_id;

-- 고객별 대여 횟수를 조회하세요. (대여 횟수 0인 고객도 포함)
-- - 고객 이름, 대여 횟수, 대여 횟수가 많은 순서

SELECT ct.customer_id,ct.last_name,count(*) FROM customer ct LEFT JOIN rental rt ON ct.customer_id = rt.customer_id GROUP BY ct.customer_id ORDER BY count(*) DESC;

-- 같은 상영 시간(`length`)을 가진 영화 쌍을 찾으세요.
-- - 영화1 제목, 영화2 제목, 상영 시간, 상위 10개

SELECT f1.title,f2.title,f1.length FROM film f1 INNER JOIN film f2 ON f1.length = f2.length ORDER BY f1.length DESC LIMIT 10;