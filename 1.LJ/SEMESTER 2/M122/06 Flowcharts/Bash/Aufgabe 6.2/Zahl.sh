echo "Gib eine Zahl ein:"
read zahl
if [ $zahl -gt 0 ]; then
    echo "Die Zahl ist positiv."
elif [ $zahl -lt 0 ]; then
    echo "Die Zahl ist negativ."
else
    echo "Die Zahl ist null."
fi

