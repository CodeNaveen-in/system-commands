# Week 1 

## How to install linux?
  - Virtual box
    - Download it from the site 
    - Give persmissions and details
  - Wsl
    - Install it from terminal `wsl --install`
    - Give details and continue

## Traversing in Linux File system
  - using commmands such as :
    - `ls` - list all
    - `ls -a` - List all with hidden
    - `ls -l` - List all but in long format
    - `pwd` - Gives you present working directrory
    - `cd <path>` - Helps ou traverse in path 
      - `.` - Same directory
      - `..` - Parent
      - `Path/to/file` - Will take you to the file
      - `-` - Will take you to the last directory
- `user@host$-` : It is the command prompt from where we give our command.

## Simple Commands
  - `date` - Will give current timestamp 
  - `cal` - Will give calendar 
  - `free` - Will give free memory
  - File Type
    - `-` - Regular File
    - `d` - Directory
    - `l` - symbolic link
  - inode contains storage of any location
    - `ls -i <filename>`
  - `chmod` - used to adjust permissions
  - `touch` - meant to create files
  - `cp` - meant to copy the file
  - `mv` - meant to move the file
  - `rm` - meant to remove the file
  - `alias` - meant to rename a commmand
  - `file` - gives you detail of the file
  - To know file more
    - `less <filename>` - show the content of the command
    - `cat` - pastes the data of the file on terminal (ideal for small files)
    - `head` - shows first 10 lines of the file
    - `tail` - shows last 10 lines of the file
    - `wc` - give lines, words counts of the file
    - `whatis` - shows you mini description of the command
    - `which` - gives the location of the command
    - `type` - It gives you what type of command it is
  - link making
    - `ln` - to make hard link
    - `ln -s` - to make symbolic link
  - File sizes
    - `ls -s`
    - `stat`
    - `du`
    - `df`