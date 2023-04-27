/*
1.	Выведите все записи, отсортированные по полю "age" по возрастанию
2.	Выведите все записи, отсортированные по полю "name"
3.	Выведите записи полей "name", "surname","age",
отсортированные по полю "name" в алфавитном порядке по убыванию
4.	Выполните сортировку по полям "name" и "age" по убыванию
*/
USE lesson_1;

-- Создание таблицы
CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	post VARCHAR(100),
	seniority INT, 
	salary INT, 
	age INT
);

-- Наполнение данными
INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 25),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);

-- 1. 
SELECT * FROM staff ORDER BY age;

-- 2. 
SELECT * FROM staff ORDER BY firstname, lastname;

-- 3.
SELECT firstname, lastname, age 
FROM staff 
ORDER BY firstname DESC;

-- 4.
SELECT * FROM staff ORDER BY firstname DESC, age DESC;


-- DISTINCT & LIMIT
/*
1.	Выведите уникальные (неповторяющиеся) значения полей "name"
2.	Выведите первые две первые записи из таблицы
3.	Пропустите  первые 4 строки ("id" = 1, "id" = 2,"id" = 3,"id" = 4) и 
извлеките следующие 3 строки ("id" = 5, "id" = 6, "id" = 7)
4*. 	Пропустите две последнии строки (где id=12, id=11) и извлекаются следующие за 
ними 3 строки (где id=10, id=9, id=8)
*/

-- 1.
SELECT distinct(firstname), id FROM staff ORDER BY firstname DESC; 
/* DISTINCT берет именно одинаковые СТРОКИ. Если в строке повторяется только колонка, 
то строка всё равно считается уникальной.
*/

-- 1.
SELECT distinct(firstname) FROM staff ORDER BY firstname DESC; 

-- 2.
SELECT * FROM staff LIMIT 2; 

-- 3.
SELECT * FROM staff LIMIT 4, 3; 

-- 4.
SELECT * 
FROM staff 
ORDER BY id DESC 
LIMIT 2, 3; 