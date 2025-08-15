# Practice Assignment

### 1. What will be the format of the output of the following command?

```bash
    ls -l | awk '{print $1, $NF}'
```
- File Permission string, User
- User, File Name
- File Permission, File Name
- File Permission, File Type

**ANSWER** - File Permission, File Name

*$1 will print the first field*
*$NF will print the second field*
*ls -l prints the permission string in first field and the filename in the last field*

### 2. Which of the following commands will print the file, appending the line number to the starting of each line, irrespective of the data in the file?

- awk 'END {print NR, $0}' employee_details.txt
- awk 'BEGIN{FS=","} {print NR, $1}' employee_details.txt
- awk '{print NR, $0}' employee_details.txt

**ANSWER** - awk '{print NR, $0}' employee_details.txt

*NR is the predefined variable in AWK that keeps tracks of number of records (lines by default) processed irrespective of the number of files provided.*
*$0 refers the entire line in AWK*

### 3. What will be the output of the string below?

```bash
$ awk 'BEGIN{
print index("Ubuntu", "un"); 
print index("System Commands", "abc")
}'
```
**ANSWER** - 3 0

*index(s, t) 	Return the index of the string t in the string s, or zero if t is not present. (This implies that character indices start at one.) It is a fatal error to use a regexp constant for t.*

### 4. The built in variable NF used in awk scripts is used to.
- Display the line number.
- Display the first field in a line.
- Display the last field in a line.
- Display the number of fields in a line.

**ANSWER** Display the number of fields in a line.

### 5. What is the output of the following command?
```bash
$ echo "927.8 -8.314 -0.87" | awk 'BEGIN {FIELDWIDTHS="3 4 3"} {print $1,$2,$3}'
```

- 927 -8.3 -0.
- 927 .8 - 8.3
- 927 -8.314 -0.87
- 927.8 -8.314 -0.87

**ANSWER** - 927 .8 - 8.3
*FIELDWIDTHS variable is used define fixed length fields*

# PPA 

### 1. Write an awk script that reads a value n from the stdin within awk script, then prints the sum of odd numbers and sum of even numbers each on a separate line respectively, from the set of natural numbers from 1 to n (ends inclusive).

**ANSWER**
```bash
script() { awk '
BEGIN {
    getline n < "-"
    even_sum = 0
    odd_sum = 0
    for (i = 1; i <= n; i++) {
        if (i % 2 == 0)
            even_sum += i
        else
            odd_sum += i
    }
    print odd_sum
    print even_sum
}
' 
}
```

### 2. Write an awk script to find unintentionally repeated (duplicate) words in the file 'myfile.txt'. For example, sometimes a file can contain sentences like "The the building is beautiful". Print the repeated words on the order of occurence at one per line.

**ANSWER**
```bash
awk '{
    for (i = 1; i < NF; i++) {
        if (tolower($i) == tolower($(i+1))) {
            word = tolower($i)
            if (!(word in seen)) {
                print word
                seen[word] = 1
            }
        }
    }
}' myfile.txt
```

### 3. Write a script using AWK to print the file with the maximum number of lines. Assume only one file that have the maximum number of line among the given files.

**ANSWER**
```bash
awk 'FNR == 1 { count[FILENAME] = 0 } { count[FILENAME]++ } 
     END {
         max = 0
         for (f in count) {
             if (count[f] > max) {
                 max = count[f]
                 maxfile = f
             }
         }
         print maxfile
     }' file1.txt file2.txt file3.txt
```

# Graded Assignment

### 1. `1.file1.txt` is a file containing some text . The command `awk '{print}' file1.txt` is equivalent to which of the following commands, irrespective of the data in `1.file1.txt`.  
- cat file1.txt
- cut -f 1- file1.txt
- head file1.txt
- grep "" file1.txt

**ANSWER** - simply print will print the entire line

```bash
cat file1.txt
cut -f 1- file1.txt
grep "" file1.txt
```

### 2. What is the output of the below command?

```bash
for i in {1..9}; do 
    echo $i
done | 
awk 'BEGIN { value=0; }
{ value += $1*$1; } 
END { print value; }'
```

- 45
- 204
- 37
- 285

**ANSWER** 285

*BEGIN will execute before the obtaining input from standard input.*
*END will execute only after the all the records (line by default) are processed.*
*statements inside {} will be executed for every record.*

### 3. What is the output of the following bash script?
Note that before executing the below script the file "numbers.txt" is empty.
```bash
 for i in {1..10}; do
    for j in {1..10}; do
       echo $i, $j >> numbers.txt
    done
done
​
awk 'BEGIN { FS=",";value=0; }
8
{ value += $1*$2; }
9
END { print value; }' numbers.txt
```

- 3025
- 2025
- 45
- 55

**ANSWER** 3025

