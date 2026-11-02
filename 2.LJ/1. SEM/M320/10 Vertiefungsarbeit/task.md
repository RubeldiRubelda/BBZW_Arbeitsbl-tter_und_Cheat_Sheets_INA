# Vertiefungsaufgabe 10 - UML Assoziationen

Erstelle ein UML-Klassendiagramm mit den korrekten Assoziationen und Multiplizitäten.

```csharp
public abstract class Vehicle
{
    public string Name { get; set; }

    protected Vehicle(string name)
    {
        Name = name;
    }

    public abstract string Drive();

    public virtual string Describe()
    {
        return $"I am a vehicle called {Name}.";
    }
}

public class Car : Vehicle
{
    private Engine _engine;

    public Car(string name, int horsepower) : base(name)
    {
        _engine = new Engine(horsepower);
    }

    public override string Drive()
    {
        return $"{Name} drives with {_engine.Horsepower} hp.";
    }

    public override string Describe()
    {
        return "Car: " + base.Describe();
    }
}

public class Bicycle : Vehicle
{
    public int NumberOfGears { get; set; }

    public Bicycle(string name, int gears) : base(name)
    {
        NumberOfGears = gears;
    }

    public override string Drive()
    {
        return $"{Name} rolls along with {NumberOfGears} gears.";
    }
}

public class Engine
{
    public int Horsepower { get; set; }

    public Engine(int horsepower)
    {
        Horsepower = horsepower;
    }
}

public class Garage
{
    private List<Vehicle> _vehicles = new List<Vehicle>();

    public string Location { get; set; }

    public Garage(string location)
    {
        Location = location;
    }

    public void Park(Vehicle vehicle)
    {
        _vehicles.Add(vehicle);
    }

    public void ShowContents()
    {
        Console.WriteLine($"Garage in {Location}:");
        foreach (Vehicle v in _vehicles)
        {
            Console.WriteLine("  " + v.Describe());
            Console.WriteLine("  -> " + v.Drive());
        }
    }
}

public class Program
{
    public static void Main()
    {
        Car car = new Car("Speedy", 150);
        Bicycle bike = new Bicycle("Florence", 21);

        Garage garage = new Garage("Zurich");
        garage.Park(car);
        garage.Park(bike);

        garage.ShowContents();
    }
}
```