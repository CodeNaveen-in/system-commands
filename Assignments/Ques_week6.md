# Practice Assignment

### 1. The following script is named as 'runScripts.sh' and is created to run all the scripts present in a directory. This script is saved with other files in current working directory. What is the expected behaviour on running the command 'bash runScripts.sh' in current working directory?

```bash
#!/bin/bash

for file in `ls *.sh`; do
    bash ./$file
done
```

- [ ] Runs all the scripts in the current working directory once.

- [ ] Runs all the scripts in the current directory, but returns error for the scripts that expects operands.

- [ ] May raise an error for each script in current directory as the file type is not specified.

- [ ] Will enter into an infinite loop.

**ANSWER**
- Runs all the scripts in the current directory, but returns error for the scripts that expects operands.
- Will enter into an infinite loop.

*Recursion of executing the current file happens again and again so each script will be executed more than once. ls *.sh will include the current file (runScripts.sh) we are executing from as well so it will go on recursion*

### 2. What is the expected behaviour of the following bash script?

```bash
for file in `find . -maxdepth 1 -name '*.txt'`; do
    echo $(basename $file)
done
```

- Prints the file names of all the '.txt'  files in the current directory non recursively.

- Prints the file names of all the '.txt' files in the current directory recursively.

- Prints the file names of all the '.txt' files in the current directory and in immediate subdirectories of current working directory non-recursively.

**ANSWER** Prints the file names of all the '.txt'  files in the current directory non recursively.

*find . -maxdepth 1 -name '*.txt' is equivalent to ls *.txt.
basename gives the filename without the preceding directory path
The filenames are got from find . -maxdepth 1 -name '*.txt' and printed iteratively.*

### 3. The following bash script is written to count the number of empty files in the present working direcory. Due to some error in the code, it does not function as expected. Which of the following changes should be made to complete the required task?

```bash
c = 0 
for file in ./*, do
    if ![-z `file file | grep 'empty'`]
    then
        c++;
    fi
done;

echo c
```
- A
```bash
c = 0 
for file in ./*, do
    if ![-z `file file | grep 'empty'`]
    then
        c++;
    fi
done;
```

- B
```bash
c = 0 
for file in ./*, do
    if ![-z "`file file | grep 'empty'`"]
    then
        ((c++;));
    fi
done;
```

- C
```bash
c = 0 
for file in ./*, do
    if ![-z "`file $file | grep 'empty'`"]
    then
        ((c++;));
    fi
done;
echo $c
```

- D
```bash
c = 0 
for file in ./*, do
    if ![-z `file $file | grep 'empty'`]
    then
        c++;
    fi
done;
echo $c
```

**ANSWER** 
```bash
c = 0
for file in ./*; do
    if ![ -z "`file $file | grep 'empty'`"]
    then 
        ((c++));
    fi
done;
echo $c
```

*The variable c should be incremented by ((c++))*
*Referring to a variable should be done by preceding $*

### 4. var1=`echo Today is a good day` echo ${#var1}

What is the output of the above command sequence? (Enter only an integer. For example: 13)

**ANSWER** 19

### 5. Which of the following commands will give the same output as the script?
```bash
#!/bin/bash

for myd in `find . -type d`
do 
    for n in `ls $myd`
    do
        t=`file $myd/$n| grep "shell script"`;
        if [ -n "$t"]
        then 
            echo $n
        fi
    done
done
```

- ls -R | xargs file | grep shell | grep -o "^.*\.sh"

- ls -R | file | grep shell | grep -o "^.*\.sh"

- ls -R | xargs file | grep -v shell | grep -o "^.*\.sh"

- ls -R | xargs file | grep shell | grep "^.*\.sh"

**ANSWER** - ls -R | xargs file | grep shell | grep -o "^.*\.sh"

*ls -R will recursively list all files and directories.* 
*xargs will convert the stdout to arguments*
*grep shell will look for the lines contains the words 'shell' (shell scripts)*
*-o option is used to print only the pattern*

### 6. Consider a file currently opened in the vi editor with the below text
 Line1
 Line2
 Line3
 Line4
 ...
 ...
 Line97
 Line98
 Line99
 Line100

Given below in each option is a command(in vi editor) and it function. Choose the correct pairs from the options below.

- 3,$s/Line/line/g , Performs 98 substitutions

- %s/Line/line/g , Performs 100 substitutions

- %s/blah/Line/g , E486: Pattern not found: blah

- %/Line/Line , Performs 100 substitutions

**ANSWER**
1. 3,$s/Line/line/g , Performs 98 substitutions
2. %s/Line/line/g , Performs 100 substitutions
3. %s/blah/Line/g , E486: Pattern not found: blah

# PPA

### 1. Write a bash command using find that copies all the files within the directory /source to /destination. Note that all the files within all hierarchy have distinct names and should be copied to /destination .

**ANSWER**
```bash
script() {
find /source -type f -exec cp {} /destination/ \;
}
```

### 2. Consider a file named data.txt in the current working directory. Write a script to determine if this file has more than 16 lines or not. Your script should print Yes if the lines are more than 16; else print No.

**ANSWER**
```bash
script() {
#!/bin/bash

# Count the number of lines in data.txt
line_count=$(wc -l < data.txt)

# Check if the line count is greater than 16
if [ "$line_count" -gt 16 ]; then
    echo "Yes"
else
    echo "No"
fi
}
```

# Graded Assignment

### 1. Given below are the contents of the bash script "file.sh" .

```bash
#!/bin/bash
 sum = 0
 for (( i=1 ; i<$1 ; i++)) ; do
    if [ $((i%2)) -eq 1 ]; then
        sum=$((sum+i))
    fi
done 
echo $sum
```         
Choose the option(s) in which the expected output matches the script usage.

