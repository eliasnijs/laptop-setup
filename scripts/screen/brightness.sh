#!/bin/sh


if [ "$1" -le "255"  ] && [ "$1" -ge "0" ]; then
   sudo echo $1 > /sys/class/backlight/amdgpu_bl0/brightness
else
   echo "AssertionError: invalid value"
fi
