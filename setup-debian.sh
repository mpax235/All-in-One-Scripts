echo -e "This will setup the Android All-in-One Script for use."
echo -e "This will also disable SELinux temporarily to make sure nothing goes wrong, and then re-enable it after."
echo -e "SELinux disabling does not happen if SELinux is entirely disabled."
echo -e ""
read -p "Press any key to continue... " setup

# disable SElinux temporarily
sudo setenforce 0

# install the bare packages
sudo apt install python3 python3-serial adb fastboot

# setup ADB and Fastboot


# do the fun stuff like making all .sh files usable without the "Permission denied" errors
sudo chmod +x ./main.sh
cd workerscripts
cd linux
sudo chmod +x ./bootmenu.sh
sudo chmod +x ./devicemenu.sh
sudo chmod +x ./dumpmenu.sh
sudo chmod +x ./unlock_alt.sh
cd ..
cd python
cd magic
sudo chmod +x ./prepare.sh

# reenable SElinux
sudo setenforce 1
