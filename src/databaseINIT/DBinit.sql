
/*creazione delle tabelle*/


DROP SCHEMA IF EXISTS USERS CASCADE;


CREATE SCHEMA USERS;


/*        TABELLE IMPLEMENTAZIONE SOFTWARE UTENTE        */


CREATE TABLE USERS.UtenteRegistrato(
  EMAIL            VARCHAR                ,
  ID            VARCHAR                ,
  PASSWORD        VARCHAR                ,
  CONTATTO        VARCHAR                ,
  PRIMARY KEY (EMAIL)
);


CREATE TABLE USERS.Azienda(
  PIVA            VARCHAR                ,
  NOMEAZIENDA        VARCHAR                ,
  SETTORE        VARCHAR                ,
  SUPPORTO        VARCHAR                ,
  TELEFONO        VARCHAR                ,
  EMAIL            VARCHAR
    REFERENCES USERS.UtenteRegistrato(EMAIL),
  PRIMARY KEY (PIVA)
);


CREATE TABLE USERS.Privato(
  NOME            VARCHAR                ,
  COGNOME        VARCHAR                ,
  TELEFONO        VARCHAR                ,
  EMAIL            VARCHAR
    REFERENCES USERS.UtenteRegistrato(EMAIL),
  PRIMARY KEY (EMAIL)
);


CREATE TABLE USERS.Admin(
  NOME            VARCHAR                ,
  COGNOME        VARCHAR                ,
  EMAIL            VARCHAR
    REFERENCES USERS.UtenteRegistrato(EMAIL),
  PRIMARY KEY (EMAIL)
);




/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-----creazione delle tabelle*/


DROP SCHEMA IF EXISTS ARTICLES CASCADE;


CREATE SCHEMA ARTICLES;


/*        TABELLE IMPLEMENTAZIONE SOFTWARE ARTICOLO        */


CREATE TABLE ARTICLES.articolo(
  NOME            VARCHAR                ,
  PROPRIETARIO        VARCHAR
    REFERENCES USERS.UtenteRegistrato(EMAIL),
  PREZZO            FLOAT                ,
  QUANTITA        INT                ,
  PRIMARY KEY (NOME, PROPRIETARIO)
);


CREATE TABLE ARTICLES.libro(
  TITOLO            VARCHAR                ,
  PROPRIETARIO        VARCHAR,
  NOME            VARCHAR,
  FOREIGN KEY (NOME, PROPRIETARIO) REFERENCES ARTICLES.articolo(NOME, PROPRIETARIO),
  AUTORE            VARCHAR                ,
  CASA            VARCHAR                ,
  PAGINE            INT                ,
  PRIMARY KEY (NOME, PROPRIETARIO)
);


CREATE TABLE ARTICLES.informatica(
  TIPO            VARCHAR                ,
  PROPRIETARIO        VARCHAR,
  NOME            VARCHAR,
  FOREIGN KEY (NOME, PROPRIETARIO) REFERENCES ARTICLES.articolo(NOME, PROPRIETARIO),
  MODELLO          VARCHAR                ,
  MARCA            VARCHAR                ,
  PRIMARY KEY (NOME, PROPRIETARIO)
);


CREATE TABLE ARTICLES.Abbigliamento(
  TIPO            VARCHAR                ,
  PROPRIETARIO        VARCHAR,
  NOME            VARCHAR,
  FOREIGN KEY (NOME, PROPRIETARIO) REFERENCES ARTICLES.articolo(NOME, PROPRIETARIO),
  TAGLIA            INT                ,
  MARCA            VARCHAR                ,
  PRIMARY KEY (NOME, PROPRIETARIO)
);
CREATE TABLE ARTICLES.Scolastico(
  MATERIA        VARCHAR                ,
  PROPRIETARIO        VARCHAR,
  NOME            VARCHAR,
  FOREIGN KEY (NOME, PROPRIETARIO) REFERENCES ARTICLES.libro(NOME, PROPRIETARIO),
  EDIZIONE        INT                ,
  PRIMARY KEY (NOME, PROPRIETARIO)
);

CREATE TABLE ARTICLES.recensione(
  SEGNALAZIONE        BOOLEAN,
  UTENTE              VARCHAR,
  ARTICOLO            VARCHAR,
  PROPRIETARIO        VARCHAR,
  TESTO               VARCHAR,
  RAITNG              INT  ,
  TOCHECK             BOOLEAN,
  FOREIGN KEY (UTENTE) REFERENCES USERS.UtenteRegistrato(EMAIL),
  FOREIGN KEY (ARTICOLO, PROPRIETARIO) REFERENCES ARTICLES.articolo(NOME, PROPRIETARIO),
  PRIMARY KEY (UTENTE, ARTICOLO, SEGNALAZIONE)
);

CREATE TABLE ARTICLES.acquisti(
  UTENTE           VARCHAR,
  ARTICOLO         VARCHAR,
  PROPRIETARIO     VARCHAR,
  FOREIGN KEY (ARTICOLO, PROPRIETARIO) REFERENCES ARTICLES.articolo(NOME, PROPRIETARIO),
  FOREIGN KEY (UTENTE) REFERENCES USERS.Privato(EMAIL)
);

/*---------------------------------------------------------------------------first values*/




/*as users*/
INSERT INTO USERS.UtenteRegistrato VALUES ('simone@gmail.com', '0', 'simone', '3333333333');
INSERT INTO USERS.UtenteRegistrato VALUES ('giogge@gmail.com', '1', 'giogge', '3333333333');
INSERT INTO USERS.UtenteRegistrato VALUES ('giuliac@gmail.com', '2', 'giulia', '3333333333');


