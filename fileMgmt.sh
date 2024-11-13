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

display10LargestFiles() {
du -ah $HOME | sort -rh | head -n 10
}

display10OldestFiles() {
find -type f -printf '%T+ %p\n' | sort | head -n 10
}




echo "File Management"
displayingMenu() {
echo -e "\033[1m1. Search for specific file in a user's home directory\033[0m"
echo -e "\033[1m2. Display 10 largest files in a user's home directory\033[0m"
echo -e "\033[1m3. Display 10 oldest files in the user's home directory\033[0m"
echo -e "\033[1m4. Send file by email\033[0m"
echo -e "\033[1m5. Go back\033[0m"
read -p "Please select an option : " option
}
displayingMenu
case $option in
	1)
		searchUserSpecifiedFile
		;;
	2)
		display10LargestFiles
		;;
	3)
		display10OldestFiles
		;;
	4)
		echo "Sending email"
		;;
	5)
		echo "Going back"
		;;
	*)
		echo "Invalid option"
		;;
	esac
