#!/bin/bash

check_website() {
    local website="$1"

    if ping -c 1 -W 2 "$website" >/dev/null 2>&1; then
        echo "Online"
    else
        echo "Offline"
    fi
}

read -p "Webpage: " webpage
check_website "$webpage"
