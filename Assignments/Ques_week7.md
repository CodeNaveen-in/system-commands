# Practice Assignment 

A company maintains a file for each employee, the file is named as their employee number. The employee number is in the format YYYYDNNN such YYYY is the joining year of the employee, D is the division code {A, E, M, S}, and NNN is the unique three digit number for each employee(Assume that every year less 999 employees joined the company). The company is giving a special appraisal to the employees who are in the company for over 10 years. Sample file for the employee with employee number 2021E001 is given below.

```bash
$cat 2021E001
ID 2021E001
NAME Marcos Patterson
JOINING_DATE 2021/12/31
DIVISION Engineering
DESIGNATION Associate
CTC $100000
```

### 1. Select the script which "lists files of employees who joined the company before 1st January 2012 and also creates a new file "appraisal_list" with their employee IDs, one on each line".

**ANSWER**
```bash
#!/bin/bash
for file in $(ls | egrep "^[12][0-9]{3}[AEMS][0-9]{3}$"); do
 while read identifier value; do
 if [[ $identifier == "JOINING_DATE" && $value < "2012/01/01" ]]; then
 echo $file
 fi
 done < $file
done > appraisal_list
```

### 2. Select the script which creates a mapping file named "map" , such that it contains the mapping of employee ID to the employee name for each employee in the format EMP_ID NAME, one in each line. In the given format there are two fields "EMP_ID" and "NAME"(employee name), separated by a space.

**ANSWER**
```bash
#!/bin/bash

for file in $(ls | egrep "^[12][0-9]{3}[AEMS][0-9]{3}$"); do
  while read identifier value; do
    if [[ $identifier == "NAME" ]]; then
      echo $file $value
    fi
  done < $file
done > map
```

### 3. Using the info in the files "appraisal_list" and "map files", select the script which prints only names of all the employees whose Employee Ids are in "appraisal_list".

**ANSWER**
```bash
#pg 1
for id in $(<appraisal_list); do
  a=$(grep $id map)
  echo ${a:9}
done

#pg 2
map_id_name=($(cat map | sort))
appraisal_ids=($(cat appraisal_list | sort))
n=${#map_id_name[@]}
j=0
for ((i=0; i<n; i=i+3)); do
  if [[ ${map_id_name[$i]} == ${appraisal_ids[$j]} ]]; then
    echo ${map_id_name[$((i+1))]} ${map_id_name[$((i+2))]}
    ((j++))
  fi
done

#pg 3
declare -A map_id_name
while read id name; do
  map_id_name[$id]=$name
done <<< $(cat map | sort)

for i in $(cat appraisal_list | sort); do
  echo ${map_id_name[$i]}
done
```

### 4. Select the Bash script(s) that create a file named "salary_hike", containing employee information(4 fields, separated by space) in the format EMP_ID NAME OLD_CTC NEW_CTC , where EMP_ID is employee Id, NAME is employee name, OLD_CTC is old CTC of employee and NEW_CTC is the new CTC of employee after the special appraisal, all four fields are separated by a space. For calculating NEW_CTC every employee in the file "appraisal_list" gets a salary hike of 15% as part of the special appraisal.

**ANSWER**
```bash
# pg 1
while read id; do
  name=$(grep NAME $id | { read first rest; echo $rest; })
  ctc_old=$(grep CTC $id)
  ctc_old=${ctc_old/CTC \$/}
  hike=1.15
  echo $id $name \$$ctc_old \$$(bc <<< $hike*$ctc_old)
done < appraisal_list > salary_hike

#pg 2
while read id; do
  while read -ra line; do
    for i in ${line[@]}; do
      if [[ $i =~ "NAME" ]]; then
        name="${line[$((i+1))]} ${line[$((i+2))]}"
      elif [[ $i =~ "CTC" ]]; then
        ctc_old=${line[$((i+1))]/\$/}
      fi
    done
  done <$id
  hike=1.15
  echo $id $name \$$ctc_old \$$(echo $hike*$ctc_old | bc)
done < appraisal_list
```

# PPA
### 1. Write a bash script that accepts any number of arguments and print the odd numbered arguments, i.e. first argument($1), third argument($3), fifth argument($5) and so on. 
In the output the values of the arguments should be separated by a space and printed on the same line.

