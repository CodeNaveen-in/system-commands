# Practice Assignment


### 1. Which of the following commands will replace the word "teach"(but not change anything else in the word "teaching") with the word "reach"?

**ANSWER** 
```bash
echo "teaching you how to teach" | sed -e "s/\bteach\b/reach/"
echo "teaching you how to teach" | sed -e "s/teach\b/reach/"
```

### 2. Match the following sed command option with their use

| option | use |
| ------ | --- | 
| 1. -n | (a) Use of extended regular expression in the scripts |
| 2. -r | (b) To run/execute sed script stored in a file |
| 3. -f | (c) Add the script to the commands to be executed |
| 4. -e | (d) Run in the quiet mode |

- 1-a, 2-c, 3-d, 4-b
- 1-d, 2-c, 3-b, 4-a
- 1-a, 2-d, 3-c, 4-b
- 1-d, 2-a, 3-b, 4-c

**ANSWER** 1-d, 2-a, 3-b, 4-c

```bash
$ sed --help | grep "\-[nrfe]\b"
  -n, --quiet, --silent
  -e script, --expression=script
  -f script-file, --file=script-file
  -E, -r, --regexp-extended
```

### 3. The file 'dates.txt' has a list of dates in MM/DD/YYYY format. Which of the following commands can be used to convert it to YYYY-MM-DD format?

**ANSWER** 
```bash 
sed 's/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\/\([0-9]\{4\}\)/\3-\1-\2/' date.txt
```

