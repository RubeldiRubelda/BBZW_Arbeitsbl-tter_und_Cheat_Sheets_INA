using System;
using System.Collections.Generic;

namespace SurseeMuseum
{
    public class Visitor
    {
        public string LastName { get; init; }
        public string FirstName { get; init; }

        public Visitor(string lastName, string firstName)
        {
            LastName = lastName;
            FirstName = firstName;
        }
    }

    public class Room
    {
        public string RoomLabel { get; }

        public Room(string roomLabel)
        {
            RoomLabel = roomLabel;
        }
    }

    public class Exhibit
    {
        public string Label { get; }
        public Room Location { get; set; }

        public Exhibit(string label)
        {
            Label = label;
        }
    }

    public class Museum
    {
        private readonly List<Room> _rooms = new List<Room>();
        private readonly List<Visitor> _visitors = new List<Visitor>();

        public string Name { get; }
        public IReadOnlyList<Visitor> Visitors => _visitors.AsReadOnly();

        public Museum(string name)
        {
            Name = name;
        }

        public void AddVisitor(Visitor visitor)
        {
            if (!_visitors.Contains(visitor))
            {
                _visitors.Add(visitor);
                Console.WriteLine($"Besucher {visitor.FirstName} {visitor.LastName} hat das Museum betreten.");
            }
        }

        public void RemoveVisitor(Visitor visitor)
        {
            if (_visitors.Contains(visitor))
            {
                _visitors.Remove(visitor);
                Console.WriteLine($"Besucher {visitor.FirstName} {visitor.LastName} hat das Museum verlassen.");
            }
        }

        public void AddRoom(string roomLabel)
        {
            if (!_rooms.Exists(r => r.RoomLabel == roomLabel))
            {
                _rooms.Add(new Room(roomLabel));
                Console.WriteLine($"Raum '{roomLabel}' wurde zum Museum hinzugefügt.");
            }
        }

        public void PutExhibitInRoom(Exhibit exhibit, string roomLabel)
        {
            Room room = _rooms.Find(r => r.RoomLabel == roomLabel);
            if (room != null)
            {
                exhibit.Location = room;
                Console.WriteLine($"Exponat '{exhibit.Label}' wurde in den Raum '{roomLabel}' gestellt.");
            }
            else
            {
                Console.WriteLine($"Fehler: Raum '{roomLabel}' existiert nicht.");
            }
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            // Museum initialisieren
            Museum museum = new Museum("Sursee-Museum");

            // Räume anlegen
            museum.AddRoom("Urgeschichte");
            museum.AddRoom("Stadtheimat");
            museum.AddRoom("Sonderschau");

            // Ausstellungsstücke erstellen und in Räume einsortieren
            Exhibit exhibit1 = new Exhibit("Steinbeil");
            Exhibit exhibit2 = new Exhibit("Historische Urkunde");
            Exhibit exhibit3 = new Exhibit("Gemälde Altstadt");

            museum.PutExhibitInRoom(exhibit1, "Urgeschichte");
            museum.PutExhibitInRoom(exhibit2, "Stadtheimat");
            museum.PutExhibitInRoom(exhibit3, "Sonderschau");

            // Besucher erzeugen
            Visitor v1 = new Visitor("Müller", "Hans");
            Visitor v2 = new Visitor("Meier", "Anna");

            // Besucher kommen und gehen lassen
            Console.WriteLine();
            museum.AddVisitor(v1);
            museum.AddVisitor(v2);

            Console.WriteLine($"\nAktuelle Besucher im {museum.Name}: {museum.Visitors.Count}\n");

            museum.RemoveVisitor(v1);

            Console.WriteLine($"\nAktuelle Besucher im {museum.Name}: {museum.Visitors.Count}\n");
        }
    }
}