# Shell Variables

- Shell variables provide security to the data.
- `echo` command is used to print the data to the terminal
- `echo $VARIABLE` - the process to set the varaiables
- **Special shell variables**
  - `$0` - to get the data
  - `$USERNAME`
  - `$HOSTNAME`
  - `$USER`
  - `$PWD`
  - `$$`
- **Program exit code**
  - `0` - success
- `echo "hello                    world"` - will set the value with given spaces
- echo works on completing the quotes. 
- With double quotes the value are considered as shell variables if it can then it is substituted.
- The command substitute can be skipped `echo "Then we add in the value of the \$HOSTNAME is $HOSTNAME"`

## Using Variables
- Shell variable manipulations are very fast
- Child shell variable value is not present to the parent shell.
- Back quote is used to send the command value to the variable
- `myvar = "Details of it"`
- `export myvar`
- `echo ${myvar:+"default"}`
- `echo ${H}`
- `echo ${myvar/pattern//patern}`
- `declare -a arr`
- `[[ -v myvar]]`
- `echo ${myvar:=hello}`
- `echo ${myvar:+hello?Not_set}`
- `echo ${arr[@]}`
    ```bash
    myvar=10
    echo $myvar
    myvar="hello World"
    echo $myvar
    unset myvar
    ```
