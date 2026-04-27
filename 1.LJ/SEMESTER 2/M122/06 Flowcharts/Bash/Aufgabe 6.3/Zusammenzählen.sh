# Nummer eingeben, Untendran immer das Resultat bisher anzeigen und die Nummer frage loopen bis Q gedrückt wird. Am Ende die Summe aller eingegebenen Nummern anzeigen.
#!/bin/bash
summe=0
while true; do
    echo "Gib eine Nummer ein (oder 'Q' zum Beenden):"
    read eingabe
    if [ "$eingabe" == "Q" ]; then
        break
    elif [[ "$eingabe" =~ ^-?[0-9]+$ ]]; then
        summe=$((summe + eingabe))
        echo "Aktuelle Summe: $summe"
    else
        echo "Ungültige Eingabe. Bitte gib eine Zahl oder 'Q' ein."
    fi
done
echo "Die Summe aller eingegebenen Nummern ist: $summe"

