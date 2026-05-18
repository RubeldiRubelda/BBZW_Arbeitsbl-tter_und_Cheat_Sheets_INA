USE Stundenplan;
GO

-- 2 
Select * from Fach;
GO

-- 3
SELECT Firmenname FROM Lehrbetrieb;
GO

-- 4
SELECT TOP 10 
    Vorname, 
    Nachname 
FROM Lernender
ORDER BY Nachname, Vorname;
GO

-- 5
SELECT Firmenname, Vorname, Nachname 
FROM Lernender AS l
JOIN Lehrbetrieb AS b ON l.FK_Lehrbetrieb_Id = b.Lehrbetrieb_Id
ORDER BY Firmenname, Nachname, Vorname;
GO

-- 6
SELECT k.Bezeichnung AS Klasse, CONCAT(l.Vorname, ' ', l.Nachname) AS Lerperson
FROM Klasse AS k
JOIN Lehrperson AS l ON k.FK_Lehrperson_Id = l.Lehrperson_Id;
GO

-- 7
SELECT k.Bezeichnung AS Klasse,
       l.Nachname AS Nachname,
       l.Vorname AS Vorname
FROM Lernender AS l
JOIN Lernender_Klasse AS lk ON l.Lernender_Id = lk.FK_Lernender_Id
JOIN Klasse AS k ON lk.FK_Klasse_Id = k.Klasse_Id
ORDER BY k.Bezeichnung, l.Nachname, l.Vorname;
GO

-- 8 
SELECT CONCAT(l.Vorname, ' ', l.Nachname) AS [Klassenliste EDB47a]
FROM Lernender AS l
JOIN Lernender_Klasse AS lk ON l.Lernender_Id = lk.FK_Lernender_Id
JOIN Klasse AS k ON lk.FK_Klasse_Id = k.Klasse_Id
WHERE k.Bezeichnung = 'EDB47a'
ORDER BY l.Nachname, l.Vorname;
GO

-- 9
SELECT k.Bezeichnung AS Klasse,
       COUNT(lk.FK_Lernender_Id) AS [Anzahl Lernende]
FROM Klasse AS k
LEFT JOIN Lernender_Klasse AS lk ON k.Klasse_Id = lk.FK_Klasse_Id
GROUP BY k.Bezeichnung
ORDER BY COUNT(lk.FK_Lernender_Id) DESC, k.Bezeichnung;
GO

-- 10
SELECT CONCAT(l.Vorname, ' ', l.Nachname) AS Fachlehrperson,
       COUNT(DISTINCT kf.FK_Fach_Id) AS [Anzahl Fächer]
FROM Lehrperson AS l
LEFT JOIN Klasse_Fach AS kf ON l.Lehrperson_Id = kf.FK_Lehrperson_Id
GROUP BY l.Lehrperson_Id, l.Vorname, l.Nachname
ORDER BY COUNT(DISTINCT kf.FK_Fach_Id) DESC, l.Nachname, l.Vorname;
GO

-- 11
SELECT DISTINCT f.Kurzbezeichnung,
                f.Langbezeichnung AS Fach
FROM Fach AS f
JOIN Klasse_Fach AS kf ON f.Fach_Id = kf.FK_Fach_Id
JOIN Klasse AS k ON kf.FK_Klasse_Id = k.Klasse_Id
WHERE k.Bezeichnung LIKE 'INP47%'
ORDER BY f.Kurzbezeichnung;
GO

-- 12
SELECT f.Langbezeichnung AS Fach,
       CONCAT(l.Vorname, ' ', l.Nachname) AS Lehrperson,
       r.Bezeichnung AS Zimmer
FROM Klasse_Fach AS kf
JOIN Klasse AS k ON kf.FK_Klasse_Id = k.Klasse_Id
JOIN Fach AS f ON kf.FK_Fach_Id = f.Fach_Id
JOIN Lehrperson AS l ON kf.FK_Lehrperson_Id = l.Lehrperson_Id
JOIN Raum AS r ON kf.FK_Raum_Id = r.Raum_Id
WHERE k.Bezeichnung = 'MMA47a'
ORDER BY f.Langbezeichnung;
GO

-- 13
SELECT l.Lernender_Id,
       l.Nachname,
       l.Vorname
FROM Lernender AS l
LEFT JOIN Lernender_Klasse AS lk ON l.Lernender_Id = lk.FK_Lernender_Id
WHERE lk.FK_Lernender_Id IS NULL
ORDER BY l.Nachname, l.Vorname;
GO

-- 14
SELECT l.Lehrperson_Id,
       l.Nachname,
       l.Vorname
FROM Lehrperson AS l
LEFT JOIN Klasse_Fach AS kf ON l.Lehrperson_Id = kf.FK_Lehrperson_Id
WHERE kf.FK_Lehrperson_Id IS NULL
ORDER BY l.Nachname, l.Vorname;
GO

-- 15
SELECT k.Bezeichnung AS Klasse
FROM Klasse AS k
LEFT JOIN Klasse_Fach AS kf ON k.Klasse_Id = kf.FK_Klasse_Id
GROUP BY k.Klasse_Id, k.Bezeichnung
HAVING COUNT(kf.KlasseFach_Id) = 0
ORDER BY k.Bezeichnung;
GO

-- 16
SELECT l.Lernender_Id,
       CONCAT(l.Vorname, ' ', l.Nachname) AS [Lernende/r],
       COUNT(DISTINCT lk.FK_Klasse_Id) AS [Anzahl Klassen]
FROM Lernender AS l
JOIN Lernender_Klasse AS lk ON l.Lernender_Id = lk.FK_Lernender_Id
GROUP BY l.Lernender_Id, l.Vorname, l.Nachname
HAVING COUNT(DISTINCT lk.FK_Klasse_Id) > 1
ORDER BY COUNT(DISTINCT lk.FK_Klasse_Id) DESC, l.Nachname, l.Vorname;
GO

-- 17
SELECT  l.Lernender_Id,
        l.Nachname,
        l.Vorname
FROM Lernender AS l
WHERE l.FK_Lehrbetrieb_Id IS NULL
ORDER BY l.Nachname, l.Vorname;
GO

-- 18
SELECT k.Bezeichnung AS Klasse,
       COUNT(lk.FK_Lernender_Id) AS [Anzahl Lernende]
FROM Klasse AS k
LEFT JOIN Lernender_Klasse AS lk ON k.Klasse_Id = lk.FK_Klasse_Id
GROUP BY k.Klasse_Id, k.Bezeichnung
HAVING COUNT(lk.FK_Lernender_Id) NOT BETWEEN 13 AND 24
ORDER BY COUNT(lk.FK_Lernender_Id) DESC, k.Bezeichnung;
GO

