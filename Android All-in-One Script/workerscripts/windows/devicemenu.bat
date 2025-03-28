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

cls
color 3
echo Android All-in-One Script
echo *** DEVICE MENU ***
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
echo * BOOTLOADER STUFF *
echo unlock_bl      =   Attempt to unlock the bootloader
echo lock_bl        =   Lock the bootloader
echo.
echo * SYSTEM STUFF *
echo bootanimation  =   Extract bootanimation.zip from the System if it exists
echo framework      =   Extract the entire Android framework from the System
echo bootaudio      =   Extract bootaudio.mp3 from the System if it exists
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
    echo But you will need to boot into a Live Linux environment to do this.
    echo VM or WSL will not work.
    echo
    echo Once in Linux download the script from GitHub.
    echo and then navigate into the Folder on where the script was installed and then type ./main.sh
    echo and type 3 to get to the Device Menu. From there you can use the unlock_bl function but this time
    echo press enter to continue after following the 2 warnings and MAKE SURE TO SELECT A EXPLOIT FOR YOUR CORRECT DEVICE
    echo OR ELSE IT WILL RESULT IN SOFT-BRICKS.
    echo.
    echo To abort press any key.
    pause
)

if "%device%"=="bootanimation" (
    cd "C:\Users\%USERNAME%\Downloads"
    echo Please plug in your device in the OS.
    adb wait-for-device
    echo Extracting bootanimation.zip...
    adb pull /system/media/bootanimation.zip
    echo Extracted, it will be found in: C:\Users\%USERNAME%\Downloads\bootanimation.zip.
)

if "%device%"=="framework" (
    cd "C:\Users\%USERNAME%\Downloads"
    echo Please plug in your device in the OS.
    adb wait-for-device
    echo Extracting the Android Framework...
    adb pull /system/framework
    echo Extracted, it will be found in: C:\Users\%USERNAME%\Downloads\framework.
)

if "%device%"=="bootaudio" (
    cd "C:\Users\%USERNAME%\Downloads"
    echo Please plug in your device in the OS.
    adb wait-for-device
    echo Extracting bootaudio.mp3...
    adb pull /system/media/bootaudio.mp3
    echo Extracted, it will be found in: C:\Users\%USERNAME%\Downloads\bootaudio.mp3.
)
color 7