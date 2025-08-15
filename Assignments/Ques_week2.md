# Practice Assignment

1. Which of the following ports are registered ports?
- 0 – 1023
- 1024 – 49151
- 49152 – 65535
- 0 - 65535

**ANSWER** - 1024 – 49151

2. The command used to find your IP address in Ubuntu is;
- ifconfig -a
- ip add
- give ip
- hostname -I

**ANSWER** -
```bash
1. ifconfig -a
2. ip add
3. hostname -I
```
3. dig is a DNS lookup utility. Match the options of the dig command to its respective function.

| Option | Function |
| ------ | -------- |
| 1 -4 | a. Print the version number and exit |
| 2 -m | b. Print query times in microseconds instead of milliseconds |
| 3 -u | c. Uses IPv4 only |
| 4 -v | d. Enable memory usage debugging |

- 1—>c; 2—>d; 3—>b; 4—>a;
- 1—>b; 2—>a; 3—>d; 4—>c;
- 1—>b; 2—>c; 3—>a; 4—>d;
- 1—>a; 2—>c; 3—>b; 4—>d;

**ANSWER** - 1—>c; 2—>d; 3—>b; 4—>a;

# PPA 
encoding-key is a file located at the path /encryption/two-level/binary/positive-offset/(directory 'encryption' is located in current working directory) . The file encoding-key is updated often and shared between multiple users. This file is important to you and you are worried that the file could be deleted by mistake. Create a file ek in the current working directory, such that it is always in sync with the contents of file encoding-key and if encoding-key gets deleted by any chance the content in it should be available in file ek.

```bash
script() {
mkdir -p /encryption/two-level/binary/positive-offset/
touch /encryption/two-level/binary/positive-offset/encoding-key
ln /encryption/two-level/binary/positive-offset/encoding-key ek
}
```

# Graded Assignment 2.1

### 1. Every device connected to the Internet has at least one IP address which indicates where traffic has come from. Each IP address has some associated port numbers for each transport protocol used for determining the correct receiving application. IP addresss and Port numbers are respectively

- 32-bit nonnegative integer and 16-bit nonnegative integers
- 32-bit nonnegative natural numbers and 16-bit nonnegative natural numbers
- 16-bit nonnegative integer and 32-bit nonnegative integers
- 16-bit nonnegative natural numbers and 32-bit nonnegative natural numbers

**ANSWER** - 32-bit nonnegative integer and 16-bit nonnegative integers

### 2. Which command will give information on open network ports on the machine?

- nslookup
- whois
- wireshark
- netstat

**ANSWER** - netstat

### 3. $ nslookup google.com

- The above command is used to 
- Retrieve information about a domain name such as its server and ip address.
- looks up number of pings to the domain name "google.com".
- Gets the DNS of the domain on google.com
- none of the above

**ANSWER** - Retrieve information about a domain name such as its server and ip address.

### 4. Match the following networing commands to its respective function.

| Option | Function |
| ------ | -------- |
| 1. ipconfig | a. It is a network troubleshooting utility |
| 2. ping | b. Used to query DNS related information |
| 3. dig | c. Display and manipulate route and network interfaces |
| 4. traceroute | d. Checks connectivity between two nodes |
| 5. wget | e. Downloads a file from internet |        

- 1—>c; 2—>d; 3—>b; 4—>a; 5->e;
- 1—>b; 2—>e; 3—>d; 4—>c; 5->a;
- 1—>e; 2—>d; 3—>c; 4—>a; 5->b;
- 1—>a; 2—>c; 3—>e; 4—>d; 5->b;

# Graded Assignment 2.2
### 1. What is the command in vi editor to copy the character under the cursor and paste it next to itself? Assume that the editor is in insert mode currently.

Note: `<C-c>`, `<C-p>` and `<ESC>` represents "Ctrl+c", "Ctrl+v" and Escape key respectively.

- <C-c><C-v>
- <ESC>vyp
- > 1 <ESC>vcp
- <ESC>:vyp

**ANSWER** `<ESC>vyp`

### 2. What character needs to be pressed when you wish to enter from navigation (normal) mode to insert mode from the beginning of a line in the vi editor?

**ANSWER** I

### 3. What one-word command in navigation mode can be used to delete consecutive 8 lines in vi editor?

**ANSWER** 8dd

### 4. What will the following vi editor command do.
```bash
   :%s/UNIX/Linux/gci
```
- Replace all the occurrences of "Linux" with "UNIX" but is case-insensitive and will ask for confirmation.
- Replace all the occurrences of "UNIX" with "Linux" but is case-insensitive and will ask for confirmation.
- Replace all the occurrences of "UNIX" at the beginning of a line with "Linux" but is case- insensitive and asks for confirmation
- Replace all the occurrences of "UNIX" with "Linux" but is case-sensitive and will ask for confirmation.

