#!/bin/bash

read -p "Gib eine Jahreszahl ein: " year

current_year=$(date +%Y)

if [ $year -lt $current_year ]; then
    echo "Past"
elif [ $year -eq $current_year ]; then
    echo "Now"
elif [ $year -gt $current_year ]; then
    echo "Future"
fi
