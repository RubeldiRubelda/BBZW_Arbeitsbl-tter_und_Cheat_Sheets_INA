# Vertiefungsaufgabe 12 - Projekt "Bestellsystem für eine Buchhandlung"

## Überblick

Du sollst ein vereinfachtes Bestellverwaltungssystem für eine Buchhandlung entwerfen und implementieren. Das System soll Kunden ermöglichen, Bestellungen für Bücher aufzugeben und Endpreise nach verschiedenen Regeln zu berechnen.

---

## Anforderungen

### 1. Bücher

Das Geschäft verkauft zwei Arten von Büchern:

- **Physische Bücher**: haben einen Titel, eine ISBN, einen Grundpreis und ein Gewicht in Gramm. Für den Verkauf fallen zusätzlich Versandkosten von CHF 2.00 an.
- **E-Books**: haben einen Titel, eine ISBN, einen Grundpreis und eine Dateigrösse in MB. Bei E-Books wird kein Porto fällig.

Der Preis eines Buches muss jederzeit über eine gemeinsame Funktionalität abrufbar sein, egal um welchen Buchtyp es sich handelt.

Achtung: Ein «generisches» Buch ohne Typ darf nicht direkt erstellt werden können.

### 2. Kunden

Ein Kunde hat einen Namen, eine E-Mail-Adresse und kann ein Mitglied sein. Die E-Mail-Adresse soll vor dem Speichern geprüft werden (z. B. muss sie ein @ enthalten). Wie die Daten intern gespeichert werden, ist dir überlassen.

Ein Kunde kann über die Funktion `PlaceOrder(Book[] books)` eine Bestellung aufgeben und diese zurückbekommen.

### 3. Bestellungen

Eine Bestellung gehört immer zu genau einem Kunden und enthält beliebig viele Bücher. Sie kennt eine automatisch vergebene Bestellnummer, das Bestelldatum sowie eine Funktion `GetTotal()`, die den Gesamtbetrag der Bestellung berechnet.

### 4. Rabattregeln

Aktuell gibt es zwei Rabattregeln:

- **Kein Rabatt**: Der Preis bleibt unverändert.
- **Mitgliederrabatt**: Der Preis wird um 10 % reduziert.
- **E-Book-Aktion**: Auf allen E-Books gelten 15 % Rabatt.

Plane deine Lösung so, dass weitere Rabattregeln später ergänzt werden können, ohne dafür bestehenden Code gross anzupassen.

---

## Dokumentationsanforderungen

Jede Klasse muss enthalten:

- Einen XML-Dokumentationskommentar (`///`), der den Zweck beschreibt
- XML-Kommentare zu allen öffentlichen Methoden, die Parameter und Rückgabewerte erklären
- Mindestens einen Inline-Kommentar (`//`), der nicht offensichtliche Logik erklärt

---

## Abgabe

### Phase 1: UML-Klassendiagramm

Zeichne ein vollständiges Klassendiagramm deines Lösungsdesigns. Halte dich dabei an die übliche UML-Notation, insbesondere:

- Alle Klassen mit Attributen und Operationen
- Korrekte Sichtbarkeitssymbole (`+` public, `-` private, `#` protected)
- Alle relevanten Beziehungen zwischen deinen Klassen inklusive Multiplizität (z. B. 1..\*, 1)
- Wähle für jede Beziehung bewusst die passende Notation und begründe kurz, warum

### Phase 2: Implementierung

Setze dein Design in C# um. Dein Programm muss:

- Ohne Fehler kompilieren
- Eine Beispielausführung enthalten, die den geforderten Output erzeugt
- Sicherstellen, dass die Preisberechnung jedes Buchtyps stimmt

---

## Erwartete Ausgabe (zur Kontrolle)

Dein Programm soll eine Ausgabe ähnlich dieser erzeugen:

```
Customer: Alice Schmidt placed order #1001 on 26.10.2026
Books ordered:
  - Clean Code (Physical):   CHF 27.00
  - Head First C# (Ebook):   CHF 34.00
    - Ebook discount:      - CHF  5.10
Total:                       CHF 55.90
```

---

## Tipps

1. Beginne mit dem UML-Diagramm – springe nicht direkt in den Code
2. Überlege dir bei jedem Attribut und jeder Methode, wer darauf zugreifen dürfen soll
3. Teste am Schluss auch ungültige E-Mail-Adressen und ungültige Objekte (Was passiert, wenn jemand versucht, ein generisches Buch zu erstellen?)
4. Füge XML-Kommentare hinzu, bevor du vergisst, warum du eine Methode auf eine bestimmte Art geschrieben hast

---

## Erweiterungsaufgaben

- Ergänze mehrere Versandstrategien (z. B. Standard, Express, Abholung) mit unterschiedlichen Preisen.
- Überlege dir, wie du die Daten speichern könntest und implementiere die.
- Füge eine Validierung von Benutzereingaben mit Exceptions hinzu.