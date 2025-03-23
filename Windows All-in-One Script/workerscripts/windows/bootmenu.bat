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

set LEGACYBMTIME=0

cls

net session >nul 2>&1
if '%errorlevel%' NEQ '0' (
    echo This script requires Admin permissions. Please reopen Command Prompt as admin
    echo and then execute the script again.
    timeout /t 5 >nul
    exit /b
)
color 3
echo Windows All-in-One Script
echo *** BOOT MENU ***
echo.
echo *** MENU ***
echo.
echo * BOOT STUFF *
echo os             =   Windows
echo recovery       =   Windows Recovery
echo uefisetup      =   UEFI Setup
echo.
echo * BOOTLOADER STUFF *
echo elegacybm       =   Enable Legacy Boot Manager
echo.

set /p mode="Select a Option from the list with all letters lowercase: "

if "%mode%"=="os" (
    echo Make sure to save your work as this will force close everything.
    pause
    echo Booting into Windows in 5 seconds...
    timeout /t 5 >nul
    shutdown /r /f /t 0
)

if "%mode%"=="recovery" (
    echo Make sure to save your work as this will force close everything.
    pause
    echo Booting into Windows Recovery in 5 seconds...
    timeout /t 5 >nul
    shutdown /r /o /f /t 0
)

if "%mode%"=="uefisetup" (
    echo Make sure to save your work as this will force close everything. Just in case it does not hibernate.
    pause
    echo Booting into UEFI Setup in 5 seconds...
    echo After the System shuts off, you can boot the System back up and you'll be in the Setup.
    pause
    timeout /t 5 >nul
    shutdown /h /fw
)

if "%mode%"=="elegacybm" (
    echo =======================================
    echo Configure the Legacy Boot Manager
    echo =======================================
    echo What seconds do you want to wait until Windows boots? (set 0 to remove this, or press enter without typing anything in)

    set /p LEGACYBMTIME="Type in your configuration here: "
    
    bcdedit -set {bootmgr} displaybootmenu yes
    bcdedit -set {bootmgr} timeout %LEGACYBMTIME%

    echo The legacy Windows Boot Manager has been turned on. For the changes to take effect, you need to restart your computer.
    echo Make sure to save your work as this will force close everything.
    pause
    echo Restarting in 5 seconds...
    timeout /t 5 >nul
    shutdown /r /f /t 0
)
color 7