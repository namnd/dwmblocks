#!/bin/sh
read -r capacity </sys/class/power_supply/BAT0/capacity
read -r status </sys/class/power_supply/BAT0/status

icon="\uf240 " # full
if [ "$capacity" -le 75 -a "$capacity" -gt 50 ]; then
    icon="\uf241 " # 3/4
elif [ "$capacity" -le 50 -a "$capacity" -gt 25 ]; then
    icon="\uf242 " # 1/2
elif [ "$capacity" -le 25 -a "$capacity" -gt 0 ]; then
    icon="\uf243 " # 1/4
fi

if [ "$status" == "Charging" ]; then
    icon="\uf0e7"
fi

printf "$icon"
