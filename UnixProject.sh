#!/bin/bash

# Display the loading screen
displayLoadingScreen() {
clear
echo
echo -e "\e[1;4mWelcome to our Unix Project!\e[0m"
echo -e "\e[1;4mMade by Leander Almonte, Iulia Apintilioaie & Brian Arnautov\e[0m"
echo
echo -e "\e[0mPlease press any key to proceed with the application...\e[0m"
read -n 1 -s
}

# Display the main menu
displayingMenu() {
clear
echo
echo -e "\033[1m 1.   System Status   \033[0m"
echo -e "\033[1m 2.    Data Backup    \033[0m"
echo -e "\033[1m 3.  Manage Networks  \033[0m"
echo -e "\033[1m 4.  Manage Services  \033[0m"
echo -e "\033[1m 5.   Manage Users    \033[0m"
echo -e "\033[1m 6.   Manage Files    \033[0m"
echo -e "\033[0;31m\033[1m             7. Exit Application\033[0;31m\033[0m"
}

# Display the System Status submenu
systemStatusSubMenuDisplay() {
clear
echo
echo -e "\033[1m 1.   Display memory status   \033[0m"
echo -e "\033[1m 2. Check the CPU temperature \033[0m"
echo -e "\033[1m 3. Manage running processes  \033[0m"
echo -e "\033[1m 4.          Go back          \033[0m"
}

# Display the System status Process Manager Menu
processManagerDisplay() {
clear
echo
echo -e "\033[1m 1.   See Running Processes  \033[0m"
echo -e "\033[1m 2. See Process Kill Options \033[0m"
echo -e "\033[1m 3.       Kill Process       \033[0m"
echo -e "\033[1m 4.         Go back          \033[0m"
}
manageServiceMenuDisplay() {
clear
echo
echo -e "\033[1m 1. List all services \033[0m"
echo -e "\033[1m 2.  Start a service  \033[0m"
echo -e "\033[1m 3.  Stop a service   \033[0m"
echo -e "\033[1m 4.      Go back      \033[0m"
}
displayingNetworksMenu() {
clear
echo
echo -e "\033[1m 1.   View list of Network Cards   \033[0m"
echo -e "\033[1m 2.  Enable/Disable network card   \033[0m"
echo -e "\033[1m 3. Set IP address of network card \033[0m"
echo -e "\033[1m 4.     Connect to nearby Wi-Fi    \033[0m"
echo -e "\033[1m 5.             Go back            \033[0m"
}
displayingUserManagementMenu() {
clear
echo
echo -e "\033[1m 1.               Add/Delete a user               \033[0m"
echo -e "\033[1m 2.        Give root permission to a user         \033[0m"
echo -e "\033[1m 3.     Show list of currently connected users    \033[0m"
echo -e "\033[1m 4.       Disconnect a specific remote user       \033[0m"
echo -e "\033[1m 5. Show the list of groups a user is a member of \033[0m"
echo -e "\033[1m 6.             Change a user's group             \033[0m"
echo -e "\033[1m 7.                    Go back                    \033[0m"
}

manageUserStatus() {
clear
echo
echo -e "\033[1m 1.  Add a user   \033[0m"
echo -e "\033[1m 2. Delete a user \033[0m"
echo -e "\033[1m 7.    Go back    \033[0m"
}

