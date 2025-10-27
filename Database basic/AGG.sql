USE world;

SELECT * FROM country;

-- COUNT 함수
SELECT COUNT(*) AS 총국가수 FROM country;
SELECT COUNT(LifeExpectancy) FROM country;
SELECT COUNT(DISTINCT Region) FROM country;

-- SUM 함수
SELECT SUM(Population) FROM country;
SELECT SUM(Population) FROM country WHERE Continent = 'Asia';
SELECT SUM(Population) FROM country WHERE Population >= 100000000;

-- ROUND 함수 // SELECT와 FROM 문 안에는 사칙연산을 지원한다
SELECT ROUND(SUM(SurfaceArea) / 10000) FROM country ;

-- AVG함수
SELECT AVG(Population) FROM country;
SELECT AVG(Population) FROM country WHERE Continent = 'Asia';

-- 반환되는 값을 조건으로 이용 가능함
SELECT * FROM country WHERE Population = (SELECT MAX(Population) FROM country);

-- 여러 집계 함수 조합
SELECT COUNT(*),SUM(Population),AVG(Population),MAX(Population),MIN(Population) FROM country;

-- NULL에 값을 넣어 평균값 계산
SELECT LifeExpectancy FROM country;
SELECT AVG(LifeExpectancy) FROM country;
SELECT AVG(COALESCE(LifeExpectancy, 55)) FROM country;

-- 실습
USE sakila;
SELECT * FROM film;
SELECT COUNT(*) FROM film;
SELECT COUNT(*) FROM film WHERE rating = 'PG';
SELECT COUNT(DISTINCT rating) FROM film;
SELECT SUM(rental_rate) FROM film;
SELECT ROUND(AVG(rental_rate),2) FROM film;
SELECT AVG(rental_rate) FROM film WHERE rating = 'R';
SELECT title FROM film WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);
SELECT title FROM film WHERE length = (SELECT MIN(length) FROM film);
SELECT COUNT(*),SUM(rental_rate),AVG(rental_rate),MAX(rental_rate),MIN(rental_rate) FROM film