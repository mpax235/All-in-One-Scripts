@echo off
cls
color 3
echo mpax235's Android All-in-One Script
echo *** BOOT MENU ***
echo.
echo *** ADB Devices ***
adb devices
echo.
echo *** Fastboot Devices ***
fastboot devices
echo.
echo *** MENU ***
echo.
echo * ADB STUFF *
echo (1)  OS             =   Android
echo (2)  Recovery       =   Android Recovery
echo (3)  fastbootd      =   Android Fastboot            * ONLY FOR ANDROID 10 AND LATER *
echo (4)  Fastboot       =   Fastboot
echo.
echo * FASTBOOT STUFF *
echo (5)  OS2            =   Android
echo (6)  fastbootd2     =   Android Fastboot            * ONLY FOR ANDROID 10 AND LATER *
echo (7)  Fastboot2      =   Fastboot
echo.
echo * OTHER STUFF *
echo (8)  Meta           =   Little Kernel Meta Mode     * ONLY FOR MEDIATEK DEVICES *
echo (9)  Factory        =   Factory Mode                * ONLY FOR MEDIATEK DEVICES *
echo (A)  Preloader      =   Preloader Mode              * ONLY FOR MEDIATEK DEVICES *
echo (B)  Download       =   BootROM Download Mode       * ONLY FOR MEDIATEK DEVICES WITH DL ACCESS *
echo.

set /p mode="Select a Option from the list with Number: "

if "%mode%"=="1" (
    echo Booting into Android...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    adb reboot
    echo You should now boot into Android.
)

if "%mode%"=="2" (
    echo Booting into Android Recovery...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    adb reboot recovery
    echo You should now boot into Android Recovery.
)

if "%mode%"=="3" (
    echo Booting into Android Fastboot...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    adb reboot fastboot
    echo You should now boot into Android Fastboot.
)

if "%mode%"=="4" (
    echo Booting into Fastboot...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    adb reboot bootloader
    echo You should now boot into Fastboot.
)

if "%mode%"=="5" (
    echo Booting into Android...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    fastboot reboot
    echo You should now boot into Android.
)

if "%mode%"=="6" (
    echo Booting into Android Fastboot...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    fastboot reboot fastboot
    echo You should now boot into Android Fastboot.
)

if "%mode%"=="7" (
    echo Booting into Fastboot...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    fastboot reboot bootloader
    echo You should now boot into Fastboot.
)

if "%mode%"=="8" (
    adb shell reboot -p
    echo Please power off the device by holding the Power Button until it turns off.
    echo If you are using ADB, it will power off automatically.
    echo Then disconnect the USB cable if connected and then press ENTER to continue.
    echo Also check Python by running Python, if it says it does not exist, please install it.
    echo After installing or you have Python, install pyserial via "pip install pyserial".
    echo Make sure to also put Python and pyserial into System PATH.
    echo.

    set /p ready="ready? "
    
    echo Meta Mode...
    python meta.py
    cd ..
)

if "%mode%"=="9" (
    adb shell reboot -p
    echo Please power off the device by holding the Power Button until it turns off.
    echo If you are using ADB, it will power off automatically.
    echo Then disconnect the USB cable if connected and then press ENTER to continue.
    echo Also check Python by running Python, if it says it does not exist, please install it.
    echo After installing or you have Python, install pyserial via "pip install pyserial".
    echo Make sure to also put Python and pyserial into System PATH.
    echo.

    set /p ready="ready? "
    
    echo Factory Mode...
    python factory.py
    cd ..
)

if "%mode%"=="A" (
    adb shell reboot -p
    echo Please power off the device by holding the Power Button until it turns off.
    echo If you are using ADB, it will power off automatically.
    echo Then disconnect the USB cable if connected and then press ENTER to continue.
    echo Also check Python by running Python, if it says it does not exist, please install it.
    echo After installing or you have Python, install pyserial via "pip install pyserial".
    echo Make sure to also put Python and pyserial into System PATH.
    echo.

    set /p ready="ready? "
    
    echo Preloader Mode...
    cd preloadermode
    prepare.bat
    cd ..
)

if "%mode%"=="B" (
    adb shell reboot -p
    echo Please power off the device by holding the Power Button until it turns off.
    echo If you are using ADB, it will power off automatically.
    echo Then disconnect the USB cable if connected and then press ENTER to continue.
    echo Also check Python by running Python, if it says it does not exist, please install it.
    echo After installing or you have Python, install pyserial via "pip install pyserial".
    echo Make sure to also put Python and pyserial into System PATH.
    echo.

    set /p ready="ready? "
    
    echo Download Mode...
    cd preloadermode
    prepare.bat
    cd ..
)
