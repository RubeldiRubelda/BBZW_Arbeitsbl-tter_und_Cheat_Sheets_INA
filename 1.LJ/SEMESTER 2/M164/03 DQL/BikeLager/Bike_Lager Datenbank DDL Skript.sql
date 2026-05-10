-----------------------------------------------------------------------
-- Bike_Lager
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- Datenbank erstellen
-----------------------------------------------------------------------
USE master;
GO

IF DB_ID('Bike_Lager') IS NOT NULL
BEGIN
    ALTER DATABASE Bike_Lager
        SET SINGLE_USER
        WITH ROLLBACK IMMEDIATE;

    DROP DATABASE Bike_Lager;
END;
GO

CREATE DATABASE Bike_Lager;
GO

USE Bike_Lager;
GO

-----------------------------------------------------------------------
-- Tabellen erstellen
-----------------------------------------------------------------------
CREATE TABLE Typ (
    Typ_Id INTEGER IDENTITY,
    Bezeichnung NVARCHAR(20) NOT NULL,

    CONSTRAINT PK_Typ PRIMARY KEY (Typ_Id)
);

CREATE TABLE Marke (
    Marke_Id INTEGER IDENTITY,
    Bezeichnung NVARCHAR(20) NOT NULL,

    CONSTRAINT PK_Marke PRIMARY KEY (Marke_Id)
);

CREATE TABLE Bike (
    Bike_Id INTEGER IDENTITY,
    Bezeichnung NVARCHAR(50) NOT NULL,
    Preis DECIMAL(9, 2) NOT NULL,
    FK_Typ_Id INTEGER NULL,     -- damit die Fremdschlüssel nachträglich hinzugefügt werden können
    FK_Marke_Id INTEGER NULL,   -- damit die Fremdschlüssel nachträglich hinzugefügt werden können

    CONSTRAINT PK_Bike PRIMARY KEY (Bike_Id),
    CONSTRAINT FK_Bike_Typ
        FOREIGN KEY (FK_Typ_Id)
        REFERENCES Typ (Typ_Id),
    CONSTRAINT FK_Bike_Marke
        FOREIGN KEY (FK_Marke_Id)
        REFERENCES Marke (Marke_Id)
);
GO

-----------------------------------------------------------------------
-- Stammdaten einfügen
-----------------------------------------------------------------------
INSERT INTO Typ (Bezeichnung)
VALUES
    ('Citybike'),
    ('E-Bike'),
    ('Kinderbike'),
    ('Mountainbike'),
    ('Rennvelo');

INSERT INTO Marke (Bezeichnung)
VALUES
    ('Scott'),
    ('Trek'),
    ('Flyer'),
    ('Wheeler'),
    ('Cube');

INSERT INTO Bike (Bezeichnung, Preis)
VALUES
    ('Travel SL',        1399.00), -- Cube, Citybike
    ('Upstreet 5',       3899.00), -- Flyer, E-Bike
    ('Uproc 3',          4599.00), -- Flyer, E-Bike
    ('C 5.1',            3199.00), -- Flyer, E-Bike
    ('Powerfly FS 7',    5399.00), -- Trek, E-Bike
    ('Fuel EX 9.8',      3999.00), -- Trek, Mountainbike
    ('Scale 24',          499.00), -- Scott, Kinderbike
    ('Scale 950',        1199.00), -- Scott, Mountainbike
    ('XT EQT 24',         499.00), -- Wheeler, Citybike
    ('Protron XT-10',     999.00); -- Wheeler, Mountainbike
GO

-----------------------------------------------------------------------
-- Typ und Marke pro Bike setzen
-----------------------------------------------------------------------
/*
    Die Fremdschlüssel werden hier bewusst nachträglich gesetzt, um das 
    Verständnis von Beziehungen zu fördern und damit die Stammdaten bei
    Bedarf beliebig angepasst werden können.
*/
UPDATE Bike
SET
    FK_Typ_Id = (
        SELECT Typ_Id
        FROM Typ
        WHERE Bezeichnung = 'Citybike'
    ),
    FK_Marke_Id = (
        SELECT Marke_Id
        FROM Marke
        WHERE Bezeichnung = 'Cube'
    )
WHERE Bezeichnung = 'Travel SL';

UPDATE Bike
SET
    FK_Typ_Id = (
        SELECT Typ_Id
        FROM Typ
        WHERE Bezeichnung = 'E-Bike'
    ),
    FK_Marke_Id = (
        SELECT Marke_Id
        FROM Marke
        WHERE Bezeichnung = 'Flyer'
    )
WHERE Bezeichnung IN ('Upstreet 5', 'Uproc 3', 'C 5.1');

UPDATE Bike
SET
    FK_Typ_Id = (
        SELECT Typ_Id
        FROM Typ
        WHERE Bezeichnung = 'E-Bike'
    ),
    FK_Marke_Id = (
        SELECT Marke_Id
        FROM Marke
        WHERE Bezeichnung = 'Trek'
    )
WHERE Bezeichnung = 'Powerfly FS 7';

UPDATE Bike
SET
    FK_Typ_Id = (
        SELECT Typ_Id
        FROM Typ
        WHERE Bezeichnung = 'Mountainbike'
    ),
    FK_Marke_Id = (
        SELECT Marke_Id
        FROM Marke
        WHERE Bezeichnung = 'Trek'
    )
WHERE Bezeichnung = 'Fuel EX 9.8';

UPDATE Bike
SET
    FK_Typ_Id = (
        SELECT Typ_Id
        FROM Typ
        WHERE Bezeichnung = 'Kinderbike'
    ),
    FK_Marke_Id = (
        SELECT Marke_Id
        FROM Marke
        WHERE Bezeichnung = 'Scott'
    )
WHERE Bezeichnung = 'Scale 24';

UPDATE Bike
SET
    FK_Typ_Id = (
        SELECT Typ_Id
        FROM Typ
        WHERE Bezeichnung = 'Mountainbike'
    ),
    FK_Marke_Id = (
        SELECT Marke_Id
        FROM Marke
        WHERE Bezeichnung = 'Scott'
    )
WHERE Bezeichnung = 'Scale 950';

UPDATE Bike
SET
    FK_Typ_Id = (
        SELECT Typ_Id
        FROM Typ
        WHERE Bezeichnung = 'Citybike'
    ),
    FK_Marke_Id = (
        SELECT Marke_Id
        FROM Marke
        WHERE Bezeichnung = 'Wheeler'
    )
WHERE Bezeichnung = 'XT EQT 24';

UPDATE Bike
SET
    FK_Typ_Id = (
        SELECT Typ_Id
        FROM Typ
        WHERE Bezeichnung = 'Mountainbike'
    ),
    FK_Marke_Id = (
        SELECT Marke_Id
        FROM Marke
        WHERE Bezeichnung = 'Wheeler'
    )
WHERE Bezeichnung = 'Protron XT-10';
GO