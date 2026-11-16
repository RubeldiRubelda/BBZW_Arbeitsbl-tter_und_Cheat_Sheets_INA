
# Repetitionsaufgaben: Dokumentation

## Aufgabe 1: `<summary>`-Dokumentation ergänzen

**C#**

```
/// <summary>
/// Stellt Methoden zur Umrechnung von Temperaturen zwischen Celsius und Fahrenheit bereit.
/// </summary>
public class TemperatureConverter
{
    /// <summary>
    /// Rechnet eine Temperaturangabe von Grad Celsius in Grad Fahrenheit um.
    /// </summary>
    /// <param name="celsius">Die Temperatur in Grad Celsius.</param>
    /// <returns>Die umgerechnete Temperatur in Grad Fahrenheit.</returns>
    public double CelsiusToFahrenheit(double celsius)
    {
        return celsius * 9.0 / 5.0 + 32;
    }

    /// <summary>
    /// Rechnet eine Temperaturangabe von Grad Fahrenheit in Grad Celsius um.
    /// </summary>
    /// <param name="fahrenheit">Die Temperatur in Grad Fahrenheit.</param>
    /// <returns>Die umgerechnete Temperatur in Grad Celsius.</returns>
    public double FahrenheitToCelsius(double fahrenheit)
    {
        return (fahrenheit - 32) * 5.0 / 9.0;
    }
}
```

## Aufgabe 2: Dokumentationsgetriebenes Refactoring

### Entscheidung: Magic Number (`-1`) vs. Exception

Das Zurückgeben von `-1` (ein sogenannter *Magic Return Value* / Fehlercode) ist hier eine  **schlechte Idee** , da der Rückgabetyp `double` je nach Eingabewerten (z. B. negativen Beträgen oder Rabatten) theoretisch auch legitim `-1.0` ergeben könnte. Ein Aufrufer, der den Rückgabewert nicht explizit auf `-1` prüft, rechnet unbemerkt mit einem falschen Wert weiter (stiller Fehler). Eine **Exception** (hier `ArgumentOutOfRangeException` bzw.`ArgumentException`) erzwingt hingegen eine sofortige, eindeutige Fehlerbehandlung.*(Zusätzlich sollte auch `b == 0` abgefangen werden, da eine Division durch `0` bei `double` sonst unbemerkt `Infinity` oder `NaN` liefert).*

### Refaktorierter und dokumentierter Code

*(Kontextannahme für sinnvolle Domänen-Namen: Berechnung eines anteiligen Gesamtpreises inklusive prozentualem Zuschlag/Steuersatz).*

**C#**

```
using System;

public static class PriceCalculator
{
    /// <summary>
    /// Berechnet den Einzelpreis pro Einheit inklusive eines prozentualen Zuschlags (z. B. Steuersatz).
    /// </summary>
    /// <remarks>
    /// Statt bei ungültigen Eingaben einen Fehlercode wie -1 zurückzugeben, wirft diese Methode
    /// gezielt Exceptions, damit Berechnungsfehler nicht unbemerkt bleiben.
    /// </remarks>
    /// <param name="totalAmount">Der Gesamtbetrag, der aufgeteilt werden soll.</param>
    /// <param name="unitCount">Die Anzahl der Einheiten, durch die geteilt wird. Darf nicht 0 sein.</param>
    /// <param name="surchargePercent">Der prozentuale Zuschlag in ganzen Prozentpunkten (z. B. 8 für 8 % / 0.08). Muss grösser als 0 sein.</param>
    /// <returns>Der berechnete Betrag pro Einheit zuzüglich des prozentualen Zuschlags.</returns>
    /// <exception cref="ArgumentOutOfRangeException">
    /// Wird ausgelöst, wenn <paramref name="surchargePercent"/> kleiner oder gleich 0 ist.
    /// </exception>
    /// <exception cref="ArgumentException">
    /// Wird ausgelöst, wenn <paramref name="unitCount"/> gleich 0 ist, um eine Division durch Null zu verhindern.
    /// </exception>
    public static double CalculateUnitPriceWithSurcharge(double totalAmount, double unitCount, int surchargePercent)
    {
        if (surchargePercent <= 0)
        {
            throw new ArgumentOutOfRangeException(
                nameof(surchargePercent),
                "Der prozentuale Zuschlag muss grösser als 0 sein.");
        }

        if (unitCount == 0)
        {
            throw new ArgumentException(
                "Die Anzahl der Einheiten darf nicht 0 sein.",
                nameof(unitCount));
        }

        return totalAmount / unitCount + surchargePercent * 0.01;
    }
}
```

