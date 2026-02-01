CREATE DATABASE Druckerverwaltung;
GO

USE Druckerverwaltung;
GO

    CREATE TABLE Standort (
        StandortId INT PRIMARY KEY,
        Standort VARCHAR(50)
    );

GO


    CREATE TABLE Mitarbeiter (
        MitarbeiterId INT IDENTITY(1,1) PRIMARY KEY,
        Name VARCHAR(100),
        [Tel.Intern] VARCHAR(10)
    );

GO

    CREATE TABLE Drucker (
        Seriennummer VARCHAR(50) PRIMARY KEY,
        Bezeichnung VARCHAR(50),
        MitarbeiterId INT,
        StandortId INT,
        CONSTRAINT FK_Mitarbeiter FOREIGN KEY (MitarbeiterId) REFERENCES Mitarbeiter(MitarbeiterId),
        CONSTRAINT FK_Standort FOREIGN KEY (StandortId) REFERENCES Standort(StandortId)
    );
GO