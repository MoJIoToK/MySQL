USE s4_cw;

-- Создание таблицы с товарами
CREATE TABLE products (
     product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     category INT NULL,
     product_name VARCHAR(100) NOT NULL
   );
   
-- Создание таблицы с категориями
CREATE TABLE categories (
     category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     category_name VARCHAR(100) NOT NULL
   );

-- Добавление данных в таблицу с товарами
INSERT INTO products(category, product_name)
VALUES 
	(1, 'Системный блок'),
	(1, 'Монитор'),
	(2, 'Холодильник'),
	(2, 'Телевизор'),
	(NULL, 'Операционная система');

-- Добавление данных в таблицу с категориями
INSERT INTO categories (category_name)
VALUES 
	('Комплектующие компьютера'),
	('Бытовая техника'),
	('Мобильные устройства');
    
SELECT * FROM products;
            
SELECT p.product_name, c.category_name
FROM products p
LEFT JOIN categories c
ON p.category = c.category_id

UNION

SELECT p.product_name, c.category_name
FROM products p
RIGHT JOIN categories c
ON p.category = c.category_id;

/*
CREATE TABLE t1(
    id INT PRIMARY KEY
);

CREATE TABLE t2 (
    id INT PRIMARY KEY
);

INSERT INTO t1 VALUES (1),(2),(3);
INSERT INTO t2 VALUES (2),(3),(4);- - UNION
SELECT id FROM t1
UNION
SELECT id FROM t2;

*/
CREATE TABLE t1(
    id INT PRIMARY KEY
);

CREATE TABLE t2 (
    id INT PRIMARY KEY
);

INSERT INTO t1 VALUES (1),(2),(3);
INSERT INTO t2 VALUES (2),(3),(4);

-- UNION
SELECT id FROM t1
UNION
SELECT id FROM t2;
