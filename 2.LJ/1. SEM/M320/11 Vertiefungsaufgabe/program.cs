using System;

namespace Vertiefungsaufgabe11
{
    /// <summary>
    /// Repräsentiert eine smarte Lampe, die über das Heimnetzwerk gesteuert werden kann.
    /// </summary>
    /// <remarks>
    /// Diese Klasse dient als praktisches Beispiel für die strukturierte XML-Dokumentation in C#.
    /// </remarks>
    public class SmartLamp
    {
        /// <summary>
        /// Ruft den Namen oder die Bezeichnung der Lampe ab oder legt diesen fest.
        /// </summary>
        /// <value>Der Name des Geräts als Zeichenkette.</value>
        public string Name { get; set; }

        private int _brightness;

        /// <summary>
        /// Ruft die aktuelle Helligkeit der Lampe in Prozent ab oder legt sie fest (0 bis 100).
        /// </summary>
        /// <value>Ein ganzzahliger Wert zwischen 0 (ausgeschaltet) und 100 (volle Helligkeit).</value>
        /// <exception cref="ArgumentOutOfRangeException">Wird geworfen, wenn der Wert ausserhalb des Bereichs von 0 bis 100 liegt.</exception>
        public int Brightness
        {
            get => _brightness;
            set
            {
                if (value < 0 || value > 100)
                    throw new ArgumentOutOfRangeException(nameof(value), "Die Helligkeit muss zwischen 0 und 100 liegen.");
                _brightness = value;
            }
        }

        /// <summary>
        /// Initialisiert eine neue Instanz der <see cref="SmartLamp"/>-Klasse.
        /// </summary>
        /// <param name="name">Der Name der Lampe.</param>
        /// <param name="initialBrightness">Die initiale Helligkeit bei der Erstellung (Standard ist 50).</param>
        public SmartLamp(string name, int initialBrightness = 50)
        {
            Name = name;
            Brightness = initialBrightness;
        }

        /// <summary>
        /// Ändert die Helligkeit der Lampe um den angegebenen Prozentwert.
        /// </summary>
        /// <param name="percent">Der Prozentsatz, um den die Helligkeit angepasst werden soll (positive oder negative Werte).</param>
        /// <returns>Die neue Helligkeit nach der Anpassung als Ganzzahl.</returns>
        public int Dim(int percent)
        {
            Brightness = Math.Clamp(Brightness + percent, 0, 100);
            return Brightness;
        }
    }

    /// <summary>
    /// Die Hauptklasse des Programms.
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            // Teste hier die IDE-Hilfestellungen (IntelliSense):
            // Bewege den Cursor über "SmartLamp", ".Brightness" oder ".Dim()", 
            // um zu prüfen, ob die Dokumentation korrekt im Pop-up angezeigt wird.

            SmartLamp livingRoomLight = new SmartLamp("Wohnzimmer Decke", 70);

            livingRoomLight.Brightness = 85;
            int newLevel = livingRoomLight.Dim(10);

            Console.WriteLine($"Lampe '{livingRoomLight.Name}' ist nun auf {newLevel}% eingestellt.");
        }
    }
}