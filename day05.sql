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

SELECT isim, sehir, maas
FROM employees03
WHERE maas > (SELECT AVG(maas) FROM employees03)
ORDER BY maas;

CREATE TABLE greengrocer(
isim varchar(50),
urun_adi varchar(50),
urun_miktar int
)

INSERT INTO greengrocer VALUES ('Ali','Elma',5);
INSERT INTO greengrocer VALUES ('Ayse','Armut',3);
INSERT INTO greengrocer VALUES ('Veli','Elma',2);
INSERT INTO greengrocer VALUES ('Hasan','Uzum',4);
INSERT INTO greengrocer VALUES ('Ali','Armut',2);
INSERT INTO greengrocer VALUES ('Ayse','Elma',3);
INSERT INTO greengrocer VALUES ('Veli','Uzum',5);
INSERT INTO greengrocer VALUES ('Ali','Armut',2);
INSERT INTO greengrocer VALUES ('Veli','Elma',3);
INSERT INTO greengrocer VALUES ('Ayse','Uzum',2);

SELECT * FROM greengrocer;

SELECT isim, SUM(urun_miktar) toplam_kg
FROM greengrocer
GROUP BY isim;

SELECT isim, SUM(urun_miktar) toplam_kg
FROM greengrocer
GROUP BY isim
ORDER BY toplam_kg DESC;

SELECT isim, urun_adi, SUM(urun_miktar) toplam_kg
FROM greengrocer
GROUP BY isim, urun_adi
ORDER BY isim;

SELECT urun_adi, COUNT(DISTINCT(isim))
FROM greengrocer
GROUP BY urun_adi;

SELECT isim, SUM(urun_miktar), COUNT(DISTINCT (urun_adi))
FROM greengrocer
GROUP BY isim;

CREATE TABLE personel(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO personel VALUES (123456789,'Ali Yilmaz', 'Istanbul',5500, 'Honda');
INSERT INTO personel VALUES (234567890,'Veli Sahin', 'Istanbul',4500, 'Toyota');
INSERT INTO personel VALUES (345678901,'Mehmet Ozturk', 'Ankara',3500, 'Honda');
INSERT INTO personel VALUES (456789012,'Mehmet Ozturk', 'Izmir',6000, 'ford');
INSERT INTO personel VALUES (567890123,'Mehmet Ozturk', 'Ankara',7000, 'Tofas');
INSERT INTO personel VALUES (678901245,'Veli Sahin', 'Ankara',4500, 'Ford');
INSERT INTO personel VALUES (123456710,'Hatice Sahin', 'Bursa',4500, 'Honda');

UPDATE personel
SET sirket = 'Ford'
WHERE id = 456789012;

SELECT * FROM personel

SELECT sirket, MIN(maas) AS min_maas
FROM personel
GROUP BY sirket
HAVING MIN(maas) > 4000;









