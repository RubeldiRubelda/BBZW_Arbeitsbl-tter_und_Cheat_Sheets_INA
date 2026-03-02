#!/bin/bash

# User nach dem Verzeichnis fragen
read -p "Enter a directory: " target_dir

# Prüfen, ob das Verzeichnis existiert
if [ -d "$target_dir" ]; then
    # Datei "select" im angegebenen Verzeichnis erstellen
    touch "$target_dir/select"
    echo "Die Datei 'select' wurde in $target_dir erstellt."
else
    echo "Fehler: Das Verzeichnis $target_dir existiert nicht."
fi