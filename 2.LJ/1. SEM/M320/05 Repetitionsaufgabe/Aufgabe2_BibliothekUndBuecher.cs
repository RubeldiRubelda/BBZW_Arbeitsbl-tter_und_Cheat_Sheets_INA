using System;
using System.Collections.Generic;

namespace Repetitionsaufgaben.Aufgabe2
{
    public class Library
    {
        public string Name { get; set; }
        private List<Book> _books = new List<Book>();

        public Library(string name)
        {
            Name = name;
        }

        public void AddBook(Book book)
        {
            if (book == null) return;

            // Falls das Buch bereits in einer anderen Bibliothek ist, dort entfernen
            if (book.CurrentLibrary != null && book.CurrentLibrary != this)
            {
                book.CurrentLibrary.RemoveBook(book);
            }

            if (!_books.Contains(book))
            {
                _books.Add(book);
                book.CurrentLibrary = this;
            }
        }

        public void RemoveBook(Book book)
        {
            if (_books.Remove(book))
            {
                if (book.CurrentLibrary == this)
                {
                    book.CurrentLibrary = null;
                }
            }
        }

        public void PrintInventory()
        {
            Console.WriteLine($"Inventar der {Name}:");
            if (_books.Count == 0)
            {
                Console.WriteLine("  (Keine Bücher vorhanden)");
            }
            else
            {
                foreach (var book in _books)
                {
                    Console.WriteLine($"  - {book.Title} (von {book.Author})");
                }
            }
            Console.WriteLine();
        }
    }

    public class Book
    {
        public string Title { get; set; }
        public string Author { get; set; }
        public Library CurrentLibrary { get; internal set; }

        public Book(string title, string author)
        {
            Title = title;
            Author = author;
        }

        public void TransferTo(Library destination)
        {
            if (destination == null)
            {
                CurrentLibrary?.RemoveBook(this);
                return;
            }

            if (CurrentLibrary == destination) return;

            CurrentLibrary?.RemoveBook(this);
            destination.AddBook(this);
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Library cityLib = new Library("Stadtbibliothek Luzern");
            Library uniLib = new Library("Hochschulbibliothek");

            Book book1 = new Book("Clean Code", "Robert C. Martin");
            Book book2 = new Book("Design Patterns", "Erich Gamma");
            Book book3 = new Book("C# in Depth", "Jon Skeet");

            cityLib.AddBook(book1);
            cityLib.AddBook(book2);
            uniLib.AddBook(book3);

            Console.WriteLine("=== VOR DER VERSCHIEBUNG ===");
            cityLib.PrintInventory();
            uniLib.PrintInventory();

            // Buch verschieben
            Console.WriteLine($"-> Verschiebe '{book1.Title}' von {book1.CurrentLibrary.Name} zu {uniLib.Name}...\n");
            book1.TransferTo(uniLib);

            Console.WriteLine("=== NACH DER VERSCHIEBUNG ===");
            cityLib.PrintInventory();
            uniLib.PrintInventory();
        }
    }
}
