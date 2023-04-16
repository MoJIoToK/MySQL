USE my_first_database;

-- Создание новой таблицы
CREATE TABLE Customer
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Age INT,
    FirstName VARCHAR(20),
    LastName VARCHAR(20)
);

# Закончили создание таблицы
SELECT * FROM Customer;

-- Арифметические операции 
SELECT 3+5;
SELECT 3-5;
SELECT 30/5;
SELECT 3*5;
SELECT 33333333333*55555555555; /* Ошибка Error Code: 1690. 
BIGINT value is out of range in '(33333333333 * 55555555555)' */

-- Логические операторы


