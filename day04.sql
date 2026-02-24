SELECT * 
FROM employees02 
WHERE maas=(SELECT MAX(maas) FROM employees02);

SELECT MAX(maas) 
FROM employees02 
WHERE maas<(SELECT MAX(maas) FROM employees02)

SELECT * FROM employees02
WHERE maas=(SELECT MAX(maas) FROM employees02) OR 
      maas=(SELECT MIN(maas) FROM employees02);

SELECT marka_id,calisan_sayisi 
FROM brands
WHERE marka_isim IN 
(SELECT isyeri FROM employees02 WHERE sehir='Ankara');

SELECT * 
FROM employees02
WHERE isyeri IN(SELECT marka_isim FROM brands WHERE marka_id>101)

SELECT isim,isyeri,maas 
FROM employees02
WHERE isyeri IN (SELECT marka_isim FROM  brands WHERE calisan_sayisi>15000)

SELECT marka_id,marka_isim,
(SELECT COUNT(DISTINCT(sehir)) FROM employees02 WHERE isyeri = marka_isim) 
AS sehir_sayisi
FROM brands;

SELECT marka_isim,calisan_sayisi,
(SELECT MAX(maas) FROM employees02 WHERE isyeri=marka_isim),
(SELECT MIN(maas) FROM employees02 WHERE isyeri=marka_isim)
FROM brands;

CREATE TABLE march(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO march VALUES (10,'Mark','Honda');
INSERT INTO march VALUES (20,'Jhon','Toyota');
INSERT INTO march VALUES (30,'Amy','Ford');
INSERT INTO march VALUES (20,'Mark','Toyota');
INSERT INTO march VALUES (10,'Adam','Honda');
INSERT INTO march VALUES (40,'Jhon','Hyundai');
INSERT INTO march VALUES (20,'Eddie','Toyota');

CREATE TABLE  april(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO april VALUES (10,'Hasan','Honda');
INSERT INTO april VALUES (10,'Kemal','Honda');
INSERT INTO april VALUES (20,'Ayse','Toyota');
INSERT INTO april VALUES (50,'Yasar','Volvo');
INSERT INTO april VALUES (20,'Mine','Toyota');


SELECT * FROM march;
SELECT * FROM april;

SELECT * 
FROM april
WHERE EXISTS (SELECT * FROM march WHERE urun_isim = 'Toyota');

SELECT * 
FROM april
WHERE EXISTS (SELECT * FROM march WHERE urun_isim = 'Volvo')

SELECT urun_id,musteri_isim 
FROM march AS m
WHERE EXISTS (SELECT urun_isim FROM april AS a WHERE a.urun_isim = m.urun_isim)

SELECT urun_id,musteri_isim 
FROM march 
WHERE EXISTS (SELECT urun_isim FROM april WHERE april.urun_isim = march.urun_isim)

SELECT musteri_isim,urun_isim
FROM april
WHERE EXISTS (SELECT * FROM march WHERE march.urun_isim = april.urun_isim);

SELECT musteri_isim, urun_isim
FROM march
WHERE NOT EXISTS (SELECT urun_isim FROM april WHERE april.urun_isim = march.urun_isim);


CREATE TABLE employees03(
id int UNIQUE,
isim varchar(50),
sehir varchar(50),
maas int,
isyeri varchar
);

INSERT INTO employees03 VALUES(123456789,'Ali Seker','Istanbul',2500,'Vakko');
INSERT INTO employees03 VALUES(234567890,'Ayse Gul','Istanbul',1500,'LCWakiki');
INSERT INTO employees03 VALUES(345678901,null,'Ankar',3000,'Vakko');
INSERT INTO employees03 VALUES(456789012,'Veli Yilmaz','Izmir',1000,'Pierre Cardin');
INSERT INTO employees03 VALUES(567890123,'Veli Yilmaz','Ankara',7000,'Adidas');
INSERT INTO employees03 VALUES(678901234,'Ayse Gul','Ankara',1500,'Pierre Cardin');
INSERT INTO employees03 VALUES(789012345,'Fatma Yasa',null,2500,'Vakko');
INSERT INTO employees03 VALUES(890123456,null,'Bursa',2500,'Vakko');
INSERT INTO employees03 VALUES(901234567,'Ali Han',null,2500,'Vakko');

SELECT * FROM employees03;

UPDATE employees03
SET isyeri = 'Trendyol'
WHERE id = 123456789;

UPDATE employees03
SET sehir = 'Bursa', isim = 'Veli Yildirim'
WHERE id = 567890123

UPDATE brands
SET marka_id = marka_id * 2
WHERE marka_id = 102 OR marka_id > 102  --marka_id>=102

SELECT * FROM brands;

UPDATE brands
SET calisan_sayisi = calisan_sayisi + marka_id;

UPDATE employees03
SET isyeri = (SELECT isyeri FROM employees03 WHERE id = 567890123)
WHERE  isim = 'Ali Seker';

UPDATE employees03
SET isyeri = (SELECT marka_isim FROM brands WHERE marka_id = 100)
WHERE maas = 1500;

--|| operatörü SQL de dizeleri birleştirmek için kullanılır. Java'daki (+) operatörü ile benzer işler görür.

UPDATE employees03
SET sehir = sehir || ' Subesi'
WHERE isyeri = 'Vakko'

UPDATE employees03
SET sehir = CONCAT(sehir,' Subesi')
WHERE isyeri = 'Vakko'

SELECT * FROM employees03 WHERE isim IS NULL

SELECT * FROM employees03 WHERE isim IS NOT NULL

UPDATE employees03
SET isim = 'isimsiz'
WHERE isim IS NULL
