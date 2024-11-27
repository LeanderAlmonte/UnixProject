#!/bin/bash

while [ 1 = 1 ] 
do
echo "Enter a file to view"
read filename
if [ -e $filename ] 
then
break
else
echo "File doesn't exist. Please try again."
fi
done

ls -la $filename >> tempfile.txt

lastBackup=$(awk '{print $6, $7, $8}' tempfile.txt )
echo "$filename was last backed up on $lastBackup"
rm tempfile.txt
