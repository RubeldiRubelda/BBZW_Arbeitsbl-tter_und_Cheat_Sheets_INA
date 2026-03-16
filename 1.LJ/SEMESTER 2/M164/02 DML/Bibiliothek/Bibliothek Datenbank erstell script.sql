
---------------------------------------------------------------------------
-- T-SQL Bibliothek: Aufgabe 3
---------------------------------------------------------------------------
USE master;
GO
DROP DATABASE IF EXISTS Bibliothek;
GO
CREATE DATABASE Bibliothek;
GO
USE Bibliothek;
GO

---------------------------------------------------------------------------
-- T-SQL Bibliothek: Aufgabe 4
---------------------------------------------------------------------------

-- Tabelle Autor
CREATE TABLE Autor (
    Autor_ID        INTEGER IDENTITY(1,1) NOT NULL,
    Vorname         NVARCHAR(100)         NOT NULL,
    Nachname        NVARCHAR(100)         NOT NULL,
    Geburtsdatum    DATE                  NULL,
    CONSTRAINT PK_Autor
        PRIMARY KEY (Autor_ID)
);

-- Tabelle Verlag
CREATE TABLE Verlag (
    Verlagsnummer   INTEGER IDENTITY(1,1) NOT NULL,
    Name            NVARCHAR(200)         NOT NULL,
    Hauptsitz       NVARCHAR(200)         NULL,
    CONSTRAINT PK_Verlag
        PRIMARY KEY (Verlagsnummer)
);

-- Tabelle Kategorie (Startzustand)
CREATE TABLE Kategorie (
    Bezeichnung     NVARCHAR(20)  NOT NULL,
    Beschreibung    NVARCHAR(500) NULL,
    CONSTRAINT PK_Kategorie
        PRIMARY KEY (Bezeichnung)
);

-- Tabelle Mitarbeiter_in
CREATE TABLE Mitarbeiter_in (
    Personalnummer  INTEGER IDENTITY(1,1) NOT NULL,
    Vorname         NVARCHAR(100)         NOT NULL,
    Nachname        NVARCHAR(100)         NOT NULL,
    Funktion        NVARCHAR(100)         NULL,
    CONSTRAINT PK_Mitarbeiter_in
        PRIMARY KEY (Personalnummer)
);

-- Tabelle Kunde
CREATE TABLE Kunde (
    Kundennummer    INTEGER IDENTITY(1,1) NOT NULL,
    Vorname         NVARCHAR(100)         NOT NULL,
    Nachname        NVARCHAR(100)         NOT NULL,
    Adresse         NVARCHAR(200)         NULL,
    PLZ             NVARCHAR(10)          NULL,
    Ort             NVARCHAR(100)         NULL,
    Land            NVARCHAR(100)         NULL,
    CONSTRAINT PK_Kunde
        PRIMARY KEY (Kundennummer)
);
GO

-- Tabelle Buch
CREATE TABLE Buch (
    Buch_ID             INTEGER IDENTITY(1,1) NOT NULL,
    ISBN                NVARCHAR(13)          NOT NULL,
--  ISBN                NVARCHAR(17)          NOT NULL, -- mit Trennzeichen
    Titel               NVARCHAR(200)         NOT NULL,
    Jahr                INTEGER               NULL,
    fk_Verlag_ID        INTEGER               NOT NULL,
    CONSTRAINT PK_Buch
        PRIMARY KEY (Buch_ID),
    CONSTRAINT FK_Buch_Verlag
        FOREIGN KEY (fk_Verlag_ID)
        REFERENCES Verlag (Verlagsnummer)
);
GO

-- Tabelle Ausleihe
CREATE TABLE Ausleihe (
    Ausleihe_ID             INTEGER IDENTITY(1,1) NOT NULL,
    fk_Buch_ID              INTEGER               NOT NULL,
    fk_Kunde_ID             INTEGER               NOT NULL,
    fk_Mitarbeiter_in_ID    INTEGER               NOT NULL,
    Startdatum              DATE                  NOT NULL,
    Enddatum                DATE                  NOT NULL,
    Strafgebehr             NUMERIC(9,2)          NULL,
    CONSTRAINT PK_Ausleihe
        PRIMARY KEY (Ausleihe_ID),
    CONSTRAINT FK_Ausleihe_Buch
        FOREIGN KEY (fk_Buch_ID)
        REFERENCES Buch (Buch_ID),
    CONSTRAINT FK_Ausleihe_Kunde
        FOREIGN KEY (fk_Kunde_ID)
        REFERENCES Kunde (Kundennummer),
    CONSTRAINT FK_Ausleihe_Mitarbeiter_in
        FOREIGN KEY (fk_Mitarbeiter_in_ID)
        REFERENCES Mitarbeiter_in (Personalnummer)
);
GO

---------------------------------------------------------------------------
-- T-SQL Bibliothek: Aufgabe 5
---------------------------------------------------------------------------

-- Tabelle Buch_Autor (schreibt) � zusammengesetzter Prim�rschl�ssel
CREATE TABLE Buch_Autor (
    fk_Buch_ID  INTEGER NOT NULL,
    fk_Autor_ID INTEGER NOT NULL,
    CONSTRAINT PK_Buch_Autor
        PRIMARY KEY (fk_Buch_ID, fk_Autor_ID)
);

