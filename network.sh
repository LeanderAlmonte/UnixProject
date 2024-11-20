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
echo "Enter network card"

read network

if ip link show "$network" &/dev/null; then
	echo "Enable or Disable: "
	read handle
		if [[ "$handle" == "Enable" ]]; then
			sudo ip link set $network up
		else
			sudo ip link set $network down
		fi
else
		echo "Invalid Network Card"
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
                echo "Setting IP address"
                ;;
        4)
                echo "Connecting to Wi-Fi"
                ;;
        5)
                echo "Going back"
		;;
	*)
		echo "Invalid option"
esac
