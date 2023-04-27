CREATE DATABASE s5_cw_mydb;
USE s5_cw_mydb;

/*
1.	Используя СТЕ, выведите всех пользователей из таблицы users_profile
2.	Используя СТЕ, подсчитайте количество активных пользователей. Задайте псевдоним результирующему 
окну. Пример:
3. 	С помощью СТЕ реализуйте таблицу квадратов чисел от 1 до 10:(пример для чисел от 1 до 3)
*/

CREATE TABLE users (
username VARCHAR(50) PRIMARY KEY,
password VARCHAR(50) NOT NULL,
status VARCHAR(10) NOT NULL);

CREATE TABLE users_profile (
username VARCHAR(50) PRIMARY KEY,
name VARCHAR(50) NOT NULL,
address VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE);

INSERT INTO users values
('admin' , '7856', 'Active'),
('staff' , '90802', 'Active'),
('manager' , '35462', 'Inactive');

INSERT INTO users_profile values
('admin', 'Administrator' , 'Dhanmondi', 'admin@test.com' ) ,
('staff', 'Jakir Nayek' , 'Mirpur', 'zakir@test.com' ),
('manager', 'Mehr Afroz' , 'Eskaton', 'mehr@test.com' );

-- 1
WITH cte1 AS
(
	SELECT * FROM users_profile
    -- WHERE name = 'Administrator'
)
SELECT * FROM cte1;

-- 2
WITH cte2 AS
(
	SELECT COUNT(*) AS count FROM users
    WHERE status = 'Active'
)
SELECT * FROM cte2;

-- 3
WITH RECURSIVE cte3 AS
(
	SELECT 1 AS a, 1 * 1 AS res -- базовый случай. Самая первая итерация
    UNION ALL
    SELECT a + 1, POW(a + 1, 2) as res -- алгоритм вычисления для следующих значений
    FROM cte3
    WHERE a < 10
)
SELECT * FROM cte3;


