using System;

namespace Aufgabe15
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int anzahl = 1;
            double wert1 = 0, wert2 = 0, wert3 = 0, max = 0;

            Console.Write("Wert " + Convert.ToString(anzahl++));
            if (!double.TryParse(Console.ReadLine(), out wert1))
            {
                Console.WriteLine("Ungültige Eingabe; verwende 0.");
                wert1 = 0;
            }

            Console.Write("Wert " + Convert.ToString(anzahl++));
            if (!double.TryParse(Console.ReadLine(), out wert2))
            {
                Console.WriteLine("Ungültige Eingabe; verwende 0.");
                wert2 = 0;
            }

            Console.Write("Wert " + Convert.ToString(anzahl++));
            if (!double.TryParse(Console.ReadLine(), out wert3))
            {
                Console.WriteLine("Ungültige Eingabe; verwende 0.");
                wert3 = 0;
            }

            // Einfachere, sichere Bestimmung des Maximums
            max = wert1;
            if (wert2 > max) max = wert2;
            if (wert3 > max) max = wert3;

            Console.WriteLine("Der grösste Wert ist: " + max);
            Console.WriteLine("Drücke Enter zum Beenden...");
            Console.ReadLine();
        }
    }
}


// Erklärung wieso der Fehler auftritt:
// In der if-Bedingung fehlt die Variable vor dem zweiten Vergleichsoperator '>'. wert3.
// Der korrekte Ausdruck sollte 'if (wert1 > wert2 && wert1 > wert3)' lauten, um zu überprüfen, ob wert1 größer als sowohl wert2 als auch wert3 ist. wert1 > wert3)
