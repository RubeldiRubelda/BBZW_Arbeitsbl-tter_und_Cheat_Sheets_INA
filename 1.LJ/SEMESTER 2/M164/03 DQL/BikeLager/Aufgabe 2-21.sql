USE Bike_Lager;

-- 2
select * from Bike;
select * from Marke;
select * from Typ;
GO

-- 3
SELECT Bike_Id, Bezeichnung, Preis 
FROM Bike
ORDER BY Bezeichnung;

SELECT Bike_Id, Bezeichnung, Preis 
FROM Bike
ORDER BY Preis DESC;

SELECT Bike_Id, Bezeichnung, Preis 
FROM Bike
ORDER BY Preis DESC, Bezeichnung DESC;
GO

-- 4
SELECT Bezeichnung [Beschreibung], Preis [Preis in CHF]
FROM Bike
ORDER BY Preis ASC, Bezeichnung ASC;
GO

-- 5
SELECT Bike_Id, Bezeichnung, Preis, FK_Typ_Id, FK_Marke_Id
FROM Bike
WHERE (FK_Marke_Id = 3);
GO

-- 6 
SELECT Bezeichnung, Preis
FROM Bike
WHERE FK_Typ_Id IN (SELECT Typ_Id FROM Typ WHERE Bezeichnung = 'Mountainbike')
AND FK_Marke_Id IN (SELECT Marke_Id FROM Marke WHERE Bezeichnung = 'Scott')
ORDER BY Bezeichnung;

SELECT Bezeichnung, Preis
FROM Bike
WHERE FK_Typ_Id = (SELECT Typ_Id FROM Typ WHERE Bezeichnung = 'Mountainbike')
AND FK_Marke_Id = (SELECT Marke_Id FROM Marke WHERE Bezeichnung = 'Scott')
ORDER BY Bezeichnung;
GO

-- 7
SELECT m.Bezeichnung [Marke], b.Bezeichnung [Bike], b.Preis [Preis]
FROM Bike [b]
JOIN Marke [m] ON b.FK_Marke_Id = m.Marke_Id
ORDER BY b.Bezeichnung;
GO

-- 8
SELECT m.Bezeichnung [Marke], t.Bezeichnung [Typ], b.Bezeichnung [Bike], b.Preis [Preis]
FROM Bike [b]
JOIN Marke [m] ON b.FK_Marke_Id = m.Marke_Id
JOIN Typ [t] ON b.FK_Typ_Id = t.Typ_Id
WHERE m.Bezeichnung = 'Wheeler'
ORDER BY b.Preis ASC;
GO

-- 10
SELECT m.Bezeichnung [Marke], COUNT(*) [Anzahl]
FROM Bike [b]
JOIN Marke [m] ON b.FK_Marke_Id = m.Marke_Id
GROUP BY m.Bezeichnung
ORDER BY m.Bezeichnung;
GO

-- 11
SELECT t.Bezeichnung [Typ], AVG(b.Preis) [Durchschnittspreis]
FROM Bike [b]
JOIN Typ [t] ON b.FK_Typ_Id = t.Typ_Id
WHERE t.Bezeichnung = 'E-Bike'
GROUP BY t.Bezeichnung;
GO

-- 12
SELECT Bezeichnung [Typ], COUNT(*) [Anzahl]
FROM Bike
GROUP BY Bezeichnung, FK_Typ_Id
HAVING FK_Typ_Id IN (SELECT Typ_Id FROM Typ)
ORDER BY COUNT(*) ASC;
GO

-- 13
SELECT t.Bezeichnung [Typ], COUNT(*) [Anzahl], ROUND(AVG(b.Preis), 2) [Durchschnittspreis]
FROM Bike [b]
JOIN Typ [t] ON b.FK_Typ_Id = t.Typ_Id
GROUP BY t.Bezeichnung, b.FK_Typ_Id
ORDER BY AVG(b.Preis) ASC;
GO

-- 14
SELECT m.Bezeichnung [Marke], COUNT(*) [Anzahl], MIN(b.Preis) [Minimum], AVG(b.Preis) [Durchschnittspreis], MAX(b.Preis) [Maximum], SUM(b.Preis) [Total]
FROM Bike [b]
JOIN Marke [m] ON b.FK_Marke_Id = m.Marke_Id
GROUP BY m.Bezeichnung
ORDER BY m.Bezeichnung;
GO

-- 15
SELECT m.Bezeichnung [Marke], COUNT(*) [Anzahl]
FROM Bike [b]
JOIN Marke [m] ON b.FK_Marke_Id = m.Marke_Id
JOIN Typ [t] ON b.FK_Typ_Id = t.Typ_Id
WHERE t.Bezeichnung = 'E-Bike'
GROUP BY m.Bezeichnung
ORDER BY COUNT(*) DESC;
GO

-- 16 
SELECT t.Bezeichnung [Typ]
FROM Typ [t]
LEFT JOIN Bike [b] ON t.Typ_Id = b.FK_Typ_Id
WHERE b.Bike_Id IS NULL;
GO

-- 17
SELECT  
    Bezeichnung, 
    (Preis / (1+0.081)) [Preis exklusive MwSt], 
    (Preis / (100+8.1) * 8.1) [MwSt], 
    Preis [Preis inklusive MwSt]
FROM Bike;
GO

-- 18
SELECT SUM(Preis * 0.1575) [Total]
FROM Bike;
GO

-- 19
SELECT ROUND(SUM((Preis + 80) * 0.1575), 2) [Gewinn]
FROM Bike;
GO

-- 20
SELECT m.Bezeichnung [Marke], t.Bezeichnung [Typ], b.Bezeichnung [Bike],
             b.Preis [Normalpreis],
             (b.Preis - 200) [Aktionspreis]
FROM Bike b
JOIN Marke m ON b.FK_Marke_Id = m.Marke_Id
JOIN Typ t ON b.FK_Typ_Id = t.Typ_Id
WHERE t.Bezeichnung <> 'Citybike'
    AND b.Preis > 1000
ORDER BY m.Bezeichnung, t.Bezeichnung, b.Bezeichnung;
GO

-- 21
SELECT t.Bezeichnung [Typ], b.Bezeichnung [Bike], m.Bezeichnung [Marke], b.Preis [Preis]
FROM Bike b
JOIN Typ t ON b.FK_Typ_Id = t.Typ_Id
JOIN Marke m ON b.FK_Marke_Id = m.Marke_Id
WHERE b.Preis = (SELECT MAX(Preis) FROM Bike WHERE FK_Typ_Id = b.FK_Typ_Id)
ORDER BY t.Bezeichnung, b.Bezeichnung;