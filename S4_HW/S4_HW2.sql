USE s4_hw;

create table test_a (id INT, test varchar(10));
create table test_b (id INT);

insert into test_a(id, test) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);

SELECT * FROM test_a;
SELECT * FROM test_b;

SELECT * 
FROM test_a
LEFT JOIN test_b
USING(id)
WHERE test_b.id IS NULL;
