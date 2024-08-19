
#!/bin/bash

clear
echo -e "\e[34mmpax235's Android All-in-One Script\e[0m"
echo -e "\e[1m--- DEVICE MENU ---\e[0m"
echo
echo -e "\e[1m--- ADB Devices ---\e[0m"
adb devices
echo
echo -e "\e[1m--- Fastboot Devices ---\e[0m"
fastboot devices
echo
echo -e "\e[1m--- MENU ---\e[0m"
echo "- BOOTLOADER STUFF -"
echo "unlock_bl      =   Attempt to unlock the bootloader"
echo "lock_bl        =   Lock the bootloader"
echo

read -p "Select a Option from the list with all letters lowercase: " mode

if [ "$mode" == "os" ]; then
    echo "Booting into Android..."
    echo "-- IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C --"
    sudo adb reboot
    echo "You should now boot into Android."
elif [ "$mode" == "recovery" ]; then
    echo "Booting into Android Recovery..."
    echo "-- IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C --"
    sudo adb reboot recovery
    echo "You should now boot into Android Recovery."
elif [ "$mode" == "fastbootd" ]; then
    echo "Booting into Android Fastboot..."
    echo "-- IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C --"
    sudo adb reboot fastboot
    echo "You should now boot into Android Fastboot."
elif [ "$mode" == "fastboot" ]; then
    echo "Booting into Fastboot..."
    echo "-- IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C --"
    sudo adb reboot bootloader
    echo "You should now boot into Fastboot."
elif [ "$mode" == "fel" ]; then
    echo "Attempting to boot into FEL mode..."
    echo "-- IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C --"
    sudo adb reboot efex
    echo "You should now boot into FEL mode."
    echo "The screen will be off while in FEL mode."
    echo "If you see anything on the Screen, this did not work."
    echo "You will have to try again using U-Boot or Volume buttons."
elif [ "$mode" == "odin" ]; then
    echo "Before running, this script will check if you have a Exynos/Qualcomm Samsung device."
    echo "If the script has detected the wrong device, it will refuse to boot it to Odin mode due to it"
    echo "not being a Exynos/Qualcomm Samsung device. (YES, MTK Samsung devices will also be refused)"
    echo

    read -p "ready? " ready

    echo "Odin mode..."
    sudo ./odinmodecheck.sh
elif [ "$mode" == "os2" ]; then
    echo "Booting into Android ..."
    echo "-- IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C --"
    sudo fastboot reboot
    echo "You should now boot into Android."
elif [ "$mode" == "fastbootd2" ]; then
    echo "Booting into Android Fastboot..."
    echo "-- IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C --"
    sudo fastboot reboot fastboot
    echo "You should now boot into Android Fastboot."
elif [ "$mode" == "fastboot2" ]; then
    echo "Booting into Fastboot..."
    echo "-- IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C --"
    sudo fastboot reboot bootloader
    echo "You should now boot into Fastboot."
elif [ "$mode" == "meta" ]; then
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
elif [ "$mode" == "factory" ]; then
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
elif [ "$mode" == "preloader" ]; then
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
    sudo ./prepare.sh
    cd ..
elif [ "$mode" == "dlmode" ]; then
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
    sudo ./prepare.sh
    cd ..
fi
