
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
echo -e "\e[1m--- DEVICE MENU ---\e[0m"
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
echo "- BOOTLOADER STUFF -"
echo "unlock_bl      =   Attempt to unlock the bootloader"
echo "lock_bl        =   Lock the bootloader"
echo
echo "- SYSTEM STUFF -"
echo "bootanimation  =   Extract bootanimation.zip from the System if it exists"
echo "framework      =   Extract the entire Android framework from the System"
echo "bootaudio      =   Extract bootaudio.mp3 from the System if it exists"
echo

read -p "Select a Option from the list with all letters lowercase: " mode

if [ "$mode" == "unlock_bl" ]; then
    clear
    echo "Make sure to enable OEM unlocking if theres a switch, otherwise you need to use a exploit."
    read -p "Press enter to continue if you done so " unlock
    adb reboot bootloader
    clear
    echo -e "\e[31mTHIS PROCESS WILL ERASE ALL USERDATA. PLEASE MAKE SURE YOU BACKUP YOUR IMPORTANT DATA"
    echo -e "BEFORE CONTINUING."
    echo
    echo -e "TO CONTINUE, TYPE "YES" IN ALL UPPERCASE LETTERS."
    echo -e "ARE YOU SURE TO UNLOCK THE BOOTLOADER?"
    echo
    read -p "TYPE YES IN ALL CAPS " unlock
    echo
    clear
    echo -e "THIS IS YOUR FINAL WARNING TO BACKUP ANY IMPORTANT USER DATA. CLOSE THE TERMINAL TO CANCEL"
    echo -e "OR PRESS ENTER TO CONTINUE"
    echo
    read -p "PRESS ENTER TO CONTINUE " unlock
    clear
    echo -e "Attempting to unlock the bootloader..."
    echo -e "If the script was able to proceed, press Ctrl+C to cancel and enjoy your unlocked device!"
    echo -e "If you see a prompt, approve the prompt using the instructions on the Device's screen."
    echo -e "Then when it gives the exploit instructions, instead press Ctrl+C and enjoy your unlocked device!"
    echo
    fastboot oem unlock
    fastboot flashing unlock
    echo
    echo -e "The script was not able to unlock the bootloader, you may have to use a exploit."
    echo
    echo -e "MAKE SURE TO SELECT A EXPLOIT FOR YOUR CORRECT DEVICE"
    echo -e "OR ELSE IT WILL RESULT IN SOFT-BRICKS."
    echo
    read -p "Press any key to continue " unlock_alt
    echo
    clear
    sudo ./unlock_alt.sh
elif [ "$mode" == "bootanimation" ]; then
    cd "/home/$USER/"
    echo "Please plug in your device in the OS."
    adb wait-for-device
    echo "Extracting bootanimation.zip..."
    adb pull /system/media/bootanimation.zip
    echo "Extracted, it will be found in: /home/$USER/bootanimation.zip."
elif [ "$mode" == "framework" ]; then
    cd "/home/$USER/"
    echo "Please plug in your device in the OS."
    adb wait-for-device
    echo "Extracting the Android Framework..."
    adb pull /system/framework
    echo "Extracted, it will be found in: /home/$USER/framework/."
elif [ "$mode" == "bootaudio" ]; then
    cd "/home/$USER/"
    echo "Please plug in your device in the OS."
    adb wait-for-device
    echo "Extracting bootaudio.mp3..."
    adb pull /system/media/bootaudio.mp3
    echo "Extracted, it will be found in: /home/$USER/bootaudio.mp3."
fi
