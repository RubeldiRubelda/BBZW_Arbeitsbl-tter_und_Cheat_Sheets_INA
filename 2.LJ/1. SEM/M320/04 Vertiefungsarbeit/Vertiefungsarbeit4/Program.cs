using System;
namespace Vertiefungsarbeit4
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Car car1 = new Car("VW", "Golf", 2018);
            Console.WriteLine(car1.ToString());

            int currentYear = DateTime.Now.Year;
            Car car2 = new Car("VW", "Golf", currentYear);
            Console.WriteLine(car2.ToString());
        }
        
    }
}