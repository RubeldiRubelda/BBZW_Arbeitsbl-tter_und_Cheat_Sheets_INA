using System;
namespace Kap02_Aufgabe01
{
    class Program
    {
        static void Main(string[] args)
        {
            string firstName; //Hier wird die String variable definiert
            string lastName;
            int ageRightNow;


            Console.Write("Wie lautet dein Vorname? "); // Ausgabe der Frage
            firstName = Console.ReadLine(); // Ermittlung des Vornahmens
            // NICHT AUSFÜHRBARER CODE DENN ES IST EIN KOMMENTAER

            Console.Write("Wie lautet dein Nachname? ");
            lastName = Console.ReadLine();


            Console.Write("Wie alt bist du?");
            ageRightNow = Convert.ToInt32(Console.ReadLine());

            
            Console.WriteLine("\n----------------------------------\n"); // Der Tolle Abstand
            Console.WriteLine("Hallo " + firstName + " " + lastName + ". " + "Bald wirst du " + (ageRightNow + 1) + "."); // Ausgabe des Textes
            Console.ReadLine(); //LEERSCHLAG

        }
    }
} 