#!/bin/bash
# MIT License
#
# Copyright (c) 2025 mpax235
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

clear
echo -e "\e[34mAndroid All-in-One Script\e[0m"
echo -e "\e[1m--- BOOT MENU ---\e[0m"
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
echo "- ADB STUFF -"
echo "os             =   Android"
echo "recovery       =   Android Recovery"
echo "fastbootd      =   Android Fastboot            - ONLY FOR ANDROID 10 AND LATER -"
echo "fastboot       =   Fastboot Mode"
echo "fel            =   BootROM FEL Mode            - ONLY FOR ALLWINNER DEVICES -"
echo "odin           =   Odin Mode                   - ONLY FOR SAMSUNG DEVICES WITH QUALCOMM AND EXYNOS -"
echo
echo "- FASTBOOT STUFF -"
echo "os2            =   Android"
echo "fastbootd2     =   Android Fastboot            - ONLY FOR ANDROID 10 AND LATER -"
echo "fastboot2      =   Fastboot Mode"
echo
echo "- OTHER STUFF -"
echo "meta           =   Little Kernel Meta Mode     - ONLY FOR MEDIATEK DEVICES -"
echo "factory        =   Factory Mode                - ONLY FOR MEDIATEK DEVICES -"
echo "preloader      =   Preloader Mode              - ONLY FOR MEDIATEK DEVICES -"
echo "dlmode         =   BootROM Download Mode       - ONLY FOR MEDIATEK DEVICES WITH DL ACCESS -"
echo "advancedmeta   =   Advanced Meta Mode          - ONLY FOR MEDIATEK DEVICES -"

read -p "Select a Option from the list with Number: " mode

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
    echo "Booting into Odin Mode..."
    echo "If you are not using a Exynos/Qualcomm Samsung device,"
    echo "you'll end up in Fastboot mode instead."
    adb reboot bootloader
    echo "You should now boot into Odin Mode."
    echo "If you see a Fastboot screen instead,"
    echo "you dont have a Exynos/Qualcomm Samsung device."
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
    cd ..
    cd "python"
    cd "commands_pl"
    python3 METAMETA.py
    cd ../../..
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
    cd ..
    cd "python"
    cd "commands_pl"
    python3 FACTFACT.py
    cd ../../..
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
    cd ..
    cd "python"
    cd "commands"
    cd "start"
    sudo ./prepare.sh
    cd ../../../..
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
    cd ..
    cd "python"
    cd "commands"
    cd "start"
    sudo ./prepare.sh
    cd ../../../..
elif [ "$mode" == "advancedmeta" ]; then
    adb shell reboot -p
    echo "Please power off the device by holding the Power Button until it turns off."
    echo "If you are using ADB, it will power off automatically."
    echo "Then disconnect the USB cable if connected and then press ENTER to continue."
    echo "Also check Python 3 by running Python3, if it says it does not exist, please install it."
    echo "After installing or you have Python, install pyserial via 'pip3 install pyserial'."
    echo

    read -p "ready? " ready

    echo "Advanced Meta Mode..."
    cd ..
    cd "python"
    cd "commands_pl"
    python3 ADVEMETA.py
    cd ../../..
fi
