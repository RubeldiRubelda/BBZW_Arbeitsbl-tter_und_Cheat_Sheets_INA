using System;

public class ZahlenRatespiel
{
    public static void Main(string[] args)
    {

        Random random = new Random();
        string spielWiederholen;

      
        do
        {
            int gesuchteZahl = random.Next(1, 101); // Zahl generieren
            int gerateneZahl = 0; // Eingabe resetten
            int versuche = 0; // Versuche Resetten
            
            Console.WriteLine("--- Hallo zum GRANDIOSEN Zahelspiel! ---");
            Console.WriteLine("Ich habe mir eine Zahl zwischen 1 und 100 ausgedacht. Rate!");


            while (gerateneZahl != gesuchteZahl)
            {
                Console.Write("Gib deine Vermutung ein: ");
                
                if (int.TryParse(Console.ReadLine(), out gerateneZahl))
                {
                    versuche++;

                    
                    if (gerateneZahl > gesuchteZahl)
                    {
                        Console.WriteLine("Zu hoch!");
                    }
                    else if (gerateneZahl < gesuchteZahl)
                    {
                        Console.WriteLine("Zu niedrig!");
                    }
                }
                else
                {
                    Console.WriteLine("Ungültige Eingabe.");
                }
            }
            // ERFOLG YEEPEEE
            Console.WriteLine($"\n**Richtig!** Du hast die Zahl {gesuchteZahl} in {versuche} Versuchen erraten.");
            
            Console.Write("Möchtest du noch einmal spielen? (j/n): ");
            spielWiederholen = Console.ReadLine()?.ToLower();

        } while (spielWiederholen == "j");

        Console.WriteLine("\nDanke fürs Spielen! Das Programm wird beendet.");
    }
}