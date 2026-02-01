using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aufgabe_10__Alterskontrolle_für_Kinofilme_
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Bitte geben Sie ihr Alter ein: ");
            var input = Console.ReadLine();
            if (byte.TryParse(input, out byte Age))
            {
                if (Age >= 0 && Age <= 130)
                {
                    if (Age <= 6)
                    {
                        Console.WriteLine("Kein Zutritt zu Kinofilmen");
                    }
                    else if (Age < 12)
                    {
                        Console.WriteLine("Zutritt nur zu Filmen ab 6");
                    }
                    else if (Age < 16)
                    {
                        Console.WriteLine("Zutritt zu Filmen ab 6 und 12");
                    }
                    else if (Age < 18)
                    {
                        Console.WriteLine("Zutritt zu Filmen ab 6, 12 und 16");
                    }
                    else
                    {
                        Console.WriteLine("Zutritt zu allen Filmen (inkl. ab 18)");
                    }
                }
                else
                {
                    Console.WriteLine("Ungültige Alter. Bitte geben Sie ein normales Alter ein.");
                }
            }
            else
            {
                Console.WriteLine("Ungültige Eingabe. Bitte geben Sie ein normales Alter ein.");
            }
            Console.ReadKey();
        }
    }
}
