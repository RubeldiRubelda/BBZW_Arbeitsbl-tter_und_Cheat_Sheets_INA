-----------------------------------------------------------------------
-- Stundenplan
-----------------------------------------------------------------------
USE master;
GO

IF DB_ID('Stundenplan') IS NOT NULL
BEGIN
    ALTER DATABASE Stundenplan
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Stundenplan;
END;
GO

CREATE DATABASE Stundenplan;
GO
USE Stundenplan;
GO

-----------------------------------------------------------------------
-- Tabellen
-----------------------------------------------------------------------
DROP TABLE IF EXISTS Klasse_Fach;
DROP TABLE IF EXISTS Lernender_Klasse;
DROP TABLE IF EXISTS Klasse;
DROP TABLE IF EXISTS Lernender;
DROP TABLE IF EXISTS Lehrperson;
DROP TABLE IF EXISTS Raum;
DROP TABLE IF EXISTS Fach;
DROP TABLE IF EXISTS Lehrbetrieb;

CREATE TABLE Lehrbetrieb (
    Lehrbetrieb_Id INTEGER IDENTITY,
    Firmenname NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_Lehrbetrieb PRIMARY KEY (Lehrbetrieb_Id)
);

CREATE TABLE Lernender (
    Lernender_Id INTEGER IDENTITY,
    Nachname NVARCHAR(50) NOT NULL,
    Vorname NVARCHAR(50) NOT NULL,
    FK_Lehrbetrieb_Id INTEGER NOT NULL,
    CONSTRAINT PK_Lernender PRIMARY KEY (Lernender_Id),
    CONSTRAINT FK_Lernender_Lehrbetrieb
        FOREIGN KEY (FK_Lehrbetrieb_Id)
        REFERENCES Lehrbetrieb (Lehrbetrieb_Id)
);

CREATE TABLE Lehrperson (
    Lehrperson_Id INTEGER IDENTITY,
    Nachname NVARCHAR(50) NOT NULL,
    Vorname NVARCHAR(50) NOT NULL,
    Kuerzel NVARCHAR(10) NOT NULL,
    CONSTRAINT PK_Lehrperson PRIMARY KEY (Lehrperson_Id)
);

CREATE TABLE Klasse (
    Klasse_Id INTEGER IDENTITY,
    Bezeichnung NVARCHAR(10) NOT NULL,
    FK_Lehrperson_Id INTEGER NOT NULL,
    CONSTRAINT PK_Klasse PRIMARY KEY (Klasse_Id),
    CONSTRAINT FK_Klasse_Lehrperson
        FOREIGN KEY (FK_Lehrperson_Id)
        REFERENCES Lehrperson (Lehrperson_Id)
);

CREATE TABLE Lernender_Klasse (
    LernenderKlasse_Id INTEGER IDENTITY,
    FK_Lernender_Id INTEGER NOT NULL,
    FK_Klasse_Id INTEGER NOT NULL,
    CONSTRAINT PK_Lernender_Klasse PRIMARY KEY (LernenderKlasse_Id),
    CONSTRAINT FK_LernenderKlasse_Lernender
        FOREIGN KEY (FK_Lernender_Id)
        REFERENCES Lernender (Lernender_Id),
    CONSTRAINT FK_LernenderKlasse_Klasse
        FOREIGN KEY (FK_Klasse_Id)
        REFERENCES Klasse (Klasse_Id)
);

CREATE TABLE Fach (
    Fach_Id INTEGER IDENTITY,
    Kurzbezeichnung NVARCHAR(10) NOT NULL,
    Langbezeichnung NVARCHAR(300) NOT NULL,
    CONSTRAINT PK_Fach PRIMARY KEY (Fach_Id)
);

CREATE TABLE Raum (
    Raum_Id INTEGER IDENTITY,
    Bezeichnung NVARCHAR(10) NOT NULL,
    CONSTRAINT PK_Raum PRIMARY KEY (Raum_Id)
);

CREATE TABLE Klasse_Fach (
    KlasseFach_Id INTEGER IDENTITY,
    FK_Fach_Id INTEGER NOT NULL,
    FK_Klasse_Id INTEGER NOT NULL,
    FK_Lehrperson_Id INTEGER NOT NULL,
    FK_Raum_Id INTEGER NOT NULL,
    CONSTRAINT PK_Klasse_Fach PRIMARY KEY (KlasseFach_Id),
    CONSTRAINT FK_KlasseFach_Fach
        FOREIGN KEY (FK_Fach_Id)
        REFERENCES Fach (Fach_Id),
    CONSTRAINT FK_KlasseFach_Klasse
        FOREIGN KEY (FK_Klasse_Id)
        REFERENCES Klasse (Klasse_Id),
    CONSTRAINT FK_KlasseFach_Lehrperson
        FOREIGN KEY (FK_Lehrperson_Id)
        REFERENCES Lehrperson (Lehrperson_Id),
    CONSTRAINT FK_KlasseFach_Raum
        FOREIGN KEY (FK_Raum_Id)
        REFERENCES Raum (Raum_Id)
);
GO

