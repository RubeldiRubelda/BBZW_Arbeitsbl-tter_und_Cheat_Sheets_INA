using System;
namespace Program
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Grüezi! Willkomme bii Meteo!");
            Console.Write("Gib en Kommazahl ii: ");
            string input = Console.ReadLine();
            double temperature = 0; // Initialisierung der Variable
            bool isValidTemperature = false; // Flag für gültige Eingabe

            try
            {
                temperature = Convert.ToDouble(input);
                isValidTemperature = true; // Eingabe ist gültig
                Console.WriteLine($"Du hesch {temperature} Grad ii gäh.");
            }
            catch (FormatException)
            {
                Console.WriteLine("Bitte gib en gültigi Kommazahl ii.");
            }
            catch (OverflowException)
            {
                Console.WriteLine("Die Zahl isch z'grooss oder z'klein.");
            }

            if (isValidTemperature) // Nur fortfahren, wenn die Eingabe gültig ist
            {
                Console.Write("Wähl d'Einheit zum Umrechne (C für Celsius, F für Fahrenheit, K für Kelvin): ");
                string? unitInput = Console.ReadLine(); // Nullable string
                string unit = unitInput != null ? unitInput.ToUpper() : string.Empty; // Null-Check

                double convertedTemp;
                switch (unit)
                {
                    case "C":
                        convertedTemp = temperature;
                        Console.WriteLine($"Die Temperatur isch {convertedTemp} °C.");
                        break;
                    case "F":
                        convertedTemp = (temperature * 9 / 5) + 32;
                        Console.WriteLine($"Die Temperatur isch {convertedTemp} °F.");
                        break;
                    case "K":
                        convertedTemp = temperature + 273.15;
                        Console.WriteLine($"Die Temperatur isch {convertedTemp} K.");
                        break;
                    default:
                        Console.WriteLine("Ungültigi Einheit. Bitte wähl C, F oder K.");
                        break;
                }
            }
        }
    }
}