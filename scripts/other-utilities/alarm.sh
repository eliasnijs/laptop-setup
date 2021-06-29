#!/bin/sh

time=$(( $1 - 1 ))
while [ $time -ge 0 ]
do
  seconds=59
  while [ $seconds -gt 0  ] 
  do
      pseconds=$seconds
      if [ $(echo $seconds | wc -c ) -lt 3 ]; then
    	pseconds=$(echo 0$seconds)
      fi
      pminutes=$time
      if [ $(echo $time | wc -c ) -lt 3 ]; then
        pminutes=$(echo 0$time)
      fi
      figlet -f future.flf "$pminutes:$pseconds"
      seconds=$(( $seconds - 1  ))
      sleep 1
  done
  time=$(( $time - 1 ))
done

xdg-open $2 &

sleep 2
exit
