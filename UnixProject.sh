#!/bin/bash

# Loading Screen Function
displayLoadingScreen() {
clear
echo -e "\e[1;4;100mWelcome to our Unix Project!\e[0m"
echo -e "\e[1;4;100mMade by Leander Almonte, Iulia Apintilioaie & Brian Arnautov\e[0m"
echo
echo -e "\e[0mPlease press any key to proceed with the application...\e[0m"
read -n 1 -s
}

# Main Menu
mainMenu() {
    displayLoadingScreen
    displayingMenu
    mainMenuOption
}

# Displaying Main Menu
displayingMenu() {
clear
echo -e "\033[1;36m\033[4mMain Menu\033[0m"
echo -e "\033[1m1. System Status   \033[0m"
echo -e "\033[1m2. Data Backup    \033[0m"
echo -e "\033[1m3. Manage Networks  \033[0m"
echo -e "\033[1m4. Manage Services  \033[0m"
echo -e "\033[1m5. Manage Users    \033[0m"
echo -e "\033[1m6. Manage Files    \033[0m"
echo -e "\033[0;31m\033[1m7. Exit Application\033[0;31m\033[0m"
}

# Main Menu Options
mainMenuOption() {
    while true; do
        echo
        read -p "Please select a choice from 1-7: " choice
        case $choice in
        1)
            loadingAnimation
            systemStatusSubMenuDisplay
            systemStatusSubMenuOption
            ;;
        2)
            loadingAnimation
            backupDisplay
            backupOperation
            ;;
        3)
            loadingAnimation
            displayingNetworksMenu
            networksMenuOption
            ;;
        4)
            loadingAnimation
            manageServiceMenuDisplay
            manageServiceMenuOption
            ;;
        5)
            loadingAnimation
            displayingUserManagementMenu
            UserManagementMenuOption
            ;;
        6)
            loadingAnimation
            displayingFileManagementMenu
            fileManagementMenuOption
            ;;
        7)
            echo -e "\033[1mThank you for using our computer management program!\033[0m"
            sleep 2
            clear
            exit
            ;;
        *)
            echo -e "\033[0;31m\033[1mInvalid choice. Please try again.\033[0;31m\033[0m"
            sleep 1
            ;;
        esac
    done
}

# Loading Animation Function
loadingAnimation() {
echo -e "\033[1mLoading...\033[0m"
sleep 1
}

systemStatusSubMenuDisplay() {
clear
echo -e "\033[1;34m\033[4mSystem Status\033[0m"
echo -e "\033[1m1. Display memory status\033[0m"
echo -e "\033[1m2. Check the CPU temperature\033[0m"
echo -e "\033[1m3. Manage running processes\033[0m"
echo -e "\033[1;31m4. Back to Main Menu\033[0m"
}

systemStatusSubMenuOption() {
while true; do
        echo
        read -p "Select an option: " option

        case $option in
        1)
            loadingAnimation
            htop
            systemStatusSubMenuDisplay
            systemStatusSubMenuOption
            ;;
        2)
            
            loadingAnimation
	    checkCPUTemp
            read -p "Press any key to return to the System Status menu..." -n 1 -s
            systemStatusSubMenuDisplay
            systemStatusSubMenuOption
            ;;
        3)
	    loadingAnimation
            processManagerDisplay
            read -p "Press any key to return to the System Status menu..." -n 1 -s
            systemStatusSubMenuDisplay
            systemStatusSubMenuOption
            ;;
        4)
            loadingAnimation
            displayingMenu
            mainMenuOption
            ;;
        *)
            echo -e "\033[0;31m\033[1mInvalid choice. Please try again.\033[0;31m\033[0m"
            sleep 1
            ;;
        esac
     done
}

