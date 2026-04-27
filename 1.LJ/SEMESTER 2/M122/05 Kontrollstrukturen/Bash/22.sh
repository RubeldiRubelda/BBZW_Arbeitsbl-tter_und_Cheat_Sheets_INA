#!/bin/bash

while true; do
    read -p "Bewertung (1-10): " input

    if [ $input -ge 1 ] && [ $input -le 10 ]; then
        echo "Danke für Ihre Bewertung!"
        echo "Sie haben $input eingegeben."
        break
        fi
    
    echo "Eingabe ungültig. Bitte geben Sie eine Zahl zwischen 1 und 10 ein."
done