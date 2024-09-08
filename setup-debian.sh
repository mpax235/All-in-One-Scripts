echo -e "This will setup the Android All-in-One Script for use."
echo -e "This will also disable SELinux temporarily to make sure nothing goes wrong, and then re-enable it after."
echo -e "SELinux disabling does not happen if SELinux is entirely disabled."
echo
read -p "Press any key to continue... " setup

# install SELinux packages in order to disable SELinux
sudo apt install selinux-utils

# disable SElinux temporarily
sudo setenforce 0

# install the bare packages
sudo apt install python3 python3-serial adb fastboot

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
cd commands
cd start
sudo chmod +x ./prepare.sh
cd ../../../..

# ask user if they want to install mtkclient
read -p "Do you want to install mtkclient to finish the installation? (1 for yes, 0 for no)" mtkclient

if [ "$mtkclient" == "1" ]; then
    echo -e "Coming soon!"
fi

# reenable SElinux
sudo setenforce 1
