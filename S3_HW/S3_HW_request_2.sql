USE lesson_1;

/*
Таблица для работы (из классной работы)
1. Отсортируйте поле “зарплата” в порядке убывания и возрастания
2. ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой 
(возможен подзапрос)
3. Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
*/

-- 1 По убыванию
SELECT * FROM staff ORDER BY salary DESC;

-- 1 По возрастанию
SELECT * FROM staff ORDER BY salary;

-- 2 
SELECT * 
FROM staff 
ORDER BY salary
LIMIT 7, 5;

-- 3
SELECT post, SUM(salary) AS SUM 
FROM staff 
GROUP BY post
HAVING SUM > 100000;
