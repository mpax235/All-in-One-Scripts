@echo off
cls
set ver=1.0.1
color 3
echo mpax235's Android All-in-One Script
echo Version %ver%
echo.
echo *** MAIN MENU ***
echo.
echo *** ADB Devices ***
adb devices
echo.
echo *** Fastboot Devices ***
fastboot devices
echo.
echo *** MENU ***
echo.
echo (1)  Boot Menu
echo (2)  Dump Menu
echo.

set /p mode="Select a Option from the list with Number: "

if "%mode%"=="1" (
    echo Boot Menu...
    cd "workerscripts"
    bootmenu.bat
    cd ..
)

if "%mode%"=="2" (
    echo Dump Menu...
    cd "workerscripts"
    dumpmenu.bat
    cd ..
)
