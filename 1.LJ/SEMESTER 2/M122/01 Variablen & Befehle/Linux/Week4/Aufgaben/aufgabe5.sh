#!/bin/bash

# Datei, in der die Notizen gespeichert werden
NOTEBOOK="notebook.txt"

# User nach der Notiz fragen
read -p "Deine Notiz: " user_note

# Aktuelles Datum im gewünschten Format generieren
# Beispiel: So 20 Jul 1969 20:17:45 UTC
timestamp=$(date +"%a %d %b %Y %H:%M:%S %Z")

# Zeitstempel und Notiz in die Datei schreiben (anhängen mit >>)
echo "$timestamp: $user_note" >> "$NOTEBOOK"

echo "Notiz wurde gespeichert."