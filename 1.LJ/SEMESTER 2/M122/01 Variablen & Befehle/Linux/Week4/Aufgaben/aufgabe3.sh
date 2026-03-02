#!/bin/bash

# Den User nach seinem Namen fragen
read -p "Enter your name: " user_name

# Den Namen in die Datei name.txt schreiben (überschreibt alten Inhalt)
echo "$user_name" > name.txt

# Kurze Bestätigung für den User
echo "Der Name wurde in name.txt gespeichert."