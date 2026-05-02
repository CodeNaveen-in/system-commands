#!/bin/bash

read -r n

# Q1. Find if a number is more than 2 or not
# more_than_2() {
#     local num=$1

#     if (( num > 2 )); then
#         echo "$num is more than 2"
#     else
#         echo "$num is less than or equal to 2"
#     fi
# }

# more_than_2 "$n"

# Q2. Print all even number before a value
# till_even() {
#     local num=$1

# 	echo "["
#     for ((i=1; i<=num; i++)); do
#         if (( i % 2 == 0 )); then
#             echo "$i,"
#         fi
#     done
# 	echo "]"
# }

# till_even "$n"

# Q3. Find factors of a number
# factor(){
# 	local num=$1

# 	for ((i=2; i<=num/2; i++)); do
# 		if (( num%i == 0)); then
# 			echo "$i is a factor of $num"
# 		fi
# 	done
# }

# factor "$n"

# Q4. Check a string for hexadecimal
hexadecimal(){
    local num=$1

    if [[ $num =~ ^[0-9a-fA-F]+$ ]]; then
        echo "hexadecimal"
    else
        echo "not hexadecimal"
    fi
}

hexadecimal "$n"