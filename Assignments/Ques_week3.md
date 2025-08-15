# Practice Assignment

### 1. What is the expected behaviour of the folowing command?
```bash
     $ ls || date && file *
```

- Prints output of `ls`, `date`
- Prints output of `ls`, `file`
- Prints output of `date`, `file`
- Prints output of `ls`

**ANSWER** - Prints output of `ls`, `file`

*|| and && have same precedence. The command produces the output of ls and transfers the control to file *  because the ls command will exit with status 0. Thus, date command will not get executed.*

### 2. The purpose of the redirection '&>file' is to.

- Redirect stdout to `file`
- Redirect stderr to `file`
- Redirect both stdout and stderr to `file`
- This is not the correct usage of '&' operator.

**ANSWER** - Redirect both stdout and stderr to `file`

*&> is used to redirect stdout and stderr into a file.*

### 3. Each option consists of a pair of operators/command. Choose the option in which the pair does not perform redirection.

- `||`, `&&`
- `|`, `tee`
- `>`, `>>`
- `&>`, `2>`

**ANSWER** - `||`, `&&`

*|| and && are used for control flow.*

# PPA

### 1. List(in long format, use ls -l) all the .txt files in the current working directory and redirect the output to a file named textFiles.txt and also print 'found' to the terminal(without quotes, do not print anything else).

If no .txt file exists redirect the error of your command to the file noFiles.txt and do not print anything.

Hint: Make use of redirection to file and operators to write solution in one line.

**ANSWER**
```bash
script() {
    (ls -l *.txt &1> textFiles.txt && echo found) &2> NoFiles.txt 
}
```

### 2. Execute the commands given below in the sequence and collect the output/error into a file errorlog as described below.

Execute the command test and redirect the standard error to the file errorlog.
Execute the command test -e and append the standard error output to the file errorlog.
Execute the command test -n. and append the standard error to the file errorlog.

**ANSWER**
```bash
script() {
test &2> errorlog
test -e &1>> errorlog &2>>errorlog
test -n &2>> errorlog
}
```

# Graded Assignment

### 1. What is the output of the command $ echo "3+4*(5/4)" | bc  ?

**ANSWER** 7

### 2. Which of the following commands in the options will have the same output as the command $ ls; date || cal; ps && file * ? 


- $ `ls`; `date`; `ps` ; `file *`
- $ `ls`; `cal`;`ps` ; `file *`
- $ `ls`; `date`; `cal`; `ps`
- $ `ls`; `date`; `cal`; `ps` ; `file *`

**ANSWER** - $ `ls`; `date`; `ps` ; `file *`

*ls will executed at first and separately since ; is present at the end of the command.*
*cal will not be executed where date will exit with the status 0.*
*ps and file * will be executed sequentially.*

### 3. Which of the following commands will print the lines from 5 to 11 from top of a file `longfile.txt`?

- $ cat longfile.txt | head -4 | tail -11
- $ cat longfile.txt | head -11 | tail -7
- $ cat longfile.txt | tail -7 | head -11
- $ cat longfile.txt | tail -11 | head -4

**ANSWER** - $ cat longfile.txt | head -11 | tail -7

### 4. Which of the following options are correct with respect to the below command?
```bash 
$ ls ~ >file_1.txt  >>file_2.txt  2>file_3.txt
```

- file_1.txt is overwritten and file_2.txt is appended
- file_1.txt and file_2.txt are appended
- file_1.txt is the stdout and file_2.txt is the stderr
- file_1.txt is stdout and file_3.txt is stderr

**ANSWER** 
1. file_1.txt is overwritten and file_2.txt is appended
2. file_1.txt is stdout and file_3.txt is stderr

*Simply > will redirect stdout and overwrite the file.*
Simply >> will redirect stdout and append into the file.*
*2> and 2>> are used to redirect the stderr by overwriting and appending the file respectively.*

### 5. On running the following command in the bash shell $ echo "Random Text" | tee file1 | tee file2 ,"Random Text" will be redirected to?

- The file file1 only.
- The file file1, and the terminal.
- The file `file1`, file `file2` and the terminal.
- The file `file1` and the terminal.

**ANSWER** The file `file1`, file `file2` and the terminal.

### 6. Jack wants to store the output of the 'ls' command in the file named 'out' as well as display it on the screen. Which of the following commands will achieve the goal?

