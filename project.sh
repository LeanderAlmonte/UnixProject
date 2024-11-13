#!/bin/bash

echo Unix Project
echo Leander Almonte, Brian Arnautov, Iulia Apintilioaie

echo Computer Management

PS3="Please select the type of operation: "

select option in "System Status" "Backup" "Network" "Services" "User Management" "File Management" "Quit";
do
	case $option in
		"System Status")
			echo "System Status"
			;;
		"Backup")
			echo "Backup"
			;;
		"Network")
			echo "Network"
			;;
		"Services")
			echo "Services"
			;;
		"User Management")
			echo "User Management"
			;;
		"File Management")
			echo "File Management"
			;;
		"Quit")
			echo "Thank you for using the computer management program!"
			break
			;;
		*)
			echo "Invalid option"
			;;
	esac
done
