# TODO 1 : Get Employee name
#NR>1{
#    print "Employee Name :", $1
#}


# TODO 2 : Employee older than 30
#NR>1{
#    if ($2>30) 
#    {
#        print "Employee ", $1 , " is older than 30"
#    }
#}


# TODO 3 : Print 2nd and 4th field
#NR>1{
#    print "Age of", $2 , "is earning $", $4
#}


# TODO 4 : Find highest Salary
#BEGIN{
#    sal_max = 0
#}
#NR>1{
#    if ($4 > sal_max){
#        sal_max = $4
#    }
#}
#END{
#    print "Highest Salary is", sal_max 
#}


# TODO 5 : Print Names in UpperCase
#NR>1{
#    print "The employee is", toupper($1) 
#}


# TODO 6 : Print Employee name whose Name start with A
#NR>1{
#    if(substr($1,1,1) == "A") {
#        print $1, "starts from A"
#    }
#}


# TODO 7 : Average salary per Department
#NR>1{
#    dept = $3
#    salary = $4
#    sum[dept] += salary
#    count[dept]++
#}
#END{
#    for (d in sum){
#        print d, "Average salary:", sum[d] / count[d]
#    }
#}


# TODO 8 : Department with Most employees (Handles Ties)
#NR>1{
#    count[$3]++
#    # Track the highest number seen so far
#    if(count[$3] > max_em) {
#        max_em = count[$3]
#    }
#}
#END{
#    print "The following department(s) have the most members (" max_em "):"
#    for(d in count){
#        # Check every department against the max_em
#        if(count[d] == max_em){
#            print "The dept", d, "has employees", max_em
#        }
#    }
#}


# TODO 9 : Employees sorted by the salary
#NR>1 {
#    # Store salary in an array indexed by the employee name
#    # Example: data["Alice"] = 50000
#    data[$1] = $4
#}
#END {
#    # asorti takes 'data' and creates a new array 'idx' 
#    # containing the names (keys), sorted by their salary values (numeric ascending)
#    n = asorti(data, idx, "@val_num_asc")
#    for (i = 1; i <= n; i++) {
#        name = idx[i]
#        print name, "is with salary", data[name]
#    }
#}


# TODO 10 : Count of Employees above average Salary
NR>1{
    name[NR]=$1
    salary[NR]=$4
    total+=$4
    count++
}
END{
    avg = total/count
    for (i in salary){
        if (salary[i] > avg){
            print name[i], "earns more than average" , avg
        }
    }
}