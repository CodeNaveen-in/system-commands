# Practice Assignment

### 1. Conside the current working directory to be /home/User1,
```bash
1. echo pwd;pwd
```
The output of the above command is:

- - /home/User1;/home/User1

- pwd;pwd

- pwd
  /home/User1

- /home/User1
  /home/User1

**ANSWER**
pwd
/home/User1

*pwd given after echo will be treated as argument.*

### 2. > 1 head -n15 testfile
The above command returns
- the last 15 lines of testfile
- the last 15 bytes of testfile
- the first 15 bytes of testfile
- the first 15 lines of testfile

**ANSWER** the first 15 lines of testfile

*head will print the first ten lines of the file given as argument.*
*The option -n x is used to display the first x lines*

### 3. Choose the correct options.
- [ ] The fg command moves a background job in the current shell environment to the foreground.
- [ ] The coproc command allows the creation of a co-process (start asynchronous processes in a subshell)
- [ ] The fg command is a shell builtin
- [ ] The jobs command displays the status of active jobs started in the current terminal window.

**ANSWER** all

### 4. Considering the standard error codes in Ubuntu, the error code for a process running in the foreground which was killed using Control+C is (Enter only the number)

**ANSWER** 130

### 5. With respect to the kill command, choose the options that are false
- You can kill all your processes using this command.
- Only super-user can send the kill signals to other users' processes.
- The kill option with signal number 9 "kill -9" can be caught
- The "kill" utility has exit status of 0 on success

**ANSWER** - The kill option with signal number 9 "kill -9" can be caught

*with reference to `man 7 signal`: The signals SIGKILL and SIGSTOP cannot be caught, blocked, or ignored.*

### 6. Which of the following ways is the correct method to declare a shell variable that is intended to be referenced in a shell script?
-[ ]  > 1. declare myvar=”abc”
-[ ]  > 1. declare -x myvar=”abc”
-[ ]  > 1. export myvar=”abc”
-[ ]  > 1. myvar=”abc”

**ANSWER** 
1. declare -x myvar=”abc”
2. export myvar=”abc”

# PPA
### 1. Create a file documents.txt containing all the possible file names in the format file_XYZ.txt where X is a lower case alphabet, Y is also a lower case alphabet and Z is a number between 0 and 4. Few examples of file names in this format are 'file_dh3.txt', 'file_sd1.txt', 'file_ja0.txt', 'file_at2.txt'. The file names in documents.txt should be separated by a single space.

Hint: Use echo to solve this with a single command.

**ANSWER** 
```bash
script() {
echo file_{a..z}{a..z}{0..4}.txt > documents.txt
}
```

### 2. Given a shell variable month supposed to contain a string value corresponding to some calendar month. Use the cal command to create a file named as X.txt where X is the string value in the variable month. Your command should also create a file named error.txt that should contain the error message if the string month does not correspond to any calendar month. Create all the files in the current working directory.

For example:

If the variable month contains the string "nov", your solution should create a file named nov.txt containing the calendar of november month and error.txt should be empty.
And if the variable month contains the string "garbage", your solution should create a file named error.txt containing the error from cal command and garbage.txt should be empty.

**ANSWER**
```bash
script() {
    read month
    cal "$month" > "$month.txt" 2> error.txt
    echo --$month.txt--
    cat "$month.txt"
    echo
    echo --error.txt--
    cat error.txt
}
```

### 3. Write a Bash command to print the number of failed login attempts which are recorded in the file myauth.log located in the current working directory.

Contents of myauth.log is given below

Jan 20 20:11:34 IITMBSC systemd-logind[897]: Session 27 logged out. Waiting for processes to exit.
Jan 20 20:11:34 IITMBSC systemd-logind[897]: Removed session 27.

**ANSWER**
```bash
script() {
grep 'FAILED LOGIN' myauth.log | wc -l
}
```

### 4. Write a command to extract the system's processor architecture from the output of uname -a. The output should be something like 'arm64', 'x86_64' etc.

**ANSWER**
```bash
uname -m
```

### 5. Write a script to print the users(one on each line) who are logged in successfully. Extract the information from the file named myauth.log located in the current working directory. The output should contain usernames only and should be unique. 

Hint: Use uniq command to get all distinct lines of the output.

Contents of myauth.log is given below

Jan 20 20:11:34 IITMBSC systemd-logind[897]: Session 27 logged out. Waiting for processes to exit.
Jan 20 20:11:34 IITMBSC systemd-logind[897]: Removed session 27.

**ANSWER** 
```bash
script() {
grep "session opened for user" myauth.log | cut -d ' ' -f 11 | sort | uniq
}
```

### 6. Print the previous login time of the user guest in the format MMM DD HH:MM:SS. Where MMM, DD, HH, MM and SS corresponds to Month (E.g. Nov), Date, Hours, Minutes and Seconds respectively. Extract the information from the logs available in the file myauth.log in the current directory. Sample log file below.

