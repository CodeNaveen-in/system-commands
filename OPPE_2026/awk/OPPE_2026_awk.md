Here’s a clean, structured version of the question:

---

## Linux OPPE – Question 5

### Problem Statement

You are reviewing notes from a statistics course. For a certain experiment, the probability of an event ( X ) occurring is denoted as ( P(X) ).

Your notes state that the event is:

> more probable than naught

However, you suspect it might actually be:

> more probable than not

To verify this, you are given a dataset representing outcomes of the experiment:

* `1` indicates the event **occurred**
* `0` indicates the event **did not occur**

---

### Task

Using the dataset, determine which statement is correct:

* If ( P(X) > 0.5 ), print:

  ```
  not
  ```
* Otherwise, print:

  ```
  naught
  ```

---

### Input Format

* One integer per line
* Each value is either `0` or `1`
* No header row is present

---

### Output Format

* Print either `not` or `naught` based on the condition

---

### Execution

Your solution should be written in a GNU AWK script (`script.awk`) and executed as:

```bash
gawk -f script.awk < input.csv
```

---

### Sample Input

```
1
1
1
1
1
1
1
0
0
0
```

### Sample Output

```
not
```

---

### Constraints

* At least one row exists
* There is always at least one `1` in the input
* File is newline (`\n`) separated
* Values are unquoted integers (`0` or `1`)

---

### Hint

[
P(X) = \frac{\text{number of times X occurred}}{\text{total number of trials}}
]

* “more probable than not” → ( P(X) > 0.5 )
* “more probable than naught” → ( P(X) > 0 )



# ANSWER

```awk
# Best Version

{
    ones += $1
    total++
}

END {
    print (ones > total/2 ? "not" : "naught")
}
```
