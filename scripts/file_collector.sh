#!/bin/sh

FILE_NAME=$(echo "$1_collection_$(date +"%F%T.%2N" | sed -E -e 's/:|-|\.//g').txt")
while getopts "n::" opt
do
   case "${opt}" in
      n) FILE_NAME="${OPTARG}"
         ;;
      \?) exit 1
         ;;
   esac
done
shift $((OPTIND-1))

if [ $# -ne 1 ]; then
   echo "invalid arguments"
fi

> $FILE_NAME 
files=$(find ./ -name $1)
for x in $files
do
   echo "FILE: $x" >> $FILE_NAME
   echo "\`\`\`" >> $FILE_NAME
   cat $x >> $FILE_NAME 
   echo "\`\`\`" >> $FILE_NAME
   echo " " >> $FILE_NAME 
done
sed -i '/^$/d' $FILE_NAME 

