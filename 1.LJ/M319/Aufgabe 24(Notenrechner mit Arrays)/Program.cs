using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

namespace Aufgabe_24__Notenrechner_mit_Arrays_
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            double[] Grades = new double[5];
            double GradesAvarage = 0;

            for (int i = 0; i < Grades.Length; i++)
            {
                Console.Write($"{i + 1}. Zahl eingeben (keine Punkte als Komma verwenden): ");
                Grades[i] = ParseInputtoDouble(Console.ReadLine());
            }

            foreach (float Grade in Grades)
            {
                GradesAvarage += Grade;
            }
            GradesAvarage = Math.Round(GradesAvarage / Grades.Length, 1);

            Console.WriteLine($"Der Durchschnittswert (gerundet) beträgt: {GradesAvarage}");
        }

        private static double ParseInputtoDouble(string InputString)
        {
            if (double.TryParse(InputString, out double Num))
            {
                return Num;
            }
            else
            {
                Console.Write("Invalid Input. Try again: ");
                return ParseInputtoDouble(Console.ReadLine());
            }
        }
    }
}