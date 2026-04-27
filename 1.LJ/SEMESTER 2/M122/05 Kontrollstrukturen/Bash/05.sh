#!/bin/bash

read -p "Bewerte den Film (1-10): " rating

if [[ $rating =~ ^[0-9]+$ ]]; then
    if [ $rating -ge 1 ] && [ $rating -le 10 ]; then
        echo "Vielen Dank für dein Feedback!"
    else
        echo "Fehler: Der eingegebene Wert befindet sich ausserhalb des Ranges (1-10)."
    fi
else
    echo "Fehler: Der eingegebene Wert befindet sich ausserhalb des Ranges (1-10)."
fi
