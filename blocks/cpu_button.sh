#!/bin/sh
case $1 in
    1) notify-send "$(ps axch -o cmd:15,%cpu --sort=-%cpu | head)" ;;
    3) st -e htop --sort-key=PERCENT_CPU ;;
esac
