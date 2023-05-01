USE S6_CW;

CREATE TABLE bankaccounts(accountno varchar(20) PRIMARY KEY NOT NULL, funds decimal(8,2));

INSERT INTO bankaccounts VALUES("ACC1", 1000);
INSERT INTO bankaccounts VALUES("ACC2", 1000);
-- Изменим баланс на аккаунтах
START TRANSACTION; 
UPDATE bankaccounts SET funds=funds-100 WHERE accountno='ACC1'; 
UPDATE bankaccounts SET funds=funds+100 WHERE accountno='ACC2'; 
COMMIT; -- ROLLBACK

SELECT * FROM bankaccounts;

/*
Реализуйте процедуру, внутри которой с помощью цикла выведите числа от N до 1:
N = 5=>5,4,3,2,1,
*/

DELIMITER $$
CREATE PROCEDURE repeat_proc()
BEGIN
	DECLARE n INT DEFAULT 5;
    DECLARE res VARCHAR(50) DEFAULT '';
    
    REPEAT
		SET res = CONCAT(res, ' ', n);
        SET n = n - 1;
        UNTIL n < 1
	END REPEAT;
    SELECT res;
END $$
DELIMITER ; -- говорит sql что сейчас было много запросов которые выполняются в одном большом

CALL repeat_proc();