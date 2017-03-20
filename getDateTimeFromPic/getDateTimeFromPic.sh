#!/bin/bash
find $1 -iname '*jpg' | while read PIC; do
  DATE=$(exiftool -p '$DateTimeOriginal' $PIC  | awk '{split($0,array,":")} END{print array[1]"_"array[2]"_"array[3]}')
  #echo $array
  echo $PIC
#  basename $PIC
#  dirname $PIC
  echo $DATE

#sed 's/[: ]//g')
#touch -t $(echo $DATE | sed 's/\(..$\)/\.\1/') $PIC
#mv -i $PIC $(dirname $PIC)/$DATE.jpg
done
