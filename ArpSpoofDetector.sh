#! /bin/bash

#Introduction Section

echo "Welcome to ArpSpoofDetector by Serhan Bahar"

echo

sleep 1

echo -e "Please enter your interface name (like: eth0 or wlan0 etc.): \c "

read interface_name

echo

#Find Router's IP Address
routers_ip=$(route -n | awk '{print $2}' | grep -v IP | grep -v Gateway | grep -v 0.0.0.0)

sleep 1

echo "Router's IP		: $routers_ip"

#Find Router's First MAC Address
first_mac_ap=$(arp -a -i $interface_name | grep "_gateway" | awk '$2~/'"$routers_ip"'/ {print ($4)}')

sleep 1

echo "Router's First MAC	: $first_mac_ap"

#Loop Timing
loop_max=500
count=0

while [[ $count -lt $loop_max ]];
do
	
#Checking Router's MAC Address Again

    second_mac_ap=$(arp -a -i $interface_name | grep "_gateway" | awk '$2~/'"$routers_ip"'/ {print ($4)}')

	    if [ "$second_mac_ap" != "$first_mac_ap" ];
            then
		    break
	    fi

	count=$(($count+1));
done

sleep 1

echo "Router's Second MAC	:" $second_mac_ap

sleep 1

echo "Detect Date is		:" $(date)

echo "Router's IP		: $routers_ip" > Results.txt && echo "Router's First MAC	: $first_mac_ap" >> Results.txt && echo "Router's Second MAC	:" $second_mac_ap >> Results.txt && echo "Detect Date is		:" $(date) >> Results.txt

sleep 1

echo

echo "If the router's first MAC is different than second MAC please be careful about mitm attack, your file is ready: Results.txt"




