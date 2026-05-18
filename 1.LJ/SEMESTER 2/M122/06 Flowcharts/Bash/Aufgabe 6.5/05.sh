#!/bin/bash

username="admin"
password="1234"

read -p "Username: " input_username
read -s -p "Password: " input_password
echo

if [ "$input_username" != "$username" ] || [ "$input_password" != "$password" ]; then
    echo "Login failed"
    exit 1
fi

while true; do
    echo "1) Username aendern"
    echo "2) Passwort aendern"
    echo "3) Logout"
    read -p "Auswahl: " choice

    case "$choice" in
        1)
            read -p "Neuer Username: " username
            echo "Username updated"
            ;;
        2)
            read -s -p "Neues Passwort: " password
            echo
            echo "Password updated"
            ;;
        3)
            echo "Logout"
            break
            ;;
        *)
            echo "Ungueltige Auswahl"
            ;;
    esac
done
