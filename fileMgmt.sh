#!/bin/bash

echo "File Management"

select option in "Search For User Specified File" "Display 10 largest files" "Display 10 oldest files" "Send email" "Go back";
do
	case $option in
		"Search For User Specified File")
			echo "Searching"
			;;
		"Display 10 largest files")
			echo "Displaying largest files"
			;;
		"Display 10 oldest files")
			echo "Displaying oldest files"
			;;
		"Send email")
			echo "Sending email"
			;;
		"Go back")
			echo "Going back"
			;;

