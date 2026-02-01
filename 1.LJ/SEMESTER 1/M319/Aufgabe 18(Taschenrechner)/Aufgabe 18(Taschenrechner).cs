namespace Aufgabe19_Rechner
{
    internal class Program
    {
        static void Main(string[] args)
        {
            char[] letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
            string input = "";
            float Num1 = 0;
            float Num2 = 0;
            float Result = 0;
            char Operator = ' ';

            Console.WriteLine("Make your calculation (or enter q to quit): ");
            input = String.Concat(Console.ReadLine().Where(c => !Char.IsWhiteSpace(c)));


            while (input.ToLower() != "q")
            {
                for (int i = 0; i < letters.Length; i++)
                {
                    if (input.Contains(letters[i]))
                    {
                        Console.WriteLine("Ungültige Eingabe!");
                        Console.ReadKey();
                        break;
                    }
                }
                Operator = ReadOperator(input);
                if(Operator == ' ')
                {
                    Console.WriteLine("Make your calculation (or enter q to quit): ");
                    input = String.Concat(Console.ReadLine().Where(c => !Char.IsWhiteSpace(c)));
                    break;
                }
                try
                {
                    Num1 = float.Parse(input.Substring(0, input.IndexOf(Operator)));
                }
                catch
                {
                    Console.WriteLine("Ungültige Eingabe!");
                    break;
                }
                try
                {
                    Num2 = float.Parse(input.Substring(input.IndexOf(Operator) + 1));
                }
                catch
                {
                    Console.WriteLine("Ungültige Eingabe!");
                    break;
                }

                Result = Calculate(Num1, Num2, Operator);

                Console.WriteLine($"= {Result}");

                Console.WriteLine("Make your calculation (or enter q to quit): ");
                input = String.Concat(Console.ReadLine().Where(c => !Char.IsWhiteSpace(c)));

            } 
            return;
        }

        static char ReadOperator(string inp)
        {
            if (inp.Contains("+"))
            {
                return '+';
            }
            else if (inp.Contains("-"))
            {
                return '-';
            }
            else if (inp.Contains("*"))
            {
                return '*';
            }
            else if (inp.Contains("/"))
            {
                return '/';
            }
            else
            {
                Console.WriteLine("Ungültige Eingabe! Es gibt keinen Operator!");
                Console.WriteLine("\n");
                return ' ';
            }
        }

        static float Calculate(float Num1, float Num2, char Op)
        {
            float Result = 0;
            switch (Op)
            {
                case '+':
                    Result = Num1 + Num2;
                    break;

                case '-':
                    Result = Num1 - Num2;
                    break;

                case '*':
                    Result = Num1 * Num2;
                    break;

                case '/':
                    Result = Num1 / Num2;
                    break;

                default:
                    Console.WriteLine("Ungültige Eingabe!");
                    Console.ReadKey();
                    break;
            }
            return Result;

        }
    }
}


