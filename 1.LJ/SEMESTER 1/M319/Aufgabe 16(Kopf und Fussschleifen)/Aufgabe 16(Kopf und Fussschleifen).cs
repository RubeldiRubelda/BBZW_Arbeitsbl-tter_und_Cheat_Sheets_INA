using System;
namespace Program
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Hier sind meine GRANDIOSEN Hausaufgaben :) 
            // Aufgabe 1
            Console.WriteLine("Aufgabe 1: Zählen von 1 bis 10");
            for (int i = 1; i <= 10; i++)
            {
                Console.WriteLine(i);
            }

            // Aufgabe 2
            Console.WriteLine("\n\n Aufgabe 2: Summe von 1 bis 50");
            int sum = 0;
            for (int i = 1; i <= 50; i++)
            {
                sum += i;
            }
            Console.WriteLine("Die Summe ist: " + sum);

            // Aufgabe 3
            Console.WriteLine("\n Aufgabe 3: Gerade Zahlen zwischen 1 und 100");
            for (int i = 1; i <= 100; i++)
            {
                if (i % 2 == 0)
                {
                    Console.WriteLine(i);
                }
            }

            // Aufgabe 4
            Console.WriteLine("\n Aufgabe 4: Countdown von 25 bis 1");
            for (int i = 25; i >= 1; i--)
            {
                Console.WriteLine(i);
            }
        }
    }
}