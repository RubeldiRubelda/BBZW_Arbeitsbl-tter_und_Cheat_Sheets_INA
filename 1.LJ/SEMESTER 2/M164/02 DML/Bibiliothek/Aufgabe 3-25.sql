USE Bibliothek;
GO

-- 3 Verlage

SELECT * FROM Verlag;

INSERT INTO Verlag (Name, Hauptsitz) VALUES ('Diogenes Verlag', 'Zürich');
INSERT Verlag VALUES ('dtv', 'München');
INSERT INTO Verlag (Name) VALUES ('Suhrkamp');
INSERT INTO Verlag (Name, Hauptsitz) VALUES 
('Fischer Verlag', 'Frankfurt'),
('Reaclam', 'Stuttgart'),
('Kein & Aber Verlag', 'Zürich');
GO
SELECT * FROM Verlag;
GO

-- 4 Kategorien

SELECT * FROM Kategorie;
GO

INSERT INTO Kategorie (Bezeichnung, Beschreibung) VALUES 
('Fantasy', 'Fantastische Welten, Magie, Epen'),
('Satire', 'Humor, Gesellschaftskritik, Absurdes'),
('Dystopie', 'Unterdrückung, Totalitarismus, Zukunftsvisionen'),
('Klassiker', NULL),
('Philosophie', 'Grundfragen menschlichen Denkens'),
('Drama', 'Theaterliteratur, Tragödien, Konflikte');
GO

-- 5 Autoren

SELECT * FROM Autor;
GO

INSERT INTO Autor (Vorname, Nachname, Geburtsdatum) VALUES 
('Neil', 'Gaiman', '1960-11-10'),
('Terry', 'Pratchett', '1948-04-28'),
('John Ronald Reuel', 'Tolkien', '1892-01-03'),
('George', 'Orwell', '1903-06-25'),
('Platon', '', NULL),
('Antoine', 'de Saint-Exupéry', '1900-06-29'),
('William', 'Shakespeare', '1564-04-26');
GO


-- 6 Mitarbeiter

SELECT * FROM Mitarbeiter_in;
GO

INSERT INTO Mitarbeiter_in (Vorname, Nachname, Funktion) VALUES
('Tom', 'Lüthi', 'Bibliothekar/in'),
('Dominique', 'Aegerter', 'Bibliothekar/in'),
('Marc', 'Márquez', 'Lernende/r'),
('Valentino', 'Rossi', 'Leiter/in'),
('Fabio', 'Quartararo', 'Lernende/r');
GO

-- 7 Kunden

INSERT INTO Kunde (Vorname, Nachname) VALUES
('Max', 'Verstappen'),
('Lewis', 'Hamilton');
GO

INSERT INTO Kunde (Vorname, Nachname, Adresse, PLZ, Ort, Land) VALUES
('Charles', 'Leclerc', 'Marktplatz 4', '6210', 'Sursee', 'Schweiz'),
('Lando', 'Norris', 'Seestrasse 8', '6204', 'Sempach', 'Schweiz'),
('Carlos', 'Sainz', 'Dorfstrasse 11', '6208', 'Oberkirch', 'Schweiz'),
('George', 'Russell', 'Hauptstrasse 9', '6252', 'Dagmersellen', 'Schweiz'),
('Fernando', 'Alonso', 'Schulhausstrasse 7', '6206', 'Neuenkirch', 'Schweiz'),
('Sergio', 'Pérez', 'Kirchweg 5', '6130', 'Willisau', 'Schweiz');
GO

SELECT * FROM Kunde;
GO

-- 8 Bücher

SELECT Verlagsnummer FROM Verlag WHERE Name = 'Kein & Aber Verlag';
GO

INSERT INTO Buch (ISBN, Titel, Erscheinungsjahr, fk_Verlag_ID) VALUES
('9780552176453', 'Good Omens', 1990, (SELECT Verlagsnummer FROM Verlag WHERE Name = 'Kein & Aber Verlag')); -- Den Select Befehl in der VALUES-Klausel zu verwenden, ermöglicht es, die Verlagsnummer dynamisch zu ermitteln, ohne sie manuell eingeben zu müssen. Dadurch wird die Datenintegrität gewährleistet und Fehler bei der Eingabe vermieden. Immer in Klammern setzen, damit die Subquery korrekt ausgeführt wird.
GO

