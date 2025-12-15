#!/bin/bash

input="server.log"
output="server_rpl.log"

sed -e 's/ERROR/CRITICAL ERROR/g' -e 's/INFO/INFORMATION/g' -e'/DEBUG/d' "$input" > "$output"
