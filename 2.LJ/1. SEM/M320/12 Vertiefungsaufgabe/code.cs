using System;
using System.Collections.Generic;
using System.Linq;

namespace BookStoreSystem
{
    /// <summary>
    /// Repräsentiert eine abstrakte Basisklasse für alle Buchtypen im System.
    /// Kann nicht direkt instanziiert werden.
    /// </summary>
    public abstract class Book
    {
        /// <summary>
        /// Ruft den Titel des Buches ab oder legt diesen fest.
        /// </summary>
        public string Title { get; set; }

        ///<summary>
        /// Ruft die internationale Standardbuchnummer (ISBN) ab oder legt sie fest.
        /// </summary>
        public string Isbn { get; set; }

        /// <summary>
        /// Ruft den Grundpreis des Buches ab oder legt ihn fest.
        /// </summary>
        public decimal BasePrice { get; set; }

        /// <summary>
        /// Initialisiert eine neue Instanz der <see cref="Book"/>-Klasse.
        /// </summary>
        protected Book(string title, string isbn, decimal basePrice)
        {
            Title = title;
            Isbn = isbn;
            BasePrice = basePrice;
        }

        /// <summary>
        /// Berechnet den Endpreis des Buches inklusive typspezifischer Gebühren (z. B. Porto).
        /// </summary>
        /// <returns>Der berechnete Preis als Dezimalzahl.</returns>
        public abstract decimal GetPrice();
    }

    /// <summary>
    /// Repräsentiert ein physisches Buch mit zusätzlichem Gewicht und Versandkosten.
    /// </summary>
    public class PhysicalBook : Book
    {
        /// <summary>
        /// Ruft das Gewicht des Buches in Gramm ab oder legt es fest.
        /// </summary>
        public int WeightInGrams { get; set; }

        private const decimal ShippingCost = 2.00m;

        /// <summary>
        /// Initialisiert eine neue Instanz der <see cref="PhysicalBook"/>-Klasse.
        /// </summary>
        public PhysicalBook(string title, string isbn, decimal basePrice, int weightInGrams) 
            : base(title, isbn, basePrice)
        {
            WeightInGrams = weightInGrams;
        }

        /// <inheritdoc />
        public override decimal GetPrice()
        {
            // Physische Bücher erhalten eine feste Versandkostenpauschale von CHF 2.00
            return BasePrice + ShippingCost;
        }
    }

    /// <summary>
    /// Repräsentiert ein elektronisches Buch (E-Book) ohne Versandkosten.
    /// </summary>
    public class EBook : Book
    {
        /// <summary>
        /// Ruft die Dateigrösse in MB ab oder legt sie fest.
        /// </summary>
        public double FileSizeMb { get; set; }

        /// <summary>
        /// Initialisiert eine neue Instanz der <see cref="EBook"/>-Klasse.
        /// </summary>
        public EBook(string title, string isbn, decimal basePrice, double fileSizeMb) 
            : base(title, isbn, basePrice)
        {
            FileSizeMb = fileSizeMb;
        }

        /// <inheritdoc />
        public override decimal GetPrice()
        {
            // E-Books haben kein Porto
            return BasePrice;
        }
    }

    /// <summary>
    /// Repräsentiert einen Kunden der Buchhandlung.
    /// </summary>
    public class Customer
    {
        private string _email;

        /// <summary>
        /// Ruft den Namen des Kunden ab oder legt ihn fest.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Ruft die E-Mail-Adresse des Kunden ab oder legt sie fest. Wird auf Gültigkeit geprüft.
        /// </summary>
        /// <exception cref="ArgumentException">Wird geworfen, wenn die E-Mail kein '@' enthält.</exception>
        public string Email
        {
            get => _email;
            set
            {
                // Validierung: E-Mail muss ein '@' enthalten
                if (string.IsNullOrWhiteSpace(value) || !value.Contains("@"))
                {
                    throw new ArgumentException("Die E-Mail-Adresse ist ungültig (muss ein '@' enthalten).", nameof(value));
                }
                _email = value;
            }
        }

        /// <summary>
        /// Gibt an, ob der Kunde Mitglied ist (und somit von Rabatten profitiert).
        /// </summary>
        public bool IsMember { get; set; }

        /// <summary>
        /// Initialisiert eine neue Instanz der <see cref="Customer"/>-Klasse.
        /// </summary>
        public Customer(string name, string email, bool isMember)
        {
            Name = name;
            Email = email;
            IsMember = isMember;
        }

        /// <summary>
        /// Gibt eine Bestellung mit den ausgewählten Büchern für diesen Kunden auf.
        /// </summary>
        /// <param name="books">Ein Array von Büchern, die bestellt werden sollen.</param>
        /// <returns>Die erstellte <see cref="Order"/>-Instanz.</returns>
        public Order PlaceOrder(params Book[] books)
        {
            return new Order(this, books);
        }
    }

