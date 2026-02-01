using System;

namespace PAP_Aufgabe3
{
    class Program
    {
        static void Main(string[] args)
        {
            // Schritt 1: Start (implizit beim Programmstart)
            
            // Schritt 2: Punktzahl einlesen
            Console.Write("Geben Sie Ihre Punktzahl ein: ");
            string eingabe = Console.ReadLine();
            int punktzahl = int.Parse(eingabe);
            
            // Schritt 3 & 4: Prüfen ob >= 50 und Ergebnis ausgeben
            if (punktzahl >= 50)
            {
                // Punktzahl ist >= 50: bestanden
                Console.WriteLine("bestanden");
            }
            else
            {
                // Punktzahl ist < 50: nicht bestanden
                Console.WriteLine("nicht bestanden");
            }
            
            // Schritt 5: Ende (implizit beim Programmende)
            Console.WriteLine("\nDrücken Sie eine Taste zum Beenden...");
            Console.ReadKey();
        }
    }
}
