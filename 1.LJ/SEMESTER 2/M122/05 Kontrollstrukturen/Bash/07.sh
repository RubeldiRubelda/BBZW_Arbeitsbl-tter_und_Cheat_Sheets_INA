#!/bin/bash

read -p "Gib eine IP-Adresse ein: " ip_address

if ping -c 1 $ip_address > /dev/null 2>&1; then
    echo "Online"
else
    echo "Offline"
fi
