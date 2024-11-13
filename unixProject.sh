#!/bin/bash
displayingLoadingScreen() {
echo -e "\e[1;4mWelcome to our Unix Project!\e[0m"
echo -e "\e[1;4mMade by Leander Almonte, Brian Arnautov & Iulia Apintilioaie\e[0m"
echo
echo
echo
echo
echo
echo "   Please press any key to proceed with the application..."
read -n 1 -s
}
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
displayingLoadingScreen | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
displayingMenu | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta"
read -p "Please select a choice from 1-7: " choice
{
case $choice in
    1)
echo "System Status"
;;
    2)
echo "Data Backup"
;;
    3)
echo "Manage Network"
;;
    4)
echo "Manage Services"
;;
    5)
echo "Manage Users"
;;
    6)
echo "Manage Files"
;;
    7)
echo "Thank you for using our computer management program!"
break
;;
    *)
echo -e "\033[0;31m\033[1mInvalid option\033[0;31m\033[0m"
;;
esac
}
