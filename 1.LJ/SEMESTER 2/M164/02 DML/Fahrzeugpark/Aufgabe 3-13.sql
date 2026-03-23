USE Fahrzeugpark;

-- 3 Mitarbeiter Einfügen

INSERT INTO Mitarbeiter (Nachname, Vorname) VALUES ('Cuche', 'Didier');
INSERT INTO Mitarbeiter (Nachname, Vorname) VALUES ('Feuz', 'Beat');
INSERT INTO Mitarbeiter (Nachname, Vorname) VALUES ('Figini', 'Michela');
INSERT INTO Mitarbeiter (Nachname, Vorname) VALUES ('Gut-Behrami', 'Lara');
INSERT INTO Mitarbeiter (Nachname, Vorname) VALUES ('Heinzer', 'Franz');
INSERT INTO Mitarbeiter (Nachname, Vorname) VALUES ('Hess', 'Erika');
INSERT INTO Mitarbeiter (Nachname, Vorname) VALUES ('Janka', 'Carlo');
INSERT INTO Mitarbeiter (Nachname, Vorname) VALUES ('Müller', 'Peter');
INSERT INTO Mitarbeiter (Nachname, Vorname) VALUES ('Nadig', 'Marie-Theres');
INSERT INTO Mitarbeiter (Nachname, Vorname) VALUES ('Odermatt', 'Marco');
INSERT INTO Mitarbeiter (Nachname, Vorname) VALUES ('Schneider', 'Vreni');
INSERT INTO Mitarbeiter (Nachname, Vorname) VALUES ('Zurbriggen', 'Pirmin');

SELECT * FROM Mitarbeiter;
GO


-- 4 Fahrzeuge Einfügen

INSERT INTO Fahrzeug (Marke, Typ, Neupreis, Jahrgang, Occasion) VALUES 
('Ford', 'Model T', 825.00, 1908, 0),
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

SELECT * FROM Fahrzeug;


-- 5 Mitarbeiter und Fahrzeuge verknüpfen

SELECT * FROM Fahrzeug;

UPDATE Fahrzeug 
SET fk_Mitarbeiter_ID = (SELECT Mitarbeiter_ID FROM Mitarbeiter WHERE Nachname = 'Feuz' AND Vorname = 'Beat')
WHERE Typ = 'Käfer';

UPDATE Fahrzeug
SET fk_Mitarbeiter_ID = (SELECT Mitarbeiter_ID FROM Mitarbeiter WHERE Nachname = 'Cuche' AND Vorname = 'Didier')
WHERE Marke = 'Ford';

SELECT * FROM Fahrzeug;


-- 6 Ersatzfahrzeug zuweisen

SELECT * FROM Fahrzeug WHERE fk_Mitarbeiter_ID IS NULL;

UPDATE Fahrzeug
SET fk_Mitarbeiter_ID = (SELECT Mitarbeiter_ID FROM Mitarbeiter WHERE Nachname = 'Feuz' AND Vorname = 'Beat')
WHERE Typ = 'Mini Cooper';

SELECT * FROM Fahrzeug;


-- 7 Fahrzeuge verkaufen und kaufen

DELETE FROM Fahrzeug
WHERE Marke = 'Toyota';

INSERT INTO Fahrzeug (Marke, Typ, Neupreis, Jahrgang, Occasion) VALUES 
('Lamborghini', 'Diablo', 235000.00, 1990, 1);

SELECT * FROM Fahrzeug;


-- 8 Kennzeichen hinzufügen

ALTER TABLE Fahrzeug ADD Kennzeichen VARCHAR(50);

UPDATE Fahrzeug
SET Kennzeichen = 'LU 777'
WHERE Typ = 'Model T';

UPDATE Fahrzeug
SET Kennzeichen = 'LU 64'
WHERE Typ = 'Mustang';

UPDATE Fahrzeug
SET Kennzeichen = 'LU 150'
WHERE Typ = 'Mini Cooper';

UPDATE Fahrzeug
SET Kennzeichen = 'NW 100'
WHERE Typ = '911';

SELECT * FROM Fahrzeug;


-- 9 Mitarbeiter löschen

SELECT * FROM Fahrzeug WHERE fk_Mitarbeiter_ID = (SELECT Mitarbeiter_ID FROM Mitarbeiter WHERE Nachname = 'Feuz' AND Vorname = 'Beat');

UPDATE Fahrzeug
SET fk_Mitarbeiter_ID = NULL
WHERE fk_Mitarbeiter_ID = (SELECT Mitarbeiter_ID FROM Mitarbeiter WHERE Nachname = 'Feuz' AND Vorname = 'Beat');

DELETE FROM Mitarbeiter
WHERE Nachname = 'Feuz' AND Vorname = 'Beat';

SELECT * FROM Mitarbeiter;


-- 10 Zeitwert erfassen

ALTER TABLE Fahrzeug ADD Zeitwert DECIMAL(10, 2);

UPDATE Fahrzeug
SET Zeitwert = Neupreis;

SELECT * FROM Fahrzeug;


-- 11 Zeitwert anpassen

UPDATE Fahrzeug
SET Zeitwert = CASE
	WHEN YEAR(GETDATE()) - Jahrgang < 6 THEN Neupreis * 0.5
	WHEN YEAR(GETDATE()) - Jahrgang BETWEEN 6 AND 25 THEN Neupreis * 0.1
	WHEN YEAR(GETDATE()) - Jahrgang BETWEEN 26 AND 50 THEN Neupreis * 3
	WHEN YEAR(GETDATE()) - Jahrgang BETWEEN 51 AND 75 THEN Neupreis * 10
	WHEN YEAR(GETDATE()) - Jahrgang BETWEEN 76 AND 100 THEN Neupreis * 100
	ELSE Neupreis * 1000000
END;

SELECT * FROM Fahrzeug;


-- 12 Occasionsfahrzeuge justieren

UPDATE Fahrzeug
SET Zeitwert = Zeitwert * 0.8
WHERE Occasion = 1 AND Zeitwert > 100000;

-- 13 Selbstkontrolle

SELECT * FROM Mitarbeiter;

SELECT * FROM Fahrzeug;
