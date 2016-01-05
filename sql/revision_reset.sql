-- All credits to Yousra Lembachar, at http://alumni.cs.ucr.edu/~ylemb001/tp2.sql

DROP SCHEMA IF EXISTS hollywood;
CREATE SCHEMA hollywood; 
USE hollywood;

CREATE TABLE film (
    idFilm INT NOT NULL,
    titre TEXT NOT NULL,
    realisateur TEXT NOT NULL,
    annee TEXT NOT NULL,
    CONSTRAINT pk1 PRIMARY KEY (idFilm)
);


CREATE TABLE acteur (
    idActeur INT NOT NULL,
    nom TEXT NOT NULL,
    CONSTRAINT pk1 PRIMARY KEY (idActeur)
);


CREATE TABLE filmographie (
    idFilmographie INT NOT NULL,
    idActeur INT NOT NULL,
    idFilm INT NOT NULL,
    role TEXT NOT NULL,
    salaire TEXT NOT NULL,
    CONSTRAINT pk PRIMARY KEY (idFilmographie),
    CONSTRAINT fk1 FOREIGN KEY (idFilm)
        REFERENCES film (idFilm),
    CONSTRAINT fk2 FOREIGN KEY (idActeur)
        REFERENCES acteur (idActeur)
);

INSERT INTO film VALUES (1,'Les évadés', 'Darabont', 1994);
INSERT INTO film VALUES (2,'Le parrain', 'Coppola', 1972);
INSERT INTO film VALUES (3,'Le parrain 2', 'Coppola', 1974);
INSERT INTO film VALUES (4,'L''odysséede Pi', 'Ang Lee', 2013);
INSERT INTO film VALUES (5,'Chocolat', 'Hallstrom', 2000);
INSERT INTO film VALUES (6,'Scarface', 'De Palma', 1983);
INSERT INTO film VALUES (7,'Rango', 'Verbinski', 2011);


INSERT INTO acteur VALUES (1, 'Johnny Depp');
INSERT INTO acteur VALUES (2, 'Al Pacino');
INSERT INTO acteur VALUES (3, 'Suraj Sharma');
INSERT INTO acteur VALUES (4, 'Brad Pitt');
INSERT INTO acteur VALUES (5, 'Edward Norton');

INSERT INTO filmographie VALUES(1,1,5, 'Roux', 5000);
INSERT INTO filmographie VALUES(2,1,7, 'Rango', 10000);
INSERT INTO filmographie VALUES(3,2,2, 'Michael Corleone', 10000);
INSERT INTO filmographie VALUES(4,2,3, 'Michael Corleone', 20000);
INSERT INTO filmographie VALUES(5,2,6, 'Tony Montana', 15000);
INSERT INTO filmographie VALUES(6,3,4, 'Pi', 20000);
