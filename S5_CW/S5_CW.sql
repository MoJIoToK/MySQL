USE s5_cw;

WITH RECURSIVE sequence (n) AS
(
  SELECT 0
  UNION ALL
  SELECT n + 1 
  FROM sequence 
  WHERE n + 1 <= 10
)
SELECT n
FROM sequence;

WITH RECURSIVE cte AS
(
SELECT 1 AS a
UNION ALL
SELECT a + 1 FROM cte
WHERE a < 10
)
SELECT * FROM cte;
