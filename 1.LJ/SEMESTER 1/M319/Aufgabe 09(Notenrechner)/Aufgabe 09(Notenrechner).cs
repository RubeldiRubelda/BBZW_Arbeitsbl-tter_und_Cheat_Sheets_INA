using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aufgabe_9__Notenrechner_
{
    internal class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                Console.Write("Bitte geben Sie ihre Punktzahl ein (oder tippe 'Quit' zum Beenden): ");
                var input = Console.ReadLine();
                if (byte.TryParse(input, out byte Points))
                {
                    if (Points >= 0 && Points <= 100)
                    {
                        if (Points >= 90)
                        {
                            Console.WriteLine("Sehr gut");
                        }
                        else if (Points >= 80)
                        {
                            Console.WriteLine("Gut");
                        }
                        else if (Points >= 70)
                        {
                            Console.WriteLine("Befriedigend");
                        }
                        else if (Points >= 60)
                        {
                            Console.WriteLine("Ausreichend");
                        }
                        else if (Points <= 59)
                        {
                            Console.WriteLine("Nicht bestanden");
                        }
                    }
                    else
                    {
                        Console.WriteLine("Ungültige Punktzahl. Bitte geben Sie eine Zahl zwischen 0 und 100 ein.");
                    }
                }
                else if (input.ToLower() == "quit")
                {
                    break;
                }
                else
                {
                    Console.WriteLine("Ungültige Eingabe. Bitte geben Sie eine Zahl zwischen 0 und 100 ein.");
                }

                Console.WriteLine("");
            }
            
        }
    }
}
