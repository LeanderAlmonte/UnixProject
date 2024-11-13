#!/bin/bash

searchUserSpecifiedFile() {
echo "Please enter username: "
read username

if id "$username" &>/dev/null; then
	echo "Please enter file name: "
	read file
	user_home_dir=$(eval echo ~$username)
	user_path="$user_home_dir/$file"
		if [ -f "$user_path" ]; then
			echo "File path found: $user_path"
		else
			echo "Error: File $file does not exist or has not been found in $user_home_dir"
		fi
fi
}




echo "File Management"

select option in "Search For User Specified File" "Display 10 largest files" "Display 10 oldest files" "Send email" "Go back";
do
	case $option in
		"Search For User Specified File")
			searchUserSpecifiedFile
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
		*)
			echo "Invalid option"
			;;
	esac
done
