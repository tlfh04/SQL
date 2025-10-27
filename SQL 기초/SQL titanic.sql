USE temp;
SELECT * FROM titanic;
-- 타이타닉 테이블에서 모든 컬럼의 상위 5개 행을 조회하세요.
SELECT * FROM titanic LIMIT 5;

-- 타이타닉 테이블의 전체 승객 수를 조회하세요. (결과 컬럼명: row_count)
SELECT COUNT(*) AS 'row_count' FROM titanic;

-- cabin 컬럼의 결측치(빈 문자열) 개수를 조회하세요.
SELECT COUNT(cabin) AS 'NULL cabin' FROM titanic WHERE cabin = '';

-- 요금(fare)의 최솟값, 최댓값, 평균값을 조회하세요.
SELECT MIN(fare),MAX(fare),AVG(fare) FROM titanic;

-- 1등석(pclass = 1) 승객의 이름(name), 티켓(ticket), 요금(fare)을 조회하세요.
SELECT name, ticket, fare FROM titanic WHERE pclass = 1;

-- 셰르부르 항구(embarked = 'C')에서 탑승한 승객의 모든 정보를 조회하세요.
SELECT * FROM titanic WHERE embarked = 'C';

-- 30세 미만이면서 생존한 승객의 이름(name), 나이(age), 성별(sex)을 조회하세요.
SELECT name, age, sex FROM titanic WHERE age < 30 AND survived = 1;

-- 모든 승객을 요금이 비싼 순서로 정렬하여 조회하세요.
SELECT name,pclass,fare FROM titanic ORDER BY fare DESC;

-- 1등석 여성 승객의 이름(name), 나이(age), 요금(fare)을 조회하세요.
SELECT name, age, fare FROM titanic WHERE sex = 'female' AND pclass = 1 ORDER BY age ASC;

-- 전체 생존율 (소수점 둘째 자리까지 백분율로 표시)
SELECT ROUND(AVG(Survived),2) FROM titanic;

-- 생존 여부별 승객 수
SELECT COUNT(survived) FROM titanic WHERE survived = 0; 
SELECT COUNT(survived) FROM titanic WHERE survived = 1; 

-- 성별로 다음 정보를 조회하세요: 총 승객 수, 생존자 수, 생존율 (소수점 둘째 자리까지 백분율), 생존율이 높은 순서로 정렬
SELECT sex,COUNT(survived),ROUND(AVG(survived)*100,2) FROM titanic GROUP BY sex ORDER BY AVG(Survived);

-- 등급별 생존율
SELECT AVG(survived) FROM titanic GROUP BY pclass;

-- 등급별 평균 요금, 최소 요금, 최대 요금
SELECT AVG(fare), MIN(fare), MAX(fare) FROM titanic GROUP BY pclass;

-- 탑승 항구와 등급별로 승객 수를 조회하세요. embarked가 NULL인 데이터는 제외, 항구, 등급 순서로 정렬
SELECT embarked,pclass,COUNT(embarked) FROM titanic WHERE embarked != '' GROUP BY Embarked,Pclass ORDER BY Embarked,Pclass;

-- 등급과 성별로 다음 정보를 조회하세요: 총 승객 수, 생존자 수, 생존율 (백분율), [등급, 성별 순서로 정렬]
SELECT pclass,sex,COUNT(*),SUM(survived),ROUND(AVG(survived)*100,2) FROM titanic GROUP BY pclass,sex ORDER BY pclass,sex;

-- 다음 두 가지 정보를 각각 조회하세요: '혼자' vs '가족동반' 생존율 비교, 가족 규모 = sibsp + parch, 0명이면 '혼자', 1명 이상이면 '가족동반'
SELECT CASE sibsp+parch WHEN 0 THEN '혼자' ELSE '가족동반' END AS '가족규모', ROUND(AVG(survived)*100,2) FROM titanic GROUP BY 가족규모;

-- 가족이 1명이라도 있는 승객의 평균 생존율
SELECT COUNT(*),AVG(survived) FROM titanic WHERE sibsp+parch != 0;

-- 가족 규모(본인 포함 = 1 + sibsp + parch)별로 승객 수와 생존율을 조회하세요. : 가족 규모 순서로 정렬
SELECT 1+sibsp+parch AS '본인포함 가족규모',COUNT(survived),ROUND(AVG(survived)*100,2) FROM titanic GROUP BY 1+sibsp+parch ORDER BY 1+sibsp+parch;

-- 연령대별 승객 수 및 생존율 : 다음 방식으로 연령대를 구분하여 생존율을 조회하세요: 1. 3개 그룹으로 구분, 18세 미만 -> 'Child' / 18-60세 → 'Adult' / 60세 초과 → 'Senior' 
SELECT 
	CASE
		WHEN age < 18 THEN 'Child' 
        WHEN age < 60 THEN 'Audlt' 
        ELSE 'Senior' 
	END AS age_range, 
	AVG(survived) 
FROM titanic
GROUP BY age_range;

SELECT CASE WHEN fare < 10 THEN '저가' WHEN fare < 29 THEN '중저가' WHEN fare < 100 THEN '중고가' ELSE '고가' END as fare_brand, COUNT(*),AVG(survived) FROM titanic GROUP BY fare_brand;

SELECT pclass,COUNT(*),AVG(fare) FROM titanic GROUP BY pclass HAVING AVG(fare) > 50;

SELECT name,pclass,fare FROM titanic WHERE fare > (SELECT AVG(fare) FROM titanic) ORDER BY fare DESC LIMIT 20; 

SELECT name,age,pclass FROM titanic WHERE pclass = 1 AND age > (SELECT AVG(age) FROM titanic WHERE pclass = 3) ORDER BY age DESC LIMIT 20;