# Repetitionsaufgaben: UML (Lösungen)

## Aufgabe 1: Klassendiagramm

![UML](./links/uml-reader.svg)

### Aufgabe 2: Diagramm implementieren

```csharp
public abstract class Person
{
    public string Name;
    public string PhoneNumber;
    public string EmailAddress;
    public Address address;

    public void PurchaseParkingPass()
    {
        // ...
    }
}

public class Address
{
    public string Street;
    public string City;
    public int PostalCode;

    private bool Validate()
    {
        // ...
    }

    private string OutputAsLabel()
    {
        // ...
    }
}

public class Student : Person
{
    public int StudentNumber;
    public int AverageMark;

    public bool IsEligibleToEnroll(string module)
    {
        // ...
    }

    public int GetSeminarsTaken()
    {
        // ...
    }
}

public class Professor : Person
{
    private int _salary;
    protected int StaffNumber;
    private int _yearsOfService;
    public int NumberOfClasses;
}
```
