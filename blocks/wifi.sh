#!/bin/sh

status=$(cat /sys/class/net/w*/operstate)
ssid=$(nmcli connection show --active | grep wifi | awk '{print $1}')

icon="\uf00d" # X
if [ $status = "up" ] ; then
    icon="\uf1eb "
    printf "$icon %s" $ssid
else
    printf "$icon"
fi