checkCPUTemp() {
    clear
    if ! command -v sensors &>/dev/null; then
        echo
        echo -e "\033[0;31m\033[1mError! 'sensors' utility is not installed. Please install it in order to monitor CPU temperature.\033[0;31m\033[0m"
        return
    fi
    cputemp=$(sensors | awk '/temp1:/ {print $2}' | sed 's/+//;s/°C//')
    if [[ -z "$cputemp" ]]; then
	echo
        echo -e "\033[0;31m\033[1mError! Unable to read CPU temperature.\033[0;31m\033[0m"
        return
    fi
    echo
    echo "CPU Temperature: $cputemp°C"
    tempval=displayLoadingScreen$(printf "%.0f" "$cputemp")
    if [[ $tempval -ge 70 ]]; then
	echo
        echo -e "\033[0;31m\033[1mWARNING!!! YOUR CPU TEMPERATURE IS OVERHEATING!\033[0;31m\033[0m"
        echo -e "\033[0;31m\033[1mThe system will restart in 30 seconds. Press Ctrl+C to cancel.\033[0;31m\033[0m"
        sleep 30
        shutdown -r now
    else
	echo
        echo -e "\033[0;32m\033[1mYour CPU temperature is at a safe level.\033[0m     "
    fi
}
processManagerDisplay() {
clear
echo -e "\033[1;34m\033[4mManage running processes\033[0m"
echo -e "\033[1m1. See Running Tasks\033[0m"
echo -e "\033[1m2. Kill task\033[0m"
}

processManagerOperation() {
while true; do
	echo
        read -p "Select an option: " operation
        case $operation in
            1)
                loadingAnimation
                clear
                ps aux
                read -p "Press any key to return..." -n 1 -s
                clear
           	processManagerDisplay 
                ;;
            2)
                loadingAnimation
                clear
                ps aux
                kill -l
                echo -e "\033[1mEnter the Kill Option number you want to perform:\033[0m"
                read killnum
                echo -e "\033[1mEnter the PID of the task you wish to kill:\033[0m"
                read PID
                kill -$killnum $PID
                read -p "Press any key to return..." -n 1 -s
           	processManagerDisplay 
                ;;
            *)
                echo -e "\033[0;31m\033[1mInvalid choice. Please try again.\033[0;31m\033[0m"
                sleep 1
                ;;
            esac
        done
}

backupDisplay() {
    clear
    echo -e "\033[1;34m\033[4mBackup\033[0m"
    echo -e "\033[1m1. Create a backup\033[0m"
    echo -e "\033[1m2. Show information of the last backup process\033[0m"
    echo -e "\033[1;31m3. Back to Main Menu\033[0m"
}

backupOperation() {
    while true; do
        echo
        read -p "Select an option: " networkChoice
        case $networkChoice in
        1)
           loadingAnimation
           backupCreater
           read -p "Press any key to return to the Backup Menu..." -n 1 -s
           displayingNetworksMenu
           backupOperation
           ;;
        2)
           loadingAnimation
           InfoOfLastBackup
           read -p "Press any key to return to the Backup Menu..." -n 1 -s
           displayingNetworksMenu
           backupOperation
           ;;
        3)  
            displayingMenu
            mainMenuOption
            ;;
        *)
            echo -e "\033[0;31m\033[1mInvalid choice. Please try again.\033[0;31m\033[0m"
            sleep 1
            ;;
        esac
    done
}
backupCreater() {
clear
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
echo "Choose a file to backup (or enter x to exit):"
read filename
        [[ "$filename" == "x" ]] && return
        if [ -e "$filename" ]; then
            break
        else
            echo "File doesn't exist. Please try again."
        fi
    done
echo "Enter the file address you want to backup to (or enter x to exit)"
read address
[[ "$address" == "x" ]] && return

(crontab -l 2>/dev/null; echo "$minute $hour $DOM $month $DOW cp $filename $address") | crontab -

echo "Current crontab: "
crontab -l
ead -p "Press any key to return to the main menu..." -n 1 -s
}

InfoOfLastBackUp() {
clear
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
}
# Display Network Management Menu
displayingNetworksMenu() {
    clear
    echo -e "\033[1;34m\033[4mNetwork Management\033[0m"
    echo -e "\033[1m1. Enable/Disable Network Card\033[0m"
    echo -e "\033[1m2. Set IP address of network card\033[0m"
    echo -e "\033[1m3. Connect to nearby Wi-Fi\033[0m"
    echo -e "\033[1;31m4. Back to Main Menu\033[0m"
}

