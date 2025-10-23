USE temp;

DROP TABLE customer;

-- 테이블 생성
CREATE TABLE customer (
	id		INT PRIMARY KEY AUTO_INCREMENT,
    name	VARCHAR(50) NOT NULL,
    email	VARCHAR(100) NOT NULL
); 

-- CRUD
INSERT INTO customer (name, email) VALUES 
('kim','asdf@naver.com'),
('lee','1235@naver.com'),
('hong','qwer@naver.com')
;

SELECT * FROM customer;

UPDATE customer SET email = '1234@naver.com' WHERE id = 1;

DELETE FROM customer WHERE id = 1;

-- SELECT
SELECT name, email AS 이메일, id FROM customer;

-- SELECT world
USE world;
SELECT * FROM country;
SELECT DISTINCT Continent FROM country;