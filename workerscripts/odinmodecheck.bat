@echo off
setlocal enabledelayedexpansion

REM List of supported codenames or substrings
set "supported_substrings=hero star"

REM Get the device product name using adb
for /f "tokens=*" %%i in ('adb shell getprop ro.product.name') do set device_name=%%i

REM Check if the device name contains any of the supported substrings
set "is_supported=false"
for %%s in (%supported_substrings%) do (
    if "!device_name!"=="%%s" (
        set "is_supported=true"
    ) else (
        echo !device_name! | findstr /i "%%s" >nul
        if not errorlevel 1 set "is_supported=true"
    )
)

if "%is_supported%"=="true" (
    echo Booting into Odin Mode...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    adb reboot bootloader
    echo You should now boot into Odin Mode.
) else (
    echo Non-Qualcomm/Exynos Samsung device detected. Refusing to reboot to Odin Mode.
)

endlocal
