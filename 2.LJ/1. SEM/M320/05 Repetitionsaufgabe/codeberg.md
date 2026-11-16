# Repetitionsaufgaben: Assoziationen

## Aufgabe 1: Lehrperson und Kurse

Erstelle eine Klasse `Course` und eine Klasse `Professor`. Ein `Course`-Objekt sollte einen Verweis auf den `Professor` enthalten, der den Kurs unterrichtet. Keine der beiden Klassen ist von der anderen abhängig – wenn der Kurs gelöscht wird, existiert der Professor weiterhin.

### Anforderungen

- `Course` verfügt über die Attribute `Title` und `Teacher` (vom Typ `Professor`)
- `Professor` hat einen Namen
- Füge eine Methode `Course.PrintInfo()` hinzu, die Folgendes ausgibt: "Kurs: X, unterrichtet von Y"
- Erstelle in `Main` einen Professor und zwei Kurse, die denselben Professor haben

### Diskussionsfragen

1. Warum ist es von Vorteil, dass beide Kurse auf dasselbe Professor-Objekt verweisen?
2. Was passiert mit der Ausgabe, wenn du den Namen des Professors änderst?

## Aufgabe 2: Bibliothek und Bücher

Modelliere eine `Library` und ein `Book`. Eine Bibliothek verwaltet eine `List<Book>`, aber Bücher können eigenständig existieren (und in eine andere Bibliothek verschoben werden!).

### Anforderungen

- Implementiere eine Methode `Library.AddBook(Book book)`
- Implementiere `Book.TransferTo(Library destination)`, das das Buch aus seiner aktuellen Bibliothek entfernt und der neuen hinzufügt
- Verfolge, zu welcher Bibliothek ein Buch aktuell gehört
- Gib das Inventar beider Bibliotheken vor und nach einer Verschiebung aus

### Diskussionsfragen

1. Um welche Art von Assoziation handelt es sich hier (einfache Assoziation, Aggregation, Komposition)? Begründe deine Antwort.

## Aufgabe 3: Beziehung erkennen

Identifiziere im folgenden Snippet die Art der Assoziation und schreibe sie in den anderen Typ um (Komposition ↔ Aggregation):

```csharp
public class Car
{
    private Engine _engine = new Engine(); // ?
}
```

### Diskussionsfragen

- Erkläre in 2–3 Sätzen, warum sich eine Auto–Motor-Beziehung von einer Auto–Fahrer-Beziehung unterscheidet.

## Verständnisfragen

1. **Eigene Definition:** Worin unterscheiden sich Assoziation, Aggregation und Komposition? Gib für jede ein Beispiel aus der Praxis an.
2. **Wahr oder falsch:** "Bei Komposition kann das enthaltene Objekt unabhängig vom Container existieren." Begründe deine Antwort.
3. **Multiple Choice:** Ein `Team` verwaltet eine `List<Player`. Wird das Team aufgelöst, spielen die Spieler woanders weiter. Das ist:
   1. Komposition
   2. Aggregation
   3. Vererbung
   4. Keine Beziehung
4. **Code lesen:** Welche Beziehung besteht zwischen `Doctor` und `Patient` in einem System, in dem ein Arzt `Treat(Patient patient)` aufruft, aber keiner der beiden den anderen dauerhaft speichert?
5. **Entscheidungsfindung:** Dein Freund modelliert ein `House` mit einer `List<Room>`, die im Haus erzeugt wird. Eine andere Person meint, Räume sollten von aussen übergeben werden, damit sie "überleben". Wer hat recht, und warum?
6. **Multiplizität:** Welchen Wert hat die Multiplizität an jedem Ende der Beziehung in der Bibliotheks-Aufgabe (Aufgabe 2)? Könnte ein Buch in deiner Implementierung gleichzeitig zu zwei Bibliotheken gehören? Sollte es das können?
7. **Vorhersage:** Wenn zwei `Course`-Objekte dieselbe `Professor`-Referenz halten und ein Kurs `course.Teacher.Name = "New Name"` setzt — sieht der andere Kurs die Änderung? Warum?