displayingFileManagementMenu() {
clear
echo
echo -e "\033[1m 1.  Search for a specific file in a user's home directory  \033[0m"
echo -e "\033[1m 2. Display the 10 largest files in a user's home directory \033[0m"
echo -e "\033[1m 3. Display the 10 oldest  files in a user's home directory \033[0m"
echo -e "\033[1m 4.                   Send a file by email                  \033[0m"
echo -e "\033[1m 5.                         Go back                         \033[0m"
}
fileManagementMenuOption() {
while true; do
echo
read -p "Please select an option: " option
    case $option in
            1)
            	 echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	 sleep 0.5
	   	 searchUserSpecifiedFile
           	 read -p "Press any key to return to the User Management menu..." -n 1 -s
           	 clear
           	 sleep 0.5
           	 echo
           	 displayingFileManagementMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
                ;;
            2)
                
            	 echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	 sleep 0.5
	   	 display10LargestFiles
           	 read -p "Press any key to return to the User Management menu..." -n 1 -s
           	 clear
           	 sleep 0.5
           	 echo
           	 displayingFileManagementMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
                ;;
            3)
                 echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	 sleep 0.5
	   	 display10OldestFiles
           	 read -p "Press any key to return to the User Management menu..." -n 1 -s
           	 clear
           	 sleep 0.5
           	 echo
           	 displayingFileManagementMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
                ;;
            4)
                 echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	 sleep 0.5
	   	 sendEmail | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	 read -p "Press any key to return to the User Management menu..." -n 1 -s
           	 clear
           	 sleep 0.5
           	 echo
           	 displayingFileManagementMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
                ;;
            5)
                return
                ;;
            *)
                
            	echo "Invalid option. Please try again." | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            	sleep 1
            	displayingFileManagementMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
                ;;
        esac
    done
}

manageUserStatusOption() {
while true; do
echo
read -p "Please select an option: " option
case $option in
        1)
            echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            sleep 0.5
            read -p "Enter a username to add: " username
            read -p "Enter a password for $username: " password
            sudo useradd -m $username && echo "$username:$password" | sudo chpasswd
            echo "User $username added successfully!"
            ;;
        2)
            echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            sleep 0.5
            read -p "Enter ausername to delete: " username
            sudo userdel -r $username
            echo "User $username deleted successfully."
            ;;
        *)
            echo "Invalid option. Please try again." | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
	    sleep 1
            manageUserStatus | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            ;;
    esac
    read -p "Press any key to return to the User Management menu..." -n 1 -s
done
}

UserManagementMenuOption() {
while true; do
echo
read -p "Please select an option: " option
    case $option in
            1)
            	 echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	 sleep 0.5
	   	 manageUserStatus | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
                 manageUserStatusOption
           	 read -p "Press any key to return to the User Management menu..." -n 1 -s
           	 clear
           	 sleep 0.5
           	 echo
           	 displayingUserManagementMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
                ;;
            2)
                
            	 echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	 sleep 0.5
	   	 giveRootPermission | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	 read -p "Press any key to return to the User Management menu..." -n 1 -s
           	 clear
           	 sleep 0.5
           	 echo
           	 displayingUserManagementMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
                ;;
            3)
                 echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	 sleep 0.5
	   	 showConnectedUsers | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	 read -p "Press any key to return to the User Management menu..." -n 1 -s
           	 clear
           	 sleep 0.5
           	 echo
           	 displayingUserManagementMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
                ;;
            4)
                 echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	 sleep 0.5
	   	 disconnectRemoteUser | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	 read -p "Press any key to return to the User Management menu..." -n 1 -s
           	 clear
           	 sleep 0.5
           	 echo
           	 displayingUserManagementMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
                ;;
            5)
                
                 echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	 sleep 0.5
	   	 showUserGroups | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	 read -p "Press any key to return to the User Management menu..." -n 1 -s
           	 clear
           	 sleep 0.5
           	 echo
           	 displayingUserManagementMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
                ;;
            6)
                 echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	 sleep 0.5
	   	 changeUserGroup | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	 read -p "Press any key to return to the User Management menu..." -n 1 -s
           	 clear
           	 sleep 0.5
           	 echo
           	 displayingUserManagementMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
                ;;
            7)
                return
                ;;
            *)
                
            	echo "Invalid option. Please try again." | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            	sleep 1
            	displayingUserManagementMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
                ;;
        esac
    done
}

