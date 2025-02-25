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
echo -e "\e[1m--- DUMP MENU ---\e[0m"
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
