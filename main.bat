@echo off
cls
color 3
echo All-in-One Scripts
echo Made by mpax235
echo.
echo *** MAIN MENU ***
echo.
echo *** MENU ***
echo.
echo (1)  Android All-in-One Script
echo (2)  Windows All-in-One Script
echo.

set /p mode="Select a Option from the list with Number: "

if "%mode%"=="1" (
    echo Android All-in-One Script...
    cd "Android All-in-One Script"
    main.bat
)

if "%mode%"=="1" (
    echo Windows All-in-One Script...
    cd "Windows All-in-One Script"
    main.bat
)