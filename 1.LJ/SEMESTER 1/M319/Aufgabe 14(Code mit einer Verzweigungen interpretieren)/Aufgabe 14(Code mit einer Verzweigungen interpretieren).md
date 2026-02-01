Code:



´´´cs

    public static void Main(string\[] args)

    {

    Console.Write("Zahl 1: ");

    int zahl1 = Convert.ToInt32(Console.ReadLine());

    

    Console.Write("Zahl 2: ");

    int zahl2 = Convert.ToInt32(Console.ReadLine());

    int zahl3 = zahl1 + 10;

    

    zahl1 = zahl2 - 10;

    zahl2 = zahl3;

    

    if (zahl2 % 10 >= 5)

    {

        zahl2 = zahl2 + 10 - (zahl2 % 10);

    }

    else

    {

        zahl2 = zahl2 - (zahl2 % 10);

    }

    

    Console.WriteLine("Zahl 1 = " + zahl1);

    Console.WriteLine("Zahl 2 = " + zahl2);

    

    Console.ReadLine();


    }



``

Lösung:

Eingabe: Zahl 1 = 22, Zahl 2 = 36

Ausgabe: Zahl 1 = 26, Zahl 2 = 30





Eingabe: Zahl 1 = 47, Zahl 2 = 44

Ausgabe: Zahl 1 = 34, Zahl 2 = 60





Eingabe: Zahl 1 = 14, Zahl 2 = 55

Ausgabe: Zahl 1 = 45, Zahl 2 = 20




Eingabe: Zahl 1 = 55, Zahl 2 = 24

Ausgabe: Zahl 1 = 14, Zahl 2 = 70
