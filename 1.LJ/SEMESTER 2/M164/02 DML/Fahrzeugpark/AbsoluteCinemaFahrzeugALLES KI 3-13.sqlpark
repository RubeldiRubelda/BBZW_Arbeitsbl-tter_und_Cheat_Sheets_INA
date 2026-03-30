-- Hallo liebes Gemini, ich habe dir eine PDF datei mit all deinen Aufgaben in den Ordner gepackt. Leg einfach los!

-- Hier SQL für Aufgabe 1
USE Fahrzeugpark
GO
INSERT INTO Mitarbeiter (Nachname, Vorname)
VALUES ('Cuche', 'Didier'),
         ('Feuz', 'Beat'),
         ('Figini', 'Michela'),
         ('Gut-Behrami', 'Lara'),
         ('Heinzer', 'Franz'),
         ('Hess', 'Erika'),
         ('Janka', 'Carlo'),
         ('Müller', 'Peter'),
         ('Nadig', 'Marie-Theres'),
         ('Odermatt', 'Marco'),
         ('Schneider', 'Vreni'),
         ('Zurbriggen', 'Pirmin');
GO

SELECT * FROM Mitarbeiter

-- Hier SQL für Aufgabe 2
INSERT INTO Fahrzeug (Marke, Typ, Neupreis, Jahrgang, Occasion)
VALUES ('Ford', 'Model T', 825.00, 1908, 0),
         ('Volkswagen', 'Käfer', 5000.00, 1938, 1),
         ('Chevrolet', 'Corvette C1', 3500.00, 1953, 1),
         ('Mercedes-Benz', '300 SL Flügeltürer', 29000.00, 1954, 1),
         ('Mini', 'Mini Cooper', 497.00, 1959, 1),
         ('Jaguar', 'E-Type', 2250.00, 1961, 1),
         ('Ferrari', '250 GTO', 18000.00, 1962, 0),
         ('Porsche', '911', 14500.00, 1964, 1),
         ('Ford', 'Mustang', 2368.00, 1964, 0),
         ('Lamborghini', 'Miura', 20000.00, 1966, 0),
         ('Toyota', 'Corolla (erste Generation)', 1100.00, 1966, 1),
         ('Toyota', 'Prius (erste Generation)', 35000.00, 1997, 0);
GO

SELECT * FROM Fahrzeug
SELECT * FROM Mitarbeiter

-- Hier SQL für Aufgabe 3
-- Beat Feuz den «Käfer» zuweisen
UPDATE Fahrzeug
SET fk_Mitarbeiter_ID = (SELECT Mitarbeiter_ID FROM Mitarbeiter WHERE Nachname = 'Feuz' AND Vorname = 'Beat')
WHERE Marke = 'Volkswagen' AND Typ = 'Käfer';
GO
-- Didier Cuche alle Fahrzeuge von «Ford» zuweisen
UPDATE Fahrzeug
SET fk_Mitarbeiter_ID = (SELECT Mitarbeiter_ID FROM Mitarbeiter WHERE Nachname = 'Cuche' AND Vorname = 'Didier')
WHERE Marke = 'Ford';
GO
-- Anzahl der angepassten Datensätze für Didier Cuche
SELECT COUNT(*) AS AnzahlAngepassteDatensaetze
FROM Fahrzeug
WHERE fk_Mitarbeiter_ID = (SELECT Mitarbeiter_ID FROM Mitarbeiter WHERE Nachname = 'Cuche' AND Vorname = 'Didier');


------ 
------

-- Variante 1: Verwendung der Spalte «Fahrzeug_ID»
UPDATE Fahrzeug
SET fk_Mitarbeiter_ID = (SELECT Mitarbeiter_ID FROM Mitarbeiter WHERE Nachname = 'Feuz' AND Vorname = 'Beat')
WHERE Fahrzeug_ID = 2;
GO
UPDATE Fahrzeug
SET fk_Mitarbeiter_ID = NULL
WHERE Fahrzeug_ID = 5;  
GO
-- Variante 2: Verwendung der Spalte «Typ»
UPDATE Fahrzeug
SET fk_Mitarbeiter_ID = (SELECT Mitarbeiter_ID FROM Mitarbeiter WHERE Nachname = 'Feuz' AND Vorname = 'Beat')
WHERE Typ = 'Mini Cooper';
GO
UPDATE Fahrzeug
SET fk_Mitarbeiter_ID = NULL
WHERE Typ = 'Käfer';

GO
-- Variante 3: Verwendung einer Unterabfrage
UPDATE Fahrzeug
SET fk_Mitarbeiter_ID = (SELECT Mitarbeiter_ID FROM Mitarbeiter WHERE Nachname = 'Feuz' AND Vorname = 'Beat')
WHERE Fahrzeug_ID = (SELECT Fahrzeug_ID FROM Fahrzeug WHERE Typ = 'Mini Cooper');
GO
UPDATE Fahrzeug
SET fk_Mitarbeiter_ID = NULL
WHERE Fahrzeug_ID = (SELECT Fahrzeug_ID FROM Fahrzeug WHERE Typ = 'Käfer');
GO
-- Überprüfen der Aktualisierungen
SELECT * FROM Fahrzeug  


