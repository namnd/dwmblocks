#!/bin/sh

mem=$(free --mebi | sed -n '2{p;q}' | awk '{printf ("%0.2f%\n", ( $3 / $2 * 100))}')
printf "\uf0ae  "
echo "$mem"
