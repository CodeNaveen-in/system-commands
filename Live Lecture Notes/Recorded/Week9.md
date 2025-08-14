# AWK programming
- A language for processing fields and records.
- usage 
  - `cat /etc/passwd | awk -F":" '{print $1}'` - for single line at command line.
  - `./myscript.awk /etc/passwd` - for script interpretation by awk
- Multiple `BEGIN` and `END` are processed as they are part of same block processed on the number of hierarchy.
- Every script has a pattern and procedure
  - `BEGIN  {variable assignment}`

## Opearators
- `exp ? a : b` - Condition
- `a in array` - Membership
- `a ~ /regex/` - regular expression
- `a !~/regex/` - negation of expression

## Functions and Commands
- Arithmetic
- String
- Control Flow

## Arrays
- Associative arrays with sparse storage
  - `arr[ind] = value`

# functions
- `cat infile | awk -f mylib -f myscript.awk`
- super fast in function as excel couldn't even open
- We can sort, append and review the data wth awk