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





