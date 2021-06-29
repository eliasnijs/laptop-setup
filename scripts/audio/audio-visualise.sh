#!/bin/sh

port=$(~/scripts/audio/audio-port.sh)

level=$(amixer -c 1 get $port | grep -o "[0-9]*%" | head -1 | sed "s/%//")

visual=""
index=0
while [ $index -lt 10 ]
do
   if [ $index -lt $(( $level/10 )) ]; then
      visual=$(echo "$visual=")
   else
      visual=$(echo "$visual-")
   fi
   index=$(( $index + 1 ))
done

echo "[$visual] $level%"

