package main

import "fmt"

func main() {
	modules := map[int]string{
		104: "Datenmodell implementieren",
		117: "Informatik- und Netzinfrastruktur für ein kleines Unternehmen realisieren",
		346: "Cloud-Lösungen konzipieren und realisieren",
	}

	fmt.Println("Modul 104:", modules[104])
	fmt.Println("Modul 117:", modules[117])
	fmt.Println("Modul 346:", modules[346])

	// Ein Element anhand des Schlüssels entfernen
	delete(modules, 104)

	// Ein Element hinzufügen
	modules[320] = "Objektorientiert programmieren"

	// Ein Element durch ein anderes ersetzen
	modules[117] = "Netzinfrastruktur für KMU aufbauen"

	fmt.Println(modules)
}