*\( and \) are used to group the pattern and later referred by \1, \2 for the first group and second and so on.*
*To represent literal / , it should be escaped with \ .*
*Ex: \/ represents literal /*

### 4. Which of the following are the buffers maintained in sed ?

- [ ] Input space

- [ ] Output space

- [ ] Pattern space

- [ ] Auxiliary hold space

**ANSWER** Pattern space and Auxillary Hold space

### 5. The varible var contains a string. Which of the following commands is/are equivalent to the command echo ${var^^} ?

**ANSWER**
```bash
echo $var | sed 's/\(.*\)/\U&/g'
echo $var | sed 's/\(.*\)/\U\1g'
```

*echo ${var^^} returns the value stored in variable var in uppercase*

### 6. Below are the contents of the file "abcdef", where each line has 36 characters.
```bash
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
cccccccccccccccccccccccccccccccccccc
dddddddddddddddddddddddddddddddddddd
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
ffffffffffffffffffffffffffffffffffff
```
What will be the size of the file in bytes when it is compressed using bzip2? 

**ANSWER** somewhere 50-60 works

# PPA

### 1.    Given a file words.txt containing a string in each line in the format FIRST_second. Every string is a combination of two words joined with an underscore(_), the first word FIRST consists of all uppercase letters and the second word second consists of all lowercase letters. Write a bash command/script using sed to convert all the string to SECOND_first.
After conversion
- The first and the second words should be swapped.
- The uppercase word should be converted to lowercase word and vice versa.

The file `words.txt` is located in the current working directory.

**ANSWER**
```bash
script() {
    sed -E 's/^([A-Z]+)_([a-z]+)$/\U\2_\L\1/' words.txt
}
```

### 2. Without using the wc or awk commands(instead use sed as Bash command), write a bash script that accepts any number of arguments. Out of these some would be options(hyphen plus a character like -l or -c) and the last argument will be a file path(use ${@: -1} to access the last argument, there is a space before -1). Only four options are accepted by your script -l, -w, -n and -s.
Sample

Suppose your bash script is named as myCount.sh. In the below sample the argument to -s option is "say" so this should count all the lines containing the string "say". For the public test case all the commands given in the below sample are executed one by one on the input file.

```bash
$ cat somefile.txt 
This is a sample file
this is not end justsay start
that contains say
some number
say like 10
or 
20
or 
233
444
or say 3444
and now it ends.

$ bash myCount.sh -l somefile.txt      
12
$ bash myCount.sh -w somefile.txt
32
$ bash myCount.sh -n somefile.txt
3
$ bash myCount.sh -s say somefile.txt 
4
$ bash myCount.sh -l -n somefile.txt
12
3
$ bash myCount.sh -l -s say -l -n somefile.txt
12
4
12
3
$ bash myCount.sh
$ bash myCount.sh somefile.txt
```

**ANSWER**
```bash
script() { echo '
#!/bin/bash

file="${@: -1}"  # Last argument is the file path

# Exit if no options are provided
if [ "$#" -eq 1 ]; then
  exit 0
fi

i=1
while [ $i -lt $# ]; do
  arg="${!i}"
  case "$arg" in
    -l)
      sed -n "$=" "$file"
      ;;
    -w)
      sed "s/[^[:space:]]\\+/x/g" "$file" | sed -n "s/x//gp" | sed -e :a -e "N;s/\\n//;ta" | sed -n "$="
      ;;
    -n)
      sed -n "/^[0-9]\\+\$/p" "$file" | sed -n "$="
      ;;
    -s)
      i=$((i + 1))
      str="${!i}"
      sed -n "/$str/p" "$file" | sed -n "$="
      ;;
  esac
  i=$((i + 1))
done

'
}
```

# Graded Assignment

### 1. Match the following sed action characters to their use.

| Action | Use |
| ------- | -- |
| 1. d | A. delete the pattern space.|
| 2. c | B. Insert above current line.|
| 3. a | C. Insert below current line. |
| 4. i | D. Replace current line.|

- 1-A, 2-D, 3-C, 4-B
- 1-A, 2-D, 3-B, 4-C
- 1-D, 2-A, 3-B, 4-C
- 1-D, 2-A, 3-C, 4-B

**ANSWER** 1-A, 2-D, 3-C, 4-B

### 2. Which of the following sed commands will give the same output as the command  `cat file1 | head -5 |tail -2` ? Consider that  `file1` contains exactly 10 lines of text.

**ANSWER**

```bash
sed -n -e '4p' -e '5p' file1
sed -n '4,5p' file1
sed '1,3d; 6,$d' file1
```

*<code>cat file1 | head -5 |tail -2</code>*
*The above command will pick last two lines from first two lines of the file, i.e. lines numbered 4 and 5.*

*To achieve the same with sed command firstly we will have to use the option `-n` to print only the processed lines if using `p` command, and ensure that all the lines of the file are not printed.*

*And in the command '<code>sed -n -e '4p' -e '5p' file1</code>', -e is to run multiple scripts/actions using sed, here in this cases two. So this will print lines 4th and 5th as desired.*

### 3. Which of the following sed commands will always give the same output as the command `cat file1 | head -5 | tail -2` irrespective of the number of lines in the file `file1`.

**ANSWER** None of the above

*When the number of lines in the file is less than 5 then all the sed solution will vary those which gave correct result when the number of lines is greater than or equal to 5*

### 4. Which of the following sed commands can be used to delete the lines containing the word `ram` (case insensitive) in a file `input.txt`? The command should just print the desired output, and not replace the contents of the original file.

**ANSWER** sed '/ram/Id' input.txt
*i in /ram/id represents insertion at the line where the pattern matches. I is used to specify case-insensitive search d is used to delete the line*

### 5. Which of the following sed commands can be used to delete all the occurrences of the word `ram` (case insensitive) in a file `input.txt`? The command should just print the desired output, and not replace the contents of the original file.

**ANSWER**
```bash
sed 's/ram//ig' input.txt
sed 's/ram//Ig' input.txt
```

### 6. Consider a file `twister.txt` with the contents as below.

- 1-B, 2-A, 3-C, 4-C
- 1-C, 2-A, 3-B, 4-D
- 1-B, 2-D, 3-C, 4-A
- 1-D, 2-C, 3-A, 4-B

**ANSWER** - 1-C, 2-A, 3-B, 4-D

*1,2 s/wood/WOOD/ will replace the first occurrence of "wood" to "WOOD" in the first and the second line only.*
*s/wood/WOOD/g will replace all occurrences of "wood" to "WOOD" in all the lines.*
*2,3 s/wood/WOOD/2 will replace the second occurrence of "wood" to "WOOD" in the second and the third line only.*
*s/wood/WOOD/3g will replace the third and further occurrences of "wood" to "WOOD" in all the lines.*

### 7. The below command will print the contents of the file ` twister.txt` after:
```bash
sed '$s/\(.*\)wood/\1WOOD/g' twister.txt
```

- Replacing all occurrences of "wood" with "WOOD" in every line of the file.

- Replacing all occurances of "wood" with "WOOD" only in the last line of the file.

- Replacing last occurance of "wood" with "WOOD" in every line of the file.

- Replacing last occurance of "wood" with "WOOD" only in the last line of the file.

- Replacing first occurance of "wood" with "WOOD" in every line of the file.

- Replacing first occurance of "wood" with "WOOD" only in the last line of the file.

**ANSWER** Replacing last occurance of "wood" with "WOOD" only in the last line of the file.

*$ defines the last line*
*.* in the pattern with the longest match*

### 8. What is the expected output of the following command

```bash
echo "hello world" | sed 's/\b\(.\)/\U\1/g'
```

- `HELLO WORLD`

- `u 1`

- `helloworld`

- `Hello World`

**ANSWER** - Hello World

*\b is the word separator*
*\( and \) is used to group a pattern*
*\(.\) is the first group (counted from left) can be referred by \1*
*\U will make the following to uppercase*

### 9. What will the following command do?

```bash
sed '/[bB]reak$/a #####' file1
```
- Inserts five hashes on a new line before every line that ends with the word "break", the matching will be case insensitive.
- Inserts five hashes on a new line after every line that ends with the word "break", the matching will be case insensitive.
- Inserts five hashes on a new line before every line that ends with the word "break" or "Break".
- Inserts five hashes on a new line after every line that ends with the word "break" or "Break".

**ANSWER** - Inserts five hashes on a new line after every line that ends with the word "break" or "Break".

*/[bB]reak$/ is the addressing that means any lines ends ($ in the regex defines end) with the word "break" or "Break".* 
*a defines it is a append. A line is added next to the current line. Anything after ais the line to be appended*

