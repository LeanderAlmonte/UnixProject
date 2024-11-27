#!/bin/bash

sensors >> sensorfile.txt

cputemp=$(awk 'NR==3 {print $4}' sensorfile.txt)
echo $cputemp >> tempfile.txt
tempval=$(cut -c 2-3 tempfile.txt)
rm tempfile.txt
echo "CPU Temperature: $cputemp"

rm sensorfile.txt

if [ $tempval -ge 70 ]
then
speaker-test -t sine -f 1000 -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f 1000 -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f 1000 -l 1 & sleep .2 && kill -9 $!
echo "WARNING!!! YOUR CPU TEMPERATURE IS OVERHEATING! SCHEDULING SYSTEM SHUT DOWN..."
shutdown -r
else
echo "Your CPU temperature is at a good level"
fi
