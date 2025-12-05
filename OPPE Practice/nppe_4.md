# OPPE Problem 4

## Problem Statement
Write a `sed` script named `employees.sed` to change the job title "Developer" to "Senior Developer", and remove age information from all records.

## Sample Input
```
Rahul, 30, Developer
Emily, 25, Designer
Amit, 28, Manager
Sarah, 35, Developer
James, 32, Designer
```
## Sample Output
```
Rahul, Senior Developer
Emily, Designer
Amit, Manager
Sarah, Senior Developer
James, Designer
```
## Instructions
- The script must be a `sed` script and not a bash script.
- It should be present in `~/se2001/nppe_4/` directory.
- Format the output strictly as shown in the example.
- Your script will be run as:

```bash
    sed -nf ./employees.sed 2>&1
```

# ANSWER

```bash
# Remove age field (comma, optional spaces, digits, comma)
s/, *[0-9]\{1,\},/,/

# Remove any leftover double spaces after comma
s/,  */, /

# Replace "Developer" with "Senior Developer"
s/Developer/Senior Developer/
```