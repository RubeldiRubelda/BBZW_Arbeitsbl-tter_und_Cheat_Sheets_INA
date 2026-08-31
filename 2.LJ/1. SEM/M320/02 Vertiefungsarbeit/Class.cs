using System;
public class Cylinder
{
    // Attribute
    private double _radius { get; set; }
    private double _height { get; set; }

    // Konstruktoren
    public Cylinder()
    {
        _radius = 0.0;
        _height = 0.0;
    }
    public Cylinder(double radius, double height)
    {
        _radius = radius;
        _height = height;
    }
    public void SetRadius(double radius)
    {
        _radius = radius;
    }

    // Methoden
    public void SetHeight(double height)
    {
        _height = height;
    }

    public int GetHeight()
    {
        return (int)_height;
    }
    public double GetRadius()
    {
        return _radius;
    }

    public double GetDiameter()
    {
        return 2 * _radius;
    }
    public double GetBaseArea()
    {
        return Math.PI * Math.Pow(_radius, 2);
    }
    public double GetVolume()
    {
        return (GetBaseArea() * _height);
    }
    public double GetCircumference()
    {
        return 2 * Math.PI * _radius;
    }
    public double GetLateralArea()
    {
        return (GetCircumference() * _height);
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