### 4. For which of the following commands output, the 1st and 2nd column in the input will be inverted? In the input, the 1st and 2nd columns are separated by a comma, and in the output too the columns should be separated by a comma.
- awk 'BEGIN{FS=",";}{print$2,$1}'
- awk '{print$2","$1}'
- awk 'BEGIN{FS=",";}{print$2","$1}'
- awk '{print$2,$1}'

**ANSWER** awk 'BEGIN{FS=",";}{print$2","$1}'

*The value in the FS is the input field separator.*
*$i refers to the ith field*

### 5. The purpose of the following command is to

``` bash
ls -l | 
egrep -v "^d" | 
awk '{ sum += $5; }; 
END { print sum; }'
```
- Calculate the number of characters in all the files in the current directory.
- Calculate the space occupied by all the files in the current directory in bytes.
- Calculate the sum of creation dates of all the files in the current directory.
- Calculate the number of lines in all the files in the current directory.

**ANSWER** Calculate the space occupied by all the files in the current directory in bytes.

*-v in egrep will print only the lines that are not matched.*
*The fourth field in ls -l is the size of the file.*

### 6. The output of the above command is as follows;

```bash
$ cat employee_details.txt

A1998001,Ram Kumar,10,Male
B2000002,Sanjay Narayan,7,Male
B2000003,Srishti Rai,10,Female
E1997001,Manoj Pillai,12,Male
G1998001,Preeti Suresh,9,Female
G1999001,Leela L G,16,Female
```

then what could be output of command `$ awk 'NR==3, NR==5 {print NR,$1}' employee_details.txt`?

- 3 B2000003
5 G1998001

- 3 B2000003,Srishti Rai,10,Female
5 G1998001,Preeti Suresh,9,Female

- 3 B2000003
4 E1997001
5 G1998001

- 3 B2000003,Srishti
4 E1997001,Manoj
5 G1998001,Preeti

**ANSWER** 3 B2000003,Srishti
4 E1997001,Manoj
5 G1998001,Preeti

*NR stores the number of records processed.*

### 7. Which of the following commands can be used to calculate the number of lines in the file 
`employee_details.txt`

- [ ] $ awk 'END { print NR }' employee_details.txt

- [ ] $ awk 'END {count}' employee_details.txt

- [ ] $ awk '{++value;}END{print value;}' employee_details.txt

- [ ] $ awk 'BEGIN{FS=",";n=0}{n++;++n;print $n}' employee_details.txt

**ANSWER**
```bash
$ awk 'END { print NR }' employee_details.txt
$ awk '{++value;}END{print value;}' employee_details.txt
```

*If a variable is not defined in AWK then after increment of that variable its value is 1*

### 8. Which of the following AWK commands will give the same output as the command below? 
`$ echo To be or not to be | tr " " "\n"`

Note that tr " " "\n" will replace each space by a newline character.
i.e. each word in the string "To be or not to be" will be printed on a new line by the command 

**ANSWER** $ awk 'BEGIN{ sentence="To be or not to be"; fieldsep=" "; n=split(sentence, array, fieldsep); for(i=1; i<=n; i++){printf("%s\n", array[i]);} }'

### 9. Which of the following commands will print the count of lines in the input file `file1`? The expected output is only a number indicating the count of lines.

**ANSWER**
```bash
cat file1 | wc -l
sed -n '$=' file1
awk 'END{print NR}' file1
awk 'BEGIN{n=0}{n++}END{print n}' file1
```

*= is used to print line numbers*
*$ is the addressing used to specify last line*
*Thus, combined which it translates to only print the line number at the last line*

### 10. Which of the following awk commands will print lines from data.txt where the second field is greater than 50?
- [ ] awk '$2 > 50' data.txt
- [ ] awk '{ if ($2 > 50) print $0 }' data.txt
- [ ] awk 'BEGIN { FS = " " } $2 > 50' data.txt
- [ ] awk '$2 >= 50 { print $2 }' data.txt

**ANSWER**
```bash
awk '$2 > 50' data.txt
awk '{ if ($2 > 50) print $0 }' data.txt
awk 'BEGIN { FS = " " } $2 > 50' data.txt
```

### 11. Which of the following commands count the number of lines in a file?
- [ ] awk 'END { print NR }' file
- [ ] awk '{ count++ } END { print count }' file
- [ ] awk 'END { print NF }' file
- [ ] awk 'NR > 0 { n++ } END { print n }' file

**ANSWER**
```bash
awk 'END { print NR }' file
awk '{ count++ } END { print count }' file
awk 'NR > 0 { n++ } END { print n }' file
```

# GrPA 

### 1A. Consider a file named marks.csv containing roll number and marks of variable number of subjects of students. The values are comma separated values and in the format
RollNo,Subject1,Subject2,Subject3,So on...

