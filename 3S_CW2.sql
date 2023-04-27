/*
1.	Рассчитайте общее количество всех страниц daily_typing_pages
2.	Выведите общее количество напечатанных страниц каждым человеком (с помощью предложения GROUP BY)  
3.	Посчитайте количество записей в таблице
4.	Выведите количество имен, которые являются уникальными 
5. 	Найдите среднее арифметическое по количеству ежедневных страниц для набора (daily_typing_pages)
*/

USE lesson_1;

CREATE TABLE employee_tbl (
	id_emp INT AUTO_INCREMENT PRIMARY KEY,
	id INT NOT NULL,
	name VARCHAR(50) NOT NULL,
	work_date DATE,
	daily_typing_pages INT
);

-- Наполнение данными
INSERT INTO employee_tbl (id, name, work_date, daily_typing_pages)
VALUES
(1, 'John', '2007-01-24', 250),
(2, 'Ram',  '2007-05-27', 220),
(3, 'Jack', '2007-05-06', 170),
(3, 'Jack', '2007-04-06', 100),
(4, 'Jill', '2007-04-06', 220),
(5, 'Zara', '2007-06-06', 300),
(5, 'Zara', '2007-02-06', 350);

-- 1.
SELECT SUM(daily_typing_pages) AS 'SUM' FROM employee_tbl;

-- 2. 
SELECT name AS 'имя', SUM(daily_typing_pages) AS 'SUM' FROM employee_tbl
GROUP BY name;

-- 3.
SELECT COUNT(*) AS 'Количество строк' FROM employee_tbl;
SELECT COUNT(id) AS 'Количество строк' FROM employee_tbl;
SELECT COUNT('hi') AS 'Количество строк' FROM employee_tbl;

-- 4.
SELECT COUNT(DISTINCT(name)) AS 'Unique name' FROM employee_tbl;

-- 5.
SELECT AVG(daily_typing_pages) AS 'AVG' FROM employee_tbl;

SELECT name, ROUND(AVG(daily_typing_pages), 1) AS 'AVG' FROM employee_tbl
GROUP BY name;
