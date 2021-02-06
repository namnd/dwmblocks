#!/bin/sh

cpu=$(top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{printf ("%0.2f%\n", 100 - $1)}')

printf "\uf109  "
echo "$cpu"
