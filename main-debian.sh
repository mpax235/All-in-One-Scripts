#!/bin/bash

clear
ver=1.0.3
echo -e "\e[34mAll-in-One Scripts\e[0m"
echo -e "\e[34mMade by mpax235\e[0m"
echo
echo -e "\e[1m--- MAIN MENU ---\e[0m"
echo
echo -e "\e[1m--- MENU ---\e[0m"
echo
echo "(1)  Android All-in-One Script"
echo

read -p "Select a Option from the list with Number: " mode

if [ "$mode" == "1" ]; then
    echo "Android All-in-One Script..."
    cd "Android All-in-One Script"
    ./main.sh
fi
