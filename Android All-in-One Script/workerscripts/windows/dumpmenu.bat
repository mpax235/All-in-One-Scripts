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
color 3
echo Android All-in-One Script
echo *** DUMP MENU ***
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
echo * MEDIATEK STUFF *
echo (1)  brom           =   Dump the SoC's BootROM
echo.

set /p mode="Select a Option from the list with Number: "

if "%mode%"=="1" (
    cd ..
    cd mtkclient
    if not exist "mtkclient\" (
        echo mtkclient not found.
	echo.
    cd ..
	echo Hint: Put the second mtkclient folder (if zip) inside the first
	echo for the script to read it.
	echo.
	echo or if you git cloned mtkclient, just put the mtkclient folder
	echo in the mtkclient folder in workerscripts for the script to read it.
        pause
        exit /b
    )
    cd mtkclient
    color 4
    cls
    echo WARNING! THERE IS A POTENTIAL FOR A BSOD CAUSED BY MTKCLIENT DURING THIS PROCESS.
    echo USE AT YOUR OWN RISK.
    echo.
    echo PRESS ENTER TO CONTINUE.
    pause
    color 7
    cls
    python3 mtk.py dumpbrom --filename=mediatek_brom_dump_android_script.bin
)
