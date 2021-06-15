#!/bin/bash

#author: elias nijs
#date    2021-06-05

#aliasmaker

cp ~/.bashrc ~/.bashrcbackup
cp ~/.bashrc ~/.bashrctemp

for x in ~/scripts/* 
do
   if ! grep -q $x ~/.bashrc; then
      y=$(echo $x | sed "s/.*\///g" | sed "s/\..*//g"  )
      z=$(echo alias $y=\"$x\" )
      echo $z >> ~/.bashrctemp
   fi
done

mv ~/.bashrctemp ~/.bashrc
echo "please run the following command:" 
echo "source ~/.bashrc"