Write an Awk command to print all the roll numbers(RollNo) in the file.

**ANSWER**
```bash
script() {
awk -F, '{print $1}' marks.csv
}
```

### 1B. Write an Awk command to print the first field of the all the lines containing more than 20 characters in the file marks.csv. The field separator in the file is comma (,).

**ANSWER**
```bash
script() {
awk -F, 'length($0)>20{print $1}' marks.csv
}
```

### 1C. Write an awk script to print the total number of fields in a csv file with the field separator as comma (,). Print only the number and nothing else.

**ANSWER**

```bash
script(){ echo '
BEGIN{
 FS=",";
 sum=0;
}
{
 sum=sum+NF;
}
END{
 print sum;
}
' >yourScript.awk
awk -f yourScript.awk marks.csv
}
```

### 1D. Write an Awk Script to print all the lines whose starting and ending character is a digit. Also print the count of these lines(only the number) on a new line at the last in your output. The field separator in the file is comma (,).

Note, that here it is asked to write an Awk script. Read the Programming questions instructions for more clarity.

**ANSWER**
```bash
script(){ echo '
BEGIN{
 FS=",";
 sum=0;
}
/^[0-9].*[0-9]$/{
 print $0;
 sum=sum+1;
}
END{
 print sum;
}
' >yourScript.awk
awk -f yourScript.awk marks.csv
}
```

### 2. A software company has published some best practices for writing the code. One of the best practice mentioned is that if no line in your code should exceed 50 characters in total including all type of characters or spaces.

Given a bash script that intends to print the names of all .c files that contain one or more lines with length more than 50 characters(as specified above).


The awk script within this bash script to check the files as per above condition is missing in the code, complete that

**ANSWER**
```bash
eof="EOF"
while read file; do
  if [[ $file =~ $eof ]]; then
    break
  fi
  while read line; do
    if [[ $line =~ $eof ]]; then 
      break
    fi
    echo $line >>$file
  done
done
######### Driver code ends here

######### Script starts here
for file in *.c; do
  awk '


    BEGIN {
      flag=0;
    }

    {
      if (length($0)>50) flag=1;
    }

    END {
      if (flag==1) print FILENAME;
    }
  ' $file
done
```

### 3. Without using the wc command , write a bash script that accepts any number of arguments. Out of these some would be options(hyphen plus a character like -l or -c) and the last argument will be a file path(use ${@: -1} to access the last argument, there is a space before -1). Only four options are accepted by your script -l, -w, -n and -s.

**ANSWER**
```bash
myCount(){
filename=${@: -1}

while getopts "wlns:" options; do
  case "${options}" in
    s)
      str=${OPTARG}
      grep $str $filename | awk "END{print NR}"
      ;;
    w)
      awk "BEGIN{c=0} {c+=NF} END{print c}" $filename
      ;;
    l)
      awk "END{print NR}" $filename 
      ;;
    n)
      awk "BEGIN{c=0} /^[[:digit:]]+$/{c++} END{print c}" $filename
      ;;
    *)
      echo "ERROR"
      ;;
  esac
done

}
```

### 4. Write an awk script that that takes the file EmployeeDetails.csv as input and prints the email ids of all the female employees of the company in the same sequence as the employee details appear in the file EmployeeDetails.csv.

**ANSWER**

```bash
script(){ echo '
BEGIN{  
	FS = ","
} 

{
	EID = $1
	Gender= $4
	if (Gender ~ /Female/) {
		print EID"@xyz.com"
        }
}
' >yourScript.awk
awk -f yourScript.awk EmployeeDetails.csv
}
```

### 5. Consider a special programming file functions.sh that contains several functions (A function is a block of code). Write a bash script/command using sed to insert a line "# START FUNCTION" before the starting of a function and a line "# END FUNCTION" at the end of the function.
Starting of a function in this file can be identified as a line that has some string followed by "(", then followed by ")" or some string followed by ")", and this line should end with "{".
Ending of a function can be identified by a line containing only "}" in the whole line.
In this file curly braces "{" and "}" are not used for any other purpose. Do not change the original file just print the output to STDOUT.

**ANSWER**

```bash
script() { 
sed -e "/[[:alnum:]+](.*)[[:space:]]*{/i # START FUNCTION" \
    -e "/^[[:space:]]*}/a # END FUNCTION" functions.sh
}
```

### 6. Write an awk script takes the file EmployeeDetails.csv as input and prints the name of the employee(s) with lowest number of leaves taken this year. If there are more than one employees with the lowest number of leaves, print the name of each employee on a new line.

