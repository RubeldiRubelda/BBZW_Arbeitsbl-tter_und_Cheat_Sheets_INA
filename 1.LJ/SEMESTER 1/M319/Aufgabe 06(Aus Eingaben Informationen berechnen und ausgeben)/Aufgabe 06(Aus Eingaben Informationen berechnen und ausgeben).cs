using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aufgabe_6
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Stunden: ");
            uint Hours = uint.Parse(Console.ReadLine());

            Console.Write("Minuten: ");
            ushort Minutes = ushort.Parse(Console.ReadLine());

            Console.Write("Sekunden: ");
            byte Seconds = byte.Parse(Console.ReadLine());

            float AllHours = Hours + (float)(Minutes / 60.0) + (float)(Seconds / 3600.0);

            Console.WriteLine($"Resultat: {AllHours} h");

            Console.ReadKey();
        }
    }
}