networksMenuOption() {
while true; do
echo
read -p "Please select an option: " option
    case $option in
        1)
            echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            sleep 0.5
	    listNetworkCards 
            read -p "Press any key to return to the System Status menu..." -n 1 -s
            clear
            sleep 0.5
            echo
            displayingNetworksMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            ;;
        2)
	    echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            sleep 0.5
	    handlingNetworkCards 
            read -p "Press any key to return to the System Status menu..." -n 1 -s
            clear
            sleep 0.5
            echo
            displayingNetworksMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            ;;
        3)
            echo "Work in progress..." | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            read -p "Press any key to return to the System Status menu..." -n 1 -s
            clear
            sleep 0.5
            echo
            displayingNetworksMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            ;;
        4)
            echo "Work in progress..." | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            read -p "Press any key to return to the System Status menu..." -n 1 -s
            clear
            sleep 0.5
            echo
            displayingNetworksMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            ;;
        5)
            return
            ;;
        *)
            echo "Invalid option. Please try again."  | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            sleep 1
            displayingNetworksMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            ;;
    esac
done
}
systemStatusSubMenuOption() {
while true; do
        echo
        read -p "Select an option: " option

        case $option in
        1)
            htop
            sleep 0.5
            read -p "Press any key to return to the System Status menu..." -n 1 -s
            ;;
        2)
            
            echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            sleep 0.5
	    checkCPUTemp | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            read -p "Press any key to return to the System Status menu..." -n 1 -s
            clear
            sleep 0.5
            echo
            systemStatusSubMenuDisplay | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            ;;
        3)
	    echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            sleep 0.5
            processManagerDisplay | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            processManagerOperation 
	    clear
            sleep 0.5
            echo
            systemStatusSubMenuDisplay | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            ;;
        4)
            break
            ;;
        *)
            echo "Invalid option. Please try again." | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            sleep 1
            ;;
        esac
     done
}


manageServiceMenuOption() {
while true; do
echo
read -p "Please select an option: " choice
case $choice in
        1)
            # Show all services
            listServices
            ;;
        2)
            # Start a service
            echo "Enter the name of the service to start:"
            read serviceName
            systemctl start "$serviceName" && echo "$serviceName has been started." || echo "Failed to start $serviceName."
            read -p "Press any key to return to the Manage Services menu..." -n 1 -s
            manageServiceMenuDisplay | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            manageServiceMenuOption
            ;;
        3)
            # Stop a service
            echo "Enter the name of the service to stop:"
            read serviceName
            systemctl stop "$serviceName" && echo "$serviceName has been stopped." || echo "Failed to stop $serviceName."
            read -p "Press any key to return to the Manage Services menu..." -n 1 -s
            manageServiceMenuDisplay | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            manageServiceMenuOption
            ;;
        4)
	    return
            ;;
        *)
            echo "Invalid choice. Please try again."
            sleep 1
            manageServiceMenuDisplay | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            manageServiceMenuOption
            ;;
    esac
done
}
listServices() {
    clear
    echo "Listing all available services..."
    systemctl list-units --type=service --all --no-pager
    echo
    read -p "Press any key to return to the Manage Services menu..." -n 1 -s
    manageServiceMenuDisplay | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
    manageServiceMenuOption
}

listNetworkCards() {
    clear
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
    read -p "Press any key to return to the Network Menu..." -n 1 -s
    displayingNetworksMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
}

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
    read -p "Press any key to return to the Network Menu..." -n 1 -s
    displayingNetworksMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
}

giveRootPermission() {
    read -p "Enter the username to give root permission: " username
    sudo usermod -aG sudo $username
    echo "Root permissions granted to $username."
    read -p "Press any key to return to the User Management menu..." -n 1 -s
}

showConnectedUsers() {
    clear
    echo "Currently connected users:"
    who
    read -p "Press any key to return to the User Management menu..." -n 1 -s
}

disconnectRemoteUser() {
    read -p "Enter the username of the remote user to disconnect: " username
    sudo pkill -KILL -u $username
    echo "$username has been disconnected."
    read -p "Press any key to return to the User Management menu..." -n 1 -s
}

showUserGroups() {
    read -p "Enter username to list groups: " username
    groups $username
    read -p "Press any key to return to the User Management menu..." -n 1 -s
}

