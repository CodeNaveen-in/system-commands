#!/bin/bash

while read -r line; do
  # Search for "Cable" (case-insensitive) and extract item-name content
  echo "$line" | grep -i "Cable" | grep -oP '(?<=item-name">).*?(?=</span>)'
done < products.html
