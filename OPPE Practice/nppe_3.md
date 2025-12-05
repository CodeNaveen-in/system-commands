# OPPE Problem 3

## Problem Statement

Write a bash script `grades.sh` that reads a CSV file `results.csv` present in the current working directory containing student results with columns `RollNo,Name,Marks`. Compute the grade of a student using the following rules:
- If `Marks` is less than 50, grade is `U`.
- If `Marks` is greater than or equal to 50, but less than 60, grade is `D`.
- If `Marks` is greater than or equal to 60, but less than 70, grade is `C`.
- If `Marks` is greater than or equal to 70, but less than 80, grade is `B`.
- If `Marks` is greater than or equal to 80, but less than 90, grade is `A`.
- If `Marks` is greater than or equal to 90, grade is `S`.

Print the names of students along with their grades.

## Sample Input
 ```
 RollNo,Name,Marks
  20   │ 101,Clarence,63
  21   │ 102,Naveen,72
  22   │ 103,Rahul,97
  23   │ 104,Sameer,81
 ```

 ## Sample Output

 ```
  29   │ Clarence: C
  30   │ Naveen: B
  31   │ Rahul: S
  32   │ Sameer: A
 ```

## Instructions
 - Assume that the `results.csv` is present in the current working directory.
 - Write your script in `grades.sh`.
 - It should be present in `~/se2001/nppe_3/` directory.
 - The script should output the result to the standard output (`&1`).

# ANSWER

```bash
#!/bin/bash

# Read results.csv, skip header, and process each line
tail -n +2 results.csv | while IFS=',' read -r roll name marks
do
  grade=""

  if [ "$marks" -lt 50 ]; then
    grade="U"
  elif [ "$marks" -lt 60 ]; then
    grade="D"
  elif [ "$marks" -lt 70 ]; then
    grade="C"
  elif [ "$marks" -lt 80 ]; then
    grade="B"
  elif [ "$marks" -lt 90 ]; then
    grade="A"
  else
    grade="S"
  fi

  echo "$name: $grade"
done
```