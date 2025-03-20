select * from STUDENTI;
select * from NASTAVNICI;
select * from PREDMETI;
select * from UPISI;

INSERT INTO STUDENTI (JMBAG, IME, PREZIME, EMAIL, PASSWORD, SPOL) VALUES ('8400', 'John', 'Doe', 'jdoe@gmail.com','12345','1');
INSERT INTO STUDENTI (JMBAG, IME, PREZIME, EMAIL, PASSWORD, SPOL) VALUES ('8401', 'John', 'Doe', 'jdoe1@gmail.com','12345','0');
INSERT INTO STUDENTI (JMBAG, IME, PREZIME, EMAIL, PASSWORD, SPOL) VALUES ('8402', 'John', 'Doe', 'jdoe2@gmail.com','12345','1');
INSERT INTO STUDENTI (JMBAG, IME, PREZIME, EMAIL, PASSWORD, SPOL) VALUES ('8403', 'John', 'Doe', 'jdoe3@gmail.com','12345','0');
INSERT INTO STUDENTI (JMBAG, IME, PREZIME, EMAIL, PASSWORD, SPOL) VALUES ('8404', 'John', 'Doe', 'jdoe4@gmail.com','12345','1');
INSERT INTO STUDENTI (JMBAG, IME, PREZIME, EMAIL, PASSWORD, SPOL) VALUES ('8405', 'John', 'Doe', 'jdoe5@gmail.com','12345','0');
INSERT INTO STUDENTI (JMBAG, IME, PREZIME, EMAIL, PASSWORD, SPOL) VALUES ('8406', 'John', 'Doe', 'jdoe6@gmail.com','12345','1');
INSERT INTO STUDENTI (JMBAG, IME, PREZIME, EMAIL, PASSWORD, SPOL) VALUES ('8407', 'John', 'Doe', 'jdoe7@gmail.com','12345','0');
INSERT INTO STUDENTI (JMBAG, IME, PREZIME, EMAIL, PASSWORD, SPOL) VALUES ('8408', 'John', 'Doe', 'jdoe8@gmail.com','12345','1');
INSERT INTO STUDENTI (JMBAG, IME, PREZIME, EMAIL, PASSWORD, SPOL) VALUES ('8409', 'John', 'Doe', 'jdoe9@gmail.com','12345','0');

INSERT INTO NASTAVNICI(ime, prezime, email, password, spol) VALUES ('Jane', 'Doe', 'janed@gmail.com', '54321', '1');
INSERT INTO NASTAVNICI(ime, prezime, email, password, spol) VALUES ('Jane', 'Doe', 'janed1@gmail.com', '54321', '0');
INSERT INTO NASTAVNICI(ime, prezime, email, password, spol) VALUES ('Jane', 'Doe', 'janed2@gmail.com', '54321', '1');
INSERT INTO NASTAVNICI(ime, prezime, email, password, spol) VALUES ('Jane', 'Doe', 'janed3@gmail.com', '54321', '0');
INSERT INTO NASTAVNICI(ime, prezime, email, password, spol) VALUES ('Jane', 'Doe', 'janed4@gmail.com', '54321', '1');

INSERT INTO PREDMETI (IDNASTAVNIKA, SIFRA, NAZIV, ECTS, SEMESTAR) VALUES ('1', '0604', '.NET', '5', '5');
INSERT INTO PREDMETI (IDNASTAVNIKA, SIFRA, NAZIV, ECTS, SEMESTAR) VALUES ('2', '0610', 'Web2', '4', '4');
INSERT INTO PREDMETI (IDNASTAVNIKA, SIFRA, NAZIV, ECTS, SEMESTAR) VALUES ('3', '0612', 'Java', '6', '4');

INSERT INTO UPISI (IDPREDMETA, IDSTUDENTA, DATUM, OCJENA) VALUES ('1', '1', TO_DATE('1.10.2024', 'DD.MM.YYYY'), '4');
INSERT INTO UPISI (IDPREDMETA, IDSTUDENTA, DATUM, OCJENA) VALUES ('2', '2', TO_DATE('1.10.2024', 'DD.MM.YYYY'), '3');
INSERT INTO UPISI (IDPREDMETA, IDSTUDENTA, DATUM, OCJENA) VALUES ('3', '5', TO_DATE('1.10.2024', 'DD.MM.YYYY'), '2');