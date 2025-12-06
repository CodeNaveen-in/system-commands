#!/bin/bash

row=0

while IFS=',' read -r roll name marks; do
  if [[ $row -eq 0 ]]; then
    ((row++))
    continue
  fi

  ((row++))

  if [[ $marks -gt 75 ]]; then
    echo "Row $row, Student $name with marks $marks passes"
  fi
done < students.csv
