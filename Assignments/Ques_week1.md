# Practice Questions

## Practice Assignment
1. A hypervisor is a software.
- [ ] Which is same as an operating system.
- [ ] Containing the source code of linux.
- [x] <p style="color:green"> That creates and runs virtual machines.</p>
- [x] <p style="color:green"> That allows running multiple operating systems concurrently, while sharing hardware resources.</p>

2. Match the following commands with their use: 

| Commands | Users |
| -------- | ----- | 
| 1. pwd | A. Charge Directory |
| 2. Is | B. Print the path of working directory |
| 3. uname | C. List directory contents |
| 4. cd | D. Show the details of operating system |
- 1-B, 2-D, 3-A, 4-C
- 1-D, 2-C, 3-B, 4-A
- <p style="color:green">1-B, 2-C, 3-D, 4-A </p>
- 1-D, 2-C, 3-A, 4-B

3. State whether the statement is true or false. The Bash command "groups" can be used to find the group to which the user belongs
- <p style="color:green">True </p>
- False 

4. Ram is new to Linux, and wants to delete a file named
> 1 "file_to_delete.txt"

, present in his home directory. Which of the following Bash commands Ram can use to delete the above file when the present working directory is his home directory?
- remove file_to_delete.txt
- rm ../file_to_delete.txt
- mv file_to_delete.txt
- <p style="color:green">rm ./file_to_delete.txt </p>

## PPA
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
