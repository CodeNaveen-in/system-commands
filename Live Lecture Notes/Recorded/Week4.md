# Pattern Matching

Regular Expressions are helpful in the searching of the data to find similar things.
- `grep 'pattern'`
- **Special characters**
  - `.` - any character except null or newline
  - `*` - zero or more characters
  - `[]` - Any of the enclosed characters
  - `^` - Anchor of the beginning of line or negation of enclosed characters
  - `$` - Anchor for the end of the line
  - `\` - Escape special characters
  - `\{n,m\}` - range of occurances
  - `cut` - remove sections from the line.
    - `-c` - for the characters
    - `-d` - for the delimiter
    - `-f` - for the fields
- **Character classes**
  - `[[: print :]]` - printable
  - `[[: alnum :]]` - alphanumeric characters
  - `[[: digits :]]` - digits

## Using grep features to search
- `grep 'Raman' names.txt` - will search Raman inside the file names.txt
- `cat names.txt | grep 'S.n'` - will give those with S and n with one character in between
- `cat names.txt | grep '.am$'` - will give those with am at the end of the file.
- `cat names.txt | grep 'M[ME]'` - will give those with ME or MM in th file
- `cat names.txt | grep B[1-7]` - will give those with B1 - B7 
- `cat names.txt | grep 'M\{1,2\}'` - will give either M or MM
- `cat chartypes.txt | grep '^[[: alpha :]]'` - give lines with alphabetical character at the start.
- `cat chartypes.txt | grep '[[: digit :]]$'` - give lines with digit at the end.

## Using epgrep to match
- `cat names.txt | egrep '(Anu|Raman)'` - wil give lines with either Anu or Raman.
- `cat patterns.txt | egrep '[[: digit :]] {12}` - wil give lines with 12 digits together
- `egrep '\b[[:alpha:]]{2}[[:digit:]]{2}[[:alpha:]][[:digit:]]{3}\b'` - will give a string with 2 characters 2 digits 1 character and 3 digits.