package main

import (
	"fmt"
	"math/rand"
	"os"
	"time"
)

func main() {
	var eyes = rand.Intn(6) + 1
	var when = time.Now()

	fmt.Fprintln(os.Stdout, "the dice shows", eyes, "eyes")
	fmt.Fprintln(os.Stderr, "the dice was rolled at", when)

	// go run main.go > eyes.txt 2> dice.log
}


//In der Shell (Linux, macOS, Windows PowerShell/CMD) lassen sich die beiden Datenströme über ihre Dateideskriptoren getrennt umleiten:
//
//> eyes.txt (kurz für 1> eyes.txt) leitet os.Stdout in die Datei eyes.txt um.
//
//2> dice.log leitet os.Stderr (Deskriptor 2) in die Datei dice.log um.
//
//(Hinweis: Im ursprünglichen Code stand rand.Intn(5) + 1, was nur Zahlen von 1 bis 5 liefert. Für einen sechsseitigen Würfel wurde dies oben zu rand.Intn(6) + 1 korrigiert.)