#!/bin/bash

input="employees.csv"
output="updated_employees.csv"

row=0
TIMESTAMP=$(date)

while IFS="," read -r id name dept sal;do
	if [ $row -eq 0 ]; then
		echo "$id,$name,$dept,$sal"> "$output"
		row=$((row+1))
		continue
	fi

	if [ "$dept" = "IT" ]; then
		sal=$((sal+sal/10))
	fi

	echo "$id,$name,$dept,$sal">>"$output"
	row=$((row+1))
done < "$input"

echo "Updated salaries written to the $output at $TIMESTAMP"
