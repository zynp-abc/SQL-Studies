SELECT * FROM person

DROP TABLE person

CREATE TABLE person(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);

INSERT INTO person VALUES (123456789,'Ali','Can','Istanbul');
INSERT INTO person VALUES (234567890,'Veli','Cem','Ankara');
INSERT INTO person VALUES (345678901,'Mine','Bulut','Ankara');
INSERT INTO person VALUES (456789012,'Mahmut','Bulut','Istanbul');
INSERT INTO person VALUES (344678901,'Mine','Yasa','Ankara');
INSERT INTO person VALUES (345678901,'Veli','Yilmaz','Istanbul');
INSERT INTO person VALUES (256789018,'Samet','Bulut','Izmir');
INSERT INTO person VALUES (256789013,'Veli','Cem','Bursa');
INSERT INTO person VALUES (256789010,'Samet','Bulut','Ankara');

SELECT * 
FROM person
ORDER BY adres ASC;   --ASC nin yazma zorunluluğu yok

SELECT * 
FROM person
ORDER BY adres,isim;

SELECT *
FROM person
ORDER BY soyisim DESC

SELECT *
FROM person
WHERE soyisim = 'Bulut'
ORDER BY isim DESC

SELECT *
FROM person
WHERE soyisim = 'Bulut'
ORDER BY 2 DESC    --index e göre yaptık ama tavsiye edilmez

SELECT *
FROM person
ORDER BY isim DESC, soyisim ASC;

SELECT isim,soyisim
FROM person
ORDER BY LENGTH(soyisim);

SELECT isim,soyisim, LENGTH(soyisim) AS karakter_sayisi
FROM person
ORDER BY LENGTH(soyisim);

SELECT isim,soyisim, LENGTH(soyisim) AS karakter_sayisi
FROM person
ORDER BY karakter_sayisi;  --ORDER BY takma isim kabul eder

SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim
FROM person
ORDER BY LENGTH (isim) + LENGTH(soyisim)

SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim, LENGTH(CONCAT(isim,soyisim)) 
AS karakter_sayisi
FROM person
ORDER BY LENGTH(CONCAT(isim,soyisim));

SELECT AVG(maas) FROM employees03







