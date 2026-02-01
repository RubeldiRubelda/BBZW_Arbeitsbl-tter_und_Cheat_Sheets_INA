using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aufgabe_11__Jahreszeiten_mit_Fallauswahl_
{
    internal class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                Console.Write("\x1b[37mBitte geben Sie einen Monat (1-12) ein (oder tippe 'Quit' zum Beenden): ");
                var input = Console.ReadLine();
                if (byte.TryParse(input, out byte Num))
                {
                    switch (Num)
                    { 
                        case 1:
                        case 2:                       
                        case 12:
                            Console.WriteLine($"\x1b[38;5;10mDer {Num}. Monat ist ein Wintermonat.");
                            break;

                        case 3:
                        case 4:
                        case 5:
                            Console.WriteLine($"\x1b[38;5;10mDer {Num}. Monat ist ein Frühlingsmonat.");
                            break;

                        case 6:
                        case 7:
                        case 8:
                            Console.WriteLine($"\x1b[38;5;10mDer {Num}. Monat ist ein Sommermonat.");
                            break;

                        case 9:
                        case 10:
                        case 11:
                            Console.WriteLine($"\x1b[38;5;10mDer {Num}. Monat ist ein Herbstmonat.");
                            break;

                        default:
                            Console.WriteLine("\x1b[38;5;9mUngültige Eingabe. Bitte geben Sie eine Zahl von 1-12 ein.");
                            break;
                    }
                }
                else if (input?.ToLower() == "quit")
                {
                    break;
                }
                else
                {
                    Console.WriteLine("\x1b[38;5;9mUngültige Eingabe. Bitte geben Sie eine Zahl zwischen 0 und 100 ein.");
                }

                Console.Write("\n");
            }
        }
    }
}
