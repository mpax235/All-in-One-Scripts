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
if '%errorlevel%' NEQ '0' (
    echo This script requires Admin permissions. Please reopen Command Prompt as admin
    echo and then execute the script again.
    wait 5
    exit
)
color 3
echo Windows All-in-One Script
echo *** BOOT MENU ***
echo.
echo *** MENU ***
echo.
echo * BATCH STUFF *
echo os             =   Windows
echo recovery       =   Windows Recovery
echo uefisetup      =   UEFI Setup
echo.

set /p mode="Select a Option from the list with all letters lowercase: "

if "%mode%"=="os" (
    echo Make sure to save your work as this will force close everything.
    pause
    echo Booting into Windows in 5 seconds...
    sleep 5
    shutdown /r
)

if "%mode%"=="recovery" (
    echo Make sure to save your work as this will force close everything.
    pause
    echo Booting into Windows Recovery in 5 seconds...
    sleep 5
    shutdown /r /o /f /t 0
)

if "%mode%"=="uefisetup" (
    echo Make sure to save your work as this will force close everything. Just in case it does not hibernate.
    pause
    echo Booting into UEFI Setup in 5 seconds...
    echo After the System shuts off, you can boot the System back up and you'll be in the Setup.
    pause
    sleep 5
    shutdown /h /fw
)
