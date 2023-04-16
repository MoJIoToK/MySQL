-- Коммент
# Comment
/*
comment
comment
1. Получить список с информацией обо всех студентах
2. Получить список всех студентов с именем "Антон"
3. Вывести имя и почту из таблички "Студенты"
4*. Выбрать студентов, имена которых начинаются с буквы «А».
*/

-- Подклдчение к БД
USE lesson_1;

-- 1 
SELECT * FROM students;

-- 1.1
SELECT name FROM students;

-- 2
SELECT * FROM students
WHERE name = 'Alex';

-- 3
SELECT name, phone_number FROM students;

-- 4
-- Like
-- % - любая подстрока; 
-- _ - любой одиночный символ;
SELECT * FROM students
WHERE name LIKE '%a%' OR name LIKE '_o_';
