read -p "Age: " age
if [ $age -ge 18 ] && [ $age -lt 120 ]; then
    echo "You are an adult. You can vote."
elif [ $age -eq 17 ]; then
    echo "You can vote next year."
else
    echo "You are a minor. You cannot vote."
fi