# Network Menu Options
networksMenuOption() {
    while true; do
        echo
        read -p "Select an option: " networkChoice
        case $networkChoice in
        1)
           loadingAnimation
           listNetworkCards
           handlingNetworkCards
           read -p "Press any key to return to the Network Menu..." -n 1 -s
           displayingNetworksMenu
           networksMenuOption
           ;;
        2)
           loadingAnimation
           listNetworkCards
           setIPofNetworkCard
           read -p "Press any key to return to the Network menu..." -n 1 -s
           displayingNetworksMenu
           networksMenuOption
           ;;
        3) 
           loadingAnimation
           echo "working.."
           read -p "Press any key to return to the Network menu..." -n 1 -s
           displayingNetworksMenu
           networksMenuOption
           ;;
        4)
            displayingMenu
            mainMenuOption
            ;;
        *)
            echo -e "\033[0;31m\033[1mInvalid choice. Please try again.\033[0;31m\033[0m"
            sleep 1
            ;;
        esac
    done
}

listNetworkCards() {

echo "---------------------------------"

echo "Network Card, IP address, Default Gateway: "

for iface in $(ip link show | awk -F': ' '{print $2}' | grep -v lo); do

    ip_address=$(ip addr show $iface | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)

    gateway=$(ip route show dev $iface | grep default | awk '{print $3}')

    if [ -z "$ip_address" ]; then
        continue
    fi

    echo "  Interface: $iface"
    echo "  IP Address: $ip_address"
    if [ -n "$gateway" ]; then
        echo "  Default Gateway: $gateway"
    else
        echo "  No Default Gateway"
    fi
    echo "---------------------------------"
done

}

# Handling Network Cards Function
handlingNetworkCards() {
    clear
    echo "Enter network card name (e.g., eth0, wlan0):"
    read network

    if ip link show "$network" &>/dev/null; then
        echo "Enable or Disable: "
        read handle
        if [[ "$handle" == "Enable" ]]; then
            sudo ip link set "$network" up
            echo "$network has been enabled."
        elif [[ "$handle" == "Disable" ]]; then
            sudo ip link set "$network" down
            echo "$network has been disabled."
        else
            echo "Invalid choice. Please select either 'Enable' or 'Disable'."
        fi
    else
        echo "Invalid Network Card"
    fi
}

