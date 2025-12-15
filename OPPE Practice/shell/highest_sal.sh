#!/bin/bash

input="employees.csv"

# Get highest salary line
line=$(tail -n +2 "$input" | sort -t',' -k4,4nr | head -n 1)

# Split CSV into variables
IFS=',' read -r id name dept sal <<< "$line"

# Print nicely
echo "$name has the highest salary of \$$sal"
