BEGIN {
    FS=","   # CSV separator
    print "=== Average Marks for Each Student ==="
}

NR>1 {
    # Calculate average
    avg = ($3 + $4 + $5) / 3

    # Task 1: Print Name and Average
    print $2, avg

    # Task 2: Collect high scorers
    if (avg > 75) {
        high[$2] = avg
    }

    # Task 3: Custom formatted output
    formatted[$2] = sprintf("Name: %s | Average: %.2f", $2, avg)
}

END {
    print "\n=== Students with Average > 75 ==="
    for (name in high) {
        print name, high[name]
    }

    print "\n=== Custom Format Output ==="
    for (name in formatted) {
        print formatted[name]
    }
}