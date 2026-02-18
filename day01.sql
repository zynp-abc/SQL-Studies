SELECT * FROM students

CREATE TABLE grades AS SELECT name, grade FROM students;

DROP TABLE grades;

INSERT INTO students VALUES (1001,'Ali Can',85.5,'2023-12-15');

SELECT * FROM students;

INSERT INTO students VALUES (1002,'Veli Han',80.2,now());

SELECT * FROM students;

SELECT name,grade FROM students;

INSERT INTO students(name,grade) VALUES ('Ayse Kaya',97.4)

SELECT * FROM students;

CREATE TABLE IF NOT EXISTS actors(
id INTEGER,
name VARCHAR(30),
email VARCHAR(50)
)

SELECT * FROM actors;

INSERT INTO actors VALUES (1001,'Kemal Sunal','aktor@gmail.com');
INSERT INTO actors VALUES (1002,'Sener Sen','aktor@gmail.com');
INSERT INTO actors(name) VALUES ('Turkan Soray');

SELECT * FROM actors;

CREATE TABLE programmers(id SERIAL,
name VARCHAR(30),
email VARCHAR(50) UNIQUE,
salary REAL,
prog_lang VARCHAR(20)
);

INSERT INTO programmers(name,email,salary,prog_lang) VALUES('Tom','tom@gmail.com',5000,'Java');
INSERT INTO programmers(name,email,salary,prog_lang) VALUES('Jerry','jerry@gmail.com',4000,'SQL');
INSERT INTO programmers(email,salary,prog_lang) VALUES('python@gmail.com',4000,'Python')

SELECT * FROM programmers;













