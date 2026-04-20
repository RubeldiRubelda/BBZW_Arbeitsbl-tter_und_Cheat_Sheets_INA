-- INSERT fügt neue Zeilen in eine Tabelle ein
    -- Syntax
    INSERT INTO <Tabelle> VALUES ("<Value 1>", "<Value 2>");
    INSERT INTO <Tabelle>(<Feld 1>, <Feld 2>) VALUES ("<Value 1>", "<Value 2>");
    INSERT INTO <Tabelle> VALUES 
    ("<Value 1>", "<Value 2>"),
    ("<Value 1>", "<Value 2>"),
    ("<Value 1>", "<Value 2>");

    -- Beispiele
    INSERT INTO Autor VALUES ('Neil', 'Gaiman', '1960-11-10');
    INSERT INTO Autor (Vorname, Nachname, Geburtsdatum) VALUES ('Neil', 'Gaiman', '1960-11-10');
    INSERT INTO Autor VALUES 
    ('Neil', 'Gaiman', '1960-11-10'),
    ('Terry', 'Pratchett', '1948-04-28'),
    ('John Ronald Reuel', 'Tolkien', '1892-01-03'),

-- UPDATE ändert bestehende Zeilen in einer Tabelle
    -- Syntax 
    UPDATE <Tabelle>
    SET <Spalte 1> = <value1>, <column2> = <value2>
    WHERE <Kondition>; 

    -- Beispiele
    UPDATE Mitarbeiter_in
    SET Funktion = 'Stv. Leiter/in'
    WHERE Nachname = 'Lüthi';

-- DELETE löscht Zeilen aus einer Tabelle
    -- Syntax
    DELETE FROM <Tabelle> 
    WHERE <Kondition>;

    -- Beispiele
    DELETE FROM Kunde
    WHERE Vorname = 'Sergio';