-----------------------------------------------------------------------
-- Lehrbetriebe
-----------------------------------------------------------------------
INSERT INTO Lehrbetrieb (Firmenname) VALUES
    ('Luzerner Kantonsspital (LUKS)'),
    ('Schindler Berufsbildung'),
    ('CKW AG'),
    ('CSS Versicherung'),
    ('bbv Software Services AG'),
    ('Hochschule Luzern'),
    ('Kanton Luzern (Dienststelle Informatik)'),
    ('getAbstract AG'),
    ('KMS AG'),
    ('Suva'),
    ('Arcade Solutions AG'),
    ('Verkehrsbetriebe Luzern AG (vbl)'),
    ('Steeltec AG'),
    ('Komax AG'),
    ('Bison Schweiz AG'),
    ('Kauz Informatik Medien AG');

-----------------------------------------------------------------------
-- Lehrpersonen
-----------------------------------------------------------------------
INSERT INTO Lehrperson (Nachname, Vorname, Kuerzel) VALUES
    ('Rohrer','Monika','RoM'),
    ('Suter','Bruno','SuB'),
    ('Birrer','Nicole','BiN'),
    ('Wolf','Max','WoM'),
    ('Schaub','Fabio','ScF'),
    ('Widmer','Maria','WiM'),
    ('Peyer','Rita','PeR'),
    ('Haas','Urs','HaU'),
    ('Frick','Robert','FrR');

-----------------------------------------------------------------------
-- Klassen
-----------------------------------------------------------------------
INSERT INTO Klasse (Bezeichnung, FK_Lehrperson_Id) VALUES
    ('INA47a',4),('INA47b',1),
    ('INA48a',3),('INA48b',2),
    ('MMA47a',6),('MMA48a',7),
    ('INP47a',8),('INP47b',4),
    ('INP48a',1),('INP48b',3),
    ('EDB47a',5),('EDB48a',6),
    ('ICF47a',2),('ICF48a',7);

-----------------------------------------------------------------------
-- Lernende
-----------------------------------------------------------------------
INSERT INTO Lernender (Nachname, Vorname, FK_Lehrbetrieb_Id) VALUES
    ('Hodel','Esther',1),('Muri','Selina',1),('Koch','Florian',1),
    ('Zihlmann','Tamara',2),('Isenschmid','Sabrina',2),
    ('Walker','Vreni',3),('Jenni','Remo',3),('Merz','Ueli',3),
    ('Keller','Melanie',4),('Gisler','David',4),('Graf','Anja',4),
    ('Studer','Simone',5),('Kurmann','Ivan',5),('Marti','Lisa',5),
    ('Felder','Ivo',6),('Herger','Michael',6),('Bieri','Lino',6),
    ('Lang','Tanja',16),('Tanner','Chantal',16),('Heer','Lena',16),
    ('Baumann','Andrea',16),('Scherrer','Claudia',16),('Kunz','Silvia',16),
    ('Suter','Sandra',16),('Beck','Denise',16),('Wagner','Lara',16),
    ('Spörri','Adrian',16),('Furrer','Oliver',16),('Gasser','Samuel',16),
    ('Sager','Pascal',16),('Rossi','Mario',16),('Becker','Julia',16),
    ('Heim','Doris',16),('Maurer','Jessica',16),('Schenker','Kevin',16),
    ('Zeller','Fabian',16),('Kälin','Marco',16),
    --
    ('Müller','Liam',1),('Meier','Noah',1),('Schmid','Levi',1),
    ('Keller','Luca',1),('Weber','Finn',1),('Fischer','Nino',1),
    ('Brunner','Mia',1),('Gerber','Lina',1),('Marti','Lea',1),
    ('Kunz','Sofia',1),('Steiner','Nora',1),('Graf','Jonas',1),
    ('Arnold','Leo',1),('Zürcher','Tim',1),('Reinhard','Mila',1),
    ('Schwarz','Jana',1),('Huber','Ben',1),('Lustenberger','Lena',1),
    ('Meier','Lars',2),('Schmid','Paul',2),('Keller','Sam',2),
    ('Weber','Theo',2),('Fischer','Lio',2),('Brunner','Nico',2),
    ('Gerber','Ava',2),('Marti','Lia',2),('Kunz','Mara',2),
    ('Steiner','Milo',2),
    ('Graf','Nils',3),('Arnold','Elias',3),('Zürcher','Jonas',3),
    ('Reinhard','Mara',3),('Schwarz','Ella',3),
    ('Huber','Luca',4),('Lustenberger','Lea',4),('Koch','Noah',4),
    ('Suter','Lina',4),
    ('Bucher','Finn',5),('Fischer','Lena',5),('Brunner','Jan',5),
    ('Keller','Levi',5),
    ('Meier','Noel',6),('Graf','Mila',6),('Müller','Leo',6),
    ('Meier','Mia',6),
    ('Schmid','Lio',7),('Keller','Lars',7),('Weber','Nora',7),
    ('Fischer','Elia',8),('Brunner','Luca',8),
    ('Gerber','Lio',9),
    ('Marti','Nina',10),('Kunz','Lea',10),
    ('Steiner','Luca',11),
    ('Graf','Mara',12),('Arnold','Liam',12),
    ('Zürcher','Noah',13),
    ('Reinhard','Lena',14),
    ('Schwarz','Levi',15),
    ('Huber','Tim',16);

