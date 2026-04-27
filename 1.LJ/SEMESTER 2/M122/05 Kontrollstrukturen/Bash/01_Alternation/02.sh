#!/bin/bash

read -p "Zahl 1: " num1
read -p "Zahl 2: " num2

if [ "$num1" -gt "$num2" ]; then
    echo "$num1"
elif [ "$num2" -gt "$num1" ]; then
    echo "$num2"
else
    echo "Beide sind gleich gross."
fi
