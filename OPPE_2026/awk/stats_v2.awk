{
    if ($1 == 1) {
        ones++
    }
    total++
}

END {
    if (ones > total / 2) {
        print "not"
    } else {
        print "naught"
    }
}