INSERT INTO Buch (ISBN, Titel, Erscheinungsjahr, fk_Verlag_ID) VALUES
('9780261102385', 'Der Herr der Ringe', 1954, (SELECT Verlagsnummer FROM Verlag WHERE Name = 'dtv')),
('9780451524935', '1984', 1949, (SELECT Verlagsnummer FROM Verlag WHERE Name = 'Suhrkamp')),
('9783150000014', 'Die Republik', -380, (SELECT Verlagsnummer FROM Verlag WHERE Name = 'Reaclam')),
('9780156012195', 'Der kleine Prinz', 1943, (SELECT Verlagsnummer FROM Verlag WHERE Name = 'Fischer Verlag')),
('9783150000021', 'Romeo und Julia', 1597, (SELECT Verlagsnummer FROM Verlag WHERE Name = 'Reaclam')),
('9783150000038', 'Hamlet', 1603, (SELECT Verlagsnummer FROM Verlag WHERE Name = 'Reaclam')),
('9783150000045', 'Ein Sommernachtstraum', 1595, (SELECT Verlagsnummer FROM Verlag WHERE Name = 'Reaclam'));
GO

SELECT * FROM Buch;
GO

-- 9 Bücher mit Autoren verknüpfen

SELECT
	(SELECT Buch_ID FROM Buch WHERE ISBN = '9780261102385') AS Buch_ID,
	(SELECT Autor_ID FROM Autor WHERE Nachname = 'Tolkien') AS Autor_ID;
GO

INSERT INTO [dbo].[Buch_Autor] (fk_Buch_ID, fk_Autor_ID) VALUES
((SELECT Buch_ID FROM Buch WHERE ISBN = '9780552176453'), (SELECT Autor_ID FROM Autor WHERE Nachname = 'Gaiman')),
((SELECT Buch_ID FROM Buch WHERE ISBN = '9780552176453'), (SELECT Autor_ID FROM Autor WHERE Nachname = 'Pratchett')),
((SELECT Buch_ID FROM Buch WHERE ISBN = '9780261102385'), (SELECT Autor_ID FROM Autor WHERE Nachname = 'Tolkien')),
((SELECT Buch_ID FROM Buch WHERE ISBN = '9780451524935'), (SELECT Autor_ID FROM Autor WHERE Nachname = 'Orwell')),
((SELECT Buch_ID FROM Buch WHERE ISBN = '9783150000014'), (SELECT Autor_ID FROM Autor WHERE Nachname = '')),
((SELECT Buch_ID FROM Buch WHERE ISBN = '9780156012195'), (SELECT Autor_ID FROM Autor WHERE Nachname = 'de Saint-Exupéry')),
((SELECT Buch_ID FROM Buch WHERE ISBN = '9783150000021'), (SELECT Autor_ID FROM Autor WHERE Nachname = 'Shakespeare')),
((SELECT Buch_ID FROM Buch WHERE ISBN = '9783150000038'), (SELECT Autor_ID FROM Autor WHERE Nachname = 'Shakespeare')),
((SELECT Buch_ID FROM Buch WHERE ISBN = '9783150000045'), (SELECT Autor_ID FROM Autor WHERE Nachname = 'Shakespeare'));
GO

SELECT *
FROM [dbo].[Buch_Autor] ba
JOIN Buch b ON b.Buch_ID = ba.fk_Buch_ID
JOIN Autor a ON a.Autor_ID = ba.fk_Autor_ID;
GO

-- 10 Bücher mit Kategorien verknüpfen

SELECT
	(SELECT Buch_ID FROM Buch WHERE Titel = 'Good Omens') AS Buch_ID,
	(SELECT Kategorie_ID FROM Kategorie WHERE Bezeichnung = 'Satire') AS Kategorie_ID;
GO

INSERT INTO [dbo].[Buch_Kategorie] (fk_Buch_ID, fk_Kategorie_ID) VALUES
(
	(SELECT Buch_ID FROM Buch WHERE Titel = 'Good Omens'),
	(SELECT Kategorie_ID FROM Kategorie WHERE Bezeichnung = 'Satire')
);
GO

INSERT INTO [dbo].[Buch_Kategorie] (fk_Buch_ID, fk_Kategorie_ID) VALUES
((SELECT Buch_ID FROM Buch WHERE Titel = 'Der Herr der Ringe'), (SELECT Kategorie_ID FROM Kategorie WHERE Bezeichnung = 'Fantasy')),
((SELECT Buch_ID FROM Buch WHERE Titel = '1984'), (SELECT Kategorie_ID FROM Kategorie WHERE Bezeichnung = 'Dystopie')),
((SELECT Buch_ID FROM Buch WHERE Titel = 'Die Republik'), (SELECT Kategorie_ID FROM Kategorie WHERE Bezeichnung = 'Philosophie')),
((SELECT Buch_ID FROM Buch WHERE Titel = 'Der kleine Prinz'), (SELECT Kategorie_ID FROM Kategorie WHERE Bezeichnung = 'Klassiker')),
((SELECT Buch_ID FROM Buch WHERE Titel = 'Romeo und Julia'), (SELECT Kategorie_ID FROM Kategorie WHERE Bezeichnung = 'Klassiker')),
((SELECT Buch_ID FROM Buch WHERE Titel = 'Romeo und Julia'), (SELECT Kategorie_ID FROM Kategorie WHERE Bezeichnung = 'Drama')),
((SELECT Buch_ID FROM Buch WHERE Titel = 'Hamlet'), (SELECT Kategorie_ID FROM Kategorie WHERE Bezeichnung = 'Klassiker')),
((SELECT Buch_ID FROM Buch WHERE Titel = 'Hamlet'), (SELECT Kategorie_ID FROM Kategorie WHERE Bezeichnung = 'Drama')),
((SELECT Buch_ID FROM Buch WHERE Titel = 'Ein Sommernachtstraum'), (SELECT Kategorie_ID FROM Kategorie WHERE Bezeichnung = 'Drama'));
GO

