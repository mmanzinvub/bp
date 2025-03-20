INSERT INTO korisnici (ime, prezime, email, password, pozivni_broj, broj_mobitela, spol, datum_rodenja)
VALUES ('Ime1', 'Prezime1', 'email1@example.com', 'password1', 385, 9123456, 0, TO_DATE('01.01.1990', 'DD.MM.YYYY'));

INSERT INTO korisnici (ime, prezime, email, password, pozivni_broj, broj_mobitela, spol, datum_rodenja)
VALUES ('Ime2', 'Prezime2', 'email2@example.com', 'password2', 091, 1234567, 1, TO_DATE('02.01.1990', 'DD.MM.YYYY'));

INSERT INTO korisnici (ime, prezime, email, password, pozivni_broj, broj_mobitela, spol, datum_rodenja)
VALUES ('Ime3', 'Prezime3', 'email3@example.com', 'password3', 095, 1234567, 0, TO_DATE('03.01.1990', 'DD.MM.YYYY'));

INSERT INTO korisnici (ime, prezime, email, password, pozivni_broj, broj_mobitela, spol, datum_rodenja)
VALUES ('Ime4', 'Prezime4', 'email4@example.com', 'password4', 097, 1234567, 1, TO_DATE('04.01.1990', 'DD.MM.YYYY'));

INSERT INTO korisnici (ime, prezime, email, password, pozivni_broj, broj_mobitela, spol, datum_rodenja)
VALUES ('Ime5', 'Prezime5', 'email5@example.com', 'password5', 098, 1234567, 0, TO_DATE('05.01.1990', 'DD.MM.YYYY'));

INSERT INTO korisnici (ime, prezime, email, password, pozivni_broj, broj_mobitela, spol, datum_rodenja)
VALUES ('Ime6', 'Prezime6', 'email6@example.com', 'password6', 099, 1234567, 1, TO_DATE('06.01.1990', 'DD.MM.YYYY'));

INSERT INTO korisnici (ime, prezime, email, password, pozivni_broj, broj_mobitela, spol, datum_rodenja)
VALUES ('Ime7', 'Prezime7', 'email7@example.com', 'password7', 095, 1234560, 0, TO_DATE('07.01.1990', 'DD.MM.YYYY'));

INSERT INTO korisnici (ime, prezime, email, password, pozivni_broj, broj_mobitela, spol, datum_rodenja)
VALUES ('Ime8', 'Prezime8', 'email8@example.com', 'password8', 385, 9123463, 1, TO_DATE('08.01.1990', 'DD.MM.YYYY'));

INSERT INTO korisnici (ime, prezime, email, password, pozivni_broj, broj_mobitela, spol, datum_rodenja)
VALUES ('Ime9', 'Prezime9', 'email9@example.com', 'password9', 385, 9123464, 0, TO_DATE('09.01.1990', 'DD.MM.YYYY'));

INSERT INTO korisnici (ime, prezime, email, password, pozivni_broj, broj_mobitela, spol, datum_rodenja)
VALUES ('Ime10', 'Prezime10', 'email10@example.com', 'password10', 385, 9123465, 1, TO_DATE('10.01.1990', 'DD.MM.YYYY'));


INSERT INTO adrese (idKorisnika, adresa, kucni_broj, dodatni_broj, idMjesto, idZupanija)
VALUES (1, 'Adresa1', 10, 'A', 1, 1);

INSERT INTO adrese (idKorisnika, adresa, kucni_broj, dodatni_broj, idMjesto, idZupanija)
VALUES (2, 'Adresa2', 20, 'B', 2, 2);

INSERT INTO adrese (idKorisnika, adresa, kucni_broj, dodatni_broj, idMjesto, idZupanija)
VALUES (3, 'Adresa3', 30, 'C', 3, 3);

INSERT INTO adrese (idKorisnika, adresa, kucni_broj, idMjesto, idZupanija)
VALUES (4, 'Adresa4', 40, 4, 4);

INSERT INTO adrese (idKorisnika, adresa, kucni_broj,  idMjesto, idZupanija)
VALUES (5, 'Adresa5', 50, 5, 5);

INSERT INTO adrese (idKorisnika, adresa, kucni_broj, dodatni_broj, idMjesto, idZupanija)
VALUES (6, 'Adresa6', 60, 'F', 6, 6);

INSERT INTO adrese (idKorisnika, adresa, kucni_broj, dodatni_broj, idMjesto, idZupanija)
VALUES (7, 'Adresa7', 70, 'G', 7, 7);

INSERT INTO adrese (idKorisnika, adresa, kucni_broj, dodatni_broj, idMjesto, idZupanija)
VALUES (8, 'Adresa8', 80, 'H', 8, 8);

INSERT INTO adrese (idKorisnika, adresa, kucni_broj, dodatni_broj, idMjesto, idZupanija)
VALUES (9, 'Adresa9', 80, 'H', 9, 9);

INSERT INTO adrese (idKorisnika, adresa, kucni_broj, dodatni_broj, idMjesto, idZupanija)
VALUES (10, 'Adresa10', 100, 'J', 10, 10);


INSERT INTO trivie (idKorisnika, ljubimci, boja, film, program)
VALUES (1, 1, 'Crvena', 'Film1', 1);

INSERT INTO trivie (idKorisnika, ljubimci, boja, film, program)
VALUES (2, 2, 'Plava', 'Film2', 2);

INSERT INTO trivie (idKorisnika, ljubimci, boja, film, program)
VALUES (3, 3, 'Zelena', 'Film3', 3);

INSERT INTO trivie (idKorisnika, ljubimci, boja, film, program)
VALUES (4, 4, 'Žuta', 'Film4', 4);

INSERT INTO trivie (idKorisnika, ljubimci, boja, film, program)
VALUES (5, 5, 'Crna', 'Film5', 1);

INSERT INTO trivie (idKorisnika, ljubimci, boja, film, program)
VALUES (6, 6, 'Bijela', 'Film6', 2);

INSERT INTO trivie (idKorisnika, ljubimci, boja, film, program)
VALUES (7, 7, 'Siva', 'Film7', 3);

INSERT INTO trivie (idKorisnika, ljubimci, boja, film, program)
VALUES (8, 8, 'Bijela', 'Film8', 4);

INSERT INTO trivie (idKorisnika, ljubimci, boja, film, program)
VALUES (9, 9, 'Crna', 'Film9', 1);

INSERT INTO trivie (idKorisnika, ljubimci, boja, film, program)
VALUES (10, 10, 'Zlatna', 'Film10', 2);