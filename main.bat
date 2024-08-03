@echo off
cls
set ver=8/03/2024 at 12:23 AM UTC
color 3
echo mpax235's Android All-in-One Script
echo %ver%
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
echo Boot Menu
echo.

set /p mode="Select a Option from the list: "

if "%mode%"=="Boot Menu" (
    echo Boot Menu...
    cd "workerscripts"
    bootmenu.bat
    cd ..
)