**ANSWER** Replace all the occurrences of "UNIX" with "Linux" but is case-insensitive and will ask for confirmation.

### 5. Match the following vi editor commands to their use.

| Options | Uses |
| ------- | ---- |
| 1. :q! | A. Allows to execute commands in terminal |
| 2. :set number | B. Save and quit |
| 3. :x | C. Display line numbers 
| 4. :1 | D. Force exit without saving |      

- 1-D, 2-C, 3-A, 4-B
- 1-D, 2-C, 3-B, 4-A
- 1-B, 2-C, 3-D, 4-A
- 1-B, 2-C, 3-A, 4-D

**ANSWER** 1-D, 2-C, 3-B, 4-A

# Graded Assignment 2.4

### 1. You try to SSH into a remote VM using the command ssh user@remote-vm and receive the following error:

	Permission denied (publickey).

- [ ] Which of the following option(s) are likely the cause?
- [ ] The SSH key is not added to the SSH agent.
- [ ] The remote VM's SSH server is down.
- [ ] The permissions on the SSH key file are too open.
- [ ] The username is incorrect.

**ANSWER**
1. The SSH key is not added to the SSH agent.
2. The permissions on the SSH key file are too open.
3. The username is incorrect.

### 2. You try to SSH into a remote VM using the command `ssh user@remote-vm` and receive the following error:
```bash
bash @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @ WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED! @ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
```

Which of the following option(s) are likely the cause?

- [ ] The remote VM's SSH host key has changed.
- [ ] The remote VM's IP address has changed and is now associated with a different host key.
- [ ] The local `~/.ssh/known_hosts` file is corrupted.
- [ ] The remote VM's SSH server is down.

**ANSWER** - 
1. The remote VM's SSH host key has changed.
2. The remote VM's IP address has changed and is now associated with a different host key.

### 3. You encounter a "Permission denied (publickey)" error when trying to SSH into a remote VM. Which of the following command would you use to ensure your SSH key has the correct permissions?

- ssh-keygen -t rsa -b 4096
- chmod 600 ~/.ssh/id_rsa
- ssh-keygen -f ~/.ssh/id_rsa -y
- ssh-keygen -R remote-vm

**ANSWER** chmod 600 ~/.ssh/id_rsa

### 4. You try to SSH into a remote VM using the command ssh user@remote-vm and receive the following error:

	Host key verification failed.

What are the possible reasons for this error?

- The remote VM's IP address has changed.
- The remote VM's SSH host key has changed.
- The local SSH configuration file is corrupted.
- The SSH client is not installed.
**ANSWER** 
1. The remote VM's IP address has changed.
2. The remote VM's SSH host key has changed.

### 5. You receive a "Host key verification failed" error when trying to SSH into a remote VM. Which `ssh-keygen` command would you use to remove the old host key?

Hint-Consult MAN page of `ssh-keygen` command

- ssh-keygen -R remote-vm
- ssh-keygen -t rsa -b 4096
- ssh-keygen -f ~/.ssh/id_rsa -y
- ssh-keygen -L remote-vm

**ANSWER** - ssh-keygen -R remote-vm

### 6. In vi editor, which of the following commands will delete the word error from all lines containing the word "error"?

- :g/error/d
- :v/error/d
- :%s/error//g
- :g!error/d

**ANSWER** :%s/error//g

### 7. What does the following command do?
	ssh -o StrictHostKeyChecking=no user@192.168.1.50

- Disables authentication prompts
- Automatically accepts the server’s host key
- Disables password authentication
- Connects without SSH encryption

**ANSWER** Automatically accepts the server’s host key

# GrPA

### 1. Print the absolute path where the command wget is located.

**ANSWER** 
```bash
script() { echo '
which wget
'
}
```

### 2. "dir_1" and "dir_2" are directories in current working directory. Create a symbolic(soft) link to the file "file_1" present in "dir_1" and store it as "file_2" in "dir_2".
Hint: The link to file_2 should be either absolute from current working directory i.e. / or relative to dir_2.

**ANSWER**
```bash
script() {
mkdir dir_1 dir_2
touch dir_1/file_1
ln -s "$(pwd)/dir_1/file_1" "$(pwd)/dir_2/file_2"
}
```

### 3. Print the username associated with the current session.

**ANSWER** 
```bash
script() {
whoami
}
```