@echo off
cls
color 3
echo mpax235's Android All-in-One Script
echo *** DUMP MENU ***
echo.
echo *** ADB Devices ***
adb devices
echo.
echo *** Fastboot Devices ***
fastboot devices
echo.
echo *** MENU ***
echo.
echo * MEDIATEK STUFF *
echo (1)  brom           =   Dump the SoC's BootROM
echo (2)  preloader      =   Dump the Preloader
echo.

set /p mode="Select a Option from the list with Number: "

if "%mode%"=="1" (
    cd mtkclient
    if not exist "mtkclient\" (
        echo mtkclient not found.
	echo.
    cd ..
	echo Hint: Put the second mtkclient folder inside the first
	echo for the script to read it.
        pause
        exit /b
    )
    cd mtkclient
    python3 mtk.py dumpbrom --filename=mediatek_brom_dump_android_script.bin
)

if "%mode%"=="2" (
    cd mtkclient
    if not exist "mtkclient\" (
        echo mtkclient not found.
	echo.
    cd ..
	echo Hint: Put the second mtkclient folder inside the first
	echo for the script to read it.
        pause
        exit /b
    )
    cd mtkclient
)
