USE s5_hw;

/*
Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
*/
CREATE TABLE Analysis (
	an_id INT AUTO_INCREMENT PRIMARY KEY,
    an_name VARCHAR(50) NOT NULL,
    an_cost INT NOT NULL,
    an_price INT NOT NULL,
    an_group INT,
    FOREIGN KEY (an_group) REFERENCES Groups_table(gr_id)
);

CREATE TABLE Groups_table (
	gr_id INT AUTO_INCREMENT PRIMARY KEY,
    gr_name VARCHAR(50) NOT NULL,
    gr_temp VARCHAR(50) NOT NULL
);

CREATE TABLE Orders (
	ord_id INT AUTO_INCREMENT PRIMARY KEY,
    ord_datetime DATE NOT NULL,
    ord_an INT,
    FOREIGN KEY (ord_an) REFERENCES Analysis(an_id)
);

INSERT INTO Groups_table(gr_id, gr_name, gr_temp)
VALUES
(1, 'Blood analysis', '20 - 30'),
(2, 'Glucose analysis', '10 - 30'),
(3, 'Fructosamine analysis', '30 - 40'),
(4, 'Total protein analysis', '0 - 20');

INSERT INTO Analysis(an_id, an_name, an_cost, an_price, an_group)
VALUES
(1, 'Ben blood analysis', 1000, 1500, 1),
(2, 'Chloe glucose analysis', 2000, 2500, 2),
(3, 'Kate fructosamine analysis', 3000, 3500, 3),
(4, 'James Lafleur total protein analysis', 4000, 4500, 4),
(5, 'Jack blood analysis', 1000, 1500, 1),
(6, 'Jin fructosamine analysis', 3000, 3500, 3);

INSERT INTO Orders(ord_id, ord_datetime, ord_an)
VALUES
(1, '2020-02-01', 1),
(2, '2020-02-05', 2),
(3, '2020-02-08', 3),
(4, '2020-02-10', 4),
(5, '2020-02-15', 5),
(6, '2020-02-20', 6);

select * from Orders;

SELECT an_name, an_price
FROM Analysis
JOIN Orders
ON ord_id = an_id
WHERE ord_datetime BETWEEN '2020-02-05' 
AND '2020-02-05' + INTERVAL 1 WEEK;
