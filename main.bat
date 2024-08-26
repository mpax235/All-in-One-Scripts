@echo off

adb devices >nul 2>&1 && (
    echo found adb
) || (
    echo adb not found, installing
    echo by unpausing you agree to the terms listed on https://developer.android.com/tools/releases/platform-tools.
    pause
    curl -o ./platform-tools.zip "https://dl.google.com/android/repository/platform-tools-latest-windows.zip"
    tar -xf platform-tools.zip
    xcopy platform-tools %chdir% /s /e
    xcopy platform-tools workerscripts /s /e
    del platform-tools.zip
    echo deleting platform-tools folder
    pause
    rmdir platform-tools
)
echo Turning on ADB...

adb devices
cls
set ver=1.0.2
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
echo (3)  Device Menu
echo.

set /p mode="Select a Option from the list with Number: "

if "%mode%"=="1" (
    echo Boot Menu...
    cd "workerscripts"
    cd "windows"
    bootmenu.bat
)

if "%mode%"=="2" (
    echo Dump Menu...
    cd "workerscripts"
    cd "windows"
    dumpmenu.bat
)

if "%mode%"=="3" (
    echo Device Menu...
    cd "workerscripts"
    cd "windows"
    devicemenu.bat
)
