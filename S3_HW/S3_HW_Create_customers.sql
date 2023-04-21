USE s3_hw;

CREATE TABLE customers(
	cnum INT PRIMARY KEY UNIQUE, 
	cname VARCHAR(45) NOT NULL,
	city VARCHAR(45) NOT NULL,
    rating INT NOT NULL,
    snum INT NOT NULL,
    FOREIGN KEY (snum) REFERENCES salespeople (snum)
);

INSERT INTO customers(cnum, cname, city, rating, snum)
VALUES
(2001, "Hoffman", "London", 100, 1001),
(2002, "Giovanni", "Rome", 200, 1003),
(2003, "Liu", "SanJose", 200, 1002),
(2004, "Grass", "Berlin", 300, 1002),
(2006, "Clemens", "London", 100, 1001),
(2008, "Cisneros", "SanJose", 300, 1007),
(2007, "Pereira", "Rome", 100, 1004);