SELECT *
FROM [dbo].[Buch_Kategorie] bk
JOIN Buch b ON b.Buch_ID = bk.fk_Buch_ID
JOIN Kategorie k ON k.Kategorie_ID = bk.fk_Kategorie_ID; 
GO


-- 11 Reservationen erfinden und einfügen

INSERT INTO Buch_Kunde (fk_Buch_ID, fk_Kunde_ID, Enddatum) VALUES
((SELECT Buch_ID FROM Buch WHERE Titel = 'Good Omens'), (SELECT Kundennummer FROM Kunde WHERE Nachname = 'Hamilton'), DATEADD(DAY, 5, GETDATE())),
((SELECT Buch_ID FROM Buch WHERE Titel = 'Der Herr der Ringe'), (SELECT Kundennummer FROM Kunde WHERE Nachname = 'Verstappen'), DATEADD(DAY, 2, GETDATE()));
GO

SELECT * FROM Buch_Kunde;
GO


-- 12 Ausleihe/n erfinden und einfügen

INSERT INTO Ausleihe (fk_Buch_ID, fk_Kunde_ID, fk_Mitarbeiter_in_ID, Enddatum) VALUES
(
	(SELECT Buch_ID FROM Buch WHERE ISBN = '9780451524935'),
	(SELECT Kundennummer FROM Kunde WHERE Nachname = 'Leclerc'),
	(SELECT Personalnummer FROM Mitarbeiter_in WHERE Nachname = 'Lüthi'),
	DATEADD(DAY, 14, CAST(GETDATE() AS DATE))
);
GO

INSERT INTO Ausleihe (fk_Buch_ID, fk_Kunde_ID, fk_Mitarbeiter_in_ID, Startdatum, Enddatum) VALUES
(
	(SELECT Buch_ID FROM Buch WHERE ISBN = '9780451524935'),
	(SELECT Kundennummer FROM Kunde WHERE Nachname = 'Leclerc'),
	(SELECT Personalnummer FROM Mitarbeiter_in WHERE Nachname = 'Lüthi'),
	DATEADD(DAY, 14, CAST(GETDATE() AS DATE)),
	DATEADD(DAY, 28, CAST(GETDATE() AS DATE))
);
GO

SELECT *
FROM Ausleihe;
GO


-- 13 Strafgebühr auf 0 setzen

SELECT *
FROM Ausleihe;
GO

UPDATE Ausleihe SET Strafgebehr = 0;
GO

SELECT *
FROM Ausleihe;
GO


-- 14 Ausleihe Verlängern

SELECT * FROM Ausleihe;
GO

UPDATE Ausleihe SET Enddatum = DATEADD(DAY, 7, Enddatum);
GO

SELECT * FROM Ausleihe;
GO


-- 15 Erscheinungsjahr präzisieren

SELECT *
FROM Buch
WHERE ISBN = '9783150000014';
GO

UPDATE Buch
SET Erscheinungsjahr = -375
WHERE ISBN = '9783150000014';
GO

SELECT *
FROM Buch
WHERE ISBN = '9783150000014';
GO


-- 16 Beschreibung ergänzen

SELECT *
FROM Kategorie
WHERE Bezeichnung = 'Klassiker';
GO

UPDATE Kategorie
SET Beschreibung = 'Weltliteratur - bekannt über Generationen'
WHERE Bezeichnung = 'Klassiker';
GO

SELECT *
FROM Kategorie
WHERE Bezeichnung = 'Klassiker';
GO


-- 17 Hauptsitz ergänzen

SELECT * FROM Verlag;
GO

UPDATE Verlag
SET Hauptsitz = 'Berlin'
WHERE Name = 'Suhrkamp';
GO

SELECT * FROM Verlag;
GO


-- 18 Adressen aktualisieren

SELECT * FROM Kunde;
GO

UPDATE Kunde
SET Adresse = 'Bahnhofstrasse 25', PLZ = '6210', Ort = 'Sursee', Land = 'Schweiz'
WHERE Kundennummer = 1;

