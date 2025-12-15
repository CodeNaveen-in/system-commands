BEGIN {
    FS=","               # CSV separator
    print "=== Name and Salary ==="
}

NR>1 {
    # Task 1: Print Name and Salary
    print $2, $4

    # Task 2: Collect salary for average
    sum += $4
    count++

    # Task 3: Salary > 60000
    if ($4 > 60000) {
        high[$2] = $4
    }
}

END {
    print "\n=== Average Salary ==="
    print "Average Salary =", sum/count

    print "\n=== Employees with Salary > 60000 ==="
    for (name in high) {
        print name, high[name]
    }
}