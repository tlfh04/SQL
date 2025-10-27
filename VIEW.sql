USE world;

CREATE VIEW large_country AS
SELECT * FROM country WHERE Population >= 50000000;

SELECT * FROM large_country;

CREATE VIEW country_view AS
SELECT co.Name AS co_name,ci.Name AS ci_name FROM country co INNER JOIN city ci ON co.Code = ci.CountryCode;

SELECT * FROM country_view;

SHOW FULL TABLES;
SHOW FULL TABLES WHERE Table_type = 'VIEW';

DROP VIEW large_country;