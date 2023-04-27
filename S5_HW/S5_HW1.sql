USE s5_hw;

/*
1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 
30 000 долларов (используя оператор ALTER VIEW) 
3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
*/

CREATE TABLE Cars (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    cost INT
);

INSERT INTO Cars (name, cost)
VALUES
('Audi', 52642),
('Mercedes', 57127),
('Skoda', 9000),
('Volvo', 29000),
('Bentley', 350000),
('Citroen', 21000),
('Hummer', 41400),
('Volkswagen', 21600);

SELECT * FROM Cars;

-- 1
CREATE VIEW cheap_Cars AS
SELECT * 
FROM Cars 
WHERE cost <= 25000;

SELECT * FROM cheap_Cars;

-- 2
ALTER VIEW cheap_Cars AS
SELECT * 
FROM Cars 
WHERE cost <= 30000;

SELECT * FROM cheap_Cars;

-- 3
CREATE VIEW Skoda_Audi AS
SELECT * 
FROM Cars 
WHERE name IN ('Audi', 'Skoda');

SELECT * FROM Skoda_Audi;