setIPofNetworkCard() {
clear
echo "Current valid IP addresses:"
ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | while read -r ip; do
        echo "- $ip"
    done
echo "Enter a valid IP address: "
read ip

regex="^([0-9]{1,3}\.){3}[0-9]{1,3}$"

	if [[ "$ip" =~ $regex ]]; then
		for i in ${ip//./ }; do
			if [[ "${#i}" -gt 1 && "${i:0:1}" == 0 ]]; then
			 echo "Invalid IP Address: Integer may not begin with zero if it has more than one digit"
			 return 1
			 fi
			if [[ "$i" -gt 255 ]]; then
			echo "Invalid IP Address: Integer cannot be greater than 255"
			return 1
			fi
		done
		echo
		echo "List of Network Cards: "

		for interface in $(ip link show | awk -F': ' '{print $2}' | grep -v 'lo'); do
			echo "$interface"
		done

		echo "Enter network card (ethX wlanX): "
		read netCard

		if sudo ifconfig "$netCard" "$ip"; then
                echo "Successfully changed IP Address of $netName to $ip"
	else
	echo "Failed to change IP Address."
        fi
    else
        echo "Invalid IP address format. Please try again."
    fi
}


# Displaying User Management Menu
displayingUserManagementMenu() {
    clear
    echo -e "\033[1;34m\033[4mUser Management\033[0m"
    echo -e "\033[1m1. Add a user  \033[0m"
    echo -e "\033[1m2. Delete a user  \033[0m"
    echo -e "\033[1m3. Give root permission to a user\033[0m"
    echo -e "\033[1m4. Show list of currently connected\033[0m"
    echo -e "\033[1m5. Disconnect a specific remote user\033[0m"
    echo -e "\033[1m6. Change a user's group\033[0m"
    echo -e "\033[1;31m7. Back to Main Menu\033[0m"
}

# User Management Menu Options
UserManagementMenuOption() {
    while true; do
        echo
        read -p "Select an option: " operation
        case $operation in
            1)
            loadingAnimation
            clear
            read -p "Enter a username to add: " username
            read -p "Enter a password for $username: " password
            sudo useradd -m $username && echo "$username:$password" | sudo chpasswd
            if [ $? -eq 0 ]; then
            echo "User $username added successfully!"
            else
            echo "Failed to add user $username. Please try again."
            fi
            read -p "Press any key to return to the User status menu..." -n 1 -s
            displayingUserManagementMenu
            ;;
        2)
            loadingAnimation
            clear
            echo "List of all usernames:"
            cut -d: -f1 /etc/passwd
            echo
            read -p "Enter a username to delete: " username
            sudo userdel -r -f $username
            if [ $? -eq 0 ]; then
            echo "User $username deleted successfully."
            else
            echo "Failed to delete user $username. Please try again."
            fi
            read -p "Press any key to return to the User status menu..." -n 1 -s
            displayingUserManagementMenu
            ;;
	3)  
	    loadingAnimation
	    clear
	    echo "List of all usernames:"
            cut -d: -f1 /etc/passwd
            read -p "Enter the username to give root permission: " username
            sudo usermod -aG sudo $username
            if [ $? -eq 0 ]; then
            echo "Root permissions granted to $username."
            else
            echo "Failed to grant root permissions to $username."
            fi
            read -p "Press any key to return to the User status menu..." -n 1 -s
            displayingUserManagementMenu
            ;;
        4)
            loadingAnimation
            clear
            echo "Currently connected users:"
            who
            read -p "Press any key to return to the User status menu..." -n 1 -s
            displayingUserManagementMenu
            ;;
        
        5)
            loadingAnimation
            clear
            echo "List of all usernames:"
            cut -d: -f1 /etc/passwd
            read -p "Enter the username of the remote user to disconnect: " username
            sudo pkill -KILL -u $username
            if [ $? -eq 0 ]; then
            echo "$username has been disconnected."
            else
            echo "Failed to disconnect $username."
            fi
            read -p "Press any key to return to the User status menu..." -n 1 -s
            displayingUserManagementMenu
            ;;
        
        6)
            loadingAnimation
            clear
            echo "List of all usernames:"
            cut -d: -f1 /etc/passwd
            echo
            read -p "Enter username to list groups: " username
            groups $username
	    echo
            read -p "Enter the new group for $username: " newGroup
            sudo usermod -g $newGroup $username
            if [ $? -eq 0 ]; then
            echo "$username's primary group changed to $newGroup."
            else
            echo "Failed to change $username's primary group."
            fi
            read -p "Press any key to return to the User Management menu..." -n 1 -s
            displayingUserManagementMenu 
            ;;
        7)
            loadingAnimation
            displayingMenu
            mainMenuOption
            ;;
        *)
            echo -e "\033[0;31m\033[1mInvalid choice. Please try again.\033[0;31m\033[0m"
            sleep 1
            ;;
    esac
 done
}


# File Management Menu
displayingFileManagementMenu() {
    clear
    echo -e "\033[1;34m\033[4mFile Management\033[0m"
    echo -e "\033[1m1. Search for a specific file in a user's home directory\033[0m"
    echo -e "\033[1m2. Display the 10 largest files in a user's home directory\033[0m"
    echo -e "\033[1m3. Display the 10 oldest  files in a user's home directory \033[0m"
    echo -e "\033[1m4. Send a file by email\033[0m"
    echo -e "\033[1;31m5. Back to Main Menu\033[0m"

}

