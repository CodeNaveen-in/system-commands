# OPPE Problem 5

## Problem Statement

You have a tab separated values (TSV) file that contains the scores of students in various subjects.

Write an `awk` script named `topper.awk` that will calculate the average score for each student across all subjects.

Assume that there are no ties in the average score.

Identify the student with the highest average score and print their name.

## **Sample Input**

```tsv
Name  Math  Science English
Maya  80  85  78
Shreya 90  92  88
Ananya  75  80  70
Olivia  88  86  84
Michael 82  79  85
```

## **Sample Output**

 ```txt
 Topper: Shreya
 ```

## Instructions

- Your `awk` script should be saved in a file named `topper.awk`.
- It should be present in `~/se2001/nppe_5/` directory.
- Format the output strictly as shown in the example.
- The awk script will be run as follows:

```bash
gawk -f topper.awk < input-file
```

# ANSWER

```bash
# Skip the header row (NR==1)
NR > 1 {
  sum = 0
  # Loop through all fields except the first (Name)
  for (i = 2; i <= NF; i++) {
    sum += $i
  }
  avg = sum / (NF - 1)

  if (avg > max_avg) {
    max_avg = avg
    topper = $1
  }
}

END {
  print "Topper: " topper
}
```