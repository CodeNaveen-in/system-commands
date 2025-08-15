# Practice Assignment
1. A hypervisor is a software.
- [ ] Which is same as an operating system.
- [ ] Containing the source code of linux.
- [ ] That creates and runs virtual machines.</p>
- [ ] That allows running multiple operating systems concurrently, while sharing hardware resources.</p>

**ANSWER** - C, D

2. Match the following commands with their use: 

| Commands | Users |
| -------- | ----- | 
| 1. pwd | A. Charge Directory |
| 2. Is | B. Print the path of working directory |
| 3. uname | C. List directory contents |
| 4. cd | D. Show the details of operating system |
- 1-B, 2-D, 3-A, 4-C
- 1-D, 2-C, 3-B, 4-A
- 1-B, 2-C, 3-D, 4-A
- 1-D, 2-C, 3-A, 4-B

**ANSWER** C 

3. State whether the statement is true or false. The Bash command "groups" can be used to find the group to which the user belongs
- True
- False

**ANSWER** True 

1. Ram is new to Linux, and wants to delete a file named
> 1 "file_to_delete.txt"

, present in his home directory. Which of the following Bash commands Ram can use to delete the above file when the present working directory is his home directory?
- remove file_to_delete.txt
- rm ../file_to_delete.txt
- mv file_to_delete.txt
- rm ./file_to_delete.txt

**ANSWER** D

# PPA
1. Write a bash command to move all the .txt files present in the current directory to the directory named level1 present inside the current directory. Do not move any other files other than .txt files anywhere from the current directory. 
Write only a single line bash command to perform the above task.

**Answer** : 
```bash
script() { 
mv *.txt level1
}
```

2. Write a Bash command to print the file types of all the files stored in the current working directory. The output should be in the format as described below. The first column is file/directory name and the second column tells about the file type.

| File name | Type |
| --------- | ---- | 
| file.txt: |                             empty |
| Notes: |                                 directory |
| SysComm: |                               symbolic link to ../SysComm Dropbox|
| System Commands Sample Questions.md: |  UTF-8 Unicode text, with very long lines |
| System Commands Sample Questions.pdf: | PDF document, version 1.7 |

**Answer**
```bash
script() {
for f in *; do printf "%-12s %s\n" "$f:" "$(file -b "$f")"; done
}
```


# Graded Assignment
###  1. The option used along with 'ls' command to display the hidden files including the current and parent directory is ......... (Do not add hyphen(s)).

**ANSWER** - a

### 2. Which directory contains the information related to host specific system configuration files?
- /bin
- /opt
- /media
- /etc

**ANSWER** - /etc => */etc contains the configuration files specific to the system*

### 3. What does the first column of the output of the command "ls -l" represent?
- Name of the user
- Name of the group
- Type of files and permissions
- Number of hard links

**ANSWER** - Types of files and permissions => *The first column provided a ten character string denotes the type of file and permissions associated with the file*

### 4. Given below is the output of the command
> 1. ls -l

. What can you know about the file/directory
> 1. abc.ab

from the output?

```bash
total 4
drwxr-xr-x 1 runner runner 0 Dec 20 09:37 abc.ab
-rw-r--r-- 1 runner runner 16 Sep 23 04:37 main.sh
```

- [ ] abc.ab is a file and all users can execute the file abc.ab

- [ ] abc.ab is a directory and all users can cd into the directory abc.ab, i.e. make it their working directory

- [ ] abc.ab is a directory and all users can edit the contents of the directory abc.ab

- [ ] abc.ab is a directory and all users can list the contents of the directory abc.ab

- [ ] abc.ab is a file and only the owner can read the file abc.ab

- [ ] abc.ab is a file and all users can read the file abc.ab

- [ ] abc.ab is a directory and only the owner can read the directory abc.ab

**ANSWER** -
- abc.ab is a directory and all users can cd into the directory abc.ab, i.e. make it their working directory
- abc.ab is a directory and all users can list the contents of the directory abc.ab

*only the owner can edit the contents of the file abc.ab since write permission (w) is available only for the owner "drwxr-xr-x"*

*Feedback:
For the file the permission string is drwxr-wr-x.
d : d denotes it is a directory
rwx : owner have read, write and execute permissions.
r-x : group have read and execute permissions.
r-x : others have read and execute permissions.*

### 5. What is the command to change the permission of the file myfile.sh such that the owner has full access, the group has read and execute access and other users have only read access?

- chmod 457 myfile.sh

- chmod 754 myfile.sh

- chmod 751 myfile.sh

- chmod 157 myfile.sh

**ANSWER** - chmod 754 myfile.sh

*Binary to octet: Ex.
rwx 
111 = 7
r-x
101 = 5
r-- 
100 = 4*

*owner rwx 7
group r-x 5
others r-- 4*

### 6. What is the expected output of the command date "myfile.txt" ?
- Displays the date at which file was last edited.
- Modifies the time stamp of the file.
- date: invalid date ‘myfile.txt’
- None of the above

**ANSWER** - date: invalid date ‘myfile.txt’

*date command takes the format string after + character to print the print the date in the specified format.*

*"myfile.txt" is not a valid format string thus it will throw an error 
date: invalid date ‘myfile.txt’*

### 7. The file "longFile.txt" has 5000 lines. From the commands given below which command can be used to read the file in a page by page manner?
- [ ] ls
- [ ] less
- [ ] cat
- [ ] echo

**ANSWER** - less

*less provids easy navigation within the contents of the file.*

