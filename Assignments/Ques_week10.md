# Practice Assignment

### 1. Which of the following ports are registered ports?

- 0 – 1023
- 1024 – 49151
- 49152 – 65535
- 0 - 65535

**ANSWER** 1024 – 49151

### 2. The command used to find your IP address in Ubuntu is;
- [ ] ifconfig -a
- [ ] ip add
- [ ] give ip
- [ ] hostname -I

**ANSWER**
```bash
ifconfig -a
ip add
hostname -I
```

### 3. dig is a DNS lookup utility. Match the options of the dig command to its respective function.

| Option | Function |
| ------ | -------- |
| 1. -4 | a. Print the version number and exit |
| 2. -m | b. Print query in microseconds instead of milliseconds |
| 3. -u | c. Uses IPv4 |
| 4. -v | d. Enable memory usage debugging |

- 1—>c; 2—>d; 3—>b; 4—>a;
- 1—>b; 2—>a; 3—>d; 4—>c;
- 1—>b; 2—>c; 3—>a; 4—>d;
- 1—>a; 2—>c; 3—>b; 4—>d;

**ANSWER** 1—>c; 2—>d; 3—>b; 4—>a;

# Graded Assignment

### 1. You have been assigned to add a feature to the repository TaskSchedular for which you will have to add two files task.py and main.py as listed in the directory tree below. Hence, you are planning on doing your first commit to this repository. Select the commands which are required to do your first commit

```bash
$ tree
.
|-- lib
|   |-- task.py
|-- main.py
​
1 directory, 2 files
```
- [ ] git commit
- [ ] git add
- [ ] git restore
- [ ] git init

**ANSWER** git commit and git add

### 2. The current version of your project files/directories is given below.
```bash
$ tree
.
|-- lib
|   |-- task.py
|-- log.py
|-- main.py
|-- recompute.py
|-- setup.py
​
1 directory, 5 files
```

Answer based on the below data.

```bash
$ git status
On branch master
Untracked files:
(use "git add <file>..." to include in what will be committed)
      log.py
      recompute.py
      setup.py
​
nothing added to commit but untracked files present (use "git add" to track)
```

The file task.py is updated from the last commit.

- True
- False

**ANSWER** False

### 3. Based on the last question data, select the command which adds all new .py files to the staging area.
- git commit -ma "Adding three more files"
- git commit -m "Adding three more files"
- git add recompute.py setup.py
- git add *.py

**ANSWER** git add *.py

### 4. After executing the command from the previous question. Now you have modified the file recompute.py and removed the file log.py in your local repository. What could be the correct output if you executed git status in this state locally on your repository.

**ANSWER**

```bash
$ git status
On branch master
Changes to be committed:
(use "git restore --staged <file>..." to unstage)
      new file:   log.py
      new file:   recompute.py
      new file:   setup.py
​
Changes not staged for commit:
(use "git add/rm <file>..." to update what will be committed)
(use "git restore <file>..." to discard changes in working directory)
      deleted:   log.py
      modified:   recompute.py
```

### 5. Now after removing the file log.py you want to restore this file from the last commit. Select the command that will perform this action.

- git restore log.py
- git reset log.py
- git clean
- git add log.py

**ANSWER** git restrore log.py

### 6. Which of the following Git commands will create a new branch and switch to it in a single step?
- [ ] git branch new-feature && git checkout new-feature
- [ ] git checkout -b new-feature
- [ ] git switch -c new-feature
- [ ] git checkout new-feature

**ANSWER** 
```bash
git checkout -b new-feature
git switch -c new-feature
```

### 7. Which of the following describes the main role of a version control system?

- Enforcing security policies inproduction environments
- Providing redundancy for data backup
- Tracking changes to files and coordinating work among developers
- Automating deployment pipelines

**ANSWER** Tracking changes to files and coordinating work among developers

# GrPA