- $ ls | echo >out
- $ ls >out | echo
- $ ls | tee out
- $ ls >out

**ANSWER** $ ls | tee out
*The command tee reads input from stdin and writes to stdout and files.*

### 7. Which of the following commands will list all the `.txt` files in the current directory as well as delete them?

- $ ls *.txt || rm *.txt
- $ rm *.txt || ls *.txt
- $ ls *.txt; rm *.txt
- $ ls *.txt && rm *.txt

**ANSWER** $ ls *.txt; rm *.txt, $ ls *.txt && rm *.txt

### 8. Which of the following command will print the number of files/directories present in the current directory?

- $ ls -l | wc -l
- $ ls | tee | wc -l
- $ wc -l $(ls)
- $ wc -l `ls`

**ANSWER** $ ls | tee | wc -l

### 9. How many directories will be created by the command 
```bash
1. mkdir dir-{0..9} && mkdir dir-100 || mkdir dir-101
```
?
Enter a number.

**ANSWER** 11

### 10. What does the following command do?

tr 'foo' 'bar' < file.txt > temp && mv temp file.txt

- Replaces all occurrences of the string "foo" with "bar" in file.txt
- Replaces each occurrence of the character f with b, and each o with a or r in file.txt
- Reads the contents of file.txt, modifies it, and overwrites file.txt with the result
- Uses tr to translate entire words from "foo" to "bar"

**ANSWER**
1. Replaces each occurrence of the character f with b, and each o with a or r in file.txt
2. Reads the contents of file.txt, modifies it, and overwrites file.txt with the result

### 11. Which of the following commands provide a visual representation or tree
structure showing the parent-child relationship between processes in Linux?

- pstree
- ps -ejH
- ps –forest
- ps auxf

**ANSWER** pstree, ps -ejH, ps –forest, ps auxf

# GRPA

### 1. Print the number of lines present in ‘file1’ and ‘file2’ combined, your solution should not print anything else. ‘file1’ and ‘file2’ are located in the current working directory.

Hint: Multiple files can be given as argument to ‘cat’ command.

**ANSWER**
```bash
script() { 
cat file1 file2 | wc -l
}
```

### 2. There are three files master.txt, half1.txt and half2.txt in the current working directory. Add first 2 lines of half1.txt to the file master.txt at the end(starting at a new line) then append the last 3 lines of the file half2.txt to the file master.txt at the end(starting at a new line). Append the lines in the sequence mentioned.

**ANSWER** 
```bash
script() { 
head half1.txt -n2 >> master.txt
tail half2.txt -n3 >> master.txt
}
```

### 3. Print to the output containing the name of the shell being used, its PID and the flags in the following format "Shell:<shell>|PID:<pid>|Flags:<flags>". There are no spaces in the string.

**ANSWER**
```bash
script() { 
echo "Shell:/bin/bash|PID:1|Flags:hB"
}
```

### 4. An observer wrote a script named createTwingle that produces a file twingle containing names of all the visible stars present in the sky at that instant. Every line in the file twingle is the name of a star. In your current directory the file twingle may or may not be present.
If the file twingle is present in the directory then print the number of lines in the file, else execute the command createTwingle it will create the file twingle in the current working directory then print the number of lines in the file twingle.

Hint: Try to use operators discussed in the lectures to give a single line solution for the task.


Note: stderr will not be displayed

**ANSWER**
```bash
script() { 
wc -l twingle || (createTwingle && wc -l twingle)
}
```

### 5. Print the number of directories in the current working directory. Do not print anything else.

Hint: One solution is to make use of 'ls', 'wc' and pipes('|').

**ANSWER**
```bash
script() { 
ls -d */ | wc -l
}
```

### 6. The script test will print some text to the standard output, it can be run similar to any other command and does not accept any arguments.

Your task is to print the output after running test on the screen and also append the output at the end(starting at new line) of the file log.  File log is located in the current working directory.

Hint: To solve it in one line check the man page of tee command for appending to the file. 

**ANSWER**
```bash
script() { 
test | tee templog
cat templog >> log
}
```

### 7. Add the string “EOF alpha” at the end of the file(starting at a new line) alpha.txt then append the contents of the file numbers.txt at the end of the file(starting at a new line) alpha.txt. alpha.txt and numbers.txt are located in the current working directory.

**ANSWER**
```bash
script() {
echo "EOF alpha" >> alpha.txt; cat numbers.txt >> alpha.txt
}
```