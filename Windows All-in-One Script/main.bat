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
set ver=1.0.0
color 3
echo Windows All-in-One Script
echo Made by mpax235
echo Version %ver%
echo.
echo *** MAIN MENU ***
echo.
echo *** MENU ***
echo.
echo (1)  Boot Menu
echo.

set /p mode="Select a Option from the list with Number: "

if "%mode%"=="1" (
    echo Boot Menu...
    cd "workerscripts"
    cd "windows"
    bootmenu.bat
    cd ..
)