changeUserGroup() {
    read -p "Enter username to change the group: " username
    read -p "Enter the new group for $username: " newGroup
    sudo usermod -g $newGroup $username
    echo "$username's primary group changed to $newGroup."
    read -p "Press any key to return to the User Management menu..." -n 1 -s
}
# Check CPU temperature
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
    tempval=$(printf "%.0f" "$cputemp")
    if [[ $tempval -ge 70 ]]; then
	echo
        echo -e "\033[0;31m\033[1mWARNING!!! YOUR CPU TEMPERATURE IS OVERHEATING!\033[0;31m\033[0m"
        echo -e "\033[0;31m\033[1mThe system will restart in 30 seconds. Press Ctrl+C to cancel.\033[0;31m\033[0m"
        sleep 30
        shutdown -r now
    else
	echo
        echo -e "\033[0;32m\033[1mYour CPU temperature is at a safe level.\033[0m"
    fi
}

processManagerOperation() {
while true; do
	echo
        read -p "Select an option: " operation
        case $operation in
            1)
                ps aux
                read -p "Press any key to return..." -n 1 -s
                clear
                echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	processManagerDisplay | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
                ;;
            2)
                kill -l
                read -p "Press any key to return..." -n 1 -s
                clear
		echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	processManagerDisplay | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
                ;;
            3)
                echo -e "\033[1mEnter the Kill Option number:\033[0m"
                read killnum
                echo -e "\033[1mEnter the PID of the process to kill:\033[0m"
                read PID
                kill -$killnum $PID
                read -p "Press any key to return..." -n 1 -s
                clear
		echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
           	processManagerDisplay | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
                ;;
            4)
                break
                ;;
            *)
                echo -e "\033[0;31m\033[1mInvalid choice. Please try again.\033[0;31m\033[0m"
                sleep 1
                ;;
            esac
        done
}

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
find $HOME -type f -printf '%T+ %p\n' | sort | head -n 10
}

sendEmail() {

regex="^(([-a-zA-Z0-9\!#\$%\&\'*+/=?^_\`{\|}~]+|(\"([][,:;<>\&@a-zA-Z0-9\!#\$%\&\'*+/=?^_\`{\|}~-]|(\\\\[\\ \"]))+\"))\.)*([-a-zA-Z0-9\!#\$%\&\'*+/=?^_\`{\|}~]+|(\"([][,:;<>\&@a-zA-Z0-9\!#\$%\&\'*+/=?^_\`{\|}~-]|(\\\\[\\ \"]))+\"))@\w((-|\w)*\w)*\.(\w((-|\w)*\w)*\.)*\w{2,4}$"

echo "Enter file to send"
read file

if test -f "$file"; then
	echo "Enter recipient email"
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

# Main program logic
main() {
    while true; do
        displayLoadingScreen | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
        displayingMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
        read -p "Please select a choice from 1-7: " choice
        case $choice in
        1)
            echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            sleep 0.5
            systemStatusSubMenuDisplay | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            systemStatusSubMenuOption
            ;;
        2)
            echo "Data Backup"
            read -p "Press adisplayingFileManagementMenuny key to return to the main menu..." -n 1 -s
            ;;
        3)
            echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            sleep 0.5
            displayingNetworksMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            networksMenuOption
            ;;
        4)
            echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            sleep 0.5
            manageServiceMenuDisplay | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            manageServiceMenuOption
            ;;
        5)
            echo -e "\033[1m Loading...\033[0m" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            sleep 0.5
            displayingUserManagementMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            UserManagementMenuOption
            ;;
        6)
            echo "Manage Files"
            read -p "Press any key to return to the main menu..." -n 1 -s
            displayingFileManagementMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
            fileManagementMenuOption
            ;;
        7)
            echo "Thank you for using our computer management program!"
            break
            ;;
        *)
            echo "Invalid choice. Please select a number between 1 and 7."
            sleep 1
            ;;
        esac
    done
}

main
