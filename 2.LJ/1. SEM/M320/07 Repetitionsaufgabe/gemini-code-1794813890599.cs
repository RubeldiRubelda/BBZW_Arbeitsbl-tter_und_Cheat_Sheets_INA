using System;

public static class PriceCalculator
{
    /// <summary>
    /// Berechnet den Einzelpreis pro Einheit inklusive eines prozentualen Zuschlags (z. B. Steuersatz).
    /// </summary>
    /// <remarks>
    /// Statt bei ungültigen Eingaben einen Fehlercode wie -1 zurückzugeben, wirft diese Methode
    /// gezielt Exceptions, damit Berechnungsfehler nicht unbemerkt bleiben.
    /// </remarks>
    /// <param name="totalAmount">Der Gesamtbetrag, der aufgeteilt werden soll.</param>
    /// <param name="unitCount">Die Anzahl der Einheiten, durch die geteilt wird. Darf nicht 0 sein.</param>
    /// <param name="surchargePercent">Der prozentuale Zuschlag in ganzen Prozentpunkten (z. B. 8 für 8 % / 0.08). Muss grösser als 0 sein.</param>
    /// <returns>Der berechnete Betrag pro Einheit zuzüglich des prozentualen Zuschlags.</returns>
    /// <exception cref="ArgumentOutOfRangeException">
    /// Wird ausgelöst, wenn <paramref name="surchargePercent"/> kleiner oder gleich 0 ist.
    /// </exception>
    /// <exception cref="ArgumentException">
    /// Wird ausgelöst, wenn <paramref name="unitCount"/> gleich 0 ist, um eine Division durch Null zu verhindern.
    /// </exception>
    public static double CalculateUnitPriceWithSurcharge(double totalAmount, double unitCount, int surchargePercent)
    {
        if (surchargePercent <= 0)
        {
            throw new ArgumentOutOfRangeException(
                nameof(surchargePercent),
                "Der prozentuale Zuschlag muss grösser als 0 sein.");
        }

        if (unitCount == 0)
        {
            throw new ArgumentException(
                "Die Anzahl der Einheiten darf nicht 0 sein.",
                nameof(unitCount));
        }

        return totalAmount / unitCount + surchargePercent * 0.01;
    }
}