Jan 21 19:42:14 IITMBSC PackageKit: uid 1000 obtained auth for org.freedesktop.packagekit.system-sources-refresh
Jan 21 19:42:17 IITMBSC PackageKit: uid 1000 is trying to obtain org.freedesktop.packagekit.system-sources-refresh auth (only_trusted:0)

**ANSWER**
```bash
script() {
grep "session opened for user guest" myauth.log | cut -d ' ' -f1-3 | tail -n 2 | head -n 1
}
```

### 7. Mine the logs given in the file myauth.log present in the current working directory to print all the usernames  to which user student switched to using su command. 

Note: switching back to the previous user should not be accounted.

Hint: Basically you have to grep all the lines where 'su' command is run successfully and fetch the username to which the user student switched to.

Contents of myauth.log is given below

Jan 21 20:32:17 IITMBSC polkitd(authority=local): Unregistered Authentication Agent for unix-session:c2 (system bus name :1.525, object path /org/freedesktop/PolicyKit1/AuthenticationAgent, locale en_US.UTF-8) (disconnected from bus)
Jan 21 20:32:32 IITMBSC login[119373]: pam_unix(login:session): session opened for user guest by LOGIN(uid=0)
Jan 21 20:32:32 IITMBSC systemd-logind[966]: New session 31 of user guest.

**ANSWER**
```bash
script() {
grep "su: pam_unix(su:session): session opened for user" myauth.log | grep "by student" | cut -d ' ' -f 11
}
```

# Graded Assignment

### 1. The command apropos is equivalent to the command.
- ``` bash man -f```
- ``` bash ls -l```
- ``` bash man -k```
- ``` bash alias```

**ANSWER** man -k

*$ man man Usage: man [OPTION...] [SECTION] PAGE... -C, --config-file=FILE use this user configuration file -d, --debug emit debugging messages -D, --default reset all options to their default values --warnings[=WARNINGS] enable warnings from groff Main modes of operation: -f, --whatis equivalent to whatis -k, --apropos equivalent to apropos ....*

### 2. Choose all the statements that are true regarding symbolic links.

- [ ] The command  creates a soft link to  only if  exists in the current working directory.
- [ ] and  will have different inode numbers if  is a symbolic link to .
- [ ] The command  makes  a symbolic link of , if  does not exist in the current working directory.
- [ ] The symbolic link is still usable even if you remove the source file or transfer it to another location.

**ANSWER**
- file1 and file2 will have different inode numbers if file1 is a symbolic link to file2.
- The command ln -s file1 file2 makes file2 a symbolic link of file1, if file2 does not exist in the current working directory.

### 3. Conside a user User1 and the current working directory to be /home/User1/Dir1. 

```bash
$ echo This displays '$PWD' and "$USERNAME"
The output of the above command is:
```

- This displays /home/User1/Dir1 and User1
- This displays $PWD and User1
- This displays /home/User1/Dir1 and $USERNAME
- This displays $PWD and $USERNAME

**ANSWER** This displays $PWD and User1

*From bash manual `man bash`:*
*Enclosing characters in single quotes preserves the literal value of each character within the quotes. A single quote may not occur between single quotes, even when preceded by a backslash.*

### 4. The command used to turn a shell variable into an environment variable is.
- echo
- expand
- export
- eval

**ANSWER** export

*With reference to bash manual `man bash` 3.7.4 Environment:*

### 5. The command
```bash
$ echo *
```
gives the same output as the command:
- `ls *`
- `ls`
- `df *`
- `df`

**ANSWER** - ls
*will match with all visible files in the current directory.*

### 6. Choose the correct options.
- [ ] The printenv command can request the values of individual variables.
For example, printenv PATH
- [ ] The env command can output a list of all shell variables, environmental variables, local variables, and shell functions
- [ ] The set command can make changes to shell environment flags.
- [ ] The $PWD variable is for the current working directory of the shell
- [ ] The variable $HOSTNAME refers to the current logged in user

**ANSWER** 
1. The printenv command can request the values of individual variables.
For example, printenv PATH
2. The set command can make changes to shell environment flags.
3. The $PWD variable is for the current working directory of the shell

*The variable PWD stores the current working directory and it is referred using a preceeding dollar symbol.*

### 7. With regards to the ps command, match the following
Command	Function
1. ps -A	a. Display information about other users' processes, including those without controlling terminals.
2. ps -a	b. View all processes like ps -A but excludes session leaders
3. ps -d	c. Display information about other users' processes as well as your own. This will skip any processes which do not have a controlling terminal, unless the -x option is also specified.
4. ps -t	d. Display information about processes attached to the specified terminal devices.
5. ps -r	e. Display information about processes which match the specified process IDs.
6. ps -p	f. Sort by current CPU usage, instead of the combination of controlling terminal and process ID.

- 1—>a; 2—>b; 3—>c; 4—>d; 5—>f; 6—>e;

- 1—>a; 2—>c; 3—>b; 4—>f; 5—>d; 6—>e;

- 1—>a; 2—>b; 3—>c; 4—>f; 5—>e; 6—>;

- 1—>a; 2—>c; 3—>b; 4—>d; 5—>f; 6—>e;

**ANSWER** 1—>a; 2—>c; 3—>b; 4—>d; 5—>f; 6—>e;

