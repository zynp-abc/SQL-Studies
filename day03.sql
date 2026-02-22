SELECT * FROM worker WHERE maas > 33000;

SELECT * FROM worker WHERE isim='Wilma';

SELECT * FROM address WHERE sehir = 'Konya' AND adres_id = '10002';

CREATE TABLE students01(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO students01 VALUES (122,'Kerem Can','Fatma',75),
(123,'Ali Can','Hasan',75),
(124,'Veli Han','Ayse',85),
(125,'Kemal Tan','Huseyın',85),
(126,'Mustafa Ak','Can',95),
(127,'Kerem Can','Ali',99),
(128,'Mehmet Ran','Murat',45);

SELECT * FROM students01;

DELETE FROM students01 WHERE isim = 'Kemal Tan';

DELETE FROM students01 WHERE id = 122;

DELETE FROM students;

SELECT * FROM students;

CREATE TABLE doctors(
id SERIAL,
name VARCHAR(30) NOT NULL,
salary REAL,
email VARCHAR(50) UNIQUE
);

INSERT INTO doctors(name,salary,email) VALUES ('Dr. Gregory House',6000,'gregory@mail.com');
INSERT INTO doctors(name,salary,email) VALUES ('',6000,'doctor@mail.com');
INSERT INTO doctors(name,salary,email) VALUES ('Dr. Tom Cruise',9000,'tom@mail.com');
INSERT INTO doctors(name,salary,email) VALUES ('Dr.Brad Pit',7000,'bred@mail.com');
INSERT INTO doctors(name,salary,email) VALUES ('Dr. Zeynep Asya',5000,'asya@mail.com');

SELECT * FROM doctors;

TRUNCATE TABLE doctors;

SELECT * FROM worker;
SELECT * FROM address;

DELETE FROM address WHERE adres_id='10002';
DELETE FROM worker WHERE id='10002';

CREATE TABLE students03(
id int PRIMARY KEY,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO students03 VALUES
(122,'Kerem Can','Fatma',75),
(123,'Ali Can','Hasan',85),
(124,'Veli Han','Ayse',75),
(125,'Kemal Tan','Can',95),
(126,'Ahmet Ran','Ali',89);


CREATE TABLE grades03(
talebe_id int,
ders_adi VARCHAR(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES students03(id) ON DELETE CASCADE
);

INSERT INTO grades03 VALUES
('122','kimya',75),
('123','fizik',65),
('124','tarih',90),
('125','matematik',95),
('126','matematik',55);


SELECT * FROM students03;
SELECT * FROM grades03;

DELETE FROM grades03 WHERE talebe_id='122';

DELETE FROM students03 CASCADE;

CREATE TABLE customers(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
)

INSERT INTO customers VALUES (10,'Mark','Orange');
INSERT INTO customers VALUES (10,'Mark','Orange');
INSERT INTO customers VALUES (20,'Jhon','Apple');
INSERT INTO customers VALUES (30,'Amy','Palm');
INSERT INTO customers VALUES (20,'Mark','Apple');
INSERT INTO customers VALUES (10,'Adem','Orange');
INSERT INTO customers VALUES (40,'Jhon','Apricot');
INSERT INTO customers VALUES (20,'Eddie','Apple');

-- 1. Yol
SELECT * FROM customers WHERE urun_isim= 'Orange' OR urun_isim='Palm' OR urun_isim='Apricot';

-- 2. Yol
SELECT * FROM customers 
WHERE urun_isim IN ('Orange','Palm','Apricot');

SELECT * FROM customers 
WHERE urun_isim NOT IN ('Orange','Palm','Apricot');


SELECT * 
FROM customers
WHERE urun_id BETWEEN 20 AND 30;

SELECT * 
FROM customers
WHERE urun_id  NOT BETWEEN 20 AND 30;

CREATE TABLE brands(
marka_id int,
marka_isim varchar(20),
calisan_sayisi int
);

INSERT INTO brands VALUES(100,'Vakko',12000);
INSERT INTO brands VALUES(101,'Pierre Cardin',18000);
INSERT INTO brands VALUES(102,'Adidas',10000);
INSERT INTO brands VALUES(103,'LCWakiki',21000);

CREATE TABLE employees02(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
isyeri  varchar(20)
);

INSERT INTO employees02 VALUES(123456789,'Ali Seker','Istanbul',2500,'Vakko');
INSERT INTO employees02 VALUES(234567890,'Ayse Gul','Istanbul',1500,'LCWakiki');
INSERT INTO employees02 VALUES(345678912,'Veli Yilmaz','Ankara',3000,'Vakko');
INSERT INTO employees02 VALUES(456789123,'Veli Yilmaz','Izmir',1000,'Pierre Cardin');
INSERT INTO employees02 VALUES(567891234,'Veli Yilmaz','Ankara',70000,'Adidas');
INSERT INTO employees02 VALUES(678912345,'Ayse Gul','Ankara',1500,'Pierre Cardin');
INSERT INTO employees02 VALUES(789123456,'Ayse Yasa','Bursa',2500,'Vakko');

SELECT * FROM brands;
SELECT * FROM employees02;

SELECT MAX(maas) FROM employees02; 
SELECT MIN(maas) FROM employees02;
SELECT SUM(maas) FROM employees02;
SELECT AVG(maas) FROM employees02;
SELECT ROUND(AVG(maas),2) FROM employees02;
SELECT COUNT(*) FROM employees02;
SELECT COUNT(id) FROM employees02;
SELECT COUNT(*) FROM employees02 WHERE maas=2500

CREATE TABLE workers(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);

INSERT INTO workers VALUES(123456789,'Ali Can','Istanbul');
INSERT INTO workers VALUES(234567890,'Veli Cem','Ankara');
INSERT INTO workers VALUES(345678901,'Mine Bulut','Izmir');

SELECT * FROM workers;

SELECT calisan_id AS id FROM workers;
SELECT calisan_isim isim FROM workers;
SELECT * FROM workers AS w;

-- 1. Yol

SELECT marka_isim FROM brands WHERE marka_id = 100;
SELECT * FROM employees02 WHERE isyeri = 'Vakko';

-- 2. Yol

SELECT * 
FROM employees02 
WHERE isyeri = (SELECT marka_isim FROM brands WHERE marka_id = 100);