**ANSWER**

```bash
script() {
#!/bin/bash

# Initialize a counter
i=1

# Loop through all arguments
for arg in "$@"; do
    # Print only if the argument index is odd
    if [ $((i % 2)) -eq 1 ]; then
        echo -n "$arg "
    fi
    ((i++))
done

# Print a newline at the end
echo
} 
```
### 2. Write a bash script to print the sum of investment amounts of all the investors identified by the analytics team whose names(hash values) are present in the file 'result'. 

**ANSWER**
```bash
#!/bin/bash

# Initialize total investment sum
total=0

# Loop through each hash in the result file
while read -r hash; do
    # Find the corresponding filename from the map
    filepath=$(grep "^$hash" map | awk '{print $2}')
    
    # Extract the investment amount from the file
    if [ -n "$filepath" ] && [ -f "$filepath" ]; then
        amount=$(grep "INVESTMENT" "$filepath" | awk -F'$' '{print $2}')
        total=$((total + amount))
    fi
done < result

# Print the total investment
echo "$total"
```

# Graded Assignment

### 1. When the command ls -l is run in the current directory, the output is.
```bash
-rw-r--r-- 1 user group 0 Nov 30 11:08 rand1.txt
```
What is the correct output on running the below bash script?
```bash
for file in `ls`; do
    details=`ls -l $file`
    echo $file:${details:0:10}
done
```

**ANSWER**

```bash

rand1.txt: -rw-r--r--
```

*The variable file holds the filename and details holds the ls -l information for the file stored in the variable file*
*${details:0:10} prints first 10 characters i.e the permission string*

### 2. John wants to read two numbers from the user and print the sum total in USD(i.e. with a $ sign before the output number). Which of the following bash scripts can do this?

**ANSWER**
```bash
echo "Enter the first value:" && read a
echo "Enter the second value:" && read b

echo \$$((a+b))
```

*To print $, it should be escaped by \**

### 3. If the script is run from the terminal as './function.sh' and then the number 45.53 is entered as input on the terminal, what is the expected output?
```bash
read var
function opearate() {
    temp=$1
    temp=${temp%.*}
    echo $temp
}

echo $( operate $var )
```

**ANSWER** 45

*${temp%.*} removes the shortest sub sequence matching the pattern dot followed by any character sequence.*

### 4. How many files will be created by the script? 
```bash
for i in file_{A..D}{1..3}
do 
    n=$i.txt
    touch $n
done
```

**ANSWER** 12

### 5. Select all commands/scripts that will count the number of words in the file named 'paragraph'.

- [ ] wc -w paragraph

- [ ] wc -w < paragraph

- [ ] sum=0; for i in $(cat paragraph); do ((sum++)); done; echo $sum

- [ ] ```bash
```bash
sum = 0; 
while read line; do 
    for word in $line; do
        if [[ $line != "" ]]; then
            (( sum++ ))
        if
    done
    shift;
done < paragraph
echo $sum
```

**ANSWER** all

### 6. Which of the following scripts will give the output as below.
```bash
2, 10
4, 20
6, 20
8, 40
10, 50
```
**ANSWER**
```bash

# pg 1
for (( i=2, j=10; i<11 && j<60; i+=2, j+=10)); do
    echo $i, $j
done

# pg 2
for (( i=2, j=10; i<11; i+=2, j+=10)); do
    echo $1, $j
done

#pg 3
for (( i=2, j=10; i<11 || j<60;  )); do
    echo $i, $j
    (( j+=10 ))
    (( i+=2 ))
done
```

### 7. What is the return value of this script?
```bash
	#!/bin/bash
	false || true && false
	echo $?
```
- 0
- 1
- false
- true
- 
**ANSWER** 1

### 8. What does this bash script do?
```bash
	#!/bin/bash
	for f in *.txt; do
	  [[ -f $f ]] && echo "$f"
	done
