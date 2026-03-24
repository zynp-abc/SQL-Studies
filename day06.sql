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