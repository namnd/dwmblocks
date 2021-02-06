#!/bin/sh
case $1 in
    # 1) st -e "htop -s PERCENT_CPU" ;;
    1) st -e "htop" ;;
    3) st -e "htop -s PERCENT_MEM" ;;
esac
