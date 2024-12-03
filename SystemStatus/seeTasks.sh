#!/bin/bash

echo "Choose an operation: "

select operation in "See Running Tasks" "See Task Kill Options" "Kill Task" "Exit"

do
	case $operation in
	"See Running Tasks")
	ps aux
	;;
	"See Task Kill Options")
	kill -l
	;;
	"Kill Task")
 	ps aux
  	kill -l
	echo "Enter the Kill Option number you want to perform"
	read killnum
	echo "Enter the PID of the task that you wish to kill"
	read PID
	kill -$killnum $PID
	;;
	"Exit")	
	echo "Exiting..."
	break	
	;;
	*)
	echo "Invalid choice. Please try again."
	;;
	esac
done


