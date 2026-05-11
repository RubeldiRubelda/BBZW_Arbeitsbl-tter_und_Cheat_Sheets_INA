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

-- Aufgabe 2

Use Bike_Lager

Select * FROM Bike;
Select * FROM Marke;
SELECT * FROM Typ;

-- Aufgabe 3

Select * FROM Bike Order By Bezeichnung ASC;

Select * FROM Bike Order By Preis DESC;

Select * FROM Bike Order By Preis DESC, Bezeichnung ASC;


-- Aufgabe 4

Select Bezeichnung as Beschreibung, Preis as 'Preis in CHF' FROM Bike ORDER BY Preis ASC, Bezeichnung ASC;

-- Aufgabe 5

Select * FROM Bike WHERE FK_Marke_Id = (Select Marke_Id FROM Marke WHERE Marke.Bezeichnung = 'Flyer')

-- Aufgabe 6

Select * FROM Bike WHERE FK_Marke_Id = (Select Marke_Id FROM Marke WHERE Marke.Bezeichnung = 'Scott')
                     AND FK_Typ_Id = (Select Typ_Id FROM Typ WHERE Typ.Bezeichnung = 'Mountainbike')

-- Aufgabe 7

SELECT M.Bezeichnung, B.Bezeichnung From Bike as B Inner Join Marke as M on M.Marke_Id = B.FK_Marke_Id Order BY B.Bezeichnung ASC;

-- Aufgabe 8

Select M.Bezeichnung, T.Bezeichnung, B.Bezeichnung, B.Preis FROM Bike as B
    Inner JOIN Marke as M on M.Marke_Id = B.FK_Marke_Id
    Inner JOIN Typ as T on B.FK_Typ_Id = T.Typ_Id;

-- Aufgabe 9

Select M.Bezeichnung, T.Bezeichnung, B.Bezeichnung, B.Preis FROM Bike as B
    Inner JOIN Marke as M on M.Marke_Id = B.FK_Marke_Id
    Inner JOIN Typ as T on B.FK_Typ_Id = T.Typ_Id
    where M.Bezeichnung = 'Wheeler';

-- Aufgabe 10

Select M.Bezeichnung, COUNT(*) FROM Bike as B
    Inner JOIN Marke as M on M.Marke_Id = B.FK_Marke_Id GROUP BY M.Bezeichnung;


-- Aufgabe 11

Select T.Bezeichnung, AVG(Preis) FROM Bike as B
    Inner JOIN Typ as T on B.FK_Typ_Id = T.Typ_Id WHERE T.Bezeichnung = 'E-Bike' GROUP BY T.Bezeichnung;


-- Aufgabe 12

SELECT T.Bezeichnung, COUNT(B.Bezeichnung) FROM Typ as T, Bike as B
 WHERE T.Typ_Id = B.FK_Marke_Id GROUP BY T.Bezeichnung;

-- Aufgabe 13
Select T.Bezeichnung, COUNT(*) as Anzahl, AVG(Preis) as Durchschnitt FROM Bike as B
    Inner JOIN Typ as T on B.FK_Typ_Id = T.Typ_Id GROUP BY T.Bezeichnung;


-- Aufgabe 14
Select T.Bezeichnung, COUNT(*) as Anzahl, MIN(Preis) as Min, MAX(Preis) as Max, AVG(Preis) as Durchschnitt, sum(Preis) FROM Bike as B
    Inner JOIN Typ as T on B.FK_Typ_Id = T.Typ_Id GROUP BY T.Bezeichnung;


-- Aufgabe 15

Select M.Bezeichnung, count(*) as Anzahl From Bike Inner Join Marke M on M.Marke_Id = Bike.FK_Marke_Id GROUP BY M.Bezeichnung;

-- Aufgabe 16

Select T.Bezeichnung, count(*) as Anzal From Bike Full Outer Join Typ as t on t.Typ_Id = Bike.FK_Typ_Id GROUP BY T.Bezeichnung HAVING COUNT(Bike.Bezeichnung) = 0


-- Aufgabe 17

SELECT M.Bezeichnung as Marke,
       B.Bezeichnung as Name, B.Preis - (B.Preis * 8.1 / 100) as 'Pres ohne MWST.',
       B.Preis * 8.1 / 100 as 'MWST.', B.Preis as 'Preis mit MWST.'
FROM Bike as B
    JOIN Marke as M on B.FK_Marke_Id = M.Marke_Id;

-- Aufgabe 18


Select sum(Preis) * 0.1575 as Gewinn FROM Bike;

-- Aufgabe 19

SELECT CAST(SUM((Preis + 80) * 0.1575) AS DECIMAL(9, 2)) AS Gewinn FROM Bike;



-- Aufgabe 20

SELECT
    m.Bezeichnung AS Marke,
    t.Bezeichnung AS Typ,
    b.Bezeichnung AS Bike,
    b.Preis AS Normalpreis,
    (b.Preis - 200) AS Aktionspreis
FROM
    Bike b
INNER JOIN
    Marke m ON b.FK_Marke_Id = m.Marke_Id
INNER JOIN
    Typ t ON b.FK_Typ_Id = t.Typ_Id
WHERE
    t.Bezeichnung != 'Citybike'
    AND b.Preis > 1000
ORDER BY
    Marke ASC,
    Typ ASC,
    Bike ASC;

-- Aufgabe 21

SELECT
    t.Bezeichnung AS Typ,
    b.Bezeichnung AS Bike,
    m.Bezeichnung AS Marke,
    b.Preis
FROM
    Bike b
INNER JOIN
    Typ t ON b.FK_Typ_Id = t.Typ_Id
INNER JOIN
    Marke m ON b.FK_Marke_Id = m.Marke_Id
WHERE
    b.Preis = (
        -- Finde den maximalen Preis für genau diesen Typ
        SELECT MAX(Preis)
        FROM Bike
        WHERE FK_Typ_Id = b.FK_Typ_Id
    )
ORDER BY
    Typ ASC,
    Bike ASC;





