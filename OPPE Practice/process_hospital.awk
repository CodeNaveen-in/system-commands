BEGIN {
  FS=","   # CSV is comma-separated
}

NR > 1 {
  bill = $5
  insurance = $6

  if (insurance == "Yes") {
    net = bill * 0.2   # 80% covered, patient pays 20%
  } else {
    net = bill         # No insurance, pays full
  }

  printf "Patient %s (%s, %s Dept): Net Payable = %.2f\n", $1, $2, $4, net

  if (net > 40000) {
    printf "  -> ALERT: %s has a very high bill!\n", $2
  }
}