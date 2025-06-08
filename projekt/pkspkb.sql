DROP PACKAGE DOHVATI;
DROP PACKAGE ROUTER;

--pks
create PACKAGE DOHVATI AS
    e_iznimka exception;
    PRAGMA EXCEPTION_INIT(e_iznimka, -20001);

    procedure p_test(l_obj in out JSON_OBJECT_T);
    procedure p_login(l_obj in out JSON_OBJECT_T);
    procedure p_zupanije(l_obj in out JSON_OBJECT_T);

    procedure p_cameras(l_obj in out JSON_OBJECT_T);

END DOHVATI;
/

--pkb
create PACKAGE BODY DOHVATI AS

    -------------------------------------------------------
--p_test
    procedure p_test(l_obj in out JSON_OBJECT_T) AS
        l_string varchar2(4000);
    BEGIN
        l_string := l_obj.TO_STRING;
        common.p_logiraj('tu sam', 'evo ga tu je');
        l_obj.put('pozdrav', 'Hello World!');
        common.p_logiraj('tu sam', 'evo ga tu je 2');
    END p_test;
------------------------------------------------------------
--p_login
    procedure p_login(l_obj in out JSON_OBJECT_T) AS
        l_string varchar2(4000);
        l_username    common.korisnici.email%type;
        l_password    common.korisnici.password%type;
        l_id          common.korisnici.id%type;
        l_record      VARCHAR2(4000);
        l_out         json_array_t := json_array_t('[]');
    BEGIN
        l_string := l_obj.TO_STRING;
        l_username := JSON_VALUE(l_string, '$.username' RETURNING VARCHAR2);
        l_password := JSON_VALUE(l_string, '$.password' RETURNING VARCHAR2);

        IF (l_username IS NULL OR l_password is NULL) THEN
            l_obj.put('h_message', 'Molimo unesite korisničko ime i zaporku');
            l_obj.put('h_errcod', 101);
            RAISE e_iznimka;
        ELSE
            SELECT
                COUNT(1)
            INTO
                l_id
            FROM
                common.korisnici
            WHERE
                email = l_username AND
                password = l_password;


            IF l_id = 0 THEN
                l_obj.put('h_message', 'Nepoznato korisničko ime ili zaporka');
                l_obj.put('h_errcode', 96);
                RAISE e_iznimka;
            END IF;

            IF l_id > 1 THEN
                l_obj.put('h_message', 'Molimo javite se u Informatiku');
                l_obj.put('h_errcode', 42);
                RAISE e_iznimka;
            END IF;

            SELECT
                JSON_OBJECT(
                        'ID' VALUE kor.id,
                        'ime' VALUE kor.ime,
                        'prezime' VALUE kor.prezime,
                        'OIB' VALUE kor.oib, 'email' VALUE kor.email,
                        'spol' VALUE kor.spol,
                        'ovlasti' VALUE kor.ovlasti)
            INTO
                l_record
            FROM
                common.korisnici kor
            where
                email = l_username AND
                password = l_password;


            l_out.append(json_object_t(l_record));
            l_obj.put('data', l_out);
        END IF;
    EXCEPTION
        when e_iznimka then
            raise;
        when OTHERS THEN
            common.p_errlog('p_main', dbms_utility.format_error_backtrace, sqlcode, sqlerrm, l_string);
            l_obj.put('h_message', 'Greška u obradi podataka');
            l_obj.put('h_errcode', 91);
            raise;
    END p_login;
---------------------------------------------------------
--p_zupanije
    procedure p_zupanije(l_obj in out JSON_OBJECT_T) AS
        l_string varchar2(4000);
        l_out    json_array_t := json_array_t('[]');
        l_slova       varchar2(20) := 'SA';
    BEGIN
        l_string := l_obj.to_string;
        --l_slova := JSON_VALUE(l_string, '$.slova' RETURNING VARCHAR2);
        FOR x IN (
            SELECT
                json_object('ID' VALUE ID,
                            'ZUPANIJA' VALUE ZUPANIJA) as izlaz
            FROM
                common.zupanije
            where
                zupanija like '%' || l_slova || '%')
            LOOP
                l_out.append(JSON_OBJECT_T(x.izlaz));
            END LOOP;
        l_obj.put('data', l_out);
    EXCEPTION
        when OTHERS THEN
            common.p_errlog('p_main', dbms_utility.format_error_backtrace, sqlcode, sqlerrm, l_string);
            l_obj.put('h_message', 'Greška u obradi podataka');
            l_obj.put('h_errcode', 91);
            raise;
    END p_zupanije;
