# Repetitionsaufgaben: UML

## Verständnisfragen

1. **Notation:** Was bedeuten die Symbole `+`, `-` und `#` in einem UML-Klassendiagramm? Welchen C#-Schlüsselwörtern entsprechen sie?

   * `+` steht für **öffentlich** (zugriffsberechtigt von überall) und entspricht in C# dem Schlüsselwort `public`.
   * `-` steht für **privat** (Zugriff nur innerhalb der eigenen Klasse) und entspricht in C# dem Schlüsselwort `private`.
   * `#` steht für **geschützt** (Zugriff innerhalb der eigenen Klasse sowie in abgeleiteten Unterklassen) und entspricht in C# dem Schlüsselwort `protected`.
     *(Zusatzhinweis: `~` steht in UML für Package-Sichtbarkeit, was in C# am ehesten `internal` entspricht.)*
2. **Pfeile:** Zeichne (oder beschreibe) den Pfeil für (a) Vererbung, (b) Interface-Implementierung, (c) Assoziation. Wie unterscheidet man sie?

   * **(a) Vererbung (Generalisierung):** Durchgezogene Linie mit einer **geschlossenen, nicht ausgefüllten (weissen) Dreiecksspitze** zur Basisklasse (`Unterklasse ────▷ Basisklasse`).
   * **(b) Interface-Implementierung (Realisierung):** **Gestrichelte** Linie mit einer **geschlossenen, nicht ausgefüllten (weissen) Dreiecksspitze** zum Interface (`Klasse - - - -▷ Interface`).
   * **(c) Assoziation:** Einfache **durchgezogene Linie** zwischen zwei Klassen (bei gerichteter Navigierbarkeit mit einer **offenen Pfeilspitze**: `KlasseA ────> KlasseB`, bei ungerichteter Assoziation ganz ohne Pfeilspitze: `KlasseA ──── KlasseB`).
   * **Unterscheidung:** Man achtet auf zwei Merkmale: **Linienart** (durchgezogen vs. gestrichelt) und **Spitzenform** (geschlossenes weisses Dreieck für Vererbungs-/Typ-Hierarchien vs. offene Spitze oder gar keine Spitze für Objektbeziehungen).
3. **Abstrakte Notation:** Wie wird eine abstrakte Klasse oder eine abstrakte Methode in UML gekennzeichnet?

   * In UML werden der Name einer abstrakten Klasse sowie die Signatur einer abstrakten Methode **kursiv** (*italic*) geschrieben.
   * Alternativ oder ergänzend (vor allem bei handschriftlichen Diagrammen, wo Kursivschrift schwer erkennbar ist) wird das Stereotyp `«abstract»` über den Klassennamen oder `{abstract}` hinter den Methodennamen gesetzt.
4. **Multiplizität:** Was bedeutet `Owner 1 ─── 0..* Animal`? Und was würde `0..1` bedeuten?

   * `Owner 1 ─── 0..* Animal` bedeutet: Ein `Animal`-Objekt gehört zu **genau einem** (`1`) `Owner`, während ein `Owner` **null, ein oder beliebig viele** (`0..*`) `Animal`-Objekte besitzen kann.
   * `0..1` bedeutet **optional bzw. höchstens eins** (null oder genau ein Objekt).
5. **Reverse Engineering:** Ein Klassendiagramm zeigt `Order *────1 Customer`. Schreibe eine C#-Property-Deklaration in `Order`, die dies umsetzt, und gib an, was (falls überhaupt) `Customer` zurückhält.

   * **C#-Property in `Order`:** Da jede Bestellung genau einen Kunden hat, hält `Order` eine Referenz auf ein `Customer`-Objekt:
     ```csharp
     public class Order
     {
         public Customer Customer { get; set; }
     }
     ```
   * **Was `Customer` zurückhält:** Bei einer ungerichteten Assoziation (ohne Pfeilspitzen) oder wenn nur `Order` den `Customer` kennen muss, hält `Customer` **gar nichts** zurück (keine Referenz auf `Order`). Soll die Beziehung jedoch bidirektional navigierbar sein (damit man vom Kunden aus direkt alle seine Bestellungen abrufen kann), hält `Customer` eine Sammlung von Bestellungen (z. B. `public List<Order> Orders { get; set; } = new List<Order>();`).
