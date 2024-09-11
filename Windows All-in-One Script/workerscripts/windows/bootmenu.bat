@echo off
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
