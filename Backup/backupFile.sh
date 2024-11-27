#!/bin/bash

echo "Please enter the hour you wish to perform the backup (Enter * for every minute)"
read hour
echo "Please enter the minute you wish to perform the backup (Enter * for every hour)"
read minute
echo "Please enter the day of the month you wish to perform the backup (Enter * for everyday)"
read DOM
echo "Please enter the month you wish to perform the backup (Enter * for every month)"
read month
echo "Please enter the day of the week to perform the backup"
select day in Monday Tuesday Wednesday Thursday Friday Saturday Sunday Everyday
do
case $day in
Monday)
DOW=1
break
;;
Tuesday)
DOW=2
break
;;
Wednesday)
DOW=3
break
;;
Thursday)
DOW=4
break
;;
Friday)
DOW=5
break
;;
Saturday)
DOW=6
break
;;
Sunday)
DOW=0
break
;;
Everyday) 
DOW=*
break
;;
*)
echo "Invalid input. Please try again."
;;
esac
done

while [ 1 = 1 ] 
do
echo "Choose a file to backup"
read filename
if [ -e $filename ] 
then
break
else
echo "File doesn't exist. Please try again."
fi
done

echo "Enter the file address you want to backup to"
read address

(crontab -l 2>/dev/null; echo "$minute $hour $DOM $month $DOW cp $filename $address") | crontab -

echo "Current crontab: "
crontab -l
