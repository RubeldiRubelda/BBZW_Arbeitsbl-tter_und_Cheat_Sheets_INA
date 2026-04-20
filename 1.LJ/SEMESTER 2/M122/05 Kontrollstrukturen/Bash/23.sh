#!/bin/bash

while [ "$input" != "q" ]; do
    read -p "Geben Sie eine Zahl ein (q zum Beenden): " input   
    if [ $input -ge 1 ] && [ $input -le 10 ]; then
        for i in {1..10}; do
            echo "$i X $input = $((i * input))"
        done
    else
        echo "Ungültige Eingabe. Bitte geben Sie eine Zahl zwischen 1 und 10 ein."
    fi
done