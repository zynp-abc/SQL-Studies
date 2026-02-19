CREATE TABLE actors01(
id INTEGER PRIMARY KEY,
name VARCHAR(30), 
surname VARCHAR(30),
film VARCHAR(50)
);

SELECT * FROM actors01;

CREATE TABLE actors02(
id INTEGER,
name VARCHAR(30), 
surname VARCHAR(30),
film VARCHAR(50),
CONSTRAINT act_pk PRIMARY KEY(id)
);

SELECT * FROM actors02;

CREATE TABLE company(
job_id integer,
name varchar(30),
company varchar(30),
CONSTRAINT com_pk PRIMARY KEY(job_id,name)
);

SELECT * FROM company;

CREATE TABLE companies(
sirket_id integer, 
sirket varchar(50) PRIMARY KEY,
personel_sayisi integer
);

SELECT * FROM companies;

CREATE TABLE employes(
id integer,
isim varchar(50),
sehir varchar(50),
maas real,
sirket varchar(50),
CONSTRAINT emp_fk FOREIGN KEY(sirket) REFERENCES companies(sirket)
);

SELECT * FROM employes;

CREATE TABLE person(
id int,
name varchar(50),
salary REAL CHECK(salary>5000),
age int CHECK(age>0)
)

INSERT INTO person VALUES(11,'Ali Can',6000,35);
INSERT INTO person VALUES(11,'Ali Can',5500,45);
INSERT INTO person VALUES(13,'Ayse Han',7000,25);

CREATE TABLE worker(
id char(5) PRIMARY KEY,
isim varchar(50) UNIQUE,
maas int NOT NULL,
ise_baslama date
);


CREATE TABLE address(
adres_id char(5),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY(adres_id) REFERENCES worker(id)
); 

SELECT * FROM worker;
SELECT * FROM address;

INSERT INTO worker VALUES('10002','Tom',12000,'2018-04-12');
INSERT INTO worker VALUES('10003',NULL,55000,'2018-04-12');
INSERT INTO worker VALUES('10004','Leonerdo',7700,'2019-05-19');
INSERT INTO worker VALUES('10005','Raphael',33000,'2019-11-09');
INSERT INTO worker VALUES('10006','Fred',55000,'2019-11-09');
INSERT INTO worker VALUES('10007','Wilma',33000,'2020-12-23');

SELECT * FROM worker;

INSERT INTO address VALUES('10002','Taş sok','30. cad.','Konya');
INSERT INTO address VALUES('10003','Ninja sok','30. cad.','Konya');
INSERT INTO address VALUES('10004','Taş sok','50. cad.','Istanbul');
INSERT INTO address VALUES('10005','Taş sok','23. cad.','Antalya');
INSERT INTO address VALUES('10006','Kaya sok','12. cad.','Mersin');
INSERT INTO address VALUES('10007','Taş sok','50. cad.','Mugla');

SELECT * FROM address;
