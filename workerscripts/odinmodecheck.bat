@echo off
color 3
for /f "tokens=*" %%i in ('adb shell getprop ro.product.name') do set device_name=%%i

if "%device_name%"=="odin" (
    echo Booting into Odin Mode...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    adb reboot bootloader
    echo You should now boot into Odin Mode.
) else (
    echo Non-qualcomm/exynos Samsung device detected. Refusing to reboot to Odin mode.
    exit
)