UPDATE Kunde
SET Adresse = 'Bahnhofstrasse 25', PLZ = '6210', Ort = 'Sursee', Land = 'Schweiz'
WHERE Nachname = 'Hamilton'
AND Vorname = 'Lewis';

SELECT * FROM Kunde;
GO

-- 19 Mitarbeiter befördern

SELECT * FROM Mitarbeiter_in;
GO

SELECT COUNT(*) FROM Mitarbeiter_in
WHERE Nachname = 'Lüthi'
AND Vorname = 'Tom';
GO

UPDATE Mitarbeiter_in
SET Funktion = 'Stv. Leiter/in'
WHERE Nachname = 'Lüthi'
AND Vorname = 'Tom';
GO

SELECT * FROM Mitarbeiter_in;
GO


-- 20 Reservation beenden

SELECT *
FROM Buch_Kunde
GO 

UPDATE Buch_Kunde
SET Enddatum = DATEADD(DAY, -1, CAST(GETDATE() AS DATE))
WHERE fk_Kunde_ID = (
	SELECT Kundennummer
	FROM Kunde
	WHERE Vorname = 'Max' AND Nachname = 'Verstappen'
)
AND fk_Buch_ID = (
	SELECT Buch_ID
	FROM Buch
	WHERE Titel = 'Good Omens'
)
AND Enddatum >= CAST(GETDATE() AS DATE);
GO

SELECT *
FROM Buch_Kunde;
GO


-- 21 Kunde löschen
-- Die Mitgliedschaft von Sergio Pérez ist abgelaufen.

-- Überprüfe vorher, dass nur ein Datensatz gelöscht wird
SELECT *
FROM Kunde
WHERE Vorname = 'Sergio';
GO

DELETE FROM Kunde
WHERE Vorname = 'Sergio';
GO

SELECT *
FROM Kunde;
GO


-- 22 Kunde überprüfen und löschen
-- Die Mitgliedschaft von Fernando Alonso ist abgelaufen.

-- Überprüfe vorher, dass nur ein Datensatz gelöscht wird
SELECT *
FROM Kunde
WHERE Vorname = 'Fernando'
AND Kundennummer NOT IN (SELECT fk_Kunde_ID FROM Buch_Kunde);
GO

DELETE FROM Kunde
WHERE Vorname = 'Fernando'
AND Kundennummer NOT IN (SELECT fk_Kunde_ID FROM Buch_Kunde);
GO

SELECT *
FROM Kunde;
GO


-- 23 Max und Lewis löschen
-- Die Kunden Max und Lewis haben sich in der Bibliothek unerledigt verhalten.
-- Der Leiter hat entschieden, dass beide aus der Tabelle «Kunde» gelöscht werden.

DELETE FROM Kunde
WHERE Vorname IN ('Max', 'Lewis');
GO

SELECT *
FROM Kunde;
GO


-- 24 Reservationen aufräumen
-- Die Datenbank soll bereinigt werden.
-- Löschen Sie alle Reservationen, die vor heute (mit Enddatum vor heute) sind.

DELETE FROM Buch_Kunde
WHERE Enddatum < CAST(GETDATE() AS DATE);
GO

SELECT *
FROM Buch_Kunde;
GO


-- 25 Buch überprüfen und löschen
-- Das Buch «Ein Sommernachtstraum» ist nicht mehr auffindbar.
-- Löschen Sie den Datensatz mit der ISBN.
-- Prüfe innerhalb der WHERE-Klausel, dass dieses Buch keine Autoren, Kategorien, Reservationen oder Ausleihzeiten zugewiesen sind.

/*
ERKLÄRUNG FÜR DEN LEITER:
Das Buch "Ein Sommernachtstraum" (ISBN 9783150000045) kann gelöscht werden, da:
1. Es in der Tabelle Buch_Autor nicht verknüpft ist (außer mit Shakespeare, welcher kein Problem darstellt)
2. Es in der Tabelle Buch_Kategorie als Drama verknüpft ist - aber diese Verknüpfung wird durch die DELETE-Bedingung gewährleistet
3. Es keine aktiven Reservationen in Buch_Kunde hat (da diese in Aufgabe 24 bereinigt wurden)
4. Es keine aktiven Ausleihzeiten in Ausleihe hat

Die WHERE-Klausel stellt sicher, dass nur Bücher gelöscht werden, die KEINE dieser Abhängigkeiten haben.
*/

DELETE FROM Buch
WHERE ISBN = '9783150000045'
AND Buch_ID NOT IN (SELECT fk_Buch_ID FROM Buch_Autor)
AND Buch_ID NOT IN (SELECT fk_Buch_ID FROM Buch_Kategorie)
AND Buch_ID NOT IN (SELECT fk_Buch_ID FROM Buch_Kunde)
AND Buch_ID NOT IN (SELECT fk_Buch_ID FROM Ausleihe);
GO

SELECT *
FROM Buch;
GO