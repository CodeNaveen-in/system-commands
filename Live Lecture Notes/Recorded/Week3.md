# Combining Commands and Files
- `command1 ; command2` - Irrespective
- `command1 && command2` - AND 
- `command1 || command2` - OR
- `$BASH_SUBSHELL` - display the no of subshells running

## File Descriptors
- Stdin 0 - Input
- Stdin 1 - Output
- Stdin 2 - Error
- `command > file1` - will add the output data of command to the file1 (it wil overwrite)
- `command >> file1` - It will append the data of the command to the file1
- `command 2> file1` - It will send the standarad error to the file1
- `command > file1 2>&1` - It has outut of the file as error is overwritten.
- `command1 | command2` - output of the command1 of is send to command2.
- `/dev/null` - Black Hole of the computer
- `tee` - Shows the data of the file in the mid of the process to the screen

## Software Management
- A package manager is needed to know and utilise the details of a project.
- debian is the package manager for the linux.
- It is available for x64 and others.
- for Ubunti we will be using `apt`
- Checksums are used to check the authenticity of the package.
  - `md5sum`
  - `sha1sum`
  - `sha256sum`
- Only sudoers can install / remopve / edit packages.
  - `sudo apt-get <command> <package-name>`
- `dpkg` - part that needs you to know what you are doing
- `dpkg-query` - used to do query of the pacakges.

## Linux Process Mangement
- `sleep` - will put the output to the sleep to the given time
- `coproc` - helps you put a task to background
- `kill <id>` - Kills a process by giving it's ID
- `--forest` - The ability to see the job processes in a tree like structure
- `fg` - moves a job to the foreground
- `{A..Z}` - expansion of the brakcet to apply to all members
- `;` - divider of the commands for data