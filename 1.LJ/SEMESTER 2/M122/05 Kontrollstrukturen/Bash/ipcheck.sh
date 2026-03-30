read -p "Bitte geben Sie die IP-Adresse ein, die Sie überprüfen möchten: " ip_address

# Versuche verschiedene Methoden um die Erreichbarkeit zu testen
if timeout 2 bash -c "</dev/tcp/$ip_address/80" 2>/dev/null || \
   timeout 2 bash -c "</dev/tcp/$ip_address/443" 2>/dev/null; then
    echo "Online"
else
    echo "Offline"
fi  