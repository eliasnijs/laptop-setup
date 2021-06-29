#!/bin/sh

mode="%+"
number=5
port=$(~/scripts/audio/audio-port.sh)

modeconversion () {
   if [ $* = "plus" ]; then
      mode="%+"
   elif [ $* = "min" ]; then
      mode="%-"
   else
      RED='\033[0;31m'
      echo "AssertionError: invalid mode"
      exit 1
   fi
}


argnr=$(echo $* | wc -w)
if [ $argnr -eq 2 ]; then
   modeconversion $1
   number=$2
elif [ $argnr -eq 1 ]; then
   modeconversion $1
fi

amixer -q -c 1 set $port $number$mode
~/scripts/audio/audio-visualise.sh