------------------------------------------------------------
--p_cameras
    procedure p_cameras(l_obj in out JSON_OBJECT_T) AS
        l_out json_array_t := json_array_t('[]');
    BEGIN
        FOR x IN (
            SELECT json_object(
                           'CAMERA_ID' VALUE camera_id,
                           'IMAGE_URL' VALUE image_url,
                           'CATEGORY' VALUE category,
                           'NAME' VALUE name,
                           'PRICE' VALUE price,
                           'STOCK' VALUE stock
                   ) AS izlaz
            FROM cameras
            )
            LOOP
                l_out.append(json_object_t(x.izlaz));
            END LOOP;
        l_obj.put('data', l_out);
        l_obj.put('h_errcode', 0);
    EXCEPTION
        WHEN OTHERS THEN
            common.p_errlog('p_cameras', dbms_utility.FORMAT_ERROR_BACKTRACE, sqlcode, sqlerrm, l_obj.TO_STRING);
            l_obj.put('h_message', 'Greška u dohvatu kamera');
            l_obj.put('h_errcode', 100);
            RAISE e_iznimka;
    END p_cameras;

END DOHVATI;
/
-----------------------
--pks
create or replace NONEDITIONABLE PACKAGE ROUTER AS
    e_iznimka exception;
    PRAGMA EXCEPTION_INIT(e_iznimka, -20001);

    procedure p_main(p_in in clob, p_out out clob);

END ROUTER;

--pkb
create PACKAGE BODY ROUTER AS

    -------------------------------------------------------------
--p_main
    procedure p_main(p_in in clob, p_out out clob) AS
        l_obj         json_object_t;
        l_string      varchar2(4000);
        l_statement   VARCHAR2(120) := 'ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ' ||  ''',.''';
        l_procedura   VARCHAR2(40);
    BEGIN
        l_obj := json_object_t(p_in);
        l_string := l_obj.to_clob;
        l_procedura := JSON_VALUE(l_string, '$.procedura' RETURNING VARCHAR2);

        CASE l_procedura
            WHEN 'p_login' THEN
                dohvati.p_login(l_obj);
            WHEN 'p_zupanije' THEN
                dohvati.p_zupanije(l_obj);
            WHEN 'p_test' THEN
                dohvati.p_test(l_obj);
            WHEN 'p_cameras' THEN
                dohvati.p_cameras(l_obj);
            ELSE
                l_obj.put('h_message', 'Nepoznata metoda ' || l_procedura);
                l_obj.put('h_errcod', 997);
            END CASE;

        p_out := l_obj.to_clob;
    EXCEPTION
        WHEN e_iznimka THEN
            p_out := l_obj.to_clob;
        WHEN OTHERS THEN
            DECLARE
                l_error PLS_INTEGER := SQLCODE;
                l_msg VARCHAR2(255) := sqlerrm;
            BEGIN
                CASE l_error
                    WHEN -2292 THEN
                        l_obj.put('h_message', 'Navedeni zapis se ne može obrisati jer postoje veze na druge zapise');
                        l_obj.put('h_errcode', 99);
                    ELSE
                        common.p_errlog('p_main', dbms_utility.format_error_backtrace, sqlcode, sqlerrm, l_string);
                        l_obj.put('h_message', 'Greška u obradi podataka');
                        l_obj.put('h_errcode', 100);
                        ROLLBACK;
                    END CASE;
            END;
            p_out := l_obj.to_clob;
    END p_main;

END ROUTER;
/