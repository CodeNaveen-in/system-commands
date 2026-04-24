# ✅ **Problem 1: Lowest Scorer**

## Problem Statement

You are given a TSV file containing student marks.

Write an `awk` script `lowest.awk` to:

* Calculate the **average marks**
* Print the student with the **lowest average**

Assume no ties.

---

## Sample Input

```tsv
Name  Math  Science  English
Amit  60  55  70
Riya  80  75  78
Karan 50  45  60
Neha  90  88  92
```

---

## Expected Output

```txt
Lowest: Karan
```

---

# ✅ **Problem 2: Highest Total Sales**

## Problem Statement

You are given a TSV file with sales records.

Write an `awk` script `topsales.awk` to:

* Compute **total sales per person**
* Print the person with the **highest total sales**

---

## Sample Input

```tsv
Name  Q1  Q2  Q3  Q4
Alice 100 200 150 250
Bob   300 100 200 100
Charlie 150 150 150 150
```

---

## Expected Output

```txt
Top Seller: Alice
```

---

# ✅ **Problem 3: Department with Highest Average Salary**

## Problem Statement

Given employee data:

Write `deptmax.awk` to:

* Calculate **average salary per department**
* Print department with **highest average salary**

---

## Sample Input

```tsv
Name  Dept  Salary
Amit  HR    40000
Riya  IT    60000
Karan IT    50000
Neha  HR    45000
Raj   Finance 70000
```

---

## Expected Output

```txt
Best Department: Finance
```

---

# ✅ **Problem 4: Most Frequent Word**

## Problem Statement

You are given a file with words (one per line).

Write `freq.awk` to:

* Count occurrences of each word
* Print the **most frequent word**

---

## Sample Input

```txt
apple
banana
apple
orange
banana
apple
```

---

## Expected Output

```txt
Most Frequent: apple
```

---

# ✅ **Problem 5: Student with Maximum Marks in a Single Subject**

## Problem Statement

Given student marks:

Write `maxsubject.awk` to:

* Find the **highest mark across all students and subjects**
* Print the student name

---

## Sample Input

```tsv
Name  Math  Science  English
Amit  78  82  80
Riya  85  90  88
Karan 92  70  65
Neha  88  91  87
```

---

## Expected Output

```txt
Top Performer: Karan
```

---

# 💡 What These Problems Teach You

Each problem targets a core `awk` concept:

* **Problem 1** → averages + min tracking
* **Problem 2** → row aggregation
* **Problem 3** → associative arrays (grouping)
* **Problem 4** → frequency counting
* **Problem 5** → nested loops + global max