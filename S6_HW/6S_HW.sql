USE s6_hw;

/*
1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
2.	Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
*/

-- 1
DELIMITER $$
CREATE PROCEDURE times2(seconds INT)
BEGIN
	CASE 
		WHEN seconds < 60 THEN
			SELECT CONCAT(seconds, ' ', 'seconds') AS Times;
		WHEN seconds >= 60 AND seconds < 3600 THEN
			SELECT CONCAT(seconds DIV 60, ' ', 'minutes', ' ', seconds % 60, ' ', 'seconds') AS Times;
		WHEN seconds >= 3600 AND seconds < 86400 THEN
			SELECT CONCAT(seconds DIV 3600, ' ', 'hours', ' ', (seconds % 3600) DIV 60, ' ', 'minutes', ' ',((seconds % 3600) % 60) % 60, ' ', 'seconds') AS Times;
		ELSE 
			SELECT CONCAT(seconds DIV 86400, ' ', 'days', ' ', (seconds % 86400) DIV 3600, ' ', 'hours', ' ', ((seconds % 86400) % 3600) DIV 60, ' ', 'minutes', ' ', (((seconds % 86400) % 3600) % 60) % 60, ' ', 'seconds') AS Times;
	END CASE;
END $$
DELIMITER ;

CALL times2(123456);


-- 2
DELIMITER $$
CREATE PROCEDURE get_even()
BEGIN
	DECLARE n INT DEFAULT 2;
    DECLARE res VARCHAR(50) DEFAULT '';
    REPEAT
		SET res = CONCAT(res, ' ', n);
        SET n = n + 2;
        UNTIL n > 10
	END REPEAT;
    SELECT res;
END $$
DELIMITER ;

CALL get_even();

