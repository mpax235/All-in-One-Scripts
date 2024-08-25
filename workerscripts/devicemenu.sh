
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
echo "- SYSTEM STUFF -"
echo "bootanimation  =   Extract bootanimation.zip from the System"
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
    echo "Please plug in your device in the OS."
    adb wait-for-device
    echo "Extracting bootanimation.zip..."
    adb pull /system/media/bootanimation.zip
    echo "Extracted, it will be found in your current directory of your terminal."
fi
