# OPPE Problem 2

## Problem Statement

You have been provided with a list of items of a shopping bill in HTML. The list has name of the item, price, and quantity. Write a **bash script** `script.sh` to compute the total bill amount.

**Note**: The HTML input to the script will be sent through standard input (`&0`).

## Sample Input
 ```html
  13   │ <li>Item: <span class="item-name">Batteries</span>, Price: <span class="item-price">Rs. 14</span>, Qty: <span class="item-qty">6</span></li>
  14   │ <li>Item: <span class="item-name">USB Cable</span>, Price: <span class="item-price">Rs. 85</span>, Qty: <span class="item-qty">1</span></li>
  15   │ <li>Item: <span class="item-name">Ball Pens</span>, Price: <span class="item-price">Rs. 12</span>, Qty: <span class="item-qty">5</span></li>
```

## Sample Output
```bash
  21   │ 229
```
## Instructions
 - You should create a bash script named `script.sh`.
 - It should be present in `~/se2001/nppe_2/` directory.
 - The script should read the HTML input from standard input (`&0`).
 - The script should output the required format to standard output (`&1`).

# ANSWER
```bash
#!/bin/bash

# Read HTML input from stdin
# Extract price and quantity using grep + sed
# Multiply and sum using awk

awk '
{
  # Extract price (remove "Rs." and spaces)
  match($0, /item-price">Rs\. *([0-9]+)/, price)
  match($0, /item-qty">([0-9]+)/, qty)

  if (price[1] && qty[1]) {
    total += price[1] * qty[1]
  }
}
END {
  print total
}
'
```