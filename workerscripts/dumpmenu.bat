@echo off
cls
color 3
echo mpax235's Android All-in-One Script
echo *** DUMP MENU ***
echo.
echo *** ADB Devices ***
adb devices
echo.
echo *** Fastboot Devices ***
fastboot devices
echo.
echo *** MENU ***
echo.
echo * MEDIATEK STUFF *
echo (1)  brom           =   Dump the SoC's BootROM
echo (2)  preloader      =   Dump the Preloader
echo.

set /p mode="Select a Option from the list with Number: "

if "%mode%"=="1" (
    echo Work in Progress. Come back soon.
)

if "%mode%"=="2" (
    echo Work in Progress. Come back soon.
)
