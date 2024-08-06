#!/bin/bash

clear
echo -e "\e[34mmpax235's Android All-in-One Script\e[0m"
echo -e "\e[1m--- BOOT MENU ---\e[0m"
echo
echo -e "\e[1m--- ADB Devices ---\e[0m"
adb devices
echo
echo -e "\e[1m--- Fastboot Devices ---\e[0m"
fastboot devices
echo
echo -e "\e[1m--- MENU ---\e[0m"
echo "- ADB STUFF -"
echo "(1)  OS             =   Android"
echo "(2)  Recovery       =   Android Recovery"
echo "(3)  fastbootd      =   Android Fastboot            - ONLY FOR ANDROID 10 AND LATER -"
echo "(4)  Fastboot       =   Fastboot"
echo
echo "- FASTBOOT STUFF -"
echo "(5)  OS2            =   Android"
echo "(6)  fastbootd2     =   Android Fastboot            - ONLY FOR ANDROID 10 AND LATER -"
echo "(7)  Fastboot2      =   Fastboot"
echo
echo "- OTHER STUFF -"
echo "(8)  Meta           =   Little Kernel Meta Mode     - ONLY FOR MEDIATEK DEVICES -"
echo "(9)  Factory        =   Factory Mode                - ONLY FOR MEDIATEK DEVICES -"
echo "(A)  Preloader      =   Preloader Mode              - ONLY FOR MEDIATEK DEVICES -"
echo "(B)  Download       =   BootROM Download Mode       - ONLY FOR MEDIATEK DEVICES WITH DL ACCESS -"

read -p "Select a Option from the list with Number: " mode

if [ "$mode" == "1" ]; then
    echo "Booting into Android..."
    echo "-- IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C --"
    sudo adb reboot
    echo "You should now boot into Android."
elif [ "$mode" == "2" ]; then
    echo "Booting into Android Recovery..."
    echo "-- IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C --"
    sudo adb reboot recovery
    echo "You should now boot into Android Recovery."
elif [ "$mode" == "3" ]; then
    echo "Booting into Android Fastboot..."
    echo "-- IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C --"
    sudo adb reboot fastboot
    echo "You should now boot into Android Fastboot."
elif [ "$mode" == "4" ]; then
    echo "Booting into Fastboot..."
    echo "-- IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C --"
    sudo adb reboot bootloader
    echo "You should now boot into Fastboot."
elif [ "$mode" == "5" ]; then
    echo "Booting into Android ..."
    echo "-- IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C --"
    sudo fastboot reboot
    echo "You should now boot into Android."
elif [ "$mode" == "6" ]; then
    echo "Booting into Android Fastboot..."
    echo "-- IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C --"
    sudo fastboot reboot fastboot
    echo "You should now boot into Android Fastboot."
elif [ "$mode" == "7" ]; then
    echo "Booting into Fastboot..."
    echo "-- IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C --"
    sudo fastboot reboot bootloader
    echo "You should now boot into Fastboot."
elif [ "$mode" == "8" ]; then
    adb shell reboot -p
    echo "Please power off the device by holding the Power Button until it turns off."
    echo "If you are using ADB, it will power off automatically."
    echo "Then disconnect the USB cable if connected and then press ENTER to continue."
    echo "Also check Python 3 by running Python3, if it says it does not exist, please install it."
    echo "After installing or you have Python, install pyserial via 'pip3 install pyserial'."
    echo

    read -p "ready? " ready

    echo "Meta Mode..."
    python3 meta.py
    cd ..
elif [ "$mode" == "9" ]; then
    adb shell reboot -p
    echo "Please power off the device by holding the Power Button until it turns off."
    echo "If you are using ADB, it will power off automatically."
    echo "Then disconnect the USB cable if connected and then press ENTER to continue."
    echo "Also check Python 3 by running Python3, if it says it does not exist, please install it."
    echo "After installing or you have Python, install pyserial via 'pip3 install pyserial'."
    echo

    read -p "ready? " ready

    echo "Factory Mode..."
    python3 factory.py
    cd ..
elif [ "$mode" == "A" ]; then
    adb shell reboot -p
    echo "Please power off the device by holding the Power Button until it turns off."
    echo "If you are using ADB, it will power off automatically."
    echo "Then disconnect the USB cable if connected and then press ENTER to continue."
    echo "Also check Python 3 by running Python3, if it says it does not exist, please install it."
    echo "After installing or you have Python, install pyserial via 'pip3 install pyserial'."
    echo

    read -p "ready? " ready

    echo "Preloader Mode..."
    cd "preloadermode"
    ./prepare.sh
    cd ..
elif [ "$mode" == "B" ]; then
    adb shell reboot -p
    echo "Please power off the device by holding the Power Button until it turns off."
    echo "If you are using ADB, it will power off automatically."
    echo "Then disconnect the USB cable if connected and then press ENTER to continue."
    echo "Also check Python 3 by running Python3, if it says it does not exist, please install it."
    echo "After installing or you have Python, install pyserial via 'pip3 install pyserial'."
    echo

    read -p "ready? " ready

    echo "Download Mode..."
    cd "preloadermode"
    ./prepare.sh
    cd ..
fi
