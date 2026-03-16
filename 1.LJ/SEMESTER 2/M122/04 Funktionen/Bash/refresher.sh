#!/bin/bash

# Pfad zur Datei
FILE="text.txt"

# Prüfen, ob die Datei existiert
if [ -f "$FILE" ]; then
    # Letzte Zeile in Variable speichern
    LAST_LINE=$(tail -n 1 "$FILE")
    
    echo "Die letzte Zeile ist: $LAST_LINE"
else
    echo "Fehler: $FILE wurde nicht gefunden."
fi