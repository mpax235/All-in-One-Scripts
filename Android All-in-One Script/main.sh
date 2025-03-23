#!/bin/bash

clear
ver=2.0.0
echo -e "\e[34mAndroid All-in-One Script\e[0m"
echo -e "\e[34mMade by mpax235\e[0m"
echo -e "\e[34mVersion $ver\e[0m"
echo
echo -e "\e[1m--- MAIN MENU ---\e[0m"
echo
echo -e "\e[1m= ADB Devices =================================\e[0m"
echo
adb devices
echo
echo -e "\e[1m= FASTBOOT DEVICES ============================\e[0m"
echo
fastboot devices
echo
echo -e "\e[1m===============================================\e[0m"
echo
echo -e "\e[1m--- MENU ---\e[0m"
echo
echo "(1)  Boot Menu"
echo "(2)  Dump Menu"
echo "(3)  Device Menu"
echo

read -p "Select a Option from the list with Number: " mode

if [ "$mode" == "1" ]; then
    echo "Boot Menu..."
    cd "workerscripts"
    cd "linux"
    ./bootmenu.sh
    cd ..
elif [ "$mode" == "2" ]; then
    echo "Dump Menu..."
    cd "workerscripts"
    cd "linux"
    ./dumpmenu.sh
    cd ..
elif [ "$mode" == "3" ]; then
    echo "Device Menu..."
    cd "workerscripts"
    cd "linux"
    ./devicemenu.sh
    cd ..
fi
