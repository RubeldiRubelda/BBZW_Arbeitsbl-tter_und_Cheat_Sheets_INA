# Repetitionsaufgaben: Klassen und Objekte (Lösungen)

## Aufgabe 1: Begriffe

```csharp
// (a)
public class Program
{
    static void Main(string[] args)
    {
        // `task` = (b),
        // `new WorkTask( /* ... */ )` = (f)
        WorkTask task = new WorkTask("Prüfungsvorbereitung", 1);
        task.Priority = 2;
        task.MarkAsDone(false); // (d), `false` = (i)
    }
}

// (a)
public class WorkTask
{
    private int _id; // (g)
    private string _status; // (g)
  
    public int Priority { get; set; }
    public String Description { get; set; }

    // (e), `description` = (h), `priority` = (h)
    public WorkTask(String description, int priority) 
    {
        _id = GetNextId(); // (d)
        _status = "PLANNED";
        Description = description;
        Priority = priority;
    }

    // (c), `resetPriority` = (h)
    public void MarkAsDone(bool resetPriority = true)
    {
        if (resetPriority)
        {
            Priority = 0;
        }
        _status = "DONE";
    } 

    // (c)
    private static int GetNextId()
    {
        // ...
    }
}
```

## Aufgabe 2: Sichtbarkeit

```csharp
public class Reader
{
    protected Wrapper Wrap;

    protected void Swap(char[] cbuf, int i, int i1)
    {
        // ...
    }
}

public class Swapper : Reader
{
    private PushbackReader _pushBack;

    private Swapper(PushbackReader p)
    {
        _pushBack = p;
    }

    private int Read(char[] cbuf, int off, int len)
    {
        int r = Wrap.Read(cbuf, off, len);
        if (r % 2 == 1)
        {
            _pushBack.Unread(cbuf, off + --r, 1);
        }

        for (int i = 0; i < r; i += 2)
        {
            Swap(cbuf, i, i + 1);
        }

        return r;
    }
}

public class PushbackReader
{
    public void Unread(char[] cbuf, int off, int i)
    {
        // ...
    }
}

public class Wrapper
{
    public int Read(char[] cbuf, int off, int len)
    {
        // ...
    }
}
```

## Aufgabe 3: Methoden

Alle Beispielslösungen wurden als statische Methoden implementiert. Das ist von der Aufgabenstellung her nicht zwingend notwendig. Überlege dir, weshalb hier überall `static` Sinn macht?

```csharp
public static int Add(int a, int b)
{
    return a + b;
}
```

```csharp
public static void EndRun(Person person)
{
    Console.WriteLine($"'{person.Name}' has ended the run at '{person.FinalTime.Millisecond}'");
}
```

```csharp
public static bool? IsAllowedToDrive(int? age)
{
    if (age == null)
    {
        return null;
    }

    if (age >= 18)
    {
        return true;
    }

    return false;
}
```

## Aufgabe 4: Konstruktoren

Beispielslösung. Solange die Signaturen der Konstruktoren übereinstimmen, ist die Implementation korrekt.

```csharp
public class Element
{
    private int _index;
    private Element? _prev;

    public Element()
    {
        _index = 0;
        _prev = null;
    }

    public Element(Element prev)
    {
        _index = prev._index + 1;
        _prev = prev;
    }

    public Element(int index, Element prev)
    {
        _index = index;
        _prev = prev;
    }
}
```
