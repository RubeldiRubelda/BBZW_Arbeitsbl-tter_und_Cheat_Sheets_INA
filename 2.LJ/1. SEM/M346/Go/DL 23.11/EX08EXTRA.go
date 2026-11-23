package main

import "fmt"

const (
	Lower = 1
	Upper = 30
)

func main() {
	for i := Lower; i <= Upper; i++ {
		switch {
		case i%3 == 0 && i%5 == 0:
			fmt.Print("Fizz")
			fallthrough
		case i%5 == 0 && i%3 != 0:
			// Hinweis: Mit fallthrough wird auch bei i%15 == 0 hier reingesprungen!
			fmt.Println("Buzz")
		case i%3 == 0:
			fmt.Println("Fizz")
		default:
			fmt.Println(i)
		}
	}
}