-- Anzahl der zu löschenden Datensätze überprüfen
SELECT COUNT(*) AS AnzahlZuLoeschendeDatensaetze
FROM Fahrzeug
WHERE Marke = 'Toyota';
-- Alle Fahrzeuge von «Toyota» löschen
DELETE FROM Fahrzeug
WHERE Marke = 'Toyota';
GO
-- Neues Fahrzeug hinzufügen
INSERT INTO Fahrzeug (Marke, Typ, Neupreis, Jahrgang, Occasion)
VALUES ('Lamborghini', 'Diablo', 285000.00, 1990, 1);
GO


-- Spalte für Kennzeichen hinzufügen
ALTER TABLE Fahrzeug
ADD Kennzeichen VARCHAR(20);
GO
-- Kennzeichen für Model T hinzufügen
UPDATE Fahrzeug
SET Kennzeichen = 'LU 777'
WHERE Typ = 'Model T';
GO
-- Kennzeichen für Mustang hinzufügen
UPDATE Fahrzeug
SET Kennzeichen = 'LU 64'
WHERE Typ = 'Mustang';
GO
-- Kennzeichen für Mini Cooper hinzufügen
UPDATE Fahrzeug
SET Kennzeichen = 'LU 150'
WHERE Typ = 'Mini Cooper';
GO

-- Alle Fahrzeuge mit Kennzeichen anzeigen
SELECT * FROM Fahrzeug WHERE Kennzeichen IS NOT NULL;





-- Anzahl der zu löschenden Datensätze überprüfen
SELECT COUNT(*) AS AnzahlZuLoeschendeDatensaetze
FROM Fahrzeug
WHERE fk_Mitarbeiter_ID = (SELECT Mitarbeiter_ID FROM Mitarbeiter WHERE Nachname = 'Feuz' AND Vorname = 'Beat');
-- Alle Fahrzeuge von Beat Feuz auf NULL setzen
UPDATE Fahrzeug
SET fk_Mitarbeiter_ID = NULL
WHERE fk_Mitarbeiter_ID = (SELECT Mitarbeiter_ID FROM Mitarbeiter WHERE Nachname = 'Feuz' AND Vorname = 'Beat');
GO
-- Beat Feuz aus der Tabelle «Mitarbeiter» löschen
DELETE FROM Mitarbeiter
WHERE Nachname = 'Feuz' AND Vorname = 'Beat';
GO
-- Überprüfen des Ergebnisses
SELECT * FROM Mitarbeiter
SELECT * FROM Fahrzeug



USE Fahrzeugpark
GO

-- Spalte für Zeitwert hinzufügen
ALTER TABLE Fahrzeug
ADD Zeitwert DECIMAL(10, 2);
GO
-- Zeitwert mit Neupreis initialisieren 
UPDATE Fahrzeug
SET Zeitwert = Neupreis;
GO
-- Überprüfen des Ergebnisses
SELECT * FROM Fahrzeug





-- Zeitwert basierend auf dem Alter des Fahrzeugs aktualisieren
UPDATE Fahrzeug
SET Zeitwert = CASE 
    WHEN YEAR(GETDATE()) - Jahrgang < 6 THEN Neupreis * 0.50
    WHEN YEAR(GETDATE()) - Jahrgang BETWEEN 6 AND 25 THEN Neupreis * 0.10
    WHEN YEAR(GETDATE()) - Jahrgang BETWEEN 26 AND 50 THEN Neupreis * 3.00
    WHEN YEAR(GETDATE()) - Jahrgang BETWEEN 51 AND 75 THEN Neupreis * 10.00
    WHEN YEAR(GETDATE()) - Jahrgang BETWEEN 76 AND 100 THEN Neupreis * 100.00
    ELSE Neupreis * 1000.00
END;    
GO
-- Überprüfen des Ergebnisses
SELECT * FROM Fahrzeug


USE Fahrzeugpark
GO
-- Ufgahb 12: Alle Occasionen mit einem Zeitwert über 100'000 CHF um 20% reduzieren
SELECT COUNT(*) AS AnzahlZuAktualisierendeDatensaetze
FROM Fahrzeug
WHERE Occasion = 1 AND Zeitwert > 100000;

UPDATE Fahrzeug
SET Zeitwert = Zeitwert * 0.80
WHERE Occasion = 1 AND Zeitwert > 100000;


-- Ufgahb 13: Selbstkontrollah!

SELECT * FROM Mitarbeiter
SELECT * FROM Fahrzeug

-- Remove Fahrzeug_ID 14 from Fahrzeug table
DELETE FROM Fahrzeug
WHERE Fahrzeug_ID = 14;
