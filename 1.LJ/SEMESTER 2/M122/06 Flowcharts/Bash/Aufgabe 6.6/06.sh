#!/bin/bash

generate_password() {
    tr -dc 'A-Za-z0-9' </dev/urandom | head -c 6
}

read -p "Datei mit Namen: " list_file

if [ ! -f "$list_file" ]; then
    echo "Datei nicht gefunden"
    exit 1
fi

while IFS= read -r full_name; do
    [ -z "$full_name" ] && continue

    first_name=$(echo "$full_name" | awk '{print $1}')
    last_name=$(echo "$full_name" | awk '{print $NF}')

    first_login=$(echo "$first_name" | tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:]')
    last_login=$(echo "$last_name" | tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:]')

    base_login="${first_login}.${last_login}"
    login="$base_login"
    number=1

    while [ -e "$login" ]; do
        login="${base_login}${number}"
        number=$((number + 1))
    done

    password=$(generate_password)
    echo "$password" > "$login"

    echo "$full_name -> $login"
done < "$list_file"
