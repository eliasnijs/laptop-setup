#!/bin/sh

if ! echo $* | grep -q [^0-9]; then
   if [ $(echo $*) -le 100 ] && [ $* -ge 0 ]; then
      port=$(~/scripts/audio/audio-port.sh)
      amixer -qc 1 set $port $*%
   else
      echo "AssertionError: invalid value"
   fi
else
   echo "AssertionError: invalid value"
fi

echo $(~/scripts/audio/audio-visualise.sh)
