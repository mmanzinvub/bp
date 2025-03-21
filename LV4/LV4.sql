DROP TABLE trivie;
DROP TABLE adrese;
DROP TABLE korisnici;

CREATE TABLE korisnici (
	id number(10,0) GENERATED BY DEFAULT AS IDENTITY NOT NULL UNIQUE,
	ime varchar2(20) NOT NULL,
	prezime varchar2(40) NOT NULL,
	email varchar2(30) NOT NULL UNIQUE,
	password varchar2(20) NOT NULL,
	pozivni_broj number(10) NOT NULL,
	broj_mobitela number(10) NOT NULL,
	spol number(10) NOT NULL,
	datum_rodenja date NOT NULL,
    constraint unique_pozmob unique (pozivni_broj, broj_mobitela),
    constraint spol_ck01 check ( spol between 0 and 1)
);

CREATE TABLE adrese (
	id number(10,0) GENERATED BY DEFAULT AS IDENTITY NOT NULL UNIQUE,
	idKorisnika number(10) NOT NULL,
	adresa varchar2(60) NOT NULL,
	kucni_broj number(10) NOT NULL,
	dodatni_broj varchar2(10),
	idMjesto number(10) NOT NULL,
	idZupanija number(10) NOT NULL
);

CREATE TABLE trivie (
	id number(10,0) GENERATED BY DEFAULT AS IDENTITY NOT NULL UNIQUE,
	idKorisnika number(10) NOT NULL,
	ljubimci number(10) NOT NULL,
	boja varchar2(7) NOT NULL,
	film varchar2(200) NOT NULL,
	program number(10) NOT NULL,
    constraint program_ck1 check ( program between 1 and 4 )
);

ALTER TABLE adrese ADD CONSTRAINT adrese_fk1 FOREIGN KEY (idKorisnika) REFERENCES korisnici(id);
/*FK na common. tablice insufficient privileges*/
ALTER TABLE adrese ADD CONSTRAINT adrese_fk2 FOREIGN KEY (idMjesto) REFERENCES common.naselja(id);
ALTER TABLE adrese ADD CONSTRAINT adrese_fk3 FOREIGN KEY (idZupanija) REFERENCES common.zupanije(id);
ALTER TABLE trivie ADD CONSTRAINT trivie_fk1 FOREIGN KEY (idKorisnika) REFERENCES korisnici(id);