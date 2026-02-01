using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aufgabe_4a__Aus_Eingaben_Informationen_berechnen_und_ausgeben_
{
    internal class Program
    {
        static void Main(string[] args)
        {
            double chosenNum;
            double roundedNum;

            Console.Write("Wähle eine Zahl von 0 bis 100'000 ");
            chosenNum = Convert.ToDouble(Console.ReadLine());

            chosenNum /= 100;
            roundedNum = Math.Round(chosenNum, 0) * 100;

            Console.Write(roundedNum);

        }
    }
}
