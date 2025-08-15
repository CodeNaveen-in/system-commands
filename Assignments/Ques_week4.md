# Practice Assignment

### 1. The file "Pincode_info.csv" has information about the postal circle, region, division, office, pin code, delivery, district and state name. The output of the command "head -5 Pincode_info.csv" is given below
Which of the following commands can be used to extract only the pin codes and write to a file "pincodes.csv"?

```excel
Circle Name, Region, Division Name, Office Name, Pincode, OfficeType, Delivery, District, Statename
``` 

- `egrep -o '[0-9]{6}' Pincode_info.csv > pincodes.csv`

- `egrep -o '[[:digit:]]{6}' Pincode_info.csv >> pincodes.csv`

- `touch pincodes.csv && egrep '[[:digit:]]{6}' Pincode_info.csv >> pincodes.csv`

- `egrep -q '[0-9]{6}' Pincode_info.csv > pincodes.csv`

**ANSWERS** 
1. `egrep -o '[0-9]{6}' Pincode_info.csv > pincodes.csv`
2. `egrep -o '[[:digit:]]{6}' Pincode_info.csv >> pincodes.csv`

*egrep '[[:digit:]]{6}' Pincode_info.csv will print the entire line where the pattern is matched.*
*The option -o will print only the characters that matched the pattern(s) given.*
*[0-9] will match all digits*
*{6} is a quantifier added to the [0-9] that will match with the 	exact six consecutive numbers.*

### 2. Match the following options used with grep to their corresponding use.

| Options | Uses |
| ------- | ---- |
| 1. e | A. Invert the sense of matching |
| 2. v | B. Used for multiple patterns |
| 3. i | C. Print only the matched parts |
| 4. o | D. Ignores the case sensitivty |

- 1-B, 2-D, 3-A, 4-C
- 1-D, 2-C, 3-A, 4-B
- 1-C, 2-B, 3-D, 4-A
- 1-B, 2-A, 3-D, 4-C

**ANSWER**  - 1-B, 2-A, 3-D, 4-C

### 3. Which of the following command can be used to print all the fields following field 10 of every line where each field is separated by a comma.

- cut -f 10,-
- cut -d ',' -f 10-
- cut -d ',' -f 10,end
- cut -f 10,end

**ANSWER** - cut -d ',' -f 10-

# PPA

### 1. Write a command to print the name of directories(in the current working directory) that have read, write and execute permissions for other users. Print only the directory name on each line.

**ANSWER**
```bash
script() {
ls -b
}
```

### 2. The file Pincode_info.csv has information on the pin codes of some places. The output of the command head -5 Pincode_info.csv is given below. First line of this file gives the information about the sequence of fields in each line of file following it.

```bash
Circle Name,Region Name,Division Name,Office Name,Pincode,OfficeType,Delivery,District,StateName
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,A Narayanapuram B.O,515004,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Akuledu B.O,515731,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Alamuru B.O,515002,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Allapuram B.O,515766,BO,Delivery,ANANTHAPUR,Andhra Pradesh
```
Write a command to display the Circle name and Division name separated by space for the given pincode  stored in a shell variable 'pin'. 
For  e.g. if 'pincode=515002' then your command should display 'Andhra Pradesh Anantapur'
Note: If your solution has more than one line, add a semicolon after each line.

**ANSWER** 
```bash
script() { 
while IFS=',' read -r circle region division office pincode type delivery district state; do
  pincode="${pincode//$'\r'/}";
  if [[ "$pincode" == "$pin" ]]; then
    echo "${circle// Circle/} ${division// Division/}";
    break;
  fi;
done < <(tail -n +2 Pincode_info.csv);
}
```

# Graded Assignment

### 1. The file "NameList.csv" has the names of the students, one on each line. What will the following command do?

```bash
egrep '\b[rR]aj\b' NameList.csv
```
- Gives the names containing the word 'raj' or 'raja'.
- Gives the names containing the word 'raj' or 'Raj' but not 'Raja'.
- Gives the names containing the word 'raj' or 'Raj' only when it is in the beginning of the line
- None of the above.

**ANSWERS** - Gives the names containing the word 'raj' or 'Raj' but not 'Raja'.

### 2. Select the correct options with respect to the following command?

```BASH
grep -n gnu gnu_history.txt
``` 
- Prints only the matched text not the entire line.
- Prints the line numbers that contain the word
> 1. gnu
.
- Performs grep but the no output will be shown.
- Prints the line numbers that do not have the word `gnu`

**ANSWER** Prints the line numbers that contain the word gnu.

*The option -n is used to print the line number where the pattern matched*

