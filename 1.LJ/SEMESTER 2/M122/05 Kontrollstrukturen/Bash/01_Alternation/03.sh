#!/bin/bash

read -p "Zahl 1: " num1
read -p "Zahl 2: " num2
read -p "grösser oder kleiner (1/0): " type

function funi () {

case $3 in
    1)
        if [ $1 -gt $2 ]; then
            echo $1
        elif [ $2 -gt $1 ]; then
            echo $2
        else
            echo "Beide sind gleich gross."
        fi
    ;;
    0)
        if [ $1 -lt $2 ]; then
            echo $1
        elif [ $2 -lt $1 ]; then
            echo $2
        else
            echo "Beide sind gleich gross."
        fi
    ;;
esac

}

funi $num1 $num2 $type