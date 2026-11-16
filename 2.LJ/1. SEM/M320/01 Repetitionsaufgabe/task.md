# Repetitionsaufgaben: C# (Lösungen)

## Aufgabe 1: Rückgabewerte

- `void`
- `int`
- `Item?`

## Aufgabe 2: Properties

```csharp
public class Product
{
    public string Name { get; init; }
    public double Price { get; set; }
    public double Tax { get; private set; }

    // `_uuid` ist `public`, somit sollte es gemäss Namenskonvention in PascalCase geschrieben werden (`Uuid`)
    public string Uuid { get; }

    public void Update(string name, double price, double tax, string uuid)
    {
        // `Name` und `Uuid` haben kein `set`, was dazu führt, dass die zwei Attribute auch innerhalb der Klasse nicht beschreiben werden können
        // Name = name;
        Price = price;
        Tax = tax;
        // Uuid = uuid;
    }
}

class Program
{
    static void Main(string[] args)
    {
        Product p = new Product()
        {
            Name = "Headphones",
            Price = 13.40,

            // Hier können nur Properties gesetzt werden, die entweder mit `set` oder `init` definiert wurden
            // Tax = 0.5
            // Uuid =  "03065a82-f55c-4542-a231-a59e6ce202a9" 
        };

        Console.WriteLine(p.Name);
        Console.WriteLine(p.Price);
        Console.WriteLine(p.Tax);
        Console.WriteLine(p.Uuid);

        // `Name` und `Uuid` haben kein `set` und `Tax` hat explizit ein `private set`, was dazu führt, dass die drei Attribute an dieser Stelle nicht beschreiben werden können
        // p.Name = "Head Phones";
        p.Price = 12.40;
        // p.Tax = 8.0;
        // p.Uuid = "03065a82-f55c-4542-a231-a59e6ce202a9";

        p.Update(
            "Brand Headphones",
            20,
            3,
            "636d89b0-0312-4580-889a-09d94addc35c"
        );
    }
}
```

## Aufgabe 3: `object`

```csharp
public class Product
{
    // ...

    public override string ToString()
    {
        return $"Ich bin das Produkt mit dem Namen '{Name}' und mein Preis ist '{Price} CHF'.";
    }
}
```
