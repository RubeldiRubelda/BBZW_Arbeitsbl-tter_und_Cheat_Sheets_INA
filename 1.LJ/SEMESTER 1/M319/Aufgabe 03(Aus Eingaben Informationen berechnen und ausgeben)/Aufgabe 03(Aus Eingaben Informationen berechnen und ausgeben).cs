using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting;
using System.Text;
using System.Threading.Tasks;

namespace Aufgabe_03__Aus_Eingaben_Informationen_berechnen_und_ausgeben_
{
    internal class Program
    {
        static void Main(string[] args)
        {
            byte CarSpeed;
            UInt32 Distance;
            float FuelConsumption;

            Console.Write("Wie schnell ist dein Auto in km/h? ");
            CarSpeed = Convert.ToByte(Console.ReadLine());

            Console.Write("Wie weit willst du fahren in km? ");
            Distance = Convert.ToUInt32(Console.ReadLine());

            Console.Write("Wie viele Liter verbraucht dein Auto auf 100 km? ");
            FuelConsumption = Convert.ToSingle(Console.ReadLine());

            Console.WriteLine($"Du wirst {(double)Distance / (double)CarSpeed * 60} Minuten brauchen.");
            Console.WriteLine($"Du wirst {Distance / 100.00 * FuelConsumption}");
        }
    }
}
