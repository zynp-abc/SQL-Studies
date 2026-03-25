SELECT salary,city FROM developers WHERE prog_lang = 'Java'
UNION
SELECT maas,sehir FROM employees03 WHERE isyeri = 'Vakko'

SELECT city,salary FROM developers WHERE id = 8
UNION
SELECT city,number FROM contact_info WHERE address_id = 8

SELECT city FROM developers
INTERSECT
SELECT sehir FROM employees03

SELECT city FROM developers WHERE prog_lang = 'Java'
INTERSECT
SELECT sehir FROM employees03 WHERE maas > 1000

SELECT city FROM developers
EXCEPT
SELECT sehir FROM employees03

CREATE TABLE companies02(
sirket_id int,
sirket_isim varchar(20)
);

INSERT INTO companies02 VALUES(100, 'IBM');
INSERT INTO companies02 VALUES(101, 'GOOGLE');
INSERT INTO companies02 VALUES(102, 'MICROSOFT');
INSERT INTO companies02 VALUES(103, 'APPLE');

CREATE TABLE orders(
siparis_id int,
sirket_id int,
siparis_tarihi date
);

INSERT INTO orders VALUES(11, 101, '2023-02-17');
INSERT INTO orders VALUES(22, 102, '2023-02-18');
INSERT INTO orders VALUES(33, 103, '2023-01-19');
INSERT INTO orders VALUES(44, 104, '2023-01-20');
INSERT INTO orders VALUES(55, 105, '2023-12-21');

SELECT * FROM orders
SELECT * FROM companies02

SELECT companies02.sirket_id, sirket_isim, siparis_id, siparis_tarihi
FROM companies02
INNER JOIN orders 
ON companies02.sirket_id = orders.sirket_id;

SELECT companies02.sirket_id, siparis_tarihi, sirket_isim, siparis_id
FROM  companies02
LEFT JOIN orders 
ON orders.sirket_id = companies02.sirket_id

SELECT orders.sirket_id, siparis_tarihi, sirket_isim, siparis_id
FROM companies02
RIGHT JOIN orders 
ON orders.sirket_id = companies02.sirket_id

SELECT orders.sirket_id, siparis_tarihi, sirket_isim, siparis_id
FROM orders
LEFT JOIN companies02 
ON orders.sirket_id = companies02.sirket_id

SELECT companies02.sirket_id, sirket_isim, orders.sirket_id, siparis_id, siparis_tarihi
FROM companies02
FULL JOIN orders 
ON orders.sirket_id = companies02.sirket_id

--VEYA

SELECT *
FROM companies02
FULL JOIN orders 
ON orders.sirket_id = companies02.sirket_id

CREATE TABLE staff (
id int,
isim varchar(50),
title varchar(60),
yonetici_id int
);

INSERT INTO staff VALUES (1, 'Ali Can','SDET', 2);
INSERT INTO staff VALUES (2, 'Veli Cem','QA', 3);
INSERT INTO staff VALUES (3, 'Ayse Gul','QA Lead', 4);
INSERT INTO staff VALUES (4, 'Zeynep Asya','CEO', null);

SELECT p.isim AS personel, m.isim AS yonetici
FROM staff AS p INNER JOIN staff AS m
ON p.yonetici_id = m.id

SELECT * FROM developers









