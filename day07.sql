SELECT * 
FROM words
WHERE word ~* 'h[a-k]t';

SELECT * 
FROM words
WHERE word ~* '[mi]';

SELECT * 
FROM words
WHERE word ~* '^a';

SELECT * 
FROM words
WHERE word ~* 'm$';

SELECT * 
FROM words
WHERE word ~* '^[as]';

SELECT * 
FROM words
WHERE word ~* '^y(.*)f$';  --parantezi kullanmayabiliriz '^y.*f$'

SELECT * 
FROM words
WHERE word ~* 'y.f$';

CREATE TABLE teachers(
id int,
firstname varchar(50),
lastname varchar (50),
age int,
city varchar(20),
course_name varchar(20),
salary real
);

INSERT INTO teachers VALUES (111, 'AhmeT  ', '  Han',35,'Istanbul','SpringMVC',5000);
INSERT INTO teachers VALUES (112, 'Mehmet  ', 'Ran  ',33,'Van','HTMl',4000);
INSERT INTO teachers VALUES (113, ' Bilal  ', 'Fan ',34,'Bursa','SQL',3000);
INSERT INTO teachers VALUES (114, 'Celal',   'San',30,'Bursa','Java',3000);
INSERT INTO teachers VALUES (115, 'Deniz', '  Can',30,'Istanbul','SQL',3500);
INSERT INTO teachers VALUES (116, 'ekreM', 'Demir',36,'Istanbul','Java',4000.5);
INSERT INTO teachers VALUES (117, 'Fatma', 'Celik',38,'Van','SpringBOOT',5550);
INSERT INTO teachers VALUES (118, 'Hakan', 'Cetin',44,'Izmir','Java',3999.5);
INSERT INTO teachers VALUES (119, 'mert', 'Cetin',32,'Izmir','HTML',2999.5);
INSERT INTO teachers VALUES (120, 'Selma', 'Celik',40,'Ankara','SpringBOOT',.5550);
INSERT INTO teachers VALUES (121, 'fatiH', 'Can',32,'Ankara','HTML',2550.22);
INSERT INTO teachers VALUES (122, 'Nihat', 'Can',32,'Izmir','CSS',3000.5);
INSERT INTO teachers VALUES (123, 'Hasan ', 'Keskin',32,'Istanbul','S.Security',3000.5);
INSERT INTO teachers VALUES (124, 'Nilay', 'temel',32,'Izmir','CSS',2999.5);
INSERT INTO teachers VALUES (125, 'Zeynep', 'Abacı',40,'Mersin','SQL',7000);

SELECT * FROM teachers

SELECT UPPER (firstname), LENGTH(firstname), LOWER(lastname), LENGTH(lastname)
FROM teachers

UPDATE teachers
SET firstname = TRIM (firstname), lastname = TRIM(lastname)

SELECT INITCAP(firstname)
FROM teachers

SELECT * FROM teachers

UPDATE teachers
SET  firstname = REPLACE (firstname, 'Celal', 'Cemal')

SELECT * FROM employees03

SELECT SUBSTRING ('sqlders', 1, 3) -- 1 den başla 3 tane al

UPDATE employees03
SET sehir = SUBSTRING(sehir, 1, LENGTH(sehir) - 7)
WHERE isyeri = 'Vakko'

SELECT word, SUBSTRING(word,1,2)
FROM words 











