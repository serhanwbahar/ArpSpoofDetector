# ArpSpoofDetector

ArpSpoofDetector is a simple bash script that helps you detect ARP spoofing attacks on your network. The script checks the MAC address of your router multiple times and compares it to detect any changes. If a change is detected, it could be a sign of a man-in-the-middle (MITM) attack.

## Prerequisites

- Linux system with a Bash shell
- Root or sudo privileges

## Usage

1. Clone this repository or download the `ArpSpoofDetector.sh` script to your local machine.
2. Make the script executable using the following command:

```
chmod +x ArpSpoofDetector.sh
```

3. Run the script with root or sudo privileges and provide the interface name as an argument:

```
sudo ./ArpSpoofDetector.sh <interface_name>
```

Replace `<interface_name>` with the name of your network interface, such as `eth0` or `wlan0`.

Example:
```
sudo ./ArpSpoofDetector.sh eth0
```

The script will display the results in the terminal and save them to a `Results.txt` file. If the router's first MAC is different from the second MAC, be cautious about a possible MITM attack.

## How It Works

The script performs the following steps:

1. Get the router's IP address from the routing table.
2. Get the router's MAC address using the ARP table.
3. Loop for a specified number of times (default: 500) and check the router's MAC address again.
4. If the MAC address changes during the loop, the script detects a potential MITM attack.
5. Display the results and save them to a Results.txt file.

## Note

This script is intended for educational and test purposes and should be used at your own risk. The detection of ARP spoofing attacks might not be perfect, and false positives or false negatives may occur.
