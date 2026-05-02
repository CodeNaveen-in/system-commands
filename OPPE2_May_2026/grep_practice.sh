# Q1. Find users in delhi
grep 'Delhi' data.txt | cut -d ',' -f2

# Q2. Find users count with gmail accounts
grep -c '@gmail' data.txt 

# Q3. Find Inactive users
grep 'inactive' data.txt| cut -d ',' -f2

# Q4. Users with age > 30
grep -E ',3[0-9],|,[4-9][0-9]' data.txt | cut -d ',' -f2

# Q5. Lines that start with ID from 105 to 109
grep -E '^10[5-9]' data.txt

# Q6. Types of Email users
grep '@' data.txt | cut -d ',' -f5 | cut -d '@' -f2 | sort | uniq -c | sort -rn

# Q7. Sorting the files based on the file extension
# Way-1 : grep -o '\..*$' | tr 'A-Z' 'a-z' | sort | uniq -c
# Way-2 : grep -o '\.[^.]*$' | tr 'A-Z' 'a-z' | sort | uniq -c