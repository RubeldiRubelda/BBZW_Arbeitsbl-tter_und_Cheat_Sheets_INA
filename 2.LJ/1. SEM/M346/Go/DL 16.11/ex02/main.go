package main

import "fmt"

func main() {
	const mileInKM = 1.60934
	var miles = 55.3
	var kilometres = miles * mileInKM
	fmt.Printf("%.2f miles = %.2f kilometres\n", miles, kilometres)

	var fahrenheit = 99.9
	var celsius = (fahrenheit - 32.0) * 5 / 9
	fmt.Printf("%.2f°F = %.2f°C\n", fahrenheit, celsius)

	const marathonInKM = 42.195
	var marathonInMiles = marathonInKM / mileInKM
	fmt.Printf("a marathon is %.2f kilometres = %.2f miles long\n", marathonInKM, marathonInMiles)

	var boilingWaterCelsius = 100.0
	var boilingWaterFahrenheit = (boilingWaterCelsius * 9 / 5) + 32.0
	fmt.Printf("water boils at %.2f°C = %.2f°F\n", boilingWaterCelsius, boilingWaterFahrenheit)
}