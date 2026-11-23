# Vertiefungsaufgabe 13 - UML Sequenzdiagramm

## Aufgabe 1

Visualisiere das dynamische Verhalten der Applikation in dem du das Sequenzprogramm erstellst. Aufrufe von Bibliotheksmethoden (z.B. Console.WriteLine() ) müssen nicht dargestellt werden. Das Diagramm soll den Aktor "Anwender" und die Objekte "Programm", "Boss" und drei Lebenslinien für "Angestellter" aufweisen.

```csharp
class Program
{
    static void Main(string[] args)
    {
        Boss b = new Boss();
        b.setName("Hugo");
        Angestellter a1 = new Angestellter("Peter");
        a1.setBoss(b);
        Angestellter a2 = new Angestellter("Claudia", b);
        Angestellter a3 = new Angestellter("Jürg");
        b.AddUnterstellt(a3);
    }
}
```

```csharp
public class Boss
{
    //Membervariablen
    private string m_Name;

    private List<Angestellter> m_Unterstellte = new List<Angestellter>();

    //Methoden
    public void setName(string s)
    {
        m_Name = s;
    }

    public void AddUnterstellt(Angestellter a)
    {
        m_Unterstellte.Add(a);
    }
}
```

```csharp
public class Angestellter
{
    //Membervariablen
    private string m_Name;

    //Konstruktoren
    public Angestellter(string s)
    {
        setNamen(s);
    }

    public Angestellter(string s, Boss b)
    {
        setNamen(s);
        setBoss(b);
    }

    //Methoden
    public void setNamen(string s)
    {
        m_Name = s;
    }

    public void setBoss(Boss b)
    {
        b.AddUnterstellt(this);
    }
}
```

![Sequenzdiagramm Vorlage](./Vertiefungsaufgabe-13.png)

## Aufgabe 2

Erstelle den Programmcode, das Klassendiagramm und das Sequenzdiagramm für das folgende Programm:

```csharp
class Program
{
    static void Main(string[] args)
    {
        Koch k1 = new Koch(12, "Oliver");
        k1.setVorname("Jamie");
        k1.setSterne(3);
        Koch k2 = new Koch(15, "Mälzer", "Tim");
        k2.setSterne(3);
        Gast g1 = new Gast();
        g1.setName("Bucher");
        g1.setVorname("Roland");
        Gast g2 = new Gast("Brunner", "Peter");
        Restaurant r = new Restaurant("BBZW Kantine");
        r.Hinzufuegen(k1);
        r.Hinzufuegen(k2);
        r.Hinzufuegen(g1);
        r.Hinzufuegen(g2);
        r.Ausgabe();
        Console.ReadLine();
    }
}
```

Programmausgabe:

```text
------------------------------
         BBZW Kantine
------------------------------
Koch: <3 Sterne> Jamie Oliver
Koch: <3 Sterne> Tim Mälzer
Gast: Roland Bucher
Gast: Peter Brunner
```
