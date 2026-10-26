using System;

namespace Vertiefungsarbeit4;

public class Car
{
    public string Brand { get; }
    public string Model { get; }
    public int Year { get; }

    public Car(string brand, string model, int year)
    {
        Brand = brand;
        Model = model;
        Year = year;
    }

    public override string ToString()
    {
        Console.WriteLine($"Marke: {Brand}, Modell: {Model}, Baujahr: {Year}");
        return $"Marke: {Brand}, Modell: {Model}, Baujahr: {Year}";
    }
 
}
