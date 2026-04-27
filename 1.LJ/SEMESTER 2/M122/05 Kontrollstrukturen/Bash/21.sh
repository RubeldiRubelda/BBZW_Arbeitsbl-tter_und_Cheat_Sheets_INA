#!/bin/bash

while true; do
    read -p "Geben Sie etwas ein (q zum Beenden): " input
    if [ "$input" = "q" ]; then
        echo "Programm wird beendet."
        break
    fi

    echo "Sie haben $input eingegeben."
done