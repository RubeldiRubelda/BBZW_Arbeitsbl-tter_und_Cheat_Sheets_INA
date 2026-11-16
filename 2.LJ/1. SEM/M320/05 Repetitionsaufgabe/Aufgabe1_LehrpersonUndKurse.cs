using System;

namespace Repetitionsaufgaben.Aufgabe1
{
    public class Professor
    {
        public string Name { get; set; }

        public Professor(string name)
        {
            Name = name;
        }
    }

    public class Course
    {
        public string Title { get; set; }
        public Professor Teacher { get; set; }

        public Course(string title, Professor teacher)
        {
            Title = title;
            Teacher = teacher;
        }

        public void PrintInfo()
        {
            Console.WriteLine($"Kurs: {Title}, unterrichtet von {Teacher.Name}");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Professor prof = new Professor("Dr. Müller");

            Course course1 = new Course("Objektorientierte Programmierung", prof);
            Course course2 = new Course("Datenbanken & SQL", prof);

            Console.WriteLine("--- Vor Namensänderung ---");
            course1.PrintInfo();
            course2.PrintInfo();

            // Namensänderung demonstrieren (siehe Diskussionsfrage 2)
            prof.Name = "Prof. Dr. Müller";

            Console.WriteLine("\n--- Nach Namensänderung ---");
            course1.PrintInfo();
            course2.PrintInfo();
        }
    }
}
