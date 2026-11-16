# Repetitionsaufgaben: Dokumentation

## Aufgabe 1: `<summary>`-Dokumentation ergänzen

Dokumentiere die folgende Klasse mit C#-XML-Dokumentationskommentaren (`///`). Jedes öffentliche Element braucht ein `<summary>`, Parameter brauchen `<param>` und die Methode braucht `<returns>`:

```csharp
public class TemperatureConverter
{
    public double CelsiusToFahrenheit(double celsius)
    {
        return celsius * 9.0 / 5.0 + 32;
    }

    public double FahrenheitToCelsius(double fahrenheit)
    {
        return (fahrenheit - 32) * 5.0 / 9.0;
    }
}
```

## Aufgabe 2: Dokumentationsgetriebenes Refactoring

Hier ist eine schlecht dokumentierte, unklare Methode:

```csharp
// does stuff
public static double F(double a, double b, int c)
{
    if (c == 0) return -1;
    return a / b + c * 0.01;
}
```

Schreibe sie um: Benenne Parameter und Methode aussagekräftig um und verfasse eine vollständige XML-Dokumentation inklusive `<exception>`-Tag für den Fehlerfall. Entscheide (und dokumentiere!), ob das Zurückgeben von `-1` eine gute Idee ist — oder ob eine Exception besser wäre.

## Verständnisfragen

1. **Zweck:** Nenne zwei konkrete Vorteile von XML-Dokumentation gegenüber einfachen `//`-Kommentaren. (Hinweis: IntelliSense und Build-Warnungen.)
2. **Tags zuordnen:** Welches Tag passt zu jeder Situation?
   1. Erklären, was eine Methode insgesamt tut
   2. Einen Parameter namens `quantity` beschreiben
   3. Beschreiben, was die Methode zurückgibt
   4. Angeben, dass eine Methode eine `ArgumentException` wirft
   5. Ein kurzes Codebeispiel zur Verwendung zeigen
   6. Zusätzliche Hintergrundinformationen jenseits der Zusammenfassung liefern
   7. Auf eine verwandte Methode verweisen
3. **Fehler in der Doku finden:**
   ```csharp
   /// <summary>Returns the sum.</summary>
   /// <param name="b">The first number.</param>
   /// <returns>The average of the two numbers.</returns>
   public int Add(int a, int b) {
       return a + b;
   }
   ```
   Liste jede Diskrepanz zwischen Dokumentation und Code auf.
4. **Professionelle Standards:** Warum sollten XML-Kommentare in ganzen Sätzen geschrieben werden, während Code-Bezeichner kurz bleiben? Wo tauchen diese Kommentare im Ökosystem ausserhalb der Quelldatei noch auf?
5. **Urteilsfrage:** Wann ist es zulässig, eine Methode *nicht* zu dokumentieren? Gib ein Beispiel für selbstdokumentierenden Code.
6. **Tooling:** Welche Warnung gibt der Compiler bei einem fehlenden `<param>`-Tag an einer öffentlichen Methode aus, und wo erscheint in deiner IDE das `<summary>` für den Benutzer deiner Klasse?