    /// <summary>
    /// Definiert die Schnittstelle für flexible Rabattregeln.
    /// </summary>
    public interface IDiscountRule
    {
        /// <summary>
        /// Berechnet den Rabattbetrag für die übergebenen Bücher.
        /// </summary>
        /// <param name="books">Die Liste der bestellten Bücher.</param>
        /// <returns>Der Rabattbetrag als positive Dezimalzahl.</returns>
        decimal CalculateDiscount(IEnumerable<Book> books);

        /// <summary>
        /// Ruft die Beschreibung des Rabatts für die Ausgabe ab.
        /// </summary>
        string Description { get; }
    }

    /// <summary>
    /// Rabattregel für E-Books (15% Rabatt auf alle E-Books im Warenkorb).
    /// </summary>
    public class EBookDiscountRule : IDiscountRule
    {
        public string Description => "Ebook discount";

        public decimal CalculateDiscount(IEnumerable<Book> books)
        {
            // 15% Rabatt nur auf E-Books basierend auf ihrem Grundpreis/Preis
            decimal totalEBookPrice = books.OfType<EBook>().Sum(b => b.GetPrice());
            return totalEBookPrice * 0.15m;
        }
    }

    /// <summary>
    /// Repräsentiert eine Kundenbestellung mit Bestellnummer, Datum und Artikeln.
    /// </summary>
    public class Order
    {
        private static int _counter = 1000;

        /// <summary>
        /// Ruft die automatisch vergebene Bestellnummer ab.
        /// </summary>
        public int OrderNumber { get; }

        /// <summary>
        /// Ruft das Bestelldatum ab.
        /// </summary>
        public DateTime OrderDate { get; }

        /// <summary>
        /// Ruft den Kunden ab, der die Bestellung aufgegeben hat.
        /// </summary>
        public Customer Customer { get; }

        /// <summary>
        /// Ruft die Liste der in dieser Bestellung enthaltenen Bücher ab.
        /// </summary>
        public List<Book> Books { get; }

        /// <summary>
        /// Ruft die Liste der angewandten Rabattregeln ab.
        /// </summary>
        public List<IDiscountRule> DiscountRules { get; } = new List<IDiscountRule>();

        /// <summary>
        /// Initialisiert eine neue Instanz der <see cref="Order"/>-Klasse.
        /// </summary>
        public Order(Customer customer, IEnumerable<Book> books)
        {
            OrderNumber = ++_counter;
            OrderDate = DateTime.Now;
            Customer = customer;
            Books = new List<Book>(books);

            // Automatisch E-Book-Aktion hinzufügen, falls E-Books im Warenkorb sind
            if (Books.OfType<EBook>().Any())
            {
                DiscountRules.Add(new EBookDiscountRule());
            }
        }

        /// <summary>
        /// Berechnet den Gesamtbetrag der Bestellung nach Abzug aller Rabatte.
        /// </summary>
        /// <returns>Den endgültigen Gesamtbetrag.</returns>
        public decimal GetTotal()
        {
            decimal subtotal = Books.Sum(b => b.GetPrice());
            decimal totalDiscount = DiscountRules.Sum(rule => rule.CalculateDiscount(Books));
            
            return subtotal - totalDiscount;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            // Konsolenausgabe für Unicode (CHF-Darstellung) vorbereiten
            Console.OutputEncoding = System.Text.Encoding.UTF8;

            try
            {
                // Test 1: Ungültiges Objekt verhindern (Book ist abstract, kann nicht so erstellt werden: 
                // Book b = new Book("Test", "123", 10.0m); // Kompilierfehler!)

                // Test 2: Kunde erstellen mit E-Mail-Validierung
                Customer alice = new Customer("Alice Schmidt", "alice.schmidt@example.com", isMember: true);

                // Bücher gemäss Beispiel erstellen
                // Clean Code (Physical): Grundpreis 25.00 + 2.00 Porto = 27.00
                Book cleanCode = new PhysicalBook("Clean Code", "978-3826696848", 25.00m, 850);

                // Head First C# (Ebook): Grundpreis 34.00 (kein Porto), 15% E-Book-Rabatt = 5.10
                Book headFirstCSharp = new EBook("Head First C#", "978-1491976708", 34.00m, 45.5);

                // Bestellung aufgeben
                Order order = alice.PlaceOrder(cleanCode, headFirstCSharp);

                // Ausgabe erzeugen (angepasst an das erwartete Format)
                Console.WriteLine($"Customer: {order.Customer.Name} placed order #{order.OrderNumber} on {order.OrderDate:dd.MM.yyyy}");
                Console.WriteLine("Books ordered:");
                Console.WriteLine($"  {cleanCode.Title} (Physical):\t CHF {cleanCode.GetPrice():F2}");
                Console.WriteLine($"  {headFirstCSharp.Title} (Ebook):\t CHF {headFirstCSharp.GetPrice():F2}");

                // Rabatte ausgeben
                foreach (var rule in order.DiscountRules)
                {
                    decimal discountVal = rule.CalculateDiscount(order.Books);
                    Console.WriteLine($"  {rule.Description}:\t- CHF {discountVal:F2}");
                }

                // Gesamtsumme ausgeben
                Console.WriteLine($"1. Total:\t\t\t CHF {order.GetTotal():F2}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Fehler: {ex.Message}");
            }
        }
    }
}