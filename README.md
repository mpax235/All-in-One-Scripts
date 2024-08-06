# Android All-in-One Script
This is a Android All-in-One Script made with Windows Batch language.

# Requirements
> Python in System PATH (if on windows)

> ADB and Fastboot

> pyserial in System PATH (if on windows)

> Drivers for BootROM and Secondary Bootloader (if on windows)

> Fastboot Drivers for Device (if on windows)

> (if dumping) MTKClient requirements

**Not following these requirements results in the Script not working or have limited capability.**

# How to Use
> Download the **zip (not source code)** from the Releases page.

> Next extract the zip and put it in the path you desire.

> After this open Command Prompt and type in `cd "<disk letter here>:\Users\<user here>\<your path here>\Android.All-in-One.Script\Android All-in-One Script"`.

> For macOS/Linux, put it in your **home/<user here>** and then type in `cd "Android.All-in-One.Script/Android All-in-One Script"`.

> Now startup the script by typing in `main` (windows) or `./main.sh` (linux/macos). You should see the Terminal text color change to blue if successful or no errors.

> To use the options, type the Number corresponding to the Option you want to use like (for example: you would type **1** if you want to reboot to OS).

# Credits
- [mpax235](https://github.com/mpax235) for creating this Script
- xyz and k4y0z for the script to send magic to the Preloader/BootROM in order to stop the timeout (expect BootROM where the timeout will just be longer)
- [mtkclient](https://github.com/bkerler/mtkclient) for the scripts to dump the BootROM / Preloader
