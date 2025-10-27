USE world;

-- 서브쿼리(Subquery)

-- 서울 인구
SELECT Population FROM city WHERE name = 'seoul';

-- 서울 인구보다 많은 도시
SELECT * FROM city WHERE Population > (SELECT Population FROM city WHERE name = 'seoul');

-- 평균 인구수보다 많은 나라
SELECT name,Population FROM country WHERE Population > (SELECT AVG(Population) FROM country) ORDER BY Population DESC;


SELECT Code FROM country WHERE Continent = 'Asia';
-- 아시아 국가에 포함된 모든 도시 정보들
SELECT Name,CountryCode,Population FROM city WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Asia');

SELECT DISTINCT CountryCode FROM city;
-- 도시가 하나도 없는 국가
SELECT * FROM country WHERE Code NOT IN (SELECT DISTINCT CountryCode FROM city);

-- FROM 절의 서브쿼리
SELECT * FROM (SELECT Continent,COUNT(*) as co_count FROM country GROUP BY Continent) AS continent_table WHERE co_count > 40;


USE sakila;
SELECT * from film;
SELECT * from film_category;
SELECT * from rental;
SELECT * from customer;

-- 평균 대여료(`rental_rate`)보다 비싼 영화를 조회하세요.
-- - 영화 제목, 대여료. 대여료 내림차순 정렬
-- - 상위 10개

SELECT title,rental_rate FROM film WHERE rental_rate > (SELECT AVG(rental_rate) FROM film) ORDER BY rental_rate DESC LIMIT 10;

-- 'Action' 카테고리에 속한 영화를 조회하세요.
-- - 영화 제목

SELECT title FROM film INNER JOIN film_category fc ON film.film_id = fc.film_id INNER JOIN category cg ON fc.category_id = cg.category_id WHERE cg.name = 'Action'; 

SELECT category_id FROM category WHERE name = 'Action';
SELECT film_id FROM film_category WHERE category_id = (SELECT category_id FROM category WHERE name = 'Action');
SELECT title FROM film WHERE film_id IN (SELECT film_id FROM film_category WHERE category_id = (SELECT category_id FROM category WHERE name = 'Action'));

-- 대여 기록이 있는 고객만 조회하세요.
-- - 고객 이름 (first_name, last_name), 이메일

SELECT first_name,last_name,email FROM customer ct INNER JOIN rental rt ON ct.customer_id = rt.customer_id GROUP BY ct.customer_id;

SELECT first_name,last_name,email FROM customer WHERE EXISTS (SELECT * FROM rental WHERE customer.customer_id = rental.customer_id);

-- 고객별 대여 횟수를 구한 뒤, 대여 횟수가 30회 이상인 고객만 조회하세요.
-- - 고객 이름, 대여 횟수, 대여 횟수 내림차순
SELECT last_name AS 고객이름 ,COUNT(*) AS 대여횟수 FROM customer ct INNER JOIN rental rt ON ct.customer_id = rt.customer_id GROUP BY ct.customer_id  HAVING 대여횟수 >= 30 ORDER BY COUNT(*) DESC ;