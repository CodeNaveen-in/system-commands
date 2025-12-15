#!/bin/bash

input="employees.csv"
output="salaries.txt"

while IFS="," read -r id name dept sal;do
	echo "$name $sal" >> "$output"
done< <(tail -n+2 $input)

echo "Name and Salary has been copied to $output"
