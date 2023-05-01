/*
Создайте хранимую функцию hello(), которая будет возвращать приветствие,
в зависимости от текущего времени суток.
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
*/

USE S6_CW;

DELIMITER $$
CREATE PROCEDURE hello()
BEGIN
	CASE 
		WHEN CURTIME() BETWEEN '06:00:00' AND '11:59:59' THEN
			SELECT 'Доброе утро';
		WHEN CURTIME() BETWEEN '12:00:00' AND '17:59:59' THEN
			SELECT 'Добрый день';
		WHEN CURTIME() BETWEEN '18:00:00' AND '23:59:59' THEN
			SELECT 'Добрый вечер';
		ELSE 
			SELECT 'Доброй ночи';
	END CASE;
END $$
DELIMITER ; -- говорит sql что сейчас было много запросов которые выполняются в одном большом

CALL hello();

-- Выведите первые N чисел Фибоначчи
/*
n0 = 0
n1 = 1
n2 = 0

n2 = n1 + n0
n0 = n1
n1 = n2
*/

DELIMITER //
CREATE FUNCTION fib(n INT)
RETURNS VARCHAR(255)
DETERMINISTIC -- функция работает быстрее, за счет того что для одинаковых значений данные уже есть и они сохраняюся
BEGIN
	DECLARE n0 INT DEFAULT 0;
    DECLARE n1 INT DEFAULT 1;
    DECLARE n2 INT DEFAULT 0;
    DECLARE res VARCHAR(255) DEFAULT '0 1';
    
    IF n = 1 THEN 
		RETURN n0;
	ELSEIF n = 2 THEN
		RETURN CONCATE(n0, ' ', n1);
	ELSE
		WHILE n > 2 DO
			SET n2 = n1 + n0;
            SET n0 = n1;
            SET n1 = n2;
            SET n = n - 1;
            SET res = CONCAT(res, ' ', n2);
		END WHILE;
        RETURN res;
	END IF;

END //
DELIMITER ;

SELECT fib(10);