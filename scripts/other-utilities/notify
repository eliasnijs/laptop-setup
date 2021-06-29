#!/bin/sh

#author: elias nijs
#date:   2021-06-11

# ALERT
message=$(echo $* | grep -o " .*$" | sed "s/ //") 
notify-send -u "critical" "$1" "$message"
