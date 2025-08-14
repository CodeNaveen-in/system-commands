# Some utilities
- find - locating files
  - -name - pattern to match
  - -type - file type code
  - -exec - meant to apply a command.
- File packaging
  - tar
  - Zip

## Overview of Shell Scripts
```bash
#!Interpreter/path
#Commment
var="hello world"
echo var
```

```bash
for var in list
do 
    commands
done
```

```bash
if condition
then 
    commands
fi
```

```bash
myFunc()
{
    commands
}
```

## Working with shell scripts
```bash
#!/bin/bash
#Sl.sh is my first script
echo "Hello World"
```

```bash
#!/bin/bash
#Sl.sh is my first script
echo "Hello World"
echo the PID of the script is $PID
echo $$

myvar = "MY variable"
export myvar

#How arguments are passed
echo $#
echo $0
echo $1
```

```bash
#conditions
if $1=$0;
then 
    echo yess
fi
```
```bash
echo For loop
for i in {A...D}{1..9}
do 
    echo $i
done
```