```

- Lists all .txt files in the current directory

- Prints regular files and directories with .txt extension

- Throws an error if no .txt files exist

- Prints only regular files (not directories) with .txt extension

**ANSWER**
- Lists all .txt files in the current directory
- Prints only regular files (not directories) with .txt extension

# GrPA

### 1. In the lines that start with a digit, if there is a words "delta"(case sensitive) replace it with the word "gamma". Replace only the first occurrence of the word "delta" in the desired lines. The filename where the contents present are input.txt.

**ANSWER**
```bash
script() { 
sed -e '/^[[:digit:]]/s/delta/gamma/' input.txt
}
```

### 2. Write a bash script that takes a number as an argument and prints "Yes" if the number is a prime number, else prints "No".

**ANSWER**
```bash
script() {
n=$1

# Handle edge cases
if [ -z "$n" ] || ! [[ "$n" =~ ^[0-9]+$ ]]; then
    echo "Invalid input"
    exit 1
fi

if [ "$n" -le 1 ]; then
    echo "No"
    exit 0
fi

# Prime check
for (( i=2; i*i<=n; i++ ))
do
    if (( n % i == 0 )); then
        echo "No"
        exit 0
    fi
done

echo "Yes"
}
```

### 3. Write a bash script that prints the sum of all even numbers of an array of numbers. The array variable is named as number_arr.

**ANSWER**
```bash
script(){
read -a number_arr
#!/bin/bash
# Initialize sum variable
sum=0

# Loop through each number in the array
for num in "${number_arr[@]}"; do
    if (( num % 2 == 0 )); then
        ((sum += num))
    fi
done

# Print the result
echo "$sum"
}
```

### 4. Write a bash script that accepts an integer as argument and prints the corresponding day of week in capitals as given in the table below.

| Argument | 	1 or 8 | 	2 or 9 | 	3 |	4 | 	5| 	6 | 	7| 
| -------- | --------- | --------- | ---- | - | ---- | -- | ---- |  
| Output | SUNDAY | 	MONDAY| 	TUESDAY | 	WEDNESDAY | 	THURSDAY | 	FRIDAY| 	SATURDAY | 


If the argument is greater than 9 print ERROR
Hint: Use case statement.

**ANSWER**

``` bash
script() {
dow=$1

case $dow in
  1|8) echo "SUNDAY" ;;
  2|9) echo "MONDAY" ;;
  3) echo "TUESDAY" ;;
  4) echo "WEDNESDAY" ;;
  5) echo "THURSDAY" ;;
  6) echo "FRIDAY" ;;
  7) echo "SATURDAY" ;;
  *) echo "ERROR" ;;
esac

}
```

### 5. project is a directory present in the current working directory that has some text files. Write a Bash script that takes all files with the extension .h to create a tarball named headers.tar. Then compress the tarball with gzip named as headers.tar.gz without losing the headers.tar file.

**ANSWER**
```bash
script() { 
#!/bin/bash

# Navigate to the 'project' directory
cd project || { echo "Directory 'project' not found."; exit 1; }

# Create tarball named headers.tar including only .h files
tar -cf headers.tar *.h

# Compress headers.tar into headers.tar.gz, while keeping the original tarball
gzip -k headers.tar
}
```

### 6. Consider a directory named "perf_folder" containing some files with different extensions, present in the current working directory. Write a bash script that accepts an argument(name of destination directory), adds a prefix string "program_" to the file names in the directory "perf_folder" meeting the below criteria.
The file extension is ".c".
The file names should containing the substring perf.

Also move all the files meeting the above criteria after renaming to the directory(destination) whose name is specified as an argument to your script. The destination directory may or may not be present in the current working directory, if not present create the directory under current working directory.

For e.g. the argument to your script is perf_programs, i.e. perf_programs is the destination directory for renamed files.

If below is the output of ls perf_folder when run in your current working directory.

perf_results.cvc	perf_conf.xml		set_perf_input.c	perf_params.c
start_test.c	stop_test.c	results.txtscript.sh

Then after running your script, 
the new output of  running ls perf_folder in your current working directory should be,

perf_results.cvc	perf_conf.xml	start_test.c	stop_test.c	results.txt		script.sh
and output of running command ls perf_programs in your current working directory should be, 

program_set_perf_input.c	program_perf_params.c

**ANSWER**
```bash
script() { 
# If directory as argument one is not present, create it.
ls -d $1
if [[ $? -ne 0 ]]; then
        mkdir $1
fi

cd perf_folder
for file in *perf*.c; do
       mv $file ../$1/program_$file
done
} 
```