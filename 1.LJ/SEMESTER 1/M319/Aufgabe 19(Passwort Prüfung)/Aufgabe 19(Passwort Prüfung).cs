using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aufgabe_19_Passwort_Prüfung_
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("PasswortPrüfer300");
            Console.WriteLine("Bitte geben Sie ein Passwort ein: ");
            string Input = Console.ReadLine();

            if (PasswortPruefen(Input))
            {
                Console.WriteLine("Das Passwort ist sicher.");
            }
            else
            {
                Console.WriteLine("Das Passwort ist unsicher.");
            }

            Console.ReadKey();
        }

        static bool PasswortPruefen(string passwort)
        {
            if (passwort.Length < 8)
            {
                return false;
            }
             
            bool hatGrossbuchstabe = false;
            bool hatKleinbuchstabe = false;
            bool hatZahl = false;
            bool hatSonderzeichen = false;

            foreach (char c in passwort)
            {
                if (char.IsUpper(c))
                    hatGrossbuchstabe = true;
                else if (char.IsLower(c))
                    hatKleinbuchstabe = true;
                else if (char.IsDigit(c))
                    hatZahl = true;
                else if (!char.IsLetterOrDigit(c))
                    hatSonderzeichen = true;
            }
            return hatGrossbuchstabe && hatKleinbuchstabe && hatZahl && hatSonderzeichen;
        }
    }
}
