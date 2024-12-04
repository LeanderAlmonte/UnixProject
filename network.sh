#!/bin/bash

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

handlingNetworkCards() {

echo "List of Network Cards: "

for interface in $(ip link show | awk -F': ' '{print $2}' | grep -v 'lo'); do
    if ip link show "$interface" | grep -q "state UP"; then
        echo "$interface is UP (enabled)"
    else
        echo "$interface is DOWN (disabled)"
    fi
done

echo "Enter network card to enable or disable: "

read network

if ip link show "$network" &/dev/null; then
	if ip link show "$network" | grep -q "state UP"; then
		echo "$network has been disabled. "
		sudo ip link set $network down
	else
		echo "$network has been enabled. "
		sudo ip link set $network up
	fi
else
		echo "Invalid Network Card"
fi
}

setIPofNetworkCard() {
echo "Enter a valid IP address: "

read ip

regex="^([0-9]{1,3}\.){3}[0-9]{1,3}$"

	if [[ "$ip" =~ $regex ]]; then

		for i in ${ip//./ }; do
			[[ "${#i}" -gt 1 && "${i:0:1}" == 0 ]] && { echo "Invalid IP Address: Integer may not begin with zero if it has more than one digit"; return 1; }
			[[ "$i" -gt 255 ]] && { echo "Invalid IP Address: Integer cannot be greater than 255"
		done

		echo ""

		echo "List of Network Cards: "

		for interface in $(ip link show | awk -F': ' '{print $2}' | grep -v 'lo'); do
			echo "$interface"
		done

		echo "Enter network card (ethX wlanX): "
		read netCard

		sudo ifconfig $netCard $ip

		echo "Successfully changed IP Address of $nicName to $ip"
	else
		"Invalid IP address"
	fi
}

connect_to_network() {

    echo "Scanning for wireless networks..."
    nmcli device wifi rescan
    echo
    nmcli -f SSID,SIGNAL,SECURITY device wifi list

    echo "====================================================="

    read -p "Enter the SSID of the network you want to connect to: " ssid
    read -s -p "Enter the password for $ssid (leave empty if open network): " password
    echo

    if [ -z "$password" ]; then
        nmcli device wifi connect "$ssid"
    else
        nmcli device wifi connect "$ssid" password "$password"
    fi

    if [ $? -eq 0 ]; then
        echo "Successfully connected to $ssid."
    else
        echo "Failed to connect to $ssid."
    fi
}

echo "Network"
displayingMenu() {
echo -e "\033[1m1. View list of Network Cards\033[0m"
echo -e "\033[1m2. Enable/Disable network card\033[0m"
echo -e "\033[1m3. Set IP address of network card\033[0m"
echo -e "\033[1m4. Connect to nearby Wi-Fi\033[0m"
echo -e "\033[1m5. Go back\033[0m"
read -p "Please select an option : " option
}
displayingMenu
case $option in
        1)
                listNetworkCards
                ;;
        2)
                handlingNetworkCards
                ;;
        3)
                setIPofNetworkCard
                ;;
        4)
                connectToWifi
                ;;
        5)
                echo "Going back"
		;;
	*)
		echo "Invalid option"
esac
