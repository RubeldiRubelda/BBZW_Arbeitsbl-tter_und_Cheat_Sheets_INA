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


