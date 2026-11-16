# Repetitionsaufgaben: Vererbung und Polymorphie (Lösungen)

## Aufgabe 1: Fehler finden

Inputs:

- Eine abstrakte Methode darf nur in abstrakter Klassen vorkommen.
- Eine abstrakte Methode hat per Definition keine Implementation. Diese **muss** von abgeleiteten Klassen implementiert werden.
- Es ist sinnfrei, dass `Dog` von `Human` ableitet. Denn der Satz "Ein Hund **ist ein** Mensch." ist falsch.
- Dass die `Human`-Klasse mehrere `Dog`-Attribute hat, hat sich vermutlich über längere Zeit so entwickelt. Spätestens beim `Pet3` hätte man das Projekt refactoren sollen und daraus eine Liste von `Dog`s machen.

Es folgen ein paar Vorschläge, wie Syntax-Fehler, aber auch Architektur-Fehler verbessert werden könnten:

```csharp
public class Human
{
    public string Name;
    public List<Dog> Pets;

    public void GoForAWalk()
    {
        foreach (Dog pet in Pets)
        {
            Console.WriteLine($"'{Name}' get mit '{pet.GetDescription()}' laufen.");
        }
    }
}

public abstract class Dog
{
    public string Name;
    public string Color;
    public abstract string GetDescription();
}

public class Bulldog : Dog
{
    public override string GetDescription()
    {
        return $"Bulldogge '{Name}' mit {Color} Fell";
    }
}

public class Labrador : Dog
{
    public override string GetDescription()
    {
        return $"Labrador '{Name}' mit {Color} Fell";
    }
}
```

## Aufgabe 2: Code lesen

### Aufgabe 2.1

Dieses Programm kann nicht ausgeführt werden. Die `Vehicle`-Klasse ist abstrakt und kann deswegen nicht instanziert werden.

### Aufgabe 2.2

```txt
I am a car. Manufacturer: Audi ProductName: RS8 Seats: 4
```

### Aufgabe 2.3

```txt
I am a car. Manufacturer: BMW ProductName: Isetta Seats: 2
I am a car. Manufacturer: Hans Glas GmbH ProductName: Goggomobil 400 Seats: 4
I am a lorry. Manufacturer: Scania ProductName: R770 MaxLoads: 80000
I am a lorry. Manufacturer: MAN ProductName: TGX 41.640 MaxLoads: 250000
I am a train. Manufacturer: not defined ProductName: Kiss200
I am a Vehicle. Manufacturer: Meyer Werft Shipname: Disney Treasure III
```

### Aufgabe 2.4

Dieses Programm kann nicht ausgeführt werden. Auf der `Vehicle`-Klasse existiert keine Methode mit dem Namen `GetNumberOfWheels`.

### Aufgabe 2.5

```txt
This Landvehicle has 3 wheels.
```

### Aufgabe 2.6

```txt
This Car has 3 wheels.
```
