using System;

namespace Repetitionsaufgaben.Aufgabe3
{
    public class Engine
    {
        public string Type { get; set; } = "V8 Biturbo";
    }

    // Ursprüngliches Snippet: KOMPOSITION
    // Das Engine-Objekt wird direkt innerhalb von Car erzeugt und verwaltet.
    // Wird das Car-Objekt zerstört, existiert auch diese spezifische Engine-Instanz nicht mehr.
    public class CarComposition
    {
        private Engine _engine = new Engine(); // Komposition (starke Abhängigkeit / Lebenszyklus gekoppelt)
    }

    // Umgeschrieben in: AGGREGATION
    // Das Engine-Objekt wird ausserhalb erstellt und über den Konstruktor (Dependency Injection) übergeben.
    // Wenn Car gelöscht wird, existiert die Engine-Instanz ausserhalb weiterhin.
    public class CarAggregation
    {
        private Engine _engine;

        public CarAggregation(Engine engine)
        {
            _engine = engine ?? throw new ArgumentNullException(nameof(engine));
        }

        public void ShowEngine()
        {
            Console.WriteLine($"Verbauter Motor: {_engine.Type}");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Engine externalEngine = new Engine { Type = "Elektromotor 200kW" };
            CarAggregation car = new CarAggregation(externalEngine);
            car.ShowEngine();

            // Selbst wenn 'car = null' gesetzt wird, existiert 'externalEngine' weiterhin.
        }
    }
}