/*as admin*/
INSERT INTO USERS.Admin VALUES ('simone', 'daniello', 'simone@gmail.com');
INSERT INTO USERS.Admin VALUES ('giulia', 'frascaria', 'giogge@gmail.com');
INSERT INTO USERS.Admin VALUES ('giulia', 'cassara', 'giuliac@gmail.com');








INSERT INTO ARTICLES.articolo VALUES ('Santa Croce', 'simone@gmail.com', '10', '100' );
INSERT INTO ARTICLES.libro VALUES ('origine della Santa Croce', 'simone@gmail.com', 'Santa Croce', 'Simone D'' Aniello', 'Mondadori', '350' );


INSERT INTO ARTICLES.articolo VALUES ('Sant'' Anna', 'simone@gmail.com', '15', '100' );
INSERT INTO ARTICLES.libro VALUES ('origine della Santa Anna', 'simone@gmail.com', 'Sant'' Anna', 'Simone D'' Aniello', 'Mondadori', '80' );


INSERT INTO ARTICLES.articolo VALUES ('Lieve', 'simone@gmail.com', '4.90', '100' );
INSERT INTO ARTICLES.libro VALUES ('origine della Lieve', 'simone@gmail.com', 'Lieve', 'Simone D'' Aniello', 'Mondadori', '100' );


INSERT INTO ARTICLES.articolo VALUES ('A scuola con l'' acqua', 'simone@gmail.com', '50', '100' );
INSERT INTO ARTICLES.libro VALUES ('A scuola con l'' acqua', 'simone@gmail.com', 'A scuola con l'' acqua', 'Simone D'' Aniello', 'Mondadori', '100' );
INSERT INTO ARTICLES.Scolastico VALUES ('Acquologia', 'simone@gmail.com', 'A scuola con l'' acqua', '1' );




INSERT INTO ARTICLES.articolo VALUES ('Lenovo ThinkPad', 'simone@gmail.com', '500', '10');
INSERT INTO ARTICLES.informatica VALUES ('Notebook', 'simone@gmail.com', 'Lenovo ThinkPad', 'thinkPad Costoso', 'Lenovo');


INSERT INTO ARTICLES.articolo VALUES ('HP pavilion', 'simone@gmail.com', '800', '10');
INSERT INTO ARTICLES.informatica VALUES ('Notebook', 'simone@gmail.com', 'HP pavilion', 'HP Tamarro', 'HP');

INSERT INTO ARTICLES.articolo VALUES ('HP pavilion 2', 'simone@gmail.com', '800', '10');
INSERT INTO ARTICLES.informatica VALUES ('Notebook', 'simone@gmail.com', 'HP pavilion 2', 'HP Tamarro', 'HP');

INSERT INTO ARTICLES.articolo VALUES ('HP pavilion 3', 'simone@gmail.com', '800', '10');
INSERT INTO ARTICLES.informatica VALUES ('Notebook', 'simone@gmail.com', 'HP pavilion 3', 'HP Tamarro', 'HP');

INSERT INTO ARTICLES.articolo VALUES ('HP pavilion 4', 'simone@gmail.com', '800', '10');
INSERT INTO ARTICLES.informatica VALUES ('Notebook', 'simone@gmail.com', 'HP pavilion 4', 'HP Tamarro', 'HP');

INSERT INTO ARTICLES.articolo VALUES ('HP pavilion 5', 'simone@gmail.com', '800', '10');
INSERT INTO ARTICLES.informatica VALUES ('Notebook', 'simone@gmail.com', 'HP pavilion 5', 'HP Tamarro', 'HP');

INSERT INTO ARTICLES.articolo VALUES ('HP pavilion 6', 'simone@gmail.com', '800', '10');
INSERT INTO ARTICLES.informatica VALUES ('Notebook', 'simone@gmail.com', 'HP pavilion 6', 'HP Tamarro', 'HP');

INSERT INTO ARTICLES.articolo VALUES ('HP pavilion 7', 'simone@gmail.com', '800', '10');
INSERT INTO ARTICLES.informatica VALUES ('Notebook', 'simone@gmail.com', 'HP pavilion 7', 'HP Tamarro', 'HP');

INSERT INTO ARTICLES.articolo VALUES ('HP pavilion 8', 'simone@gmail.com', '800', '10');
INSERT INTO ARTICLES.informatica VALUES ('Notebook', 'simone@gmail.com', 'HP pavilion 8', 'HP Tamarro', 'HP');

INSERT INTO ARTICLES.articolo VALUES ('Asus touch', 'simone@gmail.com', '1200', '10');
INSERT INTO ARTICLES.informatica VALUES ('Notebook', 'simone@gmail.com', 'Asus touch', 'Asus touch', 'Asus');


INSERT INTO ARTICLES.articolo VALUES ('gonna lunga', 'simone@gmail.com', '12', '10');
INSERT INTO ARTICLES.Abbigliamento VALUES ('gonna', 'simone@gmail.com', 'gonna lunga', '42', 'Oviesse');


INSERT INTO ARTICLES.articolo VALUES ('gonna corta', 'simone@gmail.com', '12', '10');
INSERT INTO ARTICLES.Abbigliamento VALUES ('gonna', 'simone@gmail.com', 'gonna corta', '42', 'Oviesse');