*[bB] in regex means either of "b" or "B"*

### 10. Which of the following methods can be used to automate execution of a Bash script on a regular schedule?

- cron
- at
- watch
- Adding a loop with sleep inside the script itself

**ANSWER** all

### 11. What will be the output of the following command?

```bash
	 echo "abc123" | sed's/\([a-z]\)/\1\1/g'
```

- aabbcc123
- abcabc123
- aaabbbccc123
- abc123abc123

**ANSWER** aabbcc123

# Graded 8.1

### 1. Which of the following commands can be used to check the processor information your linux machine is running on?

- hwinfo
- lshw
- lspci
- cat /proc/cpuinfo
- cat /proc/partitions

**ANSWER** 
```bash
hwinfo
lshw
cat /proc/cpuinfo
```

### 2. Which command will change the prompt string to show date, command number and current username followed by character "@" followed by complete hostname and finally followed by the string ":$", in the same sequence?

For example if the current username is "SC", complete hostname is "SC-HP-Probook", date today is "Tue Mar 08" and command number is "48" the prompt string should look like

Tue Mar 08 48 SC@SC-HP-Probook :$
- PS1="\d # \u \H :$"
- PS1="\d \# \u \H :$"
- PS1="\d \# \u@\H :$"
- PS1="\d \# \u@\H :\$"

**ANSWER** PS1="\d \# \u@\H :\$"

*Notation Meaning*
*\d date*
*\# command number*
*\u username*
*\H hostname*
*\$ literal $*

### 3. How many times per day the below process is executed?

```bash
0 20 * * * zip -r ~/backup/project_246_$(date -u +"%Y-%m-%dT%H:%M:%SZ").zip ~/project_246/
```

**ANSWER** 1

### 4. Select all the days the below process is executed?

```bash
0 20 * * 1-5 zip -r ~/backup/project_246_$(date -u "+%Y-%m-%dT%H:%M:%SZ").zip ~/project_246/
```
- Sunday
- Monday
- Tuesday
- Wednesday
- Thursday
- Friday
- Saturday

**ANSWER** All weekdays

*cron notation "0 20 * * 1-5" stands for every day, every month and every day of week at 8:00 pm*

*1-5 in the day of week stands for Monday to Friday.*

### 5. Suppose you have to send a good morning message to everyone at 6 am in the morning everyday. Assume the command send-good-morning will send the message to everyone. Select the job will do that.

- * */6 * * * send-good-morning
- 0 * * * * send-good-morning
- 6 0 * * * send-good-morning
- * * * 6 0 send-good-morning
- 0 6 * * * send-good-morning

