#!/bin/sh

t=$(amixer -c 1 get Headphone | grep -o "\[[a-z]*\]" | grep -o "[a-z]*" | head -1)
if [ $t = "on" ]; then
   echo Headphone
else
   echo Speaker
fi