-----------------------------------------------------------------------
-- Klassenzuteilung
-----------------------------------------------------------------------
INSERT INTO Lernender_Klasse (FK_Lernender_Id, FK_Klasse_Id) VALUES
-- Klasse 1 (22)
(1,1),(2,1),(3,1),(4,1),(5,1),
(6,1),(7,1),(8,1),(9,1),(10,1),
(11,1),(12,1),(13,1),(14,1),(15,1),
(16,1),(17,1),(18,1),(19,1),(20,1),
(21,1),(22,1),
-- Klasse 2 (18)
(23,2),(24,2),(25,2),
(26,2),(27,2),(28,2),(29,2),(30,2),
(31,2),(32,2),(33,2),(34,2),(35,2),
(36,2),(37,2),(38,2),(39,2),(40,2),
-- Klasse 7 (20)
(41,7),(42,7),(43,7),(44,7),(45,7),
(46,7),(47,7),(48,7),(49,7),(50,7),
(51,7),(52,7),(53,7),(54,7),(55,7),
(56,7),(57,7),(58,7),(59,7),(60,7),
-- Klasse 8 (25)
(61,8),(62,8),(63,8),(64,8),(65,8),
(66,8),(67,8),(68,8),(69,8),(70,8),
(71,8),(72,8),(73,8),(74,8),(75,8),
(76,8),(77,8),(78,8),(79,8),(80,8),
(81,8),(82,8),(83,8),(84,8),(85,8),
-- Klasse 11 (10)
(86,11),(87,11),(88,11),(89,11),(90,11),
(91,11),(92,11),(93,11),(94,11),(95,11),
-- doppelt zugewiesene Lernende (2 Stück)
(10,11),(20,2);

-----------------------------------------------------------------------
-- Räume
-----------------------------------------------------------------------
INSERT INTO Raum (Bezeichnung) VALUES
    ('E01'),('E02'),('E03'),
    ('101'),('102'),('103'),('104'),
    ('201'),('202'),('203'),('204'),('205');

-----------------------------------------------------------------------
-- Fächer
-----------------------------------------------------------------------
INSERT INTO Fach (Kurzbezeichnung, Langbezeichnung) VALUES
    ('MAT','Mathematik'),
    ('INF','Informatik'),
    ('ENG','Englisch'),
    ('ABU','Allgemeinbildung'),
    ('SPO','Sport'),
    ('BKU','Berufskunde'),
    ('DEU','Deutsch');

-----------------------------------------------------------------------
-- Klasse-Fach-Zuordnung
-----------------------------------------------------------------------
INSERT INTO Klasse_Fach (FK_Klasse_Id, FK_Fach_Id, FK_Lehrperson_Id, FK_Raum_Id) VALUES
    (2,1,1,1),(2,2,2,2),(2,3,3,3),(2,4,6,4),(2,5,4,5),
    (3,1,1,1),(3,2,2,2),(3,3,3,3),(3,4,6,4),(3,6,4,5),
    (4,1,1,2),(4,2,2,2),(4,3,3,2),(4,4,6,4),(4,7,4,5),
    (5,1,1,6),(5,2,2,6),(5,3,3,7),(5,5,4,7),(5,6,4,7),
    (6,1,1,9),(6,2,2,9),(6,3,3,9),(6,4,6,9),(6,6,4,9),
    (7,1,8,1),(7,2,8,2),(7,3,8,3),(7,4,8,4),(7,5,8,5),
    (8,1,4,1),(8,2,4,2),(8,3,4,3),(8,4,4,4),(8,6,4,5),
    (9,1,1,1),(9,2,1,2),(9,3,1,3),(9,4,1,4),(9,7,1,5),
    (10,1,3,1),(10,2,3,2),(10,3,3,3),(10,4,3,4),(10,5,3,5),
    (11,1,5,1),(11,2,5,2),(11,3,5,3),(11,4,5,4),(11,6,5,5),
    (12,1,6,1),(12,2,6,2),(12,3,6,3),(12,4,6,4),(12,7,6,5),
    (13,1,2,1),(13,2,2,2),(13,3,2,3),(13,4,2,4),(13,5,2,5),
    (14,1,7,1),(14,2,7,2),(14,3,7,3),(14,4,7,4),(14,6,7,5);

GO