# File Management Options
fileManagementMenuOption() {
    while true; do
        echo
        read -p "Select an option: " operation
        case $operation in
            1)
            	 loadingAnimation
	   	 searchUserSpecifiedFile
           	 read -p "Press any key to return to the File Management menu..." -n 1 -s
           	 displayingFileManagementMenu 
                 ;;
            2)
                 loadingAnimation
	   	 display10LargestFiles
           	 read -p "Press any key to return to the File Management menu..." -n 1 -s
                 displayingFileManagementMenu 
                 ;;
            3)
		 loadingAnimation
	   	 display10OldestFiles
           	 read -p "Press any key to return to the File Management menu..." -n 1 -s
           	 displayingFileManagementMenu 
                 ;;
            4)
                 loadingAnimation
	   	 sendEmail
           	 read -p "Press any key to return to the File Management menu..." -n 1 -s
           	 displayingFileManagementMenu 
                ;;
            5)
                displayingMenu
                mainMenuOption
                ;;
            *)
                echo -e "\033[0;31m\033[1mInvalid choice. Please try again.\033[0;31m\033[0m"
                sleep 1
                ;;
        esac
    done
}

searchUserSpecifiedFile() {
clear
echo "List of all usernames:"
cut -d: -f1 /etc/passwd
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
clear
echo -e "\033[1;4m10 Largest Files\033[0m"

du -ah $HOME | sort -rh | head -n 10
}

display10OldestFiles() {
clear
echo -e "\033[1;4m10 Oldest Files\033[0m"
find $HOME -type f -printf '%T+ %p\n' | sort | head -n 10
}

sendEmail() {
clear

regex="^(([-a-zA-Z0-9\!#\$%\&\'*+/=?^_\`{\|}~]+|(\"([][,:;<>\&@a-zA-Z0-9\!#\$%\&\'*+/=?^_\`{\|}~-]|(\\\\[\\ \"]))+\"))\.)*([-a-zA-Z0-9\!#\$%\&\'*+/=?^_\`{\|}~]+|(\"([][,:;<>\&@a-zA-Z0-9\!#\$%\&\'*+/=?^_\`{\|}~-]|(\\\\[\\ \"]))+\"))@\w((-|\w)*\w)*\.(\w((-|\w)*\w)*\.)*\w{2,4}$"

echo "Enter file to send:"
read file

if test -f "$file"; then
	echo "Enter recipient email:"
	read email
		if [[ $email =~ $regex ]]; then
			echo "Enter email subject"
			read subject
			echo "Enter email message"
			read body

			echo "$body" | mail -s "%subject" "$email" -A "$file"
			echo "Email sent successfully"
		else
			echo "Invalid Email"
		fi
else
	echo "Invalid File"
fi
}

# Displaying Manage Services Menu
manageServiceMenuDisplay() {
    clear
    echo -e "\033[1;34m\033[4mManage Services\033[0m"
    echo -e "\033[1m1. Start Service\033[0m"
    echo -e "\033[1m2. Stop Service\033[0m"
    echo -e "\033[1;31m3. Back to Main Menu\033[0m"
}

# Manage Services Menu Options
manageServiceMenuOption() {
    while true; do
        echo
        read -p "Select an option: " serviceChoice
        case $serviceChoice in
        1)
            loadingAnimation
            clear
            echo "Inactive services:"
            systemctl list-units --type=service --state=inactive --no-pager --quiet
            echo "Enter service name to start:"
            read serviceToStart
            sudo systemctl start "$serviceToStart"
            if [ $? -eq 0 ]; then
   	    echo "$serviceToStart has been started."
            else
            echo "Failed to start $serviceToStart."
            fi
            read -p "Press any key to continue..." -n 1
            manageServiceMenuDisplay
            ;;
        2)
            loadingAnimation
            clear
            echo "Active services:"
            systemctl list-units --type=service --state=active --no-pager --quiet
            echo "Enter service name to stop:"
            read serviceToStop
            sudo systemctl stop "$serviceToStop"
            if [ $? -eq 0 ]; then
            echo "$serviceToStop has been stopped."
            else
            echo "Failed to stop $serviceToStop."
            fi
            read -p "Press any key to continue..." -n 1
            manageServiceMenuDisplay
            ;;
        3)
            displayingMenu
            mainMenuOption
            ;;
        *)
            echo -e "\033[0;31m\033[1mInvalid choice. Please try again.\033[0;31m\033[0m"
            sleep 1
            ;;
        esac
    done
}

# Main Program Start
mainMenu 
