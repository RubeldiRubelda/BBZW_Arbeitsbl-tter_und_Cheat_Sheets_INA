class Program
{
    static void Main()
    {
        // Zylinder
        Cylinder c1 = new Cylinder();

        // Radius
        c1.SetRadius(5.25);
        // Höhe
        c1.SetHeight(20.5);

        // Durchmesser
        double diameter1 = c1.GetDiameter();
        // Grundfläche
        double baseArea1 = c1.GetBaseArea();
        // Volumen
        double volume1 = c1.GetVolume();

        // Umfang
        double circumference1 = c1.GetCircumference();
        // Mantelfläche
        double lateralArea1 = c1.GetLateralArea();
        // Oberfläche
        double surfaceArea1 = c1.GetSurfaceArea();

        Console.WriteLine("Cylinder 01:");
        Console.WriteLine("radius = " + c1.GetRadius());
        Console.WriteLine("height = " + c1.GetHeight());
        Console.WriteLine("base area = " + baseArea1);
        Console.WriteLine("diameter = " + diameter1);
        Console.WriteLine("base area = " + baseArea1);
        Console.WriteLine("volume = " + volume1);
        Console.WriteLine("circumference = " + circumference1);
        Console.WriteLine("lateral area = " + lateralArea1);
        Console.WriteLine("surface area = " + surfaceArea1);
        Console.WriteLine();

        //--------------------------------------------- 

        Cylinder z2 = new Cylinder(15.0, 15.5); // Param1 = Radius, Param2 = Höhe

        double volume2 = z2.GetVolume();
        double surfaceArea2 = z2.GetSurfaceArea();

        Console.WriteLine("Cylinder 02:");
        Console.WriteLine("volume = " + volume2);
        Console.WriteLine("surface area = " + surfaceArea2);
        Console.WriteLine();

        //---------------------------------------------

        double surfaceArea3 = Cylinder.GetSurfaceArea(25.25, 20.0); // Param1 = Radius, Param2 = Höhe

        Console.WriteLine("Cylinder 03:");
        Console.WriteLine("surface area = " + surfaceArea3);
        Console.WriteLine();
    }
}
