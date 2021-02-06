#!/bin/sh
case $1 in
    1) notify-send "$(ps axch -o cmd:15,%mem --sort=-%mem | head)" ;;
    3) st -e htop --sort-key=PERCENT_MEM ;;
esac
