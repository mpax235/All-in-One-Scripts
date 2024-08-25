@echo off
cls
color 3
echo mpax235's Android All-in-One Script
echo *** DEVICE MENU ***
echo.
echo *** ADB Devices ***
adb devices
echo.
echo *** Fastboot Devices ***
fastboot devices
echo.
echo *** MENU ***
echo * BOOTLOADER STUFF *
echo unlock_bl      =   Attempt to unlock the bootloader
echo lock_bl        =   Lock the bootloader
echo.
echo * SYSTEM STUFF *
echo bootanimation  =   Extract bootanimation.zip from the System
echo framework      =   Extract the entire Android framework from the System
echo.

set /p device="Select a Option from the list with all letters lowercase: "

if "%device%"=="unlock_bl" (
    adb reboot bootloader
    cls
    color 4
    echo THIS PROCESS WILL ERASE ALL USERDATA. PLEASE MAKE SURE YOU BACKUP YOUR IMPORTANT DATA
    echo BEFORE CONTINUING.
    echo.
    echo TO CONTINUE, TYPE "YES" IN ALL UPPERCASE LETTERS.
    echo ARE YOU SURE TO UNLOCK THE BOOTLOADER?
    echo.
    set /p unlock="TYPE YES IN ALL CAPS "
    echo.
    cls
    echo THIS IS YOUR FINAL WARNING TO BACKUP ANY IMPORTANT USER DATA. CLOSE THE TERMINAL TO CANCEL
    echo OR PRESS ENTER TO CONTINUE
    echo.
    set /p unlock="PRESS ENTER TO CONTINUE "
    cls
    echo Attempting to unlock the bootloader...
    echo If the script was able to proceed, press Ctrl+C to cancel and enjoy your unlocked device!
    echo If you see a prompt, approve the prompt using the instructions on the Device's screen.
    echo Then when it gives the exploit instructions, instead press Ctrl+C and enjoy your unlocked device!
    echo.
    fastboot oem unlock
    fastboot flashing unlock
    echo.
    echo The script was not able to unlock the bootloader, you may have to use a exploit.
    echo But you will need to boot into a Live Linux environment (no WSL or VM) to do this.
    echo
    echo Once in Linux download the script from "https://github.com/mpax235/Android-All-in-One-Script/releases"
    echo and then navigate into the Folder on where the script was installed and then type ./main.sh
    echo and type 3 to get to the Device Menu. From there you can use the unlock_bl function but this time
    echo press enter to continue after following the 2 warnings and MAKE SURE TO SELECT A EXPLOIT FOR YOUR CORRECT DEVICE
    echo OR ELSE IT WILL RESULT IN SOFT-BRICKS.
    echo.
    echo To abort press any key.
    pause
)

if "%device%"=="bootanimation" (
    echo Please plug in your device in the OS.
    adb wait-for-device
    echo Extracting bootanimation.zip...
    adb pull /system/media/bootanimation.zip
    echo Extracted, it will be found in your current directory of your terminal.
)

if "%device%"=="framework" (
    echo Please plug in your device in the OS.
    adb wait-for-device
    echo Extracting the Android Framework...
    adb pull /system/framework
    echo Extracted, it will be found in your current directory of your terminal.
)