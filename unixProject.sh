#!/bin/bash
displayingLoadingScreen() {
echo "Welcome to our Unix Project!"
echo "Made by Leander Almonte, Brian Arnautov & Iulia Apintilioaie"
}
displayingMenu() {
echo -e "\033[1m1. System Status\033[0m"
echo -e "\033[1m2. Backup\033[0m"
echo -e "\033[1m3. Network\033[0m"
echo -e "\033[1m4. Services\033[0m"
echo -e "\033[1m5. User Management\033[0m"
echo -e "\033[1m6. File Management\033[0m"
echo -e "\033[1m7. Quit\033[0m"
read -p "Please select a choice from 1-7: " choice
}
displayingLoadingScreen
displayingMenu
case $choice in
    1)
echo "System Status"
;;
    2)
echo "Backup"
;;
    3)
echo "Network"
;;
    4)
echo "Services"
;;
    5)
echo "User Management"
;;
    6)
echo "File Management"
	./fileMgmt.sh
;;
    7)
echo "Thank you for using our computer management program!"
exit 1
;;
    *)
echo "Invalid option"
;;
esac

