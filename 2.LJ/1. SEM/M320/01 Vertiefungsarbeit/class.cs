using System;
public class Cylinder
{
    // Attribute
    public double Radius { get; set; }
    public double Height { get; set; }

    // Konstruktoren
    public Cylinder()
    {
        Radius = 0.0;
        Height = 0.0;
    }
    public Cylinder(double radius, double height)
    {
        Radius = radius;
        Height = height;
    }

    // Methoden
    public double GetDiameter()
    {
        return 2 * Radius;
    }
    public double GetBaseArea()
    {
        return Math.PI * Math.Pow(Radius, 2);
    }
    public double GetVolume()
    {
        return (GetBaseArea() * Height);
    }
    public double GetCircumference()
    {
        return 2 * Math.PI * Radius;
    }
    public double GetLateralArea()
    {
        return (GetCircumference() * Height);
    }
    public double GetSurfaceArea()
    {
        return (GetLateralArea() + 2 * GetBaseArea());
    }
    public static double GetSurfaceArea(double radius, double height)
    {
        return (2 * Math.PI * radius * height + 2 * Math.PI * Math.Pow(radius, 2));
    }   

}