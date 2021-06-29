#!/bin/sh

hdmi=$(xrandr |grep ' connected' |grep 'HDMI' |awk '{print $1}')


if [ "$(echo $hdmi | wc -c)" -gt 1 ]; then
   xrandr --output $hdmi --auto
   xrandr --output eDP --auto --below $hdmi
fi

~/scripts/wallpaper.sh
