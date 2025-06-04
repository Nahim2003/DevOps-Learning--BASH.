#!/bin/bash

# Prompt user for input
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

# Check for valid numbers (basic check)
if ! [[ "$num1" =~ ^-?[0-9]+(\.[0-9]+)?$ && "$num2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "❌ Invalid input. Please enter valid numbers."
    exit 1
fi

# Perform operations
sum=$(echo "$num1 + $num2" | bc)
diff=$(echo "$num1 - $num2" | bc)
prod=$(echo "$num1 * $num2" | bc)

# Check for division by zero
if [ "$num2" == "0" ]; then
    div="undefined (division by zero)"
else
    div=$(echo "scale=2; $num1 / $num2" | bc)
fi

# Display results
echo -e "\n🧮 Results:"
echo "$num1 + $num2 = $sum"
echo "$num1 - $num2 = $diff"
echo "$num1 * $num2 = $prod"
echo "$num1 / $num2 = $div"

