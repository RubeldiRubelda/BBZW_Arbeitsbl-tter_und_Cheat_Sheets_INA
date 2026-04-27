#!/bin/bash
# Aufgabe 1: Einfache Benutzereingabe
while true; do
    read -p "Geben Sie etwas ein (q zum Beenden): " input
    if [ "$input" == "q" ]; then
        echo "Programm wird beendet."
        break
    fi
    echo "Sie haben eingegeben: $input"
done



# Aufgabe 2: Filmbewertung
while true; do
    read -p "Bewerten Sie den Film (1-10, q zum Beenden): " rating
    if [ "$rating" == "q" ]; then
        echo "Programm wird beendet."
        break
    fi
    if [[ "$rating" -ge 1 && "$rating" -le 10 ]]; then
        echo "Danke für Ihre Bewertung: $rating"
    else
        echo "Ungültige Bewertung. Bitte geben Sie eine Zahl zwischen 1 und 10 ein."
    fi
done



# Aufgabe 3: Einmaleins
read -p "Geben Sie eine Zahl ein, um die Einmaleins-Reihe zu berechnen: " number
i=1
while [ $i -le 10 ]; do
    result=$((number * i))
    echo "$number x $i = $result"
    i=$((i + 1))
done


# Aufgabe 4: Funktion range
function range {
    if [ $1 -lt $2 ]; then
        start=$1
        end=$2
    else
        start=$2
        end=$1
    fi
    for ((i=start; i<end; i++)); do
        echo -n "$i "
    done
    echo
}