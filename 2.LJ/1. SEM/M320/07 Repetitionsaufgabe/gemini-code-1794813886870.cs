/// <summary>
/// Stellt Methoden zur Umrechnung von Temperaturen zwischen Celsius und Fahrenheit bereit.
/// </summary>
public class TemperatureConverter
{
    /// <summary>
    /// Rechnet eine Temperaturangabe von Grad Celsius in Grad Fahrenheit um.
    /// </summary>
    /// <param name="celsius">Die Temperatur in Grad Celsius.</param>
    /// <returns>Die umgerechnete Temperatur in Grad Fahrenheit.</returns>
    public double CelsiusToFahrenheit(double celsius)
    {
        return celsius * 9.0 / 5.0 + 32;
    }

    /// <summary>
    /// Rechnet eine Temperaturangabe von Grad Fahrenheit in Grad Celsius um.
    /// </summary>
    /// <param name="fahrenheit">Die Temperatur in Grad Fahrenheit.</param>
    /// <returns>Die umgerechnete Temperatur in Grad Celsius.</returns>
    public double FahrenheitToCelsius(double fahrenheit)
    {
        return (fahrenheit - 32) * 5.0 / 9.0;
    }
}