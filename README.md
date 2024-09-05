# Android All-in-One Script
This is a Android All-in-One Script made by **mpax235**.

### **Made with:**

Windows Batch Language **(Windows Only)**, Python and macOS/Linux Shell Language **(macOS/Linux)**
# Requirements
> Python in System PATH (if on windows)

> **ADB** and **Fastboot**

> **pyserial** in System PATH (if on windows)

> Drivers for **BootROM** and **Secondary Bootloader** (if on windows)

> **Fastboot** Drivers for Device (if on windows)

> (if dumping) **MTKClient** requirements

**Not following these requirements results in the Script not working or have limited capability.**

# Installing the Required Stuff
## Linux
### Debian-based distributions
For Debian-based distributions, use the following commands below:

`sudo apt-get install adb fastboot python3 python3-serial`

Then turn on Developer Options and enable USB Debugging, next plug in your Android device into your Computer.

If you see a prompt then approve it, if there is no prompt then try using `sudo adb kill-server` and `sudo adb devices` after the first command.

For unlocking the bootloader, turn on OEM Unlocking in order to continue.

To make the Dump Menu usable, use the following commands below:

`sudo apt install git libusb-1.0-0 python3-pip libfuse2`

`git clone https://github.com/bkerler/mtkclient`

`sudo mv mtkclient /home/$USER`

`echo $USER (just to confirm it says your user to combine /home/$USER)`

`cd /home/$USER/mtkclient`

`pip3 install -r requirements.txt`

`pip3 install .`

`sudo usermod -a -G plugdev $USER`

`sudo usermod -a -G dialout $USER`

`sudo cp mtkclient/Setup/Linux/*.rules /etc/udev/rules.d`

`sudo udevadm control -R`

Make sure to reboot after adding the User to dialout/plugdev. If the device has a vendor interface of 0xFF (like LG), make sure to add "blacklist qcaux" to "/etc/mobprobe.d/blacklist.conf". 
### Arch-based distributions
For Arch-based distributions, use the following commands below:

`(sudo) pacman -S adb fastboot python python-pyserial`

Then turn on Developer Options and enable USB Debugging, next plug in your Android device into your Computer.

If you see a prompt then approve it, if there is no prompt then try using `(sudo) adb kill-server` and `(sudo) adb devices` after the first command.

For unlocking the bootloader, turn on OEM Unlocking in order to continue.

To make the Dump Menu usable, use the following commands below:

`(sudo) pacman -S python python-pip git libusb fuse2`

`git clone https://github.com/bkerler/mtkclient`

`(sudo) mv mtkclient /home/$USER`

`echo $USER (just to confirm it says your user to combine /home/$USER)`

`cd /home/$USER/mtkclient`

`(sudo) usermod -a -G plugdev $USER`

`(sudo) usermod -a -G dialout $USER`

`(sudo) cp mtkclient/Setup/Linux/*.rules /etc/udev/rules.d`

`(sudo) udevadm control -R`

Make sure to reboot after adding the User to dialout/plugdev. If the device has a vendor interface of 0xFF (like LG), make sure to add "blacklist qcaux" to "/etc/mobprobe.d/blacklist.conf". 
# How to Use
> Download the **zip (not source code)** from the Releases page.

> Next extract the zip and put it in the path you desire.

> After this open Command Prompt and type in `cd "<disk letter here>:\Users\<user here>\<your path here>\Android.All-in-One.Script\Android All-in-One Script"`.

> For macOS/Linux, put it in your **home/<user here>** and then type in `cd "Android.All-in-One.Script/Android All-in-One Script"`.

> If you are using an older version, run chmod +x ./main.sh before running the next command.

> Now startup the script by typing in `main` (windows) or `./main.sh` (linux/macos). You should see the Terminal text color change to blue if successful or no errors.

> To use the options, type the Number or Word corresponding to the Option you want to use like (for example: you would type **os** if you want to reboot to OS or **1** for the Boot Menu).

# Information
> [!NOTE]\
> Some devices dont have or restrict you from entering Factory Mode.
> 
> For example, on `tungsten` (Fire HD 10 2023), if you try entering Factory Mode the device will become stuck on the Amazon logo, after a while the logo will disappear, leaving only the backlight, a while later after the Amazon logo disappears, the device reboots into Normal Mode. This is because of the Tablet having no Factory Mode.

> [!NOTE]\
> Some devices has patched the `dev.write(b'METAMETA')`/`dev.write(b'ADVEMETA')` method, making it boot back to somewhere else instead of Meta Mode.
> 
> For example, on `tungsten` (Fire HD 10 2023), if you try entering Meta Mode the device will instead boot into Normal Mode, however on `trona` (Fire HD 10 2021), the tablet boots into Meta Mode fine expect that it auto-reboots into normal mode after a while being in Meta Mode.

> [!WARNING]\
> Some devices has Download Mode disabled, they do not appear on USB at all while in Download Mode for these devices.
> 
> For example `trona` and 2020 or later Amazon tablets has Download Mode disabled so if you erase `preloader`, the Tablet will hard brick since there is no Download Mode, requiring inexpensive tools to flash the `preloader` back.
>
> A list of devices having Download Mode disabled can be found in the root of the repo with the filename `DLdisabled.md`.
> 
> For these devices there is no known way to dump the BootROM as the dumping BootROM code in `mtkclient` requires you to be in Download Mode.

> [!NOTE]\
> Some devices have bootloader unlocking disabled or have a unlock code needed first.
>
> For example `nash` needs a unlock code obtained by needing a Motorola account and going through the gaining unlock code process.
>
> While `trona` can only be unlocked by flashing a `unlock.bin` to the `unlock` partition with `fastboot flash unlock unlock.bin`, but it has to be encrypted with Amazon's keys, making it very difficult to unlock the bootloader without exploits.
>
> And if you are a Windows user, the bootloader unlock stuff without `oem unlock` or `flashing unlock` can only be possible in Linux so you will have to boot into a Live Linux environment (not VM or WSL) in order to perform this.
# Credits
- [mpax235](https://github.com/mpax235) for creating this Script
- xyz and k4y0z for the script to send magic to the Preloader/BootROM in order to stop the timeout (expect BootROM where the timeout will just be longer), also credit to them for the exploits used to dump the BootROM.
- [mtkclient](https://github.com/bkerler/mtkclient) for the scripts to dump the BootROM
### Contributor Credits
- [wish13yt](https://github.com/wish13yt) for contributing to this project and fixing bugs
