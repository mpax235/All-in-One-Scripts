#!/bin/bash

clear
echo -e "\e[34mAndroid All-in-One Script\e[0m"
echo -e "\e[1m--- DUMP MENU ---\e[0m"
echo
echo -e "\e[1m--- ADB Devices ---\e[0m"
adb devices
echo
echo -e "\e[1m--- Fastboot Devices ---\e[0m"
fastboot devices
echo
echo -e "\e[1m--- MENU ---\e[0m"
echo "- MEDIATEK STUFF -"
echo "(1)  brom           =   Dump the SoC's BootROM"
echo

read -p "Select a Option from the list with Number: " mode

if [ "$mode" == "1" ]; then
    echo "To use this option, put the second mtkclient folder (zip) or the entire folder (git clone) inside the mtkclient folder in workerscripts."
    read -p "Press enter to continue..."
    cd ..
    cd "mtkclient"
    cd "mtkclient"
    clear
    sudo python3 mtk.py dumpbrom --filename=mediatek_brom_dump_android_script.bin
fi