- [ ] Usage: "./file.sh 45", Output: 484

- [ ] Usage: "./file.sh 45", Output: 1035

- [ ] Usage: "./file.sh 57", Output: 1653

- [ ] Usage: "./file.sh 57", Output: 784

**ANSWER**
1. Usage: "./file.sh 45", Output: 484
2. Usage: "./file.sh 57", Output: 784

*Here the sum variable incremented by i when i is an odd number. Hence, the script computes the summation of all odd number from 1 to the number provided as first argument (exclusive).*

### 2. What is the expected output of the following bash script?
```bash
#!/bin/bash
for i in `ls`; do
    echo $(pwd)/$1
done
```
- Prints the file names only, of all the files in the current directory.

- Prints the relative file paths of all the files in the current directory.

- Prints the absolute file paths of all the files in the current directory.

- None of the above

**ANSWER** - Prints the absolute file paths of all the files in the current directory.

### 3. 'number' is a shell variable. Which of the following condition checks if `number` is divisible by 3 or not?

- [ $(number%3) -eq 0 ]

- [ $((number%3)) -eq 0 ]

- [ $(($number%3)) -eq 0 ]

- [ number%3 -eq 0 ]

**ANSWER** 
1. [ $((number%3)) -eq 0 ]
2. [ $(($number%3)) -eq 0 ]

### 4. Which of the following scripts will combine the text in all the '.txt' files in the current working directory to a single file?

- A
```bash
for file in `ls -l *.txt`; do 
    cat $file > ../allfiles.txt
done
```

- B
```bash
for file in `ls *.txt`; do 
    cat $file > ../allfiles.txt
done
```

- C
```bash
for file in `ls *.txt`; do 
    cat $file >> ../allfiles.txt
done
```

- D
```bash
for file in `ls -l *.txt`; do 
    cat $file >> ../allfiles.txt
done
```

**ANSWER**
```bash
for file in `ls *.txt`; do 
    cat $file >> ../allfiles.txt
done
```

### 5. echo ${arr[@]/*[aA]*/}
   Select the statements which are true for the above command.

- [ ] All the elements in the original `arr` having the character `a` or `A` will be replaced with ""(null).

- [ ] All the elements in the array `arr` not having the character `a` or `A` will be printed.

- [ ] It does not alter the original array elements.

- [ ] All the elements in the array `arr` having the character `a` or `A` will be printed.

**ANSWER**
1. All the elements in the array `arr` not having the character `a` or `A` will be printed.
2. It does not alter the original array elements.

### 6. Which command can be used to print 5th and 7th character of each line of a file named "file1"

- cut 5,7 file1

- cut -c 5,7 file1

- cut 5-7 file1

- cut -c 5-7 file1

**ANSWER** cut -c 5,7 file1

### 7. Which commands can find empty files under /var/log?

- [ ] find /var/log -type f -size 0

- [ ] find /var/log -empty -type f

- [ ] find /var/log -type f -size 0c

- [ ] find /var/log -type f -empty

**ANSWER** all

### 8. Which commands will recursively change all .sh files under /scripts/ to be executable only by the owner?

- chmod -R 700 /scripts/*.sh

- find /scripts -name "*.sh" -exec chmod 700 {} \;

- chmod 700 /scripts/*.sh

- find /scripts -type f -name "*.sh" -exec chmod u+x,go-x {} \;

**ANSWER**
- find /scripts -name "*.sh" -exec chmod 700 {} \;
- find /scripts -type f -name "*.sh" -exec chmod u+x,go-x {} \;

# GrpA

### 1. Write a bash script which takes one argument as the name of a file and prints Yes if the file has read permission only for the owner and no other permissions for owner or other users, else do not print anything. The file given in the argument will be present in the current working directory.

**ANSWER**
```bash
script() {
if [[ $(ls -l $1 | grep -e "^-r--------.*") ]] ; then
    echo "Yes"
fi
}
```

### 2. Write a bash script that accepts a few arguments(all numbers) and performs the following functions.

Prints the string Error if the number of arguments supplied is not equal to 2.
If the number of arguments is equal to two, print their sum.

**ANSWER**
```bash
script() { 
if [ $# != 2 ]; then
  echo Error
fi

if [ $# = 2 ]; then
  echo $(( $1 + $2 ))
fi 
}
```

### 3. Write a bash script that reads a value from the standard input stream and prints PNUM if the value is a postive number or 0; prints NNUM if it is a negative number; else print STRING.

**ANSWER**
```bash
script() {
read n
num="^-?[0-9]*\.?[0-9]*$"
neg="^-"
if [[ $n =~ $num ]]; then
  [[ $n =~ $neg ]] && echo NNUM || echo PNUM
else
  echo STRING
fi

}
```

### 4. Write a bash script that takes any number of inputs(all numbers) and prints the maximum and minimum value from all the inputs in the format Maximum: max | Minimum: min, where max is the maximum value and min is the minimum value.

**ANSWER**
```bash
script() {
max=$1
min=$1

for i in "$@"; do
	if [ $i -ge $max ]; then
		max=$i
	fi
	if [ $i -le $min ]; then
		min=$i
	fi
done;

echo "Maximum: $max | Minimum: $min"
}
```

### 5. Write a bash script that takes two integer values as input, and prints the product table of first integer with all the integers from 1 to the value in second argument as described in the format below.

Let the first argument be 3 and the second argument be 4, then your script should print.

3*1=3
3*2=6
3*3=9
3*4=12
If the first argument is 12 and second argument is 3, then your script should print

12*1=12
12*2=24
12*3=36
Note that there is no space between any numbers, * or = sign in each line. And every product is printed on a new line.

**ANSWER**
```bash
script() {
for (( i=1; i<=$2; i++ )); do
  echo $1*$i=$(($1*i))
done
}
```