# AWK
# Built-in variables
| Variable | 	Description|
| --------- | ------------ |
| ARGC	Number of arguments supplied on the command line (except those that came with -f & -v options)| 
| ARGV	| Array of command line arguments supplied; indexed from 0 to ARGC-1| 
| ENVIRON	| Associative array of environment variables| 
| FILENAME	| Current filename being processed| 
| FNR	| Number of the current record, relative to the current file| 
| FS	| Field separator, can use regex| 
| NF	| Number of fields in the current record| 
| NR	| Number of the current record| 
| OFMT	| Output format for numbers| 
| OFS	| Output fields separator| 
| ORS	| Output record separator| 
| RS	| Record separator| 
| RLENGTH	| Length of string matched by match() function| 
| RSTART	| First position in the string matched by match() function| 
| SUBSEP	| Separator character for array subscripts| 
| $0	| Entire input record| 
| $n	| nth field in the current record| 

## Operators
| Type	| Operators|
| ----- | -------- | 
| Assignment	= += -= = /= %= ^= *=| 
| Logical	| |
| Algebraic	+ - * / % ^ **| 
| Relational	> <= > >= != ==| 

| Operator |	Description |
| -------- | -------------- |
| expr ? a : b	| Conditional expression| 
| a in array	| Array membership| 
| a ~ /regex/	| Regular expression match| 
| a !~ /regex/	| Negation of regular expression match| 
| ++	| Increment, both prefix and postfix| 
| --	| decrement, both prefix and postfix| 
| $	| Field reference| 
| Blank	| is for concatenation| 

## Functions and command
| Type	| Commands| 
| ----- | ------- |
| Arithmetic	| atan2 cos exp int log rand sin sqrt srand| 
| String	| asort asorti gsub index length match split| 
| sprintf | strtonum sub substr tolower toupper| 
| Control Flow	| break continue do while exit for if else return| 
| Input / Output	| close fflush getline next nextline print printf| 
| Programming	| extension delete function system| 
| bit-wise	| and compl lshift or rshift xor| 

```bash
String Functions
       Gawk has the following built-in string functions:

       asort(s [, d [, how] ]) Return  the  number  of  elements  in  the
                               source  array  s.   Sort the contents of s
                               using gawk's normal  rules  for  comparing
                               values,  and  replace  the  indices of the
                               sorted values s with  sequential  integers
                               starting  with 1. If the optional destina‐
                               tion array d is specified, first duplicate
                               s into d, and then sort d, leaving the in‐
                               dices of the source array s unchanged. 

       asorti(s [, d [, how] ])
                               Return  the  number  of  elements  in  the
                               source  array s.  The behavior is the same
                               as that of asort(), except that the  array
                               indices  are used for sorting, not the ar‐
                               ray values. 

       gensub(r, s, h [, t])   Search  the target string t for matches of
                               the regular  expression  r.   If  h  is  a
                               string beginning with g or G, then replace
                               all matches of r with s.  Otherwise, h  is
                               a  number  indicating  which match of r to
                               replace.  If t is not supplied, use $0 in‐
                               stead.  

       gsub(r, s [, t])        For each substring  matching  the  regular
                               expression  r  in the string t, substitute
                               the string s, and  return  the  number  of
                               substitutions.   If t is not supplied, use
                               $0.  

       index(s, t)             Return  the  index  of the string t in the
                               string s, or zero if  t  is  not  present.

       length([s])             Return  the length of the string s, or the 
                               length of $0 if s is not supplied.

       match(s, r [, a])       Return the position in s where the regular
                               expression r occurs, or zero if r  is  not
                               present,  and set the values of RSTART and
                               RLENGTH.  

       patsplit(s, a [, r [, seps] ])
                               Split  the  string  s into the array a and
                               the separators array seps on  the  regular
                               expression  r,  and  return  the number of
                               fields.

       split(s, a [, r [, seps] ])
                               Split the string s into the  array  a  and
                               the  separators  array seps on the regular
                               expression r, and  return  the  number  of
                               fields.   If  r is omitted, FS is used in‐
                               stead. 

       strtonum(str)           Examine str, and return its numeric value.

       sub(r, s [, t])         Just  like  gsub(),  but  replace only the
                               first matching substring.   Return  either
                               zero or one.

       substr(s, i [, n])      Return  the  at most n-character substring
                               of s starting at i.  If n is omitted,  use
                               the rest of s.

       tolower(str)            Return  a copy of the string str, with all
                               the uppercase characters in str translated
                               to  their corresponding lowercase counter‐
                               parts.  Non-alphabetic characters are left
                               unchanged.

       toupper(str)            Return  a copy of the string str, with all
                               the lowercase characters in str translated
                               to  their corresponding uppercase counter‐
                               parts.  Non-alphabetic characters are left
                               unchanged.
```

### Examples
```bash
# replace every alphanumeric character to A
awk '{gsub("[[:alnum:]]", "A", $1); print}' file 

# 
```
### Array
```bash
arr[index]=value # Assignment
for (var in arr) { print var; } # Iteration through array
delete arr[index] # Delete an array
```
### Conditional and Loops
```bash
if (a > b) {
  print a
}

for (a in array) {
  print a
} 

for (i=1;i<n;i++) {
  print i
} 

while (a < n) {
  print a
}

do {
  print a
} while (a < n)
```

## SED
### Actions
| Keyword	| Action| 
| ---------- | ---- |
| p	| Print the pattern space| 
| d	| Delete the pattern space| 
| s	| Substitute using regex match s/pattern/replacement/g| 
| =	| Print current input line number, \n| 
| #	| comment| 
| i	| Insert above current line| 
| a	| Append below current line| 
| c	| Change current line| 

## Programming
| Keyword	| Action| 
| --------- | ------ |
| b label	| Branch unconditionally to label| 
| :label	| Specify location of label for branch command| 
| N	| Add a new line to the pattern space and append next line of input into it.| 
| q	| Exit sed without processing any more commands or input lines| 
| t	| label Branch to label only if there was a successful substitution was made| 
| T	| label Branch to label only if there was no successful substitution was made| 
| w filename	| Write pattern space to filename
| x	| Exchange the contents of hold and pattern spaces| 

### Flags
| g | Global substitution|
| - | ------------------- |
| w | Write only the substituted line to a file |
| I | Ignore case while searching |
| e | Substitute and execute in the command line |
| n | subsititute the nth occurrence. Use some number for n, like 1, 4 etc.|

### Working on specific lines
Here most examples are shown using some command. But the command can be replaced with other command for other operations like d for deleting.

| Example |  Result |
| ------- | ------- |
| 3a text to be appended | Append line after line 3 |
| $a text to be appended | Append line at the end of the file |
| 7 s/old/new/ | Replace replace a string only on the 7th line |
| 5,7p | Print lines 5 to 7 |
| 5~3p | Print every third line starting from line 5 | 
| 1d | Delete the first line |

### Grouping
-  \(pattern\) \1 \2 \3 
-  For grouping use \( and \). Use \1, \2 in replacement to refer the group that matches pattern.