### 8. In the current directory, the following output is obtained using the "ls" command 
```bash
$ ls
Applications LibOntology.owl VirtualBoxVMs
Desktop  Movies    get-pip.py
Documents  Music    m1
Downloads  Pictures    mtest
Library  Public    texput.log
```
What is the output on executing the following command? 
```bash
$ echo m* 
```
- m1

- Applications Desktop Documents Downloads Library LibOntology.owl Movies Music Pictures Public VirtualBoxVMs get-pip.py m1 mtest texput.log

- m1 mtest

- Movies Music m1 mtest

**ANSWER** m1 mtest

*Simply * will match all visible files/directory in the current working directory.*
*m* *will match all files/directories starting with the letter "m"*

### 9. Match the following
Flags set in Bash	Function 
1. H	a. locate and hash commands
2. B	b. commands are read from arguments
3. i	c. interactive mode
4. m	d. brace expansion enabled
5. h	e. ! style history substitution enabled
6. s	f. commands are read from stdin
7. c	g. job control enabled

- 1—>e; 2—>d; 3—>c; 4—>g; 5—>a; 6—>f; 7—>b;

- 1—>a; 2—>d; 3—>c; 4—>g; 5—>e; 6—>f; 7—>b;

- 1—>a; 2—>d; 3—>c; 4—>g; 5—>f; 6—>e; 7—>b;

- 1—>a; 2—>b; 3—>c; 4—>g; 5—>f; 6—>e; 7—>d;

**ANSWER** - 1—>e; 2—>d; 3—>c; 4—>g; 5—>a; 6—>f; 7—>b;

### 10. For which of the following command the output obtained will be the number 3?
- $ (((echo $BASH_SUBSHELL));)
- $ (((echo $BASH_SUBSHELL););)
- $ (((echo $BASH_SUBSHELL);))
- $ (((echo $BASH_SUBSHELL)))

**ANSWER** $ (((echo $BASH_SUBSHELL););)

### 11. Which of the following is the correct syntax to store the output of the command `ls` to the variable named dirs?
- [ ] dirs = ls
- [ ] dirs=ls
- [ ] dirs=`ls`
- [ ] dirs=$(ls)

**ANSWER** dirs=`ls` and dirs=$(ls)

*`` and $() are used to redirect the output of a command to a variable*

### 12. What is the output of the following?
```bash
	VAR="hello"
	echo "${VAR:-default}"
```
- default

- hello

- hello:-default

- ${VAR:-default}

**ANSWER** hello

### 13. What is the output of the following?
```bash
	VAR="world"
	REF="VAR"
	echo "${!REF}"
```
- VAR

- World

- REF

- ${!REF}

**ANSWER** World

# GRPA

### 1. Write a command that runs in a child shell, prints "hello" and exits with the exit code 179.

**ANSWER**
```bash
script() { 
(sh -c 'echo hello; exit 179')
#or bash -c "echo hello; exit 179"
}
```

### 2. The file Pincode_info.csv has information on the pin codes of some places. A sample output of the command head -5 Pincode_info.csv is given below. First line of this file gives the information about the sequence of fields in each line of file following it.

```bash
Circle Name,Region Name,Division Name,Office Name,Pincode,OfficeType,Delivery,District,StateName
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,A Narayanapuram B.O,515004,BO,Delivery,ANANTHAPUR,Andhra Pradesh
```
**ANSWER**
```bash
script() { 
number=`egrep -i "$state" Pincode_info.csv | head -1 | egrep -o [0-9]{6} | cut -c1`
egrep -i "$state" Pincode_info.csv | egrep -o "$number[0-9]{4}$number" | wc -l

# Alternate solution
# egrep "$state" -i Pincode_info.csv | egrep "[0-9]{6}" -o | egrep "(.)....\1" | wc -l
}
```

### 3. In a course, the instructor asked the students to submit their projects in a single file named as the student’s roll number. A typical roll number of a student is a 10 character string which is a combination of a four digit(decimal) year and six character hexadecimal number, e.g. "20201f3acd". The instructor specified that the name of the file should be in lower case but some students mistakenly used uppercase for their file names. Each file name is either entirely in lower case or entirely in upper case with numbers.

Your task is to create two arrays(shell variables) named lower and upper. Array lower should not contain the file names that have upper case letters and array upper should contain all the file names that have upper case letters.

Note: The project files are located in the current directory

Hint:

arr=(`ls`) # Each element in arr corresponds to the output from the ls

**ANSWER**
```bash
script() {
#lower=(`ls | grep "^[0-9]\{4\}[0-9a-f]\{6\}"`)
#upper=(`ls | grep "^[0-9]\{4\}[0-9A-F]\{6\}" | grep -v "[0-9]\{6\}$"`)

lower=(`ls |egrep "[[:digit:]]{4}[[:xdigit:]]{6}"|egrep "[[:lower:]]|[[:digit:]]{10}"`);
upper=(`ls |egrep "[[:digit:]]{4}[[:xdigit:]]{6}"|egrep "[[:upper:]]"`);
}
```