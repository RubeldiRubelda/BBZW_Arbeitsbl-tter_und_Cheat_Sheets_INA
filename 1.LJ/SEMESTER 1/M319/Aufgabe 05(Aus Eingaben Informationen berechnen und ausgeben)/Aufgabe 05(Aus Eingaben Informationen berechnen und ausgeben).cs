using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;

namespace Aufgabe_5__Aus_Eingaben_Informationen_berechnen_und_ausgeben_
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ushort Weightinkg;
            ushort Heightincm;
            float Heightinm;
            float BodyMassIndex;
            float BodyMassIndexRounded;


            Console.Write("How much do you weigh? ");
            Weightinkg = Convert.ToUInt16(Console.ReadLine());

            Console.Write("How Tall are you in cm? ");
            Heightincm = Convert.ToUInt16(Console.ReadLine());
            Heightinm = Convert.ToSingle(Heightincm) / 100;

            BodyMassIndex = Convert.ToSingle(Weightinkg) / Convert.ToSingle(Math.Pow(Heightinm, 2));
            BodyMassIndexRounded = Convert.ToSingle(Math.Round(BodyMassIndex, 1));
            Console.WriteLine("\n");
            Console.WriteLine($"Your Body Mass Index is {BodyMassIndexRounded}");
        }
    }
}
