#!/bin/sh

# !DISABLED PROPERTIES
#  1. CPU
#  2. MEMORY


#author: elias nijs
#date:   2021-06-03

# SATUSBAR

tick=0.5
name="ELIAS' LAPTOP"
weather="not set"
stocks="not set"
memory="not set"
cpu="not set"
volume="not set"
battery="not set"
date="not set"

set_date () {
    date=$(date "+%F %T")
}

set_battery () {
    status=$(cat /sys/class/power_supply/BAT1/status)
    capacity=$(cat /sys/class/power_supply/BAT1/capacity)
    symbol=""
    if [ "$status" = "Discharging" ]; then
        symbol="BAT-"
    else
        symbol="BAT+"
    fi
    battery="$symbol $capacity%"
}

set_cpu () {
    cpu="CPU $(mpstat | grep -o "[0-9]*,[0-9]*$" | sed "s/,/./g" | xargs -i echo "100-{}" | bc)%"
}

set_memory () {
   memory=$(echo "MEM $(inxi -m | grep -oe "[0-9]*.[0-9]%")")
}

set_stocks () {
   t=$(cat ~/scripts/.config/stocks)
	p=""
	for x in $t
	do
		r=$(~/scripts/other-utilities/stock-getticker.py $x | grep -o "value: [^\s]* - " | sed "s/value: //" | sed "s/ - //" | xargs -i echo {}$)
      p=$(echo "$p | $x: $r")
	done
   stocks=$(echo $p | sed "s/|//")
}

set_weather () {
   weather=$(~/scripts/other-utilities/weather.sh)
}

set_volume () {
   volume=$(echo "AUD $(~/scripts/audio/audio-visualise.sh)")
}


set_bar () {
   xsetroot -name "$stocks | $weather | $volume | $battery | $date "
}

set_date
set_battery
#set_cpu
#set_memory
set_stocks
set_weather

echo ok

while true
do
   min=$(date | sed "s/ +.*//g" | grep -o .....$)
	min1=$(echo $min | grep -o "^.")
	min2=$(echo $min | sed "s/^.//g" | grep -o "^.")
   min3=$(echo $min | grep -o "..$")

   if [ "$min3" = "00" ]; then
	   # every hour
	   if [ "$min1$min2" = "00"  ]; then 
		   set_weather
	   fi
	   # every 10 min
	   if [ "$min2" = "0" ]; then 
		   set_stocks	
      fi
      # every minute
      status=$(cat /sys/class/power_supply/BAT1/status)
      if [ $(echo $battery | grep -o "...$" | grep -o "^.." | bc) -ge 90 ] && [ "$status" = "Charging" ]; then
         ~/scripts/other-utilities/notify.sh Battery Unplug charging cable
      elif [ $(echo $battery | grep -o "...$" | grep -o "^.." | bc) -le 20 ] && [ "$status" = "Discharging" ]; then
         ~/scripts/other-utilities/notify.sh Battery Plug-in charging cable
      fi
   fi

	# every tick
	set_date
	set_battery
	#set_cpu
	#set_memory
	set_volume

   set_bar

   sleep $tick
done