## Verständnisfragen

### 1. Zweck

* **IDE-Integration (IntelliSense):** XML-Kommentare werden von IDEs (wie Visual Studio, Rider oder VS Code) direkt beim Tippen als Tooltip angezeigt – auch in anderen Projekten, die nur die kompilierte DLL referenzieren.
* **Compiler-Prüfung & Build-Warnungen:** Der C#-Compiler prüft XML-Kommentare auf syntaktische Korrektheit und Vollständigkeit (z. B. ob alle Parameter dokumentiert sind) und kann bei veralteter oder fehlender Dokumentation Build-Warnungen ausgeben.

### 2. Tags zuordnen

1. Erklären, was eine Methode insgesamt tut → `<summary>`
2. Einen Parameter namens `quantity` beschreiben → `<param name="quantity">`
3. Beschreiben, was die Methode zurückgibt → `<returns>`
4. Angeben, dass eine Methode eine `ArgumentException` wirft → `<exception cref="ArgumentException">`
5. Ein kurzes Codebeispiel zur Verwendung zeigen → `<example>` (oft kombiniert mit `<code>` darin)
6. Zusätzliche Hintergrundinformationen jenseits der Zusammenfassung liefern → `<remarks>`
7. Auf eine verwandte Methode verweisen → `<seealso cref="..."/>` (im Fließtext auch `<see cref="..."/>`)

### 3. Fehler in der Doku finden

1. **Fehlender Parameter `a`:** Der erste Parameter `int a` ist überhaupt nicht mit einem `<param name="a">`-Tag dokumentiert.
2. **Falsche Beschreibung bei Parameter `b`:**`<param name="b">` behauptet `"The first number."`, obwohl `b` der **zweite** Parameter ist.
3. **Widerspruch zwischen `<summary>`, `<returns>` und Code:**`<summary>` und Code (`return a + b;`) berechnen die  **Summe** , während `<returns>` fälschlicherweise behauptet, es werde der **Durchschnitt** (`"The average of the two numbers."`) zurückgegeben.

### 4. Professionelle Standards

* **Ganze Sätze vs. kurze Bezeichner:** Bezeichner (Methoden-/Variablennamen) müssen im Code schnell lesbar und prägnant sein, damit der Kontrollfluss übersichtlich bleibt. XML-Dokumentation hingegen soll Nuancen, Randbedingungen, Einheiten und Nebeneffekte unmissverständlich erklären – dafür braucht es vollständige, grammatikalisch korrekte Sätze.
* **Auftreten ausserhalb der Quelldatei:**
  * In den vom Compiler generierten `.xml`-Dokumentationsdateien neben den `.dll`-Assemblies (für NuGet-Pakete).
  * In automatisch generierten API-Referenzwebseiten (z. B. mit DocFX, Sandcastle oder Doxygen).
  * Im Objektkatalog (Object Browser) und in den dekompilierten Metadaten-Ansichten von IDEs.

### 5. Urteilsfrage

* **Wann Verzicht zulässig ist:** Bei privaten (`private`) oder internen Hilfsmethoden, deren Zweck, Eingaben und Rückgabewerte durch klare Benennung bereits zu 100 % offensichtlich sind und die keine versteckten Seiteneffekte oder Sonderfälle haben (sowie bei trivialen Standard-Implementierungen wie einfachen Properties).
* **Beispiel für selbstdokumentierenden Code:**
  **C#**

  ```
  private bool IsUserEligibleForDiscount(int age, bool hasMembership)
  {
      return age >= 65 || hasMembership;
  }
  ```

### 6. Tooling

* **Compiler-Warnung:** Wenn in der `.csproj`-Datei `<GenerateDocumentationFile>true</GenerateDocumentationFile>` aktiviert ist, gibt der C#-Compiler die Warnung **`CS1573`** aus ( *"Parameter 'x' has no matching param tag in the XML comment for '...' (but other parameters do)"* ) – oder  **`CS1591`** , falls der gesamte XML-Kommentar am öffentlichen Member fehlt.
* **Anzeige in der IDE:** Das `<summary>` erscheint in einem  **Tooltip / Popup-Fenster (Quick Info / IntelliSense)** , sobald der Benutzer mit dem Mauszeiger über den Klassen- oder Methodennamen fährt oder diesen in der Autovervollständigung auswählt.