-- Tabelle Buch_Kategorie (geh�rt zu) � zusammengesetzter Prim�rschl�ssel
CREATE TABLE Buch_Kategorie (
    fk_Buch_ID          INTEGER       NOT NULL,
    fk_Kategorie_Bez    NVARCHAR(20)  NOT NULL,
    CONSTRAINT PK_Buch_Kategorie
        PRIMARY KEY (fk_Buch_ID, fk_Kategorie_Bez)
);

-- Tabelle Buch_Kunde (reserviert)
-- Kunde kann mehrfach reservieren -> Startdatum ist Teil des Prim�rschl�ssels
-- (stattdessen w�re auch ein eigenst�ndiger PK bspw. Reservation_ID m�glich)
CREATE TABLE Buch_Kunde (
    fk_Buch_ID      INTEGER   NOT NULL,
    fk_Kunde_ID     INTEGER   NOT NULL,
    Startdatum      DATE      NOT NULL,
    Enddatum        DATE      NOT NULL,
    CONSTRAINT PK_Buch_Kunde
        PRIMARY KEY (fk_Buch_ID, fk_Kunde_ID, Startdatum)
);
GO

---------------------------------------------------------------------------
-- T-SQL Bibliothek: Aufgabe 6
---------------------------------------------------------------------------
ALTER TABLE Buch_Autor
    ADD 
        CONSTRAINT FK_BuchAutor_Buch
            FOREIGN KEY (fk_Buch_ID)  REFERENCES Buch (Buch_ID),
        CONSTRAINT FK_BuchAutor_Autor
            FOREIGN KEY (fk_Autor_ID) REFERENCES Autor (Autor_ID);

ALTER TABLE Buch_Kategorie
    ADD CONSTRAINT FK_BuchKategorie_Buch
        FOREIGN KEY (fk_Buch_ID) REFERENCES Buch (Buch_ID);

ALTER TABLE Buch_Kunde
    ADD 
        CONSTRAINT FK_BuchKunde_Buch
            FOREIGN KEY (fk_Buch_ID)  REFERENCES Buch (Buch_ID),
        CONSTRAINT FK_BuchKunde_Kunde
            FOREIGN KEY (fk_Kunde_ID) REFERENCES Kunde (Kundennummer);
GO

---------------------------------------------------------------------------
-- T-SQL Bibliothek: Aufgabe 7
---------------------------------------------------------------------------

-- FK von Buch_Kategorie auf Kategorie entfernen
-- (der ALTER TABLE Befehl ist f�r das Modul 164 ausreichend)
IF EXISTS (
    SELECT fk.name
    FROM sys.foreign_keys fk
    WHERE fk.parent_object_id = OBJECT_ID('Buch_Kategorie')
      AND fk.referenced_object_id = OBJECT_ID('Kategorie')
)
BEGIN
    ALTER TABLE Buch_Kategorie DROP CONSTRAINT FK_BuchKategorie_Kategorie;
END
GO

-- Prim�rschl�ssel von Kategorie entfernen
ALTER TABLE Kategorie DROP CONSTRAINT PK_Kategorie;
GO

-- Neue Identit�tsspalte hinzuf�gen und als Prim�rschl�ssel definieren
ALTER TABLE Kategorie
    ADD 
        Kategorie_ID INTEGER IDENTITY(1,1) NOT NULL,
        CONSTRAINT PK_Kategorie
            PRIMARY KEY (Kategorie_ID);
GO

-- Alten Prim�rschl�ssel und alte FK-Spalte von Buch_Kategorie entfernen
ALTER TABLE Buch_Kategorie
    DROP 
        CONSTRAINT PK_Buch_Kategorie,
        COLUMN fk_Kategorie_Bez;
GO

-- Neue FK-Spalte mit Referenz und neuen PK zu Buch_Kategorie hinzuf�gen
ALTER TABLE Buch_Kategorie
    ADD 
        fk_Kategorie_ID INTEGER NOT NULL,
        CONSTRAINT FK_BuchKategorie_Kategorie
            FOREIGN KEY (fk_Kategorie_ID)
                REFERENCES Kategorie (Kategorie_ID),
        CONSTRAINT PK_Buch_Kategorie
            PRIMARY KEY (fk_Buch_ID, fk_Kategorie_ID);
GO

---------------------------------------------------------------------------
-- T-SQL Bibliothek: Aufgabe 8
---------------------------------------------------------------------------
EXEC sp_rename
    'Buch.Jahr',
    'Erscheinungsjahr',
    'COLUMN';
GO

---------------------------------------------------------------------------
-- T-SQL Bibliothek: Aufgabe 9
---------------------------------------------------------------------------
ALTER TABLE Buch
    ADD CONSTRAINT CK_Buch_ISBN_Länge
        CHECK (LEN(ISBN) IN (10, 13));

ALTER TABLE Kategorie
    ADD CONSTRAINT UQ_Kategorie_Bezeichnung
        UNIQUE (Bezeichnung);

ALTER TABLE Buch_Kunde
    ADD 
        CONSTRAINT DF_BuchKunde_Startdatum
            DEFAULT (GETDATE()) FOR Startdatum,
        CONSTRAINT CK_BuchKunde_StartEnd
            CHECK (Startdatum <= Enddatum);

ALTER TABLE Ausleihe
    ADD 
        CONSTRAINT DF_Ausleihe_Startdatum
            DEFAULT (GETDATE()) FOR Startdatum,
        CONSTRAINT CK_Ausleihe_StartEnd
            CHECK (Startdatum <= Enddatum);
GO
