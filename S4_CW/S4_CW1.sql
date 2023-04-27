USE s4_cw;

/*Задание:
Выведите участников, которые также являются членами комитета, используйте 
INNER JOIN (пересечение 2 таблиц по имени);
*/

CREATE TABLE members
(
	member_id INT AUTO_INCREMENT,
	name VARCHAR (100) ,
	PRIMARY KEY (member_id)
);

CREATE TABLE committees
(
	committee_id INT AUTO_INCREMENT,
	name VARCHAR (100),
	PRIMARY KEY (committee_id)
);

INSERT INTO members (name)
VALUES("John"), ("Jane"), ("wary"), ("David"), ("2melia");
INSERT INTO committees (name)
VALUES ("John"), ("Mary"), ("Amelial"), ("Joe");

SELECT * FROM members;

SELECT * FROM members 
INNER JOIN committees
USING(name);

/*
Задание:
1.	Выведите участников, которые являются членами комитета (Используя LEFT JOIN, выполните 
соединение двух таблиц  по полю “Имя”)
2.* 	Выведите участников, которые не являются членами комитета
*/

SELECT * FROM committees LEFT JOIN members USING(name) WHERE members.name IS NULL;

/*
Задание:
1. 	Найти членов комитета, которых нет в members с помощью RIGHT JOIN
2.	Выполнить RIGHT JOIN между 2 таблицами по полю “Имя”
*/

-- 1
SELECT * FROM committees 
RIGHT JOIN members 
USING(name) 
WHERE committees.name IS NULL;

-- 2
SELECT * FROM committees 
RIGHT JOIN members 
USING(name);

