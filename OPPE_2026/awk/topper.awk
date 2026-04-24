NR > 1 {
    name = $1
    sum = 0

    for (i = 2; i <= NF; i++) {
        sum += $i
    }

    avg = sum / (NF - 1)

    if (avg > max_avg) {
        max_avg = avg
        topper = name
    }
}

END {
    print "Topper:", topper
}