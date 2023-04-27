USE S5_cw_mydb;
/*
Собрать дэшборд, в котором содержится информация о максимальной задолженности в каждом банке, 
а также средний размер процентной ставки в каждом банке в зависимости от сегмента и количество
договоров всего всем банкам
*/

SELECT *,
MAX(OSZ) OVER(partition by TB) AS 'максимальной задолженности в каждом банке',
AVG(PROCENT_RATE) OVER(partition by TB, SEGMENT) AS 'средний размер процентной ставки в каждом 
банке в зависимости от сегмента',
COUNT(ID_DOG) OVER() AS 'количество договоров всего всем банкам'
FROM table_examle;


/*
Проранжируем таблицу по убыванию количества ревизий
*/

SELECT *,
ROW_NUMBER() OVER(ORDER BY count_revisions DESC), 
RANK() OVER(ORDER BY count_revisions DESC),
DENSE_RANK() OVER(ORDER BY count_revisions DESC),
NTILE(3) OVER(ORDER BY count_revisions DESC) -- делит на количество строк которое мы задали в скобкахan
FROM table1;

/*
Найти второй отдел во всех банках по количеству ревизий.
*/
WITH cte AS
(
	SELECT *,
    DENSE_RANK() OVER(ORDER BY count_revisions DESC) AS ds 
    FROM table1
)
SELECT * FROM cte
WHERE ds = 2;


SELECT *,
LEAD(Event, 1, 'end') OVER(PARTITION BY id_task ORDER BY date_event),
LEAD(date_event, 1, '2099-01-01') OVER(PARTITION BY id_task ORDER BY date_event)
FROM table2;
