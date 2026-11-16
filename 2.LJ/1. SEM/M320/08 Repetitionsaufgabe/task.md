# Repetitionsaufgaben: Refactoring

## Aufgabe 1: Klasse extrahieren

Um das *Single Responsibility Principle* einzuhalten, werden die Adressdaten und die Formatierungslogik in eine eigene `Address`-Klasse ausgelagert. Damit die öffentliche Schnittstelle von `Customer` abwärtskompatibel bleibt und sich das Verhalten nach aussen nicht ändert, delegiert `Customer.FullAddress()` den Aufruf an das `Address`-Objekt (oder bietet die Eigenschaften als delegierende Properties an).

**C#**

```
public class Address
{
    public string Street { get; set; }
    public string City { get; set; }
    public string ZipCode { get; set; }

    public Address() { }

    public Address(string street, string zipCode, string city)
    {
        Street = street;
        ZipCode = zipCode;
        City = city;
    }

    public string FullAddress()
    {
        return $"{Street}, {ZipCode} {City}";
    }
}

public class Customer
{
    public string Name { get; set; }
    public Address Address { get; set; } = new Address();

    // Delegierende Properties für volle Abwärtskompatibilität der öffentlichen Schnittstelle
    public string Street
    {
        get => Address.Street;
        set => Address.Street = value;
    }

    public string City
    {
        get => Address.City;
        set => Address.City = value;
    }

    public string ZipCode
    {
        get => Address.ZipCode;
        set => Address.ZipCode = value;
    }

    public string FullAddress()
    {
        return Address.FullAddress();
    }
}
```

## Aufgabe 2: Bedingungen durch Polymorphismus ersetzen

Durch ein Interface (`IShippingStrategy`) wird das *Open/Closed Principle* erfüllt: Bestehender Code muss nicht mehr angefasst werden, wenn ein neues Land hinzukommt – man erstellt einfach eine neue Klasse.

**C#**

```
public interface IShippingStrategy
{
    decimal CalculateShippingCost(decimal orderValue);
}

public class GermanyShipping : IShippingStrategy
{
    public decimal CalculateShippingCost(decimal orderValue) => 5m;
}

public class AustriaShipping : IShippingStrategy
{
    public decimal CalculateShippingCost(decimal orderValue) => 6m;
}

public class SwitzerlandShipping : IShippingStrategy
{
    public decimal CalculateShippingCost(decimal orderValue) => 10m;
}

public class InternationalShipping : IShippingStrategy
{
    public decimal CalculateShippingCost(decimal orderValue) => 15m;
}

public class OrderProcessor
{
    // Der bestehende Code bleibt bei neuen Ländern komplett unverändert:
    public decimal ShippingCost(IShippingStrategy shippingStrategy, decimal orderValue)
    {
        return shippingStrategy.CalculateShippingCost(orderValue);
    }
}
```

## Aufgabe 3: Umbenennen & vereinfachen

Im ursprünglichen Code wird exakt dieselbe Berechnung zweimal mit unterschiedlichen Schleifentypen (`foreach` und `for`) durchgeführt und ausgegeben. Durch eine extrahierte Hilfsmethode verschwindet die Duplikation komplett.

**C#**

```
using System;
using System.Collections.Generic;
using System.Linq;

public class NumberProcessor
{
    public void PrintEvenSumTwice(List<int> numbers)
    {
        int evenSum = CalculateEvenSum(numbers);

        Console.WriteLine(evenSum);
        Console.WriteLine(evenSum);
    }

    private int CalculateEvenSum(IEnumerable<int> numbers)
    {
        return numbers.Where(number => number % 2 == 0).Sum();
    }
}
```

## Verständnisfragen

### 1. Goldene Regel

* **Das Wichtigste beim Refactoring:** Die innere Struktur, Lesbarkeit und Wartbarkeit des Codes wird verbessert, **ohne sein beobachtbares Verhalten nach aussen zu verändern** .
* **Nachweis in Aufgabe 3:** Man schreibt vor dem Refactoring **automatisierte Unit-Tests** (z. B. mit xUnit oder NUnit), welche die Konsolenausgabe (`Console.Out`) für verschiedene Eingabelisten (leere Liste, nur ungerade Zahlen, gemischte Zahlen, negative Zahlen) aufzeichnen und prüfen. Laufen alle Tests nach dem Umbau ohne Anpassung weiterhin grün durch, ist das identische Verhalten nachgewiesen.

### 2. Verbesserungen

An der Methode `Handle(Document d)` lassen sich folgende Punkte verbessern:

1. **Magic Numbers ersetzen (`1` und `3`):** Niemand weiss ohne Kontext, was Dokumenttyp `1` oder `3` bedeutet. Diese sollten durch ein aussagekräftiges `enum` (z. B.`DocumentType.Invoice` und `DocumentType.Receipt`) ersetzt werden.
2. **Sprechende Bezeichner verwenden:**`Handle` ist zu vage,`d` sollte `document` heissen und `t` sollte einen beschreibenden Namen wie `firstLineLength` tragen.
3. **Toten Code / fehlenden Rückgabewert beheben:** Die lokale Variable `t` wird berechnet, aber weder zurückgegeben noch irgendwo gespeichert – die Methode hat aktuell keinerlei Effekt nach aussen.
4. **Fehlende Null- und Bereichsprüfungen (Guard Clauses) ergänzen:** Wenn `d` gleich `null` ist oder `d.Lines` leer ist (`Count == 0`), stürzt das Programm mit einer `NullReferenceException` bzw.`ArgumentOutOfRangeException` ab.
5. **Bedingung in eine eigene Methode/Property auslagern:**`d.Type == 1 || d.Type == 3` lässt sich z. B. als `document.RequiresHeaderLengthCheck()` kapseln, um die Lesbarkeit zu erhöhen.
