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
echo.
echo * BOOTLOADER STUFF *
echo unlock_bl      =   Attempt to unlock the bootloader
echo lock_bl        =   Lock the bootloader
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
)

if "%unlock%"=="YES" (
        cls
        color 4
        echo Attempting to unlock the bootloader...
        echo If the bootloader was able to unlock, press Ctrl+C to stop this and enjoy your unlocked device!
        echo.
        fastboot oem unlock
        fastboot flashing unlock
    )
