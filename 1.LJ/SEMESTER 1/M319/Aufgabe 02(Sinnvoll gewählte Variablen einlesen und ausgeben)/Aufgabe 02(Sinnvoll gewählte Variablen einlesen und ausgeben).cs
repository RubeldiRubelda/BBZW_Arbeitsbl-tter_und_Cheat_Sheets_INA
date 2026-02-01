using System;
namespace Test_Konsole
{
    internal class Program
    {
        static void Main(string[] args)
        {
            UInt32 stepsPerDay;
            char Umweltkategorie;
            float bankBalance;
            Int16 positionX;



            Console.Write("How many Steps do you have per day? ");
            stepsPerDay = Convert.ToUInt32(Console.ReadLine());

            Console.Write("What is your Umweltkategorie? ");
            Umweltkategorie = Convert.ToChar(Console.ReadLine());

            Console.Write("What's your bank balance? ");
            bankBalance = Convert.ToSingle(Console.ReadLine());

            Console.Write("What is your position on the X Axis between -1000 and +1000? ");
            positionX = Convert.ToInt16(Console.ReadLine());

            Console.WriteLine("\n");

            Console.WriteLine($"Steps per Day: {stepsPerDay}");
            Console.WriteLine($"Umweltkategorie: {Umweltkategorie}");
            Console.WriteLine($"Bank Balance: {bankBalance}");
            Console.WriteLine($"Position X: {positionX}");
        }

    }
}