### 8. Match the following:

| Commands | Uses |
| -------- | ---- |
| 1. mv | A. Delete a file |
| 2. rm | B. Display the content of file |
| 3. file | C. See memory statistics |
| 4. free | D. Rename a file |

- 1-B, 2-D, 3-A, 4-C
- 1-D, 2-A, 3-C, 4-B
- 1-C, 2-B, 3-D, 4-A
- 1-D, 2-A, 3-B, 4-C

**ANSWERS** - 1-D, 2-A, 3-B, 4-C

*mv is used move/rename files
rm is used delete files
file gives information about the type of file
free gives information about memory*

###  9. A workstation is being shared by two users who are on different groups.

When the User1 runs ls -l on their terminal, the output is

```bash
--w-r--r-- 1 user_1 group_a 4148 Jan 8 10:50 FileA.txt
-r--r--r-- 1 user_1 group_a 4148 Jan 8 10:50 FileB.txt
--w-r--r-- 1 user_1 group_a 4148 Jan 8 10:50 FileC.txt
-rw-r--r-- 1 user_1 group_a 4148 Jan 8 10:50 FileD.txt
-rw-r--r-- 1 user_1 group_a 4148 Jan 8 10:50 FileE.txt
-rw-r--r-- 1 user_1 group_a 4148 Jan 8 10:50 FileF.txt
d--------- 1 user_1 group_a 4148 Jan 8 10:50 More_files
```

Which of the following commands will not fail when run by User1?

- cat FileA.txt
- cat FileD.txt
- echo "Hello World" >> FileB.txt
- ls More_Files

**ANSWER** - cat FileD.txt

*cat at requires read permission of FileD.txt that is available for user_1 *

### 10. What would be the output of the last command after executing the following commands in the sequence as given below?
```bash
1. $ pwd
2. /home/ubuntu
3. $ cd dir1
4. $ cd .
5. $ cd dir2
6. $ cd ..
7. $ pwd
8
```
​
- /home/ubuntu/dir2/dir1
- /home/ubuntu/dir2
- /home/ubuntu/dir1/dir2
- /home/ubuntu/dir1

**ANSWER** - /home/ubuntu/dir1

```bash
$ pwd # shows the current working directory
/home/ubuntu
$ cd dir1 # go to dir1 thus pwd is /home/ubuntu/dir
$ cd . # go to current thus no change in pwd, hence pwd is /home/ubuntu/dir
$ cd dir2 # go to dir2 thus pwd is /home/ubuntu/dir1/dir2
$ cd .. # go back to parent directory, pwd is /home/ubuntu/dir1
$ pwd # shows the current directory /home/ubuntu/dir1
```

### 11. What will be the output of the following command?

```bash
echo $(echo "\$((2+2))")
```
- 4
- $((2+2))
- ((2+2))
- $4

**ANSWER** - $((2+2))

*Because using \ makes interpreter skip over the functionality and treat it as a string*

### 12. Which of the following commands will correctly extract the filename from a path stored in a variable file="/home/user/data.txt"?

- basename $file
- echo ${file##*/}
- cut -d'/' -f4 <<< $file
- echo $file | last 7

**ANSWER** - basename $file
, echo ${file##*/}
, cut -d'/' -f4 <<< $file

### 13. Given a regular file report.txt, which of the following can increase the link count (as seen in ls -l)?

- ln report.txt copy.txt
- cp report.txt copy.txt
- ln -s report.txt link.txt
- ln report.txt report2.txt

**ANSWER** - ln report.txt copy.txt , ln report.txt report2.txt

# GrpA

### 1. We created some directories and change our current working directory using the cd command as given by the sequence of commands below. Write a bash command to make the directory "level2" as your current working directory. i.e. after executing your solution, if we execute the command "pwd" it should return the path of the directory "level2".
Write your solution as a single line bash command.
```bash	
cd /
mkdir level1
cd level1
mkdir level2
cd level2
mkdir level3
cd ..
cd ..
```

**ANSWER**
```bash
script() {
cd /level1/level2
pwd
}
```

### 2. We have a file named "systemcommands.txt" in the present working directory. Write a Bash command to change its permissions to
```bash
user: read, write, execute
group: execute
others: write
```

**ANSWER** 
```bash
script() {
chmod u=rwx,g=x,o=w systemcommands.txt
}
```

### 3. We want to change the file permissions of "someFile.txt" file as follows.
```bash
user: execute
group: execute, read
others: write
```
We will use the command chmod XXX someFile.txt where XXX represents a 3 digit number used to set the above permissions. Write a bash command to create a file named XXX.digits in the current working directory such XXX is the same three digit number used to set the permissions as mentioned above. The file your command creates can be empty.

For e.g. If your think the command chmod 111 someFile.txt will change the permission of file someFile.txt as mentioned above, then your solution should create a file named 111.digits in the current working directory.

**ANSWER**
```bash
script() { 
touch 152.digits
}
```

### 4. Create two folders named dir1 and dir2 in the current working directory.
Try to write a single line bash command to perform the above task.

**ANSWER**
```bash
script() {
mkdir dir1 dir2
}
```

### 5. Write two commands one on each line for the following two tasks.

Move only the file file_1 present in dir_1 to the empty directory dir_2.

Delete the directory dir_1.
dir_1 and dir_2 are directories in the current working directory. The operation should not change your current working directory.

**ANSWER**
```bash
script() {
mv ./dir_1/file_1 ./dir_2/
rm -r dir_1
}
```