**ANSWER**
```bash
script() { echo '
BEGIN{
  FS = ",";
}
{
  if (NR == 1)
  {
    lowc=int($3);
    count =0;
    name[count] = $2;
    next;
  }
  Name = $1;
  leave = $3;
  if (leave < lowc)
  {
    lowc = leave;
    delete name;
    count = 0;
    name[count] = $2;
  }
  else if (leave == lowc)
  {
    count++; name[count] = $2
  }
}

END{
  for (i=0; i<=count; i++)
  {
    print name[i];
  }
}
' > yourScript.awk
awk -f yourScript.awk EmployeeDetails.csv
}
```

### 7. Given some raw programming files, we want them to adhere to the company guidelines. Write a sed script that will run for all ".sh" files in the current directory and print the contents after performing the following actions. You just need to write the sed script, running that for all the files will be taken care of by our driver bash script.

Insert a copyright message at the start of the file(before the first line) as "# Copyright IITM 2022"(Note that there is a space after #).
Insert a copyright message at the end of the file(after the last line) as "# Copyright IITM 2022".
Insert a line "# START FUNCTION" before the starting of a function and a line "# END FUNCTION" at the end of the function. Check GrPA 4 for more details on identifying function boundaries. Use the same logic here.
Change the function "background_sleep" to "inactive_sleep". So replace all the occurrences of the word "background_sleep" in any line with "inactive_sleep". Assume that these keywords are used only in context of a function and nothing else.
Also, the function "active_sleep" is deprecated and we do not have an immediate replacement. So insert a line "# TODO:DEPRECATED" before the function "active_sleep" and in every instance. i.e. before every line containing the word "active_sleep".
After every 10th line (in line numbers 10, 20, 30,... ) add a line with four hashes such as "####" after applying all the above actions.

**ANSWER**
```bash
echo '
#!/usr/bin/sed -f
1 i\# Copyright IITM 2022
$ a\# Copyright IITM 2022
/[[:alnum:]+](.*)[[:space:]]*{/i\# START FUNCTION
/^[[:space:]]*}/a\# END FUNCTION
s/background_sleep/inactive_sleep/g
/\bactive_sleep/ i\# TODO:DEPRECATED
10~9 i\####
' | col > myscript.sed
```

### 8. Write an awk script that takes input as file EmployeeDetails.csv and calculate and prints the average number of leaves taken by the employees born in each year from 1997 to 2000(both 1997 and 2000 included). The average for each year should be printed on a newline starting from the year 1997 to 2000 in the same sequence i.e. your script should print 4 lines of output always one for each year 1997, 1998, 1999 and 2000. If there are no employees born in some year, print 0 for that years average leaves. Print only the integer part of the average(i.e. if the average is 7.3333 print 7). Use int() function to get the integer part of any float number.

**ANSWER**

```bash
script () { echo '
BEGIN{
  FS = ","
}

{
  if (NR == 1){
    l1997 = 0; c1997 = 0; av1997 = 0;
    l1998 = 0; c1998 = 0; av1998 = 0;
    l1999 = 0; c1999 = 0; av1999 = 0;
    l2000 = 0; c2000 = 0; av2000 = 0;
  }
  EID = $1;
  leave = int($3);
  # to obtain year from employee ID
  year = int(substr(EID, 2, 4));
  if (year == 1997)
  {
    l1997 = l1997 + leave; c1997++;}
  else if (year == 1998)
  {
    l1998 = l1998 + leave; c1998++;}
  else if (year == 1999)
  {
    l1999 = l1999 + leave; c1999++;}
  else if (year == 2000)
  {
    l2000 = l2000 + leave; c2000++;}
}

END{
  if (c1997 != 0)
    {av1997 = l1997/c1997;}
  if (c1998 != 0)
    {av1998 = l1998/c1998;}
  if (c1999 != 0)
    {av1999 = l1999/c1999;}
  if (c2000 != 0)
    {av2000 = l2000/c2000;}
  print (int(av1997))
  print (int(av1998))
  print (int(av1999))
  print (int(av2000))
}
' >yourScript.awk
awk -f yourScript.awk EmployeeDetails.csv
}
```

### 9. You have a csv file named groceries.csv that contains a list of grocery items and their unit cost. The two fields are separated by comma(,). This file will be given as input to your Awk script.

Write an Awk script that takes two arguments(command line) named item and n, where item is the item name and n is the number of units, then prints the total cost of purchasing n units of the item item. The script prints only a number. i.e. you need to find the item cost of the item given in argument while parsing the input file.
Note: You can directly use these variables with the given name in your Awk script. Assume that the item given in the argument will always be present in the csv file.

**ANSWER**

```bash
script() { echo '

BEGIN {
 FS = ",";
}
{
  a = $2
  b = $3
  if (a ~ item) {
    ans = b*n;
    print ans;
    exit;
  }
}

' > yourScript.awk
awk -v item=$1 -v n=$2 -f yourScript.awk groceries.csv
}
```