#!/bin/bash

input="server.log"

grep -v "DEBUG" "$input" >> "server_no_debug.log"

echo "Task done"
