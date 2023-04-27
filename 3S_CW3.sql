/*
1. Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). 
Для каждой группы  найдите суммарную зарплату 
2. Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). 
Найдите максимальную заработную плату внутри группы
3. Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). 
Найдите минимальную заработную плату внутри группы
*/

USE lesson_1;

CREATE TABLE employee_salary (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	age INT,
	salary INT
);

-- Наполнение данными
INSERT INTO employee_salary (name, age, salary)
VALUES
('Дима', 23, 100),
('Петя', 23, 200),
('Вася', 23, 300),
('Коля', 24, 1000),
('Иван', 24, 2000),
('Паша', 25, 700);

-- 1. 
SELECT age, SUM(salary) AS SUM FROM employee_salary GROUP BY age;

-- 2.
SELECT age, MAX(salary) AS MAX FROM employee_salary GROUP BY age;

-- 3.
SELECT age, MIN(salary) AS MIN FROM employee_salary GROUP BY age;


-- HAVING
/*
1.	Выведите  только те строки, в которых суммарная зарплата больше или равна 1000
2. 	Выведите только те группы, в которых количество строк меньше или равно двум
3.	Выведите только те группы, в которых количество строк меньше или равно двум. 
Для решения используйте оператор “BETWEEN”
4.*	Выведите только те группы, в которых количество строк меньше или равно двум. 
Для решения используйте оператор “IN”
*/

-- 1
SELECT age, SUM(salary) AS SUM 
FROM employee_salary 
GROUP BY age
HAVING SUM >= 1000;

-- 2
SELECT age, COUNT(*) AS COUNT FROM 
employee_salary 
GROUP BY age
HAVING COUNT <= 2;

-- 3
SELECT age, COUNT(*) AS COUNT FROM 
employee_salary 
GROUP BY age
HAVING COUNT BETWEEN 0 AND 2;

-- 4
SELECT age, COUNT(*) AS COUNT FROM 
employee_salary 
GROUP BY age
HAVING COUNT IN (0, 1, 2);
