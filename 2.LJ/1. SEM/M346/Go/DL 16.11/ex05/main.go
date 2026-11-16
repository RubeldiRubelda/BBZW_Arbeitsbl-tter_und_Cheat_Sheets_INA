package main

import "fmt"

const (
	Aries       = '\u2648' // Widder
	Taurus      = '\u2649' // Stier
	Gemini      = '\u264a' // Zwillinge
	Cancer      = '\u264b' // Krebs
	Leo         = '\u264c' // Löwe
	Virgo       = '\u264d' // Jungfrau
	Libra       = '\u264e' // Waage
	Scorpius    = '\u264f' // Skorpion
	Sagittarius = '\u2650' // Schütze
	Capricornus = '\u2651' // Steinbock
	Aquarius    = '\u2652' // Wassermann
	Pisces      = '\u2653' // Fische
)

func outputDateRange(zodiacSign rune) {
	fmt.Printf("%c: ", zodiacSign)

	switch zodiacSign {
	case Aries:
		fmt.Println("21.03. - 20.04.")
	case Taurus:
		fmt.Println("21.04. - 20.05.")
	case Gemini:
		fmt.Println("21.05. - 21.06.")
	case Cancer:
		fmt.Println("22.06. - 22.07.")
	case Leo:
		fmt.Println("23.07. - 23.08.")
	case Virgo:
		fmt.Println("24.08. - 23.09.")
	case Libra:
		fmt.Println("24.09. - 23.10.")
	case Scorpius:
		fmt.Println("24.10. - 22.11.")
	case Sagittarius:
		fmt.Println("23.11. - 21.12.")
	case Capricornus:
		fmt.Println("22.12. - 20.01.")
	case Aquarius:
		fmt.Println("21.01. - 19.02.")
	case Pisces:
		fmt.Println("20.02. - 20.03.")
	default:
		fmt.Println("unknown zodiac sign")
	}
}

func main() {
	for zodiacSign := Aries; zodiacSign <= Pisces; zodiacSign++ {
		outputDateRange(zodiacSign)
	}
}