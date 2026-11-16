# Repetitionsaufgaben: Refactoring

## Aufgabe 1: Klasse extrahieren

Diese Klasse macht zu viel auf einmal. Refaktoriere sie, indem du eine `Address`-Klasse extrahierst:

```csharp
public class Customer
{
    public string Name;
    public string Street;
    public string City;
    public string ZipCode;

    public string FullAddress()
    {
        return $"{Street}, {ZipCode} {City}";
    }
}
```

Achte darauf, dass die öffentliche Schnittstelle sinnvoll bleibt und sich das Verhalten nicht ändert.

## Aufgabe 2: Bedingungen durch Polymorphismus ersetzen

Refaktoriere diese Switch-Anweisung in eine polymorphe Lösung mithilfe von Unterklassen (Bonus: oder einem Interface):

```csharp
public decimal ShippingCost(string country, decimal orderValue)
{
    switch (country)
    {
        case "DE": return 5m;
        case "AT": return 6m;
        case "CH": return 10m;
        default: return 15m;
    }
}
```

**Ziel:** Das Hinzufügen eines neuen Landes soll *null* Änderungen an diesem Code erfordern.

## Aufgabe 3: Umbenennen & vereinfachen

Der folgende Code funktioniert, ist aber unlesbar. Refaktoriere ihn: Benenne Variablen um, extrahiere Methoden, entferne Duplikate — bei identischer Ausgabe:

```csharp
public void P(List<int> l)
{
    int s = 0;
    foreach (int i in l)
    {
        if (i % 2 == 0) { s += i; }
    }
    Console.WriteLine(s);

    int t = 0;
    for (int j = 0; j < l.Count; j++)
    {
        if (l[j] % 2 == 0) { t += l[j]; }
    }
    Console.WriteLine(t);
}
```

## Verständnisfragen

1. **Goldene Regel:** Was ist das Wichtigste beim Refactoring? Wie könntest du in der Aufgabe 3 nachweisen, dass sie erfüllt ist?
2. **Verbesserungen:** Nenne mindestens drei Möglichkeiten diese Methode zu verbessern:
   ```csharp
   public void Handle(Document d)
   {
       if (d.Type == 1 || d.Type == 3)
       {
           int t = 0;
           t += d.Lines[0].Trim().Length;
       }
   }
   ```
