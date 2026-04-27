# Funktion welche zwei Zahlen übergibt, die kleinere wird zurückgegeben
function min {
    if [ $1 -lt $2 ]; then
        echo $1
    else
        echo $2
    fi
}   
read -p "Zahl 1: " num1
read -p "Zahl 2: " num2

if [ $num1 -lt $num2 ]; then
    echo "Die kleinere Zahl ist: $num1"
elif [ $num1 -eq $num2 ]; then
    echo "Beide Zahlen sind gleich: $num1"
else
    echo "Die kleinere Zahl ist: $num2"
fi

echo "-----------------------------------------"
#task 3
function compare {
    if [ "$3" = "True" ]; then
        if [ $1 -gt $2 ]; then
            echo $1
        else
            echo $2
        fi
    else
        if [ $1 -lt $2 ]; then
            echo $1
        else
            echo $2
        fi
    fi
}
read -p "Zahl 1: " num1
read -p "Zahl 2: " num2
read -p "Möchten Sie die größere Zahl zurückgeben? (True/False): " bit
result=$(compare $num1 $num2 $bit)
echo "Das Ergebnis ist: $result"


echo "-----------------------------------------"
# Task 4
function check_sign {
    if [ $1 -ge 0 ] && [ $2 -ge 0 ]; then
        echo "Same"
    elif [ $1 -lt 0 ] && [ $2 -lt 0 ]; then
        echo "Same"
    else
        echo "Different"
    fi
}
read -p "Zahl 1: " num1
read -p "Zahl 2: " num2
result=$(check_sign $num1 $num2)
echo "Das Ergebnis ist: $result"

echo "-----------------------------------------"
# Task 5
read -p "Bitte geben Sie das Rating des Filmes (1-10) ein: " rating
if [ $rating -ge 1 ] && [ $rating -le 10 ]; then
    echo "Vielen Dank für Ihr Feedback!"
else
    echo "Fehler: Der eingegebene Wert liegt außerhalb des gültigen Bereichs (1-10)."
fi

echo "-----------------------------------------"
# Task 6
current_year=$(date +"%Y")
read -p "Bitte geben Sie eine Jahreszahl ein: " input_year
if [ $input_year -lt $current_year ]; then
    echo "Past"
elif [ $input_year -eq $current_year ]; then
    echo "Now"
else    echo "Future"
fi


echo "-----------------------------------------"
# Task 7

read -p "Bitte geben Sie die IP-Adresse ein, die Sie überprüfen möchten: " ip_address
if timeout 2 bash -c "</dev/tcp/$ip_address/80" 2>/dev/null || \
   timeout 2 bash -c "</dev/tcp/$ip_address/443" 2>/dev/null; then
    echo "Online"
else
    echo "Offline"
fi   