### 3. The file "CellNumbers.txt" has a list of phone numbers(10 digits), credit card numbers(16 digits) and usernames(single word string) in each line in the specified order. The entries in a row are separated by spaces. For e.g. one entry could be `2897442728 5688372212331253 user24` . Which of the following command will extract the credit card numbers and usernames from the file.
- [ ] egrep -o '[0-9]{16}\s[Aa-Zz].*' CellNumbers.txt
- [ ] egrep -v '[0-9]{16}\s[Aa-Zz].*' CellNumbers.txt
- [ ] egrep -i '[0-9]{16}\s[Aa-Zz].*' CellNumbers.txt
- [ ] cut -c 12- CellNumbers.txt
- [ ] cut -d ' ' -f1,2 CellNumbers.txt

**ANSWER** - egrep -o '[0-9]{16}\s[Aa-Zz].*' CellNumbers.txt, cut -c 12- CellNumbers.txt

*For the fields separated by a single space, the correct cut command using delimiter should be*
*cut -d ' ' -f2,3 CellNumbers.txt*

### 4. What is the expected output of the below command?

```bash 
grep -v "^\(#\|'\|\/\/\)" code.txt
```
- Prints the lines with `#`, `'`, `\` anywhere in the line.
- Prints the lines without `#`, `'`, `\`
- Prints the lines starting with `#`, `'`, `//`
- Prints the lines that do not start with `#`, `'`, `//`

**ANSWERS** - Prints the lines that do not start with `#`, `'`, `//`

### 5. Which of the following commands can be used to list all the file names with extension `.cpp`in the current directory?

- [ ] ls -l | egrep "^-" | grep -i "\.cpp"
- [ ] ls -l | egrep -i "^-|cpp"
- [ ] find . -maxdepth 1 -type f -name '*.cpp'
- [ ] find . -maxdepth 1 -type f | grep "\.cpp"

**ANSWER**
- ls -l | egrep "^-" | grep -i "\.cpp"
- find . -maxdepth 1 -type f -name '*.cpp'
- find . -maxdepth 1 -type f | grep "\.cpp"

### 6. Given the following files: file1.txt, file2.txt, file10.txt, file20.txt, which pattern will
match only file1.txt and file2.txt?

- [ ] file[1-2].txt
- [ ] file[1,2].txt
- [ ] file{1,2}.tx
- [ ] file[12].txt

**ANSWER** 
- file[1-2].txt
- file{1,2}.txt

### 7. In Bash, what does the pattern [[ $var =~ ^[a-z]+\.(txt|log)$ ]] test for?

- The variable starts with one or more lowercase letters and ends in .txt or .log
- The variable starts with any letters and end with a period
- The variable ends with either .txt or .log but may include any symbols before
- The variable starts with one or more lowercase letters contains .txt or .log anywhere in the string

**ANSWER** The variable starts with one or more lowercase letters and ends in .txt or .log

# GrPA

### 1. The poem “Sail away” by Rabindranath Tagore is stored in the file named poem.

``` word
Early in the day it was whispered that we should sail in a boat,
only thou and I, and never a soul in the world would know of this our
pilgrimage to no country and to no end.

In that shoreless ocean,
at thy silently listening smile my songs would swell in melodies,
free as waves, free from all bondage of words.

Is the time not come yet?
Are there works still to do?
Lo, the evening has come down upon the shore
and in the fading light the seabirds come flying to their nests.

Who knows when the chains will be off,
and the boat, like the last glimmer of sunset,
vanish into the night?
```
Write a command to print the number of non-empty lines that do not contain an article (a, an, the) in it. The command should print a number that is the count of lines, and should not print the lines.

**ANSWER** 
```bash
script() {
grep -e "\ba\b\|\ban\b\|\bthe\b" poem -v | grep -e "\w" | wc -l
}
```

### 2. Each line in the file employees.csv contains the name, role and division of employees separated by a comma. Every line corresponds to one employee. The user wants to collect the details of employees who are managers in the R&D division. For managers the string for the role is ‘Manager’ and the division string for employees working in the R&D division is ‘R&D’.

Write a command to collect the required details and redirect the output to a file named “info.csv”. "info.csv" should contain the name, role and division (separated by a comma) of each employee (as per the above criteria) on a separate line.

**ANSWER**
```bash
script() {
grep -i "manager" employees.csv | grep "R&D" > info.csv
}
```

### 3. Write a command that will print all the lines not containing the word gnu (case-insensitive) in the file test.txt present in the current working directory.

**ANSWER** - 
```bash
script() { 
grep -vi "gnu" test.txt
}
```