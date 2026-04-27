#!/bin/bash

function check_sign() {
    local num1=$1
    local num2=$2
    
    # Überprüfe ob beide positiv oder beide negativ sind
    if (( num1 > 0 && num2 > 0 )) || (( num1 < 0 && num2 < 0 )); then
        echo "Same"
    else
        echo "Different"
    fi
}

# Test der Funktion
read -p "Erste Zahl: " zahl1
read -p "Zweite Zahl: " zahl2

check_sign $zahl1 $zahl2
