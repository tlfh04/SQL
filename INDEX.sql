USE world;

-- 인덱스 조회
SHOW INDEX FROM city;

DESCRIBE city;

-- 인덱스 생성
CREATE INDEX idx_city_name ON city(Name);
EXPLAIN SELECT * FROM city WHERE name = 'Seoul';

SHOW INDEX FROM city;

-- 인덱스 삭제
DROP INDEX idx_city_name ON city;