### 1. Write a Bash script to reconstruct the Shopping Bill dataset from the OCR data files and store it in a separate file for each card. The reconstructed dataset should contain one file for each card with the name shopping_bill_<card_number>.txt,  "<card_number>" is a number of the card e.g. '1', '4', '12', '24' etc.

The generated files should contain the data in the format given below.
SHOPNAME:CUSTOMER_NAME:CARD_NO
Item:Category:Qty:Price:Cost
Carrots:Vegetable/Food:1.5:50:75
....
....

Where information like shopname, category, item. cost etc. can be fetched from their respective 'ocr_.txt' files. Or you can find all the information in a single file named 'ocr_full.txt'
An example output for the output file shopping_bill_1.txt is given below.
SV Stores:Srivatsan:1
Item:Category:Qty:Price:Cost
Carrots:Vegetables/Food:1.5:50:75
Soap:Toiletries:4:32:128
Tomatoes:Vegetables/Food:2:40:80
Bananas:Vegetables/Food:8:8:64
Socks:Footwear/Apparel:3:56:168
Curd:Dairy/Food:0.5:32:16
Milk:Dairy/Food:1.5:24:36


You can [download](https://drive.google.com/drive/folders/16y-VjGK9Etbbb3VmFOfHOMQt4iihDOWm) all the data files from here and work locally to build a solution.

**ANSWER**

```bash
script() {
#!/usr/bin/bash

# getting all the names and storing in an array
NAMES=($(cat ocr_names.txt |
  uniq |
  grep -v '\[' |
  egrep -o '[[:alpha:]]+$'))

NAMES[9]=Rajesh # manual correction of data
NAMES[22]=Julia # manual correction of data

# getting all the shop names and storing in an array
readarray -t SHOPS < <(cat ocr_shopname.txt |
  uniq |
  grep -v '\[')

FILEPAT='^\[' # to capture the metadata:card number
count=0 # card count to keep track of card number
while read line; do

  # the metadata about the card name is bounded by [ ]
  if [[ $line =~ $FILEPAT ]]; then
    ((count++))
    cardNo=$(echo $line | egrep -o '[[:digit:]]+')
    cardNo=${cardNo#*0}
    # replace with the count if cardNo read is not valid
    [[ $cardNo == "" ]] && cardNo=$count 
    SHOP=${SHOPS[$((cardNo - 1))]} # current shop name
    NAME=${NAMES[$((cardNo - 1))]} # current customer name
    {
      echo "$SHOP:$NAME:$cardNo"
      echo "Item:Category:Qty:Price:Cost"
    } > shopping_bill_$cardNo.txt
  else
    it=($line) # convert the string `line` to array `it`

    # check for the enough fields and prevention of unwanted data
    echo $line | egrep -q "$SHOP|$NAME"
    if [[ $? != 0 ]] && [[ ${#it[@]} -ge 5 ]]; then
      # get the field values
      cost=${it[$((${#it[@]} - 1))]}
      price=${it[$((${#it[@]} - 2))]}
      quantity=${it[$((${#it[@]} - 3))]}
      category=${it[$((${#it[@]} - 4))]}
      item=${line% $category*}

      # correction done by observing the data from the data set
      # 3 is read as 'a' in some field
      echo $quantity | egrep -q '^[[:digit:].]+$'
      [[ $? != 0 ]] && quantity=${quantity/a/3}
      echo $price | egrep -q '^[[:digit:].]+$'
      [[ $? != 0 ]] && price=${price/a/3}

      # printing the field value in the desired structure
      echo $item:$category:$quantity:$price:$cost >> shopping_bill_$cardNo.txt
    fi
  fi
done < <(cat ocr_item_record.txt |
  uniq |
  grep '^[A-Z\[]' |
  grep -v '^Item' |
  sed 's/[=]//g') # preprocessing the data files

# manual validation with checking the total cost with the original dataset
#for file in shopping_bill_*.txt; do
#  echo $file:$(cat $file |
#    sed -n '1,2! p' |
#    rev |
#    cut -d: -f1 |
#    rev |
#    awk '{sum+=$0}END{print sum}')
#done
}
```