**ANSWER** 0 6 * * * send-good-morning

*cron notation : minute hour date month day_of_week*
**means on every value*
**/x means every x minutes*

### 6. "test.tar" contains three files test1, test2 and test3. Choose the right command that will extract these files from "test.tar".
- $ tar -cvf test.tar test1 test2 test3
- $ tar -xvf test1 test2 test3
- $ tar -xvf test.tar
- $ tar -cvf test.tar

**ANSWER** $ tar -xvf test.tar

```bash
$ tar --help | grep "\-[cxvf]\b"
  -c, --create               create a new archive
  -x, --extract, --get       extract files from an archive
  -f, --file=ARCHIVE         use archive file or device ARCHIVE
  -v, --verbose              verbosely list files processed
```

### 7. Match the following options of "tar" command to their use.

| Option | Usage |
| ------ | ----- |
| 1.x | i. use gzip |
| 2.v | ii. name of the archive file |
| 3.f | iii. extarct files from an archive |
| 4.z | iv. verbosly list files that are processed |

- 1-a, 2-c, 3-d, 4-b
- 1-c, 2-d, 3-a, 4-b
- 1-d, 2-c, 3-a, 4-b
- 1-c, 2-d, 3-b, 4-a

**ANSWER** 1-c, 2-d, 3-b, 4-a
```bash
$ tar --help | grep "\-[zxvf]\b"
  -x, --extract, --get       extract files from an archive
  -f, --file=ARCHIVE         use archive file or device ARCHIVE
  -z, --gzip, --gunzip, --ungzip   filter the archive through gzip
  -v, --verbose              verbosely list files processed
  ```

### 8. Contents of file1
```bash
1. aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
2. bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
3. cccccccccccccccccccccccccccccccccccc
4. dddddddddddddddddddddddddddddddddddd
5. eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
6. ffffffffffffffffffffffffffffffffffff
```

Contents of file2
```bash
1. Wj^rofdOhZO[giJYBHMDYVoqCGfREi[MTmF`
2. FHWf]eaUIqJXCkLnYTmfOCVnc\ZMDdlrcp[D
3. `EelM]krNNB^MIJmDniBW]JlWV`k^YmGBbAV
4. PICXGELJh[Xmmid_fen`E\Xf]Y]kCoRkXEKD
5. bDfRfJmolQbTVJDVbWSfoTqODfYkaNjHKf]_
6. [SmrlE\\l]ZTYQeHjKJkFETO]LDhHVValIqD
```

Note that both file1 and file2 have same size and number of characters. Both the files are compressed using the utility gzip to file1.gz and file2.gz respectively.

Choose the correct statement.

- The size of file1.gz will be greater than file2.gz

- The size of file1.gz will be lesser than file2.gz

- The size of file1.gz will be the same as the size of file2.gz

- The size of file1.gz will always greater than file2.gz because file1 have simple patterns.

**ANSWER** The size of file1.gz will be lesser than file2.gz

### 9. Choose the command to list all the empty files and delete them.
- [ ] find . -type f -delete
- [ ] find . -type f -empty -delete
- [ ] find . -type f -empty -exec rm {} \;
- [ ] find . -type f -empty | xargs rm

**ANSWER**
```bash
find . -type f -empty -delete
find . -type f -empty -exec rm {} \;
find . -type f -empty | xargs rm
```

# GrpA

### 1. Write a sed command to print the count of lines that starts with a digit in the file input.txt. Assume that there is at least one line in the file input.txt that starts with a digit. Do not use the commands wc or awk , or even these keywords in comments or anywhere in your answer.

**ANSWER** 
```bash
script() { 
sed -ne "/^[[:digit:]]/p" input.txt | sed -n "\$="
}
```

### 2. Given a file input.txt containing a word on each line, print all the words(one in each line) that occur between the words "FROM" and "TO"(but excluding these words). The match should be case sensitive for the given words and the words in the file are not unique, they can repeat.

**ANSWER**
```bash
script() { 
# Solution 1
sed -n '/FROM/,/TO/p' input.txt | sed '/FROM/d' | sed '/TO/d'
# Solution 2
# sed -n '/FROM/,/TO/{//!p;}' input.txt
# Solution 3
# sed -n '/FROM/,/TO/{/FROM/d;/TO/d;p;}'
}
```