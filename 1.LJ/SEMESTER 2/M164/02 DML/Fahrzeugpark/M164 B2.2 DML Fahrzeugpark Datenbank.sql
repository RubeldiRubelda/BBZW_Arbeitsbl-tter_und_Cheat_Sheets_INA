
---------------------------------------------------------------------------
-- Fahrzeugpark
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- 1 Datenbank erstellen
---------------------------------------------------------------------------

USE master;
GO
DROP DATABASE IF EXISTS Fahrzeugpark;
GO
CREATE DATABASE Fahrzeugpark;
GO
USE Fahrzeugpark;
GO

CREATE TABLE Mitarbeiter (
    Mitarbeiter_ID INTEGER IDENTITY(1,1) NOT NULL,
    Nachname       NVARCHAR(30)          NOT NULL,
    Vorname        NVARCHAR(30)          NOT NULL,
    CONSTRAINT PK_Mitarbeiter
        PRIMARY KEY (Mitarbeiter_ID)
);

CREATE TABLE Fahrzeug (
    Fahrzeug_ID        INTEGER IDENTITY(1,1) NOT NULL,
    Marke              NVARCHAR(50)          NOT NULL,
    Typ                NVARCHAR(50)          NOT NULL,
    Neupreis           DECIMAL(9, 2)         NOT NULL,
    Jahrgang           INTEGER               NOT NULL,
    Occasion           BIT                   NOT NULL,
    fk_Mitarbeiter_ID  INTEGER               NULL,
    CONSTRAINT PK_Fahrzeug
        PRIMARY KEY (Fahrzeug_ID),
    CONSTRAINT FK_Fahrzeug_Mitarbeiter
        FOREIGN KEY (fk_Mitarbeiter_ID)
        REFERENCES Mitarbeiter (Mitarbeiter_ID)
);
GO