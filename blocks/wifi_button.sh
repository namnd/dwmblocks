#!/bin/sh
strength=$(awk '/^\s*w/ { print int($3 * 100/70) "% "}' /proc/net/wireless)

case $1 in
    1) notify-send "Strength $strength"
esac
