CREATE TABLE accounts(
hesap_no int UNIQUE,
isim varchar(50),
bakiye real
);

INSERT INTO accounts VALUES (1234, 'Harry Potter', 100000.3);
INSERT INTO accounts VALUES (5678, 'Jack Sparrow', 5000.5);

SELECT * FROM accounts

UPDATE accounts SET bakiye = bakiye - 10000 WHERE hesap_no = 1234;

DROP TABLE accounts

--BEGIN = Transaction ı başlatıyoruz

BEGIN;
CREATE TABLE accounts(
hesap_no int UNIQUE,
isim varchar(50),
bakiye real
);

--COMMIT = Transaction ı onaylamak ve değişiklileri kalıcı hale getirmek için kullanılır

COMMIT;

BEGIN;

INSERT INTO accounts VALUES (1234, 'Harry Potter', 100000.3);
INSERT INTO accounts VALUES (5678, 'Jack Sparrow', 5000.5);

SELECT * FROM accounts

--SAVEPOINT = Kurtarma noktası

SAVEPOINT x;

UPDATE accounts SET bakiye = bakiye - 10000 WHERE hesap_no = 1234;

--UPDATE accounts SET bakiye = bakiye + 10000 WHERE hesap_no = 5678; HATA burası çalışmadı COMMIT çalışmaz

ROLLBACK TO x;
COMMIT;
SELECT * FROM accounts;

DROP TABLE accounts;

--- BAŞARILI SENARYO

BEGIN;

CREATE TABLE accounts(
hesap_no int UNIQUE,
isim varchar(50),
bakiye real
);

COMMIT;

BEGIN;

INSERT INTO accounts VALUES (1234, 'Harry Potter', 100000.3);
INSERT INTO accounts VALUES (5678, 'Jack Sparrow', 5000.5);

SELECT * FROM accounts

SAVEPOINT x;

UPDATE accounts SET bakiye = bakiye - 1000 WHERE hesap_no = 1234
UPDATE accounts SET bakiye = bakiye + 1000 WHERE hesap_no = 5678
COMMIT;

ROLLBACK TO x;

SELECT * FROM accounts;


