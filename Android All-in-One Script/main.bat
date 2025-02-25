@echo off
:: MIT License
::
:: Copyright (c) 2025 mpax235
::
:: Permission is hereby granted, free of charge, to any person obtaining a copy
:: of this software and associated documentation files (the "Software"), to deal
:: in the Software without restriction, including without limitation the rights
:: to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
:: copies of the Software, and to permit persons to whom the Software is
:: furnished to do so, subject to the following conditions:
::
:: The above copyright notice and this permission notice shall be included in all
:: copies or substantial portions of the Software.
::
:: THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
:: IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
:: FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
:: AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
:: LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
:: OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
:: SOFTWARE.

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
set ver=1.0.3
color 3
echo Android All-in-One Script
echo Made by mpax235
echo Version %ver%
echo.
echo *** MAIN MENU ***
echo.
echo = ADB Devices =================================
echo.
adb devices
echo.
echo = FASTBOOT DEVICES ============================
echo.
fastboot devices
echo.
echo ===============================================
echo.
echo *** MENU ***
echo.
echo (1)  Boot Menu
echo (2)  Dump Menu
echo (3)  Device Menu
echo (4)  Use GUI version
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

if "%mode%"=="4" (
    echo Starting up the GUI version...
    cd gui
    python main.py
    cd ..
)