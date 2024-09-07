@echo off
cls
color 3
echo Android All-in-One Script
echo *** BOOT MENU ***
echo.
echo = ADB Devices =================================
echo.
adb devices
echo.
echo = FASTBOOT DEVICES ============================
echo.
fastboot devices
echo.
echo ===============================================
echo.
echo *** MENU ***
echo.
echo * ADB STUFF *
echo os             =   Android
echo recovery       =   Android Recovery
echo fastbootd      =   Android Fastboot            * ONLY FOR ANDROID 10 AND LATER *
echo fastboot       =   Fastboot Mode
echo fel            =   BootROM FEL Mode            * ONLY FOR ALLWINNER DEVICES *
echo odin           =   Odin Mode                   * ONLY FOR SAMSUNG DEVICES WITH QUALCOMM AND EXYNOS *
echo.
echo * FASTBOOT STUFF *
echo os2            =   Android
echo fastbootd2     =   Android Fastboot            * ONLY FOR ANDROID 10 AND LATER *
echo fastboot2      =   Fastboot Mode
echo.
echo * OTHER STUFF *
echo meta           =   Little Kernel Meta Mode     * ONLY FOR MEDIATEK DEVICES *
echo factory        =   Factory Mode                * ONLY FOR MEDIATEK DEVICES *
echo preloader      =   Preloader Mode              * ONLY FOR MEDIATEK DEVICES *
echo dlmode         =   BootROM Download Mode       * ONLY FOR MEDIATEK DEVICES WITH DL ACCESS *
echo advancedmeta   =   Advanced Meta Mode          * ONLY FOR MEDIATEK DEVICES *
echo.

set /p mode="Select a Option from the list with all letters lowercase: "

if "%mode%"=="os" (
    echo Booting into Android...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    adb reboot
    echo You should now boot into Android.
)

if "%mode%"=="recovery" (
    echo Booting into Android Recovery...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    adb reboot recovery
    echo You should now boot into Android Recovery.
)

if "%mode%"=="fastbootd" (
    echo Booting into Android Fastboot...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    adb reboot fastboot
    echo You should now boot into Android Fastboot.
)

if "%mode%"=="fastboot" (
    echo Booting into Fastboot...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    adb reboot bootloader
    echo You should now boot into Fastboot.
)

if "%mode%"=="fel" (
    echo Attempting to boot into FEL mode...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    adb reboot efex
    echo You should now boot into FEL mode.
    echo The screen will be off while in FEL mode.
    echo If you see anything on the Screen, this did not work.
    echo You will have to try again using U-Boot or Volume buttons.
)

if "%mode%"=="odin" (
    echo Booting into Odin Mode...
    echo If you are not using a Exynos/Qualcomm Samsung device,
    echo you'll end up in Fastboot mode instead.
    adb reboot bootloader
    echo You should now boot into Odin Mode.
    echo If you see a Fastboot screen instead,
    echo you dont have a Exynos/Qualcomm Samsung device.
)

if "%mode%"=="os2" (
    echo Booting into Android...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    fastboot reboot
    echo You should now boot into Android.
)

if "%mode%"=="fastbootd2" (
    echo Booting into Android Fastboot...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    fastboot reboot fastboot
    echo You should now boot into Android Fastboot.
)

if "%mode%"=="fastboot2" (
    echo Booting into Fastboot...
    echo ** IF THE SCRIPT GETS STUCK EXIT WITH CTRL+C **
    fastboot reboot bootloader
    echo You should now boot into Fastboot.
)

if "%mode%"=="meta" (
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
    cd ..
    cd "python"
    cd "bootbytes"
    python metamode.py
    cd ../../..
)

if "%mode%"=="factory" (
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
    cd ..
    cd "python"
    cd "bootbytes"
    python factory.py
    cd ../../..
)

if "%mode%"=="preloader" (
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
    cd ..
    cd "python"
    cd "magic"
    prepare.bat
    cd ../../..
)

if "%mode%"=="dlmode" (
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
    cd ..
    cd "python"
    cd "magic"
    prepare.bat
    cd ../../..
)

if "%mode%"=="advancedmeta" (
    adb shell reboot -p
    echo Please power off the device by holding the Power Button until it turns off.
    echo If you are using ADB, it will power off automatically.
    echo Then disconnect the USB cable if connected and then press ENTER to continue.
    echo Also check Python by running Python, if it says it does not exist, please install it.
    echo After installing or you have Python, install pyserial via "pip install pyserial".
    echo Make sure to also put Python and pyserial into System PATH.
    echo.

    set /p ready="ready? "
    
    echo Advanced Meta Mode...
    cd ..
    cd "python"
    cd "bootbytes"
    python advancedmetamode.py
    cd ../../..
)
