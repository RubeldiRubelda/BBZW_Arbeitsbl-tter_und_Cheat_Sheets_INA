using System;
namespace Program
{
    internal class Program
    {
        static void Main(string[] args)
        {   
            // IISTELLIGE MACHE YEPEE
            string guestname = "Gast";
            string language = "de"; 
            bool timeBasedGreeting = false; 

            Console.WriteLine("Bitte geben Sie Ihre bevorzugte Sprache ein (de, en, fr):");
            string languageInput = Console.ReadLine()?.ToLower();
            if (!string.IsNullOrWhiteSpace(languageInput))
            {
                language = languageInput;
            }

            string namePrompt = language switch
            {
                "de" => "Bitte geben Sie Ihren Namen ein:",
                "en" => "Please enter your name:",
                "fr" => "Veuillez entrer votre nom:",
                _ => "Bitte geben Sie Ihren Namen ein:"
            };

            Console.WriteLine(namePrompt);
            string nameInput = Console.ReadLine();
            if (!string.IsNullOrWhiteSpace(nameInput))
            {
                guestname = nameInput;
            }

            string timeBasedPrompt = language switch
            {
                "de" => "Möchten Sie eine zeitabhängige Begrüßung? (ja/nein):",
                "en" => "Would you like a time-based greeting? (yes/no):",
                "fr" => "Souhaitez-vous une salutation basée sur l'heure? (oui/non):",
                _ => "Möchten Sie eine zeitabhängige Begrüßung? (ja/nein):"
            };

            Console.WriteLine(timeBasedPrompt);
            string timeBasedInput = Console.ReadLine()?.ToLower();
            if (timeBasedInput == "ja" || timeBasedInput == "yes" || timeBasedInput == "oui")
            {
                timeBasedGreeting = true;
            }

            string greeting = "";
            if (timeBasedGreeting)
            {
                int currentHour = DateTime.Now.Hour;
                if (currentHour >= 4 && currentHour < 12)
                {
                    greeting = language switch
                    {
                        "de" => "Guten Morgen",
                        "en" => "Good morning",
                        "fr" => "Bonjour",
                        _ => "Guten Morgen"
                    };
                }
                else if (currentHour >= 12 && currentHour < 18)
                {
                    greeting = language switch
                    {
                        "de" => "Guten Tag",
                        "en" => "Hello",
                        "fr" => "Bonjour",
                        _ => "Guten Tag"
                    };
                }
                else if (currentHour >= 18 && currentHour < 22)
                {
                    greeting = language switch
                    {
                        "de" => "Guten Abend",
                        "en" => "Good evening",
                        "fr" => "Bonsoir",
                        _ => "Guten Abend"
                    };
                }
                else
                {
                    greeting = language switch
                    {
                        "de" => "Gute Nacht",
                        "en" => "Good night",
                        "fr" => "Bonne nuit",
                        _ => "Gute Nacht"
                    };
                }
            }
            else
            {
                greeting = language switch
                {
                    "de" => "Hallo",
                    "en" => "Hello",
                    "fr" => "Bonjour",
                    _ => "Hallo"
                };
            }

            Console.WriteLine($"{greeting}, {guestname}!");
        }
    }
}