@echo off
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