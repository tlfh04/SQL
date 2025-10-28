USE temp;
CREATE TABLE accounts (
	id	INT	PRIMARY KEY	auto_increment,
    name VARCHAR(10),
    balance	INT
);

INSERT INTO accounts (name,balance)
VALUES ('kim',100000);
INSERT INTO accounts (name,balance)
VALUES ('lee',200000);

SELECT * FROM accounts;

-- 트랜잭션 시작
START TRANSACTION;
UPDATE accounts SET balance = balance + 10000 WHERE id = 1;
UPDATE accounts SET balance = balance - 10000 WHERE id = 2;
-- 롤백
ROLLBACK;
-- 커밋
COMMIT;

START transaction;
INSERT INTO accounts (name,balance)
VALUES ('kim',100000);
INSERT INTO accounts (name,balance)
VALUES ('lee',200000);

-- 테이블 생성
CREATE TABLE accounts (
    account_id VARCHAR(10) PRIMARY KEY,
    owner_name VARCHAR(50),
    balance DECIMAL(15, 2)
);

-- 샘플 데이터
INSERT INTO accounts VALUES
('A001', 'Alice', 1000000.00),
('B001', 'Bob', 500000.00);

-- 이체 트랜잭션
START TRANSACTION;

UPDATE accounts SET balance = balance - 100000 WHERE account_id = 'A001';
UPDATE accounts SET balance = balance + 100000 WHERE account_id = 'B001';

COMMIT;