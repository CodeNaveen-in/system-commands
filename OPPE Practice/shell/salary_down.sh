#!/bin/bash

input="employees.csv"
output="down_employees.csv"

row=0
timestamp=$(date)

while IFS="," read -r id name dept sal; do
	if [ $row -eq 0 ];then
		row=$((row+1))
		echo "$id,$name,$dept,$sal" > "$output"
		continue
	fi

	if [ "$dept" = "HR" ];then
		sal=$((sal - sal*30/100))
		echo "HR salar reduced by 30%"
	fi

	echo "$id,$name,$dept,$sal" >> "$output"
	row=$((row+1))
done < "$input"

echo "Salary updated at $output at $timestamp"
