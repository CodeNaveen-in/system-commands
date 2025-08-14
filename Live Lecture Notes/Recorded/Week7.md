# Bash Scripts

- Shell airthmetic used with 
  - `let`
  - `expr`
  - `$[]`
  - `$()`
- `-lt` - less than
- bench calculator is also present `bc -l`
- heredoc feature
  - Using the hypen to skip the extra space in identation while reading code.
  
## Case Statement
```shell
case $var in
    op1)
        commandset1;;
    op2 | op3)
        commandset2;;
    op4 | op5 | op6)
        commandset3;;
    *)
        commandset4;;
esac
```

## break
```shell
n=10
i=0
while [ $i -lt $n ]
do
        echo $i
        (( i++ ))
        if [ $i -eq 5 ]
        then
                break
        fi
done
```

## Eval
- Never evaluate user given string, it can make system vulnerable.
- You can packge the functions and utilise them.

## Select loop
- Meant to displaying a set of options and based on user's choice either throw error or assign value.